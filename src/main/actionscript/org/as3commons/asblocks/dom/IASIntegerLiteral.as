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
 * A Number literal; <code>42</code>, <code>.420</code> or <code>0xf42</code>.
 * 
 * <pre>
 * IASIntegerLiteral nl = factory.newIntegerLiteral(42);
 * </pre>
 * 
 * <p>Will produce; <code>42</code></p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newIntegerLiteral(int)
 */
public interface IASIntegerLiteral extends IASLiteral
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  value
	//----------------------------------
	
	/**
	 * A Number; <code>42</code>, <code>.420</code> or <code>0xf42</code>.
	 */
	function getValue():int;
	
	/**
	 * @private
	 */
	function setValue(value:int):void;
}
}