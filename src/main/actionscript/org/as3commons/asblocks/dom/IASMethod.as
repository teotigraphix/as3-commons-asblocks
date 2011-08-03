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
 * The <code>IASMethod</code> interface exposes documentation, metadata,
 * and public members of the class or interface <code>function</code> type.
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newClass("foo.bar.ClassType");
 * IASClassType type = (IASClassType)unit.getType();
 * type.newMethod("foo", Visibility.PUBLIC, "void");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package foo.bar {
 *     public class ClassType {
 *         public function foo():void {
 *         }
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newInterface("foo.bar.IInterfaceType");
 * IInterfaceType type = (IASInterfaceType)unit.getType();
 * type.newMethod("foo", Visibility.PUBLIC, "void");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package foo.bar {
 *     public interface IInterfaceType {
 *         function foo():void;
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
 * @see org.as3commons.asblocks.ASFactory#newInterface(String)
 * @see org.as3commons.asblocks.IASProject#newInterface(String)
 * @see org.as3commons.asblocks.dom.IASMethodAware
 */
public interface IASMethod extends IASMember, IFunctionCommon, IStatementContainer
{
	/**
	 * Whether the method is the class's constructor.
	 * 
	 * @return A <code>boolean</code> determining whether the method is the
	 * class constructor.
	 */
	function isConstructor():Boolean;

	/**
	 * Whether the <code>override</code> modifier is present.
	 */
	function isOverride():Boolean;
	
	/**
	 * @see #isOverride()
	 * 
	 * @param value A <code>boolean</code> setting the method as an override.
	 */
	function setOverride(value:Boolean):void;

	/**
	 * The method's access role.
	 * 
	 * <p>When a method's access is not DEFAULT, the method is then considered
	 * an accessor. The role will then determine the direction of access the
	 * method accepts.</p>
	 * 
	 * @return
	 */
	function getAccessorRole():AccessorRole;
	
	/**
	 * @see #getAccessorRole()
	 * 
	 * @param value The new <code>AccessorRole</code> role.
	 */
	function setAccessorRole(value:AccessorRole):void;

	/**
	 * The method's return description tag found in it's <code>IDocComment</code>.
	 * 
	 * @return
	 */
	function getReturnDescription():String;

	/**
	 * @see #getReturnDescription()
	 * 
	 * @param value The new description to set in the methods documentation
	 * return tag.
	 */
	function setReturnDescription(value:String):void;
}
}