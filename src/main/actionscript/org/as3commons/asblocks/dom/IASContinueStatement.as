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
 * A continue statement with optional label; <code>continue;</code> or 
 * <code>continue myLoop;</code>.
 * 
 * <pre>
 * var block:IASBlock = factory.newBlock();
 * var cs:IASContinueStatement = block.newContinue();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     continue;
 * }
 * </pre>
 * 
 * <pre>
 * var block:IASBlock = factory.newBlock();
 * var cs:IASContinueStatement = block.newContinue("myLoop");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     continue myLoop;
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newContinue()
 */
public interface IASContinueStatement extends IASStatement
{
	//--------------------------------------------------------------------------
	//
	//  Public :: Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  label
	//----------------------------------
	
	/**
	 * @see #getLabel()
	 */
	function setLabel(value:String):void;
	
	/**
	 * Returns the continue's label as a <code>String</code>.
	 * 
	 * @return The <code>String</code> label.
	 */
	function getLabel():String;
}
}