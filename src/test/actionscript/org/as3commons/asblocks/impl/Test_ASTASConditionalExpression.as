package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASConditionalExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;

public class Test_ASTASConditionalExpression
{
	private var unit:IASCompilationUnit;
	private var reflect:IASConditionalExpression;
	private var conditionalExpr:IASConditionalExpression;

	private var fact:ASFactory = new ASFactory();
	
	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
		reflect = null;
		conditionalExpr = null;		
	}
	
	[After]
	public function tearDown():void
	{
		if (reflect == null)
		{
			var clazz:IASClassType = unit.getType() as IASClassType;
			var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, null);
//			meth.newExprStmt(conditionalExpr);
//			reflect = assertReflection();
		}		
	}
	
	[Test]
	public function test_basic():void
	{
		var conditionExpr:IASExpression = fact.newExpression("a.b");
		var thenExpr:IASExpression = fact.newExpression("1");
		var elseExpr:IASExpression = fact.newExpression("2");
		conditionalExpr = fact.newConditionalExpression(conditionExpr, thenExpr, elseExpr);
		ExtraAssertions.assertInstanceof(conditionalExpr.getCondition(), IASFieldAccessExpression);
		ExtraAssertions.assertInstanceof(conditionalExpr.getThenExpression(), IASIntegerLiteral);
		ExtraAssertions.assertInstanceof(conditionalExpr.getElseExpression(), IASIntegerLiteral);
	}
	
	[Test]
	public function test_parse():void
	{
		conditionalExpr = fact.newExpression("a.b ? 1 : 2") as IASConditionalExpression;
		ExtraAssertions.assertInstanceof(conditionalExpr.getCondition(), IASFieldAccessExpression);
		ExtraAssertions.assertInstanceof(conditionalExpr.getThenExpression(), IASIntegerLiteral);
		ExtraAssertions.assertInstanceof(conditionalExpr.getElseExpression(), IASIntegerLiteral);
	}
	
	[Test]
	public function test_Setters():void
	{
		var conditionExpr:IASExpression = fact.newExpression("a.b");
		var thenExpr:IASExpression = fact.newExpression("1");
		var elseExpr:IASExpression = fact.newExpression("2");
		conditionalExpr = fact.newConditionalExpression(conditionExpr, thenExpr, elseExpr);
		conditionalExpr.setCondition(fact.newBooleanLiteral(true));
		conditionalExpr.setThenExpression(fact.newExpression("foo.bar"));
		conditionalExpr.setElseExpression(fact.newExpression("[1,2,3]"));
		ExtraAssertions.assertInstanceof(conditionalExpr.getCondition(), IASBooleanLiteral);
		ExtraAssertions.assertInstanceof(conditionalExpr.getThenExpression(), IASFieldAccessExpression);
		ExtraAssertions.assertInstanceof(conditionalExpr.getElseExpression(), IASArrayLiteral);	
	}	
}
}