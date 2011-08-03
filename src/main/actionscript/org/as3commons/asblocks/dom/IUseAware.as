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
 * Clients implement this interface to hold <code>IASUseStatement</code> ast.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASPackage
 * @see org.as3commons.asblocks.dom.IASType
 * @see org.as3commons.asblocks.dom.IASUseStatement
 */
public interface IUseAware
{
	/**
	 * Adds an <code>IASUseStatement</code> to the container using the 
	 * <code>IASExpression</code>.
	 * 
	 * @param name the <code>IASExpression</code> the namespace name.
	 * @return A <code>IASUseStatement</code>.
	 */
	function newUse(name:IASExpression):IASUseStatement;
	
	/**
	 * Parses a <code>String</code> and adds an <code>IASUseStatement</code> 
	 * to the container.
	 * 
	 * @param name the <code>String</code> namespace name.
	 * @return A <code>IASUseStatement</code>.
	 */
	function parseUse(name:String):IASUseStatement;

	/**
	 * Removes an <code>IASUseStatement</code> from the container.
	 * 
	 * @param name the <code>String</code> namespace name.
	 * @return A <code>IASUseStatement</code> indicating whether the removal was successful.
	 */
	function removeUse(name:String):IASUseStatement;

	/**
	 * Returns a <code>List</code> of <code>IASUseStatement</code> namespaces used.
	 * 
	 * @return A <code>List</code> of <code>IASUseStatement</code> imports.
	 */
	function getUses():IList;
}
}