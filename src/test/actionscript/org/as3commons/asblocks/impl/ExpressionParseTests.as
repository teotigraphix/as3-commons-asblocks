package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.BinaryOperator;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.PrefixOperator;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertTrue;

public class ExpressionParseTests
{
	private var fact:ASFactory = new ASFactory();
	
	[Test]
	public function testAdd():void
	{
		var expr:IASExpression = fact.newExpression("1+1");
		assertTrue(expr is IASBinaryExpression);
		var add:IASBinaryExpression = expr as IASBinaryExpression;
		assertEquals(BinaryOperator.ADD, add.getOperator());
	}
	
	[Test]
	public function testMultiplyAddPresidence():void
	{
		// addition has lower presidence, so appears higher in AST
		var expr:IASExpression = fact.newExpression("1+2*2");
		assertTrue(expr is IASBinaryExpression);
		var add:IASBinaryExpression = expr as IASBinaryExpression;
		assertEquals(BinaryOperator.ADD, add.getOperator());
		var right:IASBinaryExpression = add.getRightExpression() as IASBinaryExpression;
		assertEquals(BinaryOperator.MUL, right.getOperator());

		// addition still has lower presidence, so appears higher in AST
		expr = fact.newExpression("2*2+1");
		assertTrue(expr is IASBinaryExpression);
		add = expr as IASBinaryExpression;
		assertEquals(BinaryOperator.ADD, add.getOperator());
		var left:IASBinaryExpression = add.getLeftExpression() as IASBinaryExpression;
		assertEquals(BinaryOperator.MUL, left.getOperator());
	}
	
	[Test]
	public function testPreIncrement():void
	{
		var expr:IASExpression = fact.newExpression("++i");
		assertTrue(expr is IASPrefixExpression);
		var inc:IASPrefixExpression = expr as IASPrefixExpression;
		assertEquals(PrefixOperator.PREINC, inc.getOperator());
	}
	
	[Test]
	public function testInvokeInvocation():void
	{
		var expr:IASExpression = fact.newExpression("a().b()");
		var buff:StringWriter = new StringWriter();
		var ast:LinkedListTree = ASTUtils.ast(expr);
		CodeMirror.assertTokenStreamNotDisjoint(ast);
		new ASTPrinter(buff).print(ast);
		var parsed:LinkedListTree = AS3FragmentParser.parseExpression(buff.toString());
		CodeMirror.assertASTMatch(ast, parsed);
	}
}
}