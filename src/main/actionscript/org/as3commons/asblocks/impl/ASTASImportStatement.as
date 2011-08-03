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
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASImportStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASImportStatement extends ASTScriptElement implements IASImportStatement
{
	public function ASTASImportStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getTarget():IASExpression
	{
		return null;
	}
	
	public function setTarget(value:IASExpression):void
	{
	}
	
	public function parseTarget(value:String):void
	{
		var child:LinkedListTree = AS3FragmentParser.parseImport(value);
		ast.setChildWithTokens(0, child.getFirstChild());		
	}
	
	public function getTargetString():String
	{
		return ASTUtils.importText(ast);
	}
	
	public function getQName():ASQName
	{
		return ASQName.create(getTargetString());
	}
}
}