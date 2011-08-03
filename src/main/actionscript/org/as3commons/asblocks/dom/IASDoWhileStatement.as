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
 * A do while statement; <code>do {} while(condition);</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpression condition = factory.newExpression("hasNext()");
 * IASDoWhileStatement dw = block.newDoWhile(condition);
 * dw.parseStatement("trace('do work')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     do {
 *         trace('do work');
 *     } while (hasNext());
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newDoWhile(IASExpression)
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewDoWhile(String)
 */
public interface IASDoWhileStatement extends IASStatement, IStatementContainer
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
	 * The condition expression found in the <code>while</code> statement.
	 */
	function getCondition():IASExpression;
	
	/**
	 * @see #getCondition()
	 */
	function setCondition(value:IASExpression):void;

	/**
	 * Parses the <code>String</code> condition into an <code>IASExpression</code>.
	 * 
	 * @param value The <code>String</code> condition.
	 */
	function parseCondition(value:String):void;
	
	/**
	 * Returns the condition as a <code>String</code>.
	 * 
	 * @return The <code>String</code> condition
	 */
	function getConditionString():String;
}
}