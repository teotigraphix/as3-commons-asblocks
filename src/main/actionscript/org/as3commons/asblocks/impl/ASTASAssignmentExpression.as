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
import org.as3commons.asblocks.dom.AssignmentOperator;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASAssignmentExpression extends ASTExpression implements IASAssignmentExpression
{
	public function ASTASAssignmentExpression(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getLeftExpression():IASExpression
	{
		return ExpressionBuilder.build(ast.getFirstChild());
	}
	
	public function setLeftExpression(value:IASExpression):void
	{
		setSubexpression(0, value);
	}
	
	public function getOperator():AssignmentOperator
	{
		return AssignmentOperator.opFromType(ast.type);
	}
	
	public function setOperator(value:AssignmentOperator):void
	{
		AssignmentOperator.initializeFromOp(value, ast.getToken());
	}
	
	public function getRightExpression():IASExpression
	{
		return ExpressionBuilder.build(ast.getLastChild());
	}
	
	public function setRightExpression(value:IASExpression):void
	{
		setSubexpression(1, value);
	}
	
	private function setSubexpression(index:int, subexpression:IASExpression):void
	{
		var sub:ASTExpression = ASTExpression(subexpression);
		var subExpr:LinkedListTree = sub.getAST();
		ASTBuilder.assertNoParent("expression", subExpr);
		// TODO: handle operator precedence issues
		ast.setChildWithTokens(index, subExpr);
	}	
}
}