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

import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASSwitchCase;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASSwitchCase extends ContainerDelegate implements IASSwitchCase
{
	private static const INDEX_LABELVAL:int = 0;

	private static const INDEX_CONTAINER:int = 1;
	
	public function ASTASSwitchCase(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getLabel():IASExpression
	{
		return ExpressionBuilder.build(getChild(INDEX_LABELVAL));
	}
	
	public function setLabel(value:IASExpression):void
	{
	
	}
	
	public function parseLabel(value:String):void
	{
		var label:LinkedListTree = AS3FragmentParser.parseExpression(value);
		ast.setChildWithTokens(INDEX_LABELVAL, label);			
	}
	
	public function getLabelString():String
	{
		return ASTUtils.stringifyNode(getChild(INDEX_LABELVAL));
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_CONTAINER));
	}

	private function getChild(index:int):LinkedListTree
	{
		return LinkedListTree(ast.getChild(index));
	}	
}
}