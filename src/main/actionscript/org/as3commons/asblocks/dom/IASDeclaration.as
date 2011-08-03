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
 * A <code>var</code> or <code>const</code> declaration found in an
 * <code>IASDeclarationStatement</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASDeclarationStatement
 */
public interface IASDeclaration
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  name
	//----------------------------------
	
	/**
	 * The name of the declaration.
	 */
	function getName():String;
	
	/**
	 * @see #getName()
	 */
	function setName(value:String):void;
	
	//----------------------------------
	//  type
	//----------------------------------
	
	/**
	 * The type of the declaration.
	 */
	function getType():String;
	
	/**
	 * @see #getType()
	 */
	function setType(value:String):void;
	
	//----------------------------------
	//  initializer
	//----------------------------------
	
	/**
	 * The <code>IASExpression</code> initializer for the declaration.
	 * 
	 * <p>This is the expression that follows the <code>=</code> sign.</p>
	 */
	function getInitializer():IASExpression;
	
	/**
	 * @see #getInitializer()
	 */
	function setInitializer(value:IASExpression):void;
}
}