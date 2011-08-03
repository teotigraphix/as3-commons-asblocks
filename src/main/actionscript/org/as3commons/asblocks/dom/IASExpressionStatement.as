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
 * An expression as a statement in a statement container.
 * 
 * <p>An example of this could be a <code>trace</code> expresson. This is 
 * actually an <code>IASInvocationExpression</code> but found in a block,
 * the expression would be wrapped in an <code>IASExpressionStatement</code>.</p>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpressionStatement satement = factory.newExpression("trace('foo')");
 * IASInvocationExpression expression = statement.getExpression();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     trace('foo');
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASExpressionStatement extends IASStatement
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
	 * The statement's expression.
	 */
	function getExpression():IASExpression;
	
	/**
	 * @see #getExpression()
	 */
	function setExpression(expression:IASExpression):void;
	
	/**
	 * Parses the <code>String</code> expression.
	 */
	function parseExpression(expression:String):void;
}
}