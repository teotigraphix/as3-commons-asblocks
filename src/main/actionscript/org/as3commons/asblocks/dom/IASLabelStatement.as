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
 * Labeled statement; <code>foo:while() { break foo; }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASLabelStatement statement = block.parseNewLabelStatement("foo");
 * IASIfStatement ifs = statement.parseNewIf("a == b");
 * ifs.parseStatement("trace('a label statement')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     foo:if(a == b) {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newLabelStatement(IASExpression)
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewLabelStatement(String)
 */
public interface IASLabelStatement
{
	/**
	 * The <code>String</code> label of the statement.
	 * 
	 * @return A <code>String</code> label.
	 */
	function getLabel():String;
	
	/**
	 * @see #getLabel()
	 * 
	 * @param value The <code>String</code> label.
	 */
	function setLabel(value:String):void;
	
	/**
	 * The <code>IASStatement</code> that this statement decorates.
	 * 
	 * @return The decorated <code>IASStatement</code>.
	 */
	function getStatement():IASStatement;
	
	/**
	 * @see #getStatement()
	 * 
	 * @param value The new decorated <code>IASStatement</code>.
	 */
	function setStatement(value:IASStatement):void;
}
}