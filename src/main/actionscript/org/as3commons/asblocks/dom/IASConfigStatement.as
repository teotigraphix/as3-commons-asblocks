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
 * A <code>CONFIG::ident {}</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASConfigStatement config = block.parseNewConfig("debug");
 * config.parseStatement("trace('debug compiler')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     CONFIG::debug {
 *         trace('do work');
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewConfig(String)
 * @see org.as3commons.asblocks.dom.IStatementContainer#newConfig(String)
 */
public interface IASConfigStatement extends IASStatement, IStatementContainer
{
	//----------------------------------
	//  name
	//----------------------------------
	
	/**
	 * Adds a new <code>IASConfigStatement</code> to the container.
	 * 
	 * @param value A <code>String</code> indicating the name of the statement.
	 */
	function setName(value:String):void;
	
	/**
	 * Returns the <code>IASConfigStatement</code>'s string name.
	 * 
	 * @return A <code>String</code> config name.
	 */
	function getName():String
}
}