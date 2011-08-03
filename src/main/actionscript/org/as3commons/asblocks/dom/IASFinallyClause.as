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
 * A finally statement; <code>finally { }</code>.
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
 * IASFinallyClause fstatement = statement.newFinallyClause();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     try {
 *     } catch (e:Error) {
 *     } finally {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASTryStatement#newCatchClause(String, String)
 */
public interface IASFinallyClause extends IASStatement, IStatementContainer
{
}
}