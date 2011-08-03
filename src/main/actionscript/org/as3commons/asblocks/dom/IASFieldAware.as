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
 * An element aware of the <code>IASField</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASField
 * @see org.as3commons.asblocks.dom.IASClassType
 * @see org.as3commons.asblocks.dom.Visibility
 */
public interface IASFieldAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  fields
	//----------------------------------

	/**
	 * Returns all <code>IASField</code> instances declared in the class content.
	 * 
	 * <p>This property will never return <code>null</code>, if fields are 
	 * not found, an empty <code>List</code> is returned.</p>
	 * 
	 * @return A <code>List</code> of class <code>IASField</code> instances.
	 */
	function getFields():IList;

	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates, appends and returns a new <code>IASField</code> instance.
	 * 
	 * @param name The <code>String</code> name of the field.
	 * @param visibility The <code>Visibility</code> of the field.
	 * @param type The <code>String</code> type of the field.
	 * @return A new <code>IASField</code> instance appended to the class type.
	 */
	function newField(name:String, visibility:Visibility = null, type:String = null):IASField;
	
	/**
	 * Returns an <code>IASField</code> instance if found or <code>null</code> 
	 * if the type does not contain a field by name.
	 * 
	 * @return The <code>IASField</code> instance by name or <code>null</code>.
	 */
	function getField(name:String):IASField;

	/**
	 * Attempts to remove an <code>IASField</code> instance by name.
	 * 
	 * @param name The <code>String</code> name of the field.
	 * @return An <code>IASField</code> indicating whether a field by name was 
	 * found and removed (<code>IASField</code>), or (<code>null</code>) if not.
	 */
	function removeField(name:String):IASField;
}
}