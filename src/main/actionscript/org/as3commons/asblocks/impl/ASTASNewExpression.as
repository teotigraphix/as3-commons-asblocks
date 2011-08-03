package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASNewExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTASNewExpression extends ASTInvocation implements IASNewExpression
{
	public function ASTASNewExpression(ast:LinkedListTree)
	{
		super(ast);
	}
	
	private function hasArgs():Boolean
	{
		return ASTUtils.findChildByType(ast, AS3Parser.ARGUMENTS) != null;
	}
	
	
	override public function getArguments():IList
	{
		if (hasArgs())
			return super.getArguments();
		return null;
	}
	
	override public function setArguments(value:IList):void
	{
		if (hasArgs())
		{
			if (value == null)
			{
				ast.deleteChild(1);
			}
			else
			{
				super.setArguments(value);
			}
		}
		else
		{
			if (value != null)
			{
				var argTree:LinkedListTree = ASTUtils.newParentheticAST(
					AS3Parser.ARGUMENTS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
				ast.addChildWithTokens(argTree);
				super.setArguments(value);
			}
		}		
	}	
}
}