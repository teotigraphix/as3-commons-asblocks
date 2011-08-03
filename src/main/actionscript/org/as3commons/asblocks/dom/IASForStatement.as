///////////////////////////////////////////////////////////////////////////////
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
 * A for ( ; ; ) statement; <code>for (initializer; condition; iterator) { }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * var intializer:IExpression = factory.newExpression("i = 0");
 * var condition:IExpression = factory.newExpression("i < len");
 * var iterator:IExpression = factory.newExpression("i++");
 * var fs:IForStatement = block.newFor(intializer, condition, iterator);
 * fs.addStatement("trace('do work')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	for (i = 0; i < len; i++) {
 * 		trace('do work');
 * 	}
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * var intializer:IExpression = factory.newExpression("i = 0");
 * var condition:IExpression = factory.newExpression("i < len");
 * var iterator:IExpression = factory.newExpression("i++");
 * var fs:IForStatement = block.newFor(intializer, condition, iterator);
 * fs.initializer = factory.newDeclaration("j:int = 0");
 * fs.condition = factory.newExpression("j >= len");
 * fs.iterator = factory.newExpression("--j");
 * fs.addStatement("trace('do work')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	for (var j:int = 0; j >= len; --j) {
 * 		trace('do work');
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.api.IStatementContainer#newFor()
 * @see org.as3commons.asblocks.ASFactory#newDeclaration()
 */
public interface IASForStatement extends IASStatement, IStatementContainer
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  initializer
	//----------------------------------
	
	/**
	 * The loop initializer, this can be an <code>IASExpression</code> or
	 * <code>IASDeclarationStatement</code>.
	 * 
	 * @see org.as3commons.asblocks.ASFactory#newDeclaration()
	 */
	function getInitializer():IScriptElement;
	
	/**
	 * @private
	 */
	function setInitializer(value:IScriptElement):void;
	
	//----------------------------------
	//  condition
	//----------------------------------
	
	/**
	 * The loop condition, terminates the loop when evaluates to true.
	 */
	function getCondition():IASExpression;
	
	/**
	 * @private
	 */
	function setCondition(value:IASExpression):void;
	
	//----------------------------------
	//  update
	//----------------------------------
	
	/**
	 * The loop iterator, advances a counter after each loop iteration.
	 */
	function getIterator():IASExpression;
	
	/**
	 * @private
	 */
	function setIterator(value:IASExpression):void;

	function getInitializerString():String;
	
	function getConditionString():String;

	function getIteratorString():String;
}
}