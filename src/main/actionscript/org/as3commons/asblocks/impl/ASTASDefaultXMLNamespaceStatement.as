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

import org.as3commons.asblocks.dom.IASDefaultXMLNamespaceStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASDefaultXMLNamespaceStatement extends ASTScriptElement 
	implements IASDefaultXMLNamespaceStatement
{
	public function ASTASDefaultXMLNamespaceStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getNamespace():String
	{
		return ASTUtils.decodeStringLiteral(ast.getFirstChild().text);
	}
	
	public function setNamespace(value:String):void
	{
		// TODO implement ASTASDefaultXMLNamespaceStatement.setNamespace()

	}
}
}