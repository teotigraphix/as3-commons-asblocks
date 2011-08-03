package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ArgumentUtils
{
	/**
	 * Finds the first child of the given AST node of type ARGUMENTS
	 * 
	 * @return the matching AST node, or null if none is found
	 */
	public static function findArgs(parent:LinkedListTree):LinkedListTree
	{
		return ASTUtils.findChildByType(parent, AS3Parser.ARGUMENTS);
	}

	/**
	 * 
	 * @param args the ARGUMENTS AST node
	 * @return a list of ASExpression
	 */
	public static function astToExpressionList(args:LinkedListTree):IList
	{
		var i:ASTIterator = new ASTIterator(args);
		var result:IList = new ArrayList();
		while (i.hasNext())
		{
			result.add(ExpressionBuilder.build(i.next()));
		}
		return result;
	}

	/**
	 * 
	 * @param argumentNode the ARGUMENTS AST node
	 * @param args list of ASExpression objects to be used as the new
	 *        argument list
	 */
	public static function overwriteArgsWithExpressionList(argumentNode:LinkedListTree, 
														   args:IList):void
	{
		// get rid of any old arguments,
		ASTUtils.deleteAllChildren(argumentNode);
		
		if (args == null)
			return;
		
		// add the new arguments,
		var len:int = args.size;
		for (var i:int = 0; i < len; i++)
		{
			var arg:ASTExpression = ASTExpression(args.itemAt(i));
			argumentNode.addChildWithTokens(arg.getAST());
			if (i < len - 1)
			{
				argumentNode.appendToken(TokenBuilder.newComma());
				argumentNode.appendToken(TokenBuilder.newSpace());
			}
		}
	}
}
}