////////////////////////////////////////////////////////////////////////////////
// Copyright 2011 Michael Schmalle - Teoti Graphix, LLC
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package org.as3commons.asblocks.impl
{

import org.antlr.runtime.ANTLRFileStream;
import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.MismatchedTokenException;
import org.antlr.runtime.NoViableAltException;
import org.antlr.runtime.RecognitionException;
import org.antlr.runtime.TokenConstants;
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IFile;
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.as3commons.asblocks.parser.antlr.as3.AS3Lexer;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.StringBuffer;

public class ASTUtils
{
	public static var TREE_ADAPTOR:LinkedListTreeAdaptor = 
		new LinkedListTreeAdaptor(new ParentheticUpdateFactory());
	
	private static var parser:AS3Parser = new AS3Parser(null);
	
	private static var lexer:AS3Lexer = new AS3Lexer(null);
	
	/**
	 * Stringifies the given IDENT node.
	 */
	public static function iText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.TYPE_SPEC)
		{
			throw new IllegalArgumentError(
					"expected TYPE_SPEC, but token was a " + tokenNameFromAST(ast));
		}

		if (ast.childCount == 1)
			return ast.getFirstChild().getText();

		return stringifyIAux(ast);
	}
	
	private static function stringifyIAux(ast:LinkedListTree):String
	{
		var result:StringBuffer = new StringBuffer();
		for (var i:ASTIterator = new ASTIterator(ast); i.hasNext();)
		{
			var child:LinkedListTree = i.next();

			if (child.type == AS3Parser.DBL_COLON)
			{
				result.append(child.getFirstChild());
				result.append("::");
				result.append(child.getLastChild());
			}

			result.append(child);
			if (i.hasNext())
				result.append(".");
		}

		return result.toString();
	}
	
	/**
	 * Stringifies the given TYPE node.
	 */
	public static function typeText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.TYPE)
		{
			throw new IllegalArgumentError(
					"expected TYPE, but token was a " + tokenNameFromAST(ast));
		}

		if (ast.childCount == 2
				&& ast.getChild(1).type == AS3Parser.TYPE_POSTFIX)
		{
			// Vector
			var ident:String = ast.getChild(0).text;
			ident += postFixText(LinkedListTree(ast.getChild(1)));
			return ident;
		}

		var child:LinkedListTree = LinkedListTree(ast.getChild(0));

		if (child.type == AS3Parser.IDENT)
			return stringifyIAux(ast);

		// handle e.g. "void", "*"
		return child.getText();
	}

	/**
	 * Stringifies the given IDENTIFIER node.
	 */
	public static function identText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.IDENT)
		{
			throw new IllegalArgumentError(
					"expected IDENT, but token was a " + tokenNameFromAST(ast));
		}
		return ast.getText();
	}
	private static function stringifyIdentAux(ast:LinkedListTree):String
	{
		var result:StringBuffer = new StringBuffer();
		if (ast.type == AS3Parser.DBL_COLON)
		{
			result.append(ast.getFirstChild());
			result.append("::");
			result.append(ast.getLastChild());
		} 
		else if (ast.type == AS3Parser.TYPE
		           || ast.type == AS3Parser.DOT)
		{
			result.append(stringifyIdentAux(ast.getFirstChild()));
			result.append(".");
			result.append(stringifyIdentAux(ast.getLastChild()));
		} 
		else
		{
			result.append(ast.text);
		}
		return result.toString();
	}
	
	public static function qualifiedIdentText(ast:LinkedListTree):String
	{
		if (ast.type == AS3Parser.DBL_COLON)
		{
			return ast.getFirstChild() + "::" + ast.getLastChild();
		}
		return ast.getText();
	}

	public static function importText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.IMPORT)
		{
			throw new IllegalArgumentError(
					"expected IMPORT, but token was a " + tokenNameFromAST(ast));
		}
		var child:LinkedListTree = ast.getFirstChild();
		var result:StringBuffer = new StringBuffer();
		for (var i:int = 0; i < child.childCount; i++)
		{
			var part:LinkedListTree = LinkedListTree(child.getChild(i));
			if (result.toString().length > 0)
			{
				result.append(".");
			}
			result.append(part.getText());
		}
		var star:LinkedListTree = LinkedListTree(ast.getChild(1));
		if (star != null)
		{
			result.append(".");
			result.append("*");
		}
		return result.toString();
	}
	
	/**
	 * Stringifies the type name from the given TYPE_SPEC node.
	 */
	public static function typeSpecText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.TYPE_SPEC)
		{
			throw new IllegalArgumentError(
					"expected TYPE_SPEC, but token was a " + tokenNameFromAST(ast));
		}

		if (ast.childCount == 2
				&& ast.getChild(1).type == AS3Parser.TYPE_POSTFIX)
		{
			// Vector
			var ident:String = ast.getChild(0).text;
			ident += postFixText(LinkedListTree(ast.getChild(1)));
			return ident;
		}

		// first child is now TYPE
		// this will eventually have to accommodate the postfix expression
		var type:LinkedListTree = ast.getFirstChild();
		if (type.type == AS3Parser.TYPE)
			return typeText(type); // pass the TYPE_SPEC

		// handle e.g. "void",
		return type.getText();
	}

	private static function postFixText(ast:LinkedListTree):String
	{
		if (ast.type != AS3Parser.TYPE_POSTFIX)
		{
			throw new IllegalArgumentError(
					"expected TYPE_POSTFIX, but token was a " + tokenNameFromAST(ast));
		}

		var ident:String = "";
		var child:LinkedListTree = LinkedListTree(ast.getChild(0));
		var post:LinkedListTree = LinkedListTree(ast.getChild(1));
		ident += ".<";
		if (child.type == AS3Parser.IDENT)
		{
			ident += stringifyIdentAux(child);
		}

		if (post != null && post.type == AS3Parser.TYPE_POSTFIX)
		{
			ident += postFixText(post);
		}

		ident += ">";

		return ident;
	}
		
	/**
	 * Helper for constructing error messages
	 */
	public static function tokenNameFromAST(ast:LinkedListTree):String
	{
		return tokenName(ast.type);
	}
	
	/**
	 * Helper for constructing error messages
	 */
	public static function tokenName(type:int):String
	{
		if (type == -1)
			return "<EOF>";
		
		return AS3Parser.tokenNames[type];
	}
	
	private static function tokenNameFromParser(parser:AS3Parser, type:int):String
	{
		if (type == -1)
			return "<end-of-file>";
		
		return parser.tokenNames[type];
	}
	
	/**
	 * Returns the first child of the given AST node which has the given
	 * type, or null, if no such node exists.
	 */
	public static function findChildByType(ast:LinkedListTree, type:int):LinkedListTree
	{
		return LinkedListTree(ast.getFirstChildWithType(type));
	}
	
	/**
	 * Returns an ActionScript3 parser which will recognise input from the
	 * given reader.
	 */
	public static function parse(str:String):AS3Parser
	{
		var cs:ANTLRStringStream;
		try {
			cs = new ANTLRStringStream(str);
		} catch (e:Error) {
			throw new Error(e);
		}
		
		lexer.charStream = cs;
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var tokenStream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		parser.tokenStream = tokenStream;
		
		parser.setInput(lexer, cs);
		parser.treeAdaptor = TREE_ADAPTOR;
		return parser;
	}
	
	public static function parseFile(file:IFile):AS3Parser
	{
		var cs:ANTLRFileStream;
		var f:* = file.getFile();
		try {
			cs = new ANTLRFileStream(f);
		} catch (e:Error) {
			throw new Error(e);
		}
		
		lexer.charStream = cs;
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var tokenStream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		parser.tokenStream = tokenStream;
		
		parser.setInput(lexer, cs);
		parser.treeAdaptor = TREE_ADAPTOR;
		return parser;
	}	
	
	// make StringReader parse IReader
	
	public static function buildSyntaxException(statement:String,
												parser:AS3Parser,
												e:RecognitionException):ASBlocksSyntaxError
	{
		var msg:String;
		if (e is NoViableAltException) {
			var ex:NoViableAltException = NoViableAltException(e);
			msg = "Unexpected token "+ tokenNameFromParser(parser, ex.unexpectedType);
			if (statement != null)
			{
				msg += " in " + ASTUtils.str(statement);
			}
		}
		else if (e is MismatchedTokenException)
		{
			var exp:MismatchedTokenException = MismatchedTokenException(e);
			msg = "Unexpected token " + tokenNameFromParser(parser, exp.unexpectedType) + 
				" (expecting " + tokenNameFromParser(parser, exp.expecting)+")";
			if (statement != null)
			{
				msg += " in " + ASTUtils.str(statement);
			}
		}
		else
		{
			if (statement == null)
			{
				msg = "";
			}
			else
			{
				msg = "Problem parsing "+ ASTUtils.str(statement);
			}
		}
		msg += " at line " + e.line;
		return new ASBlocksSyntaxError(msg, e);
	}	
	
	/**
	 * Constructs a new AST of the given type, initialized to contain
	 * text matching the token's name (use for non-literals only).
	 */
	public static function newImaginaryAST(type:int):LinkedListTree
	{
		return TREE_ADAPTOR.create(type, tokenName(type)) as LinkedListTree;
	}
	
	public static function newPlaceholderAST(type:int):LinkedListTree
	{
		var node:LinkedListTree = newImaginaryAST(type);
		var placeholder:LinkedListToken = TokenBuilder.newPlaceholder(node);
		return node;
	}
	
	/**
	 * Constructs a new AST of the given type, initialized to contain
	 * text matching the token's name (use for non-literals only).
	 * @deprecated
	 */
	public static function newAST(type:int, text:String = ""):LinkedListTree
	{
		if (text == "")
		{
			return newImaginaryAST(type);
		}
		
		var tok:LinkedListToken = TokenBuilder.newToken(type, text);
		var ast:LinkedListTree = TREE_ADAPTOR.create(tok) as LinkedListTree;
		return ast;
	}
	
	public static function newASTFromToken(tok:LinkedListToken):LinkedListTree
	{
		return LinkedListTree(TREE_ADAPTOR.create(tok));
	}
	
	public static function newParentheticAST(type:int,
											 startType:int,
											 startText:String,
											 endType:int,
											 endText:String):LinkedListTree
	{
		var ast:LinkedListTree = newImaginaryAST(type);
		var start:LinkedListToken = TokenBuilder.newToken(startType, startText);
		ast.setStartToken(start);
		var stop:LinkedListToken = TokenBuilder.newToken(endType, endText);
		ast.setStopToken(stop);
		start.setNext(stop);
		ast.setInitialInsertionAfter(start);
		return ast;
	}
	

	public static function increaseIndent(node:LinkedListTree, indent:String):void
	{
		var newStart:LinkedListToken = increaseIndentAt(node.getStartToken(), indent);
		node.setStartToken(newStart);
		increaseIndentAfterFirstLine(node, indent);
	}

	public static function increaseIndentAfterFirstLine(node:LinkedListTree, indent:String):void
	{
		for (var tok:LinkedListToken = node.getStartToken(); tok != node
				.getStopToken(); tok = tok.getNext())
		{
			switch (tok.type)
			{
			case AS3Parser.EOL:
				tok = increaseIndentAt(tok.getNext(), indent);
				break;
			case AS3Parser.ML_COMMENT:
				DocumentationUtils.increaseCommentIndent(tok, indent);
				break;
			}
		}
	}

	private static function increaseIndentAt(tok:LinkedListToken, indentStr:String):LinkedListToken
	{
		if (tok.type == AS3Parser.WS)
		{
			tok.text = indentStr + tok.text;
			return tok;
		}
		var indent:LinkedListToken = TokenBuilder.newWhiteSpace(indentStr);
		tok.prependToken(indent);
		return indent;
	}

	/**
	 * Inspects the whitespace preceeding the given tree node to try and
	 * determine its level of indentation.  Scans backwards from the
	 * startToken and returns the contents of the first whitespace token
	 * following a newline token, or the empty string if no such pattern
	 * is found.
	 */
	public static function findIndent(node:LinkedListTree):String
	{
		var tok:LinkedListToken = node.getStartToken();
		if (tok == null)
		{
			return findIndent(LinkedListTree(node.parent));
		}
		// the start-token of this AST node is actually whitespace, so
		// scan forward until we hit a non-WS token,
		while (tok.type == AS3Parser.EOL || tok.type == AS3Parser.WS)
		{
			if (tok.getNext() == null)
			{
				break;
			}
			tok = tok.getNext();
		}
		// search backwards though the tokens, looking for the start of
		// the line,
		for (; tok.getPrev() != null; tok = tok.getPrev())
		{
			if (tok.type == AS3Parser.EOL)
			{
				break;
			}
		}
		if (tok.type == AS3Parser.WS)
		{
			return tok.text;
		}
		if (tok.type != AS3Parser.EOL)
		{
			return "";
		}
		var startOfLine:LinkedListToken = tok.getNext();
		if (startOfLine.type == AS3Parser.WS)
		{
			return startOfLine.text;
		}
		return "";
	}
	
	
	public static function addChildWithIndentation(ast:LinkedListTree,
			stmt:LinkedListTree):void
	{
		var last:LinkedListTree = ast.getLastChild();
		var indent:String;
		if (last == null)
		{
			indent = "\t" + ASTUtils.findIndent(ast);
		}
		else
		{
			indent = ASTUtils.findIndent(last);
		}
		ASTUtils.increaseIndent(stmt, indent);
		stmt.addToken(0, TokenBuilder.newNewline());
		ast.addChildWithTokens(stmt);
	}

	public static function addParenChildWithIndentation(ast:LinkedListTree,
			stmt:LinkedListTree):void
	{
		// using this for the IASType metadata insertion, the parenthetic
		// tokens messed up original algorithm
		var last:LinkedListTree = ast.getLastChild();
		var indent:String;
		if (last == null)
		{
			indent = "\t" + ASTUtils.findIndent(ast);
		}
		else
		{
			indent = ASTUtils.findIndent(last);
		}
		ASTUtils.increaseIndent(stmt, indent);

		var next:LinkedListToken = stmt.getStartToken();
		stmt.setStartToken(TokenBuilder.newNewline());
		stmt.getStartToken().setNext(next);
		ast.addChildWithTokens(stmt);
	}
	
	public static function addChildAtWithIndentation(ast:LinkedListTree, 
													 index:int, 
													 child:LinkedListTree):void
	{
		var last:LinkedListTree = LinkedListTree(ast.getChild(index));
		var indent:String;
		if (last == null)
		{
			indent = "\t" + ASTUtils.findIndent(ast);
		}
		else
		{
			indent = ASTUtils.findIndent(last);
		}
		ASTUtils.increaseIndent(child, indent);
		child.addToken(0, TokenBuilder.newNewline());
		ast.addChildAtWithTokens(index, child);
	}
	
	public static function decodeStringLiteral(str:String):String
	{
		var result:StringBuffer = new StringBuffer();
		var s:Array = str.split("");
		var end:int = s.length - 1;
		if (s[0] != '"' && s[0] != '\'') {
			throw new ASBlocksSyntaxError("Invalid delimiter at position 0: "+s[0]);
		}
		var delimiter:String = s[0];
		for (var i:int = 1; i < end; i++) {
			var c:String = s[i];
			switch (c) {
			case '\\':
				c = s[++i];
				switch (c) {
				case 'n':
					result.append('\n');
					break;
				case 't':
					result.append('\t');
					break;
				case '\\':
					result.append('\\');
					break;
				default:
					result.append(c);
				}
				break;
			default:
				result.append(c);
			}
		}
		if (s[end] != delimiter) {
			throw new String("End delimiter doesn't match "+delimiter+" at position "+end);
		}
		return result.toString();
	}

	public static function newStringLiteral(constant:String):LinkedListToken
	{
		return new LinkedListToken(AS3Parser.STRING_LITERAL,
				ASTUtils.str(constant));
	}

	/**
	 * Deletes any whitespace tokens following (but not including) the given
	 * token up to a comma token, and then deletes the comma token too.
	 * 
	 * Used when removing elements from comma-seperated lists.
	 */
	public static function removeTrailingWhitespaceAndComma(stopToken:LinkedListToken):void
	{
		for (var tok:LinkedListToken = stopToken.getNext(); tok!=null; tok=tok.getNext())
		{
			if (tok.channel == TokenConstants.HIDDEN_CHANNEL)
			{
				// TODO: this might be incorrect (but never called?) see code in removePreceeding...
				tok.deleteToken();
			}
			else if (tok.type == AS3Parser.COMMA)
			{
				tok.deleteToken();
				break;
			}
			else
			{
				throw new ASBlocksSyntaxError("Unexpected token: "+tok);
			}
		}
	}
	
	public static function removePreceedingWhitespaceAndComma(startToken:LinkedListToken):void
	{
		for (var tok:LinkedListToken = startToken.getPrev(); tok!=null; tok=tok.getPrev())
		{
			if (tok.channel == TokenConstants.HIDDEN_CHANNEL)
			{
				var del:LinkedListToken = tok;
				tok = tok.getNext();
				del.deleteToken();
				continue;
			} else if (tok.type == AS3Parser.COMMA) {
				tok.deleteToken();
				break;
			} else {
				throw new ASBlocksSyntaxError("Unexpected token: "+tok);
			}
		}
	}
	
	public static function assertAS3TokenTypeIs(expected:int, actual:int, message:String = ""):void
	{
		if (expected != actual)
		{
			throw new ASBlocksSyntaxError(message + " Expected "+
				tokenName(expected)+", got "+tokenName(actual));
		}
	}
	
	public static function stringifyNode(ast:LinkedListTree):String
	{
		var result:String = "";
		for (var tok:LinkedListToken=ast.getStartToken(); tok!=null&&tok.type!=-1; tok=tok.getNext())
		{
			result += tok.text;
			if (tok == ast.getStopToken())
				break;
		}
		return result.toString();
	}
	
	public static function deleteAllChildren(ast:LinkedListTree):void
	{
		while (ast.childCount > 0)
		{
			ast.deleteChild(0);
		}
	}

	public static function deleteAllChildrenTo(ast:LinkedListTree,
			first:LinkedListTree):void
	{
		while (ast.childCount > 0)
		{
			var next:LinkedListTree = ast.getLastChild();
			if (first == next)
				break;
			ast.deleteChild(ast.childCount - 1);
		}
	}
	
	public static function ast(expr:IScriptElement):LinkedListTree
	{
		return ASTScriptElement(expr).getAST();
	}

	/**
	 * Converts an <code>LinkedListTree</code> into a flat XML String.
	 * 
	 * @param ast The <code>LinkedListTree</code> to convert.
	 * @return A String XML representation of the <code>LinkedListTree</code>.
	 */
	public static function convert(ast:LinkedListTree, 
								   location:Boolean = true):String
	{
		return visitNodes(ast, "", 0, location);
	}
	
	/**
	 * @private
	 */
	private static function visitNodes(ast:LinkedListTree, 
									  result:String, 
									  level:int,
									  location:Boolean = true):String
	{
		if (location)
		{
			result += "<" + tokenName(ast.type) + " line=\"" + 
				ast.line + "\">";
			
//			result += "<" + tokenName(ast.type) + " line=\"" + 
//				ast.line + "\" column=\"" + ast.charPositionInLine + "\">";
		}
		else
		{
			result += "<" + tokenName(ast.type) + ">";
		}
		
		var numChildren:int = ast.childCount;
		if (numChildren > 0)
		{
			for (var i:int = 0; i < numChildren; i++)
			{
				result = visitNodes(LinkedListTree(ast.getChild(i)), result, level + 1, location);
			}
		}
		else if (ast.text != null)
		{
			result += escapeEntities(ast.text);
		}
		
		result += "</" + tokenName(ast.type) + ">";
		
		return result;
	}
	
	/**
	 * @private
	 */
	private static function escapeEntities(stringToEscape:String):String
	{
		var buffer:String = "";
		
		for (var i:int = 0; i < stringToEscape.length; i++)
		{
			var currentCharacter:String = stringToEscape.charAt(i);
			
			if (currentCharacter == '<')
			{
				buffer += "&lt;";
			}
			else if (currentCharacter == '>')
			{
				buffer += "&gt;";
			}
			else
			{
				buffer += currentCharacter;
			}
		}
		return buffer;
	}
	
	/**
	 * Escape the given String and place within double quotes so that it
	 * will be a valid ActionScript string literal.
	 */
	public static function str(str:String):String
	{
		var result:StringBuffer = new StringBuffer("\"");
		for (var i:int = 0; i < str.length; i++)
		{
			var c:String = str.charAt(i);
			switch (c) {
			    case '\n':
				result.append("\\n");
				break;
			    case '\t':
				result.append("\\t");
				break;
			    case '\r':
				result.append("\\r");
				break;
			    case '"':
				result.append("\\\"");
				break;
			    case '\\':
				result.append("\\\\");
				break;
			    default:
				result.append(c);
			}
		}
		result.append('"');
		return result.toString();
	}

	public static function findAncestor(ast:LinkedListTree, type:int):LinkedListTree
	{
		return LinkedListTree(ast.getAncestor(type));
	}
	
	public static function print(unit:IASCompilationUnit):String
	{
		var writer:StringWriter = new StringWriter();
		try
		{
			new ASFactory().newWriter().write(writer, unit);
		}
		catch (e:Error)
		{
			
		}
		return writer.toString();
	}
	
	public static function isType(element:IScriptElement, type:int):Boolean
	{
		return ASTScriptElement(element).getAST().type == type;
	}
		
	// UNUSED ??? ---------------------------------------------------------
	
	private static function stringifyIdentAux_(ast:LinkedListTree):String
	{
		return ast.text;
	}
	
	public static function identStarText(ast:LinkedListTree):String
	{
		throw new Error ("ASTUtils.identStarText() outof order :)");
		if (ast.type != AS3Parser.ASSIGN)
		{
			throw new IllegalArgumentError("expected IDENTIFIER_STAR, but token was a " + 
				tokenNameFromAST(ast));
		}
		
		var result:StringBuffer = new StringBuffer();
		for (var i:int = 0; i < ast.childCount; i++)
		{
			var part:LinkedListTree = LinkedListTree(ast.getChild(i));
			if (result.toString().length > 0)
			{
				result.append(".");
			}
			result.append(part.getText());
		}
		
		return result.toString();
	}
}
}