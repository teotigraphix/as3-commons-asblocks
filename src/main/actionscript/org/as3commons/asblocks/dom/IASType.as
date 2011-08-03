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
 * The <code>IASType</code> is the supertype for the <code>IASClassType</code>,
 * <code>IASInterfaceType</code>, <code>IASFunctionType</code> and
 * <code>IASNamespaceType</code> types.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newClass(String)
 * @see org.as3commons.asblocks.ASFactory#newInterface(String)
 * @see org.as3commons.asblocks.ASFactory#newFunction(String, String)
 * @see org.as3commons.asblocks.ASFactory#newNamespace(String, String)
 * @see org.as3commons.asblocks.IASProject#newClass(String)
 * @see org.as3commons.asblocks.IASProject#newInterface(String)
 * @see org.as3commons.asblocks.IASProject#newFunction(String, Visibility, String)
 * @see org.as3commons.asblocks.IASProject#newNamespace(String, String)
 * @see org.as3commons.asblocks.dom.IASClassType
 * @see org.as3commons.asblocks.dom.IASInterfaceType
 * @see org.as3commons.asblocks.dom.IASFunctionType
 * @see org.as3commons.asblocks.dom.IASNamespaceType
 */
public interface IASType extends IScriptElement, IDocCommentAware,
		IImportAware, IIncludeAware, IUseAware, IQNameAware, IDisplayAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	/**
	 * Returns the types <code>IASPackage</code>.
	 */
	function getParent():IASPackage;

	//----------------------------------
	//  modifiers
	//----------------------------------

	/**
	 * Returns a <code>List</code> of <code>String</code>s holding all the current
	 * visibility and type modifiers.
	 */
	function getModifiers():IList;
	
	/**
	 * Returns whether a modifier in the types list matches the <code>modifier</code>.
	 */
	function hasModifier(modifer:String):Boolean;
	
	//----------------------------------
	//  visibility
	//----------------------------------

	/**
	 * The visibility of the <code>IASType</code>, this must be <code>PUBLIC</code>, 
	 * any other value will throw an error.
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError IASType visibility must 
	 * be public
	 */
	function getVisibility():Visibility;

	/**
	 * @see #getVisibility()
	 */
	function setVisibility(value:Visibility):void;

	//----------------------------------
	//  name
	//----------------------------------

	/**
	 * The simple name of the type.
	 * 
	 * <p>If a class has the qualified name of <code>my.domain.ClassA</code>,
	 * the name would be <code>ClassA</code>.</p>
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError Cannot set IASType name 
	 * to null
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError Cannot set IASType name 
	 * to and empty string
	 */
	function setName(value:String):void;

	//----------------------------------
	//  isSubType
	//----------------------------------

	/**
	 * Whether the <code>extends</code> clause is present.
	 */
	function isSubType():Boolean;
}
}