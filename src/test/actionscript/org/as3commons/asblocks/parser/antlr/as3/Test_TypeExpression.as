package org.as3commons.asblocks.parser.antlr.as3
{

import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_TypeExpression extends TestAS3ParserBase
{

	[Test]
	public function test_typeExpression():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		//------------------------------
		// void
		parser = parse(":void");
		// <TYPE_SPEC><VOID>void</VOID></TYPE_SPEC>
		assertEquals("(: void)", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// a LCURLY SEMI COMMA ASSIGN RPAREN
		parser = parse(":*");
		// <TYPE_SPEC><STAR>*</STAR></TYPE_SPEC>
		assertEquals("(: *)", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// String
		parser = parse(":String");
		// <TYPE_SPEC><IDENT>String</IDENT></TYPE_SPEC>
		assertEquals("(: String)", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// foo.bar.Baz
		parser = parse(":foo.bar.Baz");
		// <TYPE_SPEC><IDENT>foo</IDENT><IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_SPEC>
		assertEquals("(: foo bar Baz)", tree(parser.typeExpression()).toStringTree());		
		
		//------------------------------
		// foo.my_namespace::bar don't think this is quite legal but allowed
		parser = parse(":foo.my_namespace::bar");
		// <TYPE_SPEC><IDENT>foo</IDENT><DBL_COLON><IDENT>my_namespace</IDENT>
		// <IDENT>bar</IDENT></DBL_COLON></TYPE_SPEC>
		assertEquals("(: foo (:: my_namespace bar))", tree(parser.typeExpression()).toStringTree());		
		
		//------------------------------
		// Vector.<*>
		parser = parse(":Vector.<*>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><STAR>*</STAR>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX *))", 
			tree(parser.typeExpression()).toStringTree());			
		
		//------------------------------
		// Vector.<String>
		parser = parse(":Vector.<Foo>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Foo</IDENT>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX Foo))", 
			tree(parser.typeExpression()).toStringTree());	
		
		//------------------------------
		// Vector.<foo.bar.Baz>
		parser = parse(":Vector.<foo.bar.Baz>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX foo bar Baz))", 
			tree(parser.typeExpression()).toStringTree());			
		
		//------------------------------
		// Vector.<Vector.<Foo>>
		parser = parse(":Vector.<Vector.<Foo>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Foo)))", 
			tree(parser.typeExpression()).toStringTree());
	
		//------------------------------
		// Vector.<Vector.<String>>
		parser = parse(":Vector.<Vector.<Vector.<Foo>>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Foo</IDENT>
		// </TYPE_POSTFIX></TYPE_POSTFIX></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX " +
			"Vector (TYPE_POSTFIX Foo))))", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// Vector.<Vector.<foo.bar.Baz>>
		parser = parse(":Vector.<Vector.<Vector.<foo.bar.Baz>>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_POSTFIX></TYPE_POSTFIX>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Vector " +
			"(TYPE_POSTFIX foo bar Baz))))", tree(parser.typeExpression()).toStringTree());
	}
}
}