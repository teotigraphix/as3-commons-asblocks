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

import org.as3commons.asblocks.dom.IASSwitchDefault;
import org.as3commons.asblocks.dom.IASSwitchLabel;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASSwitchDefault extends ContainerDelegate implements IASSwitchDefault
{
	private static const INDEX_CONTAINER:int = 0;
	
	public function ASTASSwitchDefault(ast:LinkedListTree)
	{
		super(ast);
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_CONTAINER));
	}

	private function getChild(index:int):LinkedListTree
	{
		return LinkedListTree(ast.getChild(index));
	}
	
}
}