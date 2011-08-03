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
 * An include statement; <code>include "my.as";</code>.
 * 
 * <pre>
 * IASCompilationUnit unit = factory.newClass("foo.Bar");
 * IASPackage pckg = unit.getPackage();
 * IASIncludeStatement inc1 = pckg.parseInclude("my.as");
 * IASIncludeStatement inc2 = pckg.parseInclude("my/other.as");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package foo {
 *     include "my.as";
 *     include "my/other.as";
 *     public class Bar {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASIncludeStatement extends IASStatement
{
	/**
	 * The <code>IASExpression</code> target of the include which is usually
	 * a <code>AS3Parser.STRING_LITERAL</code>.
	 * 
	 * @return The <code>IASExpression</code> target.
	 */
	function getTarget():IASExpression;

	/**
	 * @see #getTarget()
	 * 
	 * @param value The <code>IASExpression</code> target.
	 */
	function setTarget(value:IASExpression):void;

	/**
	 * Parses an include target such as <code>my.as</code> or 
	 * <code>my/other.as</code> into the target <code>IASExpression</code>.
	 * 
	 * @param value The <code>String</code> target.
	 */
	function parseTarget(value:String):void;

	/**
	 * The target <code>IASExpression</code> as a <code>String</code>.
	 * 
	 * @return A <code>String</code> target.
	 * @see #getTarget()
	 */
	function getTargetString():String;
}
}