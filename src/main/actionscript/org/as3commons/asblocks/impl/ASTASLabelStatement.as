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

import org.as3commons.asblocks.dom.IASLabelStatement;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASLabelStatement extends ContainerDelegate implements IASLabelStatement
{
	private static const IDENT_INDEX:int = 0;
	
	private static const STATEMENT_INDEX:int = 1;
	
	public function ASTASLabelStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getLabel():String
	{
		return findIdent().text;
	}
	
	public function setLabel(value:String):void
	{
		findIdent().getToken().text = value;
	}
	
	public function getStatement():IASStatement
	{
		return StatementBuilder.build(findStatement());
	}
	
	public function setStatement(value:IASStatement):void
	{
		var statementAST:LinkedListTree =  ASTUtils.ast(value);
		var i:ASTIterator = new ASTIterator(ast);
		i.next(); // IDENT
		i.next(); // statement
		i.replace(statementAST);
		var indent:String = ASTUtils.findIndent(ast);
		ASTUtils.increaseIndentAfterFirstLine(statementAST, indent);		
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(findStatement());
	}
	
	private function findIdent():LinkedListTree
	{
		return LinkedListTree(ast.getChild(IDENT_INDEX));
	}

	private function findStatement():LinkedListTree
	{
		return LinkedListTree(ast.getChild(STATEMENT_INDEX));
	}
}
}