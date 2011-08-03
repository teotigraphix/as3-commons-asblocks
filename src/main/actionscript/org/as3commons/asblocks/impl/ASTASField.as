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

import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASField extends ASTASMember implements IASField
{
	override public function getQName():ASQName
	{
		var name:ASQName = ASQName.create(getParent().getQualifiedName() + "#"
				+ getName());
		return name;
	}
	
	private static const INDEX_DEF:int = 2;
	private static const INDEX_DECL:int = 3;	
	
	public function ASTASField(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function isConstant():Boolean
	{
		return ast.getChild(INDEX_DEF).type == AS3Parser.CONST;
	}
	
	public function setConstant(value:Boolean):void
	{
		if (isConstant() == value)
			return;
		
		var node:LinkedListToken;
		if (value)
		{
			node = TokenBuilder.newConst();
		}
		else
		{
			node = TokenBuilder.newVar();
		}
		ast.setChildWithTokens(INDEX_DEF, ASTUtils.newASTFromToken(node));		
	}
	
	public function isNamespace():Boolean
	{
		return ast.getChild(INDEX_DEF).type == AS3Parser.NAMESPACE;
	}
	
	public function setNamespace(value:Boolean):void
	{
		if (isNamespace() == value)
		{
			return;
		}
		var node:LinkedListToken;
		if (value)
		{
			node = TokenBuilder.newNamespace();
		}
		else
		{
			node = TokenBuilder.newVar();
		}
		ast.setChildWithTokens(INDEX_DEF, ASTUtils.newASTFromToken(node));
	}
	
	public function getInitializer():IASExpression
	{
		var decl:LinkedListTree = findDecl();
		var init:LinkedListTree = ASTUtils.findChildByType(decl, AS3Parser.ASSIGN);
		if (init == null)
			return null;
		
		return ExpressionBuilder.build(init.getFirstChild());
	}
	
	public function setInitializer(value:IASExpression):void
	{
		if (value == null)
		{
			removeInitializer();
		}
		else
		{
			setInitAST(toAST(value));
		}		
	}
	
	private function setInitAST(exp:LinkedListTree):void
	{
		var decl:LinkedListTree = findDecl();
		var init:LinkedListTree = ASTUtils.findChildByType(decl, AS3Parser.ASSIGN);
		if (init == null)
		{
			init = ASTUtils.newAST(AS3Parser.ASSIGN, "=");
			init.prependToken(TokenBuilder.newSpace());
			init.appendToken(TokenBuilder.newSpace());
			decl.addChildWithTokens(init);
		}
		else
		{
			init.deleteChild(0);
		}
		init.addChildWithTokens(exp);
	}

	private function removeInitializer():void
	{
		var decl:LinkedListTree = findDecl();
		var i:ASTIterator = new ASTIterator(decl);
		if (i.search(AS3Parser.ASSIGN) != null)
		{
			i.remove();
		}
	}	
	
	private function findDecl():LinkedListTree
	{
		return LinkedListTree(ast.getChild(INDEX_DECL));
	}
}
}