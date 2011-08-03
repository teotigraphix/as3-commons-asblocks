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
import org.as3commons.asblocks.dom.IASExpressionStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASExpressionStatement extends ASTScriptElement 
	implements IASExpressionStatement
{
	public function ASTASExpressionStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getExpression():IASExpression
	{
		return ExpressionBuilder.build(ast.getFirstChild());
	}
		
	public function parseExpression(expression:String):void
	{
		ast.setChildWithTokens(0, AS3FragmentParser.parseExprList(expression));
	}
	
	public function setExpression(expression:IASExpression):void
	{
		// TODO implement ASTASExpressionStatement.setExpression()
	}
}
}