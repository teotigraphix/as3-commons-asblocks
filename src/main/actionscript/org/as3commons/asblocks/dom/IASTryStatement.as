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
 * A try statement; <code>try { } catch (e:Error) { } finally { }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASTryStatement statement = block.newTryCatch("e", "Error");
 * statement.parseStatement("trace('harder')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     try {
 *         trace('harder');
 *     } catch (e:Error) {
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASTryStatement statement = block.newTryFinally();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     try {
 *     } finally {
 *     }
 * }
 * </pre>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASTryStatement statement = block.newTryCatch("e", "Error");
 * statement.parseStatement("trace('happiness')");
 * statement.getCatchClauses.get(0).parseStatement("trace('gloom')");
 * IASFinallyClause fs = statement.newFinallyClasue();
 * fs.parseStatement("trace('live life')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	try {
 * 		trace("happiness");
 * 	} catch (e:Error) {
 * 		trace("gloom");
 * 	} finally {
 * 		trace("live life");
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#parseNewTryCatch(String, String)
 * @see org.as3commons.asblocks.dom.IStatementContainer#newTryFinally()
 */
public interface IASTryStatement extends IASStatement, IStatementContainer
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  catchClauses
	//----------------------------------
	
	/**
	 * The try statement's catch clauses in order of addition.
	 */
	function getCatchClauses():IList;
	
	//----------------------------------
	//  finallyClause
	//----------------------------------
	
	/**
	 * The try statement's single finally clause.
	 */
	function getFinallyClause():IASFinallyClause;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Appends and returns a new <code>IASCatchClause</code> to the try statement.
	 * 
	 * @param name The name identifier of the error object.
	 * @param type The type of error object.
	 * @return A new <code>IASCatchClause</code> statement.
	 */
	function newCatchClause(name:String, type:String):IASCatchClause;
	
	/**
	 * Removes the catch statement and returns the statement.
	 * 
	 * @param statement The catch statement to remove.
	 * @return The removed <code>IASCatchClause</code> clause if found or
	 * <code>null</code> if not found.
	 */
	function removeCatch(statement:IASCatchClause):IASCatchClause;
	
	/**
	 * Adds and returns a new <code>IASFinallyClause</code> to the try statement.
	 * 
	 * <p>Note: Only one finally statement is allowed, the method will throw an
	 * <code>ASBlocksSyntaxError</code> error if called more than once.</p>
	 * 
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError only one finally-clause allowed
	 */
	function newFinallyClause():IASFinallyClause;
	
	/**
	 * Removes the finally statement and returns the statement.
	 * 
	 * @return The removed <code>IASFinallyClause</code> clause.
	 */
	function removeFinally():IASFinallyClause;
}
}