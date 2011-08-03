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
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASImportStatement;
import org.as3commons.asblocks.dom.IASIncludeStatement;
import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASType;
import org.as3commons.asblocks.dom.IASUseStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;
import org.as3commons.collections.utils.ListBuilder;

/**
 * The <code>IASPackage</code> implementation.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class ASTASPackage extends ASTScriptElement implements IASPackage
{
	public function getQName():ASQName
	{
		return ASQName.create(getName());
	}
	
	public function getPackageName():String
	{
		return getName();
	}
	
	public function getQualifiedName():String
	{
		return getName();
	}
	
	public function getParent():IASCompilationUnit
	{
		return new ASTASCompilationUnit(LinkedListTree(ast.parent));
	}
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASPackage#getName()
	 */
	public function getName():String
	{
		var first:LinkedListTree = ast.getFirstChild();
		if (first.type == AS3Parser.TYPE)
			return ASTUtils.typeText(first);
		
		return null;
	}
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASPackage#setName()
	 */
	public function setName(value:String):void
	{
		var i:ASTIterator = new ASTIterator(ast);
		var first:LinkedListTree = i.next();

		// null name given, so remove any existing name,
		if (value == null && first.type == AS3Parser.TYPE)
		{
			i.remove();
			return;
		}

		// otherwise, add or replace the name given,
		var newName:LinkedListTree = AS3FragmentParser.parseType(value);
		if (first.type == AS3Parser.TYPE)
		{
			i.replace(newName);
			// add again since the replacement removed the space
			newName.appendToken(TokenBuilder.newSpace());
		}
		else
		{
			// current should be at block, insert before block
			i.insertBeforeCurrent(newName);
			newName.appendToken(TokenBuilder.newSpace());
		}
	}
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASPackage#typeNode
	 */
	public function getType():IASType
	{
		var block:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.BLOCK);
		return TypeBuilder.build(block.getLastChild());
	}
	
	//--------------------------------------------------------------------------
	//
	//  IMetaTagAware API
	//
	//--------------------------------------------------------------------------

	public function getMetaTags():IList // <IASMetaTag>
	{
		return MetaTagUtils.getAllMetaTags(findBlock());
	}
	
	public function newMetaTag(name:String):IASMetaTag
	{
		return MetaTagUtils.newMetaTag(findBlock(), name);
	}
	
	public function getMetaTag(name:String):IASMetaTag
	{
		return MetaTagUtils.getFirstMetaTag(findBlock(), name);
	}
	
	public function getAllMetaTags(name:String):IList // <IASMetaTag>
	{
		return MetaTagUtils.getMetaTagWithName(findBlock(), name);
	}
	
	public function hasMetaTag(name:String):Boolean
	{
		return MetaTagUtils.hasMetaTag(findBlock(), name);
	}
	
	public function removeMetaTag(metaTag:IASMetaTag):Boolean
	{
		return MetaTagUtils.removeMetaTag(ASTASMetaTag(metaTag).getAST());
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
		return ImportUtils.parseImport(findAnnotations(), target);
	}
	
	public function removeImport(target:String):IASImportStatement
	{
		return ImportUtils.removeImport(findAnnotations(), target);
	}
	
	public function getImports():IList
	{
		return ImportUtils.getImports(findAnnotations());
	}

	//--------------------------------------------------------------------------
	//
	//  IIncludeAware API
	//
	//--------------------------------------------------------------------------
	
	public function newInclude(path:IASExpression):IASIncludeStatement
	{
		return IncludeUtils.newInclude(findAnnotations(), path);
	}
	
	public function parseInclude(path:String):IASIncludeStatement
	{
		return IncludeUtils.parseInclude(findAnnotations(), path);
	}
	
	public function removeInclude(path:String):IASIncludeStatement
	{
		return IncludeUtils.removeInclude(findAnnotations(), path);
	}
	
	public function getIncludes():IList
	{
		return IncludeUtils.getIncludes(findAnnotations());
	}

	//--------------------------------------------------------------------------
	//
	//  IUseAware API
	//
	//--------------------------------------------------------------------------
	
	public function newUse(name:IASExpression):IASUseStatement
	{
		return UseUtils.newUse(findAnnotations(), name);
	}
	
	public function parseUse(name:String):IASUseStatement
	{
		return UseUtils.parseUse(findAnnotations(), name);
	}
	
	public function removeUse(name:String):IASUseStatement
	{
		return UseUtils.removeUse(findAnnotations(), name);
	}
	
	public function getUses():IList
	{
		return UseUtils.getUses(findAnnotations());
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	public function ASTASPackage(ast:LinkedListTree)
	{
		super(ast);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Private :: Methods
	//
	//--------------------------------------------------------------------------

	private function findBlock():LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.BLOCK);
	}

	private function findAnnotations():LinkedListTree
	{
		// this is screwy since all package annotations get put into the 
		return ASTUtils.findChildByType(findBlock(), AS3Parser.ANNOTATIONS);
	}
}
}