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
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

/**
 * Common code implementing 'for-in' and 'for-each-in' loop behaviour.
 */
public class ASTForInCommon extends ContainerDelegate
{
	private static const INDEX_VAR:int = 0;
	
	private static const INDEX_ITERATED:int = 1;
	
	private static const INDEX_STATEMENT:int = 2;	
	
	public function ASTForInCommon(ast:LinkedListTree)
	{
		super(ast);
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_STATEMENT));
	}
	
	public function getInitializer():IScriptElement
	{
		return StatementBuilder.build(initializer());
	}
	
	public function getInitializerString():String
	{
		return ASTUtils.stringifyNode(getChild(INDEX_VAR));
	}
	
	public function getIteratorString():String
	{
		return ASTUtils.stringifyNode(iterated());
	}
	
	public function getIterator():IASExpression
	{
		return ExpressionBuilder.build(iterated());
	}	
	
	public function parseInitializer(value:String):void
	{
		var v:LinkedListTree = AS3FragmentParser.parseForInVar(value);
		ast.setChildWithTokens(INDEX_VAR, v);
	}
	
	public function setInitializer(value:IScriptElement):void
	{
		setInit(toAST(value));
	}
	
	public function parseIterator(value:String):void
	{
		setIter(AS3FragmentParser.parseForInIterated(value));
	}
		
	public function setIterator(value:IASExpression):void
	{
		setIter(toAST(value));
	}
	
	private function getChild(index:int):LinkedListTree
	{
		return ast.getChild(index) as LinkedListTree;
	}	
	
	private function initializer():LinkedListTree
	{
		return getChild(INDEX_VAR) as LinkedListTree;
	}
			
	private function iterated():LinkedListTree
	{
		return getChild(INDEX_ITERATED) as LinkedListTree;
	}
	
	private function setInit(initAST:LinkedListTree):void
	{
		ast.setChildWithTokens(INDEX_VAR, initAST);
	}

	private function setIter(iterAST:LinkedListTree):void
	{
		ast.setChildWithTokens(INDEX_ITERATED, iterAST);
	}
}
}