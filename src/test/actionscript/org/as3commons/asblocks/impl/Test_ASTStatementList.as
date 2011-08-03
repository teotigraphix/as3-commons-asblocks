package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASBreakStatement;
import org.as3commons.asblocks.dom.IASCatchClause;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASContinueStatement;
import org.as3commons.asblocks.dom.IASDeclaration;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASDefaultXMLNamespaceStatement;
import org.as3commons.asblocks.dom.IASDoWhileStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASExpressionStatement;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASFinallyClause;
import org.as3commons.asblocks.dom.IASForEachInStatement;
import org.as3commons.asblocks.dom.IASForInStatement;
import org.as3commons.asblocks.dom.IASForStatement;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.as3commons.asblocks.dom.IASLabelStatement;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.IASReturnStatement;
import org.as3commons.asblocks.dom.IASSimpleNameExpression;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.dom.IASSwitchCase;
import org.as3commons.asblocks.dom.IASSwitchDefault;
import org.as3commons.asblocks.dom.IASSwitchStatement;
import org.as3commons.asblocks.dom.IASThrowStatement;
import org.as3commons.asblocks.dom.IASTryStatement;
import org.as3commons.asblocks.dom.IASUseStatement;
import org.as3commons.asblocks.dom.IASWhileStatement;
import org.as3commons.asblocks.dom.IASWithStatement;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;

public class Test_ASTStatementList
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var clazz:IASClassType;
	private var method:IASMethod;
	private var reflect:IASCompilationUnit;
	
	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
		clazz = unit.getType() as IASClassType;
		method = clazz.newMethod("test", Visibility.PUBLIC, null);
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}

	[Test]
	public function test_hasStatements():void
	{
		assertFalse(method.hasStatements());
		var statement:IASStatement = method.parseStatement("bar");
		assertTrue(method.hasStatements());
		method.removeStatement(statement);
		assertFalse(method.hasStatements());
	}

	[Test]
	public function test_getStatements():void
	{
		method.parseStatement("foo");
		var statement:IASStatement = method.parseStatement("bar");
		method.parseStatement("baz");
		var children:IList = method.getStatements();
		assertEquals(3, children.size);
		method.removeStatement(statement);
		children = method.getStatements();
		assertEquals(2, children.size);
		var es:IASExpressionStatement = children.itemAt(1) as IASExpressionStatement;
		var name:IASSimpleNameExpression = es.getExpression() as IASSimpleNameExpression;
		assertEquals("baz", name.getName());
	}

	[Test]
	public function test_addStatement():void
	{
		var statement:IASStatement = fact.newStatement("trace('Hello Foo!')");
		method.addStatement(statement);
		// try to add the same statement again
		try
		{
			method.addStatement(statement);
			fail("The same IASStatement cannot be added to the same contianer");
		}
		catch (e:ASBlocksSyntaxError)
		{
		}

	}

	[Test]
	public function test_parseStatement():void
	{
		var statement:IASStatement = method.parseStatement("trace('Hello Foo!')");
		ExtraAssertions.assertInstanceof(statement, IASExpressionStatement);
	}

	[Test]
	public function test_removeStatement():void
	{
		// TODO check begin and end removal
		method.parseStatement("foo");
		var statement:IASStatement = method.parseStatement("bar");
		method.parseStatement("baz");
		var children:IList = method.getStatements();
		assertEquals(3, children.size);
		method.removeStatement(statement);
		children = method.getStatements();
		assertEquals(2, children.size);
		var es:IASExpressionStatement = children.itemAt(1) as IASExpressionStatement;
		var name:IASSimpleNameExpression = es.getExpression() as IASSimpleNameExpression;
		assertEquals("baz", name.getName());
	}

	[Test]
	public function test_parseExpressionStatement():void
	{
		assertEquals(0, method.getStatements().size);
		var statement:IASExpressionStatement = method.parseNewExpressionStatement("foo.bar()");
		assertNotNull(statement);
		ExtraAssertions.assertInstanceof(statement.getExpression(), IASInvocationExpression);
		assertEquals(1, method.getStatements().size);
	}

	[Test]
	public function test_newExpressionStatement():void
	{
		var expression:IASExpression = fact.newExpression("foo[bar]");
		assertEquals(0, method.getStatements().size);
		var statement:IASExpressionStatement = method.newExpressionStatement(expression);
		assertNotNull(statement);
		ExtraAssertions.assertInstanceof(statement.getExpression(), IASArrayAccessExpression);
		assertEquals(1, method.getStatements().size);
	}

	[Test]
	public function test_addComment():void
	{
		method.addComment(" An inline foo");
		method.parseStatement("foo");
		method.addComment(" An inline bar");
		method.parseStatement("bar");
	}

	[Test]
	public function test_newIf():void
	{
		var parsedIfStmt:IASIfStatement = method.parseNewIf("a == b");
		assertNotNull(parsedIfStmt);
		var ifStatement:IASIfStatement = method.newIf(fact.newExpression("a == b"));
		ifStatement.parseStatement("trace('then true!')");
		assertNull(ifStatement.getElseStatement());
		ifStatement.getElse().parseStatement("trace('else false!')");
		var elseStatement:IASStatement = ifStatement.getElseStatement();
		assertNotNull(elseStatement);
		assertEquals("a == b", ifStatement.getConditionString());
		ifStatement.setCondition(fact.newExpression("b == a"));
		assertEquals("b == a", ifStatement.getConditionString());
		ExtraAssertions.assertInstanceof(ifStatement.getCondition(), IASBinaryExpression);
		ifStatement.setCondition(fact.newBooleanLiteral(true));
		assertTrue(IASBooleanLiteral(ifStatement.getCondition()).getValue());
	}

	[Test]
	public function test_newIf_elseIf():void
	{
		var stub:IASIfStatement = fact.newStatement("if (true) {\n}") as IASIfStatement;
		var ist:IASIfStatement = method.parseNewIf("a == b");
		ist.parseStatement("trace('if')");
		ist.setElseStatement(stub);
		ExtraAssertions.assertBothEquals(stub, ist.getElseStatement());
		stub.parseStatement("trace('else if')");
		stub.getElse().parseStatement("trace('else')");
	}
	
	[Test]
	public function test_if_Parse():void
	{
		var ifStmt:IASIfStatement = method.parseStatement("if (foo) blah();") as IASIfStatement;
		assertNotNull(ifStmt.getThenStatement());
		ExtraAssertions.assertInstanceof(ifStmt.getThenStatement(), IASExpressionStatement);
		try
		{
			// no block in the 'if', so SyntaxException is expected,
			ifStmt.getStatements();
			fail();
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}

	[Test]
	public function test_ifElseIf_Parse():void
	{
		var ifStmt:IASIfStatement = method.parseStatement("if (foo) {blah();} else if (bar) {other();}") as IASIfStatement;
		assertNotNull(ifStmt.getElseStatement());
		ExtraAssertions.assertInstanceof(ifStmt.getElseStatement(), IASIfStatement);
		try
		{
			ifStmt.getElse();
			fail("should not allow access to block from else-clause when else-clause contains other stmt type");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}

	[Test]
	public function test_newFor():void
	{
		var forStmt:IASForStatement = method.newFor(null, null, null);
		forStmt.parseStatement("trace(\"foo bar!\")");
		assertNull(forStmt.getInitializerString());
		assertNull(forStmt.getConditionString());
		assertNull(forStmt.getIteratorString());
		//		forStmt.parseInitializer("var j");
		//		forStmt.parseCondition("j<10");
		//		forStmt.parseIterator("j++");

		forStmt.setInitializer(fact.newDeclaration("j = 0"));
		forStmt.setCondition(fact.newExpression("j<10"));
		forStmt.setIterator(fact.newExpression("j++"));

		assertEquals("var j = 0", forStmt.getInitializerString());
		assertEquals("j<10", forStmt.getConditionString());
		assertEquals("j++", forStmt.getIteratorString());
		ExtraAssertions.assertInstanceof(forStmt.getInitializer(), IASDeclarationStatement);
		ExtraAssertions.assertInstanceof(forStmt.getCondition(), IASBinaryExpression);
		ExtraAssertions.assertInstanceof(forStmt.getIterator(), IASPostfixExpression);

		forStmt = method.parseNewFor("const i", "i<10", "i++");
		forStmt.parseStatement("trace(i)");
		assertEquals("const i", forStmt.getInitializerString());
		assertEquals("i<10", forStmt.getConditionString());
		assertEquals("i++", forStmt.getIteratorString());

		forStmt.setInitializer(null);
		forStmt.setCondition(null);
		forStmt.setIterator(null);

		assertNull(forStmt.getInitializerString());
		assertNull(forStmt.getConditionString());
		assertNull(forStmt.getIteratorString());

		forStmt.setInitializer(fact.newDeclaration("k=0"));
		assertEquals("var k=0", forStmt.getInitializerString());
		ExtraAssertions.assertInstanceof(forStmt.getInitializer(), IASDeclarationStatement);
		forStmt.setCondition(fact.newBooleanLiteral(true));
		ExtraAssertions.assertInstanceof(forStmt.getCondition(), IASBooleanLiteral);
		forStmt.setIterator(fact.newExpression("++i"));
		ExtraAssertions.assertInstanceof(forStmt.getIterator(), IASPrefixExpression);
	}

	[Test]
	public function test_newForIn():void
	{
		var forInStmt:IASForInStatement = method.parseNewForIn("var i", "obj.arry");
		forInStmt.parseStatement("trace(i)");

		assertEquals("var i", forInStmt.getInitializerString());
		assertEquals("obj.arry", forInStmt.getIteratorString());
		ExtraAssertions.assertInstanceof(forInStmt.getIterator(), IASFieldAccessExpression);

		forInStmt.parseInitializer("j");
		forInStmt.parseIterator("obj");
		assertEquals("j", forInStmt.getInitializerString());
		assertEquals("obj", forInStmt.getIteratorString());
		forInStmt.setIterator(fact.newExpression("obj.blah"));
	}

	[Test]
	public function test_newForEachIn():void
	{
		var forInStmt:IASForEachInStatement = method.parseNewForEachIn("var i", "obj.arry");
		forInStmt.parseStatement("trace(i)");

		assertEquals("var i", forInStmt.getInitializerString());
		assertEquals("obj.arry", forInStmt.getIteratorString());
		ExtraAssertions.assertInstanceof(forInStmt.getIterator(), IASFieldAccessExpression);

		forInStmt.parseInitializer("j");
		forInStmt.parseIterator("obj");
		assertEquals("j", forInStmt.getInitializerString());
		assertEquals("obj", forInStmt.getIteratorString());
		forInStmt.setIterator(fact.newExpression("obj.blah"));
	}

	[Test]
	public function test_newWhile():void
	{
		var whileStmt:IASWhileStatement = method.newWhile(fact.newExpression("test()"));
		whileStmt.parseStatement("trace(result())");
		assertEquals("test()", whileStmt.getConditionString());
		whileStmt.setCondition(fact.newExpression("a == b"));
		assertEquals("a == b", whileStmt.getConditionString());
		ExtraAssertions.assertInstanceof(whileStmt.getCondition(), IASBinaryExpression);
		ExtraAssertions.assertInstanceof(whileStmt.getBody(), IASBlock);
	}

	[Test]
	public function test_while_condition():void
	{
		var left:IASExpression = fact.newExpression("a");
		var right:IASExpression = fact.newExpression("b");
		var whileStmt:IASWhileStatement = method.newWhile(fact.newAndExpression(left, right));
		whileStmt.parseStatement("trace(result())");
		assertEquals("a && b", whileStmt.getConditionString());
		whileStmt.setCondition(fact.newBooleanLiteral(true));
		ExtraAssertions.assertInstanceof(whileStmt.getCondition(), IASBooleanLiteral);
	}

	[Test]
	public function test_newDoWhile_Expression():void
	{
		var doWhileStmt:IASDoWhileStatement = method.parseNewDoWhile("test()");
		doWhileStmt.parseStatement("trace(result())");
		assertEquals("test()", doWhileStmt.getConditionString());
		doWhileStmt.parseCondition("a == b");
		assertEquals("a == b", doWhileStmt.getConditionString());
		ExtraAssertions.assertInstanceof(doWhileStmt.getCondition(), IASBinaryExpression);
		doWhileStmt.setCondition(fact.newBooleanLiteral(true));
	}

	[Test]
	public function test_newSwitch():void
	{
		var swtch:IASSwitchStatement = method.parseNewSwitch("foo");
		var cas:IASSwitchCase = swtch.newCase("1");
		assertFalse("Empty case statement claims to contain code", cas.hasStatements());
		cas.parseStatement("trace(1)");
		assertEquals("1", cas.getLabelString());
		ExtraAssertions.assertInstanceof(cas.getLabel(), IASIntegerLiteral);
		cas.parseLabel("2");
		assertEquals("2", cas.getLabelString());
		var def:IASSwitchDefault = swtch.newDefault();
		def.parseStatement("trace('default')");
		var labels:IList = swtch.getLabels();
		ExtraAssertions.assertSize(2, labels);
		ExtraAssertions.assertInstanceof(labels.itemAt(0), IASSwitchCase);
		ExtraAssertions.assertInstanceof(labels.itemAt(1), IASSwitchDefault);

		// condition tests,
		assertNotNull(swtch.getCondition());
		swtch.setCondition(fact.newIntegerLiteral(333));
		assertTrue(swtch.getCondition() is IASIntegerLiteral);
		assertEquals(333, IASIntegerLiteral(swtch.getCondition()).getValue());
	}

	[Test]
	public function test_newSwitch_parseCondition():void
	{
		var swtch:IASSwitchStatement = method.parseNewSwitch("foo");
		var cas:IASSwitchCase = swtch.newCase("1");
		cas.addComment(" bla");
		swtch.parseCondition("foo[bar]");
		assertEquals("foo[bar]", swtch.getConditionString());
	}
	
	[Test]
	public function test_newWith():void
	{
		var witz:IASWithStatement = method.parseNewWith("foo");
		witz.parseStatement("trace(test)");
		assertEquals("foo", witz.getScopeString());
		witz.parseScope("foo.bar");
		assertEquals("foo.bar", witz.getScopeString());
		ExtraAssertions.assertInstanceof(witz.getScope(), IASFieldAccessExpression);
		witz.setScope(fact.newExpression("bar.foo"));
		ExtraAssertions.assertInstanceof(witz.getScope(), IASFieldAccessExpression);
		ExtraAssertions.assertInstanceof(witz.getBody(), IASBlock);
	}

	[Test]
	public function test_newDeclaration_Parse():void
	{
		var decl:IASDeclarationStatement = method.parseStatement("var a=1, b:String='2'") as IASDeclarationStatement;
		var vars:IList = decl.getDeclarations();
		ExtraAssertions.assertSize(2, vars);

		var a:IASDeclaration = vars.itemAt(0) as IASDeclaration;
		assertEquals("a", a.getName());
		assertNull(a.getType());
		ExtraAssertions.assertInstanceof(a.getInitializer(), IASIntegerLiteral);

		var b:IASDeclaration = vars.itemAt(1) as IASDeclaration;
		assertEquals("b", b.getName());
		assertEquals("String", b.getType());
		ExtraAssertions.assertInstanceof(b.getInitializer(), IASStringLiteral);
	}

	[Test]
	public function test_newDeclaration_Expression():void
	{
		var decl:IASDeclarationStatement = method.parseNewDeclaration("a=1");
		assertFalse(decl.isConstant());
		decl.setConstant(false); // should not change the result
		assertFalse(decl.isConstant());

		assertEquals("a", decl.getName());
		assertNull(decl.getType());
		ExtraAssertions.assertInstanceof(decl.getInitializer(), IASIntegerLiteral);

		decl.setConstant(true);
		assertTrue(decl.isConstant());

		var vars:IList = decl.getDeclarations();
		ExtraAssertions.assertSize(1, vars);
		var vaz:IASDeclaration = vars.itemAt(0) as IASDeclaration;
		assertEquals("a", vaz.getName());
		assertNull(vaz.getType());
		ExtraAssertions.assertInstanceof(vaz.getInitializer(), IASIntegerLiteral);
	}

	[Test]
	public function test_newReturn():void
	{
		var returnStmt:IASReturnStatement = method.newReturn();
		assertNull(returnStmt.getExpressionString());
		returnStmt.parseExpression("false");
		assertEquals("false", returnStmt.getExpressionString());
		ExtraAssertions.assertInstanceof(returnStmt.getExpression(), IASBooleanLiteral);
		returnStmt.setExpression(fact.newIntegerLiteral(2));
		ExtraAssertions.assertInstanceof(returnStmt.getExpression(), IASIntegerLiteral);
		assertFirstReflectedStatementIsA(IASReturnStatement);
	}

	[Test]
	public function test_return_remove():void
	{
		// TODO need to remove the extra space between the return and expr
		// right now it's still there
		var returnStmt:IASReturnStatement = method.parseNewReturn("true");
		assertEquals("true", returnStmt.getExpressionString());
		returnStmt.parseExpression(null);
		assertNull(returnStmt.getExpressionString());
		assertNull(returnStmt.getExpression());

		// test removal when there's already nothing to remove,
		returnStmt.parseExpression(null);
	}

	[Test]
	public function test_blockEmpty():void
	{
		assertFalse(method.hasStatements());
		method.addComment(" a comment");
		assertFalse(method.hasStatements());
		method.parseStatement("return foo");
		assertTrue(method.hasStatements());
	}

	[Test]
	public function test_ifBlockReplace():void
	{
		var ifStmt:IASIfStatement = method.parseNewIf("foo");
		var block:IASBlock = new ASFactory().newBlock();
		block.addComment("test new block");
		block.newReturn();
		ifStmt.setThen(block);
		var b:IASBlock = ifStmt.getThenStatement() as IASBlock;
		assertTrue(b.hasStatements());

	}
	
	[Test]
	public function test_block_parse():void
	{
		// TODO get this to indent correctly
		var stmt:IASBlock = method.parseStatement("{ }") as IASBlock;
	}

	[Test]
	public function test_newBreak():void
	{
		var brk:IASBreakStatement = method.parseStatement("break") as IASBreakStatement;
		ExtraAssertions.assertInstanceof(brk, IASBreakStatement);
		method.newBreak();
	}

	[Test]
	public function test_newBreak_label():void
	{
		var brk:IASStatement = method.parseStatement("break foo");
		ExtraAssertions.assertInstanceof(brk, IASBreakStatement);
		var b:IASBreakStatement = method.newBreak("foo");
		assertEquals("foo", b.getLabelString());
		// remove the label
		b.setLabel(null);
		assertNull(b.getLabelString());
		// set expression
		//b.setLabel(fact.newSimpleNameExpression("bar"));
		//assertEquals("bar", b.getLabelString());
	}

	[Test]
	public function test_superStatementNoArg():void
	{
		//IASSuperStatement stmt = method.newSuper(Collections.EMPTY_LIST);
		//assertEquals(0, stmt.getArguments().size());
	}

	[Test]
	public function test_SuperStatement():void
	{
		//List args = Collections.singletonList(fact.newIntegerLiteral(1));
		//IASSuperStatement stmt = method.newSuper(args);
		//assertEquals(1, stmt.getArguments().size());
		//IASExpression arg = (IASExpression) stmt.getArguments().get(0);
		//assertEquals(1, ((IASIntegerLiteral) arg).getValue());
	}

	[Test]
	public function test_ParseSuper():void
	{
		//IASSuperStatement stmt = (IASSuperStatement)method.parseStatement("super()");
		//assertEquals(0, stmt.getArguments().size());
	}

	[Test]
	public function test_newTryCatch_String():void
	{
		var tryStmt:IASTryStatement = method.parseNewTryCatch("e", "Exception");
		tryStmt.parseStatement("trace('trying')");
		var catches:IList = tryStmt.getCatchClauses();
		ExtraAssertions.assertSize(1, catches);
		assertEquals(1, catches.size);
		var eCatch:IASCatchClause = catches.itemAt(0) as IASCatchClause;
		eCatch.parseStatement("trace('catching e')");
		assertEquals("e", eCatch.getName());
		assertEquals("Exception", eCatch.getType());
		assertNull(tryStmt.getFinallyClause());
		var fCatch:IASCatchClause = tryStmt.newCatchClause("f", "Error");
		fCatch.parseStatement("trace('catching f')");
	}

	[Test]
	public function test_newTryFinally():void
	{
		var tryStmt:IASTryStatement = method.newTryFinally();
		var finallyClause:IASFinallyClause = tryStmt.getFinallyClause();
		assertNotNull(finallyClause);
		assertFalse(finallyClause.hasStatements());
		finallyClause.parseStatement("trace('hello')");
		assertTrue(finallyClause.hasStatements());
		try
		{
			finallyClause = tryStmt.newFinallyClause();
			fail("shouldn't be able to add another finally-clause");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}

	[Test]
	public function test_parseTrayCatchFinally():void
	{
		var tryStmt:IASTryStatement = method.parseStatement("try {"
				+ "} catch (e) {"
				+ "} catch (f:Exception) {"
				+ "} finally {"
				+ "}") as IASTryStatement;
		var catches:IList = tryStmt.getCatchClauses();
		ExtraAssertions.assertSize(2, catches);

		var catch0:IASCatchClause = catches.itemAt(0) as IASCatchClause;
		assertEquals("e", catch0.getName());
		assertNull(catch0.getType());

		var catch1:IASCatchClause = catches.itemAt(1) as IASCatchClause;
		assertEquals("f", catch1.getName());
		assertEquals("Exception", catch1.getType());

		assertNotNull(tryStmt.getFinallyClause());
	}

	[Test]
	public function test_newContinue():void
	{
		var continueStmt:IASContinueStatement = method.newContinue();
		assertNotNull(continueStmt);
		ExtraAssertions.assertInstanceof(method.parseStatement("continue"), IASContinueStatement);
	}

	[Test]
	public function test_newContinue_label():void
	{
		var cnt:IASStatement = method.parseStatement("continue foo");
		ExtraAssertions.assertInstanceof(cnt, IASContinueStatement);
		var b:IASContinueStatement = method.newContinue("foo");
		assertEquals("foo", b.getLabel());
		// remove the label
		b.setLabel(null);
		assertNull(b.getLabel());
		// set expression
		//b.setLabel(fact.newSimpleNameExpression("bar"));
		//assertEquals("bar", b.getLabelString());
	}

	[Test]
	public function test_newThrow_Expression():void
	{
		var t:IASExpression = fact.newExpression("new Error()");
		var throwStmt:IASThrowStatement = method.newThrow(t);
		//ExtraAssertions.assertInstanceof(throwStmt.getExpression(), IASNewExpression.class);
		ExtraAssertions.assertInstanceof(throwStmt.getExpression(), IASInvocationExpression);
	}

	[Test]
	public function test_newThrow_parse():void
	{
		var throwStmt:IASThrowStatement = method.parseStatement("throw \"oops\"") as IASThrowStatement;
		ExtraAssertions.assertInstanceof(throwStmt.getExpression(), IASStringLiteral);
	}

	[Test]
	public function test_newDefaultXMLNamespace_String():void
	{
		var ns:IASDefaultXMLNamespaceStatement = method.parseStatement("default xml namespace = \"hello.org\"") as IASDefaultXMLNamespaceStatement;
		assertEquals("hello.org", ns.getNamespace());
	}

	[Test]
	public function test_newLabelStatement():void
	{
		var label:IASLabelStatement = method.parseNewLabel("foo");
		assertEquals("foo", label.getLabel());

		label.setLabel("bar");
		assertEquals("bar", label.getLabel());

		//label.parseNewIf("true");

		var block:IASBlock = fact.newBlock();
		block.parseStatement("foo.bar()");

		label.setStatement(block);

		var ifs:IASIfStatement = fact.newStatement("if (true) {\n}") as IASIfStatement;
		ifs.parseStatement("ifs()");
		label.setStatement(ifs);

		ExtraAssertions.assertBothEquals(ifs, label.getStatement());
	}

	[Test]
	public function test_newUse():void
	{
		var us:IASUseStatement = method.newUse(fact.newExpression("the_universe"));
		
		assertEquals("the_universe", us.getName());
		
		us = method.parseNewUse("space");
		assertEquals("space", us.getName());
	}
	
	private function assertFirstReflectedStatementIsA(expectedClass:Class):void
	{
		reflect = assertReflection();
		var clazz:IASClassType = reflect.getType() as IASClassType;
		var meth:IASMethod = clazz.getMethod("test");
		var statements:IList = meth.getStatements();
		var stmt:Object = statements.itemAt(0);
		//assertTrue("Expected instance of " + expectedClass.getName() + ", got "
		//		+ stmt.getClass().getName(), expectedClass.isInstance(stmt));
	}

	private function assertReflection():IASCompilationUnit
	{
		return CodeMirror.assertReflection(fact, unit);
	}
}
}