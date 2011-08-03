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
 * The <code>IASCompilationUnit</code> is the toplevel AST wrapper class that 
 * contains a public <code>IASPackage</code> and the package contains a
 * public <code>IASType</code> which will be either a class, interface, function
 * or namespace.
 * 
 * <p>Although the <code>getType()</code> is not actually a child of the 
 * compilation unit, the <code>getType()</code> method is available
 * for a shortcut instead of going through the <code>getPackage().getType()</code>.</p>
 * 
 * <p>The <code>getPackageName()</code> also references the <code>getType().getName()</code>
 * and is not found on this element's AST.</p>
 * 
 * <p>The <code>IASCompilationUnit</code> also holds inner classes and functions
 * found with <code>getInnerTypes()</code> and <code>getInnerFunctions()</code>.</p>
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newClass("my.domain.ClassType");
 * IASClassType type = (IASClassType)unit.getType();
 * type.newMetaData("Bindable");
 * type.setDescription("A new class.");
 * IMethod method = type.newMethod("foo", Visibility.PUBLIC, "void");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     [Bindable]
 *     /~~
 *      ~ A new class.
 *      ~/
 *     public class ClassType {
 *         public foo():void {
 *         }
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newInterface("my.domain.IInterfaceType");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public interface IInterfaceType {
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newFunction("my.domain.globalFunction", "String");
 * IASFunctionType ftype = (IASFunctionType)unit.getType();
 * ftype.parseNewReturn("foo");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public function globalFunction():String {
 *         return "foo";
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASProject(factory);
 * IASCompilationUnit unit = project.newNamespace("my.domain.the_universe", "http://www.the.universe.com");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public namespace the_universe = "http://www.the.universe.com";
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASClassType
 * @see org.as3commons.asblocks.dom.IASInterfaceType
 * @see org.as3commons.asblocks.dom.IASFunctionType
 * @see org.as3commons.asblocks.dom.IASNamespaceType
 */
public interface IASCompilationUnit extends IScriptElement, IQNameAware,
		IDisplayAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  packageName
	//----------------------------------
	
	/**
	 * The qualified name of the package (<code>my</code>,
	 * <code>my.domain</code> or <code>null</code>).
	 * 
	 * <p>This property can also be <code>null</code> which means the compilation
	 * unit is located in the default <code>toplevel</code> package.</p>
	 * 
	 * @see org.as3commons.asblocks.dom.IASPackage#getPackageName()
	 */
	function setPackageName(value:String):void;

	//----------------------------------
	//  packageNode
	//----------------------------------

	/**
	 * The public <code>package</code> node of the compilation unit.
	 * 
	 * <p>This node holds the public <code>IASType</code> node.</p>
	 * 
	 * <p><strong>Note:</strong> This property is lazy initialized.</p>
	 */
	function getPackage():IASPackage;

	//----------------------------------
	//  typeNode
	//----------------------------------

	/**
	 * A reference to the public <code>IASType</code> found within the 
	 * <code>IASPackage</code>.
	 * 
	 * <p>This type can either be a <code>IASClassType</code> or 
	 * <code>IASInterfaceType</code>.
	 * 
	 * <p><strong>Note:</strong> This property is lazy initialized.</p>
	 * 
	 * @see org.as3commons.asblocks.dom.IASClassType
	 * @see org.as3commons.asblocks.dom.IASInterfaceType
	 */
	function getType():IASType;

	/**
	 * Returns the inner class types of the compilation unit (if any).
	 * 
	 * <p>The method will return <code>null</code> if inner types are not
	 * found.</p>
	 * 
	 * <p><strong>Note:</strong> For interfaces this always returns 
	 * <code>null</code>.</p>
	 * 
	 * @return A List of <code>IASType</code> elements or <code>null</code>.
	 */
	function getInnerTypes():IList;

	/**
	 * Returns the inner functions (helper functions) of the compilation 
	 * unit (if any).
	 * 
	 * <p>The method will return <code>null</code> if inner function are not
	 * found.</p>
	 * 
	 * <p><strong>Note:</strong> For interfaces this always returns 
	 * <code>null</code>.</p>
	 * 
	 * @return A List of <code>IASFunction</code> elements or <code>null</code>.
	 */
	function getInnerFunctions():IList;
}
}