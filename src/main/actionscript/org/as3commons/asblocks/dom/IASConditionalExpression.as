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
 * Conditional expression (ternary operator); <code>condition ? then : else</code>.
 * 
 * <pre>
 * var condition:IASExpression = factory.newExpression("foo");
 * var thenExp:IASExpression = factory.newExpression("bar");
 * var elseExp:IASExpression = factory.newExpression("baz");
 * var ce:IASConditionalExpression = factory.newConditionalExpression(condition, thenExp, elseExp);
 * </pre>
 * 
 * <p>Will produce; <code>foo ? bar : baz</code>.</p>
 * 
 * <pre>
 * var condition:IASExpression = factory.newExpression("foo");
 * var thenExp:IASExpression = factory.newExpression("bar");
 * var elseExp:IASExpression = factory.newExpression("baz");
 * var ce:IASConditionalExpression = factory.newConditionalExpression(condition, thenExp, elseExp);
 * ce.setCondition(factory.newExpression("foo < 42"));
 * ce.setThenExpression(factory.newExpression("foBar()"));
 * ce.setElseExpression(factory.newExpression("foBaz()"));
 * </pre>
 * 
 * <p>Will produce; <code>foo < 42 ? foBar() : foBaz()</code>.</p>
 * 
 * <pre>
 * var ce:IASConditionalExpression = factory.newExpression("foo ? bar : baz") as IASConditionalExpression;
 * </pre>
 * 
 * <p>Will produce an <code>IASConditionalExpression</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newConditionalExpression()
 */
public interface IASConditionalExpression extends IASExpression
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  condition
	//----------------------------------
	
	/**
	 * The condition expression that resolves to the <code>thenExpression</code> 
	 * or <code>elseExpression</code>.
	 */
	function getCondition():IASExpression;
	
	/**
	 * @see #getCondition()
	 */
	function setCondition(value:IASExpression):void;
	
	//----------------------------------
	//  thenExpression
	//----------------------------------
	
	/**
	 * The expression that is executed when the <code>condition</code> is 
	 * <code>true</code>.
	 */
	function getThenExpression():IASExpression;
	
	/**
	 * @see #getThenExpression()
	 */
	function setThenExpression(value:IASExpression):void;
	
	//----------------------------------
	//  elseExpression
	//----------------------------------
	
	/**
	 * The expression that is executed when the <code>condition</code> is 
	 * <code>false</code>.
	 */
	function getElseExpression():IASExpression;
	
	/**
	 * @see #getElseExpression()
	 */
	function setElseExpression(value:IASExpression):void;
}
}