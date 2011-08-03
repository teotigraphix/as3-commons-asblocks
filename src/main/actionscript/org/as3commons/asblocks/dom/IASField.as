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
 * A type field.
 * 
 * <pre>
 * IASField field = type.newField("foo", Visibility.PUBLIC, "int");
 * field.setInitializer(factory.newIntergerLiteral(42));
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * ...
 * {
 *     public var foo:int = 42;
 * }
 * ...
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 * 
 * @see org.as3commons.asblocks.api.IClassType#newField()
 */
public interface IASField extends IASMember
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  isConstant
	//----------------------------------
	
	/**
	 * Returns whether the <code>const</code> keyword is present.
	 * 
	 * @see #setConstant(boolean)
	 */
	function isConstant():Boolean;
	
	/**
	 * Sets whether the member contains the <code>const</code> keyword.
	 * 
	 * <p>Setting this property to <code>true</code> will add the <code>const</code>
	 * keyword, setting the property to <code>false</code> will remove the 
	 * <code>const</code> keyword.</p>
	 */
	function setConstant(value:Boolean):void;
	
	//----------------------------------
	//  isNamespace
	//----------------------------------
	
	/**
	 * Returns whether the <code>namespace</code> keyword is present.
	 * 
	 * @see #setNamespace(boolean)
	 */
	function isNamespace():Boolean;
	
	/**
	 * Sets whether the member contains the <code>namespace</code> keyword.
	 * 
	 * <p>Setting this property to <code>true</code> will add the <code>namespace</code>
	 * keyword, setting the property to <code>false</code> will remove the 
	 * <code>namespace</code> keyword.</p>
	 */
	function setNamespace(value:Boolean):void;
	
	//----------------------------------
	//  initializer
	//----------------------------------
	
	/**
	 * @see #getInitializer()
	 */
	function getInitializer():IASExpression;
	
	/**
	 * The field initializer expression if defined.
	 * 
	 * <p>This is the expression found after the <code>=</code> sign.</p>
	 */
	function setInitializer(value:IASExpression):void;
}
}