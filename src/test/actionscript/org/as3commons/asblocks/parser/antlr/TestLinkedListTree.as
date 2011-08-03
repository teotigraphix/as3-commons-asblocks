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
import org.flexunit.Assert;

public class TestLinkedListTree
{
	private var adaptor:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	[Test]
	public function test_main():void
	{
		var a:LinkedListToken = new LinkedListToken(1, "foo");
		var identA:LinkedListTree = LinkedListTree(adaptor.create(a));

		var b:LinkedListToken = new LinkedListToken(1, "bar");
		var identB:LinkedListTree = LinkedListTree(adaptor.create(b));
		var t:LinkedListToken = new LinkedListToken(2, ".");
		identA.appendToken(t);
		identA.addChildWithTokens(identB);
		
		Assert.assertStrictlyEquals(b, a.getNext().getNext());

	}
}
}