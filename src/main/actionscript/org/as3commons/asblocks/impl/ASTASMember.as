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

import flash.errors.IllegalOperationError;

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASMember;
import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASType;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTASMember extends ASTScriptElement implements IASMember
{
	private static var INDEX_DEF:int = 2;
	
	private static var INDEX_DECL:int = 3;
	
	public function ASTASMember(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getQName():ASQName
	{
		throw new IllegalOperationError("");
		return null;
	}
	
	public function getParent():IASType
	{
		return TypeBuilder.build(LinkedListTree(ast.parent.parent));
	}
	
	public function getPackageName():String
	{
		return getParent().getPackageName();
	}
	
	public function getQualifiedName():String
	{
		var tail:String = "";
		if (this is IASMethod)
		{
//			if (!(this instanceof IASAccessor))
//				tail += "()";
		}
		return getParent().getQualifiedName() + "#" + getName() + tail;
	}	
	
	public function getName():String
	{
		return findIdent().text;
	}
	
	public function setName(value:String):void
	{
		if (value.indexOf('.') != -1)
		{
			throw new ASBlocksSyntaxError("field name must not contain '.'");
		}
		findIdent().token.text = value;
	}
	
	public function getType():String
	{
		var typeSpec:LinkedListTree = findType();
		if (typeSpec == null)
			return null;
		return ASTUtils.typeSpecText(typeSpec);
	}
	
	public function setType(value:String):void
	{
		var decl:LinkedListTree = findDeclaration();
		var typeSpec:LinkedListTree = ASTUtils.findChildByType(decl, AS3Parser.TYPE_SPEC);
		if (typeSpec == null)
		{
			if (value != null)
			{
				decl.addChildWithTokens(AS3FragmentParser.parseTypeSpec(value));
			}
		}
		else
		{
			if (value == null)
			{
				decl.deleteChild(1);
			}
			else
			{
				decl.setChildWithTokens(1, AS3FragmentParser.parseTypeSpec(value));
			}
		}		
	}
	
	public function getModifiers():IList
	{
		return ModifierUtils.getModifiers(findModifiers());
	}
	
	public function hasModifier(modifier:String):Boolean
	{
		return ModifierUtils.hasModifier(findModifiers(), modifier);
	}
	
	public function getVisibility():Visibility
	{
		return ModifierUtils.getVisibility(findModifiers());
	}
	
	public function setVisibility(value:Visibility):void
	{
		ModifierUtils.setVisibility(findModifiers(), value);
	}
	
	public function hasNamespaceVisibility():Boolean
	{
		var modifiers:LinkedListTree = findModifiers();
		return ASTUtils.findChildByType(modifiers, AS3Parser.IDENT) != null;
	}
	
	public function setNamespaceVisibility(namespace:String):void
	{
		ModifierUtils.setNamespace(findModifiers(), namespace);
	}
	
	public function getNamespaceVisibility():String
	{
		return ModifierUtils.getNamespace(findModifiers());
	}
	
	public function isStatic():Boolean
	{
		var modifiers:LinkedListTree = findModifiers();
		return ASTUtils.findChildByType(modifiers, AS3Parser.STATIC) != null;
	}
	
	public function setStatic(value:Boolean):void
	{
		for (var i:ASTIterator = modifierIterator(); i.hasNext(); )
		{
			var mod:LinkedListTree = i.next();
			if (mod.type == AS3Parser.STATIC)
			{
				if (!value)
				{
					i.remove();
				}
				return;
			}
		}
		if (value)
		{
			var modifiers:LinkedListTree = findModifiers();
			var modStatic:LinkedListTree = ASTUtils.newAST(AS3Parser.STATIC, "static");
			modStatic.appendToken(TokenBuilder.newSpace());
			modifiers.addChildWithTokens(modStatic);
		}		
	}
	
	//--------------------------------------------------------------------------
	//
	//  IMetaTagAware API
	//
	//--------------------------------------------------------------------------

	public function getMetaTags():IList // <IASMetaTag>
	{
		return MetaTagUtils.getAllMetaTags(ast);
	}
	
	public function newMetaTag(name:String):IASMetaTag
	{
		return MetaTagUtils.newMetaTag(ast, name);
	}
	
	public function getMetaTag(name:String):IASMetaTag
	{
		return MetaTagUtils.getFirstMetaTag(ast, name);
	}
	
	public function getAllMetaTags(name:String):IList // <IASMetaTag>
	{
		return MetaTagUtils.getMetaTagWithName(ast, name);
	}
	
	public function hasMetaTag(name:String):Boolean
	{
		return MetaTagUtils.hasMetaTag(ast, name);
	}
	
	public function removeMetaTag(metaTag:IASMetaTag):Boolean
	{
		return MetaTagUtils.removeMetaTag(ASTASMetaTag(metaTag).getAST());
	}
	
	//--------------------------------------------------------------------------
	//
	//  IDocCommentAware API
	//
	//--------------------------------------------------------------------------

	public function getDescription():String
	{
		return getDocumentation().getDescription();
	}
	
	public function setDescription(description:String):void
	{
		getDocumentation().setDescription(description);
	}
	
	public function getDocumentation():IDocComment
	{
		return DocumentationUtils.createDocComment(ast);
	}
		
	private function findDeclaration():LinkedListTree
	{
		return LinkedListTree(ast.getChild(INDEX_DECL));
	}
	
	private function findIdent():LinkedListTree
	{
		return findDeclaration().getFirstChild();
	}
	
	private function findType():LinkedListTree
	{
		return LinkedListTree(findDeclaration().getChild(1));
	}
	
	protected function findModifiers():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.MODIFIERS);
	}
	
	private function modifierIterator():ASTIterator
	{
		return new ASTIterator(findModifiers());
	}
}
}