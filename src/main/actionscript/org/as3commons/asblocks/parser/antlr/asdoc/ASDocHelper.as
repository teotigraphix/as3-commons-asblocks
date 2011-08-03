package org.as3commons.asblocks.parser.antlr.asdoc
{

import org.antlr.runtime.ANTLRStringStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;

public class ASDocHelper
{
	private static var TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	public static function parserOn(text:String):ASDocParser
	{
		var cs:ANTLRStringStream = new ANTLRStringStream(text);
		var lexer:ASDocLexer = new ASDocLexer(cs);
		var source:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(source);
		var parser:ASDocParser = new ASDocParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		return parser;
	}
}
}