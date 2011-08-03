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
import org.as3commons.asblocks.IASProject;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;

public class Test_ASTASProject
{
	private var project:IASProject;
	
	[Before]
	public function setUp():void
	{
		project = new ASFactory().newEmptyASProject(".");
		assertEquals(".", project.getOutputLocation());
	}

	[Test]
	public function test_compilationUnits():void
	{
		assertEmpty(project.getCompilationUnits());
		var unit:IASCompilationUnit = project.newClass("Test");
		assertEquals(1, project.getCompilationUnits().size);
		assertEquals("Test", project.getCompilationUnits().itemAt(0).getType().getName());
		project.removeCompilationUnit(unit);
		assertEmpty(project.getCompilationUnits());
		unit = project.newInterface("ITest");
		assertEquals(1, project.getCompilationUnits().size);
		assertEquals("ITest", project.getCompilationUnits().itemAt(0).getType().getName());

		CodeMirror.assertReflection(new ASFactory(), unit);
	}

	[Test]
	public function test_classPathEntries():void
	{
		assertEmpty(project.getClassPathEntries());
		project.addClassPath(".");
		assertEquals(1, project.getClassPathEntries().size);
		project.removeClassPath(".");
		assertEmpty(project.getClassPathEntries());
	}

	[Test]
	public function test_sourcePathEntries():void
	{
		assertEmpty(project.getSourcePathEntries());
		project.addSourcePath(".");
		assertEquals(1, project.getSourcePathEntries().size);
		project.removeSourcePath(".");
		assertEmpty(project.getSourcePathEntries());
	}

	//[Test]
	public function test_addSourcePath():void
	{
		//project.addSourcePath("C:\\Users\\Teoti\\Documents\\Flash\\libraries\\"
		//		+ "flex_sdk_4.5.0.20967\\frameworks\\projects\\framework\\src");
		project.addSourcePath("C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-dom");
	}

	[Test]
	public function test_resourceRoots():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_outputLocation():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_newClass():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_newInterface():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_newFunction():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_newNamespace():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_readAll():void
	{
		// TODO impl unit test
	}

	[Test]
	public function test_writeAll():void
	{
		// TODO impl unit test
	}

	[Test]
	public function testClasspath():void
	{
		//		assertEmpty(project.getClassPathEntries());
		project.addClassPath(".");
		assertEquals(1, project.getClassPathEntries().size);
		project.removeClassPath(".");
		assertEmpty(project.getClassPathEntries());
	}

	private static function assertEmpty(list:IList):void
	{
		//assertEquals(Collections.EMPTY_LIST, list);
	}
}
}