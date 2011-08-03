package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASExpressionStatement;
import org.as3commons.asblocks.dom.IASFunctionExpression;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

public class Test_ASTASFunctionExpression
{
	private var factory:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var reflect:IASCompilationUnit;
	private var meth:IASMethod;
	
	[Before]
	public function setUp():void
	{
		unit = factory.newClass("Test");
		var clazz:IASClassType = unit.getType() as IASClassType;
		meth = clazz.newMethod("test", Visibility.PUBLIC, null);
		reflect = null;
	}
	
	[After]
	public function tearDown():void
	{
		if (reflect == null)
		{
			reflect = assertReflection();
		}
	}

	private function assertReflection():IASCompilationUnit
	{
		return CodeMirror.assertReflection(factory, unit);
	}
	
	[Test]
	public function test_example1():void
	{
		var fl:IASFunctionExpression = factory.newFunctionExpression();
		assertEquals("function () {\n}", fl.toString());
	}
	
	[Test]
	public function test_example2():void
	{
		var fl:IASFunctionExpression = factory.newFunctionExpression();
		fl.setType("int");
		fl.addParameter("arg0", "String");
		fl.parseStatement("trace('Hello World')");
		assertEquals("function (arg0:String):int {\n	trace('Hello World');\n}", fl.toString());
	}
	
	[Test]
	public function test_example3():void
	{
		var fl:IASFunctionExpression = factory.newFunctionExpression();
		fl.setType("int");
		fl.addParameter("arg0", "String");
		fl.parseStatement("trace('Hello World')");
		var target:IASExpression = factory.newExpression("foo");
		var assign:IASAssignmentExpression = factory.newAssignExpression(target, fl);

		assertEquals("foo = function (arg0:String):int {\n	trace('Hello World');\n}", assign.toString());
	}
	
	[Test]
	public function testIt():void
	{
		var func:IASFunctionExpression = factory.newFunctionExpression();
		assertNotNull(func);
		func.addParameter("foo", "String");
		meth.newExpressionStatement(factory.newAssignExpression(factory.newExpression("myFunc"), func));
		func.parseStatement("trace('hello world')");
	}
	
	[Test]
	public function testParse():void
	{
		var exprStmt:IASExpressionStatement = meth.parseStatement("theFunc = function () { trace('foo!'); }") as IASExpressionStatement;
		var assign:IASAssignmentExpression = exprStmt.getExpression() as IASAssignmentExpression;
		ExtraAssertions.assertInstanceof(assign.getRightExpression(), IASFunctionExpression);
	}
	
	[Test]
	public function testParseNamed():void
	{
		var exprStmt:IASExpressionStatement = meth.parseStatement("theFunc = function fn() { trace('foo!'); }") as IASExpressionStatement;
		var assign:IASAssignmentExpression = exprStmt.getExpression() as IASAssignmentExpression;
		ExtraAssertions.assertInstanceof(assign.getRightExpression(), IASFunctionExpression);
	}
}
}