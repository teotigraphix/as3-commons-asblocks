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

import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

/**
 * Various MetaTag utility methods.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class MetaTagUtils
{

	public static function hasMetaTags(ast:LinkedListTree):Boolean
	{
		var i:ASTIterator = iterTags(ast);
		return i.hasNext();
	}

	public static function hasMetaTag(ast:LinkedListTree, name:String):Boolean
	{
		var i:ASTIterator = iterTags(ast);
		while (i.hasNext())
		{
			var child:LinkedListTree = i.next();
			if (child.type == AS3Parser.METATAG)
			{
				if (toMetaTag(child).getName() == name)
					return true;
			}
		}
		return false;
	}

	public static function removeMetaTag(ast:LinkedListTree):Boolean
	{
		// TODO implement MetaTagUtils.removeMetaTag()
		return true;
	}

	public static function getAllMetaTags(ast:LinkedListTree):IList
	{
		var i:ASTIterator = iterTags(ast);
		var result:IList = new ArrayList();
		while (i.hasNext())
		{
			var child:LinkedListTree = i.next();
			if (child.type == AS3Parser.METATAG)
			{
				result.add(toMetaTag(child));
			}
		}
		return result;
	}

	public static function getFirstMetaTag(ast:LinkedListTree, name:String):IASMetaTag
	{
		var i:ASTIterator = iterTags(ast);
		while (i.hasNext())
		{
			var child:LinkedListTree = i.next();
			if (child.type == AS3Parser.METATAG)
			{
				var tag:ASTASMetaTag = toMetaTag(child);
				if (tag.getName() == name)
				{
					return tag;
				}
			}
		}
		return null;
	}

	public static function getMetaTagWithName(ast:LinkedListTree, name:String):IList
	{
		var i:ASTIterator = iterTags(ast);
		var result:IList = new ArrayList();
		while (i.hasNext())
		{
			var child:LinkedListTree = i.next();
			if (child.type == AS3Parser.METATAG)
			{
				var tag:ASTASMetaTag = toMetaTag(child);
				if (tag.getName() == name)
				{
					result.add(tag);
				}
			}
		}
		return result;
	}

	public static function newMetaTag(ast:LinkedListTree, name:String):IASMetaTag
	{
		var tag:LinkedListTree = ASTBuilder.newMetadataTag(name);
		var annotations:LinkedListTree = null;
		
		if (isType(ast))
		{
			annotations = findTags(ast);
			ASTUtils.addParenChildWithIndentation(annotations, tag);
			return toMetaTag(tag);
		}
		
		annotations = findTags(ast);
		
		var trailingnl:LinkedListToken = TokenBuilder.newNewline();
		// if there is only one child, the nl will fall after the annotations
		// container, so the annos need it's stop token adjusted
		var stop:LinkedListTree = (annotations.childCount == 1) ? annotations : tag;
		
		stop.getStopToken().appendToken(trailingnl);
		stop.setStopToken(trailingnl);
		
		var indent:String = ASTUtils.findIndent(ast);
		if (indent.length > 0)
		{
			var stopToken:LinkedListToken = stop.getStopToken();
			var indentTok:LinkedListToken = TokenBuilder.newWhiteSpace(indent);
			stopToken.appendToken(indentTok);
			stop.setStopToken(indentTok);
		}
		
		annotations.addChildWithTokens(tag);
		return toMetaTag(tag);
	}

	private static function iterTags(ast:LinkedListTree):ASTIterator
	{
		return new ASTIterator(findTags(ast));
	}

	private static function findTags(ast:LinkedListTree):LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.ANNOTATIONS);
	}

	private static function toMetaTag(tag:LinkedListTree):ASTASMetaTag
	{
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.METATAG, tag.type);
		return new ASTASMetaTag(tag);
	}

	private static function isType(ast:LinkedListTree):Boolean
	{
		return ast.parent.type == AS3Parser.PACKAGE;
	}

}
}