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
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
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

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASBlockVisitor
{
	function visitParameter(param:IASParameter):void
	
	function visitArrayAccessExpression(expression:IASArrayAccessExpression):void;
	
	function visitArrayLiteral(literal:IASArrayLiteral):void;
	
	function visitAssignmentExpression(expression:IASAssignmentExpression):void;
	
	function visitBinaryExpression(expression:IASBinaryExpression):void;
	
	function visitBlockStatement(statement:IASBlock):void;
	
	function visitBooleanLiteral(literal:IASBooleanLiteral):void;
	
	function visitBreakStatement(statement:IASBreakStatement):void;
	
	function visitCatchClause(catchClause:IASCatchClause):void;
	
	function visitClassType(type:IASClassType):void;
	
	function visitCompilationUnit(unit:IASCompilationUnit):void;
	
	function visitConditionalExpression(expression:IASConditionalExpression):void;
	
	function visitContinueStatement(statement:IASContinueStatement):void;
	
	function visitDeclarationStatement(statement:IASDeclarationStatement):void;
	
	function visitDefaultXMLNamespaceStatement(statement:IASDefaultXMLNamespaceStatement):void;
	
	function visitDoWhileStatement(statement:IASDoWhileStatement):void;
	
	function visitDescendantExpression(expression:IASDescendantExpression):void;
	
	function visitExpressionAttribute(expression:IASExpressionAttribute):void;
	
	function visitExpressionStatement(statement:IASExpressionStatement):void;
	
	function visitField(field:IASField):void;
	
	function visitFieldAccessExpression(expression:IASFieldAccessExpression):void;
	
	function visitFilterExpression(expression:IASFilterExpression):void;
	
	function visitFinallyClause(fin:IASFinallyClause):void;
	
	function visitForEachInStatement(statement:IASForEachInStatement):void;
	
	function visitForInStatement(statement:IASForInStatement):void;
	
	function visitForStatement(statment:IASForStatement):void;
	
	function visitFunctionExpression(e:IASFunctionExpression):void;
	
	function visitIfStatement(statement:IASIfStatement):void;
	
	function visitIntegerLiteral(literal:IASIntegerLiteral):void;
	
	function visitInterfaceType(type:IASInterfaceType):void;
	
	function visitInvocationExpression(expression:IASInvocationExpression):void;
	
	function visitMetaTag(tag:IASMetaTag):void;
	
	function visitMethod(method:IASMethod):void;
	
	function visitNewExpression(expression:IASNewExpression):void;
	
	function visitNullLiteral(literal:IASNullLiteral):void;
	
	function visitObjectPropertyField(field:IASPropertyField):void;
	
	function visitObjectLiteral(literal:IASObjectLiteral):void;
	
	function visitPackage(pkg:IASPackage):void;
	
	function visitPostfixExpression(expression:IASPostfixExpression):void;
	
	function visitPrefixExpression(expression:IASPrefixExpression):void;
	
	function visitPropertyAttribute(expression:IASPropertyAttribute):void;
	
	function visitRegexpLiteral(expression:IASRegexpLiteral):void;
	
	function visitReturnStatement(statement:IASReturnStatement):void;
	
	function visitSimpleNameExpression(expression:IASSimpleNameExpression):void;
	
	function visitStringLiteral(literal:IASStringLiteral):void;
	
	function visitStarAttribute(expression:IASStarAttribute):void;
	
	function visitSuperStatement(statement:IASSuperStatement):void;
	
	function visitSwitchCase(label:IASSwitchCase):void;
	
	function visitSwitchDefault(label:IASSwitchDefault):void;
	
	function visitSwitchStatement(statement:IASSwitchStatement):void;
	
	function visitThrowStatement(statement:IASThrowStatement):void;
	
	function visitTryStatement(statement:IASTryStatement):void;
	
	function visitUndefinedLiteral(literal:IASUndefinedLiteral):void;
	
	function visitDeclaration(variable:IASDeclaration):void;
	
	function visitWhileStatement(statement:IASWhileStatement):void;
	
	function visitWithStatement(statement:IASWithStatement):void;
	
	function visitXMLLiteral(literal:IASXMLLiteral):void;
}
}