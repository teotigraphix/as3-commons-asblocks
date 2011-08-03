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
 * A switch default; <code>switch { default: statement; }</code>.
 * 
 * <pre>
 * IASBlock block = factory.newBlock();
 * IASSwitchStatement ss = block.newSwitch(factory.newExpression("foo"));
 * IASSwitchDefault sd = ss.newDefault();
 * ss.parseStatement("trace('default')");
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * {
 * 	switch (foo) {
 * 		default:
 * 			trace('default');
 * 	}
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IStatementContainer#newSwitch(IASExpression)
 * @see org.as3commons.asblocks.dom.IASSwitchStatement#newDefault()
 */
public interface IASSwitchDefault extends IASSwitchLabel
{
}
}