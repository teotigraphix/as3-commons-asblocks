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
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASFieldAccessExpression extends ASTExpression implements IASFieldAccessExpression
{
	public function ASTASFieldAccessExpression(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getName():String
	{
		return ASTUtils.stringifyNode(ast.getLastChild());
	}
	
	public function setName(value:String):void
	{
		var name:LinkedListTree = AS3FragmentParser.parseIdent(value);
		ast.setChildWithTokens(1, name);		
	}
	
	public function getTarget():IASExpression
	{
		return ExpressionBuilder.build(ast.getFirstChild());
	}
	
	public function setTarget(value:IASExpression):void
	{
		var exprAST:LinkedListTree = ASTUtils.ast(value);
		ast.setChildWithTokens(0, exprAST);		
	}
}
}