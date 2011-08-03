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

import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASType;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

/**
 * The <code>IASCompilationUnit</code> implementation.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class ASTASCompilationUnit extends ASTScriptElement implements IASCompilationUnit
{
	//--------------------------------------------------------------------------
	//
	//  IASCompilationUnit API :: Properties
	//
	//--------------------------------------------------------------------------
	
	public function getQualifiedName():String
	{
		return getQName().getQualifiedName();
	}
	
	public function getName():String
	{
		return getType().getName();
	}
	
	public function getQName():ASQName
	{
		return ASQName.int2ASQName(getPackageName(), getType().getName());
	}
	
	public function getPackageName():String
	{
		return getPackage().getName();
	}
	
	public function setPackageName(value:String):void
	{
		getPackage().setName(value);
	}
	
	public function getPackage():IASPackage
	{
		var pkg:LinkedListTree = findPackage();
		if (pkg == null)
			return null;
		
		return new ASTASPackage(pkg);
	}
	
	public function getType():IASType
	{
		var pkg:IASPackage = getPackage();
		if (pkg == null)
			return null;
		
		return pkg.getType();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	public function ASTASCompilationUnit(ast:LinkedListTree = null)
	{
		super(ast);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Protected :: Methods
	//
	//--------------------------------------------------------------------------
	
	protected function findPackage():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.PACKAGE);
	}
	
	public function getInnerTypes():IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = unitBlockIterator();
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.CLASS_DEF)) != null)
		{
			result.add(new ASTASClassType(child));
		}
		return result;
	}
	
	public function getInnerFunctions():IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = unitBlockIterator();
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.FUNC_DEF)) != null)
		{
			result.add(new ASTASFunctionType(child));
		}
		return result;
	}

	protected function unitBlockIterator():ASTIterator
	{
		return new ASTIterator(ast);
	}
}
}