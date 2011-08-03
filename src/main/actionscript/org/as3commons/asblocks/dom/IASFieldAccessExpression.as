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
 * Field access; <code>target.name</code>.
 * 
 * <pre>
 * IASExpression target = factory.newExpression("foo()");
 * String name = "bar";
 * IASFieldAccessExpression fa = factory.newFieldAccessExpression(target, name);
 * </pre>
 * 
 * <p>Will produce; <code>foo().bar</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newFieldAccessExpression(IASExpression, String)
 */
public interface IASFieldAccessExpression extends IASExpression
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  name
	//----------------------------------
	
	/**
	 * @see #setName(String)
	 */
	function getName():String;
	
	/**
	 * The simple String name of the expression <code>target.name</code>.
	 * 
	 * @param value The <code>String</code> name.
	 */
	function setName(value:String):void;
	
	//----------------------------------
	//  target
	//----------------------------------
	
	/**
	 * @see #setTarget(IASExpression)
	 */
	function getTarget():IASExpression;
	
	/**
	 * The target <code>IASExpression</code> the field name accesses.
	 * 
	 * @param value The <code>String</code> name.
	 */
	function setTarget(value:IASExpression):void;
}
}