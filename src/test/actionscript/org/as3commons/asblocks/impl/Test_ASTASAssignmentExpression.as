package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.AssignmentOperator;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASAssignmentExpression
{
	private var right:IASExpression;
	private var left:IASExpression;
	
	private var fact:ASFactory = new ASFactory();

	private var expr:IASAssignmentExpression;	
	
	[Before]
	public function setUp():void
	{
		left = fact.newExpression("a");
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
	public function test_assign():void
	{
		expr = fact.newAssignExpression(left, right);
		assertOp(AssignmentOperator.ASSIGN);
	}
	
	[Test]
	public function test_add():void
	{
		expr = fact.newAddAssignExpression(left, right);
		assertOp(AssignmentOperator.ADD_ASSIGN);
	}
	
	[Test]
	public function test_bitAnd():void
	{
		expr = fact.newBitAndAssignExpression(left, right);
		assertOp(AssignmentOperator.BITAND_ASSIGN);
	}
	
	[Test]
	public function test_bitOr():void
	{
		expr = fact.newBitOrAssignExpression(left, right);
		assertOp(AssignmentOperator.BITOR_ASSIGN);
	}
	
	[Test]
	public function test_bitXor():void
	{
		expr = fact.newBitXorAssignExpression(left, right);
		assertOp(AssignmentOperator.BITXOR_ASSIGN);
	}
	
	[Test]
	public function test_division():void
	{
		expr = fact.newDivideAssignExpression(left, right);
		assertOp(AssignmentOperator.DIV_ASSIGN);
	}
	
	[Test]
	public function test_modulo():void
	{
		expr = fact.newModuloAssignExpression(left, right);
		assertOp(AssignmentOperator.MOD_ASSIGN);
	}
	
	[Test]
	public function test_multiply():void
	{
		expr = fact.newMultiplyAssignExpression(left, right);
		assertOp(AssignmentOperator.MUL_ASSIGN);
	}
	
	[Test]
	public function test_shiftLeft():void
	{
		expr = fact.newShiftLeftAssignExpression(left, right);
		assertOp(AssignmentOperator.SL_ASSIGN);
	}
	
	[Test]
	public function test_shiftRight():void
	{
		expr = fact.newShiftRightAssignExpression(left, right);
		assertOp(AssignmentOperator.SR_ASSIGN);
	}
	
	[Test]
	public function test_shiftRightUnsigned():void
	{
		expr = fact.newShiftRightUnsignedAssignExpression(left, right);
		assertOp(AssignmentOperator.SRU_ASSIGN);
	}
	
	[Test]
	public function test_subract():void
	{
		expr = fact.newSubtractAssignExpression(left, right);
		assertOp(AssignmentOperator.SUB_ASSIGN);
	}
	
	[Test]
	public function test_setOp():void
	{
		expr = fact.newAddAssignExpression(left, right);
		assertOp(AssignmentOperator.ADD_ASSIGN);
		expr.setOperator(AssignmentOperator.SUB_ASSIGN);
		assertOp(AssignmentOperator.SUB_ASSIGN);
	}
	
	[Test]
	public function test_setLeft():void
	{
		expr = fact.newAddAssignExpression(left, right);
		left = fact.newIntegerLiteral(24);
		expr.setLeftExpression(left);
	}
	
	[Test]
	public function test_setRight():void
	{
		expr = fact.newAddAssignExpression(left, right);
		right = fact.newIntegerLiteral(24);
		expr.setRightExpression(right);
	}
	
	private function assertOp(expected:AssignmentOperator):void
	{
		var ast:LinkedListTree = ASTExpression(expr).getAST();
		var expr:IASExpression = fact.newExpression(ASTUtils.stringifyNode(ast));
		assertEquals(expected, IASAssignmentExpression(expr).getOperator());
	}
}
}