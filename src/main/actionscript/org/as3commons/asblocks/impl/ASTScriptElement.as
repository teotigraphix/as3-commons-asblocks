package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTScriptElement implements IScriptElement
{
	protected var ast:LinkedListTree;
	
	public function ASTScriptElement(ast:LinkedListTree)
	{
		this.ast = ast;
	}	
	
	public function getAST():LinkedListTree
	{
		return ast;
	}
	
	protected static function toAST(element:IScriptElement):LinkedListTree
	{
		if (element == null)
			return null;
		return ASTScriptElement(element).getAST();
	}
	
	protected function get debugString():String
	{
		return toString();
	}
	
	public function toString():String
	{
		return ASTUtils.stringifyNode(ast);
	}
}
}