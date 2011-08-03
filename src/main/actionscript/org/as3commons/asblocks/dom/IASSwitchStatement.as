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
 * A switch statement; <code>switch (condition) { case: break; default: break; }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASSwitchStatement ss = block.newSwitch(factory.newExpression("foo"));
 * IASSwitchCase sc = ss.newCase("1");
 * sc.parseStatement("trace('one')");
 * IASSwitchDefault sd = ss.newDefault();
 * sd.parseStatement("trace('default')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	switch (foo) {
 * 		case 1:
 * 			trace('one');
 * 		default:
 * 			trace('default');
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newSwitch(IASExpression)
 * @see org.as3commons.asblocks.dom.IASSwitchCase
 * @see org.as3commons.asblocks.dom.IASSwitchDefault
 */
public interface IASSwitchStatement extends IASStatement
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
	 * The switch statement's condition expression.
	 */
	function getCondition():IASExpression;
	
	/**
	 * @see #getCondition()
	 * 
	 * @param value The <code>IASExpression</code> condition.
	 */
	function setCondition(value:IASExpression):void;
	
	function parseCondition(value:String):void;
	
	function getConditionString():String;
	
	//----------------------------------
	//  labels
	//----------------------------------
	
	/**
	 * The switch statement's <code>List</code> of <code>IASSwitchLabel</code> 
	 * statements, (the <code>case</code> and <code>default</code> statements).
	 */
	function getLabels():IList;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Creates and appends a new <code>case</code> label statement to the 
	 * <code>switch</code> statement.
	 * 
	 * @param label A <code>String</code> indicating the label's name.
	 * @return A new <code>IASSwitchCase</code> statement.
	 */
	function newCase(label:String):IASSwitchCase;
	
	/**
	 * Creates and appends a new <code>default</code> label statement to the 
	 * <code>switch</code> statement.
	 * 
	 * <p>Note: Only one <code>default</code> label statement is allowed per
	 * switch statement.</p>
	 * 
	 * @return A new <code>IASSwitchDefault</code> statement.
	 */
	function newDefault():IASSwitchDefault;
}
}