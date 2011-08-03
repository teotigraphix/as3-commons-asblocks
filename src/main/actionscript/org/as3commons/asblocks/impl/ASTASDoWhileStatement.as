package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IASDoWhileStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASDoWhileStatement extends ContainerDelegate implements IASDoWhileStatement
{
	private static const INDEX_STATEMENT:int = 0;
	private static const INDEX_CONDITION:int = 1;
	
	public function ASTASDoWhileStatement(ast:LinkedListTree)
	{
		super(ast);
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.DO, ast.type);
	}
	
	public function getCondition():IASExpression
	{
		return ExpressionBuilder.build(findCondition().getFirstChild());
	}
	
	public function setCondition(value:IASExpression):void
	{
		findCondition().setChildWithTokens(0, ASTUtils.ast(value));
	}
	
	public function parseCondition(value:String):void
	{
		var cond:LinkedListTree = AS3FragmentParser.parseCondition(value);
		ast.setChildWithTokens(INDEX_CONDITION, cond);
	}
	
	public function getConditionString():String
	{
		return ASTUtils.stringifyNode(findCondition().getFirstChild());
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		return new ASTStatementList(getChild(INDEX_STATEMENT));
	}
		
	private function getChild(index:int):LinkedListTree
	{
		return ast.getChild(index) as LinkedListTree;
	}	
	
	private function findCondition():LinkedListTree
	{
		return getChild(INDEX_CONDITION) as LinkedListTree;
	}
}
}