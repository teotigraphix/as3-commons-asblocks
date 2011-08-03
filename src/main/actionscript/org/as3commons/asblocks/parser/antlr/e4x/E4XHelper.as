package org.as3commons.asblocks.parser.antlr.e4x
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

public class E4XHelper
{
	private static var TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	public static function parseXMLLiteral(lexer:AS3Lexer, 
										   cs:CharStream, 
										   stream:LinkedListTokenStream):LinkedListTree
	{
		var tail:String = cs.substring(cs.index, cs.size - 1);
		var initialTailLength:int = tail.length;
		var parser:E4XParser;
		try {
			parser = e4xParserOn(tail, stream);
		} catch (e:Error) {
			// TODO: better exception type?
			//throw new RuntimeException(e);
			throw new Error(e);
		}
		var ast:LinkedListTree = AS3FragmentParser.tree(parser.xmlPrimary());
		tail = parser.getInputTail();
		// skip over the XML in the original, underlying CharStream
		cs.seek(cs.index + (initialTailLength - tail.length));
		var source:LinkedListTokenSource = LinkedListTokenSource(stream.tokenSource);
		stream.setTokenSource(source);  // cause any remembered E4X state to be dropped
		stream.scrub(1); // erase the subsequent token that the E4X parser got from this stream
		source.setDelegate(lexer);
		return ast;
	}
	
	public static function parserOn(str:String):E4XParser
	{
		var cs:ANTLRStringStream = new ANTLRStringStream(str);
		var lexer:E4XLexer = new E4XLexer(cs);
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		
		var parser:E4XParser = new E4XParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		parser.setInput(lexer, cs);
		
		return parser;
	}	
	
	private static function e4xParserOn(inStr:String, stream:LinkedListTokenStream):E4XParser {
		var cs:ANTLRStringStream = new ANTLRStringStream(inStr);
		var lexer:E4XLexer = new E4XLexer(cs);
		var source:LinkedListTokenSource = LinkedListTokenSource(stream.tokenSource);
		source.setDelegate(lexer);
		
		// The AS3 grammar will see the initial '<' as an LT (less-than)
		// token, and lookahead in the AS3Parser will have already
		// grabbed references to that token in order to make it the
		// startToken for various AST subtrees, so we can't just delete
		// it.  We therefore find the LT token and change its type to
		// match the E4X vocabulary, and then rewind the token stream
		// so that this will be the first token that the E4XParser will
		// see.
		var startMarker:LinkedListToken = LinkedListToken(stream.LT(-1));
		startMarker.type = E4XParser.XML_LCHEVRON;
		stream.seek(stream.index -1);

		var parser:E4XParser = new E4XParser(stream);
		parser.treeAdaptor = new LinkedListTreeAdaptor();
		parser.setInput(lexer, cs);
		return parser;
	}	
}
}