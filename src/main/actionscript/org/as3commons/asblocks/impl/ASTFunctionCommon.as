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

import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.IFunctionCommon;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTFunctionCommon implements IFunctionCommon
{
	public static const ELLIPSIS:String = "...";
	
	private var ast:LinkedListTree;
	
	public function ASTFunctionCommon(ast:LinkedListTree)
	{
		this.ast = ast;
	}
	
	public function getParameters():IList
	{
		var results:IList = new ArrayList();
		var params:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.PARAMS);
		for (var i:ASTIterator = new ASTIterator(params); i.hasNext(); )
		{
			results.add(new ASTASParameter(i.next()));
		}
		return results;
	}
	
	public function getType():String
	{
		var typeSpec:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (typeSpec == null)
			return null;
		return ASTUtils.typeSpecText(typeSpec);
	}
	
	public function setType(value:String):void
	{
		var type:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (value == null)
		{
			if (type != null)
			{
				ast.deleteChild(ast.getIndexOfChild(type));
			}
			return;
		}
		var newType:LinkedListTree = AS3FragmentParser.parseTypeSpec(value);
		if (type == null)
		{
			ast.addChildAtWithTokens(ast.childCount - 1, newType);
		}
		else
		{
			var index:int = ast.getIndexOfChild(type);
			ast.setChildWithTokens(index, newType);
		}		
	}
	
	public function addParameter(name:String, type:String, defaultValue:String=null):IASParameter
	{
		var paramAST:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.PARAM);
		paramAST.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		if (type != null)
		{
			paramAST.addChildWithTokens(AS3FragmentParser.parseTypeSpec(type));
		}

		var p:IASParameter = param(paramAST);

		if (defaultValue != null)
		{
			p.setDefaultValue(defaultValue);
		}

		return p;
	}
	
	private function param(param:LinkedListTree):IASParameter
	{
		var params:LinkedListTree = findParams();
		if (params.childCount > 0)
		{
			params.appendToken(TokenBuilder.newComma());
			params.appendToken(TokenBuilder.newSpace());
		}
		params.addChildWithTokens(param);
		return new ASTASParameter(param);
	}	
	
	public function removeParameter(name:String):IASParameter
	{
		var params:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.PARAMS);
		var count:int = 0;
		for (var i:ASTIterator = new ASTIterator(params); i.hasNext();)
		{
			var ast:LinkedListTree = i.next();
			var arg:ASTASParameter = new ASTASParameter(ast);
			if (arg.getName() == name)
			{
				if (i.hasNext())
				{
					ASTUtils.removeTrailingWhitespaceAndComma(ast.getStopToken());
				}
				else if (count > 0)
				{
					ASTUtils.removePreceedingWhitespaceAndComma(ast.getStartToken());
				}
				i.remove();
				return arg;
			}
			count++;
		}
		return null;
	}
	
	public function addRestParameter(name:String):IASParameter
	{
		if (ELLIPSIS == name)
		{
			return addAnonRestParam();
		}
		return addNamedRestParam(name);
	}
	
	public function hasParameters():Boolean
	{
		return getParameters().size > 0;
	}

	private function addAnonRestParam():IASParameter
	{
		var paramAST:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.PARAM);
		paramAST.addChildWithTokens(ASTUtils.newAST(AS3Parser.REST, ELLIPSIS));
		return param(paramAST);
	}

	private function addNamedRestParam(name:String):IASParameter
	{
		var paramAST:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.PARAM);
		paramAST.addChildWithTokens(ASTUtils.newAST(AS3Parser.REST, ELLIPSIS));
		paramAST.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		return param(paramAST);
	}

	private function findParams():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.PARAMS);
	}	
}
}