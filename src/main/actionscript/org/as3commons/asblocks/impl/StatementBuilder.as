package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class StatementBuilder
{
	/**
	 * Build a Statement implementation (ASTAS*Statement) appropriate for
	 * the type of the given AST node.
	 */
	public static function build(ast:LinkedListTree):IASStatement
	{
		switch (ast.type)
		{
		case AS3Parser.BLOCK:
			return new ASTStatementList(ast);
		case AS3Parser.DO:
			return new ASTASDoWhileStatement(ast);
		case AS3Parser.EXPR_STMNT:
			return new ASTASExpressionStatement(ast);
		case AS3Parser.FOR_EACH:
			return new ASTASForEachInStatement(ast);
		case AS3Parser.FOR_IN:
			return new ASTASForInStatement(ast);
		case AS3Parser.FOR:
			return new ASTASForStatement(ast);
		case AS3Parser.IF:
			return new ASTASIfStatement(ast);
		case AS3Parser.SWITCH:
			return new ASTASSwitchStatement(ast);
		case AS3Parser.CONST:
		case AS3Parser.VAR:
			return new ASTASDeclarationStatement(ast);
		case AS3Parser.WHILE:
			return new ASTASWhileStatement(ast);
		case AS3Parser.WITH:
			return new ASTASWithStatement(ast);
		case AS3Parser.RETURN:
			return new ASTASReturnStatement(ast);
//		case AS3Parser.SUPER:
//			return new ASTASSuperStatement(ast);
		case AS3Parser.BREAK:
			return new ASTASBreakStatement(ast);
		case AS3Parser.TRY:
			return new ASTASTryStatement(ast);
		case AS3Parser.DEFAULT_XML_NAMESPACE:
			return new ASTASDefaultXMLNamespaceStatement(ast);
		case AS3Parser.CONTINUE:
			return new ASTASContinueStatement(ast);
		case AS3Parser.THROW:
			return new ASTASThrowStatement(ast);
		case AS3Parser.USE:
			return new ASTASUseStatement(ast);
		case AS3Parser.INCLUDE:
			return new ASTASIncludeStatement(ast);
		case AS3Parser.IMPORT:
			return new ASTASImportStatement(ast);
			default:
				throw new ASBlocksSyntaxError("Unsupported statement node type: " +
					ASTUtils.tokenNameFromAST(ast) + " in " + ASTUtils.str(ASTUtils.stringifyNode(ast)));
		}
	}
}
}