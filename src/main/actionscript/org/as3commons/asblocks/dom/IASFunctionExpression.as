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
 * A Function literal; <code>var f:Function = function():void{trace'hello')};</code>.
 * 
 * <pre>
 * IASFunctionExpression fl = factory.newFunctionExpression();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * function() {
 * }
 * </pre>
 * 
 * <pre>
 * IASFunctionExpression fl = factory.newFunctionExpression();
 * fl.setType("int");
 * fl.addParameter("arg0", "String");
 * fl.parseStatement("trace('Hello World')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * function(arg0:String):int {
 *     trace('Hello World');
 * }
 * </pre>
 * 
 * <pre>
 * IASFunctionExpression fl = factory.newFunctionExpression();
 * fl.setType("int");
 * fl.addParameter("arg0", "String");
 * fl.parseStatement("trace('Hello World')");
 * IASExpression target = factory.newExpression("foo");
 * IASAssignmentExpression assign = factory.newAssignExpression(target, fl);
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * foo = function(arg0:String):int {
 *     trace('Hello World');
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newFunctionExpression()
 */
public interface IASFunctionExpression extends IASExpression, IFunctionCommon, IStatementContainer
{
	
	/**
	 * The return type of the function, this value may include a period.
	 * 
	 * <p>If a period is found in the type, the type is considered a
	 * qualified type else it is a simple type.</p>
	 */
	function getType():String;

	/**
	 * @private
	 */
	function setType(value:String):void;
}
}