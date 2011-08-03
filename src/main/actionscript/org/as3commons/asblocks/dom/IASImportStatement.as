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
 * An import statement; <code>import foo.bar.Baz</code> or 
 * <code>import foo.bar.*</code>.
 * 
 * <pre>
 * IASCompilationUnit unit = factory.newClass("foo.Bar");
 * IASPackage pckg = unit.getPackage();
 * IASImportStatement imp1 = pckg.parseImport("foo.bar.Baz");
 * IASImportStatement imp2 = pckg.parseImport("foo.goo.*");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package foo {
 *     import foo.bar.Baz;
 *     import foo.goo.*;
 *     public class Bar {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASImportStatement extends IASStatement, IQNameAware
{
	/**
	 * The <code>IASExpression</code> target of the import which is usually
	 * a <code>AS3Parser.TYPE</code>.
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
	 * Parses an import target such as <code>foo.bar.Baz</code> or 
	 * <code>foo.bar.*</code> into the target <code>IASExpression</code>.
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