package org.as3commons.asblocks.parser.antlr.regexsimple
{

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CharStream;
import org.as3commons.asblocks.impl.AS3FragmentParser;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.as3commons.asblocks.parser.antlr.as3.AS3Lexer;

public class RegexSimpleHelper
{
	private static var TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	public static function parserOn(str:String):RegexSimpleParser
	{
		var cs:ANTLRStringStream = new ANTLRStringStream(str);
		var lexer:RegexSimpleLexer = new RegexSimpleLexer(cs);
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		
		var parser:RegexSimpleParser = new RegexSimpleParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		
		parser.setInput(lexer, cs);
		return parser;
	}
	
	public static function parseRegexpLiteral(startMarker:LinkedListToken, 
											  lexer:AS3Lexer, 
											  cs:CharStream, 
											  stream:LinkedListTokenStream):LinkedListTree
	{
		var tail:String = cs.substring(cs.index, cs.size - 1);
		var initialTailLength:int = tail.length;
		var parser:RegexSimpleParser;
		try {
			parser = regexpParserOn(tail, stream);
		} catch (e:Error) {
			// TODO: better exception type?
			//throw new RuntimeException(e);
			throw new Error(e);
		}
		var ast:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		tail = parser.getInputTail();
		// skip over the regexp in the original, underlying CharStream
		cs.seek(cs.index + (initialTailLength - tail.length));
		var source:LinkedListTokenSource = LinkedListTokenSource(stream.tokenSource);
		stream.tokenSource = source;  // cause any remembered RegexpSimple state to be dropped
		stream.scrub(1); // erase the subsequent token that the RegexpSimple parser got from this stream
		source.setDelegate(lexer);
		return ast;
	}
	
	private static function regexpParserOn(inStr:String, stream:LinkedListTokenStream):RegexSimpleParser
	{
		var cs:ANTLRStringStream = new ANTLRStringStream(inStr);
		var lexer:RegexSimpleLexer = new RegexSimpleLexer(cs);
		var source:LinkedListTokenSource = LinkedListTokenSource(stream.tokenSource);
		source.setDelegate(lexer);

		// The AS3 grammar will see the initial '/' as an DIV (divide)
		// token, and lookahead in the AS3Parser will have already
		// grabbed references to that token in order to make it the
		// startToken for various AST subtrees, so we can't just delete
		// it.  We therefore find the DIC token and change its type to
		// match the regexp vocabulary, and then rewind the token stream
		// so that this will be the first token that the
		// SinpleRegexpParser will see.
		var startMarker:LinkedListToken = LinkedListToken(stream.LT(-1));
		startMarker.type = RegexSimpleParser.REGEXP_DELIMITER;
		stream.seek(stream.index - 1);

		var parser:RegexSimpleParser = new RegexSimpleParser(stream);
		parser.treeAdaptor = new LinkedListTreeAdaptor();
		parser.setInput(lexer, cs);
		return parser;
	}
}
}