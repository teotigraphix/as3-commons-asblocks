package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.IASWriter;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.Set;
import org.as3commons.collections.framework.IIterator;
import org.flexunit.Assert;

public class CodeMirror
{
	/**
	 * Serialises the given compilation unit to a string, parses it back
	 * to a second compilation unit, and serialises that to a second string,
	 * finally asserting that the first string and the second string of
	 * source code are the same.
	 */
	public static function assertReflection(fact:ASFactory, 
											unit:IASCompilationUnit):IASCompilationUnit
	{
		var ast:LinkedListTree = ASTScriptElement(unit).getAST();
		saintyCheckTokenStream(ast);
		saintyCheckStartStopTokens(ast);
		assertTokenStreamNotDisjoint(ast);
		var out:StringWriter = new StringWriter();
		var writer:IASWriter = fact.newWriter(); 
		try {
			writer.write(out, unit);
		} catch (e:Error) {
			throw new Error(e);
		}
		try {
			var unit2:IASCompilationUnit = fact.newParser().parse(out.toString());
			var ast2:LinkedListTree = ASTScriptElement(unit2).getAST();
			assertASTMatch(ast, ast2);
			var out2:StringWriter = new StringWriter();
			try {
				writer.write(out2, unit2);
			} catch (e:Error) {
				throw new Error(e);
			}
			Assert.assertEquals(out.toString(), out2.toString());
			return unit2;
		} catch (e1:ASBlocksSyntaxError) {
			Assert.fail(e1.message + "\n" + out.toString());
			return null; // never reached
		}
		return null;
	}

	public static function assertTokenStreamNotDisjoint(ast:LinkedListTree):Set
	{
		// 1) grab all tokens from start to stop token
		// 2) loop through each token and do the same thing
		// 3) test the parent list of tokens contains all of the child tokens
		var tokensFromStartToStop:Set = tokenStreamToSet(ast);
		for (var i:int = 0; i < ast.childCount; i++)
		{
			var child:LinkedListTree = LinkedListTree(ast.getChild(i));
			var childTokens:Set = assertTokenStreamNotDisjoint(child);
			Assert.assertTrue("['" + child + "':" + ASTUtils.tokenNameFromAST(child) + "] (child " + i + " of '" + ast + 
				"') had a token stream disjoint with its parent [" + ast + "]",
				containsAll(tokensFromStartToStop, childTokens));
		}
		return tokensFromStartToStop;
	}
	
	// Returns true if parentTokens set contains all of the elements of the childTokens collection. 
	// If the childTokens collection is also a set
	private static function containsAll(parentTokens:Set, childTokens:Set):Boolean
	{
		var i:IIterator = childTokens.iterator();
		while (i.hasNext())
		{
			var n:LinkedListToken = i.next();
			if (!parentTokens.has(n))
				return false;
		}
		return true;
	}
	
	private static function tokenStreamToSet(ast:LinkedListTree):Set
	{
		var tokens:Set = new Set();
		for (var tok:LinkedListToken = ast.getStartToken(); tok!=null;)
		{
			tokens.add(tok);
			if (tok == ast.getStopToken()) 
				break;
			tok = tok.getNext();
		}
		return tokens;
	}
	
	public static function assertASTMatch(ast1:LinkedListTree, 
										  ast2:LinkedListTree):void
	{
		var path:String = pathTo(ast1);
		ASTUtils.assertAS3TokenTypeIs(ast1.type, ast2.type, "At " + path);
		if (ast1.type == AS3Parser.IDENT)
		{
			Assert.assertEquals("At " + path, ast1.text, ast2.text);
		}
		Assert.assertEquals("At " + path + " child count mismatch: "+stringifyFirstLevel(ast1) +
			" vs. " + stringifyFirstLevel(ast2), ast1.childCount, ast2.childCount);
		
		for (var i:int = 0; i < ast1.childCount; i++)
		{
			assertASTMatch(LinkedListTree(ast1.getChild(i)),
			               LinkedListTree(ast2.getChild(i)));
		}
	}

	private static function pathTo(ast:LinkedListTree):String
	{
		var buff:String = "";
		while (ast != null)
		{
			buff =  ast + buff;
			ast = LinkedListTree(ast.parent);
			if (ast != null)
			{
				buff =  "/" + buff;
			}
		}
		return buff;
	}

	private static function stringifyFirstLevel(ast:LinkedListTree):String
	{
		var buf:String =  "(";
		for (var i:int = 0; i < ast.childCount; i++)
		{
			if (i > 0)
			{
				buf += " ";
			}
			buf += ast.getChild(i);
		}
		buf += ")";
		return buf;
	}

	/**
	 * Search through the stream for tokens who's 'prev' property doesn't
	 * match the token who's 'last' property we just dereferenced in
	 * the last iteration.
	 * i.e. checks that when prev.next==next, then next.prev==prev too.
	 */
	private static function saintyCheckTokenStream(ast:LinkedListTree):void
	{
		var last:LinkedListToken = null;
		for (var tok:LinkedListToken=ast.getStartToken(); tok!=null; tok=tok.getNext())
		{
			if (last != null && last != tok.getPrev())
			{
				Assert.fail("last["+last+"].next=>["+tok+"] but next.prev=>["+tok.getPrev()+"]");
			}
			last = tok;
		}
	}
	
	private static function saintyCheckStartStopTokens(ast:LinkedListTree):void
	{
		assertStopNotBeforeStart(ast);
		var i:ASTIterator = new ASTIterator(ast);
		while (i.hasNext())
		{
			saintyCheckStartStopTokens(i.next());
		}
	}
	
	private static function assertStopNotBeforeStart(ast:LinkedListTree):void
	{
		var start:LinkedListToken = ast.getStartToken();
		var stop:LinkedListToken = ast.getStopToken();
		if (stop == start) return;
		for (var tok:LinkedListToken=stop; tok!=null; tok=tok.getNext())
		{
			Assert.assertFalse("Found stopToken preceeding startToken: "+ast+"("+start+" - "+stop+")",
			                   tok==start);
		}
	}
}
}