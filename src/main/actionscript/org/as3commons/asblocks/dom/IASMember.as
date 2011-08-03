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
 * Base interface for all <code>IASType</code> members such as fields and methods.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASField
 * @see org.as3commons.asblocks.dom.IASMethod
 */
public interface IASMember extends IScriptElement, IMetaTagAware,
		IDocCommentAware, IQNameAware, IDisplayAware
{
	/**
	 * The member's <code>IASType</code> parent.
	 * 
	 * @return The <code>IASType</code> parent.
	 */
	function getParent():IASType;

	/**
	 * @see #getName()
	 * 
	 * @param value The new member <code>String</code> name.
	 */
	function setName(value:String):void;

	/**
	 * The member's return type, the value may be <code>null</code> if it is untyped.
	 */
	function getType():String;

	/**
	 * @see #getType()
	 * 
	 * @param value The new member <code>String</code> type, if <cod>null</code> the
	 * member is untyped.
	 */
	function setType(value:String):void;

	/**
	 * The member's <code>IASType</code> <code>Visibility</code>.
	 * 
	 * <p><strong>Note:</strong> If the member's <code>isNamespace()</code> returns
	 * <code>true</code>, you will need to use <code>getNamespaceVisibility()</code>
	 * to get the actual namespace visibility of the member.</p>
	 */
	function getVisibility():Visibility;

	/**
	 * @see #getVisibility()
	 * 
	 * @param value The member's <code>IASType</code> <code>Visibility</code>.
	 */
	function setVisibility(value:Visibility):void;

	/**
	 * Whether the member uses the <code>static</code> keyword.
	 */
	function isStatic():Boolean;

	/**
	 * @see #isStatic()
	 * 
	 * @param A <code>boolean</code> whether the member is static.
	 */
	function setStatic(value:Boolean):void;

	/**
	 * Whether the member uses a custom namespace instead of a standard <code>Visibility</code>.
	 */
	function hasNamespaceVisibility():Boolean

	/**
	 * @see #hasNamespaceVisibility()
	 * 
	 * @param value The <code>String</code> custom namespace visibility.
	 */
	function setNamespaceVisibility(value:String):void;

	/**
	 * @see #hasNamespaceVisibility()
	 * 
	 * @return The <code>String</code> custom namespace visibility or <code>null</code>.
	 */
	function getNamespaceVisibility():String;

	/**
	 * Whether the member's modifiers contain a certain <code>String</code> modifier value.
	 * 
	 * @param The <code>String</code> modifier to test for.
	 */
	function hasModifier(value:String):Boolean;

	/**
	 * Returns a <code>List</code> of all <code>String</code> modifiers found on the member.
	 * 
	 * @return A <code>List</code> of <code>String</code> modifiers.
	 */
	function getModifiers():IList;
}
}