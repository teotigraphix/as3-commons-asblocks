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
 * A method or function parameter; <code>( arg0:int, arg1:String = "", ...rest )</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASParameter extends IScriptElement
{
	/**
	 * The name of the parameter; after the <code>(</code> or <code>,</code>.
	 */
	function getName():String;

	/**
	 * @see #getName()
	 */
	function setName(value:String):void;
	
	/**
	 * The type of the parameter; after the <code>:</code>.
	 */
	function getType():String;

	/**
	 * @see #getType()
	 */
	function setType(value:String):void;
	
	/**
	 * The parameters default value that is read after an <code>=</code> sign.
	 */
	function getDefaultValue():String;

	/**
	 * @see #getDefaultValue()
	 */
	function setDefaultValue(value:String):void;
	
	/**
	 * Whether the parameter is a final rest parameter.
	 * 
	 * @return Whether parameter is a rest.
	 */
	function isRest():Boolean;

	/**
	 * Returns the parameter's description found in the parent method's param tag
	 * if present.
	 */
	function getDescription():String;

	/**
	 * @see #getDescription()
	 * 
	 * @param value Sets the methods param tag description for this parameter.
	 */
	function setDescription(description:String):void;
}
}