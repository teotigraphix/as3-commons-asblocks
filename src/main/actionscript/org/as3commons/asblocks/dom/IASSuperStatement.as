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
 * Not implemented.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASSuperStatement extends IASStatement
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  target
	//----------------------------------
	
	/**
	 * The target of the super call, if any.
	 */
	function getTarget():IASExpression;
	
	/**
	 * @see #getTarget()
	 */
	function setTarget(value:IASExpression):void;
	
	//----------------------------------
	//  expression
	//----------------------------------
	
	/**
	 * The arguments to the super call.
	 */
	function getArguments():IList;
	
	/**
	 * @see #getArguments()
	 */
	function setArguments(value:IList):void;
}
}