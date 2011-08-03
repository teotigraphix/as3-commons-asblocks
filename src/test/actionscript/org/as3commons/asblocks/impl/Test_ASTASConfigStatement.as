package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASConfigStatement;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.fail;

public class Test_ASTASConfigStatement
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var meth:IASMethod;
	
	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
		var clazz:IASClassType = unit.getType() as IASClassType;
		meth = clazz.newMethod("test", Visibility.PUBLIC, null);
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function test_basic():void
	{
		var conf:IASConfigStatement = meth.parseNewConfig("debug");
		assertNotNull(conf);
		conf.parseStatement("trace('debug')");
	}
	
	[Test]
	public function test_name():void
	{
		var conf:IASConfigStatement = meth.parseNewConfig("debug");
		assertNotNull(conf);
		assertEquals("debug", conf.getName());
		conf.setName("foo");
		assertEquals("foo", conf.getName());
		// test null or empty, cannot allow
		try
		{
			conf.setName("");
			fail("IASConfigStatement.name should not be empty");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// TODO: handle exception
		}
	}
}
}