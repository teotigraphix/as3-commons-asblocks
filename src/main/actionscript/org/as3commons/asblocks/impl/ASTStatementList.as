////////////////////////////////////////////////////////////////////////////////
// Copyright 2011 Michael Schmalle - Teoti Graphix, LLC
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASBreakStatement;
import org.as3commons.asblocks.dom.IASConfigStatement;
import org.as3commons.asblocks.dom.IASContinueStatement;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASDefaultXMLNamespaceStatement;
import org.as3commons.asblocks.dom.IASDoWhileStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASExpressionStatement;
import org.as3commons.asblocks.dom.IASForEachInStatement;
import org.as3commons.asblocks.dom.IASForInStatement;
import org.as3commons.asblocks.dom.IASForStatement;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASLabelStatement;
import org.as3commons.asblocks.dom.IASReturnStatement;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IASSuperStatement;
import org.as3commons.asblocks.dom.IASSwitchStatement;
import org.as3commons.asblocks.dom.IASThrowStatement;
import org.as3commons.asblocks.dom.IASTryStatement;
import org.as3commons.asblocks.dom.IASUseStatement;
import org.as3commons.asblocks.dom.IASWhileStatement;
import org.as3commons.asblocks.dom.IASWithStatement;
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;
import org.as3commons.lang.IllegalArgumentError;

public class ASTStatementList extends ASTScriptElement implements IASBlock
{
	public function ASTStatementList(ast:LinkedListTree)
	{
		super(ast);
		assertBlockAST(ast);
	}
	
	private function assertBlockAST(ast:LinkedListTree):void
	{
		switch (ast.type)
		{
		    case AS3Parser.BLOCK:
		    case AS3Parser.SWITCH_STATEMENT_LIST:
			break;
		    default:
			throw new IllegalArgumentError("statement is not a block: " + 
				ASTUtils.tokenNameFromAST(ast));
		}
	}
	
	public function hasStatements():Boolean
	{
		return ast.getFirstChild() != null;
	}
	
	public function getStatements():IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		while (i.hasNext())
		{
			result.add(StatementBuilder.build(i.next()));
		}
		return result;
	}
	
	public function addComment(text:String):void
	{
		CommentUtils.appendSLCommentAST(ast, text);
	}
	
	public function addStatement(statement:IASStatement):IASStatement
	{
		if (containsChild(statement))
		{
			throw new ASBlocksSyntaxError("IASStatement contained in list ["
					+ statement + "]");
		}
		var ast:LinkedListTree = ASTUtils.ast(statement);
		addChildStatement(ast);
		return statement;
	}

	
	public function parseStatement(statement:String):IASStatement
	{
		var ast:LinkedListTree = AS3FragmentParser.parseStatement(statement);
		addChildStatement(ast);
		return StatementBuilder.build(ast);
	}

	
	public function removeStatement(statement:IASStatement):IASStatement
	{
		if (!containsChild(statement))
		{
			throw new ASBlocksSyntaxError(
					"IASStatement not contained in list [" + statement + "]");
		}

		var child:LinkedListTree = ASTUtils.ast(statement);
		var index:int = ast.getIndexOfChild(child);
		ast.deleteChild(index);
		return StatementBuilder.build(child);
	}

	
	public function parseNewExpressionStatement(expr:String):IASExpressionStatement
	{
		var ast:LinkedListTree = AS3FragmentParser.parseExprStatement(expr);
		addChildStatement(ast);
		return new ASTASExpressionStatement(ast);
	}

	
	public function newExpressionStatement(expr:IASExpression):IASExpressionStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newExpressionStatementAST(toAST(expr));
		addChildStatement(ast);
		return new ASTASExpressionStatement(ast);
	}

	
	public function newIf(condition:IASExpression):IASIfStatement
	{
		var ifStmt:LinkedListTree = ASTStatementBuilder.newIfAST(toAST(condition));
		addChildStatement(ifStmt);
		return new ASTASIfStatement(ifStmt);
	}

	
	public function parseNewIf(condition:String):IASIfStatement
	{
		var ifStmt:LinkedListTree = ASTStatementBuilder.parseNewIfAST(condition);
		addChildStatement(ifStmt);
		return new ASTASIfStatement(ifStmt);
	}

	
	public function newFor(init:IScriptElement, condition:IASExpression,
			iterate:IASExpression):IASForStatement
	{
		var initAST:LinkedListTree = (init != null) ? toAST(init) : null;
		var conditionAST:LinkedListTree = (init != null) ? toAST(condition) : null;
		var iteratorAST:LinkedListTree = (init != null) ? toAST(iterate) : null;

		var forStmt:LinkedListTree = ASTStatementBuilder.newForAST(initAST, conditionAST, iteratorAST);
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForStatement(forStmt);
	}

	
	public function parseNewFor(init:String, condition:String,
			iterate:String):IASForStatement
	{
		var forStmt:LinkedListTree = ASTStatementBuilder.parseNewForAST(init, condition, iterate);
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForStatement(forStmt);
	}

	
	public function parseNewForIn(declaration:String, expression:String):IASForInStatement
	{
		var forStmt:LinkedListTree = ASTStatementBuilder.parseNewForInAST(declaration, expression);
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForInStatement(forStmt);
	}

	
	public function newForIn(declaration:IScriptElement,
			expression:IASExpression):IASForInStatement
	{
		var forStmt:LinkedListTree = ASTStatementBuilder.newForInAST(toAST(declaration), toAST(expression));
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForInStatement(forStmt);
	}

	
	public function newForEachIn(declaration:IScriptElement,
			expression:IASExpression):IASForEachInStatement
	{
		var forStmt:LinkedListTree = ASTStatementBuilder.newForEachInAST(toAST(declaration), toAST(expression));
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForEachInStatement(forStmt);
	}

	
	public function parseNewForEachIn(declaration:String,
			expression:String):IASForEachInStatement
	{
		var forStmt:LinkedListTree = ASTStatementBuilder.parseNewForEachInAST(declaration, expression);
		appendBlock(forStmt);
		addChildStatement(forStmt);
		return new ASTASForEachInStatement(forStmt);
	}

	
	public function newWhile(condition:IASExpression):IASWhileStatement
	{
		var whileStmt:LinkedListTree = ASTStatementBuilder.newWhileAST(ASTUtils.ast(condition));
		appendBlock(whileStmt);
		addChildStatement(whileStmt);
		return new ASTASWhileStatement(whileStmt);
	}

	
	public function parseNewWhile(condition:String):IASWhileStatement
	{
		var whileStmt:LinkedListTree = ASTStatementBuilder.parseNewWhileAST(condition);
		appendBlock(whileStmt);
		addChildStatement(whileStmt);
		return new ASTASWhileStatement(whileStmt);
	}

	
	public function newDoWhile(condition:IASExpression):IASDoWhileStatement
	{
		var doWhileStmt:LinkedListTree = ASTStatementBuilder.newDoWhileAST(toAST(condition));
		addChildStatement(doWhileStmt);
		return new ASTASDoWhileStatement(doWhileStmt);
	}

	
	public function parseNewDoWhile(condition:String):IASDoWhileStatement
	{
		var doWhileStmt:LinkedListTree = ASTStatementBuilder.parseNewDoWhileAST(condition);
		addChildStatement(doWhileStmt);
		return new ASTASDoWhileStatement(doWhileStmt);
	}

	
	public function newSwitch(condition:IASExpression):IASSwitchStatement
	{
		var switchStmt:LinkedListTree = ASTStatementBuilder.newSwitchAST(toAST(condition));
		addChildStatement(switchStmt);
		return new ASTASSwitchStatement(switchStmt);
	}

	
	public function parseNewSwitch(condition:String):IASSwitchStatement
	{
		var switchStmt:LinkedListTree = ASTStatementBuilder.parseNewSwitchAST(condition);
		addChildStatement(switchStmt);
		return new ASTASSwitchStatement(switchStmt);
	}

	
	public function newWith(scope:IASExpression):IASWithStatement
	{
		var withStmt:LinkedListTree = ASTStatementBuilder.newWith(toAST(scope));
		appendBlock(withStmt);
		addChildStatement(withStmt);
		return new ASTASWithStatement(withStmt);
	}

	
	public function parseNewWith(scope:String):IASWithStatement
	{
		var withStmt:LinkedListTree = ASTStatementBuilder.parseNewWith(scope);
		appendBlock(withStmt);
		addChildStatement(withStmt);
		return new ASTASWithStatement(withStmt);
	}

	
	public function newDeclaration(declaration:IScriptElement):IASDeclarationStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newDeclarationAST(toAST(declaration));
		addChildStatement(ast);
		return new ASTASDeclarationStatement(ast);
	}

	
	public function parseNewDeclaration(declaration:String):IASDeclarationStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.parseNewDeclarationAST(declaration);
		addChildStatement(ast);
		return new ASTASDeclarationStatement(ast);
	}

	
	public function newReturn(expression:IASExpression = null):IASReturnStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newReturnAST(toAST(expression));
		addChildStatement(ast);
		return new ASTASReturnStatement(ast);
	}

	
//	public function newReturn():IASReturnStatement
//	{
//		LinkedListTree ast = ASTStatementBuilder.newReturnAST((String) null);
//		addChildStatement(ast);
//		return new ASTASReturnStatement(ast);
//	}

	
	public function parseNewReturn(expression:String):IASReturnStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.parseNewReturnAST(expression);
		addChildStatement(ast);
		return new ASTASReturnStatement(ast);
	}

	//	
	//	public IASSuperStatement newSuper(List<IASExpression> arguments)
	//	{
	//		LinkedListTree ast = ASTStatementBuilder.newSuperStatementAST(arguments);
	//		addChildStatement(ast);
	//		return new ASTASSuperStatement(ast);
	//	}

	//	
	//	public IASSuperStatement newSuper()
	//	{
	//		return newSuper(new ArrayList<IASExpression>());
	//	}

	
	public function newBreak(label:String = null):IASBreakStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newBreakStatementAST(label);
		addChildStatement(ast);
		return new ASTASBreakStatement(ast);
	}

	
//	public IASBreakStatement newBreak()
//	{
//		LinkedListTree ast = ASTStatementBuilder.newBreakStatementAST();
//		addChildStatement(ast);
//		return new ASTASBreakStatement(ast);
//	}

	
	public function newTryCatch(name:IASExpression, type:IASExpression):IASTryStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newTryStatementAST();
		ast.appendToken(TokenBuilder.newSpace());
		var nameAST:LinkedListTree = ASTUtils.ast(name);
		var typeAST:LinkedListTree = ASTUtils.ast(type);
		ast.addChildWithTokens(ASTStatementBuilder.newCatchClauseAST(nameAST, typeAST));
		addChildStatement(ast);
		return new ASTASTryStatement(ast);
	}
	
	
	public function parseNewTryCatch(name:String, type:String):IASTryStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newTryStatementAST();
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(ASTStatementBuilder.parseNewCatchClauseAST(name, type));
		addChildStatement(ast);
		return new ASTASTryStatement(ast);
	}

	
	public function newTryFinally():IASTryStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newTryStatementAST();
		ast.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(ASTStatementBuilder.newFinallyClauseAST());
		addChildStatement(ast);
		return new ASTASTryStatement(ast);
	}

	
	public function newContinue(label:String = null):IASContinueStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newContinueStatementAST(label);
		addChildStatement(ast);
		return new ASTASContinueStatement(ast);
	}

	
//	public IASContinueStatement newContinue()
//	{
//		LinkedListTree ast = ASTStatementBuilder.newContinueStatementAST();
//		addChildStatement(ast);
//		return new ASTASContinueStatement(ast);
//	}

	
	public function newThrow(expression:IASExpression):IASThrowStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newThrowStatementAST(toAST(expression));
		addChildStatement(ast);
		return new ASTASThrowStatement(ast);
	}

	
	public function newDefaultXMLNamespace(namespace:String):IASDefaultXMLNamespaceStatement
	{
		var stringAST:LinkedListTree = ASTStatementBuilder.newStringAST(namespace);
		var ast:LinkedListTree = ASTStatementBuilder.newDefaultXMLNamespaceAST(stringAST);
		addChildStatement(ast);
		return new ASTASDefaultXMLNamespaceStatement(ast);
	}

	
	public function newLabel(name:IASExpression):IASLabelStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newLabelAST(name);
		addChildStatement(ast);
		return new ASTASLabelStatement(ast);
	}

	
	public function parseNewLabel(name:String):IASLabelStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.parseNewLabelAST(name);
		addChildStatement(ast);
		return new ASTASLabelStatement(ast);
	}

	
	public function newConfig(name:IASExpression):IASConfigStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.newConfigAST(name);
		addChildStatement(ast);
		return new ASTASConfigStatement(ast);
	}

	
	public function parseNewConfig(name:String):IASConfigStatement
	{
		var ast:LinkedListTree = ASTStatementBuilder.parseNewConfigAST(name);
		addChildStatement(ast);
		return new ASTASConfigStatement(ast);
	}

	
	public function newUse(name:IASExpression):IASUseStatement
	{
		var nameAST:LinkedListTree = ASTUtils.ast(name);
		var child:LinkedListTree = AS3FragmentParser.parseUseNamespace(ASTUtils.stringifyNode(nameAST));
		addChildStatement(child);
		return new ASTASUseStatement(child);
	}

	
	public function parseNewUse(name:String):IASUseStatement
	{
		var child:LinkedListTree = AS3FragmentParser.parseUseNamespace(name);
		addChildStatement(child);
		return new ASTASUseStatement(child);
	}

	private function addChildStatement(child:LinkedListTree):void
	{
		ASTUtils.addChildWithIndentation(ast, child);
	}

	override public function getAST():LinkedListTree
	{
		return ast;
	}

	private function containsChild(statement:IASStatement):Boolean
	{
		if (ast.childCount == 0)
			return false;
		var child:LinkedListTree = ASTUtils.ast(statement);
		return (ast.getIndexOfChild(child) != -1);
	}

	/**
	 * Appends a block node as a child of the given node (preceding it
	 * with a space token) and returns a reference to the new block.
	 * 
	 * NB doesn't do indentation properly, so add the block to the statement
	 * before the statement is added to its container.
	 */
	private static function appendBlock(ast:LinkedListTree):LinkedListTree
	{
		ast.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree= ASTBuilder.newBlock();
		ast.addChildWithTokens(block);
		return block;
	}

	/**
	 * Returns the first BLOCK child of the given node
	 */
	private static function findBlock(ast:LinkedListTree):LinkedListTree
	{
		return LinkedListTree(ast.getFirstChildWithType(AS3Parser.BLOCK));
	}

}
}