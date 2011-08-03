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
 * The <code>IASInterfaceType</code> interface exposes documentation, metadata,
 * and public members of the <code>interface</code> type.
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newInterface("my.domain.IInterfaceType");
 * IInterfaceType type = (IASInterfaceType) unit.getType();
 * type.newMethod("foo", Visibility.PUBLIC, null);
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public interface IASInterfaceType {
 *         function foo():void;
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newInterface(String)
 * @see org.as3commons.asblocks.IASProject#newInterface(String)
 * @see org.as3commons.asblocks.dom.IASCompilationUnit
 */
public interface IASInterfaceType extends IASType, IASContentBlock
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  superInterfaces
	//----------------------------------
	
	/**
	 * Returns a <code>List</code> of interfaces this interface type extends.
	 */
	function getSuperInterfaces():IList;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Adds an interface to the <code>extends</code> clause.
	 * 
	 * @param name The name of the interface, if a period is present, the name
	 * will be considered qualified.
	 * @return A <code>boolean</code> indicating whether the interface name
	 * was successfully added to the <code>extends</code> clause.
	 */
	function addSuperInterface(name:String):Boolean;
	
	/**
	 * Removes an interface from the <code>extends</code> clause.
	 * 
	 * @param name The name of the interface to be removed.
	 * @return A <code>boolean</code> indicating whether the interface name
	 * was successfully removed from the <code>extends</code> clause.
	 */
	function removeSuperInterface(name:String):Boolean;
}
}