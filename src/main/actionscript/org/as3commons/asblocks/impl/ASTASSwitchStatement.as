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
import org.as3commons.asblocks.dom.IASSwitchDefault;
import org.as3commons.asblocks.dom.IASSwitchLabel;
import org.as3commons.asblocks.dom.IASSwitchStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;
import org.as3commons.lang.IllegalArgumentError;

public class ASTASSwitchStatement extends ContainerDelegate implements IASSwitchStatement
{
	public function ASTASSwitchStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getCondition():IASExpression
	{
		return ExpressionBuilder.build(condition().getFirstChild());
	}
	
	public function setCondition(value:IASExpression):void
	{
		condition().setChildWithTokens(0, toAST(value));
	}
	
	public function parseCondition(value:String):void
	{
		var cond:LinkedListTree = AS3FragmentParser.parseCondition(value);
		ast.setChildWithTokens(0, cond);		
	}
	
	public function getConditionString():String
	{
		return ASTUtils.stringifyNode(condition().getFirstChild());
	}
	
	public function getLabels():IList
	{
		var results:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(block());
		while (i.hasNext())
		{
			results.add(buildLabel(i.next()));
		}
		return results;
	}
	
	public function newCase(label:String):IASSwitchCase
	{
		var caseStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.CASE, "case");
		caseStmt.appendToken(TokenBuilder.newSpace());
		caseStmt.addChildWithTokens(AS3FragmentParser.parseExpression(label));
		caseStmt.appendToken(TokenBuilder.newColon());
		var stmtList:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.SWITCH_STATEMENT_LIST);
		caseStmt.addChildWithTokens(stmtList);
		ASTUtils.addChildWithIndentation(block(), caseStmt);
		return new ASTASSwitchCase(caseStmt);
	}
	
	public function newDefault():IASSwitchDefault
	{
		var defaultStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.DEFAULT, "default");
		defaultStmt.appendToken(TokenBuilder.newColon());
		var stmtList:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.SWITCH_STATEMENT_LIST);
		defaultStmt.addChildWithTokens(stmtList);
		ASTUtils.addChildWithIndentation(block(), defaultStmt);
		return new ASTASSwitchDefault(defaultStmt);
	}
	
	private function buildLabel(lab:LinkedListTree):IASSwitchLabel
	{
		switch (lab.type)
		{
		case AS3Parser.CASE:
			return new ASTASSwitchCase(lab);
		case AS3Parser.DEFAULT:
			return new ASTASSwitchDefault(lab);
		default:
			throw new IllegalArgumentError("unhandled node type "
					+ ASTUtils.tokenNameFromAST(lab));
		}
	}
	
	private function condition():LinkedListTree
	{
		return ast.getFirstChild();
	}

	private function block():LinkedListTree
	{
		return ast.getLastChild();
	}	
}
}