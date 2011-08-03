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
 * A use namespace statement; <code>use namespace outer_space;</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASUseStatement us = block.parseNewUseNamespace("outer_space");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     use namespace outer_space;
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newUseNamespace(IASExpression)
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewUseNamespace(IASExpression)
 */
public interface IASUseStatement extends IASStatement
{
	/**
	 * The <code>String</code> name of the namespace used.
	 * 
	 * @return The <code>String</code> namespace.
	 */
	function getName():String;
	
	/**
	 * @see #getName()
	 * 
	 * @param value The <code>String</code> namespace.
	 */
	function setName(value:String):void;
}
}