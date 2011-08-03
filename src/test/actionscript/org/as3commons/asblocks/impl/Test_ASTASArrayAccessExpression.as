////////////////////////////////////////////////////////////////////////////////
// Copyright 2011 Michael Schmalle - Teoti Graphix, LLC
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASArrayAccessExpression
{
	private var factory:ASFactory = new ASFactory();
	private var expr:IASArrayAccessExpression;
	protected var subscript:IASExpression;
	protected var target:IASExpression;
	
	[Before]
	public function setUp():void
	{
		expr = null;
	}
	
	[After]
	public function tearDown():void
	{
		if (expr != null)
		{
			var buff:StringWriter = new StringWriter();
			var ast:LinkedListTree = ASTExpression(expr).getAST();
			new ASTPrinter(buff).print(ast);
			var parsed:LinkedListTree = AS3FragmentParser.parseExpression(buff.toString());
			CodeMirror.assertASTMatch(ast, parsed);
		}
	}

	[Test]
	public function test_example1():void
	{
		var target:IASExpression = factory.newExpression("foo");
		var subscript:IASExpression = factory.newIntegerLiteral(42);
		var aae:IASArrayAccessExpression = factory.newArrayAccessExpression(target, subscript);
		assertEquals("foo[42]", aae);
	}

	[Test]
	public function test_example2():void
	{
		var target:IASExpression = factory.newExpression("foo[42]");
		var subscript:IASExpression = factory.newExpression("0");
		var aae:IASArrayAccessExpression = factory.newArrayAccessExpression(target, subscript);
		assertEquals("foo[42][0]", aae);
	}
	
	[Test]
	public function testBasic():void
	{
		target = factory.newExpression("foo");
		subscript = factory.newIntegerLiteral(1);
		expr = factory.newArrayAccessExpression(target, subscript);
		ExtraAssertions.assertBothEquals(target, expr.getTarget());
		ExtraAssertions.assertBothEquals(subscript, expr.getSubscript());
	}
	
	[Test]
	public function testParse():void
	{
		expr = factory.newExpression("foo[1]") as IASArrayAccessExpression;
		target = factory.newExpression("foo");
		subscript = factory.newExpression("1");
	}
	
	[Test]
	public function testTokenBoundries():void
	{
		// XXX Fails do to AS3Parser bug in CodeMirror
//		expr = factory.newExpression("a[b][c]") as IASArrayAccessExpression;
//		var target:IASExpression = factory.newExpression("foo");
//		expr.setTarget(target);
	}
	
	[Test]
	public function testSubscript():void
	{
		expr = factory.newExpression("foo[1]") as IASArrayAccessExpression;
		target = factory.newExpression("foo");
		subscript = factory.newStringLiteral("bar");
		expr.setSubscript(subscript);
	}
}
}