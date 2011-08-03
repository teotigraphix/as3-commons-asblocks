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
 * A switch case; <code>switch { case 1: statement; }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASSwitchStatement ss = block.newSwitch(factory.newExpression("foo"));
 * IASSwitchCase sc = ss.newCase("1");
 * sc.parseStatement("trace('one')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	switch (foo) {
 * 		case 1:
 * 			trace('one');
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newSwitch(IASExpression)
 * @see org.as3commons.asblocks.dom.IASSwitchStatement#newCase(String)
 */
public interface IASSwitchCase extends IASSwitchLabel
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  label
	//----------------------------------
	
	/**
	 * The case's label <code>IASExpression</code>.
	 */
	function getLabel():IASExpression;
	
	/**
	 * @see #getLabel()
	 * 
	 * @param value The label <code>IASExpression</code>.
	 */
	function setLabel(value:IASExpression):void;
	
	/**
	 * Parses a <code>String</code> label expression into an 
	 * <code>IASExpression</code>.
	 * 
	 * @param value
	 */
	function parseLabel(value:String):void;
	
	/**
	 * The label <code>IASExpression</code> as a <code>String</code>.
	 * 
	 * @return The <code>String</code> label.
	 */
	function getLabelString():String;
}
}