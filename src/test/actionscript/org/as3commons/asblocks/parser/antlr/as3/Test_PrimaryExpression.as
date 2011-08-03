package org.as3commons.asblocks.parser.antlr.as3
{

import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_PrimaryExpression extends TestAS3ParserBase
{
	/*
		parser = parse("x>>=1");
		t = tree(parser.expression());
		result = t.toStringTree();
		x = xml(t);
	*/
	
	[Test]
	public function test_undefined():void
	{
		parser = parse("undefined");
		// <UNDEFINED>undefined</UNDEFINED>
		assertEquals("undefined", 
			tree(parser.expression()).toStringTree());
	}
	
	[Test]
	public function test_constant():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
		
		//----------------------------------------------------------------------
		// number
		//------------------------------
		//    hex
		parser = parse("0x424242");
		// <HEX_LITERAL>0x424242</HEX_LITERAL>
		assertEquals("0x424242", 
			tree(parser.primaryExpression()).toStringTree());
		
		//------------------------------
		//  > decimal
		parser = parse("0");
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL>
		assertEquals("0", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("42");
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL>
		assertEquals("42", 
			tree(parser.primaryExpression()).toStringTree());
		
		//------------------------------
		//  > octal
		parser = parse("007");
		// <OCTAL_LITERAL>007</OCTAL_LITERAL>
		assertEquals("007", 
			tree(parser.primaryExpression()).toStringTree());
		
		//------------------------------
		//  > float
		parser = parse("0.42");
		// <FLOAT_LITERAL>0.42</FLOAT_LITERAL>
		assertEquals("0.42", 
			tree(parser.primaryExpression()).toStringTree());
		
		//----------------------------------------------------------------------
		// STRING_LITERAL
		//------------------------------
		// "string"
		parser = parse("\"string\"");
		// <STRING_LITERAL>"string"</STRING_LITERAL>
		assertEquals("\"string\"", 
			tree(parser.primaryExpression()).toStringTree());
		
		//------------------------------
		// 'string'
		parser = parse("'string'");
		// <STRING_LITERAL>'string'</STRING_LITERAL>
		assertEquals("'string'", 
			tree(parser.primaryExpression()).toStringTree());
		
		//----------------------------------------------------------------------
		// TRUE, FALSE, NULL
		
		parser = parse("true");
		// <TRUE>true</TRUE>
		assertEquals("true", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("false");
		// <FALSE>false</FALSE>
		assertEquals("false", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("null");
		// <NULL>null</NULL>
		assertEquals("null", 
			tree(parser.primaryExpression()).toStringTree());
	}
	
	[Test]
	public function test_arrayLiteral():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
		
		parser = parse("[]");
		// <ARRAY_LITERAL>ARRAY_LITERAL</ARRAY_LITERAL>
		assertEquals("ARRAY_LITERAL", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("[1,a,4]");
		// <ARRAY_LITERAL><DECIMAL_LITERAL>1</DECIMAL_LITERAL><IDENT>a</IDENT>
		// <DECIMAL_LITERAL>4</DECIMAL_LITERAL></ARRAY_LITERAL>
		assertEquals("(ARRAY_LITERAL 1 a 4)", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("[1,[a,b,c],4]");
		// <ARRAY_LITERAL><DECIMAL_LITERAL>1</DECIMAL_LITERAL><ARRAY_LITERAL>
		// <IDENT>a</IDENT><IDENT>b</IDENT><IDENT>c</IDENT></ARRAY_LITERAL>
		// <DECIMAL_LITERAL>4</DECIMAL_LITERAL></ARRAY_LITERAL>
		assertEquals("(ARRAY_LITERAL 1 (ARRAY_LITERAL a b c) 4)", 
			tree(parser.primaryExpression()).toStringTree());
	}
	
	[Test]
	public function test_objectLiteral():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
	
		parser = parse("{}");
		// <OBJECT_LITERAL>OBJECT_LITERAL</OBJECT_LITERAL>
		assertEquals("OBJECT_LITERAL", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("{a:1,b:42,c:\"string\"}");
		// <OBJECT_LITERAL><OBJECT_FIELD><IDENT>a</IDENT><DECIMAL_LITERAL>1
		// </DECIMAL_LITERAL></OBJECT_FIELD><OBJECT_FIELD><IDENT>b</IDENT>
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL></OBJECT_FIELD><OBJECT_FIELD>
		// <IDENT>c</IDENT><LITERAL_STRING_DOUBLE>"string"</LITERAL_STRING_DOUBLE>
		// </OBJECT_FIELD></OBJECT_LITERAL>
		assertEquals("(OBJECT_LITERAL (OBJECT_FIELD a 1) (OBJECT_FIELD " +
			"b 42) (OBJECT_FIELD c \"string\"))", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("{a:1,b:{foo:42,bar:{e:\"string2\"}},c:\"string\"}");
		// <OBJECT_LITERAL><OBJECT_FIELD><IDENT>a</IDENT><DECIMAL_LITERAL>
		// 1</DECIMAL_LITERAL></OBJECT_FIELD><OBJECT_FIELD><IDENT>b</IDENT>
		// <OBJECT_LITERAL><OBJECT_FIELD><IDENT>foo</IDENT><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL></OBJECT_FIELD><OBJECT_FIELD><IDENT>bar</IDENT>
		// <OBJECT_LITERAL><OBJECT_FIELD><IDENT>e</IDENT><LITERAL_STRING_DOUBLE>
		// "string2"</LITERAL_STRING_DOUBLE></OBJECT_FIELD></OBJECT_LITERAL>
		// </OBJECT_FIELD></OBJECT_LITERAL></OBJECT_FIELD><OBJECT_FIELD>
		// <IDENT>c</IDENT><LITERAL_STRING_DOUBLE>"string"</LITERAL_STRING_DOUBLE>
		// </OBJECT_FIELD></OBJECT_LITERAL>
		assertEquals("(OBJECT_LITERAL (OBJECT_FIELD a 1) (OBJECT_FIELD b " +
			"(OBJECT_LITERAL (OBJECT_FIELD foo 42) (OBJECT_FIELD bar " +
			"(OBJECT_LITERAL (OBJECT_FIELD e \"string2\"))))) (OBJECT_FIELD " +
			"c \"string\"))", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("{a:foo[bar],2:42}");
		// <OBJECT_LITERAL><OBJECT_FIELD><IDENT>a</IDENT><ARRAY_ACCESS>
		// <IDENT>foo</IDENT><IDENT>bar</IDENT></ARRAY_ACCESS></OBJECT_FIELD>
		// <OBJECT_FIELD><DECIMAL_LITERAL>2</DECIMAL_LITERAL><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL></OBJECT_FIELD></OBJECT_LITERAL>
		assertEquals("(OBJECT_LITERAL (OBJECT_FIELD a (ARRAY_ACCESS foo bar)) " +
			"(OBJECT_FIELD 2 42))", 
			tree(parser.primaryExpression()).toStringTree());
	}
	
	[Test]
	public function test_functionExpression():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
	
		parser = parse("function(){}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><BLOCK>BLOCK</BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS BLOCK)", 
			tree(parser.primaryExpression()).toStringTree());

		parser = parse("function():void{}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><TYPE_SPEC><VOID>void</VOID>
		// </TYPE_SPEC><BLOCK>BLOCK</BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS (: void) BLOCK)", 
			tree(parser.primaryExpression()).toStringTree());

		parser = parse("function():foo.bar.Baz{}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><TYPE_SPEC><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_SPEC><BLOCK>BLOCK
		// </BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS (: foo bar Baz) BLOCK)", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("function(arg0:Vector.<Vector.<foo.Bar>> = null, ...rest):void{return;}");
		// <FUNC_DEF><PARAMS><PARAM><IDENT>arg0</IDENT><TYPE_SPEC>
		// <IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>foo</IDENT><IDENT>Bar</IDENT>
		// </TYPE_POSTFIX></TYPE_POSTFIX></TYPE_SPEC><ASSIGN><NULL>null
		// </NULL></ASSIGN></PARAM><PARAM><REST>...</REST><IDENT>rest</IDENT>
		// </PARAM></PARAMS><TYPE_SPEC><VOID>void</VOID></TYPE_SPEC><BLOCK>
		// <RETURN>return</RETURN></BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF (PARAMS (PARAM arg0 (: Vector (TYPE_POSTFIX " +
			"Vector (TYPE_POSTFIX foo Bar))) (= null)) (PARAM ... rest)) " +
			"(: void) (BLOCK return))", 
			tree(parser.primaryExpression()).toStringTree());		
	}

	[Test]
	public function test_newExpression():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("new Foo");
		// <NEW><IDENT>Foo</IDENT></NEW>
		assertEquals("(new Foo)", tree(parser.expression()).toStringTree());		
		
	
		parser = parse("new Foo");
		// <NEW><IDENT>Foo</IDENT></NEW>
		assertEquals("(new Foo)", tree(parser.expression()).toStringTree());

		parser = parse("new Foo()");
		// <NEW><IDENT>Foo</IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW>
		assertEquals("(new Foo ARGUMENTS)", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("new foo.baz[42].goo[bee[22][0]][11].Baz()");
		// <NEW><PROP_OR_IDENT><ARRAY_ACCESS><ARRAY_ACCESS><PROP_OR_IDENT>
		// <ARRAY_ACCESS><PROP_OR_IDENT><IDENT>foo</IDENT><IDENT>baz</IDENT>
		// </PROP_OR_IDENT><DECIMAL_LITERAL>42</DECIMAL_LITERAL></ARRAY_ACCESS>
		// <IDENT>goo</IDENT></PROP_OR_IDENT><ARRAY_ACCESS><ARRAY_ACCESS>
		// <IDENT>bee</IDENT><DECIMAL_LITERAL>22</DECIMAL_LITERAL></ARRAY_ACCESS>
		// <DECIMAL_LITERAL>0</DECIMAL_LITERAL></ARRAY_ACCESS></ARRAY_ACCESS>
		// <DECIMAL_LITERAL>11</DECIMAL_LITERAL></ARRAY_ACCESS><IDENT>Baz</IDENT>
		// </PROP_OR_IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW>
		assertEquals("(new (. (ARRAY_ACCESS (ARRAY_ACCESS (. (ARRAY_ACCESS (. " +
			"foo baz) 42) goo) (ARRAY_ACCESS (ARRAY_ACCESS bee 22) 0)) 11) Baz) ARGUMENTS)", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("new flash.events.Event(Event.CHANGE, true, false, 42)");		
		// <NEW><PROP_OR_IDENT><PROP_OR_IDENT><IDENT>flash</IDENT><IDENT>
		// events</IDENT></PROP_OR_IDENT><IDENT>Event</IDENT></PROP_OR_IDENT>
		// <ARGUMENTS><PROP_OR_IDENT><IDENT>Event</IDENT><IDENT>CHANGE</IDENT>
		// </PROP_OR_IDENT><TRUE>true</TRUE><FALSE>false</FALSE><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL></ARGUMENTS></NEW>
		assertEquals("(new (. (. flash events) Event) (ARGUMENTS (. Event CHANGE) true false 42))", 
			tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("new Vector.<Vector.<Foo>>(true, 0)");
		// <NEW><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX></TYPE_POSTFIX>
		// <ARGUMENTS><TRUE>true</TRUE><DECIMAL_LITERAL>0</DECIMAL_LITERAL>
		// </ARGUMENTS></NEW>
		assertEquals("(new Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Foo)) " +
			"(ARGUMENTS true 0))", tree(parser.expression()).toStringTree());
		
		//parser = parse("new < int > [1, 2, 3]");
		//t = tree(parser.expression());
		//result = t.toStringTree();
		//x = xml(t);		
		
		// <NEW><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX></TYPE_POSTFIX>
		// <ARGUMENTS><TRUE>true</TRUE><DECIMAL_LITERAL>0</DECIMAL_LITERAL>
		// </ARGUMENTS></NEW>
		//assertEquals("(new Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Foo)) " +
		//	"(ARGUMENTS true 0))", tree(parser.expression()).toStringTree());
		
		//var a = new < int > [1, 2, 3];
	}
	
	[Test]
	public function test_encapsulatedExpression():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
	
		parser = parse("(ecapsulated[foo].bar)");
		// <ENCPS_EXPR><PROP_OR_IDENT><ARRAY_ACCESS><IDENT>ecapsulated</IDENT>
		// <IDENT>foo</IDENT></ARRAY_ACCESS><IDENT>bar</IDENT></PROP_OR_IDENT>
		// </ENCPS_EXPR>
		assertEquals("(ENCPS_EXPR (. (ARRAY_ACCESS ecapsulated foo) bar))", 
			tree(parser.primaryExpression()).toStringTree());
	}
	
	[Test]
	public function test_e4xAttributeIdentifier():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
	
		parser = parse("foo.@bar"); // propertyAtt
		
		t = tree(parser.expression());
		result = t.toStringTree();
		x = xml(t);
		
		// <ENCPS_EXPR><PROP_OR_IDENT><ARRAY_ACCESS><IDENT>ecapsulated</IDENT>
		// <IDENT>foo</IDENT></ARRAY_ACCESS><IDENT>bar</IDENT></PROP_OR_IDENT>
		// </ENCPS_EXPR>
//		assertEquals("(E4X_EXPRESSION foo @ bar)", 
//			tree(parser.primaryExpression()).toStringTree());
		
		
		parser = parse("@*"); //startAtt
		
		parser = parse("@[bar]"); // expressionAtt
	}
	
	[Test]
	public function test_qualifiedIdent():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;		
	
		parser = parse("foo");
		// <IDENT>foo</IDENT>
		assertEquals("foo", tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("foo::bar");
		// <DBL_COLON><IDENT>foo</IDENT><IDENT>bar</IDENT></DBL_COLON>
		assertEquals("(:: foo bar)", tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("foo::bar.baz()");
		// <FUNCTION_CALL><PROP_OR_IDENT><DBL_COLON><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></DBL_COLON><IDENT>baz</IDENT></PROP_OR_IDENT>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (. (:: foo bar) baz) ARGUMENTS)", 
			tree(parser.expression()).toStringTree());
	}
}
}