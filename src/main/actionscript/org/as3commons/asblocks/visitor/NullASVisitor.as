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

package org.as3commons.asblocks.visitor
{

import org.as3commons.asblocks.IASProject;
import org.as3commons.asblocks.IASVisitor;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASFunctionType;
import org.as3commons.asblocks.dom.IASInterfaceType;
import org.as3commons.asblocks.dom.IASMember;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASType;

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class NullASVisitor implements IASVisitor
{
	public function NullASVisitor()
	{
	}
	
	public function visitProject(element:IASProject):void
	{
	}
	
	public function visitCompilationUnit(element:IASCompilationUnit):void
	{
	}
	
	public function visitPackage(element:IASPackage):void
	{
	}
	
	public function visitType(element:IASType):void
	{
	}
	
	public function visitClass(element:IASClassType):void
	{
	}
	
	public function visitInterface(element:IASInterfaceType):void
	{
	}
	
	public function visitFunction(element:IASFunctionType):void
	{
	}
	
	public function visitMember(element:IASMember):void
	{
	}
	
	public function visitMethod(element:IASMethod):void
	{
	}
	
	public function visitField(element:IASField):void
	{
	}
}
}