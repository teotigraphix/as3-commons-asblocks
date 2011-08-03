package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTStatementBuilder
{
	public static function newBlock():IASBlock
	{
		var block:LinkedListTree = ASTBuilder.newBlock();
		return new ASTStatementList(block);
	}

	public static function newStatement(statement:String):IASStatement
	{
		var ast:LinkedListTree = AS3FragmentParser.parseStatement(statement);
		ast.parent = null;
		return StatementBuilder.build(ast);
	}

	public static function newIf(condition:String):IASIfStatement
	{
		return StatementBuilder.build(ASTStatementBuilder.parseNewIfAST(condition)) as IASIfStatement;
	}

	public static function newDeclaration(declaration:String):IASDeclarationStatement
	{
		var ast:LinkedListTree = parseNewDeclarationAST(declaration);
		ast.parent = null;
		// remove the semi
		var end:LinkedListToken = ast.getStopToken().getPrev();
		ast.setStopToken(end);
		return StatementBuilder.build(ast) as IASDeclarationStatement;
	}

	public static function parseDoWhile(condition:String):LinkedListTree
	{
		return newDoWhile(AS3FragmentParser.parseExpression(condition));
	}

	public static function newDoWhile(condition:LinkedListTree):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newAST(AS3Parser.DO, "do");
		ast.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree = newBlockAST();
		ast.addChildWithTokens(block);
		ast.appendToken(TokenBuilder.newSpace());
		ast.appendToken(TokenBuilder.newWhile());
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(newCondition(condition));
		ast.appendToken(TokenBuilder.newSemi());
		return ast;
	}

	public static function newBlockAST(type:int = int.MAX_VALUE):LinkedListTree
	{
		if (type == int.MAX_VALUE)
			return newBlockAST(AS3Parser.BLOCK);

		var ast:LinkedListTree = ASTUtils.newParentheticAST(type, AS3Parser.LBRACE, "{", AS3Parser.RBRACE, "}");
		var nl:LinkedListToken = TokenBuilder.newNewline();
		ast.getInitialInsertionAfter().appendToken(nl);
		ast.setInitialInsertionAfter(nl);
		return ast;
	}

	/**
	 * returns a CONDITION node with the given expression as its child
	 */
	private static function newCondition(expr:LinkedListTree):LinkedListTree
	{
		var cond:LinkedListTree = ASTUtils.newParentheticAST(AS3Parser.CONDITION, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		cond.addChildWithTokens(expr);
		return cond;
	}

	public static function newDefaultXMLNamespaceAST(
			namespace:LinkedListTree):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.DEFAULT_XML_NAMESPACE);
		ast.appendToken(TokenBuilder.newDefault());
		ast.appendToken(TokenBuilder.newSpace());
		ast.appendToken(TokenBuilder.newXml());
		ast.appendToken(TokenBuilder.newSpace());
		ast.appendToken(TokenBuilder.newNamespace());
		ast.appendToken(TokenBuilder.newSpace());
		ast.appendToken(TokenBuilder.newAssign());
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(namespace);
		ast.appendToken(TokenBuilder.newSemi());
		return ast;
	}

	public static function newStringAST(value:String):LinkedListTree
	{
		return ASTUtils.newAST(AS3Parser.STRING_LITERAL, ASTUtils.str(value));
	}

	public static function newExpressionStatementAST(expr:LinkedListTree):LinkedListTree
	{
		var exprStmt:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.EXPR_STMNT);
		exprStmt.addChildWithTokens(expr);
		exprStmt.appendToken(TokenBuilder.newSemi());
		return exprStmt;
	}

	public static function parseNewIfAST(condition:String):LinkedListTree
	{
		return newIfAST(AS3FragmentParser.parseExpression(condition));
	}

	public static function newIfAST(condition:LinkedListTree):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newAST(AS3Parser.IF, "if");
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(conditionAST(condition));
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(ASTBuilder.newBlock());
		return ast;
	}

	private static function conditionAST(expression:LinkedListTree):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newParentheticAST(AS3Parser.CONDITION, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		ast.addChildWithTokens(expression);
		return ast;
	}

	public static function parseNewForAST(init:String, condition:String,
			iterate:String):LinkedListTree
	{
		return newForAST(init == null ? null
				: AS3FragmentParser.parseForInit(init), condition == null ? null
				: AS3FragmentParser.parseForCond(condition), iterate == null ? null
				: AS3FragmentParser.parseForIter(iterate));
	}

	public static function newForAST(init:LinkedListTree,
			condition:LinkedListTree, iterate:LinkedListTree):LinkedListTree
	{
		var forStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.FOR, "for");
		forStmt.appendToken(TokenBuilder.newSpace());
		forStmt.appendToken(TokenBuilder.newLParen());
		if (init != null)
		{
			forStmt.addChildWithTokens(init);
		}
		else
		{
			var initStmt:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.FOR_INIT);
			forStmt.addChildWithTokens(initStmt);
		}
		forStmt.appendToken(TokenBuilder.newSemi());
		forStmt.appendToken(TokenBuilder.newSpace());
		if (condition != null)
		{
			forStmt.addChildWithTokens(condition);
		}
		else
		{
			var condStmt:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.FOR_CONDITION);
			forStmt.addChildWithTokens(condStmt);
		}
		forStmt.appendToken(TokenBuilder.newSemi());
		forStmt.appendToken(TokenBuilder.newSpace());
		if (iterate != null)
		{
			forStmt.addChildWithTokens(iterate);
		}
		else
		{
			var iterStmt:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.FOR_ITERATOR);
			forStmt.addChildWithTokens(iterStmt);
		}
		forStmt.appendToken(TokenBuilder.newRParen());
		return forStmt;
	}

	public static function parseNewDeclarationAST(assignment:String):LinkedListTree
	{
		return newDeclarationAST(AS3FragmentParser.parseVariableDeclarator(assignment));
	}

	public static function newDeclarationAST(assignment:LinkedListTree):LinkedListTree
	{
		var declStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.VAR, "var");
		declStmt.appendToken(TokenBuilder.newSpace());
		declStmt.addChildWithTokens(assignment);
		declStmt.appendToken(TokenBuilder.newSemi());
		return declStmt;
	}

	public static function parseNewForInAST(declaration:String,
			expression:String):LinkedListTree
	{
		return newForInAST(AS3FragmentParser.parseForInVar(declaration), AS3FragmentParser.parseExpression(expression));
	}

	public static function newForInAST(declaration:LinkedListTree,
			expression:LinkedListTree):LinkedListTree
	{
		var forStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.FOR_IN, "for");
		forStmt.appendToken(TokenBuilder.newSpace());
		genForInSetup(forStmt, declaration, expression);
		return forStmt;
	}

	private static function genForInSetup(forStmt:LinkedListTree,
			declaration:LinkedListTree, expression:LinkedListTree):void
	{
		forStmt.appendToken(TokenBuilder.newLParen());
		forStmt.addChildWithTokens(declaration);
		forStmt.appendToken(TokenBuilder.newSpace());
		forStmt.appendToken(TokenBuilder.newIn());
		forStmt.appendToken(TokenBuilder.newSpace());
		forStmt.addChildWithTokens(expression);
		forStmt.appendToken(TokenBuilder.newRParen());
	}

	public static function parseNewForEachInAST(declaration:String,
			expression:String):LinkedListTree
	{
		return newForEachInAST(AS3FragmentParser.parseForInVar(declaration), AS3FragmentParser.parseExpression(expression));
	}

	public static function newForEachInAST(declaration:LinkedListTree,
			expression:LinkedListTree):LinkedListTree
	{
		var forStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.FOR_EACH, "for");
		forStmt.appendToken(TokenBuilder.newSpace());
		forStmt.appendToken(TokenBuilder.newEach());
		genForInSetup(forStmt, declaration, expression);
		return forStmt;
	}

	public static function parseNewWhileAST(condition:String):LinkedListTree
	{
		return newWhileAST(AS3FragmentParser.parseExpression(condition));
	}

	public static function newWhileAST(condition:LinkedListTree):LinkedListTree
	{
		var whileStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.WHILE, "while");
		whileStmt.appendToken(TokenBuilder.newSpace());
		whileStmt.addChildWithTokens(conditionAST(condition));
		return whileStmt;
	}

	public static function parseNewDoWhileAST(condition:String):LinkedListTree
	{
		return newDoWhile(AS3FragmentParser.parseExpression(condition));
	}

	public static function newDoWhileAST(condition:LinkedListTree):LinkedListTree
	{
		var doWhileStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.DO, "do");
		doWhileStmt.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree = ASTBuilder.newBlock();
		doWhileStmt.addChildWithTokens(block);
		doWhileStmt.appendToken(TokenBuilder.newSpace());
		doWhileStmt.appendToken(TokenBuilder.newWhile());
		doWhileStmt.appendToken(TokenBuilder.newSpace());
		doWhileStmt.addChildWithTokens(conditionAST(condition));
		doWhileStmt.appendToken(TokenBuilder.newSemi());
		return doWhileStmt;
	}

	public static function parseNewSwitchAST(condition:String):LinkedListTree
	{
		return newSwitchAST(AS3FragmentParser.parseExpression(condition));
	}

	public static function newSwitchAST(condition:LinkedListTree):LinkedListTree
	{
		var switchStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.SWITCH, "switch");
		switchStmt.appendToken(TokenBuilder.newSpace());
		switchStmt.addChildWithTokens(conditionAST(condition));
		switchStmt.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree = ASTBuilder.newBlock();
		switchStmt.addChildWithTokens(block);
		return switchStmt;
	}

	public static function parseNewWith(expr:String):LinkedListTree
	{
		return newWith(AS3FragmentParser.parseExpression(expr));
	}

	public static function newWith(expr:LinkedListTree):LinkedListTree
	{
		var withStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.WITH, "with");
		withStmt.appendToken(TokenBuilder.newSpace());
		withStmt.addChildWithTokens(conditionAST(expr));
		return withStmt;
	}

	public static function parseNewReturnAST(expr:String):LinkedListTree
	{
		return newReturnAST(expr == null ? null
				: AS3FragmentParser.parseExpression(expr));
	}

	public static function newReturnAST(expr:LinkedListTree):LinkedListTree
	{
		var returnStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.RETURN, "return");
		if (expr != null)
		{
			returnStmt.appendToken(TokenBuilder.newSpace());
			returnStmt.addChildWithTokens(expr);
		}
		returnStmt.appendToken(TokenBuilder.newSemi());
		return returnStmt;
	}

//	public static function newBreakStatementAST():LinkedListTree
//	{
//		return newBreakStatementAST(null);
//	}

	public static function newBreakStatementAST(label:String = null):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newAST(AS3Parser.BREAK, "break");
		if (label != null)
		{
			var ident:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, label);
			ident.prependToken(TokenBuilder.newSpace());
			ast.addChildWithTokens(ident);
		}
		ast.appendToken(TokenBuilder.newSemi());
		return ast;
	}

	public static function newTryStatementAST():LinkedListTree
	{
		var tryStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.TRY, "try");
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.addChildWithTokens(ASTBuilder.newBlock());
		return tryStmt;
	}

	public static function newCatchClauseAST(nameAST:LinkedListTree,
			typeAST:LinkedListTree):LinkedListTree
	{
		var tryStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.CATCH, "catch");
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.appendToken(TokenBuilder.newLParen());
		tryStmt.addChildWithTokens(nameAST);
		if (typeAST != null)
		{
			tryStmt.addChildWithTokens(typeAST);
		}
		tryStmt.appendToken(TokenBuilder.newRParen());
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.addChildWithTokens(ASTBuilder.newBlock());
		return tryStmt;
	}

	public static function parseNewCatchClauseAST(v:String, type:String):LinkedListTree
	{
		var tryStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.CATCH, "catch");
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.appendToken(TokenBuilder.newLParen());
		tryStmt.addChildWithTokens(AS3FragmentParser.parseSimpleIdent(v));
		if (type != null)
		{
			tryStmt.addChildWithTokens(AS3FragmentParser.parseTypeSpec(type));
		}
		tryStmt.appendToken(TokenBuilder.newRParen());
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.addChildWithTokens(ASTBuilder.newBlock());
		return tryStmt;
	}

	public static function newFinallyClauseAST():LinkedListTree
	{
		var tryStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.FINALLY, "finally");
		tryStmt.appendToken(TokenBuilder.newSpace());
		tryStmt.addChildWithTokens(ASTBuilder.newBlock());
		return tryStmt;
	}

//	public static function newContinueStatementAST():LinkedListTree
//	{
//		return newContinueStatementAST(null);
//	}

	public static function newContinueStatementAST(label:String = null):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newAST(AS3Parser.CONTINUE, "continue");
		if (label != null)
		{
			var ident:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, label);
			ident.prependToken(TokenBuilder.newSpace());
			ast.addChildWithTokens(ident);
		}
		ast.appendToken(TokenBuilder.newSemi());
		return ast;
	}

	public static function newThrowStatementAST(ast:LinkedListTree):LinkedListTree
	{
		var thrw:LinkedListTree = ASTUtils.newAST(AS3Parser.THROW, "throw");
		thrw.appendToken(TokenBuilder.newSpace());
		thrw.addChildWithTokens(ast);
		thrw.appendToken(TokenBuilder.newSemi());
		return thrw;
	}

	public static function newSuperStatementAST(args:IList):LinkedListTree
	{
		var superStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.SUPER, "super");
		var argumentsNode:LinkedListTree = ASTUtils.newParentheticAST(AS3Parser.ARGUMENTS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		ArgumentUtils.overwriteArgsWithExpressionList(argumentsNode, args);
		superStmt.addChildWithTokens(argumentsNode);
		superStmt.appendToken(TokenBuilder.newSemi());
		return superStmt;
	}

	public static function parseNewConfigAST(name:String):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILE_CONFIG);
		var dbl:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.DBL_COLON);
		ast.addChildWithTokens(dbl);
		dbl.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, "CONFIG"));
		dbl.appendToken(TokenBuilder.newToken(AS3Parser.DBL_COLON, "::"));
		dbl.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		dbl.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(newBlockAST(AS3Parser.BLOCK));
		return ast;
	}

	public static function newConfigAST(name:IASExpression):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILE_CONFIG);
		var dbl:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.DBL_COLON);
		ast.addChildWithTokens(dbl);
		dbl.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, "CONFIG"));
		dbl.appendToken(TokenBuilder.newToken(AS3Parser.DBL_COLON, "::"));
		dbl.addChildWithTokens(ASTUtils.ast(name));
		dbl.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(newBlockAST(AS3Parser.BLOCK));
		return ast;
	}

	public static function parseNewLabelAST(name:String):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.LABEL_STMNT);
		ast.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		ast.appendToken(TokenBuilder.newColon());
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(newBlockAST(AS3Parser.BLOCK));
		return ast;
	}

	public static function newLabelAST(name:IASExpression):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.LABEL_STMNT);
		ast.addChildWithTokens(ASTUtils.ast(name));
		ast.appendToken(TokenBuilder.newColon());
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(newBlockAST(AS3Parser.BLOCK));
		return ast;
	}
}
}