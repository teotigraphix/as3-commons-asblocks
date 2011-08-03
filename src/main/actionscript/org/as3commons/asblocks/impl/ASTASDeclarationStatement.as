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

import org.as3commons.asblocks.dom.IASDeclaration;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASDeclarationStatement extends ASTScriptElement implements IASDeclarationStatement
{
	public function ASTASDeclarationStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getName():String
	{
		return firstVar().getName();
	}
	
	public function getType():String
	{
		return firstVar().getType();
	}
	
	public function getInitializer():IASExpression
	{
		return firstVar().getInitializer();
	}
	
	public function getDeclarations():IList
	{
		var results:IList = new ArrayList();
		for (var i:ASTIterator = new ASTIterator(ast); i.hasNext();)
		{
			results.add(build(i.next()));
		}
		return results;
	}
	
	public function isConstant():Boolean
	{
		return ast.type == AS3Parser.CONST;
	}
	
	public function setConstant(value:Boolean):void
	{
		if (value)
		{
			ast.token.type = AS3Parser.CONST;
			ast.token.text = "const";
		}
		else
		{
			ast.token.type = AS3Parser.VAR;
			ast.token.text = "var";
		}		
	}
	
	private function firstVar():IASDeclaration
	{
		return build(ASTUtils.findChildByType(ast, AS3Parser.VAR_DEC));
	}

	private function build(varDecl:LinkedListTree):IASDeclaration
	{
		return new ASTASDeclaration(varDecl);
	}
}
}