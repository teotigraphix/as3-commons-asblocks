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
import org.flexunit.asserts.assertEquals;

public class TestAS3Parser_Proto
{		
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
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;		
		
		//t //= tree(parser.expression());
		//result = t.toStringTree();
		//x = xml(t);		
	}

	
	[Test]
	public function testEncapsulated():void
	{
		var parser:AS3Parser;
		parser = parse("(foo in bar) = null");
		// <ASSIGN><ENCPS_EXPR><IN><IDENT>foo</IDENT><IDENT>bar</IDENT>
		// </IN></ENCPS_EXPR><NULL>null</NULL></ASSIGN>
		assertEquals("(= (ENCPS_EXPR (in foo bar)) null)", tree(parser.expression()).toStringTree());
		
		parser = parse("!(foo in bar).baz = null");
		// <ASSIGN><LNOT><PROPERTY_OR_IDENTIFIER><ENCPS_EXPR><IN><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></IN></ENCPS_EXPR><IDENT>baz</IDENT></PROPERTY_OR_IDENTIFIER>
		// </LNOT><NULL>null</NULL></ASSIGN>
		assertEquals("(= (! (. (ENCPS_EXPR (in foo bar)) baz)) null)", tree(parser.expression()).toStringTree());
	}
	
	[Test]
	public function testNewExpression():void
	{
		return;
		
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("new Foo()");
		t = tree(parser.expression());
		result = t.toStringTree();
		x = xml(t);
		
		
		// <NEW><IDENT>Foo</IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW>
		assertEquals("(new Foo ARGUMENTS)", tree(parser.expression()).toStringTree());
		
		parser = parse("new Foo(42, \"bar\", Foo.baz).blop");
		// <PROPERTY_OR_IDENTIFIER><NEW><IDENT>Foo</IDENT><ARGUMENTS><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL><STRING_LITERAL>"bar"</STRING_LITERAL>
		// <PROPERTY_OR_IDENTIFIER><IDENT>Foo</IDENT><IDENT>baz</IDENT></PROPERTY_OR_IDENTIFIER>
		// </ARGUMENTS></NEW><IDENT>blop</IDENT></PROPERTY_OR_IDENTIFIER>
		assertEquals("(. (new Foo (ARGUMENTS 42 \"bar\" (. Foo baz))) blop)", 
			tree(parser.expression()).toStringTree());
		
		parser = parse("new Foo().bar()");
		// <METHOD_CALL><PROPERTY_OR_IDENTIFIER><NEW><IDENT>Foo</IDENT>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW><IDENT>bar</IDENT>
		// </PROPERTY_OR_IDENTIFIER><ARGUMENTS>ARGUMENTS</ARGUMENTS></METHOD_CALL>
		assertEquals("(METHOD_CALL (. (new Foo ARGUMENTS) bar) ARGUMENTS)", 
			tree(parser.expression()).toStringTree());
		
		
		parser = parse("new Vector.<String>(true, 255)");
		t = tree(parser.expression());
		result = t.toStringTree();
		x = xml(t);
		
		// <METHOD_CALL><PROPERTY_OR_IDENTIFIER><NEW><IDENT>Foo</IDENT>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW><IDENT>bar</IDENT>
		// </PROPERTY_OR_IDENTIFIER><ARGUMENTS>ARGUMENTS</ARGUMENTS></METHOD_CALL>
		assertEquals("(METHOD_CALL (. (new Foo ARGUMENTS) bar) ARGUMENTS)", 
			tree(parser.expression()).toStringTree());
	}
	
	
	[Test]
	public function test_var():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("var a;");
		// <VAR><IDENT>a</IDENT></VAR>
		assertEquals("(var a)", tree(parser.statement()).toStringTree());
		
		parser = parse("var a : Foo ;");
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>Foo</IDENT></QNAME></TYPE>
		// </TYPE_SPEC></IDENT></VAR>
		assertEquals("(var (a (: (TYPE (QNAME Foo)))))", tree(parser.statement()).toStringTree());		
		
		parser = parse("var a : int = 4;");
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>int</IDENT></QNAME></TYPE>
		// </TYPE_SPEC><ASSIGN><DECIMAL_LITERAL>4</DECIMAL_LITERAL></ASSIGN></IDENT></VAR>
		assertEquals("(var (a (: (TYPE (QNAME int))) (= 4)))", tree(parser.statement()).toStringTree());
		
		parser = parse("var colors:Array = [0x2bc9f6, 0x0086ad];");
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>Array</IDENT></QNAME></TYPE>
		// </TYPE_SPEC><ASSIGN><ARRAY_LITERAL><HEX_LITERAL>0x2bc9f6</HEX_LITERAL>
		// <HEX_LITERAL>0x0086ad</HEX_LITERAL></ARRAY_LITERAL></ASSIGN></IDENT></VAR>
		assertEquals("(var (colors (: (TYPE (QNAME Array))) (= (ARRAY_LITERAL 0x2bc9f6 0x0086ad))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("var v:Vector.<Foo>;");
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>Vector</IDENT><TYPE_POSTFIX>
		// <IDENT>Foo</IDENT></TYPE_POSTFIX></QNAME></TYPE></TYPE_SPEC></IDENT></VAR>
		assertEquals("(var (v (: (TYPE (QNAME Vector (TYPE_POSTFIX Foo))))))", 
			tree(parser.statement()).toStringTree());
		
//		parser = parse("var v:Vector.<Foo> = new Vector.<Sprite>();");
//		t = tree(parser.statement());
//		result = t.toStringTree();
//		x = xml(t);
		
		
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>Vector</IDENT><TYPE_POSTFIX>
		// <IDENT>Foo</IDENT></TYPE_POSTFIX></QNAME></TYPE></TYPE_SPEC></IDENT></VAR>
//		assertEquals("(var (v (: (TYPE (QNAME Vector (TYPE_POSTFIX Foo))))))", 
//			tree(parser.statement()).toStringTree());
	}
	
	
	[Test]
	public function test_annotations():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("[Annotation(true,foo,foo.bar)] include 'me.as';");
//		t = tree(parser.annotations());
		result = t.toStringTree();
		x = xml(t);
		
		// <ANNOTATIONS><ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS>
		// <TRUE>true</TRUE><TYPE><QNAME><IDENT>foo</IDENT></QNAME></TYPE><TYPE>
		// <QNAME><IDENT>foo</IDENT><IDENT>bar</IDENT></QNAME></TYPE></ANNOTATION_PARAMS>
		// </ANNOTATION><INCLUDE><STRING_LITERAL>'me.as'</STRING_LITERAL></INCLUDE></ANNOTATIONS>
		assertEquals("(ANNOTATIONS (ANNOTATION Annotation (ANNOTATION_PARAMS true " +
			"(TYPE (QNAME foo)) (TYPE (QNAME foo bar)))) (include 'me.as'))", result);
	}
	
	[Test]
	public function test_modifiers():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("public");
		t = tree(parser.modifiers());
		
		// <MODIFIERS><PUBLIC>public</PUBLIC></MODIFIERS>
		assertEquals("(MODIFIERS public)", t.toStringTree());
		
		parser = parse("public override");
		t = tree(parser.modifiers());
		result = t.toStringTree();
		x = xml(t);
		
		// <MODIFIERS><PUBLIC>public</PUBLIC><OVERRIDE>override</OVERRIDE></MODIFIERS>
		assertEquals("(MODIFIERS public override)", t.toStringTree());		
	}
	
	[Test]
	public function test_includeDirective():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		//------------------------------
		// ''
		parser = parse("include 'my/as/file.as';");
		t = tree(parser.includeDirective());
		
		// <INCLUDE><STRING_LITERAL>'my/as/file.as'</STRING_LITERAL></INCLUDE>
		assertEquals("(include 'my/as/file.as')", t.toStringTree());
		
		//------------------------------
		// ""
		parser = parse("include \"my/as/file.as\";");
		t = tree(parser.includeDirective());
		
		// <INCLUDE><STRING_LITERAL>"my/as/file.as"</STRING_LITERAL></INCLUDE>
		assertEquals("(include \"my/as/file.as\")", t.toStringTree());
	}
	
	[Test]
	public function test_annotation():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		//------------------------------
		// [Annotation]
		parser = parse("[Annotation]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT></ANNOTATION>
		assertEquals("(ANNOTATION Annotation)", t.toStringTree());
		
		//------------------------------
		// [Annotation(true)]
		parser = parse("[Annotation(true)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS>
		// <TRUE>true</TRUE></ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS true))", t.toStringTree());
		
		//------------------------------
		// [Annotation(arg="string")]
		parser = parse("[Annotation(arg0=\"string\")]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS><ASSIGN>
		// <IDENT>arg0</IDENT><STRING_LITERAL>"string"</STRING_LITERAL></ASSIGN>
		// </ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS (= arg0 \"string\")))", t.toStringTree());
		
		//------------------------------
		// [Annotation(42)]
		parser = parse("[Annotation(42)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS>
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL></ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS 42))", t.toStringTree());
		
		//------------------------------
		// [Annotation(foo.bar.baz)]
		parser = parse("[Annotation(foo.bar.baz)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS><TYPE><QNAME>
		// <IDENT>foo</IDENT><IDENT>bar</IDENT><IDENT>baz</IDENT></QNAME></TYPE>
		// </ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS (TYPE (QNAME foo bar baz))))", t.toStringTree());
		
		//------------------------------
		// [Annotation(arg0="string",arg1=42)]
		parser = parse("[Annotation(arg0=\"string\",arg1=42)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS><ASSIGN>
		// <IDENT>arg0</IDENT><STRING_LITERAL>"string"</STRING_LITERAL></ASSIGN>
		// <ASSIGN><IDENT>arg1</IDENT><DECIMAL_LITERAL>42</DECIMAL_LITERAL></ASSIGN>
		// </ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS (= arg0 \"string\") (= arg1 42)))", t.toStringTree());		
		
		//------------------------------
		// [Annotation(arg0="string",true,arg1=42)]
		parser = parse("[Annotation(arg0=\"string\",true,arg1=42)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS><ASSIGN>
		// <IDENT>arg0</IDENT><STRING_LITERAL>"string"</STRING_LITERAL></ASSIGN>
		// <TRUE>true</TRUE><ASSIGN><IDENT>arg1</IDENT><DECIMAL_LITERAL>42</DECIMAL_LITERAL>
		// </ASSIGN></ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS (= arg0 \"string\") true (= arg1 42)))", t.toStringTree());
		
		//------------------------------
		// [Annotation(arg0=foo.bar.baz)]
		parser = parse("[Annotation(arg0=foo.bar.baz)]");
		t = tree(parser.annotation());
		
		// <ANNOTATION><IDENT>Annotation</IDENT><ANNOTATION_PARAMS><ASSIGN>
		// <IDENT>arg0</IDENT><TYPE><QNAME><IDENT>foo</IDENT><IDENT>bar</IDENT>
		// <IDENT>baz</IDENT></QNAME></TYPE></ASSIGN></ANNOTATION_PARAMS></ANNOTATION>
		assertEquals("(ANNOTATION Annotation (ANNOTATION_PARAMS (= arg0 (TYPE (QNAME foo bar baz)))))", t.toStringTree());
	}
	
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
		t = tree(parser.typeExpression());
		
		// <TYPE_SPEC><TYPE><VOID>void</VOID></TYPE></TYPE_SPEC>
		// (: (TYPE void))
		assertEquals("(: (TYPE void))", t.toStringTree());
		
		//------------------------------
		// *
		parser = parse(":*");
		t = tree(parser.typeExpression());
		
		// <TYPE_SPEC><TYPE><STAR>*</STAR></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE *))", t.toStringTree());
		
		//------------------------------
		// String
		parser = parse(":String");
		t = tree(parser.typeExpression());
		
		// <TYPE_SPEC><TYPE><QNAME><IDENT>String</IDENT></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME String)))", t.toStringTree());
		
		//------------------------------
		// foo.bar.baz
		parser = parse(":foo.bar.baz");
		t = tree(parser.typeExpression());
		//result = t.toStringTree();
		//x = xml(t);
		
		// <TYPE_SPEC><TYPE><QNAME><IDENT>foo</IDENT><DOT>.</DOT><IDENT>bar</IDENT>
		// <DOT>.</DOT><IDENT>baz</IDENT></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME foo bar baz)))", t.toStringTree());		
		
		//------------------------------
		// Vector.<*>
		parser = parse(":Vector.<*>");
		t = tree(parser.typeExpression());
		
		// <TYPE_SPEC><TYPE><QNAME><IDENT>Vector</IDENT><TYPE_POSTFIX><STAR>*</STAR>
		// </TYPE_POSTFIX></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME Vector (TYPE_POSTFIX *))))", t.toStringTree());			
		
		//------------------------------
		// Vector.<String>
		parser = parse(":Vector.<String>");
		t = tree(parser.typeExpression());

		// <TYPE_SPEC><TYPE><QNAME><IDENT>String</IDENT></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME Vector (TYPE_POSTFIX String))))", t.toStringTree());	
		
		//------------------------------
		// Vector.<foo.bar.baz>
		parser = parse(":Vector.<foo.bar.baz>");
		t = tree(parser.typeExpression());
		result = t.toStringTree();
		x = xml(t);
		// <TYPE_SPEC><TYPE><QNAME><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>foo</IDENT><IDENT>bar</IDENT>
		// <IDENT>baz</IDENT></TYPE_POSTFIX></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME Vector (TYPE_POSTFIX foo bar baz))))", t.toStringTree());			
		
		//------------------------------
		// Vector.<Vector.<String>>
		parser = parse(":Vector.<Vector.<String>>");
		t = tree(parser.typeExpression());
		
		// <TYPE_SPEC><TYPE><QNAME><IDENT>Vector</IDENT><TYPE_POSTFIX>
		// <IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>String</IDENT>
		// </TYPE_POSTFIX></TYPE_POSTFIX></QNAME></TYPE></TYPE_SPEC>
		assertEquals("(: (TYPE (QNAME Vector (TYPE_POSTFIX Vector " +
			"(TYPE_POSTFIX String)))))", t.toStringTree());			
	
		//------------------------------
		// Vector.<Vector.<String>>
		parser = parse(":Vector.<Vector.<Vector.<String>>>");
		t = tree(parser.typeExpression());
		assertEquals("(: (TYPE (QNAME Vector (TYPE_POSTFIX Vector " +
			"(TYPE_POSTFIX Vector (TYPE_POSTFIX String))))))", t.toStringTree());
	}	
	
	[Test]
	public function test_importDirective():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("import foo;");
//		t = tree(parser.importDirective());
		
		//<IMPORT><QNAME_STAR><TYPE><QNAME><IDENT>foo</IDENT></QNAME></TYPE>
		//</QNAME_STAR></IMPORT>
		assertEquals("(import (QNAME_STAR (QNAME foo)))", t.toStringTree());
		
		parser = parse("import foo.bar;");
//		t = tree(parser.importDirective());
		
		//<IMPORT><QNAME_STAR><TYPE><QNAME><IDENT>foo</IDENT><IDENT>bar</IDENT>
		//</QNAME></TYPE></QNAME_STAR></IMPORT>
		assertEquals("(import (QNAME_STAR (QNAME foo bar)))", t.toStringTree());
		
		parser = parse("import foo.bar.baz.*;");
//		t = tree(parser.importDirective());
		result = t.toStringTree();
		
		// <IMPORT><QNAME_STAR><TYPE><QNAME><IDENT>foo</IDENT><IDENT>bar</IDENT>
		// <IDENT>baz</IDENT></QNAME></TYPE><STAR>*</STAR></QNAME_STAR></IMPORT>
		assertEquals("(import (QNAME_STAR (QNAME foo bar baz) *))", t.toStringTree());
	}	
	
	
	[Test]
	public function test_useNamspaceDirective():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("use namespace my_namespace;");
		t = tree(parser.useNamespaceDirective());
		
		// <USE><NAMESPACE>namespace</NAMESPACE><IDENT>my_namespace</IDENT></USE>
		assertEquals("(use namespace my_namespace)", t.toStringTree());
	}
	
	
	[Test]
	public function test_classDefinition():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("package {class Foo {}}");
		t = tree(parser.compilationUnit());
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF>
		// <ANNOTATIONS>ANNOTATIONS</ANNOTATIONS><MODIFIERS>MODIFIERS</MODIFIERS>
		// <IDENT>Foo</IDENT><TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF></BLOCK>
		// </PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF ANNOTATIONS MODIFIERS Foo TYPE_BLOCK))))", t.toStringTree());
	
		parser = parse("package {public final class Foo {}}");
		t = tree(parser.compilationUnit());
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF><ANNOTATIONS>ANNOTATIONS
		// </ANNOTATIONS><MODIFIERS><PUBLIC>public</PUBLIC><FINAL>final</FINAL>
		// </MODIFIERS><IDENT>Foo</IDENT><TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF>
		// </BLOCK></PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF " +
			"ANNOTATIONS (MODIFIERS public final) Foo TYPE_BLOCK))))", t.toStringTree());
		
		parser = parse("package {public class Foo extends Bar {}}");
		t = tree(parser.compilationUnit());
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF><ANNOTATIONS>ANNOTATIONS
		// </ANNOTATIONS><MODIFIERS><PUBLIC>public</PUBLIC></MODIFIERS>
		// <IDENT>Foo</IDENT><EXTENDS><TYPE><QNAME><IDENT>Bar</IDENT></QNAME>
		// </TYPE></EXTENDS><TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF></BLOCK>
		// </PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF " +
			"ANNOTATIONS (MODIFIERS public) Foo (extends (TYPE (QNAME Bar))) " +
			"TYPE_BLOCK))))", t.toStringTree());
		
		parser = parse("package {public class Foo extends foo.bar.Baz {}}");
		t = tree(parser.compilationUnit());
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF><ANNOTATIONS>ANNOTATIONS
		// </ANNOTATIONS><MODIFIERS><PUBLIC>public</PUBLIC></MODIFIERS>
		// <IDENT>Foo</IDENT><EXTENDS><TYPE><QNAME><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></QNAME></TYPE></EXTENDS>
		// <TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF></BLOCK></PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF ANNOTATIONS " +
			"(MODIFIERS public) Foo (extends (TYPE (QNAME foo bar Baz))) " +
			"TYPE_BLOCK))))", t.toStringTree());
	
		parser = parse("package {public class Foo extends Baz implements IBar {}}");
		t = tree(parser.compilationUnit());
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF><ANNOTATIONS>ANNOTATIONS
		// </ANNOTATIONS><MODIFIERS><PUBLIC>public</PUBLIC></MODIFIERS><IDENT>
		// Foo</IDENT><EXTENDS><TYPE><QNAME><IDENT>Baz</IDENT></QNAME></TYPE>
		// </EXTENDS><IMPLEMENTS><TYPE><QNAME><IDENT>IBar</IDENT></QNAME></TYPE>
		// </IMPLEMENTS><TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF></BLOCK>
		// </PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF ANNOTATIONS " +
			"(MODIFIERS public) Foo (extends (TYPE (QNAME Baz))) (implements " +
			"(TYPE (QNAME IBar))) TYPE_BLOCK))))", t.toStringTree());
		
		parser = parse("package {public class Foo extends Baz implements IBar, foo.bar.IBaz {}}");
		t = tree(parser.compilationUnit());
		result = t.toStringTree();
		x = xml(t);
		
		// <COMPILATION_UNIT><PACKAGE><BLOCK><CLASS_DEF><ANNOTATIONS>ANNOTATIONS
		// </ANNOTATIONS><MODIFIERS><PUBLIC>public</PUBLIC></MODIFIERS><IDENT>
		// Foo</IDENT><EXTENDS><TYPE><QNAME><IDENT>Baz</IDENT></QNAME></TYPE>
		// </EXTENDS><IMPLEMENTS><TYPE><QNAME><IDENT>IBar</IDENT></QNAME></TYPE>
		// <TYPE><QNAME><IDENT>foo</IDENT><IDENT>bar</IDENT><IDENT>IBaz</IDENT>
		// </QNAME></TYPE></IMPLEMENTS><TYPE_BLOCK>TYPE_BLOCK</TYPE_BLOCK></CLASS_DEF>
		// </BLOCK></PACKAGE></COMPILATION_UNIT>
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF ANNOTATIONS " +
			"(MODIFIERS public) Foo (extends (TYPE (QNAME Baz))) (implements " +
			"(TYPE (QNAME IBar)) (TYPE (QNAME foo bar IBaz))) TYPE_BLOCK))))", t.toStringTree());
	}
		
	
	private function xml(tree:LinkedListTree):String
	{
		return ASTUtils.convert(tree, false);
	}
	
	
	
	public static function tree(returnScope:ParserRuleReturnScope):LinkedListTree
	{
		return returnScope.tree as LinkedListTree;
	}
	
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