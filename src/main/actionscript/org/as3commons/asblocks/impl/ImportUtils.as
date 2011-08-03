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

import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASImportStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ImportUtils
{
	public static function newImport(target:IASExpression):IASImportStatement
	{
		return null;
	}
	
	public static function parseImport(ast:LinkedListTree, target:String):IASImportStatement
	{
		var child:LinkedListTree = AS3FragmentParser.parseImport(target);
		ASTUtils.addChildWithIndentation(ast, child);
		return new ASTASImportStatement(child);
	}
	
	public static function removeImport(ast:LinkedListTree, target:String):IASImportStatement
	{
		var i:ASTIterator = new ASTIterator(ast);
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.IMPORT)) != null)
		{
			var result:IASImportStatement = StatementBuilder
					.build(child) as IASImportStatement;
			if (result.getTargetString() == target)
			{
				i.remove();
				return result;
			}
		}
		return null;
	}
	
	public static function getImports(ast:LinkedListTree):IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.IMPORT)) != null)
		{
			var element:IASImportStatement = StatementBuilder
					.build(child) as IASImportStatement;
			result.add(element);
		}
		return result;
	}
}
}