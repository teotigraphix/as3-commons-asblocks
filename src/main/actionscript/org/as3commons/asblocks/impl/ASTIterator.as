package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.error.NoSuchElementError;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.IllegalStateError;

public class ASTIterator
{
	private var _parent:LinkedListTree;
	
	private var _index:int = -1;
	
	public function get currentIndex():int
	{
		return _index;
	}
	
	public function ASTIterator(parent:LinkedListTree)
	{
		if (parent == null)
		{
			throw new IllegalArgumentError("null not allowed");
		}
		
		_parent = parent;
	}
	
	public function hasNext():Boolean
	{
		return _index < _parent.childCount - 1;
	}
	
	public function next(tokenType:int = int.MAX_VALUE):LinkedListTree
	{
		if (tokenType == int.MAX_VALUE)
		{
			if (!hasNext()) 
			{
				throw new NoSuchElementError("No such element "  + ASTUtils.tokenName(tokenType));
			}
			_index++;
			return LinkedListTree(_parent.getChild(_index));
		}
		
		if (!hasNext())
		{
			throw new IllegalStateError("expected " + ASTUtils.tokenName(tokenType) + 
				" but reached last child");
		}
		
		if (_parent.getChild(_index+1).type != tokenType)
		{
			throw new IllegalStateError("expected " + ASTUtils.tokenName(tokenType) + 
				" but got " + _parent.getChild(_index + 1));
		}
		
		return next();
	}

	/**
	 * After a call to remove, another call to next() is required to access
	 * the element following the one just deleted.
	 */
	public function remove():void
	{
		_parent.deleteChild(_index);
		_index--;
	}
	
	public function replace(replacement:LinkedListTree):void
	{
		_parent.setChildWithTokens(_index, replacement);
	}
	
	public function search(tokenType:int):LinkedListTree
	{
		while (hasNext())
		{
			var ast:LinkedListTree = next();
			if (ast.type == tokenType)
				return ast;
		}
		return null;
	}

	public function find(tokenType:int):LinkedListTree
	{
		var result:LinkedListTree = search(tokenType);
		if (result != null) {
			return result;
		}
		throw new IllegalStateError("expected " + ASTUtils.tokenName(tokenType) + 
			" but not found");
	}

	public function insertBeforeCurrent(insert:LinkedListTree):void
	{
		_parent.addChildAtWithTokens(_index, insert);
	}
}
}