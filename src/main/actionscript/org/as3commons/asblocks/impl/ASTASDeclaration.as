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
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASDeclaration extends ASTScriptElement implements IASDeclaration
{
	public function ASTASDeclaration(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getName():String
	{
		return ast.getFirstChild().getText();
	}
	
	public function setName(value:String):void
	{
	}
	
	public function getType():String
	{
		var type:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (type == null)
		{
			return null;
		}
		return ASTUtils.typeSpecText(type);
	}
	
	public function setType(value:String):void
	{
	}
	
	public function getInitializer():IASExpression
	{
		var init:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.ASSIGN);
		if (init == null)
		{
			return null;
		}
		return ExpressionBuilder.build(init.getFirstChild());
	}
	
	public function setInitializer(value:IASExpression):void
	{
	}
}
}