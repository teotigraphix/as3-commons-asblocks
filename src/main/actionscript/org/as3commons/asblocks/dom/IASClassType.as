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
 * The <code>IASClassType</code> interface exposes documentation, metadata,
 * and public members of the <code>class</code> type.
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newClass("my.domain.ClassType");
 * IASClassType type = (IASClassType) unit.getType();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public class ClassType {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newClass(String)
 * @see org.as3commons.asblocks.IASProject#newClass(String)
 * @see org.as3commons.asblocks.dom.IASCompilationUnit
 */
public interface IASClassType extends IASType, IASContentBlock, IASFieldAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  isDynamic
	//----------------------------------

	/**
	 * @see #setDynamic(boolean)
	 */
	function isDynamic():Boolean;

	/**
	 * Whether the class type has a <code>dynamic</code> modifier.
	 * 
	 * <p>Setting this property to <code>true</code> will add the <code>dynamic</code>,
	 * setting the property to <code>false</code> will remove the <code>dynamic</code>
	 * modifier.</p>
	 * 
	 * @see #isDynamic()
	 */
	function setDynamic(value:Boolean):void;

	//----------------------------------
	//  isFinal
	//----------------------------------

	/**
	 * @see #setFinal(boolean)
	 */
	function isFinal():Boolean;

	/**
	 * Whether the class type has a <code>final</code> modifier.
	 * 
	 * <p>Setting this property to <code>true</code> will add the <code>final</code>,
	 * setting the property to <code>false</code> will remove the <code>final</code>
	 * modifier.</p>
	 * 
	 * @see #isFinal()
	 */
	function setFinal(value:Boolean):void;

	//----------------------------------
	//  superClass
	//----------------------------------

	/**
	 * The current String value located after the <code>extends</code> keyword.
	 * 
	 * <p>This value can be a qualified or simple name. When setting this 
	 * property to <code>null</code> or <code>""</code>, the type will completely
	 * remove the <code>extends</code> keyword along with the name from the AST.</p>
	 * 
	 * @see #setSuperClass(String)
	 */
	function getSuperClass():String;

	/**
	 * @see #getSuperClass()
	 */
	function setSuperClass(value:String):void;

	//----------------------------------
	//  implementedInterfaces
	//----------------------------------

	/**
	 * Returns all String values declared after the <code>implements</code>
	 * keyword.
	 * 
	 * <p>These values can be a qualified or simple names. This property will
	 * never return <code>null</code>, if implementations are not found, an
	 * empty Vector is returned.</p>
	 * 
	 * @see #hasImplementations()
	 * @see #addImplementedInterface(String)
	 * @see #removeImplementedInterface(String)
	 */
	function getImplementedInterfaces():IList;

	/**
	 * Returns whether the <code>implements</code> keyword is present.
	 * 
	 * @return a <code>boolean</code> indicating whether this class has implemented
	 * any <code>IASInterfaceType</code>s.
	 * 
	 * @see #getImplementedInterfaces()
	 * @see #addImplementedInterface(String)
	 * @see #removeImplementedInterface(String)
	 */
	function hasImplementations():Boolean;

	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Adds a qualified or simple name implementation to the class type.
	 * 
	 * <p>If no implementations exists the <code>implements</code> keyword
	 * will be added to the token list.</p>
	 * 
	 * @param name A <code>String</code> indicating the new implementation name.
	 * @return A <code>Boolean</code> indicating whether the implementation was added.
	 * 
	 * @see #removeImplementedInterface(String)
	 */
	function addImplementedInterface(name:String):Boolean;

	/**
	 * Removes a qualified or simple name implementation from the class type.
	 * 
	 * <p>If implementations exist and this implementation removed is the
	 * last, the <code>implements</code> keyword will be removed from the 
	 * token list.</p>
	 * 
	 * @param name A <code>String</code> indicating the new implementation name.
	 * @return A <code>Boolean</code> indicating whether the implementation was added.
	 * 
	 * @see #addImplementedInterface(String)
	 */
	function removeImplementedInterface(name:String):Boolean;
}
}