package org.as3commons.asblocks.impl
{
import flash.filesystem.File;

import org.antlr.runtime.ParserRuleReturnScope;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.IASParser;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

public class Test_ASTASClassType
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var clazz:IASClassType;	
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newClass("Test");
		clazz = unit.getType() as IASClassType;
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	
	//[Test]
	public function test_junk():void
	{
		var path:String = "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\" +
			"as3commons-asblocks-dom\\org\\as3commons\\asblocks\\impl\\ASTASPackage.as";
		
		//var parser:IASParser = fact.newParser();
		var parser:AS3Parser = ASTUtils.parseFile(FileUtil.newFile(path));
		var tree:LinkedListTree = ParserRuleReturnScope(parser.compilationUnit()).tree as LinkedListTree;
		var u:IASCompilationUnit = new ASTASCompilationUnit(tree);
		
	}
	
	[Test]
	public function test_name():void
	{
		assertEquals("Test", clazz.getName());
		clazz.setName("Another");
		assertEquals("Another", clazz.getName());
	}	
	
	[Test]
	public function test_methods():void
	{
		var foo:IASMethod = clazz.newMethod("foo", Visibility.PUBLIC, null);
		clazz.newMethod("removeme", Visibility.PUBLIC, null);
		clazz.newMethod("bar", Visibility.PUBLIC, null);
		
		clazz.removeMethod("removeme");
		
		var methods:IList = clazz.getMethods();
		
		assertEquals(2, methods.size);
		assertEquals("foo", methods.itemAt(0).getName());
		assertEquals("bar", methods.itemAt(1).getName());
		
		assertEquals(methods.itemAt(0).getName(), clazz.getMethod("foo").getName());
		assertNull(clazz.getMethod("missing"));
		
		clazz.removeMethod("missing");
	}
	
	[Test]
	public function test_fields():void
	{
		var foo:IASField = clazz.newField("foo", Visibility.PUBLIC, null);
		clazz.newField("removeme", Visibility.PUBLIC, null);
		clazz.newField("bar", Visibility.PUBLIC, null);
		
		clazz.removeField("removeme");
		
		var fields:IList = clazz.getFields();
		
		assertEquals(2, fields.size);
		assertEquals("foo", fields.itemAt(0).getName());
		assertEquals("bar", fields.itemAt(1).getName());
		
		assertEquals(fields.itemAt(0).getName(), clazz.getField("foo").getName());
		assertNull(clazz.getField("missing"));
		
		clazz.removeField("missing");
	}
	
	[Test]
	public function test_superClass():void
	{
		assertNull(clazz.getSuperClass());
		clazz.setSuperClass("foo.bar.Baz");
		assertEquals("foo.bar.Baz", clazz.getSuperClass());
		// replace the original type name,
		clazz.setSuperClass("Baz");
		CodeMirror.assertReflection(fact, unit);
		clazz.setSuperClass(null);
		assertNull(clazz.getSuperClass());
	}
	
	[Test]
	public function test_implements():void
	{
		assertEquals(0, clazz.getImplementedInterfaces().size);
		clazz.addImplementedInterface("InterfaceTestA");
		clazz.addImplementedInterface("InterfaceTestB");
		clazz.addImplementedInterface("pkg.InterfaceTestC");

		assertEquals(3, clazz.getImplementedInterfaces().size);
		clazz.removeImplementedInterface("InterfaceTestB");

		var interfaces:IList = clazz.getImplementedInterfaces();
		assertEquals(2, interfaces.size);
		var interface0:String = interfaces.itemAt(0);
		assertEquals("InterfaceTestA", interface0);
		var interface1:String = interfaces.itemAt(1);
		assertEquals("pkg.InterfaceTestC", interface1);
	}
	
	[Test]
	public function test_implements_remove():void
	{
		clazz.addImplementedInterface("InterfaceTest");
		clazz.removeImplementedInterface("InterfaceTest");
		// tearDown() will assert that the code still parses, which
		// it shouldn't do if the inteface name is removed, but the
		// 'implements' keyword isn't.
	}
	
	[Test]
	public function test_docComment():void
	{
		//var comment:String = "\nfoo\n bar\n\n";
		//clazz.setDocComment(comment);
		//assertEquals(comment, clazz.getDocComment());
	}
	
	[Test]
	public function test_package():void
	{
		assertNull(unit.getPackageName());
		unit.setPackageName("test.foo");
		assertEquals("test.foo", unit.getPackageName());
		unit.setPackageName("test.bar");
		assertEquals("test.bar", unit.getPackageName());
		unit.setPackageName(null);
		assertNull(unit.getPackageName());
	}
	
	[Test]
	public function test_visibility():void
	{
		assertEquals(Visibility.PUBLIC, clazz.getVisibility());
		clazz.setVisibility(Visibility.DEFAULT);
		assertEquals(Visibility.DEFAULT, clazz.getVisibility());
	}
	
	[Test]
	public function test_isDynamic():void
	{
		assertFalse(clazz.isDynamic());
		clazz.setDynamic(false);
		// set false when already false,
		assertFalse(clazz.isDynamic());
		clazz.setDynamic(true);
		assertTrue(clazz.isDynamic());
		// set true when already true,
		clazz.setDynamic(true);
		assertTrue(clazz.isDynamic());
	}
	
	[Test]
	public function test_isFinal():void
	{
		assertFalse(clazz.isFinal());
		clazz.setFinal(false);
		// set false when already false,
		assertFalse(clazz.isFinal());
		clazz.setFinal(true);
		assertTrue(clazz.isFinal());
		// set true when already true,
		clazz.setFinal(true);
		assertTrue(clazz.isFinal());
	}
	
	[Test]
	public function test_modifiers_remove():void
	{
		// set the 'final' keyword
		clazz.setFinal(true);
		// remove the 'public' keyword added by default in setUp()
		clazz.setVisibility(Visibility.DEFAULT);
		// now, test removing the 'final' flag, which should also be
		// the only remaining modifier,
		clazz.setFinal(false);
	}
	
	
	[Test]
	public function test_Vector_post():void
	{
		var v:IASField = clazz.newField("foo", Visibility.PUBLIC, "Vector.<Vector.<Vector.<Foo>>>");
		assertEquals("Vector.<Vector.<Vector.<Foo>>>", v.getType());
	}	
}
}