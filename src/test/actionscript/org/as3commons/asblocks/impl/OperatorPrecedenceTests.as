package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.BinaryOperator;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertTrue;

public class OperatorPrecedenceTests
{
	private var left:IASExpression;
	private var right:IASExpression;
	private var fact:ASFactory = new ASFactory();
	private var expr:IASBinaryExpression;
	
	[Before]
	public function setUp():void
	{
		right = fact.newIntegerLiteral(2);
		expr = null;
	}
	
	[After]
	public function tearDown():void
	{
		var buff:StringWriter = new StringWriter();
		var ast:LinkedListTree = ASTUtils.ast(expr);
		new ASTPrinter(buff).print(ast);
		var parsed:LinkedListTree = AS3FragmentParser.parseExpression(buff.toString());
		CodeMirror.assertASTMatch(ast, parsed);
	}
	
	[Test]
	public function testBasic():void
	{
		left = fact.newAddExpression(fact.newIntegerLiteral(1),
				fact.newIntegerLiteral(1));
		// the resulting structure will not be correct unless the
		// left-hand expression is parenthesized.  asblocks should add
		// parenthesis automatically, as required
		// i.e. (1 + 1) * 2
		expr = fact.newMultiplyExpression(left, right);
	}
	
	//[Test]
	public function testBasicParen():void
	{
		// pathenthesized expressions control evaluation order, but
		// don't have any other meaning, therefore asblocks doesn't
		// expose them in the DOM, except in their implied effect on
		// the expression tree structure.
		//expr = fact.newExpression("(1+1)") as IASBinaryExpression;
		//assertTrue(expr is IASBinaryExpression);
		//assertEquals(BinaryOperator.ADD, IASBinaryExpression(expr).getOperator());
	}
}
}