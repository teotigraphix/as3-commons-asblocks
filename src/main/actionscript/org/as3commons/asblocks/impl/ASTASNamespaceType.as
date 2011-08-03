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
import org.as3commons.asblocks.dom.IASNamespaceType;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASNamespaceType extends ASTASType implements IASNamespaceType
{
	public function ASTASNamespaceType(ast:LinkedListTree)
	{
		super(ast);
	}
	
	override public function isSubType():Boolean
	{
		return false;
	}
	
	public function getURI():String
	{
		var i:ASTIterator = new ASTIterator(findAssign());
		return ASTUtils.decodeStringLiteral(i.find(AS3Parser.STRING_LITERAL).text);
	}
	
	public function setURI(value:String):void
	{
		if (value == null)
		{
			throw new ASBlocksSyntaxError("URI name must not be null");
		}		
		var i:ASTIterator = new ASTIterator(findAssign());
		
		i.find(AS3Parser.STRING_LITERAL);
		i.replace(ASTUtils.newAST(AS3Parser.STRING_LITERAL, ASTUtils.str(value)));		
	}
		
	protected function findAssign():LinkedListTree
	{
		return ASTUtils.findChildByType(findDeclaration(), AS3Parser.ASSIGN);
	}
	
	override protected function findDeclaration():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.VAR_DEC);
	}
}
}