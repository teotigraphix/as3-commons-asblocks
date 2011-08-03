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
import org.as3commons.asblocks.dom.IASIncludeStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class IncludeUtils
{
	public static function newInclude(ast:LinkedListTree, path:IASExpression):IASIncludeStatement
	{
		return null;
	}
	
	public static function parseInclude(ast:LinkedListTree, path:String):IASIncludeStatement
	{
		var child:LinkedListTree = AS3FragmentParser.parseInclude(ASTUtils.str(path));
		ASTUtils.addChildWithIndentation(ast, child);
		return StatementBuilder.build(child) as IASIncludeStatement;
	}
	
	public static function removeInclude(ast:LinkedListTree, path:String):IASIncludeStatement
	{
		var i:ASTIterator = new ASTIterator(ast);
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.INCLUDE)) != null)
		{
			var result:IASIncludeStatement = StatementBuilder
					.build(child) as IASIncludeStatement;
			if (result.getTargetString() == path)
			{
				i.remove();
				return result;
			}
		}
		return null;
	}
	
	public static function getIncludes(ast:LinkedListTree):IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		var child:LinkedListTree;
		while ((child = i.search(AS3Parser.INCLUDE)) != null)
		{
			var element:IASIncludeStatement = StatementBuilder
					.build(child) as IASIncludeStatement;
			result.add(element);
		}
		return result;
	}

}
}