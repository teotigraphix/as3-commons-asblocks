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
 * An if ( condition ) thenBlock else elseBlock statement; 
 * <code>if (condition) { } else { }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASIfStatement ifs = block.newIf(factory.newExpression("foo"));
 * ifs.parseStatement("trace('true')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	if (foo) {
 * 		trace(true);
 * 	}
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASIfStatement ifs = block.newIf(factory.newExpression("foo"));
 * ifs.setCondition(factory.newExpression("foo == bar && baz != foo"));
 * ifs.parseStatement("trace('true')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	if (foo == bar && baz != foo) {
 * 		trace(true);
 * 	}
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASIfStatement ifs = block.newIf(factory.newExpression("foo"));
 * ifs.parseStatement("trace('true')");
 * ifs.getElse().parseStatement("trace('false')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	if (foo) {
 * 		trace(true);
 * 	} else {
 * 		trace(false);
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newIf(IASExpression)
 */
public interface IASIfStatement extends IASStatement, IStatementContainer
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  condition
	//----------------------------------
	
	/**
	 * The if statement's condition expression.
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError if then block cannot be null
	 */
	function getCondition():IASExpression;
	
	function getConditionString():String;
	
	/**
	 * @private
	 */
	function setCondition(value:IASExpression):void;
	
	//----------------------------------
	//  thenBlock
	//----------------------------------
	
	/**
	 * The if statement's then block (<code>if (condition) { thenBlock }</code>).
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError if then block cannot be null
	 */
	function getThenStatement():IASStatement;
	
	/**
	 * @private
	 */
	function setThen(value:IASBlock):void;
	
	function setThenStatement(statement:IASStatement):void;
	
	//----------------------------------
	//  elseBlock
	//----------------------------------
	
	/**
	 * The if statement's else block (<code>if (condition) { thenBlock } 
	 * else { elseBlock }</code>).
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError Expecting an IASBlock
	 */
	function getElse():IASBlock;
	
	function getElseStatement():IASStatement;
	
	function setElseStatement(value:IASStatement):void;
}
}