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
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASLiteral;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASNullLiteral;
import org.as3commons.asblocks.dom.IASObjectLiteral;
import org.as3commons.asblocks.dom.IASPropertyField;
import org.as3commons.asblocks.dom.IASRegexpLiteral;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.dom.IASUndefinedLiteral;
import org.as3commons.asblocks.dom.IASXMLLiteral;
import org.as3commons.asblocks.dom.Visibility;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertTrue;

public class Test_ASTASLiteral
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var reflect:IASCompilationUnit;
	private var literal:IASLiteral = null;

	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
		reflect = null;
		literal = null;
	}
	
	[After]
	public function tearDown():void
	{
		if (literal != null && reflect == null)
		{
			var clazz:IASClassType = unit.getType() as IASClassType;
			var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, null);
			    meth.newExpressionStatement(fact.newAssignExpression(
					    fact.newExpression("a"), literal));
			reflect = assertReflection();
		}
	}

	private function assertReflection():IASCompilationUnit
	{
		return CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function testStringLiteral():void
	{
		var lit:IASStringLiteral = fact.newStringLiteral("");
		assertEquals("", lit.getValue());
		lit.setValue("\"");
		assertEquals("\"", lit.getValue());
		literal = lit;
	}
	
	[Test]
	public function testNumberLiteral():void
	{
		var lit:IASIntegerLiteral = fact.newIntegerLiteral(123);
		assertEquals(123, lit.getValue());
		lit.setValue(0);
		assertEquals(0, lit.getValue());
		literal = lit;
	}
	
	[Test]
	public function testNullLiteral():void
	{
		var lit:IASNullLiteral = fact.newNullLiteral();
		assertNotNull(lit);
		literal = lit;
	}
	
	[Test]
	public function testParseNullLiteral():void
	{
		var lit:IASNullLiteral = fact.newExpression("null") as IASNullLiteral;
		assertNotNull(lit);
		literal = lit;
	}
	
	[Test]
	public function testBoolLiteral():void
	{
		var lit:IASBooleanLiteral = fact.newBooleanLiteral(true);
		assertTrue(lit.getValue());
		lit.setValue(false);
		assertFalse(lit.getValue());

		lit = fact.newBooleanLiteral(false);
		assertFalse(lit.getValue());
		lit.setValue(true);
		assertTrue(lit.getValue());

		ExtraAssertions.assertInstanceof(fact.newExpression("true"), IASBooleanLiteral);
		literal = lit;
	}
	
	[Test]
	public function testUndefinedLiteral():void
	{
		var lit:IASUndefinedLiteral = fact.newUndefinedLiteral();
		assertNotNull(lit);
		literal = lit;
	}
	
	[Test]
	public function testParseUndefinedLiteral():void
	{
		var lit:IASUndefinedLiteral = fact.newExpression("undefined") as IASUndefinedLiteral;
		assertNotNull(lit);
		literal = lit;
	}
	
	[Test]
	public function testEmptyArrayLiteral():void
	{
		var lit:IASArrayLiteral = fact.newArrayLiteral();
		assertNotNull(lit);
		ExtraAssertions.assertSize(0, lit.getEntries());
		literal = lit;
	}
	
	[Test]
	public function testArrayLiteral():void
	{
		var lit:IASArrayLiteral = fact.newArrayLiteral();
		lit.add(fact.newIntegerLiteral(1));
		ExtraAssertions.assertSize(1, lit.getEntries());
		ExtraAssertions.assertInstanceof(lit.getEntries().itemAt(0), IASIntegerLiteral);
		lit.add(fact.newStringLiteral("foo"));
		ExtraAssertions.assertSize(2, lit.getEntries());
		ExtraAssertions.assertInstanceof(lit.getEntries().itemAt(1), IASStringLiteral);
		literal = lit;
	}
	
	[Test]
	public function testArrayLiteralRemoveFirst():void
	{
		var lit:IASArrayLiteral = fact.newArrayLiteral();
		lit.add(fact.newIntegerLiteral(1));
		lit.add(fact.newStringLiteral("foo"));
		lit.remove(0);
		ExtraAssertions.assertSize(1, lit.getEntries());
		literal = lit;
	}
	
	[Test]
	public function testArrayLiteralRemoveLast():void
	{
		var lit:IASArrayLiteral = fact.newArrayLiteral();
		lit.add(fact.newIntegerLiteral(1));
		lit.add(fact.newStringLiteral("foo"));
		lit.remove(1);
		ExtraAssertions.assertSize(1, lit.getEntries());
		literal = lit;
	}
	
	[Test]
	public function testArrayLiteralRemoveMiddle():void
	{
		var lit:IASArrayLiteral = fact.newArrayLiteral();
		lit.add(fact.newIntegerLiteral(1));
		lit.add(fact.newStringLiteral("foo"));
		lit.add(fact.newBooleanLiteral(false));
		lit.remove(1);
		ExtraAssertions.assertSize(2, lit.getEntries());
		literal = lit;
	}
	
	[Test]
	public function testParseArrayLiteral():void
	{
		literal = fact.newExpression("['foo', [1]]") as IASArrayLiteral;
		assertNotNull(literal);
	}
	
	[Test]
	public function testEmptyObjectLiteral():void
	{
		var lit:IASObjectLiteral = fact.newObjectLiteral();
		assertNotNull(lit);
		ExtraAssertions.assertSize(0, lit.getFields());
		literal = lit;
	}
	
	[Test]
	public function testObjectLiteral():void
	{
		var lit:IASObjectLiteral = fact.newObjectLiteral();
		var field:IASPropertyField = lit.newField("foo", fact.newIntegerLiteral(33));
		assertEquals("foo", field.getName());
		ExtraAssertions.assertInstanceof(field.getValue(), IASIntegerLiteral);
		field = lit.newField("bar", fact.newStringLiteral("hello"));
		literal = lit;
	}
	
	[Test]
	public function testParseObjectLiteral():void
	{
		var expr:IASAssignmentExpression = fact.newExpression("test = {foo:2}") as IASAssignmentExpression;
		literal = expr.getRightExpression() as IASLiteral;
	}
	
	[Test]
	public function testXMLLiteral():void
	{
		var lit:IASXMLLiteral = fact.newXMLLiteral("<hello>world</hello>");
		assertNotNull(lit);
		literal = lit;
	}
	
	[Test]
	public function testParseXMLLiteral():void
	{
		var lit:IASXMLLiteral = fact.newExpression("<hello>world</hello>") as IASXMLLiteral;
		assertNotNull(lit);
		literal = lit;
	}
	
	//[Test]
	public function testRegexpLiteral():void
	{
		var lit:IASRegexpLiteral = fact.newRegexpLiteral("\\d+", ASTASRegexpLiteral.FLAG_NONE);
		assertNotNull(lit);
		literal = lit;
	}
	
	//[Test]
	public function testParseRegexpLiteral():void
	{
		var lit:IASRegexpLiteral = fact.newExpression("/[a-z]+-\\d+/i") as IASRegexpLiteral;
		
		assertNotNull(lit);
		literal = lit;
	}
}
}