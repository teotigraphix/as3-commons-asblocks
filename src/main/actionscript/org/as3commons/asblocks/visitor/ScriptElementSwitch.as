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

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class ScriptElementSwitch implements IScriptElementStrategy
{
	private var visitor:IASBlockVisitor;
	
	public function ScriptElementSwitch(visitor:IASBlockVisitor)
	{
		// default is ASBlockWalker for recursive functionality
		this.visitor = visitor;
	}
	
	public function handle(element:IScriptElement):void
	{
		//trace(element.toString());
		
		if (element is IASArrayAccessExpression)
		{
			visitor.visitArrayAccessExpression(element as IASArrayAccessExpression);
		}
		else if (element is IASArrayLiteral)
		{
			visitor.visitArrayLiteral(element as IASArrayLiteral);
		}
		else if (element is IASParameter)
		{
			visitor.visitParameter(element as IASParameter);
		}
		else if (element is IASAssignmentExpression)
		{
			visitor.visitAssignmentExpression(element as IASAssignmentExpression);
		}
		else if (element is IASBinaryExpression)
		{
			visitor.visitBinaryExpression(element as IASBinaryExpression);
		}
		else if (element is IASBooleanLiteral)
		{
			visitor.visitBooleanLiteral(element as IASBooleanLiteral);
		}
		else if (element is IASBlock)
		{
			visitor.visitBlockStatement(element as IASBlock);
		}
		else if (element is IASBreakStatement)
		{
			visitor.visitBreakStatement(element as IASBreakStatement);
		}
		else if (element is IASCatchClause)
		{
			visitor.visitCatchClause(element as IASCatchClause);
		}
		else if (element is IASConditionalExpression)
		{
			visitor.visitConditionalExpression(element as IASConditionalExpression);
		}
		else if (element is IASContinueStatement)
		{
			visitor.visitContinueStatement(element as IASContinueStatement);
		}
		else if (element is IASCompilationUnit)
		{
			visitor.visitCompilationUnit(element as IASCompilationUnit);
		}
		else if (element is IASClassType)
		{
			visitor.visitClassType(element as IASClassType);
		}
		else if (element is IASDeclarationStatement)
		{
			visitor.visitDeclarationStatement(element as IASDeclarationStatement);
		}
		else if (element is IASDefaultXMLNamespaceStatement)
		{
			visitor.visitDefaultXMLNamespaceStatement(element as IASDefaultXMLNamespaceStatement);
		}
		else if (element is IASDoWhileStatement)
		{
			visitor.visitDoWhileStatement(element as IASDoWhileStatement);
		}
		else if (element is IASDescendantExpression)
		{
			visitor.visitDescendantExpression(element as IASDescendantExpression);
		}
		else if (element is IASExpressionAttribute)
		{
			visitor.visitExpressionAttribute(element as IASExpressionAttribute);
		}
		else if (element is IASExpressionStatement)
		{
			visitor.visitExpressionStatement(element as IASExpressionStatement);
		}
		else if (element is IASFieldAccessExpression)
		{
			visitor.visitFieldAccessExpression(element as IASFieldAccessExpression);
		}
		else if (element is IASFilterExpression)
		{
			visitor.visitFilterExpression(element as IASFilterExpression);
		}
		else if (element is IASFinallyClause)
		{
			visitor.visitFinallyClause(element as IASFinallyClause);
		}
		else if (element is IASForEachInStatement)
		{
			visitor.visitForEachInStatement(element as IASForEachInStatement);
		}
		else if (element is IASForInStatement)
		{
			visitor.visitForInStatement(element as IASForInStatement);
		}
		else if (element is IASForStatement)
		{
			visitor.visitForStatement(element as IASForStatement);
		}
		else if (element is IASField)
		{
			visitor.visitField(element as IASField);
		}
		else if (element is IASFunctionExpression)
		{
			visitor.visitFunctionExpression(element as IASFunctionExpression);
		}
		else if (element is IASInvocationExpression)
		{
			visitor.visitInvocationExpression(element as IASInvocationExpression);
		}
		else if (element is IASIfStatement)
		{
			visitor.visitIfStatement(element as IASIfStatement);
		}
		else if (element is IASIntegerLiteral)
		{
			visitor.visitIntegerLiteral(element as IASIntegerLiteral);
		}
		else if (element is IASInterfaceType)
		{
			visitor.visitInterfaceType(element as IASInterfaceType);
		}
		else if (element is IASMetaTag)
		{
			visitor.visitMetaTag(element as IASMetaTag);
		}
		else if (element is IASMethod)
		{
			visitor.visitMethod(element as IASMethod);
		}
		else if (element is IASNewExpression)
		{
			visitor.visitNewExpression(element as IASNewExpression);
		}
		else if (element is IASNullLiteral)
		{
			visitor.visitNullLiteral(element as IASNullLiteral);
		}
		else if (element is IASObjectLiteral)
		{
			visitor.visitObjectLiteral(element as IASObjectLiteral);
		}
		else if (element is IASPropertyField)
		{
			visitor.visitObjectPropertyField(element as IASPropertyField);
		}
		else if (element is IASPackage)
		{
			visitor.visitPackage(element as IASPackage);
		}
		else if (element is IASPostfixExpression)
		{
			visitor.visitPostfixExpression(element as IASPostfixExpression);
		}
		else if (element is IASPrefixExpression)
		{
			visitor.visitPrefixExpression(element as IASPrefixExpression);
		}
		else if (element is IASPropertyAttribute)
		{
			visitor.visitPropertyAttribute(element as IASPropertyAttribute);
		}
		else if (element is IASRegexpLiteral)
		{
			visitor.visitRegexpLiteral(element as IASRegexpLiteral);
		}
		else if (element is IASReturnStatement)
		{
			visitor.visitReturnStatement(element as IASReturnStatement);
		}
		else if (element is IASSimpleNameExpression)
		{
			visitor.visitSimpleNameExpression(element as IASSimpleNameExpression);
		}
		else if (element is IASStarAttribute)
		{
			visitor.visitStarAttribute(element as IASStarAttribute);
		}
		else if (element is IASStringLiteral)
		{
			visitor.visitStringLiteral(element as IASStringLiteral);
		}
		else if (element is IASSwitchCase)
		{
			visitor.visitSwitchCase(element as IASSwitchCase);
		}
		else if (element is IASSwitchDefault)
		{
			visitor.visitSwitchDefault(element as IASSwitchDefault);
		}
		else if (element is IASSwitchStatement)
		{
			visitor.visitSwitchStatement(element as IASSwitchStatement);
		}
		else if (element is IASSuperStatement)
		{
			visitor.visitSuperStatement(element as IASSuperStatement);
		}
		else if (element is IASThrowStatement)
		{
			visitor.visitThrowStatement(element as IASThrowStatement);
		}
		else if (element is IASTryStatement)
		{
			visitor.visitTryStatement(element as IASTryStatement);
		}
		else if (element is IASUndefinedLiteral)
		{
			visitor.visitUndefinedLiteral(element as IASUndefinedLiteral);
		}
		else if (element is IASDeclaration)
		{
			visitor.visitDeclaration(element as IASDeclaration);
		}
		else if (element is IASWhileStatement)
		{
			visitor.visitWhileStatement(element as IASWhileStatement);
		}
		else if (element is IASWithStatement)
		{
			visitor.visitWithStatement(element as IASWithStatement);
		}
		else if (element is IASXMLLiteral)
		{
			visitor.visitXMLLiteral(element as IASXMLLiteral);
		}
		else
		{
			throw new Error("unhandled IScriptElement " + element.toString());
		}
	}
}
}