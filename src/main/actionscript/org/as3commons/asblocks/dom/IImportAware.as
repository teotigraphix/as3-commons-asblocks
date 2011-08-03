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
 * Clients implement this interface to hold <code>IASImportStatement</code> ast.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASPackage
 * @see org.as3commons.asblocks.dom.IASType
 * @see org.as3commons.asblocks.dom.IASImportStatement
 */
public interface IImportAware
{
	/**
	 * Adds an <code>IASImportStatement</code> to the container using the 
	 * <code>IASExpression</code>.
	 * 
	 * @param name the <code>IASExpression</code> qualified import name.
	 * @return A <code>IASImportStatement</code>.
	 */
	function newImport(name:IASExpression):IASImportStatement;
	
	/**
	 * Parses a <code>String</code> and adds an <code>IASImportStatement</code> 
	 * to the container.
	 * 
	 * @param name the <code>String</code> qualified import name.
	 * @return A <code>IASImportStatement</code>.
	 */
	function parseImport(name:String):IASImportStatement;

	/**
	 * Removes an <code>IASImportStatement</code> from the container.
	 * 
	 * @param name the <code>String</code> qualified import name.
	 * @return A <code>IASImportStatement</code> indicating whether the removal was successful.
	 */
	function removeImport(name:String):IASImportStatement;

	/**
	 * Returns a <code>List</code> of <code>IASImportStatement</code> qualified imports.
	 * 
	 * @return A <code>List</code> of <code>IASImportStatement</code> imports.
	 */
	function getImports():IList;
}
}