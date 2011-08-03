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

import org.as3commons.collections.framework.IList;

/**
 * An Array literal; <code>[1,2,3]</code>.
 * 
 * <pre>
 * IASArrayLiteral al = factory.newArrayLiteral();
 * al.add(factory.newNumberLiteral(1));
 * al.add(factory.newStringLiteral("two"));
 * al.add(factory.newNumberLiteral(3));
 * </pre>
 * 
 * <p>Will produce; <code>[1,"two",3]</code>.</p>
 * 
 * <pre>
 * IASArrayLiteral al = factory.newArrayLiteral();
 * al.add(factory.newNumberLiteral(1));
 * al.add(factory.newExpression("[a1,a2,a3]"));
 * al.add(factory.newNumberLiteral(3));
 * </pre>
 * 
 * <p>Will produce; <code>[1,[a1,a2,a3],3]</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newArrayLiteral()
 */
public interface IASArrayLiteral extends IASLiteral
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The List of <code>IASExpression</code> entries in the array literal.
	 * 
	 * <p>The entries appear between the <code>[</code> and <code>]</code> 
	 * brackets and are separated by commas.</p>
	 * 
	 * <p><strong>Note:</strong> - Do not attempt to add or remove items from 
	 * this List, the AST will not be updated.</p>
	 * 
	 * @see #add()
	 * @see #remove()
	 */
	function getEntries():IList; // IASExpression
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Add an <code>IASExpression</code> entry to the array literal.
	 * 
	 * @param expression An <code>IASExpression</code> to add to the array literal.
	 */
	function add(expression:IASExpression):void;
	
	/**
	 * Remove an <code>IASExpression</code> entry from the array literal at the
	 * specified index.
	 * 
	 * @param index The index to remove, returns the removed <code>IASExpression</code>
	 * if successful, <code>null</code> if not.
	 */
	function remove(index:int):IASExpression;
}
}