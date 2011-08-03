package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASInvocation;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASInvocationExpression
{
	protected var factory:ASFactory = new ASFactory();
	protected var sub:IASExpression;
	protected var expr:IASInvocation;
	protected var args:IList;
	
	[Before]
	public function setUp():void
	{
		args = new ArrayList();
		sub = factory.newExpression("com.example.MyClass");
	}
	
	[After]
	public function tearDown():void
	{
		var buff:StringWriter = new StringWriter();
		if (expr != null)
		{
			var ast:LinkedListTree = ASTInvocation(expr).getAST();
			new ASTPrinter(buff).print(ast);
			var parsed:LinkedListTree = AS3FragmentParser.parseExpression(buff.toString());
			CodeMirror.assertASTMatch(ast, parsed);
		}
	}

	protected function newTestExpr(sub:IASExpression, args:IList):IASInvocation
	{
		return factory.newInvocationExpression(sub, args);
	}

	[Test]
	public function test_examples1():void
	{
		var target:IASExpression = factory.newExpression("foo");
		var ii:IASInvocationExpression = factory.newInvocationExpression(target, null);
		assertEquals("foo()", ii.toString());
	}

	[Test]
	public function test_examples2():void
	{
		var target:IASExpression = factory.newExpression("foo");
		var arguments:IList = new ArrayList();
		arguments.add(factory.newExpression("bar"));
		arguments.add(factory.newStringLiteral("baz"));
		var ii:IASInvocationExpression = factory.newInvocationExpression(target, arguments);
		assertEquals("foo(bar, \"baz\")", ii.toString());
	}

	[Test]
	public function test_examples3():void
	{
		var target:IASExpression = factory.newExpression("foo");
		var ii:IASInvocationExpression = factory.newInvocationExpression(target, null);
		ii.setTarget(factory.newExpression("bar"));
		assertEquals("bar()", ii.toString());
	}

	[Test]
	public function test_examples4():void
	{
		var target:IASExpression = factory.newExpression("baz");
		var ii:IASInvocationExpression = factory.newInvocationExpression(target, null);
		var arguments:IList = new ArrayList();
		arguments.add(factory.newExpression("bar"));
		arguments.add(factory.newStringLiteral("foo"));
		ii.setArguments(arguments);
		assertEquals("baz(bar, \"foo\")", ii.toString());
	}

	[Test]
	public function test_examples5():void
	{
		var target1:IASExpression = factory.newExpression("foo");
		var access:IASFieldAccessExpression = factory.newFieldAccessExpression(target1, "bar");
		var ii:IASInvocationExpression = factory.newInvocationExpression(access, null);
		var arguments:IList = new ArrayList();
		arguments.add(factory.newIntegerLiteral(42));
		ii.setArguments(arguments);
		assertEquals("foo.bar(42)", ii.toString());
	}
	
	[Test]
	public function testBasic():void
	{
		args.add(factory.newIntegerLiteral(1));
		expr = newTestExpr(sub, args);
		ExtraAssertions.assertBothEquals(sub, expr.getTarget());
		var actualArgs:IList = expr.getArguments();
		assertEquals(1, actualArgs.size);
	}

	[Test]
	public function testSetExpression():void
	{
		expr = newTestExpr(sub, args);
		sub = factory.newExpression("Replacement");
		expr.setTarget(sub);
		ExtraAssertions.assertBothEquals(sub, expr.getTarget());
	}

	[Test]
	public function testSetArguments():void
	{
		expr = newTestExpr(sub, args);
		var newArgs:IList = new ArrayList();
		var arg1:IASIntegerLiteral = factory.newIntegerLiteral(1);
		newArgs.add(arg1);
		var arg2:IASStringLiteral = factory.newStringLiteral("foo");
		newArgs.add(arg2);
		expr.setArguments(newArgs);
		assertEquals(2, expr.getArguments().size);
		ExtraAssertions.assertBothEquals(arg1, expr.getArguments().itemAt(0));
		ExtraAssertions.assertBothEquals(arg2, expr.getArguments().itemAt(1));
	}
	
	[Test]
	public function testReplaceArguments():void
	{
		expr = newTestExpr(sub, args);
		var args:IList = new ArrayList();
		var arg:IASIntegerLiteral = factory.newIntegerLiteral(1);
		args.add(arg);
		expr.setArguments(args);
		var newArgs:IList = new ArrayList();
		var newArg:IASStringLiteral = factory.newStringLiteral("foo");
		newArgs.add(newArg);
		expr.setArguments(newArgs);
		assertEquals(1, expr.getArguments().size);
		ExtraAssertions.assertBothEquals(newArg, expr.getArguments().itemAt(0));
	}
}
}