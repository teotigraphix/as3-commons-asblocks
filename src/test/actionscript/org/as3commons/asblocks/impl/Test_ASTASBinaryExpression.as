package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.BinaryOperator;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASBinaryExpression
{
	private var right:IASExpression;
	private var left:IASExpression;
	
	private var fact:ASFactory = new ASFactory();

	private var expr:IASBinaryExpression;	
	
	[Before]
	public function setUp():void
	{
		left = fact.newIntegerLiteral(1);
		right = fact.newIntegerLiteral(2);
		expr = null;
	}
	
	[After]
	public function tearDown():void
	{
		if (expr != null)
		{
			assertEquals(ASTExpression(left).toString(), 
				ASTExpression(expr.getLeftExpression()).toString());
			assertEquals(ASTExpression(right).toString(), 
				ASTExpression(expr.getRightExpression()).toString());
		}
	}
	
	[Test]
	public function test_add():void
	{
		expr = fact.newAddExpression(left, right);
		assertOp(BinaryOperator.ADD);
	}
	
	[Test]
	public function test_and():void
	{
		expr = fact.newAndExpression(left, right);
		assertOp(BinaryOperator.AND);
	}
	
	[Test]
	public function test_bitAnd():void
	{
		expr = fact.newBitAndExpression(left, right);
		assertOp(BinaryOperator.BITAND);
	}
	
	[Test]
	public function test_bitOr():void
	{
		expr = fact.newBitOrExpression(left, right);
		assertOp(BinaryOperator.BITOR);
	}
	
	[Test]
	public function test_bitXor():void
	{
		expr = fact.newBitXorExpression(left, right);
		assertOp(BinaryOperator.BITXOR);
	}
	
	[Test]
	public function test_division():void
	{
		expr = fact.newDivisionExpression(left, right);
		assertOp(BinaryOperator.DIV);
	}
	
	[Test]
	public function test_equals():void
	{
		expr = fact.newEqualsExpression(left, right);
		assertOp(BinaryOperator.EQ);
	}
	
	[Test]
	public function test_greaterEquals():void
	{
		expr = fact.newGreaterEqualsExpression(left, right);
		assertOp(BinaryOperator.GE);
	}
	
	[Test]
	public function test_greaterThan():void
	{
		expr = fact.newGreaterThanExpression(left, right);
		assertOp(BinaryOperator.GT);
	}
	
	[Test]
	public function test_lessEquals():void
	{
		expr = fact.newLessEqualsExpression(left, right);
		assertOp(BinaryOperator.LE);
	}
	
	[Test]
	public function test_lessThen():void
	{
		expr = fact.newLessThanExpression(left, right);
		assertOp(BinaryOperator.LT);
	}
	
	[Test]
	public function test_modulo():void
	{
		expr = fact.newModuloExpression(left, right);
		assertOp(BinaryOperator.MOD);
	}
	
	[Test]
	public function test_multiply():void
	{
		expr = fact.newMultiplyExpression(left, right);
		assertOp(BinaryOperator.MUL);
	}
	
	[Test]
	public function test_notEquals():void
	{
		expr = fact.newNotEqualsExpression(left, right);
		assertOp(BinaryOperator.NE);
	}
	
	[Test]
	public function test_or():void
	{
		expr = fact.newOrExpression(left, right);
		assertOp(BinaryOperator.OR);
	}
	
	[Test]
	public function test_shiftLeft():void
	{
		expr = fact.newShiftLeftExpression(left, right);
		assertOp(BinaryOperator.SL);
	}
	
	[Test]
	public function test_shiftRight():void
	{
		expr = fact.newShiftRightExpression(left, right);
		assertOp(BinaryOperator.SR);
	}
	
	[Test]
	public function test_shiftRightUnsigned():void
	{
		expr = fact.newShiftRightUnsignedExpression(left, right);
		assertOp(BinaryOperator.SRU);
	}
	
	[Test]
	public function test_subtract():void
	{
		expr = fact.newSubtractExpression(left, right);
		assertOp(BinaryOperator.SUB);
	}
	
	
	[Test]
	public function test_setOp():void
	{
		expr = fact.newAddExpression(left, right);
		assertOp(BinaryOperator.ADD);
		expr.setOperator(BinaryOperator.SUB);
		assertOp(BinaryOperator.SUB);
	}
	
	[Test]
	public function test_setLeft():void
	{
		expr = fact.newAddExpression(left, right);
		left = fact.newIntegerLiteral(24);
		expr.setLeftExpression(left);
	}
	
	[Test]
	public function test_setRight():void
	{
		expr = fact.newAddExpression(left, right);
		right = fact.newIntegerLiteral(24);
		expr.setRightExpression(right);
	}
	
	private function assertOp(expected:BinaryOperator):void
	{
		var ast:LinkedListTree = ASTExpression(expr).getAST();
		var expr:IASExpression = fact.newExpression(ASTUtils.stringifyNode(ast));
		assertEquals(expected, IASBinaryExpression(expr).getOperator());
	}		
}
}