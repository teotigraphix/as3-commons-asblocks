package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class MethodAwareUtils
{
	public static function getMethods(ast:LinkedListTree):IList // <IASMethod>
	{
		var results:IList = new ArrayList();
		for (var i:ASTIterator = blockIterator(ast); i.hasNext(); )
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.METHOD_DEF)
			{
				results.add(new ASTASMethod(member));
			}
		}
		return results;
	}
	
	public static function getMethod(ast:LinkedListTree, name:String):IASMethod
	{
		for (var i:ASTIterator = blockIterator(ast); i.hasNext() ;)
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.METHOD_DEF)
			{
				var meth:IASMethod = new ASTASMethod(member);
				if (meth.getName() == name)
					return meth;
			}
		}
		return null;
	}	
	
	public static function removeMethod(ast:LinkedListTree, name:String):IASMethod
	{
		for (var i:ASTIterator = blockIterator(ast); i.hasNext() ;)
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.METHOD_DEF)
			{
				var meth:IASMethod = new ASTASMethod(member);
				if (meth.getName() == name)
				{
					i.remove();
					return meth;
				}
			}
		}
		return null;
	}	
	
	private static function blockIterator(ast:LinkedListTree):ASTIterator
	{
		return new ASTIterator(findTypeBlock(ast));
	}

	private static function findTypeBlock(ast:LinkedListTree):LinkedListTree
	{
		return ASTUtils.findChildByType(ast, AS3Parser.TYPE_BLOCK);
	}	
}
}