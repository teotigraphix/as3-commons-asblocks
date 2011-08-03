package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASFunctionType;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.fail;

public class Test_ASTASFunctionType
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var ftype:IASFunctionType;
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newFunction("foo.bar.baz", "void");
		ftype = unit.getType() as IASFunctionType;
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function test_name():void
	{
		assertEquals("baz", ftype.getName());
		ftype.setName("anotherFunc");
		assertEquals("anotherFunc", ftype.getName());
		try
		{
			ftype.setName(null);
			fail("function name should have rejected null value");
		}
		catch (e:ASBlocksSyntaxError)
		{
		}
	}
	
	[Test]
	public function test_type():void
	{
		assertEquals("void", ftype.getType());
		ftype.setType("Baz");
		assertEquals("Baz", ftype.getType());
		ftype.setType(null);
		assertNull(ftype.getType());
	}
	
	// FunctionCommon tests the rest
}
}