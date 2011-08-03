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

import org.as3commons.asblocks.dom.IASCatchClause;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASCatchClause extends ContainerDelegate implements IASCatchClause
{
	public function ASTASCatchClause(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getName():String
	{
		return ast.getFirstChild().getText();
	}
	
	public function getType():String
	{
		var type:LinkedListTree = ASTUtils
				.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (type == null)
		{
			return null;
		}
		return ASTUtils.typeSpecText(type);
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(block());
	}

	private function block():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.BLOCK);
	}
}
}