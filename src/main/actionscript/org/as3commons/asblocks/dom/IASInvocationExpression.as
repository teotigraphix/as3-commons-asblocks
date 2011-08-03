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
 * An invocation expression; <code>super(arg0, arg1)</code>, 
 * <code>new Class(arg)</code>, <code>foo(arg0)</code> etc.
 * 
 * <pre>
 * IASExpression target = factory.newExpression("foo");
 * IASInvocationExpression ii = factory.newInvocationExpression(target, null);
 * </pre>
 * 
 * <p>Will produce; <code>foo()</code>.</p>
 * 
 * <pre>
 * IASExpression target = factory.newExpression("foo");
 * List&lt;IASExpression&gt; arguments= new ArrayList&lt;IASExpression&gt;();
 * arguments.add(factory.newExpression("bar"));
 * arguments.add(factory.newStringLiteral("baz"));
 * IASInvocationExpression ii = factory.newInvocationExpression(target, arguments);
 * </pre>
 * 
 * <p>Will produce; <code>foo(bar, "baz")</code>.</p>
 * 
 * <pre>
 * IASExpression target = factory.newExpression("foo");
 * IASInvocationExpression ii = factory.newInvocationExpression(target, null);
 * ii.setTarget(factory.newExpression("bar"));
 * </pre>
 * 
 * <p>Will produce; <code>bar()</code>.</p>
 * 
 * <pre>
 * IASExpression target = factory.newExpression("baz");
 * IASInvocationExpression ii = factory.newInvocationExpression(target, null);
 * List&lt;IASExpression&gt; arguments= new ArrayList&lt;IASExpression&gt;();
 * arguments.add(factory.newExpression("bar"));
 * arguments.add(factory.newStringLiteral("foo"));
 * ii.setArguments(arguments);
 * </pre>
 * 
 * <p>Will produce; <code>baz(bar, "foo")</code>.</p>
 * 
 * <pre>
 * IASExpression target1 = factory.newExpression("foo");
 * IASFieldAccessExpression access = factory.newFieldAccessExpression(target1, "bar");
 * IASInvocationExpression ii = factory.newInvocationExpression(access, null);
 * List&lt;IASExpression&gt; arguments = new ArrayList&lt;IASExpression&gt;();
 * arguments.add(factory.newIntegerLiteral(42));
 * ii.setArguments(arguments);
 * </pre>
 * 
 * <p>Will produce; <code>foo.bar(42)</code>.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newInvocationExpression(IASExpression, java.util.List)
 * @see org.as3commons.asblocks.ASFactory#newFieldAccessExpression(IASExpression, String)
 */
public interface IASInvocationExpression extends IASExpression, IASInvocation
{
}
}