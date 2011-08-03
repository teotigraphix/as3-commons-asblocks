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
import org.as3commons.asblocks.dom.IASInvocation;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.collections.framework.IList;

public class ASTInvocation extends ASTExpression implements IASInvocation
{
	public function ASTInvocation(ast:LinkedListTree)
	{
		super(ast);
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
	
	public function getArguments():IList
	{
		var args:LinkedListTree = ArgumentUtils.findArgs(ast);
		return ArgumentUtils.astToExpressionList(args);
	}
	
	public function setArguments(value:IList):void
	{
		var argumentNode:LinkedListTree = ArgumentUtils.findArgs(ast);
		ArgumentUtils.overwriteArgsWithExpressionList(argumentNode, value);
	}
}
}