package org.as3commons.asblocks.impl
{
import flash.errors.IllegalOperationError;

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
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.collections.framework.IList;

public class ContainerDelegate extends ASTScriptElement implements IStatementContainer
{
	protected function getStatementContainer():IStatementContainer
	{
		throw new IllegalOperationError("Must implement ContainerDelegate.statementContainer");
		return null
	}
	
	public function ContainerDelegate(ast:LinkedListTree)
	{
		super(ast);
	}
	
	
	public function hasStatements():Boolean
	{
		return getStatementContainer().hasStatements();
	}
	
	
	public function getStatements():IList
	{
		return getStatementContainer().getStatements();
	}
	
	
	public function addComment(text:String):void
	{
		getStatementContainer().addComment(text);
	}
	
	
	public function addStatement(statement:IASStatement):IASStatement
	{
		return getStatementContainer().addStatement(statement);
	}
	
	
	public function parseStatement(statement:String):IASStatement
	{
		return getStatementContainer().parseStatement(statement);
	}
	
	
	public function removeStatement(statement:IASStatement):IASStatement
	{
		return getStatementContainer().removeStatement(statement);
	}
	
	
	public function newExpressionStatement(expression:IASExpression):IASExpressionStatement
	{
		return getStatementContainer().newExpressionStatement(expression);
	}
	
	
	public function parseNewExpressionStatement(statement:String):IASExpressionStatement
	{
		return getStatementContainer().parseNewExpressionStatement(statement);
	}
	
	
	public function newIf(condition:IASExpression):IASIfStatement
	{
		return getStatementContainer().newIf(condition);
	}
	
	
	public function parseNewIf(condition:String):IASIfStatement
	{
		return getStatementContainer().parseNewIf(condition);
	}
	
	
	public function newFor(initializer:IScriptElement,
						   condition:IASExpression, iterater:IASExpression):IASForStatement
	{
		return getStatementContainer().newFor(initializer, condition, iterater);
	}
	
	
	public function parseNewFor(initializer:String, condition:String,
								iterater:String):IASForStatement
	{
		return getStatementContainer().parseNewFor(initializer, condition, iterater);
	}
	
	
	public function newForIn(declaration:IScriptElement,
							 target:IASExpression):IASForInStatement
	{
		return getStatementContainer().newForIn(declaration, target);
	}
	
	
	public function parseNewForIn(declaration:String, target:String):IASForInStatement
	{
		return getStatementContainer().parseNewForIn(declaration, target);
	}
	
	
	public function newForEachIn(declaration:IScriptElement,
								 target:IASExpression):IASForEachInStatement
	{
		return getStatementContainer().newForEachIn(declaration, target);
	}
	
	
	public function parseNewForEachIn(declaration:String,
									  target:String):IASForEachInStatement
	{
		return getStatementContainer().parseNewForEachIn(declaration, target);
	}
	
	
	public function newWhile(condition:IASExpression):IASWhileStatement
	{
		return getStatementContainer().newWhile(condition);
	}
	
	
	public function parseNewWhile(condition:String):IASWhileStatement
	{
		return getStatementContainer().parseNewWhile(condition);
	}
	
	
	public function newDoWhile(condition:IASExpression):IASDoWhileStatement
	{
		return getStatementContainer().newDoWhile(condition);
	}
	
	
	public function parseNewDoWhile(condition:String):IASDoWhileStatement
	{
		return getStatementContainer().parseNewDoWhile(condition);
	}
	
	
	public function newSwitch(condition:IASExpression):IASSwitchStatement
	{
		return getStatementContainer().newSwitch(condition);
	}
	
	
	public function parseNewSwitch(condition:String):IASSwitchStatement
	{
		return getStatementContainer().parseNewSwitch(condition);
	}
	
	
	public function newWith(scope:IASExpression):IASWithStatement
	{
		return getStatementContainer().newWith(scope);
	}
	
	
	public function parseNewWith(scope:String):IASWithStatement
	{
		return getStatementContainer().parseNewWith(scope);
	}
	
	
	public function newDeclaration(declaration:IScriptElement):IASDeclarationStatement
	{
		return getStatementContainer().newDeclaration(declaration);
	}
	
	
	public function parseNewDeclaration(declaration:String):IASDeclarationStatement
	{
		return getStatementContainer().parseNewDeclaration(declaration);
	}
	
	
	public function newReturn(expression:IASExpression = null):IASReturnStatement
	{
		return getStatementContainer().newReturn(expression);
	}
	
	
//	public function newReturn():IASReturnStatement
//	{
//		return getStatementContainer().newReturn();
//	}
	
	
	public function parseNewReturn(expression:String):IASReturnStatement
	{
		return getStatementContainer().parseNewReturn(expression);
	}
	
	
	public function newBreak(label:String = null):IASBreakStatement
	{
		return getStatementContainer().newBreak(label);
	}
	
	
//	public function newBreak():IASBreakStatement
//	{
//		return getStatementContainer().newBreak();
//	}
	
	
	public function newTryCatch(name:IASExpression, type:IASExpression):IASTryStatement
	{
		return getStatementContainer().newTryCatch(name, type);
	}
	
	
	public function parseNewTryCatch(name:String, type:String):IASTryStatement
	{
		return getStatementContainer().parseNewTryCatch(name, type);
	}
	
	
	public function newTryFinally():IASTryStatement
	{
		return getStatementContainer().newTryFinally();
	}
	
	
	public function newContinue(label:String = null):IASContinueStatement
	{
		return getStatementContainer().newContinue(label);
	}
	
	
//	public function newContinue():IASContinueStatement
//	{
//		return getStatementContainer().newContinue();
//	}
	
	
	public function newThrow(expression:IASExpression):IASThrowStatement
	{
		return getStatementContainer().newThrow(expression);
	}
	
	
	public function newDefaultXMLNamespace(namespace:String):IASDefaultXMLNamespaceStatement
	{
		return getStatementContainer().newDefaultXMLNamespace(namespace);
	}
	
	
	public function newLabel(name:IASExpression):IASLabelStatement
	{
		return getStatementContainer().newLabel(name);
	}
	
	
	public function parseNewLabel(name:String):IASLabelStatement
	{
		return getStatementContainer().parseNewLabel(name);
	}
	
	
	public function newConfig(name:IASExpression):IASConfigStatement
	{
		return getStatementContainer().newConfig(name);
	}
	
	
	public function parseNewConfig(name:String):IASConfigStatement
	{
		return getStatementContainer().parseNewConfig(name);
	}
	
	
	public function newUse(name:IASExpression):IASUseStatement
	{
		return getStatementContainer().newUse(name);
	}
	
	
	public function parseNewUse(name:String):IASUseStatement
	{
		return getStatementContainer().parseNewUse(name);
	}
}
}