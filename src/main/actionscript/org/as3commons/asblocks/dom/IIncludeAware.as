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
 * Clients implement this interface to hold <code>IASIncludeStatement</code> ast.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASPackage
 * @see org.as3commons.asblocks.dom.IASType
 * @see org.as3commons.asblocks.dom.IASIncludeStatement
 */
public interface IIncludeAware
{
	/**
	 * Adds an <code>IASIncludeStatement</code> to the package using the 
	 * <code>IASExpression</code>.
	 * 
	 * @param path the <code>IASExpression</code> string.
	 * @return A <code>IASIncludeStatement</code>.
	 */
	function newInclude(path:IASExpression):IASIncludeStatement;
	
	/**
	 * Parses a <code>String</code> and adds an <code>IASIncludeStatement</code> 
	 * to the container.
	 * 
	 * @param path the <code>String</code> include path.
	 * @return A <code>IASIncludeStatement</code>.
	 */
	function parseInclude(path:String):IASIncludeStatement;

	/**
	 * Removes an <code>IASIncludeStatement</code> from the container.
	 * 
	 * @param path the <code>String</code> qualified import name.
	 * @return A <code>IASIncludeStatement</code> indicating whether the removal was successful.
	 */
	function removeInclude(path:String):IASIncludeStatement;

	/**
	 * Returns a <code>List</code> of <code>IASIncludeStatement</code> IASIncludeStatement.
	 * 
	 * @return A <code>List</code> of <code>IASIncludeStatement</code> includes.
	 */
	function getIncludes():IList;	
}
}