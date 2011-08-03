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
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.IDocTag;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.IllegalStateError;

public class ASTASParameter extends ASTScriptElement implements IASParameter
{
	public function ASTASParameter(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function isRest():Boolean
	{
		return ast.getFirstChild().type == AS3Parser.REST;
	}	
	
	public function getName():String
	{
		var name:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.IDENT);
		if (name == null)
		{
			if (isRest())
			{
				return ASTFunctionCommon.ELLIPSIS;
			}
			throw new IllegalStateError("No parameter name, and not a 'rest' parameter");
		}
		return name.text;
	}
	
	public function setName(value:String):void
	{
	}
	
	public function getType():String
	{
		var type:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (type == null)
			return null;
		return ASTUtils.typeSpecText(type);
	}
	
	public function setType(value:String):void
	{
		if (isRest())
		{
			throw new ASBlocksSyntaxError(
					"type specification not allowed for 'rest' parameters");
		}
		var type:LinkedListTree = ASTUtils
				.findChildByType(ast, AS3Parser.TYPE_SPEC);
		if (value == null)
		{
			if (type != null)
			{
				ast.deleteChild(1);
			}
			return;
		}
		var newType:LinkedListTree = AS3FragmentParser.parseTypeSpec(value);
		if (type == null)
		{
			ast.addChildWithTokens(newType);
		}
		else
		{
			type.setChildWithTokens(0, newType.getFirstChild());
		}		
	}
	
	public function getDefaultValue():String
	{
		var assign:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.ASSIGN);
		if (assign == null)
			return null;
		
		return ASTUtils.stringifyNode(assign.getFirstChild());
	}
	
	public function setDefaultValue(value:String):void
	{
		if (isRest())
		{
			throw new ASBlocksSyntaxError(
					"default value not allowed for 'rest' parameters");
		}
		var i:ASTIterator = new ASTIterator(ast);
		var assign:LinkedListTree = i.search(AS3Parser.ASSIGN);
		if (value == null)
		{
			if (assign != null)
			{
				i.remove();
			}
			return;
		}
		var def:LinkedListTree = AS3FragmentParser.parseParameterDefault(value);
		if (assign == null)
		{
			ast.addChildWithTokens(def);
		}
		else
		{
			assign.setChildWithTokens(0, def.getFirstChild());
		}	
	}
	
	override public function toString():String
	{
		var type:String = getType();
		if (type == null)
		{
			return getName();
		}
		return getName() + ":" + type;
	}
	
	public function getDescription():String
	{
		var doc:IDocComment = getMethod().getDocumentation();
		var name:String = getName();
		var tag:IDocTag = DocumentationUtils.findParam(doc, name);
		if (tag == null)
		{
			return null;
		}
		return tag.getBody().substring(name.length + 1);
	}
	
	public function setDescription(description:String):void
	{
		var doc:ASTDocComment = ASTDocComment(getMethod().getDocumentation());
		var name:String = getName();
		var tag:IDocTag = DocumentationUtils.findParam(doc, name);
		if (tag == null)
		{
			doc.newDocTag("param", name + " " + description);
		}
		else
		{
			tag.setBody(name + " " + description);
		}
	}

	public function getMethod():IASMethod
	{
		return new ASTASMethod(LinkedListTree(ast.parent.parent));
	}	
}
}