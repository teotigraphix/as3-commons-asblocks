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
 * A for ( in ) statement; <code>for (declaration in target) { }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpression declaration = factory.parseExpression("foo");
 * IASExpression target = factory.parseExpression("bar");
 * IASForEachInStatement fs = block.newForIn(declaration, target);
 * fs.parseStatement("trace('do work')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     for (foo in bar) {
 *         trace('do work');
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASExpression declaration = factory.parseDeclaration("foo:String");
 * IASExpression target = factory.parseExpression("getObject(baz)");
 * IASForEachInStatement fs = block.newForIn(declaration, target);
 * fs.parseStatement("trace('do work')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     for (var foo:String in getObject(baz)) {
 *         trace('do work');
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newForIn(IScriptElement, IASExpression)
 * @see org.as3commons.asblocks.ASFactory#newDeclaration(String)
 */
public interface IASForInStatement extends IASStatement, IStatementContainer
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
	
	function setInitializer(value:IScriptElement):void;
	
	/**
	 * @private
	 */
	function parseInitializer(value:String):void;
	
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
	function parseIterator(value:String):void;

	function setIterator(value:IASExpression):void;
	
	function getInitializerString():String;

	function getIteratorString():String;
}
}