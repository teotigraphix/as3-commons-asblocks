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

import mx.collections.IList;

import org.as3commons.asblocks.IASProject;
import org.as3commons.asblocks.IASVisitor;
import org.as3commons.asblocks.IASWalker;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASFunctionType;
import org.as3commons.asblocks.dom.IASInterfaceType;
import org.as3commons.asblocks.dom.IASMember;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASNamespaceType;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASType;

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class ASWalker implements IASWalker
{
	
	//--------------------------------------------------------------------------
	//
	//  Protected :: Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	protected var visitor:IASVisitor;
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	
	public function ASWalker(visitor:IASVisitor)
	{
		this.visitor = visitor;
	}
	
	public function walkProject(element:IASProject):void
	{
		visitor.visitProject(element);
		
		for each (var unit:IASCompilationUnit in element.getCompilationUnits().toArray())
		{
			walkCompilationUnit(unit);
		}
	}
	
	public function walkCompilationUnit(element:IASCompilationUnit):void
	{
		visitor.visitCompilationUnit(element);
		walkPackage(element.getPackage());
	}
	
	public function walkPackage(element:IASPackage):void
	{
		visitor.visitPackage(element);
		walkType(element.getType());
	}
	
	public function walkType(element:IASType):void
	{
		visitor.visitType(element);
		if (element is IASClassType)
		{
			walkClass(element as IASClassType);
		}
		else if (element is IASInterfaceType)
		{
			walkInterface(element as IASInterfaceType);
		}
		else if (element is IASFunctionType)
		{
			walkFunction(element as IASFunctionType);
		}
		/*
		else if (element is IASNamespaceType)
		{
			walkNamespace(element as IASNamespaceType);
		}
		*/
	}
	
	public function walkClass(element:IASClassType):void
	{
		visitor.visitClass(element);
		
		for each (var field:IASField in element.getFields().toArray())
		{
			walkMember(field);
			walkField(field);
		}
		
		for each (var method:IASMethod in element.getMethods().toArray())
		{
			walkMember(method);
			walkMethod(method);
		}
	}
	
	public function walkInterface(element:IASInterfaceType):void
	{
		visitor.visitInterface(element);
		
		for each (var method:IASMethod in element.getMethods().toArray())
		{
			walkMember(method);
			walkMethod(method);
		}
		
	}
	
	public function walkFunction(element:IASFunctionType):void
	{
		visitor.visitFunction(element);
	}
	
	public function walkMember(element:IASMember):void
	{
		visitor.visitMember(element);
	}
	
	public function walkMethod(element:IASMethod):void
	{
		visitor.visitMethod(element);
	}
	
	public function walkField(element:IASField):void
	{
		visitor.visitField(element);
	}
}
}