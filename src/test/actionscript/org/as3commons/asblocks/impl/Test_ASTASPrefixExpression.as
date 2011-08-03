package org.as3commons.asblocks.impl
{
import flashx.textLayout.debug.assert;

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.PostfixOperator;
import org.as3commons.asblocks.dom.PrefixOperator;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASPrefixExpression
{
	private var fact:ASFactory = new ASFactory();
	private var sub:IASExpression = null;
	private var expr:IASPrefixExpression = null;
	
	[Before]
	public function setUp():void
	{
		sub = fact.newExpression("i");
	}
	
	[After]
	public function tearDown():void
	{
		if (expr != null)
		{
			ExtraAssertions.assertBothEquals(sub, expr.getExpression());
		}
	}
	
	[Test]
	public function test_op():void
	{
		expr = fact.newPreDecExpression(sub);
		assertOp(PrefixOperator.PREDEC);
		expr.setOperator(PrefixOperator.PREINC);
		assertOp(PrefixOperator.PREINC);
	}
	
	[Test]
	public function test_preDec():void
	{
		expr = fact.newPreDecExpression(sub);
		assertOp(PrefixOperator.PREDEC);
	}
	
	[Test]
	public function test_preInc():void
	{
		expr = fact.newPreIncExpression(sub);
		assertOp(PrefixOperator.PREINC);
	}
	
	[Test]
	public function test_positive():void
	{
		expr = fact.newPositiveExpression(sub);
		assertOp(PrefixOperator.POS);
	}
	
	[Test]
	public function test_negetive():void
	{
		expr = fact.newNegativeExpression(sub);
		assertOp(PrefixOperator.NEG);
	}
	
	[Test]
	public function test_not():void
	{
		expr = fact.newNotExpression(sub);
		assertOp(PrefixOperator.NOT);
	}
	
	[Test]
	public function test_expression():void
	{
		expr = fact.newPreIncExpression(sub);
		sub = fact.newExpression("j");
		expr.setExpression(sub);
	}
	
	public function assertOp(op:PrefixOperator):void
	{
		var ast:LinkedListTree = ASTUtils.ast(expr);
		var expr:IASExpression = fact.newExpression(ASTUtils.stringifyNode(ast));
		assertEquals(op, IASPrefixExpression(expr).getOperator());
	}	
}
}