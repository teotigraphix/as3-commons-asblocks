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

/**
 * Postfix expression; <code>i++</code> or <code>i--</code>.
 * 
 * <pre>
 * IASPostfixExpression pi = factory.newPostIncExpression(factory.parseExpression("count"));
 * </pre>
 * 
 * <p>Will produce; <code>count++</code>.</p>
 * 
 * <pre>
 * IASPostfixExpression pd = factory.newPostDecExpression(factory.parseExpression("count"));
 * </pre>
 * 
 * <p>Will produce; <code>count--</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newPostIncExpression(IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newPostDecExpression(IASExpression)
 */
public interface IASPostfixExpression extends IASExpression
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  expression
	//----------------------------------
	
	/**
	 * The prefix expression.
	 */
	function getExpression():IASExpression;
	
	/**
	 * @see #getExpression()
	 */
	function setExpression(value:IASExpression):void;
	
	//----------------------------------
	//  operator
	//----------------------------------
	
	/**
	 * The prefix operator.
	 */
	function getOperator():PostfixOperator;
	
	/**
	 * @see #getOperator()
	 */
	function setOperator(value:PostfixOperator):void;
}
}