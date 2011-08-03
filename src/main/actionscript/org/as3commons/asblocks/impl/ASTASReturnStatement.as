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
import org.as3commons.asblocks.dom.IASReturnStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASReturnStatement extends ASTScriptElement implements IASReturnStatement
{
	public function ASTASReturnStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getExpression():IASExpression
	{
		if (hasExpr())
			return null;
		return ExpressionBuilder.build(ast.getFirstChild());
	}
	
	public function setExpression(value:IASExpression):void
	{
		if (value == null)
		{
			if (hasExpr())
				return;
			ast.deleteChild(0);
			return;
		}
		setExpr(toAST(value));		
	}
	
	public function parseExpression(value:String):void
	{
		if (value == null)
		{
			if (hasExpr())
				return;
			ast.deleteChild(0);
			return;
		}
		var expression:LinkedListTree = AS3FragmentParser.parseExpression(value);
		setExpr(expression);		
	}
	
	public function getExpressionString():String
	{
		if (hasExpr())
		{
			return null;
		}
		return ASTUtils.stringifyNode(ast.getFirstChild());
	}
	
	private function setExpr(expression:LinkedListTree):void
	{
		if (hasExpr())
		{
			var after:LinkedListToken = ast.getStopToken();
			var before:LinkedListToken = after.getPrev();
			ast.addChild(expression);
			before.setNext(expression.getStartToken());
			after.setPrev(expression.getStopToken());
			before.appendToken(TokenBuilder.newSpace());
		}
		else
		{
			ast.setChildWithTokens(0, expression);
		}
	}

	private function hasExpr():Boolean
	{
		return ast.childCount == 0;
	}	
}
}