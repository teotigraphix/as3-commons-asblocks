package org.as3commons.asblocks.parser.antlr.regexsimple
{

import org.as3commons.asblocks.impl.AS3FragmentParser;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.Assert;

public class TestRegexSimpleParser
{
	[Test]
	public function testSimple():void
	{
		var parser:RegexSimpleParser = parserOn("/regexp/");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
	}	
	
	[Test]
	public function testRemainder():void
	{
		var parser:RegexSimpleParser = parserOn("/@/ ");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
		Assert.assertEquals(" ", parser.getInputTail());
	}
		
	[Test]
	public function testEscapedDelimiter():void
	{
		var parser:RegexSimpleParser = parserOn("/\\//");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
	}
		
	[Test]
	public function testSimpleFlags():void
	{
		var parser:RegexSimpleParser = parserOn("/@/mi");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
	}
		
	[Test]
	public function testNullEscapes():void
	{
		var parser:RegexSimpleParser = parserOn("/\\_/\\_");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
	}
		
	[Test]
	public function testHexEscapes():void
	{
		var parser:RegexSimpleParser = parserOn("/\\x12\\u1234\\U12345678/");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.regexpLiteral());
		Assert.assertEquals(RegexSimpleParser.REGEXP_LITERAL, tree.type);
	}
	
	private static function parserOn(str:String):RegexSimpleParser
	{
		return RegexSimpleHelper.parserOn(str);
	}
}
}