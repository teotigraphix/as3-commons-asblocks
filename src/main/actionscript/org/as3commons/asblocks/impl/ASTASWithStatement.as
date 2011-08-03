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

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IASWithStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASWithStatement extends ContainerDelegate implements IASWithStatement
{
	private static const INDEX_CONDITION:int = 0;
	
	public function ASTASWithStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getScope():IASExpression
	{
		return ExpressionBuilder.build(findScope().getFirstChild());
	}
	
	public function setScope(value:IASExpression):void
	{
		findScope().setChildWithTokens(0, toAST(value));
	}
	
	public function parseScope(value:String):void
	{
		var cond:LinkedListTree = AS3FragmentParser.parseCondition(value);
		ast.setChildWithTokens(INDEX_CONDITION, cond);		
	}
	
	public function getScopeString():String
	{
		return ASTUtils.stringifyNode(findScope().getFirstChild());
	}
	
	public function getBody():IASStatement
	{
		return StatementBuilder.build(findBody());
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		var body:LinkedListTree = findBody();
		if (body.type != AS3Parser.BLOCK)
		{
			throw new ASBlocksSyntaxError("'with' body is not a block");
		}
		return new ASTStatementList(body);
	}

	private function findScope():LinkedListTree
	{
		return ast.getFirstChild();
	}

	private function findBody():LinkedListTree
	{
		return ast.getLastChild();
	}	
}
}