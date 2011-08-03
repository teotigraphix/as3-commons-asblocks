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
import org.as3commons.asblocks.dom.IASCatchClause;
import org.as3commons.asblocks.dom.IASFinallyClause;
import org.as3commons.asblocks.dom.IASTryStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASTryStatement extends ContainerDelegate implements IASTryStatement
{
	public function ASTASTryStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getCatchClauses():IList
	{
		var results:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		var catchClause:LinkedListTree;
		while ((catchClause = i.search(AS3Parser.CATCH)) != null)
		{
			results.add(new ASTASCatchClause(catchClause));
		}
		return results;
	}
	
	public function getFinallyClause():IASFinallyClause
	{
		var finallyClause:LinkedListTree = finallyClause();
		if (finallyClause == null)
			return null;
		return new ASTASFinallyClause(finallyClause);
	}
	
	public function newCatchClause(name:String, type:String):IASCatchClause
	{
		var catchClause:LinkedListTree = ASTStatementBuilder.parseNewCatchClauseAST(name, type);
		var space:LinkedListToken = TokenBuilder.newSpace();
		catchClause.getStartToken().prependToken(space);
		catchClause.setStartToken(space);
		if (finallyClause() == null)
		{
			ast.addChildWithTokens(catchClause);
		}
		else
		{
			ast.addChildAtWithTokens(ast.childCount - 1, catchClause);
		}
		var indent:String = ASTUtils.findIndent(ast);
		ASTUtils.increaseIndentAfterFirstLine(catchClause, indent);
		return new ASTASCatchClause(catchClause);
	}
	
	public function removeCatch(statement:IASCatchClause):IASCatchClause
	{
		// TODO implement ASTASTryStatement.removeCatch()
		return null;
	}
	
	public function newFinallyClause():IASFinallyClause
	{
		var finallyClause:LinkedListTree = finallyClause();

		if (finallyClause != null)
		{
			throw new ASBlocksSyntaxError("only one finally-clause allowed");
		}
		finallyClause = ASTStatementBuilder.newFinallyClauseAST();
		var space:LinkedListToken = TokenBuilder.newSpace();
		finallyClause.getStartToken().prependToken(space);
		finallyClause.setStartToken(space);
		ast.addChildWithTokens(finallyClause);

		var indent:String = ASTUtils.findIndent(ast);
		ASTUtils.increaseIndentAfterFirstLine(finallyClause, indent);

		return new ASTASFinallyClause(finallyClause);
	}
	
	public function removeFinally():IASFinallyClause
	{
		// TODO implement ASTASTryStatement.removeFinally()
		return null;
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(ast.getFirstChild());
	}

	private function finallyClause():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.FINALLY);
	}
	
}
}