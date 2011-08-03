package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASIfStatement extends ContainerDelegate implements IASIfStatement
{
	private static const THEN_INDEX:int = 1;
	
	private static const ELSE_INDEX:int = 2;
	
	public function ASTASIfStatement(ast:LinkedListTree)
	{
		super(ast);
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.IF, ast.type);
	}
	
	override protected function getStatementContainer():IStatementContainer
	{
		var child:LinkedListTree = thenClause();
		if (AS3Parser.BLOCK != child.type)
		{
			throw new ASBlocksSyntaxError("statement is not a block");
		}
		return new ASTStatementList(child);
	}
	
	public function getCondition():IASExpression
	{
		return ExpressionBuilder.build(condition().getFirstChild());
	}
	
	public function getConditionString():String
	{
		return ASTUtils.stringifyNode(condition().getFirstChild());
	}
	
	public function setCondition(value:IASExpression):void
	{
		//		LinkedListTree cond = AS3FragmentParser.parseCondition(value);
		//		ast.setChildWithTokens(0, cond);
		var condExpr:LinkedListTree = toAST(value);
		condition().setChildWithTokens(0, condExpr);		
	}
	
	public function getThenStatement():IASStatement
	{
		return StatementBuilder.build(thenClause());
	}
	
	public function setThen(value:IASBlock):void
	{
		var theBlock:LinkedListTree = toAST(value);
		var i:ASTIterator = new ASTIterator(ast);
		i.next(); // move to condition
		i.next(); // move to then-branch
		i.replace(theBlock);
		var indent:String = ASTUtils.findIndent(ast);
		ASTUtils.increaseIndentAfterFirstLine(theBlock, indent);
	}
	
	public function setThenStatement(statement:IASStatement):void
	{
		var thenAST:LinkedListTree = toAST(statement);
		ast.setChildWithTokens(THEN_INDEX, thenAST);
		if (AS3Parser.BLOCK == thenAST.type)
		{
			var indent:String = ASTUtils.findIndent(ast);
			ASTUtils.increaseIndentAfterFirstLine(thenAST, indent);
		}		
	}
	
	public function getElse():IASBlock
	{
		var elseClause:LinkedListTree = elseClause();
		if (elseClause == null)
		{
			var indent:String = ASTUtils.findIndent(ast);
			elseClause = ASTUtils.newAST(AS3Parser.ELSE, "else");
			ast.appendToken(TokenBuilder.newSpace());
			ast.addChildWithTokens(elseClause);
			elseClause.appendToken(TokenBuilder.newSpace());
			var block:LinkedListTree = ASTBuilder.newBlock();
			elseClause.addChildWithTokens(block);
			ASTUtils.increaseIndentAfterFirstLine(block, indent);
			return new ASTStatementList(block);
		}
		var statement:IASStatement = StatementBuilder.build(elseClause.getFirstChild());
		if (!(statement is IASBlock))
		{
			throw new ASBlocksSyntaxError("Expected a block, got "
					+ ASTUtils.tokenNameFromAST(elseClause.getFirstChild()));
		}
		return IASBlock(statement);
	}
	
	public function getElseStatement():IASStatement
	{
		// this is the { statement }
		var clause:LinkedListTree = elseClause();
		if (clause == null)
			return null;
		return StatementBuilder.build(clause.getFirstChild());
	}
	
	public function setElseStatement(value:IASStatement):void
	{
		var block:IASBlock = getElse();
		var statement:LinkedListTree = ASTUtils.ast(value);
		var child:LinkedListTree = elseClause();
		child.setChildWithTokens(0, statement);
		var indent:String = ASTUtils.findIndent(ast);
		ASTUtils.increaseIndentAfterFirstLine(statement, indent);
	}
	
	
	private function condition():LinkedListTree
	{
		return ast.getFirstChild();
	}

	private function thenClause():LinkedListTree
	{
		return LinkedListTree(ast.getChild(THEN_INDEX));
	}

	private function elseClause():LinkedListTree
	{
		return LinkedListTree(ast.getChild(ELSE_INDEX));
	}
}
}