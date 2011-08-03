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
import org.as3commons.asblocks.dom.IASWhileStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASWhileStatement extends ContainerDelegate implements IASWhileStatement
{
	private static const INDEX_CONDITION:int = 0;

	private static const INDEX_STATEMENT:int = 1;
	
	public function ASTASWhileStatement(ast:LinkedListTree)
	{
		super(ast);
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.WHILE, ast.type);
	}
	
	public function getCondition():IASExpression
	{
		return ExpressionBuilder.build(condition().getFirstChild());
	}
	
	public function setCondition(value:IASExpression):void
	{
		condition().setChildWithTokens(INDEX_CONDITION, toAST(value));
	}
	
	public function parseCondition(value:String):void
	{
		var cond:LinkedListTree = AS3FragmentParser.parseCondition(value);
		ast.setChildWithTokens(INDEX_CONDITION, cond);		
	}
	
	public function getConditionString():String
	{
		return ASTUtils.stringifyNode(condition().getFirstChild());
	}
	
	public function getBody():IASStatement
	{
		return StatementBuilder.build(findStatement());
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		var stmt:LinkedListTree = findStatement();
		if (stmt.type != AS3Parser.BLOCK)
		{
			throw new ASBlocksSyntaxError("Loop body is not a block");
		}
		return new ASTStatementList(stmt);
	}

	private function condition():LinkedListTree
	{
		return ast.getFirstChild();
	}

	private function findStatement():LinkedListTree
	{
		return getChild(INDEX_STATEMENT);
	}

	private function getChild(index:int):LinkedListTree
	{
		return LinkedListTree(ast.getChild(index));
	}
}
}