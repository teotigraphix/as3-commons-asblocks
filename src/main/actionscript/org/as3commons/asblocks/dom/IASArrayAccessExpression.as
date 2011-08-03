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
 * Array access; <code>foo["bar"]</code> - <code>target</code>
 * [<code>subscript</code>].
 * 
 * <pre>
 * var target:IASExpression = factory.newExpression("foo");
 * var subscript:IASExpression = factory.newIntegerLiteral(42);
 * var aae:IASArrayAccessExpression = factory.newArrayAccessExpression(target, subscript);
 * </pre>
 * 
 * <p>Will produce; <code>foo[42]</code>.</p>
 * 
 * <pre>
 * var target:IASExpression = factory.newExpression("foo[42]");
 * var subscript:IASExpression = factory.newExpression("0");
 * var aae:IASArrayAccessExpression = factory.newArrayAccessExpression(target, subscript);
 * </pre>
 * 
 * <p>Will produce; <code>foo[42][0]</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newArrayAccessExpression()
 */
public interface IASArrayAccessExpression extends IASExpression
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  target
	//----------------------------------
	
	/**
	 * The target expression occurs before the <code>[</code> bracket -
	 * <code>target</code>[<code>subscript</code>].
	 */
	function getTarget():IASExpression;
	
	/**
	 * @see #getTarget()
	 */
	function setTarget(value:IASExpression):void;
	
	//----------------------------------
	//  subscript
	//----------------------------------
	
	/**
	 * The subscript expression occurs after the <code>[</code> bracket-
	 * <code>target</code>[<code>subscript</code>].
	 */
	function getSubscript():IASExpression;
	
	/**
	 * @see #getSubscript()
	 */
	function setSubscript(value:IASExpression):void;
}
}