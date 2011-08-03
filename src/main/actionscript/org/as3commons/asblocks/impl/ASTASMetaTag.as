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
import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASMetaTag extends ASTScriptElement implements IASMetaTag
{
	public function ASTASMetaTag(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getDescription():String
	{
		return getDocumentation().getDescription();
	}
	
	public function setDescription(value:String):void
	{
		getDocumentation().setDescription(value);
	}
	
	public function getDocumentation():IDocComment
	{
		return DocumentationUtils.createDocComment(ast);
	}
	
	public function getName():String
	{
		return ast.getFirstChild().getText();
	}
	
	public function getPackageName():String
	{
		// TODO implememtn ASTASMetaTag.getPackageName()
		return "TODO";
	}
	
	public function getQualifiedName():String
	{
		// TODO implememtn ASTASMetaTag.getQualifiedName()
		return "TODO";
	}
	
	public function getParameters():IList // <Object>
	{
		var params:LinkedListTree = findParams();
		if (params == null)
		{
			return new ArrayList();
		}
		var result:IList = new ArrayList();
		for (var i:ASTIterator = new ASTIterator(params); i.hasNext();)
		{
			var param:LinkedListTree = i.next();
			result.add(toParamValue(param));
		}
		return result;
	}
	
	public function getParameterValue(name:String):Object
	{
		var params:LinkedListTree = findParams();
		if (params == null)
		{
			return null;
		}
		for (var i:ASTIterator = new ASTIterator(params); i.hasNext();)
		{
			var child:LinkedListTree = i.next();
			if (child.type == AS3Parser.ASSIGN)
			{
				if (child.getFirstChild().getText() == name)
				{
					return toParamValue(child.getLastChild());
				}
			}
		}
		return null;
	}
	
	public function addStringParam(value:String, name:String=null):void
	{
		if (name == null)
		{
			addParamAST(toASTstring(value));
		}
		else
		{
			addParam(name, toASTstring(value));
		}
	}
	
	public function addIntParam(value:int, name:String=null):void
	{
		if (name == null)
		{
			addParamAST(toASTint(value));
		}
		else
		{
			addParam(name, toASTint(value));
		}
	}
	
	public function addBooleanParam(value:Boolean, name:String=null):void
	{
		if (name == null)
		{
			addParamAST(toASTbool(value));
		}
		else
		{
			addParam(name, toASTbool(value));
		}
	}
	
	private function addParamAST(str:LinkedListTree):void
	{
		var params:LinkedListTree = findOrAddParams();
		if (params.childCount > 0)
		{
			params.appendToken(TokenBuilder.newComma());
			params.appendToken(TokenBuilder.newSpace());
		}
		params.addChildWithTokens(str);
	}
	
	private function addParam(name:String, val:LinkedListTree):void
	{
		var assign:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.ASSIGN);
		var ident:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, name);
		assign.addChildWithTokens(ident);
		var assignToken:LinkedListToken = new LinkedListToken(AS3Parser.ASSIGN, "=");
		assign.appendToken(assignToken);
		assign.setToken(assignToken);
		assign.addChildWithTokens(val);

		addParamAST(assign);
	}
	
	private static function toParamValue(child:LinkedListTree):Object
	{
		switch (child.type)
		{
		case AS3Parser.STRING_LITERAL:
			return ASTUtils.decodeStringLiteral(child.text);
		case AS3Parser.TRUE:
			return true;
		case AS3Parser.FALSE:
			return false
		case AS3Parser.DECIMAL_LITERAL:
			return Number(child.text);
		case AS3Parser.ASSIGN:
			return new ASTASParameter(child);
		default:
			throw new ASBlocksSyntaxError("Unexpected type "
					+ ASTUtils.tokenNameFromAST(child));
		}
	}
	
	private function findOrAddParams():LinkedListTree
	{
		var params:LinkedListTree = findParams();
		if (params == null)
		{
			params = ASTUtils.newParentheticAST(AS3Parser.METATAG_PARAMS, 
				AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
			ast.addChildWithTokens(params);
		}
		return params;
	}
	
	private function findParams():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.METATAG_PARAMS);
	}

	private function toASTint(constant:int):LinkedListTree
	{
		return ASTUtils.newAST(AS3Parser.DECIMAL_LITERAL, constant.toString());
	}

	private function toASTbool(constant:Boolean):LinkedListTree
	{
		var str:LinkedListTree;
		if (constant)
		{
			str = ASTUtils.newAST(AS3Parser.TRUE, "true");
		}
		else
		{
			str = ASTUtils.newAST(AS3Parser.FALSE, "false");
		}
		return str;
	}

	private function toASTstring(constant:String):LinkedListTree
	{
		return ASTUtils.newAST(AS3Parser.STRING_LITERAL, ASTUtils.str(constant));
	}
}
}