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

package org.as3commons.asblocks.visitor
{

import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASBreakStatement;
import org.as3commons.asblocks.dom.IASCatchClause;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASConditionalExpression;
import org.as3commons.asblocks.dom.IASContinueStatement;
import org.as3commons.asblocks.dom.IASDeclaration;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASDefaultXMLNamespaceStatement;
import org.as3commons.asblocks.dom.IASDescendantExpression;
import org.as3commons.asblocks.dom.IASDoWhileStatement;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASExpressionAttribute;
import org.as3commons.asblocks.dom.IASExpressionStatement;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASFilterExpression;
import org.as3commons.asblocks.dom.IASFinallyClause;
import org.as3commons.asblocks.dom.IASForEachInStatement;
import org.as3commons.asblocks.dom.IASForInStatement;
import org.as3commons.asblocks.dom.IASForStatement;
import org.as3commons.asblocks.dom.IASFunctionExpression;
import org.as3commons.asblocks.dom.IASIfStatement;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASInterfaceType;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASNewExpression;
import org.as3commons.asblocks.dom.IASNullLiteral;
import org.as3commons.asblocks.dom.IASObjectLiteral;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.IASPropertyAttribute;
import org.as3commons.asblocks.dom.IASPropertyField;
import org.as3commons.asblocks.dom.IASRegexpLiteral;
import org.as3commons.asblocks.dom.IASReturnStatement;
import org.as3commons.asblocks.dom.IASSimpleNameExpression;
import org.as3commons.asblocks.dom.IASStarAttribute;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.dom.IASSuperStatement;
import org.as3commons.asblocks.dom.IASSwitchCase;
import org.as3commons.asblocks.dom.IASSwitchDefault;
import org.as3commons.asblocks.dom.IASSwitchStatement;
import org.as3commons.asblocks.dom.IASThrowStatement;
import org.as3commons.asblocks.dom.IASTryStatement;
import org.as3commons.asblocks.dom.IASUndefinedLiteral;
import org.as3commons.asblocks.dom.IASWhileStatement;
import org.as3commons.asblocks.dom.IASWithStatement;
import org.as3commons.asblocks.dom.IASXMLLiteral;
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.dom.IStatementContainer;
import org.as3commons.collections.framework.IList;

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class ASBlockWalker implements IASBlockVisitor
{
	private var strategy:IScriptElementStrategy;
	
	public function ASBlockWalker(strategy:FilterStrategy)
	{
		this.strategy = strategy;
		strategy.setFiltered(new ScriptElementSwitch(this));
	}
	
	public  function walkList(list:IList):void
	{
		for each (var element:IScriptElement in list.toArray())
		{
			walkElement(element);
		}
	}
	
	public function walkElement(e:IScriptElement):void
	{
		strategy.handle(e);
	}
	
	public function walk(e:Object):void
	{
		if (e is IScriptElement)
			walkElement(e as IScriptElement);
		else if (e is IList)
			walkList(e as IList);
		else
			throw new Error("walk expects with IScriptElement or IList as an argument");
	}
	
	public function walkStatementContainer(container:IStatementContainer):void
	{
		walk(container.getStatements());
	}
	
	public function visitParameter(param:IASParameter):void
	{
	}
	
	public function visitArrayAccessExpression(expression:IASArrayAccessExpression):void
	{
		walk(expression.getTarget());
		walk(expression.getSubscript());
	}
	
	public function visitArrayLiteral(literal:IASArrayLiteral):void
	{
		walk(literal.getEntries());
	}
	
	public function visitAssignmentExpression(expression:IASAssignmentExpression):void
	{		
		walk(expression.getLeftExpression());
		walk(expression.getRightExpression());
	}
	
	public function visitBinaryExpression(expression:IASBinaryExpression):void
	{
		walk(expression.getLeftExpression());
		walk(expression.getRightExpression());
	}
	
	public function visitBlockStatement(statement:IASBlock):void
	{
		walkStatementContainer(statement);
	}
	
	public function visitBooleanLiteral(literal:IASBooleanLiteral):void
	{
	}
	
	public function visitBreakStatement(statement:IASBreakStatement):void
	{
	}
	
	public function visitCatchClause(catchClause:IASCatchClause):void
	{
		walkStatementContainer(catchClause);
	}
	
	public function visitClassType(type:IASClassType):void
	{
		walk(type.getFields());
		walk(type.getMethods());
	}
	
	public function visitCompilationUnit(unit:IASCompilationUnit):void
	{
		walk(unit.getPackage());
	}
	
	public function visitConditionalExpression(expression:IASConditionalExpression):void
	{
		walk(expression.getCondition());
		walk(expression.getThenExpression());
		walk(expression.getElseExpression());
	}
	
	public function visitContinueStatement(statement:IASContinueStatement):void
	{
	}
	
	public function visitDeclarationStatement(statement:IASDeclarationStatement):void
	{
		walk(statement.getDeclarations());
	}
	
	public function visitDefaultXMLNamespaceStatement(statement:IASDefaultXMLNamespaceStatement):void
	{
	}
	
	public function visitDoWhileStatement(statement:IASDoWhileStatement):void
	{
		walk(statement.getCondition());
		walkStatementContainer(statement);
	}
	
	public function visitDescendantExpression(expression:IASDescendantExpression):void
	{
		walk(expression.getTarget());
		walk(expression.getQuery());
	}
	
	public function visitExpressionAttribute(expression:IASExpressionAttribute):void
	{
		walk(expression.getExpression());
	}
	
	public function visitExpressionStatement(statement:IASExpressionStatement):void
	{
		walk(statement.getExpression());
	}
	
	public function visitField(field:IASField):void
	{
		walk(field.getMetaTags());
	}
	
	public function visitFieldAccessExpression(expression:IASFieldAccessExpression):void
	{
		walk(expression.getTarget());
	}
	
	public function visitFilterExpression(expression:IASFilterExpression):void
	{
		walk(expression.getTarget());
		walk(expression.getQuery());
	}
	
	public function visitFinallyClause(fin:IASFinallyClause):void
	{
		walkStatementContainer(fin);
	}
	
	public function visitForEachInStatement(statement:IASForEachInStatement):void
	{
		walk(statement.getInitializer());
		walk(statement.getIterator());
		walkStatementContainer(statement);
	}
	
	public function visitForInStatement(statement:IASForInStatement):void
	{
		walk(statement.getInitializer());
		walk(statement.getIterator());
		walkStatementContainer(statement);
	}
	
	public function visitForStatement(statement:IASForStatement):void
	{
		var initializer:IScriptElement = statement.getInitializer();
		if (initializer != null)
		{
			walk(initializer);
		}
		var condition:IASExpression = statement.getCondition();
		if (condition != null)
		{
			walk(condition);
		}
		var update:IASExpression = statement.getIterator();
		if (update != null)
		{
			walk(update);
		}
		walkStatementContainer(statement);
	}
	
	public function visitFunctionExpression(e:IASFunctionExpression):void
	{
		walk(e.getParameters());
		walkStatementContainer((e));
	}
	
	public function visitIfStatement(statement:IASIfStatement):void
	{
		walk(statement.getCondition());
		walk(statement.getThenStatement());
		var elseStmt:IASStatement = statement.getElseStatement();
		if (elseStmt != null)
		{
			walk(elseStmt);
		}
	}
	
	public function visitIntegerLiteral(literal:IASIntegerLiteral):void
	{
	}
	
	public function visitInterfaceType(type:IASInterfaceType):void
	{
		walk(type.getMethods());
	}
	
	public function visitInvocationExpression(expression:IASInvocationExpression):void
	{
		walk(expression.getTarget());
		walk(expression.getArguments());
	}
	
	public function visitMetaTag(tag:IASMetaTag):void
	{
	}
	
	public function visitMethod(method:IASMethod):void
	{
		walk(method.getMetaTags());
		walk(method.getParameters());
		walkStatementContainer(method);
	}
	
	public function visitNewExpression(expression:IASNewExpression):void
	{
		//		walk(expression.getTarget());
		//		walk(expression.getArguments());
	}
	
	public function visitNullLiteral(literal:IASNullLiteral):void
	{
	}
	
	public function visitObjectPropertyField(field:IASPropertyField):void
	{
		walk(field.getValue());
	}
	
	public function visitObjectLiteral(literal:IASObjectLiteral):void
	{
		walk(literal.getFields());
	}
	
	public function visitPackage(pkg:IASPackage):void
	{
		walk(pkg.getMetaTags());
		walk(pkg.getType());
	}
	
	public function visitPostfixExpression(expression:IASPostfixExpression):void
	{
		walk(expression.getExpression());
	}
	
	public function visitPrefixExpression(expression:IASPrefixExpression):void
	{
		walk(expression.getExpression());
	}
	
	public function visitPropertyAttribute(expression:IASPropertyAttribute):void
	{
	}
	
	public function visitRegexpLiteral(expression:IASRegexpLiteral):void
	{
	}
	
	public function visitReturnStatement(statement:IASReturnStatement):void
	{
		var expression:IASExpression = statement.getExpression();
		if (expression != null)
		{
			walk(expression);
		}
	}
	
	public function visitSimpleNameExpression(expression:IASSimpleNameExpression):void
	{
	}
	
	public function visitStringLiteral(literal:IASStringLiteral):void
	{
	}
	
	public function visitStarAttribute(expression:IASStarAttribute):void
	{
	}
	
	public function visitSuperStatement(statement:IASSuperStatement):void
	{
	}
	
	public function visitSwitchCase(statement:IASSwitchCase):void
	{
		walk(statement.getLabel());
		walkStatementContainer(statement);
	}
	
	public function visitSwitchDefault(statement:IASSwitchDefault):void
	{
		walkStatementContainer(statement);
	}
	
	public function visitSwitchStatement(statement:IASSwitchStatement):void
	{
		walk(statement.getCondition());
		walk(statement.getLabels());
	}
	
	public function visitThrowStatement(statement:IASThrowStatement):void
	{
		walk(statement.getExpression());
	}
	
	public function visitTryStatement(statement:IASTryStatement):void
	{
		walkStatementContainer(statement);
		var catchClauses:IList = statement.getCatchClauses();
		if (catchClauses.size > 0)
		{
			walk(catchClauses);
		}
		var fin:IASFinallyClause = statement.getFinallyClause();
		if (fin != null)
		{
			walk(fin);
		}
	}
	
	public function visitUndefinedLiteral(literal:IASUndefinedLiteral):void
	{
	}
	
	public function visitDeclaration(variable:IASDeclaration):void
	{
		var initializer:IASExpression = variable.getInitializer();
		if (initializer != null)
		{
			walk(initializer);
		}
	}
	
	public function visitWhileStatement(statement:IASWhileStatement):void
	{
		walk(statement.getCondition());
		walk(statement.getBody());
	}
	
	public function visitWithStatement(statement:IASWithStatement):void
	{
		walk(statement.getScope());
		walk(statement.getBody());
	}
	
	public function visitXMLLiteral(literal:IASXMLLiteral):void
	{
	}
}
}