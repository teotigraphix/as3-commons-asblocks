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

package org.as3commons.asblocks.parser.antlr
{

import org.as3commons.asblocks.impl.AS3FragmentParser;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.impl.TokenBuilder;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.flexunit.Assert;

public class Test_BasicListUpdateDelegate
{
	[Test]
	public function test_replacedChild():void
	{
		var delegate:BasicListUpdateDelegate = new BasicListUpdateDelegate();
		var parent:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.TYPE_SPEC);
		var index:int = 0;
		var oldChild:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, "foo");
		parent.addChildWithTokens(oldChild);
		var space:LinkedListToken = TokenBuilder.newSpace();
		parent.addToken(0, space);
		var semi:LinkedListToken = TokenBuilder.newSemi();
		parent.appendToken(semi);
		// check preconditions,
		Assert.assertEquals(space, parent.getStartToken());
		Assert.assertEquals(semi, parent.getStopToken());

		var child:LinkedListTree = AS3FragmentParser.parseTypeSpec("void").getFirstChild();

		// make the change,
		delegate.replacedChildAt(parent, index, child, oldChild);

		// check postconditions,
		Assert.assertEquals(space, parent.getStartToken());
		Assert.assertEquals(semi, parent.getStopToken());
		Assert.assertNotNull(space.getNext());
		Assert.assertEquals("void", space.getNext().text);
		Assert.assertStrictlyEquals(semi, space.getNext().getNext());
	}
}
}