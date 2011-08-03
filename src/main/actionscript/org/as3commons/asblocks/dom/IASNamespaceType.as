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
 * The <code>IASNamespaceType</code> interface exposes documentation, metadata,
 * and single public <code>namespace</code> type.
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASFactory(factory);
 * IASCompilationUnit unit = project.newNamespace("my.domain.foo_bar", "goo/2012");
 * IASNamespaceType type = (IASNamespaceType) unit.getType();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public namespace foo_bar = "goo/2012";
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newNamespace(String, String)
 * @see org.as3commons.asblocks.dom.IASProject#newFunction()
 * @see org.as3commons.asblocks.dom.ICompilationUnit
 */
public interface IASNamespaceType extends IASType
{
	/**
	 * The namespace uri.
	 * 
	 * @return
	 */
	function getURI():String;
	
	/**
	 * @see #getURI()
	 * 
	 * @param value The namespace uri.
	 */
	function setURI(value:String):void;
}
}