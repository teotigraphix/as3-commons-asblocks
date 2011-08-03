package org.as3commons.asblocks.parser.antlr.as3
{

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.ParserRuleReturnScope;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.impl.ParentheticUpdateFactory;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;

public class TestAS3ParserBase
{
	protected var parser:AS3Parser = new AS3Parser(null);
	protected var lexer:AS3Lexer = new AS3Lexer(null);
	
	protected var t:LinkedListTree;
	protected var r:String;
	protected var x:String; 
	
	[Before]
	public function setUp():void
	{
	}
	
	[After]
	public function tearDown():void
	{
	}
	
	[BeforeClass]
	public static function setUpBeforeClass():void
	{
	}
	
	[AfterClass]
	public static function tearDownAfterClass():void
	{
		//t //= tree(parser.expression());
		//result = t.toStringTree();
		//x = xml(t);		
	}
	
	protected function xml(tree:LinkedListTree):String
	{
		return ASTUtils.convert(tree, false);
	}	
	
	protected function tree(returnScope:ParserRuleReturnScope):LinkedListTree
	{
		return returnScope.tree as LinkedListTree;
	}
	
	public static var TREE_ADAPTOR:LinkedListTreeAdaptor = 
		new LinkedListTreeAdaptor(new ParentheticUpdateFactory());	
	
	/**
	 * Returns an ActionScript3 parser which will recognise input from the
	 * given reader.
	 */
	public function parse(str:String):AS3Parser
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