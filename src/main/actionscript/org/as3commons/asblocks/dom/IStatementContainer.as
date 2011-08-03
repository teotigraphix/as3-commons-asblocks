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

package org.as3commons.asblocks.dom
{

import org.as3commons.collections.framework.IList;

/**
 * Clients implement this interface to add block statement api.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASBlock
 */
public interface IStatementContainer
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  hasCode
	//----------------------------------

	/**
	 * Whether the statement container contains child statements.
	 * 
	 * @see #getStatements()
	 */
	function hasStatements():Boolean;

	//----------------------------------
	//  statements
	//----------------------------------

	/**
	 * A <code>List</code> of <code>IASStatement</code>s contained in this
	 * statement container.
	 */
	function getStatements():IList;

	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Adds a line of comment text to the statement container.
	 * 
	 * @param comment A <code>String</code> comment.
	 */
	function addComment(text:String):void;

	/**
	 * Adds (appends) an <code>IASStatement</code> to the container.
	 * 
	 * @param statement The <code>IASStatement</code> to add.
	 * @throws ASBlocksSyntaxError Statement contained in the list (AST).
	 * @return The <code>IASStatement</code> added.
	 */
	function addStatement(statement:IASStatement):IASStatement;

	/**
	 * Parses and adds (appends) an <code>IASStatement</code> to the container.
	 * 
	 * @param statement The <code>String</code> statement text to add as an 
	 * <code>IASStatement</code>.
	 * @return The <code>IASStatement</code> added.
	 * @throws ASBlocksSyntaxError Statement contained in the list (AST).
	 */
	function parseStatement(statement:String):IASStatement;

	/**
	 * Removes the <code>IASStatement</code> from the container if the AST was
	 * in the container's children.
	 * 
	 * @param statement The <code>IASStatement</code> to remove.
	 * @return The <code>IASStatement</code> remove.
	 * @throws ASBlocksSyntaxError Statement not contained in the list (AST).
	 */
	function removeStatement(statement:IASStatement):IASStatement;

	//--------------------------------------------------------------------------
	//
	//  Factory Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new <code>expression;</code> statement.
	 * 
	 * @param expression The <code>IASExpression</code> expression statement.
	 * @return A new <code>IExpressionStatement</code>.
	 */
	function newExpressionStatement(
			expression:IASExpression):IASExpressionStatement;

	/**
	 * @see #newExpressionStatement(IASExpression)
	 */
	function parseNewExpressionStatement(statement:String):IASExpressionStatement;

	/**
	 * Creates a new <code>if(condition){...} else {...}</code> statement.
	 * 
	 * @param condition The <code>IASExpression</code> condition.
	 * @return A new <code>IASIfStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASIfStatement
	 */
	function newIf(condition:IASExpression):IASIfStatement;

	/**
	 * @see #newIf(IASExpression)
	 */
	function parseNewIf(condition:String):IASIfStatement;

	/**
	 * Creates a new <code>for(initializer; condition; iterator){...}</code> statement.
	 * 
	 * @param initializer The <code>IASExpression</code> initializer.
	 * @param initializer The <code>IASExpression</code> condition.
	 * @param initializer The <code>IASExpression</code> iterator.
	 * @return A new <code>IASForStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASForStatement
	 */
	function newFor(initializer:IScriptElement,
			condition:IASExpression, iterater:IASExpression):IASForStatement;

	/**
	 * @see #newFor(IScriptElement, IASExpression, IASExpression)
	 */
	function parseNewFor(initializer:String, condition:String,
			iterater:String):IASForStatement;

	/**
	 * Creates a new <code>for(declaration in target){...}</code> statement.
	 * 
	 * @param declaration The <code>IScriptElement</code> declaration.
	 * @param target The <code>IASExpression</code> iteration target.
	 * @return A new <code>IASForInStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASForInStatement
	 */
	function newForIn(declaration:IScriptElement,
			target:IASExpression):IASForInStatement;

	/**
	 * @see #newForIn(IScriptElement, IASExpression)
	 */
	function parseNewForIn(declaration:String, target:String):IASForInStatement;

	/**
	 * Creates a new <code>for each(declaration in target){...}</code> statement.
	 * 
	 * @param declaration The <code>IScriptElement</code> declaration.
	 * @param target The <code>IASExpression</code> iteration target.
	 * @return A new <code>IASForEachInStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASForEachInStatement
	 */
	function newForEachIn(declaration:IScriptElement,
			target:IASExpression):IASForEachInStatement;

	/**
	 * @see #newForEachIn(IScriptElement, IASExpression)
	 */
	function parseNewForEachIn(declaration:String,
			target:String):IASForEachInStatement;

	/**
	 * Creates a new <code>while(condition) {...}</code> statement.
	 * 
	 * @param condition The <code>IASExpression</code> condition.
	 * @return A new <code>IASWhileStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASWhileStatement
	 */
	function newWhile(condition:IASExpression):IASWhileStatement;

	/**
	 * @see #newWhile(IASExpression)
	 */
	function parseNewWhile(condition:String):IASWhileStatement;

	/**
	 * Creates a new <code>do {...} while (condition)</code> statement.
	 * 
	 * @param condition The <code>IASExpression</code> while condition.
	 * @return A new <code>IASDoWhileStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASDoWhileStatement
	 */
	function newDoWhile(condition:IASExpression):IASDoWhileStatement;

	/**
	 * @see #newDoWhile(IASExpression)
	 */
	function parseNewDoWhile(condition:String):IASDoWhileStatement;

	/**
	 * Creates a new <code>switch(condition){ case label: default: }</code> statement.
	 * 
	 * @param arguments A <code>Vector</code> of <code>IASExpression</code>s.
	 * @return A new <code>IASSwitchStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASSwitchStatement
	 * @see org.as3commons.asblocks.dom.IASSwitchCase
	 * @see org.as3commons.asblocks.dom.IASSwitchDefault
	 */
	function newSwitch(condition:IASExpression):IASSwitchStatement;

	/**
	 * @see #newSwitch(IASExpression)
	 */
	function parseNewSwitch(condition:String):IASSwitchStatement;

	/**
	 * Creates a new <code>with(scope) {...}</code> statement.
	 * 
	 * @param scope The <code>IASExpression</code> scope.
	 * @return A new <code>IASWithStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASWithStatement
	 */
	function newWith(scope:IASExpression):IASWithStatement;

	/**
	 * @see #newWith(IASExpression)
	 */
	function parseNewWith(scope:String):IASWithStatement;

	/**
	 * Creates a new <code>var foo:int = 0</code> or 
	 * <code>var foo:int = 0, bar:int = 42</code> statement.
	 * 
	 * @param declaration The String variable declaration.
	 * @return A new <code>IASDeclarationStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASDeclarationStatement
	 */
	function newDeclaration(declaration:IScriptElement):IASDeclarationStatement;

	/**
	 * @see #newDeclaration(IScriptElement)
	 */
	function parseNewDeclaration(declaration:String):IASDeclarationStatement;

	/**
	 * Creates a new <code>return expression</code> statement.
	 * 
	 * @param expression The <code>IASExpression</code> to return.
	 * @return A new <code>IASReturnStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASReturnStatement
	 */
	function newReturn(expression:IASExpression = null):IASReturnStatement;
	
	/**
	 * @see #newReturn()
	 */
	function parseNewReturn(expression:String):IASReturnStatement;

	/**
	 * Creates a new <code>super(args...)</code>, <code>super.foo(args...)</code>
	 * op <code>super.bar = expression</code> statement.
	 * 
	 * @param arguments A <code>Vector</code> of <code>IASExpression</code>s.
	 * @return A new <code>IASSuperStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASSuperStatement
	 */
	//	function IASSuperStatement newSuper(List<IASExpression> arguments);

	/**
	 * @see #newSuper(List)
	 */
	//	function IASSuperStatement newSuper();

	/**
	 * @see #newSuper()
	 */
	//	function parseSuper(arguments:String = null):IASSuperStatement;

	/**
	 * Creates a new <code>break label;</code> statement.
	 * 
	 * @param label The simple label name.
	 * @return A new <code>IASBreakStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBreakStatement
	 */
	function newBreak(label:String = null):IASBreakStatement;
	
	/**
	 * Creates a new <code>try {...} catch(name:type) {...}</code> statement.
	 * 
	 * @param name The <code>IASExpression</code> error instance name.
	 * @param type The <code>IASExpression</code> error instance type.
	 * @return A new <code>IASTryStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASTryStatement
	 */
	function newTryCatch(name:IASExpression, type:IASExpression):IASTryStatement;

	/**
	 * Creates a new <code>try {...} catch(name:type) {...}</code> statement.
	 * 
	 * @param name The <code>String</code> error instance name.
	 * @param type The <code>String</code> error instance type.
	 * @return A new <code>IASTryStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASTryStatement
	 */
	function parseNewTryCatch(name:String, type:String):IASTryStatement;

	/**
	 * Creates a new <code>try {...} finally {...}</code> statement.
	 * 
	 * @return A new <code>IASTryStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASTryStatement
	 */
	function newTryFinally():IASTryStatement;

	/**
	 * Creates a new <code>continue label;</code> statement.
	 * 
	 * @param label The simple label name.
	 * @return A new <code>IASContinueStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASContinueStatement
	 */
	function newContinue(label:String = null):IASContinueStatement;
	
	/**
	 * Creates a new <code>throw new Error(args...)</code> or 
	 * <code>throw e1</code> statement.
	 * 
	 * @param expression The <code>IASExpression</code> access.
	 * @return A new <code>IASThrowStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASThrowStatement
	 */
	function newThrow(expression:IASExpression):IASThrowStatement;

	/**
	 * @see #newThrow(IASExpression)
	 */
	//	public parseThrow(expression:String):IASThrowsStatement;

	/**
	 * Creates a new <code>default xml namespace = ns1</code> statement.
	 * 
	 * @param namespace The String namespace.
	 * @return A new <code>IASDefaultXMLNamespaceStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASDefaultXMLNamespaceStatement
	 */
	function newDefaultXMLNamespace(namespace:String):IASDefaultXMLNamespaceStatement;

	/**
	 * Creates a new label statement.
	 * 
	 * @param name The name of the label.
	 * @return A new <code>IASLabelStatement</code> statement.
	 */
	function newLabel(name:IASExpression):IASLabelStatement;

	/**
	 * @see #newLabel(IASExpression)
	 */
	function parseNewLabel(name:String):IASLabelStatement;

	/**
	 * Creates a new CONFIG statement.
	 * 
	 * @param name The name of the config block.
	 * @return A new <code>IASConfigStatement</code> statement.
	 */
	function newConfig(name:IASExpression):IASConfigStatement;

	/**
	 * @see #newConfig(IASExpression)
	 */
	function parseNewConfig(name:String):IASConfigStatement;

	/**
	 * Creates a new use namespace statement.
	 * 
	 * @param name The name of the namespace.
	 * @return A new <code>IASUseStatement</code> statement.
	 */
	function newUse(name:IASExpression):IASUseStatement;

	/**
	 * @see #newUse(IASExpression)
	 */
	function parseNewUse(name:String):IASUseStatement;
}
}