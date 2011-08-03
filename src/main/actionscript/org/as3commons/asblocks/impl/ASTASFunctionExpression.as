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
import org.as3commons.asblocks.dom.IASFunctionExpression;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASLabelStatement;
import org.as3commons.asblocks.dom.IASParameter;
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
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTASFunctionExpression extends ASTExpression 
	implements IASFunctionExpression
{
	private var functionCommon:ASTFunctionCommon;

	private var statementList:ASTStatementList;	
	
	public function ASTASFunctionExpression(ast:LinkedListTree)
	{
		super(ast);
		
		statementList = new ASTStatementList(ASTUtils.findChildByType(ast, AS3Parser.BLOCK));
		functionCommon = new ASTFunctionCommon(ast);
	}
	
	//--------------------------------------------------------------------------
	//
	//  IFunctionCommon implementation
	//
	//--------------------------------------------------------------------------

	public function getParameters():IList
	{
		return functionCommon.getParameters();
	}
	
	public function hasParameters():Boolean
	{
		return functionCommon.hasParameters();
	}
	
	public function getType():String
	{
		return functionCommon.getType();
	}
	
	public function setType(value:String):void
	{
		functionCommon.setType(value);
	}
	
	public function addParameter(name:String, type:String, defaultValue:String=null):IASParameter
	{
		return functionCommon.addParameter(name, type, defaultValue);
	}
	
	public function removeParameter(name:String):IASParameter
	{
		return functionCommon.removeParameter(name);
	}
	
	public function addRestParameter(name:String):IASParameter
	{
		return functionCommon.addRestParameter(name);
	}
	
	//--------------------------------------------------------------------------
	//
	//  IStatementContainer implementation
	//
	//--------------------------------------------------------------------------

	public function hasStatements():Boolean
	{
		return statementList.hasStatements();
	}
	
	public function getStatements():IList
	{
		return statementList.getStatements();
	}
	
	public function addComment(text:String):void
	{
		statementList.addComment(text);
	}
	
	public function addStatement(statement:IASStatement):IASStatement
	{
		return statementList.addStatement(statement);
	}
	
	public function parseStatement(statement:String):IASStatement
	{
		return statementList.parseStatement(statement);
	}
	
	public function removeStatement(statement:IASStatement):IASStatement
	{
		return statementList.removeStatement(statement);
	}
	
	public function newExpressionStatement(expression:IASExpression):IASExpressionStatement
	{
		return statementList.newExpressionStatement(expression);
	}
	
	public function parseNewExpressionStatement(statement:String):IASExpressionStatement
	{
		return statementList.parseNewExpressionStatement(statement);
	}
	
	public function newIf(condition:IASExpression):IASIfStatement
	{
		return statementList.newIf(condition);
	}
	
	public function parseNewIf(condition:String):IASIfStatement
	{
		return statementList.parseNewIf(condition);
	}
	
	public function newFor(initializer:IScriptElement, condition:IASExpression, iterater:IASExpression):IASForStatement
	{
		return statementList.newFor(initializer, condition, iterater);
	}
	
	public function parseNewFor(initializer:String, condition:String, iterater:String):IASForStatement
	{
		return statementList.parseNewFor(initializer, condition, iterater);
	}
	
	public function newForIn(declaration:IScriptElement, target:IASExpression):IASForInStatement
	{
		return statementList.newForIn(declaration, target);
	}
	
	public function parseNewForIn(declaration:String, target:String):IASForInStatement
	{
		return statementList.parseNewForIn(declaration, target);
	}
	
	public function newForEachIn(declaration:IScriptElement, target:IASExpression):IASForEachInStatement
	{
		return statementList.newForEachIn(declaration, target);
	}
	
	public function parseNewForEachIn(declaration:String, target:String):IASForEachInStatement
	{
		return statementList.parseNewForEachIn(declaration, target);
	}
	
	public function newWhile(condition:IASExpression):IASWhileStatement
	{
		return statementList.newWhile(condition);
	}
	
	public function parseNewWhile(condition:String):IASWhileStatement
	{
		return statementList.parseNewWhile(condition);
	}
	
	public function newDoWhile(condition:IASExpression):IASDoWhileStatement
	{
		return statementList.newDoWhile(condition);
	}
	
	public function parseNewDoWhile(condition:String):IASDoWhileStatement
	{
		return statementList.parseNewDoWhile(condition);
	}
	
	public function newSwitch(condition:IASExpression):IASSwitchStatement
	{
		return statementList.newSwitch(condition);
	}
	
	public function parseNewSwitch(condition:String):IASSwitchStatement
	{
		return statementList.parseNewSwitch(condition);
	}
	
	public function newWith(scope:IASExpression):IASWithStatement
	{
		return statementList.newWith(scope);
	}
	
	public function parseNewWith(scope:String):IASWithStatement
	{
		return statementList.parseNewWith(scope);
	}
	
	public function newDeclaration(declaration:IScriptElement):IASDeclarationStatement
	{
		return statementList.newDeclaration(declaration);
	}
	
	public function parseNewDeclaration(declaration:String):IASDeclarationStatement
	{
		return statementList.parseNewDeclaration(declaration);
	}
	
	public function newReturn(expression:IASExpression=null):IASReturnStatement
	{
		return statementList.newReturn(expression);
	}
	
	public function parseNewReturn(expression:String):IASReturnStatement
	{
		return statementList.parseNewReturn(expression);
	}
	
	public function newBreak(label:String=null):IASBreakStatement
	{
		return statementList.newBreak(label);
	}
	
	public function newTryCatch(name:IASExpression, type:IASExpression):IASTryStatement
	{
		return statementList.newTryCatch(name, type);
	}
	
	public function parseNewTryCatch(name:String, type:String):IASTryStatement
	{
		return statementList.parseNewTryCatch(name, type);
	}
	
	public function newTryFinally():IASTryStatement
	{
		return statementList.newTryFinally();
	}
	
	public function newContinue(label:String=null):IASContinueStatement
	{
		return statementList.newContinue(label);
	}
	
	public function newThrow(expression:IASExpression):IASThrowStatement
	{
		return statementList.newThrow(expression);
	}
	
	public function newDefaultXMLNamespace(namespace:String):IASDefaultXMLNamespaceStatement
	{
		return statementList.newDefaultXMLNamespace(namespace);
	}
	
	public function newLabel(name:IASExpression):IASLabelStatement
	{
		return statementList.newLabel(name);
	}
	
	public function parseNewLabel(name:String):IASLabelStatement
	{
		return statementList.parseNewLabel(name);
	}
	
	public function newConfig(name:IASExpression):IASConfigStatement
	{
		return statementList.newConfig(name);
	}
	
	public function parseNewConfig(name:String):IASConfigStatement
	{
		return statementList.parseNewConfig(name);
	}
		
	public function newUse(name:IASExpression):IASUseStatement
	{
		return statementList.newUse(name);
	}
	
	public function parseNewUse(name:String):IASUseStatement
	{
		return statementList.parseNewUse(name);
	}
}
}