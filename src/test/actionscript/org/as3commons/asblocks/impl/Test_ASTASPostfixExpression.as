package org.as3commons.asblocks.impl
{
import flashx.textLayout.debug.assert;

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.PostfixOperator;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASPostfixExpression
{
	private var fact:ASFactory = new ASFactory();
	private var sub:IASExpression = null;
	private var expr:IASPostfixExpression = null;
	
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
		expr = fact.newPostDecExpression(sub);
		assertOp(PostfixOperator.POSTDEC);
		expr.setOperator(PostfixOperator.POSTINC);
		assertOp(PostfixOperator.POSTINC);
	}
	
	[Test]
	public function test_postDec():void
	{
		expr = fact.newPostDecExpression(sub);
		assertOp(PostfixOperator.POSTDEC);
	}
	
	[Test]
	public function test_postInc():void
	{
		expr = fact.newPostIncExpression(sub);
		assertOp(PostfixOperator.POSTINC);
	}
	
	[Test]
	public function test_expression():void
	{
		expr = fact.newPostIncExpression(sub);
		sub = fact.newExpression("j");
		expr.setExpression(sub);
	}
	
	public function assertOp(op:PostfixOperator):void
	{
		var ast:LinkedListTree = ASTUtils.ast(expr);
		var expr:IASExpression = fact.newExpression(ASTUtils.stringifyNode(ast));
		assertEquals(op, IASPostfixExpression(expr).getOperator());
	}	
}
}