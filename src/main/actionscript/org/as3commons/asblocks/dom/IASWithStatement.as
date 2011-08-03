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
 * A with statement; <code>with (object) {}</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpression object = factory.newExpression("life.universe.everything");
 * IASWithStatement ws = block.newWith(object);
 * ws.parseStatement("ultimate.answer = 42");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     with (life.universe.everything) {
 *         ultimate.answer = 42;
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newWith(IASExpression)
 */
public interface IASWithStatement extends IASStatement, IStatementContainer
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  scope
	//----------------------------------
	
	/**
	 * The target object's scope that each statement within the body resolves to.
	 */
	function getScope():IASExpression;
	
	/**
	 * @see #getScope()
	 * 
	 * @param value The <code>IASExpression</code> scope.
	 */
	function setScope(value:IASExpression):void;
	
	/**
	 * Parses a <code>String</code> scope into the <code>IASExpression</code>.
	 * 
	 * @param value The <code>String</code> scope.
	 */
	function parseScope(value:String):void;
	
	/**
	 * The <code>IASExpression</code> scope as a <code>String</code>.
	 * 
	 * @return The <code>String</code> scope.
	 */
	function getScopeString():String;
	
	//----------------------------------
	//  body
	//----------------------------------
	
	/**
	 * The with statement's child statement or block.
	 */
	function getBody():IASStatement;
}
}