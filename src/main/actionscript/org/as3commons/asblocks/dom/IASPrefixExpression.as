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
 * Prefix expression; <code>++i</code> or <code>--i</code>.
 * 
 * <pre>
 * IASPrefixExpression pi = factory.newPreIncExpression(factory.parseExpression("count"));
 * </pre>
 * 
 * <p>Will produce; <code>++count</code>.</p>
 * 
 * <pre>
 * IASPrefixExpression pd = factory.newPreDecExpression(factory.parseExpression("count"));
 * </pre>
 * 
 * <p>Will produce; <code>--count</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASPrefixExpression extends IASExpression
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
	function getOperator():PrefixOperator;
	
	/**
	 * @see #getOperator()
	 */
	function setOperator(value:PrefixOperator):void;
}
}