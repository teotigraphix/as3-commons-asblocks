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

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class NullASBlocksVisitor implements IASBlockVisitor
{
	public function NullASBlocksVisitor()
	{
	}
	
	public function visitParameter(param:IASParameter):void
	{
	}
	
	public function visitArrayAccessExpression(expression:IASArrayAccessExpression):void
	{
	}
	
	public function visitArrayLiteral(literal:IASArrayLiteral):void
	{
	}
	
	public function visitAssignmentExpression(expression:IASAssignmentExpression):void
	{
	}
	
	public function visitBinaryExpression(expression:IASBinaryExpression):void
	{
	}
	
	public function visitBlockStatement(statement:IASBlock):void
	{
	}
	
	public function visitBooleanLiteral(literal:IASBooleanLiteral):void
	{
	}
	
	public function visitBreakStatement(statement:IASBreakStatement):void
	{
	}
	
	public function visitCatchClause(catchClause:IASCatchClause):void
	{
	}
	
	public function visitClassType(type:IASClassType):void
	{
	}
	
	public function visitCompilationUnit(unit:IASCompilationUnit):void
	{
	}
	
	public function visitConditionalExpression(expression:IASConditionalExpression):void
	{
	}
	
	public function visitContinueStatement(statement:IASContinueStatement):void
	{
	}
	
	public function visitDeclarationStatement(statement:IASDeclarationStatement):void
	{
	}
	
	public function visitDefaultXMLNamespaceStatement(statement:IASDefaultXMLNamespaceStatement):void
	{
	}
	
	public function visitDoWhileStatement(statement:IASDoWhileStatement):void
	{
	}
	
	public function visitDescendantExpression(expression:IASDescendantExpression):void
	{
	}
	
	public function visitExpressionAttribute(expression:IASExpressionAttribute):void
	{
	}
	
	public function visitExpressionStatement(statement:IASExpressionStatement):void
	{
	}
	
	public function visitField(field:IASField):void
	{
	}
	
	public function visitFieldAccessExpression(expression:IASFieldAccessExpression):void
	{
	}
	
	public function visitFilterExpression(expression:IASFilterExpression):void
	{
	}
	
	public function visitFinallyClause(fin:IASFinallyClause):void
	{
	}
	
	public function visitForEachInStatement(statement:IASForEachInStatement):void
	{
	}
	
	public function visitForInStatement(statement:IASForInStatement):void
	{
	}
	
	public function visitForStatement(statment:IASForStatement):void
	{
	}
	
	public function visitFunctionExpression(e:IASFunctionExpression):void
	{
	}
	
	public function visitIfStatement(statement:IASIfStatement):void
	{
	}
	
	public function visitIntegerLiteral(literal:IASIntegerLiteral):void
	{
	}
	
	public function visitInterfaceType(type:IASInterfaceType):void
	{
	}
	
	public function visitInvocationExpression(expression:IASInvocationExpression):void
	{
	}
	
	public function visitMetaTag(tag:IASMetaTag):void
	{
	}
	
	public function visitMethod(method:IASMethod):void
	{
	}
	
	public function visitNewExpression(expression:IASNewExpression):void
	{
	}
	
	public function visitNullLiteral(literal:IASNullLiteral):void
	{
	}
	
	public function visitObjectPropertyField(field:IASPropertyField):void
	{
	}
	
	public function visitObjectLiteral(literal:IASObjectLiteral):void
	{
	}
	
	public function visitPackage(pkg:IASPackage):void
	{
	}
	
	public function visitPostfixExpression(expression:IASPostfixExpression):void
	{
	}
	
	public function visitPrefixExpression(expression:IASPrefixExpression):void
	{
	}
	
	public function visitPropertyAttribute(expression:IASPropertyAttribute):void
	{
	}
	
	public function visitRegexpLiteral(expression:IASRegexpLiteral):void
	{
	}
	
	public function visitReturnStatement(statement:IASReturnStatement):void
	{
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
	
	public function visitSwitchCase(label:IASSwitchCase):void
	{
	}
	
	public function visitSwitchDefault(label:IASSwitchDefault):void
	{
	}
	
	public function visitSwitchStatement(statement:IASSwitchStatement):void
	{
	}
	
	public function visitThrowStatement(statement:IASThrowStatement):void
	{
	}
	
	public function visitTryStatement(statement:IASTryStatement):void
	{
	}
	
	public function visitUndefinedLiteral(literal:IASUndefinedLiteral):void
	{
	}
	
	public function visitDeclaration(variable:IASDeclaration):void
	{
	}
	
	public function visitWhileStatement(statement:IASWhileStatement):void
	{
	}
	
	public function visitWithStatement(statement:IASWithStatement):void
	{
	}
	
	public function visitXMLLiteral(literal:IASXMLLiteral):void
	{
	}
}
}