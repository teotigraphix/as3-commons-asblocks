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
 * Simple name; <code>"foo"</code> - <code>'foo'</code>.
 * 
 * <p>The value will be parsed as an <code>IDENT</code>, the simplest text 
 * fragment in the AST.</p>
 * 
 * <pre>
 * IASSimpleNameExpression pi = factory.newSimpleName(factory.parseExpression("foo"));
 * </pre>
 * 
 * <p>Will produce; <code>foo</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newSimpleNameExpression(String)
 */
public interface IASSimpleNameExpression extends IASExpression
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
	 * The simple <code>String</code> name of the expression.
	 */
	function getName():String;
	
	/**
	 * @see #getName()
	 * 
	 * @param value The <code>String</code> simple name.
	 */
	function setName(value:String):void;
}
}