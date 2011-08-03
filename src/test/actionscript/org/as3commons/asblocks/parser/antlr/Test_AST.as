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

import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.impl.TokenBuilder;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;

public class Test_AST
{
	[Test]
	public function test_ast():void
	{
		var switchStmt:LinkedListTree = ASTUtils.newAST(AS3Parser.SWITCH, "switch");
		var defaultStmt1:LinkedListTree = ASTUtils.newAST(AS3Parser.DEFAULT,
				"default");
		switchStmt.addChildWithTokens(defaultStmt1);
		var colon:LinkedListToken = TokenBuilder.newColon();
		defaultStmt1.appendToken(colon);
		var stmtList:LinkedListTree = ASTUtils
				.newImaginaryAST(AS3Parser.SWITCH_STATEMENT_LIST);
		defaultStmt1.addChildWithTokens(stmtList);
		assertEquals(":", defaultStmt1.getStopToken().text);
		assertNull(colon.getNext());

		var defaultStmt2:LinkedListTree = ASTUtils.newAST(AS3Parser.DEFAULT,
				"default");
		switchStmt.addChildWithTokens(defaultStmt2);
		assertNull(LinkedListToken(defaultStmt2.token).getNext());

		var semi:LinkedListTree = ASTUtils.newAST(AS3Parser.SEMI, ";");
		ASTUtils.addChildWithIndentation(stmtList, semi);
		assertEquals(semi.token, defaultStmt1.getStopToken());
		assertEquals(defaultStmt2.getStartToken(),
				LinkedListToken(semi.token).getNext());
		// SEMI should have been inserted somewhere mid-token-stream
		assertNotNull(LinkedListToken(semi.token).getNext());
	}
}
}