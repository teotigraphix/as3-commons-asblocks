package org.as3commons.asblocks.parser.antlr.as3
{

public class Test_Package extends TestAS3ParserBase
{
	[Test]
	public function test_basic():void
	{
		//------------------------------
		// Empty package
		//parser = parse("package {}");
		//assertEquals("(COMPILATION_UNIT (package BLOCK))", 
		//	tree(parser.compilationUnit()).toStringTree());
	}
}
}