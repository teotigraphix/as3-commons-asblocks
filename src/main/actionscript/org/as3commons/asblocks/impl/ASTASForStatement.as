package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASForStatement;
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASForStatement extends ContainerDelegate implements IASForStatement
{
	private static const INDEX_INIT:int = 0;
	
	private static const INDEX_CONDITION:int = 1;
	
	private static const INDEX_UPDATE:int = 2;
	
	private static const INDEX_STATEMENT:int = 3;
	
	public function ASTASForStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getInitializer():IScriptElement
	{
		if (!hasInit())
			return null;
		var init:LinkedListTree = findInit().getFirstChild();
		switch (init.type)
		{
		case AS3Parser.VAR:
		case AS3Parser.CONST:
			return new ASTASDeclarationStatement(init);
		default:
			return ExpressionBuilder.build(init);
		}
	}
	
	public function setInitializer(value:IScriptElement):void
	{
		if (value == null)
		{
			deleteAnyChild(findInit());
		}
		else
		{
			setFirstChild(findInit(), toAST(value));
		}		
	}
	
	public function getCondition():IASExpression
	{
		if (!hasCondition())
			return null;
		return ExpressionBuilder.build(findCondition().getFirstChild());
	}
	
	public function setCondition(value:IASExpression):void
	{
		var cond:LinkedListTree = findCondition();
		if (value == null)
		{
			deleteAnyChild(cond);
		}
		else
		{
			setFirstChild(cond, toAST(value));
		}
	}
	
	public function getIterator():IASExpression
	{
		if (!hasIterator())
			return null;
		return ExpressionBuilder.build(findIterator().getFirstChild());
	}
	
	public function setIterator(value:IASExpression):void
	{
		if (value == null)
		{
			deleteAnyChild(findIterator());
		}
		else
		{
			setFirstChild(findIterator(), toAST(value));
		}
	}
	
	public function getInitializerString():String
	{
		if (!hasInit())
			return null;
		return ASTUtils.stringifyNode(findInit());
	}
	
	public function getConditionString():String
	{
		if (!hasCondition())
			return null;
		return ASTUtils.stringifyNode(findCondition().getFirstChild());
	}
	
	public function getIteratorString():String
	{
		if (!hasIterator())
			return null;
		return ASTUtils.stringifyNode(findIterator().getFirstChild());
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_STATEMENT));
	}
	
	
	
	private function hasCondition():Boolean
	{
		return findCondition().childCount > 0;
	}

	private function hasInit():Boolean
	{
		return findInit().childCount > 0;
	}

	private function hasIterator():Boolean
	{
		return findIterator().childCount > 0;
	}

	private function getChild(index:int):LinkedListTree
	{
		return LinkedListTree(ast.getChild(index));
	}

	private function findInit():LinkedListTree
	{
		return getChild(INDEX_INIT);
	}

	private function findCondition():LinkedListTree
	{
		return getChild(INDEX_CONDITION);
	}

	private function findIterator():LinkedListTree
	{
		return getChild(INDEX_UPDATE);
	}

	private function deleteAnyChild(tree:LinkedListTree):void
	{
		if (tree.childCount > 0)
		{
			tree.deleteChild(0);
		}
	}

	private static function setFirstChild(parent:LinkedListTree,
			child:LinkedListTree):void
	{
		if (parent.childCount == 0)
		{
			parent.addChildWithTokens(child);
		}
		else
		{
			parent.setChildWithTokens(0, child);
		}
	}
	
	
	
}
}