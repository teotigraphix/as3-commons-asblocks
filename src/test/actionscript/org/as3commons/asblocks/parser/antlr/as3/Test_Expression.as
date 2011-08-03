package org.as3commons.asblocks.parser.antlr.as3
{

import org.antlr.runtime.NoViableAltException;
import org.antlr.runtime.ParserRuleReturnScope;
import org.as3commons.asblocks.impl.ASTUtils;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.fail;

public class Test_Expression extends TestAS3ParserBase
{
	[Test]
	public function test_bug1():void
	{
		parser = ASTUtils.parse("a = a.b.c.d.e;");
		debug(parser.blockEntry());
		assertEquals("(COMPILATION_UNIT (package BLOCK))", 
				tree(parser.blockEntry()).toStringTree());
	}
	
	[Test]
	public function test_compilationUnit():void
	{
		parser = ASTUtils.parse("package { }");
		assertEquals("(COMPILATION_UNIT (package BLOCK))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) BLOCK))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { public class Baz { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(CLASS_DEF ANNOTATIONS (MODIFIERS public) Baz TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());	
		
		parser = ASTUtils.parse("package foo.bar { public class Baz extends Bar { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(CLASS_DEF ANNOTATIONS (MODIFIERS public) Baz (extends " +
				"(TYPE Bar)) TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { public class Baz extends Bar " +
				"implements IPod, foo.bar.IBaz { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(CLASS_DEF ANNOTATIONS (MODIFIERS public) Baz (extends " +
				"(TYPE Bar)) (implements (TYPE IPod) (TYPE foo bar IBaz)) " +
				"TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { public class Baz "
						+ "implements IPod, foo.bar.IBaz { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(CLASS_DEF ANNOTATIONS (MODIFIERS public) Baz (implements " +
				"(TYPE IPod) (TYPE foo bar IBaz)) TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { public interface IBaz { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(INTERFACE_DEF ANNOTATIONS (MODIFIERS public) IBaz TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		parser = ASTUtils.parse("package foo.bar { public interface IBaz " +
				"extends IGoo, IPod { } }");
		assertEquals("(COMPILATION_UNIT (package (TYPE foo bar) (BLOCK " +
				"(INTERFACE_DEF ANNOTATIONS (MODIFIERS public) IBaz (extends " +
				"(TYPE IGoo) (TYPE IPod)) TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
	}
	
	[Test]
	public function test_packageBlockEntry():void
	{
		// NAMESPACE_DEF
		parser = ASTUtils.parse("package { public namespace " +
				"outer_space = \"http//www.universe.com/42\"; }");
		assertEquals("(COMPILATION_UNIT (package (BLOCK (NAMESPACE_DEF " +
				"ANNOTATIONS (MODIFIERS public) namespace " +
				"outer_space \"http//www.universe.com/42\"))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		// CLASS_DEF
		parser = ASTUtils.parse("package { public class Foo { } } ");
		assertEquals("(COMPILATION_UNIT (package (BLOCK (CLASS_DEF " +
				"ANNOTATIONS (MODIFIERS public) Foo TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		// INTERFACE_DEF
		parser = ASTUtils.parse("package { public interface IFoo { } } ");
		assertEquals("(COMPILATION_UNIT (package (BLOCK (INTERFACE_DEF " +
				"ANNOTATIONS (MODIFIERS public) IFoo TYPE_BLOCK))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		// FUNCTION_DEF
		parser = ASTUtils.parse("package { public function packageFunction()" +
				":void { return; } } ");
		assertEquals("(COMPILATION_UNIT (package (BLOCK (FUNCTION_DEF " +
				"ANNOTATIONS (MODIFIERS public) packageFunction PARAMS " +
				"(: (TYPE void)) (BLOCK return)))))", 
				tree(parser.compilationUnit()).toStringTree());
		
		// VAR_DEF
		parser = ASTUtils.parse("package { public static const FOO:int = 42; }");
		assertEquals("(COMPILATION_UNIT (package (BLOCK (VAR_DEF ANNOTATIONS " +
				"(MODIFIERS public static) const (VAR_DEC FOO (: (TYPE int))) " +
				"(= 42)))))", 
				tree(parser.compilationUnit()).toStringTree());		
	}
	
	[Test]
	public function test_mxmlScriptUnit():void
	{
		parser = ASTUtils.parse(
				"import foo.Bar;" +
				"private var fox:Bax = new Bax();" +
				"public function runTests():void { var foo:Bar; }");
		assertEquals("(MXML_SCRIPT_UNIT (VAR_DEF (ANNOTATIONS (import " +
				"(TYPE foo Bar))) (MODIFIERS private) var (VAR_DEC fox (: " +
				"(TYPE Bax))) (= (FUNCTION_CALL (new Bax) ARGUMENTS))) " +
				"(FUNCTION_DEF ANNOTATIONS (MODIFIERS public) runTests " +
				"PARAMS (: (TYPE void)) (BLOCK (var (VAR_DEC foo (: " +
				"(TYPE Bar)))))))", tree(parser.mxmlScriptUnit()).toStringTree());
	}
	
	[Test]
	public function test_program():void
	{
		parser = ASTUtils.parse("var m = 1; if (true) { return; } function test(arg):foo.bar{}");
		assertEquals("(PROGRAM_UNIT (var (VAR_DEC m) (= 1)) (if (CONDITION true) " +
				"(BLOCK return)) (EXPR_STMNT (FUNC_DEF (PARAMS (PARAM arg)) " +
				"(: (TYPE foo bar)) BLOCK)))", 
				tree(parser.program()).toStringTree());
	}
	
	[Test]
	public function test_annotations():void
	{
		// annotations
		parser = ASTUtils.parse("[Foo]CONFIG::debug { import foo.Bar; }include " +
				"'my.as';use namespace outer_space;import foo.bar.*;");
		assertEquals("(ANNOTATIONS (METATAG Foo) (COMPILE_CONFIG (:: CONFIG " +
				"debug) (import (TYPE foo Bar))) (include 'my.as') (use " +
				"namespace outer_space) (import (TYPE foo bar) *))", 
				tree(parser.annotations()).toStringTree());
	}
	
	[Test]
	public function test_annotation():void
	{
		// conditionalBlockDirective
		parser = ASTUtils.parse("CONFIG::debug { import foo.Bar; }");
		assertEquals("(ANNOTATIONS (COMPILE_CONFIG (:: CONFIG debug) " +
				"(import (TYPE foo Bar))))", 
				tree(parser.annotations()).toStringTree());
		
		// metaTag
		parser = ASTUtils.parse("[Foo]");
		assertEquals("(ANNOTATIONS (METATAG Foo))", 
				tree(parser.annotations()).toStringTree());
		
		// includeDirective
		parser = ASTUtils.parse("include 'my.as';");
		assertEquals("(ANNOTATIONS (include 'my.as'))", 
				tree(parser.annotations()).toStringTree());
		
		// useNamespaceDirective
		parser = ASTUtils.parse("use namespace outer_space;");
		assertEquals("(ANNOTATIONS (use namespace outer_space))", 
				tree(parser.annotations()).toStringTree());
		
		// importDirective
		parser = ASTUtils.parse("import foo.bar.*;");
		assertEquals("(ANNOTATIONS (import (TYPE foo bar) *))", 
				tree(parser.annotations()).toStringTree());	
	}
	
	[Test]
	public function test_conditionalCompiler():void
	{
		// conditionalCompilerIdent
//		parser = ASTUtils.parse("CONFIG :: foo");
//		assertEquals("(:: CONFIG foo)", 
//				tree(parser.conditionalCompilerIdent()).toStringTree());
	}
	
	[Test]
	public function test_conditionalBlockDirective():void
	{
		// conditionalBlockDirective
//		parser = ASTUtils.parse("CONFIG :: foo { if (bar) { var foo:int = 42; } }");
//		assertEquals("(COMPILE_CONFIG (:: CONFIG foo) (if (CONDITION bar) " +
//				"(BLOCK (var (VAR_DEC foo (: (TYPE int))) (= 42)))))", 
//				tree(parser.conditionalBlockDirective()).toStringTree());
	}
	
	[Test]
	public function test_conditionalTypeDirective():void
	{
		// conditionalTypeDirective
//		parser = ASTUtils.parse("CONFIG :: foo { public var foo:int = 42; }");
//		assertEquals("(COMPILE_CONFIG (:: CONFIG foo) (VAR_DEF ANNOTATIONS " +
//				"(MODIFIERS public) var (VAR_DEC foo (: (TYPE int))) (= 42)))", 
//				tree(parser.conditionalTypeDirective()).toStringTree());
	}
	
	[Test]
	public function test_metaDirective():void
	{
		// metaDirective
		parser = ASTUtils.parse("[Foo]");
		assertEquals("(METATAG Foo)", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo()]");
		assertEquals("(METATAG Foo METATAG_PARAMS)", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(true)]");
		assertEquals("(METATAG Foo (METATAG_PARAMS true))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(42)]");
		assertEquals("(METATAG Foo (METATAG_PARAMS 42))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(\"bar\")]");
		assertEquals("(METATAG Foo (METATAG_PARAMS \"bar\"))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(foo.bar.baz)]");
		assertEquals("(METATAG Foo (METATAG_PARAMS (TYPE foo bar baz)))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(arg=true)]");
		assertEquals("(METATAG Foo (METATAG_PARAMS (= arg true)))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(arg=42)]");
		assertEquals("(METATAG Foo (METATAG_PARAMS (= arg 42)))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(arg=\"bar\")]");
		assertEquals("(METATAG Foo (METATAG_PARAMS (= arg \"bar\")))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(arg=foo.bar.baz]");
		assertEquals("(METATAG Foo (METATAG_PARAMS (= arg (TYPE foo bar baz))))", 
				tree(parser.metaDirective()).toStringTree());
		
		parser = ASTUtils.parse("[Foo(true,arg1=foo.bar.baz,42,arg2=\"bax\"," +
				"arg3=false,goo.boo.Bax,\"bar\"]");
		assertEquals("(METATAG Foo (METATAG_PARAMS true (= arg1 " +
				"(TYPE foo bar baz)) 42 (= arg2 \"bax\") (= arg3 false) " +
						"(TYPE goo boo Bax) \"bar\"))", 
				tree(parser.metaDirective()).toStringTree());
	}
	
	[Test]
	public function test_includeDirective():void
	{
		// includeDirective
		parser = ASTUtils.parse("include 'my.as';");
		assertEquals("(include 'my.as')", 
				tree(parser.includeDirective()).toStringTree());
		
		parser = ASTUtils.parse("include \"my.as\";");
		assertEquals("(include \"my.as\")", 
				tree(parser.includeDirective()).toStringTree());
	}
	
	[Test]
	public function test_importDirective():void
	{
		// importDirective
		parser = ASTUtils.parse("import Foo;");
		assertEquals("(import (TYPE Foo))", 
				tree(parser.importDirective()).toStringTree());
		
		parser = ASTUtils.parse("import baz.bar.Foo;");
		assertEquals("(import (TYPE baz bar Foo))", 
				tree(parser.importDirective()).toStringTree());
		
		parser = ASTUtils.parse("import baz.bar.*;");
		assertEquals("(import (TYPE baz bar) *)", 
				tree(parser.importDirective()).toStringTree());
	}
	
	[Test]
	public function test_useNamespaceDirective():void
	{
		// useNamespaceDirective
		parser = ASTUtils.parse("use namespace outer_space;");
		assertEquals("(use namespace outer_space)", 
				tree(parser.useNamespaceDirective()).toStringTree());
	}
	
	[Test]
	public function test_modifiers():void
	{
		// useNamespaceDirective
		parser = ASTUtils.parse("public final internal override private protected " +
				"public static native outer_space");
		// Notice how the namespace outer_space is just an IDENT
		// <MODIFIERS><PUBLIC>public</PUBLIC><FINAL>final</FINAL>
		// <INTERNAL>internal</INTERNAL><OVERRIDE>override</OVERRIDE>
		// <PRIVATE>private</PRIVATE><PROTECTED>protected</PROTECTED>
		// <PUBLIC>public</PUBLIC><STATIC>static</STATIC><NATIVE>native</NATIVE>
		// <IDENT>outer_space</IDENT></MODIFIERS>
		assertEquals("(MODIFIERS public final internal override private protected " +
				"public static native outer_space)", 
				tree(parser.modifiers()).toStringTree());
	}
	
	[Test]
	public function test_semi():void
	{
		// useNamespaceDirective
		parser = ASTUtils.parse("import foo\n\nimport bar;");
		assertEquals("(ANNOTATIONS (import (TYPE foo)) " +
				"(import (TYPE bar)))", 
				tree(parser.annotations()).toStringTree());

		// XXX this ) semi bug needs to be dealt with
		//parser = ASTUtils.parse("var e = new Foo()\n" +
		// "    e.target.dispatchEvent(cancelableEvent);");
		//assertEquals("", 
		//		tree(parser.annotations()).toStringTree());
	}
	
	public function _test_classDefinition():void
	{
		// tested in packageBlockEntry
	}
	
	[Test]
	public function test_classExtendsClause():void
	{
		parser = ASTUtils.parse("extends Foo");
		assertEquals("(extends (TYPE Foo))", 
				tree(parser.classExtendsClause()).toStringTree());
		
		parser = ASTUtils.parse("extends baz.bar.Foo");
		assertEquals("(extends (TYPE baz bar Foo))", 
				tree(parser.classExtendsClause()).toStringTree());
		
		parser = ASTUtils.parse("extends baz.bar.goo::Foo");
		assertEquals("(extends (TYPE baz bar (:: goo Foo)))", 
				tree(parser.classExtendsClause()).toStringTree());
		
		try
		{
			ASTUtils.parse("extends ").classExtendsClause();
			fail("classExtendsClause expected a type");
		}
		catch (e:NoViableAltException)
		{
		}
		//try
		//{
		//	ASTUtils.parse("extends Bar, Baz").classExtendsClause();
		//	fail("classExtendsClause cannot contain commas");
		//}
		//catch (NoViableAltException e)
		//{
		//}		
	}
	
	[Test]
	public function test_classImplementsClause():void
	{
		parser = ASTUtils.parse("implements IFoo");
		assertEquals("(implements (TYPE IFoo))", 
				tree(parser.classImplementsClause()).toStringTree());
		
		parser = ASTUtils.parse("implements IFoo, foo.bar.IBaz");
		assertEquals("(implements (TYPE IFoo) (TYPE foo bar IBaz))", 
				tree(parser.classImplementsClause()).toStringTree());
		
		parser = ASTUtils.parse("implements foo.bar.IBaz");
		assertEquals("(implements (TYPE foo bar IBaz))", 
				tree(parser.classImplementsClause()).toStringTree());
		
		parser = ASTUtils.parse("implements foo.bar.IBaz, IFoo, foo.bar::IBaz");
		assertEquals("(implements (TYPE foo bar IBaz) (TYPE IFoo) (TYPE foo " +
				"(:: bar IBaz)))", 
				tree(parser.classImplementsClause()).toStringTree());		
		
		try
		{
			ASTUtils.parse("implements ").classImplementsClause();
			fail("classImplementsClause expected a type");
		}
		catch (e:NoViableAltException)
		{
		}
	}
	
	public function _test_interfaceDefinition():void
	{
		// tested in packageBlockEntry
	}
	
	[Test]
	public function test_interfaceExtendsClause():void
	{
		parser = ASTUtils.parse("extends IFoo");
		assertEquals("(extends (TYPE IFoo))", 
				tree(parser.interfaceExtendsClause()).toStringTree());
		
		parser = ASTUtils.parse("extends IFoo, foo.IBar");
		assertEquals("(extends (TYPE IFoo) (TYPE foo IBar))", 
				tree(parser.interfaceExtendsClause()).toStringTree());
		
		parser = ASTUtils.parse("extends foo.bar::IFoo, foo.IBaz, IPod");
		assertEquals("(extends (TYPE foo (:: bar IFoo)) (TYPE foo IBaz) " +
				"(TYPE IPod))", 
				tree(parser.interfaceExtendsClause()).toStringTree());
	}
	
	[Test]
	public function test_typeBlock():void
	{
		parser = ASTUtils.parse("{}");
		assertEquals("TYPE_BLOCK", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{ public var foo:int = 42; }");
		assertEquals("(TYPE_BLOCK (VAR_DEF ANNOTATIONS (MODIFIERS public)" +
				" var (VAR_DEC foo (: (TYPE int))) (= 42)))", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{ protected function foo(arg:int):void { } }");
		assertEquals("(TYPE_BLOCK (METHOD_DEF ANNOTATIONS (MODIFIERS " +
				"protected) ACCESSOR_ROLE foo (PARAMS (PARAM arg (: " +
				"(TYPE int)))) (: (TYPE void)) BLOCK))", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{ protected namespace inner_space = \"http://mind.com\"; }");
		assertEquals("(TYPE_BLOCK (NAMESPACE_DEF ANNOTATIONS (MODIFIERS " +
				"protected) namespace inner_space \"http://mind.com\"))", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{[Foo]var i:int}");
		assertEquals("(TYPE_BLOCK (VAR_DEF (ANNOTATIONS (METATAG Foo)) MODIFIERS " +
				"var (VAR_DEC i (: (TYPE int)))))", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{{}}");
		assertEquals("(TYPE_BLOCK STATIC_BLOCK)", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{{Foo.init();}}");
		assertEquals("(TYPE_BLOCK (STATIC_BLOCK (EXPR_STMNT (FUNCTION_CALL " +
				"(FIELD_ACCESS Foo init) ARGUMENTS))))", 
				tree(parser.classTypeBlock()).toStringTree());
		
		parser = ASTUtils.parse("{CONFIG::debug{}}");
		assertEquals("(TYPE_BLOCK (COMPILE_CONFIG (:: CONFIG debug)))", 
				tree(parser.classTypeBlock()).toStringTree());		
		
		parser = ASTUtils.parse("{CONFIG::debug{public var debug:Boolean = true;}}");
		assertEquals("(TYPE_BLOCK (COMPILE_CONFIG (:: CONFIG debug) " +
				"(VAR_DEF ANNOTATIONS (MODIFIERS public) var (VAR_DEC debug " +
				"(: (TYPE Boolean))) (= true))))", 
				tree(parser.classTypeBlock()).toStringTree());		
	}
	
	[Test]
	public function test_block():void
	{
		parser = ASTUtils.parse("{}");
		assertEquals("BLOCK", 
				tree(parser.block()).toStringTree());
		
		parser = ASTUtils.parse("{if (true){}}");
		assertEquals("(BLOCK (if (CONDITION true) BLOCK))", 
				tree(parser.block()).toStringTree());
	}
	
	[Test]
	public function test_declarationStatement():void
	{
		parser = ASTUtils.parse("var a;");
		assertEquals("(var (VAR_DEC a))", 
				tree(parser.declarationStatement()).toStringTree());
		
		parser = ASTUtils.parse("const A;");
		assertEquals("(const (VAR_DEC A))", 
				tree(parser.declarationStatement()).toStringTree());
		
		parser = ASTUtils.parse("var a:int;");
		assertEquals("(var (VAR_DEC a (: (TYPE int))))", 
				tree(parser.declarationStatement()).toStringTree());	
		
		parser = ASTUtils.parse("const A:int;");
		assertEquals("(const (VAR_DEC A (: (TYPE int))))", 
				tree(parser.declarationStatement()).toStringTree());	
		
		parser = ASTUtils.parse("var a:int = 42;");
		assertEquals("(var (VAR_DEC a (: (TYPE int))) (= 42))", 
				tree(parser.declarationStatement()).toStringTree());	
		
		parser = ASTUtils.parse("const A:int = 42;");
		assertEquals("(const (VAR_DEC A (: (TYPE int))) (= 42))", 
				tree(parser.declarationStatement()).toStringTree());	
		
		parser = ASTUtils.parse("var a:int, b:String, c:Vector.<int>;");
		assertEquals("(var (VAR_DEC a (: (TYPE int))) (VAR_DEC b (: " +
				"(TYPE String))) (VAR_DEC c (: (TYPE Vector (TYPE_POSTFIX int)))))", 
				tree(parser.declarationStatement()).toStringTree());
		
		parser = ASTUtils.parse("var a:int, b:int, c:int = 0;");
		assertEquals("(var (VAR_DEC a (: (TYPE int))) (VAR_DEC b (: (TYPE int))) " +
				"(VAR_DEC c (: (TYPE int))) (= 0))", 
				tree(parser.declarationStatement()).toStringTree());		
	}
	
	[Test]
	public function test_emptyStatement():void
	{
		parser = ASTUtils.parse("var a;;");
		assertEquals("(var (VAR_DEC a))", 
				tree(parser.declarationStatement()).toStringTree());
	}
	
	[Test]
	public function test_expressionStatement():void
	{
		parser = ASTUtils.parse("a = 1, b = 2;");
		assertEquals("(EXPR_STMNT (= a 1) (= b 2))", 
				tree(parser.expressionStatement()).toStringTree());
	}
	
	[Test]
	public function test_ifStatement():void
	{
		parser = ASTUtils.parse("if (true) ;");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION></IF>
		assertEquals("(if (CONDITION true))", 
				tree(parser.ifStatement()).toStringTree());
		
		parser = ASTUtils.parse("if (true) { ; }");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK>BLOCK</BLOCK></IF>
		assertEquals("(if (CONDITION true) BLOCK)", 
				tree(parser.ifStatement()).toStringTree());
		
		parser = ASTUtils.parse("if (true) ; else ;");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><ELSE>else</ELSE></IF>
		assertEquals("(if (CONDITION true) else)", 
				tree(parser.ifStatement()).toStringTree());
		
		parser = ASTUtils.parse("if (true) { ; } else { ; }");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK>BLOCK</BLOCK>
		// <ELSE><BLOCK>BLOCK</BLOCK></ELSE></IF>
		assertEquals("(if (CONDITION true) BLOCK (else BLOCK))", 
				tree(parser.ifStatement()).toStringTree());
		
		parser = ASTUtils.parse("if (true) { ; } else if (false) { ; } else { ; }");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK>BLOCK</BLOCK><ELSE>
		// <IF><CONDITION><FALSE>false</FALSE></CONDITION><BLOCK>BLOCK</BLOCK>
		// <ELSE><BLOCK>BLOCK</BLOCK></ELSE></IF></ELSE></IF>
		assertEquals("(if (CONDITION true) BLOCK (else (if (CONDITION false) " +
				"BLOCK (else BLOCK))))", 
				tree(parser.ifStatement()).toStringTree());		
	}
	
	[Test]
	public function test_forEachStatement():void
	{
		parser = ASTUtils.parse("for each( foo in bar ) break;");
		// <FOR_EACH><IDENT>foo</IDENT><IDENT>bar</IDENT><BREAK>break</BREAK></FOR_EACH>
		assertEquals("(for foo bar break)", 
				tree(parser.forEachStatement()).toStringTree());
		
		parser = ASTUtils.parse("for each( var foo:Baz in bar ) break;");
		// <FOR_EACH><VAR><VAR_DEC><IDENT>foo</IDENT><TYPE_SPEC><TYPE><IDENT>Baz
		// </IDENT></TYPE></TYPE_SPEC></VAR_DEC></VAR><IDENT>bar</IDENT>
		// <BREAK>break</BREAK></FOR_EACH>
		assertEquals("(for (var (VAR_DEC foo (: (TYPE Baz)))) bar break)", 
				tree(parser.forEachStatement()).toStringTree());
		
		parser = ASTUtils.parse("for each( var foo:Baz in bar[goo] ) break;");
		// <FOR_EACH><VAR><VAR_DEC><IDENT>foo</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>Baz</IDENT></TYPE></TYPE_SPEC></VAR_DEC></VAR><ARRAY_ACCESS>
		// <IDENT>bar</IDENT><IDENT>goo</IDENT></ARRAY_ACCESS>
		// <BREAK>break</BREAK></FOR_EACH>
		assertEquals("(for (var (VAR_DEC foo (: (TYPE Baz)))) (ARRAY_ACCESS bar goo) break)", 
				tree(parser.forEachStatement()).toStringTree());
	}
	
	[Test]
	public function test_forInStatement():void
	{
		parser = ASTUtils.parse("for( foo in bar ) break;");
		// <FOR_IN><IDENT>foo</IDENT><IDENT>bar</IDENT><BREAK>break</BREAK></FOR_IN>
		assertEquals("(for foo bar break)", 
				tree(parser.forEachStatement()).toStringTree());
		
		parser = ASTUtils.parse("for( var foo:Baz in bar ) break;");
		// <FOR_IN><VAR><VAR_DEC><IDENT>foo</IDENT><TYPE_SPEC><TYPE><IDENT>Baz
		// </IDENT></TYPE></TYPE_SPEC></VAR_DEC></VAR><IDENT>bar</IDENT>
		// <BREAK>break</BREAK></FOR_IN>
		assertEquals("(for (var (VAR_DEC foo (: (TYPE Baz)))) bar break)", 
				tree(parser.forEachStatement()).toStringTree());
		
		parser = ASTUtils.parse("for( var foo:Baz in bar[goo] ) break;");
		// <FOR_IN><VAR><VAR_DEC><IDENT>foo</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>Baz</IDENT></TYPE></TYPE_SPEC></VAR_DEC></VAR><ARRAY_ACCESS>
		// <IDENT>bar</IDENT><IDENT>goo</IDENT></ARRAY_ACCESS>
		// <BREAK>break</BREAK></FOR_IN>
		assertEquals("(for (var (VAR_DEC foo (: (TYPE Baz)))) (ARRAY_ACCESS bar goo) break)", 
				tree(parser.forEachStatement()).toStringTree());
	}
	
	[Test]
	public function test_forStatement():void
	{
		parser = ASTUtils.parse("for( ; ; ) break;");
		// <FOR><FOR_INIT>FOR_INIT</FOR_INIT><FOR_CONDITION>FOR_CONDITION
		// </FOR_CONDITION><FOR_ITERATOR>FOR_ITERATOR</FOR_ITERATOR>
		// <BREAK>break</BREAK></FOR>
		assertEquals("(for FOR_INIT FOR_CONDITION FOR_ITERATOR break)", 
				tree(parser.forStatement()).toStringTree());
		
		parser = ASTUtils.parse("for( var i:int = 0; i < len; i++ ) break;");
		// <FOR><FOR_INIT><VAR><VAR_DEC><IDENT>i</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>int</IDENT></TYPE></TYPE_SPEC></VAR_DEC><ASSIGN><DECIMAL_LITERAL>
		// 0</DECIMAL_LITERAL></ASSIGN></VAR></FOR_INIT><FOR_CONDITION><LT><IDENT>
		// i</IDENT><IDENT>len</IDENT></LT></FOR_CONDITION><FOR_ITERATOR><POST_INC>
		// <IDENT>i</IDENT></POST_INC></FOR_ITERATOR><BREAK>break</BREAK></FOR>
		assertEquals("(for (FOR_INIT (var (VAR_DEC i (: (TYPE int))) (= 0))) " +
				"(FOR_CONDITION (< i len)) (FOR_ITERATOR (++ i)) break)", 
				tree(parser.forStatement()).toStringTree());
		
		parser = ASTUtils.parse("for( var i:ASTIterator = iterator(); i.hasNext(); ) break;");
		// <FOR><FOR_INIT><VAR><VAR_DEC><IDENT>i</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>ASTIterator</IDENT></TYPE></TYPE_SPEC></VAR_DEC><ASSIGN>
		// <FUNCTION_CALL><IDENT>iterator</IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS>
		// </FUNCTION_CALL></ASSIGN></VAR></FOR_INIT><FOR_CONDITION><FUNCTION_CALL>
		// <FIELD_ACCESS><IDENT>i</IDENT><IDENT>hasNext</IDENT></FIELD_ACCESS>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL></FOR_CONDITION>
		// <FOR_ITERATOR>FOR_ITERATOR</FOR_ITERATOR><BREAK>break</BREAK></FOR>
		assertEquals("(for (FOR_INIT (var (VAR_DEC i (: (TYPE ASTIterator))) (= " +
				"(FUNCTION_CALL iterator ARGUMENTS)))) (FOR_CONDITION (FUNCTION_CALL " +
				"(FIELD_ACCESS i hasNext) ARGUMENTS)) FOR_ITERATOR break)", 
				tree(parser.forStatement()).toStringTree());
	}
	
	[Test]
	public function test_whileStatement():void
	{
		parser = ASTUtils.parse("while( i++ ) ;");
		// <WHILE><CONDITION><POST_INC><IDENT>i</IDENT></POST_INC></CONDITION></WHILE>
		assertEquals("(while (CONDITION (++ i)))", 
				tree(parser.whileStatement()).toStringTree());
		
		parser = ASTUtils.parse("while( i++ ) { }");
		// <WHILE><CONDITION><POST_INC><IDENT>i</IDENT></POST_INC></CONDITION>
		// <BLOCK>BLOCK</BLOCK></WHILE>
		assertEquals("(while (CONDITION (++ i)) BLOCK)", 
				tree(parser.whileStatement()).toStringTree());
		
		parser = ASTUtils.parse("while( i++ ) trace( i );");
		// <WHILE><CONDITION><POST_INC><IDENT>i</IDENT></POST_INC></CONDITION>
		// <EXPR_STMNT><FUNCTION_CALL><IDENT>trace</IDENT><ARGUMENTS><IDENT>i
		// </IDENT></ARGUMENTS></FUNCTION_CALL></EXPR_STMNT></WHILE>
		assertEquals("(while (CONDITION (++ i)) (EXPR_STMNT (FUNCTION_CALL " +
				"trace (ARGUMENTS i))))", 
				tree(parser.whileStatement()).toStringTree());
		
		parser = ASTUtils.parse("while( i.hasNext() );");
		// <WHILE><CONDITION><FUNCTION_CALL><FIELD_ACCESS><IDENT>i</IDENT><IDENT>
		// hasNext</IDENT></FIELD_ACCESS><ARGUMENTS>ARGUMENTS</ARGUMENTS>
		// </FUNCTION_CALL></CONDITION></WHILE>
		assertEquals("(while (CONDITION (FUNCTION_CALL (FIELD_ACCESS i " +
				"hasNext) ARGUMENTS)))", 
				tree(parser.whileStatement()).toStringTree());
	}
	
	[Test]
	public function test_doWhileStatement():void
	{
		parser = ASTUtils.parse("do ; while( i++ );");
		// <DO><CONDITION><POST_INC><IDENT>i</IDENT></POST_INC></CONDITION></DO>
		assertEquals("(do (CONDITION (++ i)))", 
				tree(parser.doWhileStatement()).toStringTree());
		
		parser = ASTUtils.parse("do trace( i ); while( i++ );");
		// <DO><EXPR_STMNT><FUNCTION_CALL><IDENT>trace</IDENT><ARGUMENTS>
		// <IDENT>i</IDENT></ARGUMENTS></FUNCTION_CALL></EXPR_STMNT><CONDITION>
		// <POST_INC><IDENT>i</IDENT></POST_INC></CONDITION></DO>
		assertEquals("(do (EXPR_STMNT (FUNCTION_CALL trace (ARGUMENTS i))) " +
				"(CONDITION (++ i)))", 
				tree(parser.doWhileStatement()).toStringTree());
		
		parser = ASTUtils.parse("do{ trace( i ); } while( i++ );");
		// <DO><BLOCK><EXPR_STMNT><FUNCTION_CALL><IDENT>trace</IDENT><ARGUMENTS>
		// <IDENT>i</IDENT></ARGUMENTS></FUNCTION_CALL></EXPR_STMNT></BLOCK>
		// <CONDITION><POST_INC><IDENT>i</IDENT></POST_INC></CONDITION></DO>
		assertEquals("(do (BLOCK (EXPR_STMNT (FUNCTION_CALL trace (ARGUMENTS i)))) " +
				"(CONDITION (++ i)))", 
				tree(parser.doWhileStatement()).toStringTree());
	}
	
	[Test]
	public function test_continueStatement():void
	{
		parser = ASTUtils.parse("continue;");
		// <CONTINUE>continue</CONTINUE>
		assertEquals("continue", 
				tree(parser.continueStatement()).toStringTree());
		
		parser = ASTUtils.parse("continue loop1;");
		// <CONTINUE><IDENT>loop1</IDENT></CONTINUE>
		assertEquals("(continue loop1)", 
				tree(parser.continueStatement()).toStringTree());
	}
	
	[Test]
	public function test_breakStatement():void
	{
		parser = ASTUtils.parse("break;");
		// <BREAK>continue</BREAK>
		assertEquals("break", 
				tree(parser.breakStatement()).toStringTree());
		
		parser = ASTUtils.parse("break loop1;");
		// <BREAK><IDENT>loop1</IDENT></BREAK>
		assertEquals("(break loop1)", 
				tree(parser.breakStatement()).toStringTree());
	}
	
	[Test]
	public function test_returnStatement():void
	{
		parser = ASTUtils.parse("return;");
		// <RETURN>return</RETURN>
		assertEquals("return", 
				tree(parser.returnStatement()).toStringTree());
		
		parser = ASTUtils.parse("return foo;");
		// <RETURN><IDENT>foo</IDENT></RETURN>
		assertEquals("(return foo)", 
				tree(parser.returnStatement()).toStringTree());
		
		parser = ASTUtils.parse("return function():int{return bar[ff]};");
		// <RETURN><FUNC_DEF><PARAMS>PARAMS</PARAMS><TYPE_SPEC><TYPE><IDENT>
		// int</IDENT></TYPE></TYPE_SPEC><BLOCK><RETURN><ARRAY_ACCESS><IDENT>
		// bar</IDENT><IDENT>ff</IDENT></ARRAY_ACCESS></RETURN></BLOCK>
		// </FUNC_DEF></RETURN>
		assertEquals("(return (FUNC_DEF PARAMS (: (TYPE int)) (BLOCK (return " +
				"(ARRAY_ACCESS bar ff)))))", 
				tree(parser.returnStatement()).toStringTree());		
	}
	
	[Test]
	public function test_withStatement():void
	{
		parser = ASTUtils.parse("with ( foo ) ;");
		// <WITH><CONDITION><IDENT>foo</IDENT></CONDITION></WITH>
		assertEquals("(with (CONDITION foo))", 
				tree(parser.withStatement()).toStringTree());
		
		parser = ASTUtils.parse("with ( foo[1].bar ) {}");
		// <WITH><CONDITION><FIELD_ACCESS><ARRAY_ACCESS><IDENT>foo</IDENT>
		// <DECIMAL_LITERAL>1</DECIMAL_LITERAL></ARRAY_ACCESS><IDENT>bar</IDENT>
		// </FIELD_ACCESS></CONDITION><BLOCK>BLOCK</BLOCK></WITH>
		assertEquals("(with (CONDITION (FIELD_ACCESS (ARRAY_ACCESS foo 1) " +
				"bar)) BLOCK)", 
				tree(parser.withStatement()).toStringTree());
		
		parser = ASTUtils.parse("with ( bar ) { y = 50; x = 50; }");
		// <WITH><CONDITION><IDENT>bar</IDENT></CONDITION><BLOCK><EXPR_STMNT>
		// <ASSIGN><IDENT>y</IDENT><DECIMAL_LITERAL>50</DECIMAL_LITERAL></ASSIGN>
		// </EXPR_STMNT><EXPR_STMNT><ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>50
		// </DECIMAL_LITERAL></ASSIGN></EXPR_STMNT></BLOCK></WITH>
		assertEquals("(with (CONDITION bar) (BLOCK (EXPR_STMNT (= y 50)) " +
				"(EXPR_STMNT (= x 50))))", 
				tree(parser.withStatement()).toStringTree());		
	}
	
	[Test]
	public function test_labelledStatement():void
	{
		parser = ASTUtils.parse("foo : { }");
		// <LABEL_STMNT><IDENT>foo</IDENT><BLOCK>BLOCK</BLOCK></LABEL_STMNT>
		assertEquals("(LABEL_STMNT foo BLOCK)", 
				tree(parser.labelStatement()).toStringTree());
		
		parser = ASTUtils.parse("foo : if (true) {}");
		// <LABEL_STMNT><IDENT>foo</IDENT><IF><CONDITION><TRUE>true</TRUE></CONDITION>
		// <BLOCK>BLOCK</BLOCK></IF></LABEL_STMNT>
		assertEquals("(LABEL_STMNT foo (if (CONDITION true) BLOCK))", 
				tree(parser.labelStatement()).toStringTree());
		
		parser = ASTUtils.parse("foo : for ( ;; ) { }");
		// <LABEL_STMNT><IDENT>foo</IDENT><FOR><FOR_INIT>FOR_INIT</FOR_INIT>
		// <FOR_CONDITION>FOR_CONDITION</FOR_CONDITION><FOR_ITERATOR>FOR_ITERATOR
		// </FOR_ITERATOR><BLOCK>BLOCK</BLOCK></FOR></LABEL_STMNT>
		assertEquals("(LABEL_STMNT foo (for FOR_INIT FOR_CONDITION FOR_ITERATOR BLOCK))", 
				tree(parser.labelStatement()).toStringTree());
		
		parser = ASTUtils.parse("foo : { bar : { } }");
		// <LABEL_STMNT><IDENT>foo</IDENT><BLOCK><LABEL_STMNT><IDENT>bar</IDENT>
		// <BLOCK>BLOCK</BLOCK></LABEL_STMNT></BLOCK></LABEL_STMNT>
		assertEquals("(LABEL_STMNT foo (BLOCK (LABEL_STMNT bar BLOCK)))", 
				tree(parser.labelStatement()).toStringTree());	
	}
	
	[Test]
	public function test_switchStatement():void
	{
		parser = ASTUtils.parse("switch( m ) { case 1 : break; }");
		// <SWITCH><CONDITION><IDENT>m</IDENT></CONDITION><BLOCK><CASE>
		// <DECIMAL_LITERAL>1</DECIMAL_LITERAL><SWITCH_STATEMENT_LIST><BREAK>break
		// </BREAK></SWITCH_STATEMENT_LIST></CASE></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION m) (BLOCK (case 1 " +
				"(SWITCH_STATEMENT_LIST break))))", 
				tree(parser.switchStatement()).toStringTree());
		
		parser = ASTUtils.parse("switch( m ) { case 1 : break; default: }");
		// <SWITCH><CONDITION><IDENT>m</IDENT></CONDITION><BLOCK><CASE><DECIMAL_LITERAL>
		// 1</DECIMAL_LITERAL><SWITCH_STATEMENT_LIST><BREAK>break</BREAK>
		// </SWITCH_STATEMENT_LIST></CASE><DEFAULT><SWITCH_STATEMENT_LIST>
		// SWITCH_STATEMENT_LIST</SWITCH_STATEMENT_LIST></DEFAULT></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION m) (BLOCK (case 1 (SWITCH_STATEMENT_LIST " +
				"break)) (default SWITCH_STATEMENT_LIST)))", 
				tree(parser.switchStatement()).toStringTree());
		
		parser = ASTUtils.parse("switch( ms ) { case Foo.BAR : break; default: foo(); }");
		// <SWITCH><CONDITION><IDENT>ms</IDENT></CONDITION><BLOCK><CASE><FIELD_ACCESS>
		// <IDENT>Foo</IDENT><IDENT>BAR</IDENT></FIELD_ACCESS><SWITCH_STATEMENT_LIST>
		// <BREAK>break</BREAK></SWITCH_STATEMENT_LIST></CASE><DEFAULT><SWITCH_STATEMENT_LIST>
		// <EXPR_STMNT><FUNCTION_CALL><IDENT>foo</IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS>
		// </FUNCTION_CALL></EXPR_STMNT></SWITCH_STATEMENT_LIST></DEFAULT></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION ms) (BLOCK (case (FIELD_ACCESS Foo BAR) " +
				"(SWITCH_STATEMENT_LIST break)) (default (SWITCH_STATEMENT_LIST " +
				"(EXPR_STMNT (FUNCTION_CALL foo ARGUMENTS))))))", 
				tree(parser.switchStatement()).toStringTree());
		
		parser = ASTUtils.parse("switch( mjs ) { case Foo.BAR : case 42: break; default: ; }");
		// <SWITCH><CONDITION><IDENT>mjs</IDENT></CONDITION><BLOCK><CASE><FIELD_ACCESS>
		// <IDENT>Foo</IDENT><IDENT>BAR</IDENT></FIELD_ACCESS><SWITCH_STATEMENT_LIST>
		// SWITCH_STATEMENT_LIST</SWITCH_STATEMENT_LIST></CASE><CASE><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL><SWITCH_STATEMENT_LIST><BREAK>break</BREAK></SWITCH_STATEMENT_LIST>
		// </CASE><DEFAULT><SWITCH_STATEMENT_LIST>SWITCH_STATEMENT_LIST</SWITCH_STATEMENT_LIST>
		// </DEFAULT></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION mjs) (BLOCK (case (FIELD_ACCESS Foo BAR) " +
				"SWITCH_STATEMENT_LIST) (case 42 (SWITCH_STATEMENT_LIST break)) " +
				"(default SWITCH_STATEMENT_LIST)))", 
				tree(parser.switchStatement()).toStringTree());
		
		parser = ASTUtils.parse("switch( jms ) { case 1 : { break; } default { ; } }");
		// <SWITCH><CONDITION><IDENT>jms</IDENT></CONDITION><BLOCK><CASE>
		// <DECIMAL_LITERAL>1</DECIMAL_LITERAL><SWITCH_STATEMENT_LIST><BLOCK>
		// <BREAK>break</BREAK></BLOCK></SWITCH_STATEMENT_LIST></CASE><DEFAULT>
		// <SWITCH_STATEMENT_LIST><BLOCK>BLOCK</BLOCK></SWITCH_STATEMENT_LIST>
		// </DEFAULT></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION jms) (BLOCK (case 1 (SWITCH_STATEMENT_LIST " +
				"(BLOCK break))) (default (SWITCH_STATEMENT_LIST BLOCK))))", 
				tree(parser.switchStatement()).toStringTree());
	}
	
	[Test]
	public function test_throwStatement():void
	{
		parser = ASTUtils.parse("throw e;");
		// <THROW><IDENT>e</IDENT></THROW>
		assertEquals("(throw e)", 
				tree(parser.throwStatement()).toStringTree());
		
		parser = ASTUtils.parse("throw new Error('bang!');");
		// <THROW><FUNCTION_CALL><NEW><IDENT>Error</IDENT></NEW><ARGUMENTS>
		// <STRING_LITERAL>'bang!'</STRING_LITERAL></ARGUMENTS></FUNCTION_CALL></THROW>
		assertEquals("(throw (FUNCTION_CALL (new Error) (ARGUMENTS 'bang!')))", 
				tree(parser.throwStatement()).toStringTree());
		
		parser = ASTUtils.parse("throw error.doYourThing(e);");
		// <THROW><FUNCTION_CALL><FIELD_ACCESS><IDENT>error</IDENT><IDENT>
		// doYourThing</IDENT></FIELD_ACCESS><ARGUMENTS><IDENT>e</IDENT>
		// </ARGUMENTS></FUNCTION_CALL></THROW>
		assertEquals("(throw (FUNCTION_CALL (FIELD_ACCESS error doYourThing) " +
				"(ARGUMENTS e)))", 
				tree(parser.throwStatement()).toStringTree());
	}
	
	[Test]
	public function test_tryStatement():void
	{
		parser = ASTUtils.parse("try { } finally { trace( true ); }");
		// <TRY><BLOCK>BLOCK</BLOCK><FINALLY><BLOCK><EXPR_STMNT><FUNCTION_CALL>
		// <IDENT>trace</IDENT><ARGUMENTS><TRUE>true</TRUE></ARGUMENTS>
		// </FUNCTION_CALL></EXPR_STMNT></BLOCK></FINALLY></TRY>
		assertEquals("(try BLOCK (finally (BLOCK (EXPR_STMNT (FUNCTION_CALL " +
				"trace (ARGUMENTS true))))))", 
				tree(parser.tryStatement()).toStringTree());
		
		parser = ASTUtils.parse("try { } catch( e : FooError ) { trace( true ); }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>FooError</IDENT></TYPE></TYPE_SPEC><BLOCK><EXPR_STMNT>
		// <FUNCTION_CALL><IDENT>trace</IDENT><ARGUMENTS><TRUE>true</TRUE>
		// </ARGUMENTS></FUNCTION_CALL></EXPR_STMNT></BLOCK></CATCH></TRY>
		assertEquals("(try BLOCK (catch e (: (TYPE FooError)) (BLOCK (EXPR_STMNT " +
				"(FUNCTION_CALL trace (ARGUMENTS true))))))", 
				tree(parser.tryStatement()).toStringTree());
		
		parser = ASTUtils.parse("try { } catch ( e : FooError ) { } finally { }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>FooError</IDENT></TYPE></TYPE_SPEC><BLOCK>BLOCK</BLOCK>
		// </CATCH><FINALLY><BLOCK>BLOCK</BLOCK></FINALLY></TRY>
		assertEquals("(try BLOCK (catch e (: (TYPE FooError)) BLOCK) (finally BLOCK))", 
				tree(parser.tryStatement()).toStringTree());
		
		parser = ASTUtils.parse("try { } catch ( e1 : FooError ) { } " +
				"catch ( e2 : BarError ) { } finally { }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e1</IDENT><TYPE_SPEC>
		// <TYPE><IDENT>FooError</IDENT></TYPE></TYPE_SPEC><BLOCK>BLOCK</BLOCK>
		// </CATCH><CATCH><IDENT>e2</IDENT><TYPE_SPEC><TYPE><IDENT>BarError</IDENT>
		// </TYPE></TYPE_SPEC><BLOCK>BLOCK</BLOCK></CATCH><FINALLY><BLOCK>BLOCK</BLOCK>
		// </FINALLY></TRY>
		assertEquals("(try BLOCK (catch e1 (: (TYPE FooError)) BLOCK) (catch e2 " +
				"(: (TYPE BarError)) BLOCK) (finally BLOCK))", 
				tree(parser.tryStatement()).toStringTree());
	}
	
	[Test]
	public function test_defaultXMLNamespaceStatement():void
	{
		//parser = ASTUtils.parse("default xml namespace = \"http://the.universe.com/420\";");
		//debug(parser.defaultXMLNamespaceStatement());
		//assertEquals("(try BLOCK (finally (BLOCK (EXPR_STMNT (FUNCTION_CALL " +
		//		"trace (ARGUMENTS true))))))", 
		//		tree(parser.defaultXMLNamespaceStatement()).toStringTree());	
	}
	
	// Test_Expression
	
	/**
	 * Level 13
	 * @throws RecognitionException 
	 */
	[Test]
	public function test_assignmentExpression():void
	{
		parser = parse("x=1");
		// <ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></ASSIGN>
		assertEquals("(= x 1)", tree(parser.expression()).toStringTree());		
		
		parser = parse("x*=1");
		// <STAR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></STAR_ASSIGN>
		assertEquals("(*= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x/=1");
		// <DIV_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></DIV_ASSIGN>
		assertEquals("(/= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x%=1");
		// <MOD_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></MOD_ASSIGN>
		assertEquals("(%= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x+=1");
		// <PLUS_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></PLUS_ASSIGN>
		assertEquals("(+= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x-=1");
		// <MINUS_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></MINUS_ASSIGN>
		assertEquals("(-= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x<<=1");
		// <SL_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></SL_ASSIGN>
		assertEquals("(<<= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x>>=1");	
		// <SR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></SR_ASSIGN>
		assertEquals("(>>= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x>>>=1");
		// <BSR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></BSR_ASSIGN>
		assertEquals("(>>>= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x&=1");
		// <BAND_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></BAND_ASSIGN>
		assertEquals("(&= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x^=1");
		// <BXOR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></BXOR_ASSIGN>
		assertEquals("(^= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x|=1");
		// <BOR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></BOR_ASSIGN>
		assertEquals("(|= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x&&=1");
		// <LAND_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></LAND_ASSIGN>
		assertEquals("(&&= x 1)", tree(parser.expression()).toStringTree());
		
		parser = parse("x||=1");
		// <LOR_ASSIGN><IDENT>x</IDENT><DECIMAL_LITERAL>1</DECIMAL_LITERAL></LOR_ASSIGN>
		assertEquals("(||= x 1)", tree(parser.expression()).toStringTree());
	}
	
	
	/**
	 * Level 12
	 * @throws RecognitionException 
	 */
	[Test]
	public function test_conditionalExpression():void
	{
		parser = parse("true?5:6");
		// <QUESTION><TRUE>true</TRUE><DECIMAL_LITERAL>5</DECIMAL_LITERAL>
		// <DECIMAL_LITERAL>6</DECIMAL_LITERAL></QUESTION>
		assertEquals("(? true 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 11
	 * @throws RecognitionException 
	 */
	 [Test]
	public function testOrExpression():void
	{
		parser = parse("5||6");
		// <LOR><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></LOR>
		assertEquals("(|| 5 6)", tree(parser.expression()).toStringTree());
	}

	/**
	 * Level 10
	 * @throws RecognitionException 
	 */
	[Test]
	public function testAndExpression():void
	{
		parser = parse("5&&6");
		// <LAND><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></LAND>
		assertEquals("(&& 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 9
	 * @throws RecognitionException 
	 */
	[Test]
	public function testBitwiseOrExpression():void
	{
		parser = parse("5|6");
		// <BOR><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></BOR>
		assertEquals("(| 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 8
	 * @throws RecognitionException 
	 */
	[Test]
	public function testBitwiseXorExpression():void
	{
		parser = parse("5^6");
		// <BXOR><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></BXOR>
		assertEquals("(^ 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 7
	 * @throws RecognitionException 
	 */
	[Test]
	public function testBitwiseAndExpression():void
	{
		parser = parse("5&&6");
		// <LAND><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></LAND>
		assertEquals("(&& 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 6
	 * @throws RecognitionException 
	 */
	[Test]
	public function testEqualityExpression():void
	{
		parser = parse("5==5");
		// <EQUAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL></EQUAL>
		assertEquals("(== 5 5)", tree(parser.expression()).toStringTree());
		
		parser = parse("5!=5");
		// <NOT_EQUAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL></NOT_EQUAL>
		assertEquals("(!= 5 5)", tree(parser.expression()).toStringTree());
		
		parser = parse("5===5");
		// <STRICT_EQUAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL></STRICT_EQUAL>
		assertEquals("(=== 5 5)", tree(parser.expression()).toStringTree());
		
		parser = parse("5!==5");
		// <STRICT_NOT_EQUAL><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>5
		// </DECIMAL_LITERAL></STRICT_NOT_EQUAL>
		assertEquals("(!== 5 5)", tree(parser.expression()).toStringTree());

	}
	
	/**
	 * Level 5
	 * @throws RecognitionException 
	 */
	[Test]
	public function testRelationalExpression():void
	{
		parser = parse("'a' in obj");
		// <IN><STRING_LITERAL>'a'</STRING_LITERAL><IDENT>obj</IDENT></IN>
		assertEquals("(in 'a' obj)", tree(parser.expression()).toStringTree());
		
		parser = parse("4<2");
		// <LT><DECIMAL_LITERAL>4</DECIMAL_LITERAL><DECIMAL_LITERAL>2</DECIMAL_LITERAL></LT>
		assertEquals("(< 4 2)", tree(parser.expression()).toStringTree());
		
		parser = parse("4<=2");
		// <LE><DECIMAL_LITERAL>4</DECIMAL_LITERAL><DECIMAL_LITERAL>2</DECIMAL_LITERAL></LE>
		assertEquals("(<= 4 2)", tree(parser.expression()).toStringTree());
		
		parser = parse("4>2");
		// <GT><DECIMAL_LITERAL>4</DECIMAL_LITERAL><DECIMAL_LITERAL>2</DECIMAL_LITERAL></GT>
		assertEquals("(> 4 2)", tree(parser.expression()).toStringTree());
		
		parser = parse("4>=2");
		// <GE><DECIMAL_LITERAL>4</DECIMAL_LITERAL><DECIMAL_LITERAL>2</DECIMAL_LITERAL></GE>
		assertEquals("(>= 4 2)", tree(parser.expression()).toStringTree());
		
		parser = parse("obj is Class");
		// <IS><IDENT>obj</IDENT><IDENT>Class</IDENT></IS>
		assertEquals("(is obj Class)", tree(parser.expression()).toStringTree());
		
		parser = parse("obj is foo.bar.Baz");
		// <IS><IDENT>obj</IDENT><FIELD_ACCESS><FIELD_ACCESS><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></FIELD_ACCESS><IDENT>Baz</IDENT></FIELD_ACCESS></IS>
		assertEquals("(is obj (FIELD_ACCESS (FIELD_ACCESS foo bar) Baz))", tree(parser.expression()).toStringTree());
		
		parser = parse("obj as Class");
		// <AS><IDENT>obj</IDENT><IDENT>Class</IDENT></AS>
		assertEquals("(as obj Class)", tree(parser.expression()).toStringTree());
		
		parser = parse("obj as foo.bar.Baz");
		// <AS><IDENT>obj</IDENT><FIELD_ACCESS><FIELD_ACCESS><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></FIELD_ACCESS><IDENT>Baz</IDENT></FIELD_ACCESS></AS>
		assertEquals("(as obj (FIELD_ACCESS (FIELD_ACCESS foo bar) Baz))", tree(parser.expression()).toStringTree());
		
		parser = parse("obj instanceof Baz");
		// <INSTANCEOF><IDENT>obj</IDENT><IDENT>Baz</IDENT></INSTANCEOF>
		assertEquals("(instanceof obj Baz)", tree(parser.expression()).toStringTree());
		
		parser = parse("obj instanceof foo.bar.Baz");
		// <INSTANCEOF><IDENT>obj</IDENT><PROPERTY_OR_IDENTIFIER><PROPERTY_OR_IDENTIFIER>
		// <IDENT>foo</IDENT><IDENT>bar</IDENT></PROPERTY_OR_IDENTIFIER><IDENT>Baz</IDENT>
		// </PROPERTY_OR_IDENTIFIER></INSTANCEOF>
		assertEquals("(instanceof obj (FIELD_ACCESS (FIELD_ACCESS foo bar) Baz))", 
				tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 4
	 * @throws RecognitionException 
	 */
	[Test]
	public function testShiftExpression():void
	{
		parser = parse("5<<6");
		// <SL><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></SL>
		assertEquals("(<< 5 6)", tree(parser.expression()).toStringTree());
		
		parser = parse("5>>6");	
		// <SR><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></SR>
		assertEquals("(>> 5 6)", tree(parser.expression()).toStringTree());
		
		parser = parse("5>>>6");
		// <BSR><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></BSR>
		assertEquals("(>>> 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 3
	 * @throws RecognitionException 
	 */
	[Test]
	public function testAdditiveExpression():void
	{
		parser = parse("5+6");
		// <PLUS><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></PLUS>
		assertEquals("(+ 5 6)", tree(parser.expression()).toStringTree());
		
		parser = parse("5-6");
		// <MINUS><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></MINUS>
		assertEquals("(- 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 2
	 * @throws RecognitionException 
	 */
	[Test]
	public function testMultiplicativeExpression():void
	{
		parser = parse("5*6");
		// <MULT><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></MULT>
		assertEquals("(* 5 6)", tree(parser.expression()).toStringTree());
		
		parser = parse("5/6");
		// <DIV><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></DIV>
		assertEquals("(/ 5 6)", tree(parser.expression()).toStringTree());
		
		parser = parse("5%6");
		// <MOD><DECIMAL_LITERAL>5</DECIMAL_LITERAL><DECIMAL_LITERAL>6</DECIMAL_LITERAL></MOD>
		assertEquals("(% 5 6)", tree(parser.expression()).toStringTree());
	}
	
	/**
	 * Level 1
	 * @throws RecognitionException 
	 */
	[Test]
	public function testUnaryExpression():void
	{
		parser = parse("++i");
		// <PRE_INC><IDENT>i</IDENT></PRE_INC>
		assertEquals("(++ i)", tree(parser.expression()).toStringTree());
		
		parser = parse("i++");
		// <POST_INC><IDENT>i</IDENT></POST_INC>
		assertEquals("(++ i)", tree(parser.expression()).toStringTree());
		
		parser = parse("--i");
		// <PRE_DEC><IDENT>i</IDENT></PRE_DEC>
		assertEquals("(-- i)", tree(parser.expression()).toStringTree());
		
		parser = parse("i--");
		// <POST_DEC><IDENT>i</IDENT></POST_DEC>
		assertEquals("(-- i)", tree(parser.expression()).toStringTree());
		
		parser = parse("delete foo.bar");
		// <DELETE><FIELD_ACCESS><IDENT>foo</IDENT><IDENT>bar</IDENT></FIELD_ACCESS></DELETE>
		assertEquals("(delete (FIELD_ACCESS foo bar))", tree(parser.expression()).toStringTree());
		
		parser = parse("delete foo[bar]");
		// <DELETE><ARRAY_ACCESS><IDENT>foo</IDENT><IDENT>bar</IDENT></ARRAY_ACCESS></DELETE>
		assertEquals("(delete (ARRAY_ACCESS foo bar))", tree(parser.expression()).toStringTree());
		
		parser = parse("void x");
		// <VOID><IDENT>x</IDENT></VOID>
		assertEquals("(void x)", tree(parser.expression()).toStringTree());
		
		parser = parse("typeof x");
		// <TYPEOF><IDENT>x</IDENT></TYPEOF>
		assertEquals("(typeof x)", tree(parser.expression()).toStringTree());
			
		parser = parse("!x");
		// <LNOT><IDENT>x</IDENT></LNOT>
		assertEquals("(! x)", tree(parser.expression()).toStringTree());
		
		parser = parse("~x");
		// <BNOT><IDENT>x</IDENT></BNOT>
		assertEquals("(~ x)", tree(parser.expression()).toStringTree());
	}

	// Test_PrimaryExpression
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
		parser = parse("function(){}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><BLOCK>BLOCK</BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS BLOCK)", 
			tree(parser.expression()).toStringTree());

		parser = parse("function():void{}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><TYPE_SPEC><VOID>void</VOID>
		// </TYPE_SPEC><BLOCK>BLOCK</BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS (: (TYPE void)) BLOCK)", 
			tree(parser.expression()).toStringTree());

		parser = parse("function():foo.bar.Baz{}");
		// <FUNC_DEF><PARAMS>PARAMS</PARAMS><TYPE_SPEC><TYPE><IDENT>
		// foo</IDENT><IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE></TYPE_SPEC>
		// <BLOCK>BLOCK</BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF PARAMS (: (TYPE foo bar Baz)) BLOCK)", 
			tree(parser.expression()).toStringTree());
		
		parser = parse("function(arg0:Vector.<Vector.<foo.Bar>> = null, ...rest):void{return;}");
		// <FUNC_DEF><PARAMS><PARAM><IDENT>arg0</IDENT><TYPE_SPEC><TYPE>
		// <IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>foo</IDENT><IDENT>Bar</IDENT></TYPE_POSTFIX>
		// </TYPE_POSTFIX></TYPE></TYPE_SPEC><ASSIGN><NULL>null</NULL></ASSIGN>
		// </PARAM><PARAM><REST>...</REST><IDENT>rest</IDENT></PARAM></PARAMS>
		// <TYPE_SPEC><TYPE><VOID>void</VOID></TYPE></TYPE_SPEC><BLOCK><RETURN>
		// return</RETURN></BLOCK></FUNC_DEF>
		assertEquals("(FUNC_DEF (PARAMS (PARAM arg0 (: (TYPE Vector (TYPE_POSTFIX " +
				"Vector (TYPE_POSTFIX foo Bar)))) (= null)) (PARAM ... rest)) (: " +
				"(TYPE void)) (BLOCK return))", 
			tree(parser.expression()).toStringTree());		
	}
	
	[Test]
	public function test_newExpression():void
	{
		// TODO is this new expression allowed ? new new Foo()
		parser = parse("new Foo");
		// <NEW><IDENT>Foo</IDENT></NEW>
		assertEquals("(new Foo)", tree(parser.expression()).toStringTree());		
		
		parser = parse("new Foo()");
		// <FUNCTION_CALL><NEW><IDENT>Foo</IDENT></NEW><ARGUMENTS>ARGUMENTS
		// </ARGUMENTS></FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (new Foo) ARGUMENTS)", 
			tree(parser.expression()).toStringTree());
		
		parser = parse("new foo.baz[42].goo[bee[22][0]][11].Baz()");
		// <FUNCTION_CALL><FIELD_ACCESS><ARRAY_ACCESS><ARRAY_ACCESS>
		// <FIELD_ACCESS><ARRAY_ACCESS><FIELD_ACCESS><NEW><IDENT>foo</IDENT>
		// </NEW><IDENT>baz</IDENT></FIELD_ACCESS><DECIMAL_LITERAL>42</DECIMAL_LITERAL>
		// </ARRAY_ACCESS><IDENT>goo</IDENT></FIELD_ACCESS><ARRAY_ACCESS><ARRAY_ACCESS>
		// <IDENT>bee</IDENT><DECIMAL_LITERAL>22</DECIMAL_LITERAL></ARRAY_ACCESS>
		// <DECIMAL_LITERAL>0</DECIMAL_LITERAL></ARRAY_ACCESS></ARRAY_ACCESS>
		// <DECIMAL_LITERAL>11</DECIMAL_LITERAL></ARRAY_ACCESS><IDENT>Baz</IDENT>
		// </FIELD_ACCESS><ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (FIELD_ACCESS (ARRAY_ACCESS (ARRAY_ACCESS" +
				" (FIELD_ACCESS (ARRAY_ACCESS (FIELD_ACCESS (new foo) baz) 42) " +
				"goo) (ARRAY_ACCESS (ARRAY_ACCESS bee 22) 0)) 11) Baz) ARGUMENTS)", 
			tree(parser.expression()).toStringTree());
		
		parser = parse("new foo.bar.baz.Goo(Goo.ORP, true, false, 42)");	
		// <FUNCTION_CALL><FIELD_ACCESS><FIELD_ACCESS><FIELD_ACCESS><NEW><IDENT>
		// foo</IDENT></NEW><IDENT>bar</IDENT></FIELD_ACCESS><IDENT>baz</IDENT>
		// </FIELD_ACCESS><IDENT>Goo</IDENT></FIELD_ACCESS><ARGUMENTS><FIELD_ACCESS>
		// <IDENT>Goo</IDENT><IDENT>ORP</IDENT></FIELD_ACCESS><TRUE>true</TRUE>
		// <FALSE>false</FALSE><DECIMAL_LITERAL>42</DECIMAL_LITERAL></ARGUMENTS>
		// </FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (FIELD_ACCESS (FIELD_ACCESS (FIELD_ACCESS " +
				"(new foo) bar) baz) Goo) (ARGUMENTS (FIELD_ACCESS Goo ORP) " +
				"true false 42))", 
			tree(parser.expression()).toStringTree());
		
		parser = parse("new Vector.<Vector.<Foo>>(true, 0)");
		// <FUNCTION_CALL><NEW><IDENT>Vector</IDENT></NEW><TYPE_POSTFIX>
		// <IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX>
		// </TYPE_POSTFIX><ARGUMENTS><TRUE>true</TRUE><DECIMAL_LITERAL>0
		// </DECIMAL_LITERAL></ARGUMENTS></FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (new Vector) (TYPE_POSTFIX Vector (TYPE_POSTFIX" +
				" Foo)) (ARGUMENTS true 0))", tree(parser.expression()).toStringTree());
		
		parser = parse("a = new < int > [1, 2, 3]");
		// <ASSIGN><IDENT>a</IDENT><NEW><VECTOR_INIT><TYPE><IDENT>int</IDENT>
		// </TYPE><ARRAY_LITERAL><DECIMAL_LITERAL>1</DECIMAL_LITERAL>
		// <DECIMAL_LITERAL>2</DECIMAL_LITERAL><DECIMAL_LITERAL>3</DECIMAL_LITERAL>
		// </ARRAY_LITERAL></VECTOR_INIT></NEW></ASSIGN>
		assertEquals("(= a (new (VECTOR_INIT (TYPE int) (ARRAY_LITERAL 1 2 3)" +
				")))", tree(parser.expression()).toStringTree());
		
		parser = parse("new Foo().bar(42)");
		// <FUNCTION_CALL><FIELD_ACCESS><FUNCTION_CALL><NEW><IDENT>Foo</IDENT>
		// </NEW><ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL><IDENT>bar</IDENT>
		// </FIELD_ACCESS><ARGUMENTS><DECIMAL_LITERAL>42</DECIMAL_LITERAL></ARGUMENTS>
		// </FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (FIELD_ACCESS (FUNCTION_CALL (new Foo) " +
				"ARGUMENTS) bar) (ARGUMENTS 42))", tree(parser.expression()).toStringTree());		
	}
	
	[Test]
	public function test_encapsulatedExpression():void
	{
		parser = parse("(ecapsulated[foo].bar)");
		// <ENCPS_EXPR><FIELD_ACCESS><ARRAY_ACCESS><IDENT>ecapsulated</IDENT>
		// <IDENT>foo</IDENT></ARRAY_ACCESS><IDENT>bar</IDENT></FIELD_ACCESS>
		// </ENCPS_EXPR>
		assertEquals("(ENCPS_EXPR (FIELD_ACCESS (ARRAY_ACCESS ecapsulated foo) bar))", 
			tree(parser.primaryExpression()).toStringTree());
	}

	[Test]
	public function test_e4xAttributeIdentifier():void
	{
		// XXX Impl e4x att unit tests
		parser = parse("foo.@bar"); // propertyAtt
		//debug(parser.expression());
		
		// <FIELD_ACCESS><IDENT>foo</IDENT><E4X_ATTRI>@</E4X_ATTRI><IDENT>
		// bar</IDENT></FIELD_ACCESS>
//		assertEquals("(. foo @ bar)", 
//			tree(parser.primaryExpression()).toStringTree());
		
		
		parser = parse("@*"); //startAtt
		
		parser = parse("@[bar]"); // expressionAtt
	}
	
	[Test]
	public function test_qualifiedIdent():void
	{
		parser = parse("foo");
		// <IDENT>foo</IDENT>
		assertEquals("foo", tree(parser.primaryExpression()).toStringTree());
		
		parser = parse("foo.bar::bax()");
		// <FUNCTION_CALL><FIELD_ACCESS><IDENT>foo</IDENT><DBL_COLON>
		// <IDENT>bar</IDENT><IDENT>bax</IDENT></DBL_COLON></FIELD_ACCESS>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL>
		assertEquals("(FUNCTION_CALL (FIELD_ACCESS foo (:: bar bax))" +
				" ARGUMENTS)", tree(parser.expression()).toStringTree());
		
		//parser = parse("bar::baz()");
		//debug(parser.statement());
		// <FUNCTION_CALL><PROP_OR_IDENT><DBL_COLON><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></DBL_COLON><IDENT>baz</IDENT></PROP_OR_IDENT>
		// <ARGUMENTS>ARGUMENTS</ARGUMENTS></FUNCTION_CALL>
		//assertEquals("(FUNCTION_CALL (. (:: foo bar) baz) ARGUMENTS)", 
		//	tree(parser.expression()).toStringTree());
	}
	
	[Test]
	public function test_typeExpression():void
	{
		//------------------------------
		// void
		parser = parse(":void");
		// <TYPE_SPEC><VOID>void</VOID></TYPE_SPEC>
		assertEquals("(: (TYPE void))", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// a LCURLY SEMI COMMA ASSIGN RPAREN
		parser = parse(":*");
		// <TYPE_SPEC><STAR>*</STAR></TYPE_SPEC>
		assertEquals("(: (TYPE *))", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// String
		parser = parse(":String");
		// <TYPE_SPEC><IDENT>String</IDENT></TYPE_SPEC>
		assertEquals("(: (TYPE String))", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// foo.bar.Baz
		parser = parse(":foo.bar.Baz");
		// <TYPE_SPEC><IDENT>foo</IDENT><IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_SPEC>
		assertEquals("(: (TYPE foo bar Baz))", tree(parser.typeExpression()).toStringTree());		
		
		//------------------------------
		// foo.my_namespace::bar don't think this is quite legal but allowed
		parser = parse(":foo.my_namespace::bar");
		// <TYPE_SPEC><IDENT>foo</IDENT><DBL_COLON><IDENT>my_namespace</IDENT>
		// <IDENT>bar</IDENT></DBL_COLON></TYPE_SPEC>
		assertEquals("(: (TYPE foo (:: my_namespace bar)))", tree(parser.typeExpression()).toStringTree());		
		
		//------------------------------
		// Vector.<*>
		parser = parse(":Vector.<*>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><STAR>*</STAR>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX *)))", 
			tree(parser.typeExpression()).toStringTree());			
		
		//------------------------------
		// Vector.<String>
		parser = parse(":Vector.<Foo>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Foo</IDENT>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX Foo)))", 
			tree(parser.typeExpression()).toStringTree());	
		
		//------------------------------
		// Vector.<foo.bar.Baz>
		parser = parse(":Vector.<foo.bar.Baz>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX foo bar Baz)))", 
			tree(parser.typeExpression()).toStringTree());			
		
		//------------------------------
		// Vector.<Vector.<Foo>>
		parser = parse(":Vector.<Vector.<Foo>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Foo))))", 
			tree(parser.typeExpression()).toStringTree());
	
		//------------------------------
		// Vector.<Vector.<String>>
		parser = parse(":Vector.<Vector.<Vector.<Foo>>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Foo</IDENT>
		// </TYPE_POSTFIX></TYPE_POSTFIX></TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Vector " +
				"(TYPE_POSTFIX Foo)))))", tree(parser.typeExpression()).toStringTree());
		
		//------------------------------
		// Vector.<Vector.<foo.bar.Baz>>
		parser = parse(":Vector.<Vector.<Vector.<foo.bar.Baz>>>");
		// <TYPE_SPEC><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Vector</IDENT><TYPE_POSTFIX><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT><IDENT>Baz</IDENT></TYPE_POSTFIX></TYPE_POSTFIX>
		// </TYPE_POSTFIX></TYPE_SPEC>
		assertEquals("(: (TYPE Vector (TYPE_POSTFIX Vector (TYPE_POSTFIX Vector " +
				"(TYPE_POSTFIX foo bar Baz)))))", tree(parser.typeExpression()).toStringTree());
	}
	
	private function debug(scope:ParserRuleReturnScope):void
	{
		t = tree(scope);
		r = t.toStringTree();
		x = ASTUtils.convert(t, false);
	}
}
}