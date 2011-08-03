package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.AccessorRole;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASForStatement;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IList;
import org.as3commons.lang.StringUtils;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

public class Test_BasicUnit
{
	[Test]
	public function testBasic():void
	{
		var source:String = "/*fpkg*/package foo.bar {\n"
				+ " import pkg.Stuff;\n"
				+ " /**\n"
				+ "  * java doc\n"
				+ "  */\n"
				+ " public class /*f*/Blat extends Bing implements Febraz, Goo {\n"
				+ " [Annotate]\n"
				+ " [Basic()]\n"
				+ " [String(\"foo\")]\n"
				+ " [Num(1)]\n"
				+ " [Bool(false)]\n"
				+ " [Arg(foo=\"bar\")]\n"
				+ " [List(foo=\"bar\", that=2)]\n"
				+ " [Event(\"alpha\")]\n"
				+ " [Event(\"beta\")]\n"
				+ " private var x:String = 1;\n"
				+ " /** javadoc? */\n"
				+ " public static function func(arg:Number, foo=null, ...):Boolean {\n"
				+ " for (var b=1;b<=10;b++) { bar(); }\n"
				+ " for (var g in blah) { r(); }\n"
				+ " for each (var g in blah) { r(); }\n"
				+ " if (h==undefined) { poo(); } else { /* bar */ }\n"
				+ " while (false) v();\n" 
				+ " do { continue; } while (m);\n"
				+ " switch (blah) {\n" 
				+ " case 0x3: x(); y(); break;\n"
				+ " case 4: next;\n" 
				+ " default: x(); y();\n" 
				+ " }\n"
				+ " with (scope) foo();\n" 
				+ " var a=b?(x+y):new Foo();\n"
				+ " const X=true;\n" 
				+ " ff = function(y, z) { };\n"
				+ " l=[1,'2'];\n" 
				+ " xx = doc.ns::name;\n" 
				+ " m={a:null};\n"
				+ "// d = <foo bar=\"{blat}\"/>;\n" 
				+ " r = /regexp/;\n"
				+ " /* unary expressions */\n" 
				+ " --a; ++a; a--; a++; a = -a;\n"
				+ " return z.call(i.j*k, l[m]);\n" 
				+ " }\n" 
				+ " }\n"
				+ " } // trailing comment";
		//StringReader reader = new StringReader(source);

		var fact:ASFactory = new ASFactory();
		var unit:IASCompilationUnit = fact.newParser().parse(source);

		// check that everything looks as it should,
		assertEquals("foo.bar", unit.getPackageName());
		
		var pkg:IASPackage = unit.getPackage();
		var clazz:IASClassType = unit.getType() as IASClassType;
		
		assertEquals("foo.bar", pkg.getName());
		var imports:IList = pkg.getImports();
		assertEquals(1, imports.size);
		assertEquals("pkg.Stuff", imports.itemAt(0).getTargetString());
		
		assertEquals("Blat", clazz.getName());
		assertEquals("Bing", clazz.getSuperClass());
		//assertEquals(Arrays.asList(new String[] { "Febraz", "Goo" }),
		//		clazz.getImplementedInterfaces());
		assertEquals("java doc", StringUtils.trim(clazz.getDescription()));
		assertEquals(1, clazz.getMethods().size);

		var x:IASField = clazz.getField("x");
		assertEquals("x", x.getName());
		assertEquals("String", x.getType());
		assertEquals(Visibility.PRIVATE, x.getVisibility());

		assertNotNull(x.getMetaTag("Annotate"));

		var func:IASMethod = clazz.getMethod("func");
		assertEquals("func", func.getName());
		assertEquals("Boolean", func.getType());
		assertTrue(func.isStatic());
		assertEquals(Visibility.PUBLIC, func.getVisibility());
		assertEquals(AccessorRole.NORMAL, func.getAccessorRole());
		var args:IList = func.getParameters();
		assertEquals(3, args.size);
		var arg0:IASParameter = args.itemAt(0) as IASParameter;
		assertEquals("arg", arg0.getName());
		assertEquals("Number", arg0.getType());
		var arg1:IASParameter = args.itemAt(1) as IASParameter;
		assertEquals("foo", arg1.getName());
		assertNull(arg1.getType());
		assertEquals(" javadoc? ", func.getDescription());
		var arg2:IASParameter = args.itemAt(2) as IASParameter;
		assertTrue(arg2.isRest());
		assertEquals("...", arg2.getName());
		assertNull(arg2.getType());

		// compare the re-serialized code with the original input,
		var writer:StringWriter = new StringWriter();
		fact.newWriter().write(writer, unit);
		assertEquals(StringUtils.trim(source), writer.toString());

		var stats:IList = func.getStatements();
		assertTrue(stats.itemAt(0) is IASForStatement);
		CodeMirror.assertReflection(fact, unit);
	}

	public function testInvalidInput():void
	{
		//StringReader reader = new StringReader("(*H!D)(&H!)D&*GH");
//
		//ASFactory fact = new ASFactory();
		//try
		//{
		//	fact.newParser().parseIn(reader);
		//	fail("Should raise exception on invalid input");
		//}
		//catch (ASBlocksSyntaxError e)
		//{
		//	// expected
		//}
	}

	[Test]
	public function testStr():void
	{
		var input:String = "\\\"\n\t\r'";
		var result:String = ASTUtils.str(input);
		//StringReader in = new StringReader(result);
		//ANTLRReaderStream stream = new ANTLRReaderStream(in);
		//AS3Lexer lex = new AS3Lexer(stream);
		//Token tok = lex.nextToken();
		//assertEquals(AS3Parser.STRING_LITERAL, tok.getType());
		//assertEquals("\"\\\\\\\"\\n\\t\\r'\"", tok.getText());
	}
}
}