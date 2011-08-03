package org.as3commons.asblocks.parser.antlr.as3
{

import org.antlr.runtime.ANTLRStringStream;
import org.as3commons.asblocks.impl.ParentheticUpdateFactory;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;

public class TestAS3ParserHelper
{
	public static var TREE_ADAPTOR:LinkedListTreeAdaptor = 
		new LinkedListTreeAdaptor(new ParentheticUpdateFactory());	
	
	private static var parser:AS3Parser = new AS3Parser(null);
	private static var lexer:AS3Lexer = new AS3Lexer(null);
	
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
}
}