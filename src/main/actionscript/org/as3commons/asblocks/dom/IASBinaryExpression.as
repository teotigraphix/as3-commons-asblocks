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
 * IASExpression left = factory.newExpression("a");
 * IASExpression right = factory.newExpression("b");
 * IASBinaryExpression expression = factory.newAndExpression(left, right);
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
 * @see org.as3commons.asblocks.ASFactory#newAddExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newAndExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newBitAndExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newBitOrExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newBitXorExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newDivisionExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newEqualsExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newGreaterEqualsExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newGreaterThanExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newLessEqualsExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newLessThanExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newModuloExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newMultiplyExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newNotEqualsExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newOrExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newShiftLeftExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newShiftRightExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newShiftRightUnsignedExpression(IASExpression, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newSubtractExpression(IASExpression, IASExpression)
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