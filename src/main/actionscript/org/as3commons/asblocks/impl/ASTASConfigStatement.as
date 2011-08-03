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
import org.as3commons.asblocks.dom.IASConfigStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASConfigStatement extends ContainerDelegate implements IASConfigStatement
{
	private static const INDEX_DBL_COLON:int = 0;
	
	private static const INDEX_STATEMENT:int = 1;
	
	public function ASTASConfigStatement(ast:LinkedListTree)
	{
		super(ast);
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.COMPILE_CONFIG, ast.type);
	}
	
	public function setName(value:String):void
	{
		if (value == null || value == "")
		{
			throw new ASBlocksSyntaxError("Config name cannot be null or and ampty string");
		}
		// should always be IDENT, safe to change token text
		name().getToken().text = value;		
	}
	
	public function getName():String
	{
		return name().getText();
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_STATEMENT));
	}

	private function getChild(index:int):LinkedListTree
	{
		return LinkedListTree(ast.getChild(index));
	}

	private function name():LinkedListTree
	{
		return getChild(INDEX_DBL_COLON).getLastChild();
	}
}
}