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
 * A block of code that acts as a statement container for nodes such as 
 * <code>if</code>, <code>for</code>, <code>while</code> etc.
 * 
 * <p>The <code>IASBlock</code> is usually the last child in a node list
 * and uses parenthetic start and stop tokens. These tokens are the <code>{</code>
 * and <code>}</code> respectively.</p>
 * 
 * <p>Blocks are indented based on the nodes parent indentation in the AST tree.</p>
 * 
 * <p>Blocks are the foundation for nodes to hold <code>IASStatement</code>s.</p>
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * block.parseStatement("trace('foo')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 *     trace('foo');
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newBlock()
 */
public interface IASBlock extends IASStatement, IStatementContainer
{
	// An implementation of IStatementContainer (e.g. an IASMethod) will not
	// be an appropriate value for things like a loop body.  Hence this
	// interface exists to differentiate those IStatementContainer
	// implementations which are actually blocks; even though it doesn't
	// define any methods.
}
}