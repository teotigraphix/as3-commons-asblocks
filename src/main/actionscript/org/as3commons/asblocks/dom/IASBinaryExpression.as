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
 * A binary expression; <code>a == b;</code>, <code>a != b;</code>
 * or <code>a + b;</code>.
 * 
 * <pre>
 * var left:IASExpression = factory.newExpression("a");
 * var right:IASExpression = factory.newExpression("b");
 * var expression:IASBinaryExpression = factory.newAndExpression(left, right);
 * </pre>
 * 
 * <p>Will produce <code>a && b</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.BinaryOperator
 * 
 * @see org.as3commons.asblocks.ASFactory#newAddExpression()
 * @see org.as3commons.asblocks.ASFactory#newAndExpression()
 * @see org.as3commons.asblocks.ASFactory#newBitAndExpression()
 * @see org.as3commons.asblocks.ASFactory#newBitOrExpression()
 * @see org.as3commons.asblocks.ASFactory#newBitXorExpression()
 * @see org.as3commons.asblocks.ASFactory#newDivisionExpression()
 * @see org.as3commons.asblocks.ASFactory#newEqualsExpression()
 * @see org.as3commons.asblocks.ASFactory#newGreaterEqualsExpression()
 * @see org.as3commons.asblocks.ASFactory#newGreaterThanExpression()
 * @see org.as3commons.asblocks.ASFactory#newLessEqualsExpression()
 * @see org.as3commons.asblocks.ASFactory#newLessThanExpression()
 * @see org.as3commons.asblocks.ASFactory#newModuloExpression()
 * @see org.as3commons.asblocks.ASFactory#newMultiplyExpression()
 * @see org.as3commons.asblocks.ASFactory#newNotEqualsExpression()
 * @see org.as3commons.asblocks.ASFactory#newOrExpression()
 * @see org.as3commons.asblocks.ASFactory#newShiftLeftExpression()
 * @see org.as3commons.asblocks.ASFactory#newShiftRightExpression()
 * @see org.as3commons.asblocks.ASFactory#newShiftRightUnsignedExpression()
 * @see org.as3commons.asblocks.ASFactory#newSubtractExpression()
 */
public interface IASBinaryExpression extends IASExpression
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  leftExpression
	//----------------------------------

	/**
	 * The <code>IASExpression</code> contained on the left side of the binary relation.
	 */
	function getLeftExpression():IASExpression;

	/**
	 * @see #getLeftExpression()
	 */
	function setLeftExpression(value:IASExpression):void;

	//----------------------------------
	//  operator
	//----------------------------------

	/**
	 * The relation's binrary operator eg; <code>+</code>, <code>==</code>,
	 * <code>!=</code>, ect.
	 */
	function getOperator():BinaryOperator;

	/**
	 * @see #getOperator()
	 */
	function setOperator(value:BinaryOperator):void;

	//----------------------------------
	//  rightExpression
	//----------------------------------

	/**
	 * The <code>IASExpression</code> contained on the right side of the binary relation.
	 */
	function getRightExpression():IASExpression;

	/**
	 * @see #getRightExpression()
	 */
	function setRightExpression(value:IASExpression):void;
}
}