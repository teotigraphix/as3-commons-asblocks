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
 * A while statement; <code>while (condition) {}</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpression condition = factory.newExpression("hasNext()");
 * IASWhileStatement ws = block.newWhile(condition);
 * ws.parseStatement("current = foo.next()");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     while(foo.hasNext()) {
 *         current = foo.next();
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newWhile(IASExpression)
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewWhile(String)
 */
public interface IASWhileStatement extends IASStatement, IStatementContainer
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
	 * The while statement's condition expression.
	 */
	function getCondition():IASExpression;
	
	/**
	 * @see #getCondition()
	 * 
	 * @param The <code>IASExpression</code> condition.
	 */
	function setCondition(value:IASExpression):void;
	
	/**
	 * Parses the condition <code>String</code> into the <code>IASExpression</code>.
	 * 
	 * @param value
	 * @see #setCondition(IASExpression)
	 */
	function parseCondition(value:String):void;
	
	/**
	 * The <code>IASExpression</code> condition as a <code>String</code>.
	 * 
	 * @return A <code>IASExpression</code> condition.
	 * @see #getCondition()
	 */
	function getConditionString():String;
	
	//----------------------------------
	//  body
	//----------------------------------
	
	/**
	 * The while statement's body statement, usually a block.
	 */
	function getBody():IASStatement;
}
}