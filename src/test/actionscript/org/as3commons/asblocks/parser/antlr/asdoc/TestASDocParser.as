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

package org.as3commons.asblocks.parser.antlr.asdoc
{

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CommonTokenStream;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.flexunit.Assert;
import org.flexunit.asserts.assertEquals;

public class TestASDocParser
{
	private static const TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	[Test]
	public function testEmptyBody():void
	{
		var tree:LinkedListTree = parse("");
		assertEquals(ASDocParser.ASDOC, tree.type);
		assertEquals(ASDocParser.DESCRIPTION, tree.getFirstChild().type);
	}
	
	[Test]
	public function test_white_space():void
	{
		var doc:String = "* First description\n" + "*   @param foo bar";
		var tree:LinkedListTree = parse(doc);
		
		var desc:LinkedListTree = tree.getChild(0) as LinkedListTree;
		assertEquals(ASDocParser.DESCRIPTION, desc.type);
		
		var param:LinkedListTree = tree.getChild(1) as LinkedListTree;
		assertEquals(ASDocParser.PARA_TAG, param.type);
		// NOTE: this is a hack for people that add more than on space after
		// an astrix, which is "not" correct but for this lexer to not fail
		// for these cases, the tag name is (WS? ATWORD)
		assertEquals("  @param", param.getFirstChild().text);		
	}
	
	[Test]
	public function testParaBasic():void
	{
		var doc:String = "* desc\n" + "* ription\n" + "* @param foo bar";
		var tree:LinkedListTree = parse(doc);

		var desc:LinkedListTree = LinkedListTree(tree.getChild(0));
		assertEquals(ASDocParser.DESCRIPTION, desc.type);

		var param:LinkedListTree = LinkedListTree(tree.getChild(1));
		assertEquals(ASDocParser.PARA_TAG, param.type);
		assertEquals("@param", param.getFirstChild().text);
	}
	
	[Test]
	public function testLonelyParaTag():void
	{
		var doc:String = "\n\t\t * @param test a test!\n\t\t ";
		var tree:LinkedListTree = parse(doc);
	}
	
	[Test]
	public function testJustNewlines():void
	{
		var doc:String = "\n\n";
		var tree:LinkedListTree = parse(doc);
	}
	
	[Test]
	public function testInlineTag():void
	{
		var tree:LinkedListTree = parse("{@link foo}");
		//OutputStreamWriter out = new OutputStreamWriter(System.out);
		//new ASTDot(out).dotify(tree);
		//out.flush();
		var desc:LinkedListTree = tree.getFirstChild();
		var tag:LinkedListTree = desc.getFirstChild();
		assertEquals(ASDocParser.INLINE_TAG, tag.type);
		assertEquals("@link", tag.getFirstChild().text);
	}

	
	private static function parse(str:String):LinkedListTree
	{
		var parser:ASDocParser = parserOn(str);
		return parser.commentBody().tree as LinkedListTree;
	}
	
	private static function parserOn(str:String):ASDocParser
	{
		var cs:ANTLRStringStream = new ANTLRStringStream(str);
		var lexer:ASDocLexer = new ASDocLexer(cs);
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		
		var parser:ASDocParser = new ASDocParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		
		//parser.setInput(lexer, cs);
		return parser;
	}

}
}