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
import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASImportStatement;
import org.as3commons.asblocks.dom.IASIncludeStatement;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASType;
import org.as3commons.asblocks.dom.IASUseStatement;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTASType extends ASTScriptElement implements IASType
{
	public function isSubType():Boolean
	{
		return false;
	}
	
	//--------------------------------------------------------------------------
	//
	//  IASType API
	//
	//--------------------------------------------------------------------------

	public function getParent():IASPackage
	{
		return new ASTASPackage(LinkedListTree(ast.getAncestor(AS3Parser.PACKAGE)));
	}
	
	public function getQualifiedName():String
	{
		return getQName().getQualifiedName();
	}

	// XXX figure out if this really should do this
	public function getPackageName():String
	{
		var name:String = getParent().getName();
		if (name != null)
			return name;
		return "toplevel";
	}
	
	public function getQName():ASQName
	{
		var pkg:IASPackage = getParent();
		return ASQName.int2ASQName(pkg.getName(), getName());
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

	public function getName():String
	{
		var i:ASTIterator = new ASTIterator(findDeclaration());
		return i.find(AS3Parser.IDENT).getText();
	}
	
	public function setName(value:String):void
	{
		if (value == null)
		{
			throw new ASBlocksSyntaxError("Type name must not be null");
		}		
		var i:ASTIterator = new ASTIterator(findDeclaration());
		i.find(AS3Parser.IDENT);
		i.replace(ASTUtils.newAST(AS3Parser.IDENT, value));		
	}
	
	protected function findDeclaration():LinkedListTree
	{
		return ast;
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
	
	public function setDescription(value:String):void
	{
		getDocumentation().setDescription(value);
	}
	
	public function getDocumentation():IDocComment
	{
		return DocumentationUtils.createDocComment(ast);
	}
	
	//--------------------------------------------------------------------------
	//
	//  IImportAware API
	//
	//--------------------------------------------------------------------------
	
	public function newImport(target:IASExpression):IASImportStatement
	{
		return ImportUtils.newImport(target);
	}
	
	public function parseImport(target:String):IASImportStatement
	{
		return ImportUtils.parseImport(findTypeBlock(), target);
	}
	
	public function removeImport(target:String):IASImportStatement
	{
		return ImportUtils.removeImport(findTypeBlock(), target);
	}
	
	public function getImports():IList
	{
		return ImportUtils.getImports(findTypeBlock());
	}

	//--------------------------------------------------------------------------
	//
	//  IIncludeAware API
	//
	//--------------------------------------------------------------------------
	
	public function newInclude(path:IASExpression):IASIncludeStatement
	{
		return IncludeUtils.newInclude(findTypeBlock(), path);
	}
	
	public function parseInclude(path:String):IASIncludeStatement
	{
		return IncludeUtils.parseInclude(findTypeBlock(), path);
	}
	
	public function removeInclude(path:String):IASIncludeStatement
	{
		return IncludeUtils.removeInclude(findTypeBlock(), path);
	}
	
	public function getIncludes():IList
	{
		return IncludeUtils.getIncludes(findTypeBlock());
	}

	//--------------------------------------------------------------------------
	//
	//  IUseAware API
	//
	//--------------------------------------------------------------------------
	
	public function newUse(name:IASExpression):IASUseStatement
	{
		return UseUtils.newUse(findTypeBlock(), name);
	}
	
	public function parseUse(name:String):IASUseStatement
	{
		return UseUtils.parseUse(findTypeBlock(), name);
	}
	
	public function removeUse(name:String):IASUseStatement
	{
		return UseUtils.removeUse(findTypeBlock(), name);
	}
	
	public function getUses():IList
	{
		return UseUtils.getUses(findTypeBlock());
	}

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 * Constructor.
	 * 
	 * COMPILATION_UNIT/PACKAGE/BLOCK/CLASS_DEF
	 */
	public function ASTASType(ast:LinkedListTree)
	{
		super(ast);
	}
	
	protected function blockIterator():ASTIterator
	{
		return new ASTIterator(findTypeBlock());
	}

	protected function findTypeBlock():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.TYPE_BLOCK);
	}
	
	protected function findModifiers():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.MODIFIERS);
	}	
}
}