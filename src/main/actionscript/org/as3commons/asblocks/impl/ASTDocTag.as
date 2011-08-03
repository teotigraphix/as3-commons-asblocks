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

package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IDocTag;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.asdoc.ASDocParser;
import org.as3commons.lang.StringBuffer;

public class ASTDocTag implements IDocTag
{
	private var comment:ASTDocComment;
	
	private var ast:LinkedListTree;	
	
	public function ASTDocTag(comment:ASTDocComment, ast:LinkedListTree)
	{
		this.comment = comment;
		this.ast = ast;		
	}
	
	public function getAST():LinkedListTree
	{
		return ast;
	}
		
	public function getName():String
	{
		return ast.getStartToken().text.substring(1);
	}
	
	public function setName(value:String):void
	{
		ast.getStartToken().text = "@" + value;
		comment.commitModifiedAST();
	}
	
	public function getBody():String
	{
		var result:StringBuffer = new StringBuffer();
		for (var tok:LinkedListToken=ast.getStartToken().getNext(); 
			tok!=null&&tok.type!=-1; tok=tok.getNext())
		{
			result.append(stringify(tok));
			if (tok == ast.getStopToken())
				break;
		}
		return result.toString();
	}
	

	private static function stringify(tok:LinkedListToken):String
	{
		switch (tok.type)
		{
			case ASDocParser.NL:
				// TODO: use the original line-ending format
				return "\n";
			default:
				return tok.text;
		}
	}
	
	public function setBody(value:String):void
	{
		var lastIndex:int = ast.childCount - 1;
		var indentNL:String = DocumentationUtils.findNewline(ast);
		var trailingNL:LinkedListTree = null;
		
		if (lastIndex >= 0
				&& ast.getChild(lastIndex).type == ASDocParser.NL)
		{
			trailingNL = LinkedListTree(ast.getChild(lastIndex));
		}
		var tag:LinkedListTree = DocumentationUtils.parseParaTag(ast.getFirstChild().text + " " + value);
		// me : kill the EOFs after the stop token
		tag.getStopToken().setNext(null);
		// replace each NL token's text with the indent newline text
		// this effectively adds the correct * text at the line breaks
		replaceNLs(tag, indentNL);

		var asdocAST:LinkedListTree = LinkedListTree(ast.parent);
		var pos:int = asdocAST.getIndexOfChild(ast);
		
		asdocAST.setChildWithTokens(pos, tag);

		if (trailingNL != null)
		{
			tag.addChildWithTokens(trailingNL);
		}
		
		comment.commitModifiedAST();		
	}
	
	private function replaceNLs(tree:LinkedListTree, indentNL:String):void
	{
		for (var tok:LinkedListToken=tree.getStartToken().getNext(); 
			tok!=null&&tok.type!=-1; tok=tok.getNext())
		{
			if (tok.type == ASDocParser.NL)
			{
				tok.text = indentNL;
			}
			if (tok == tree.getStopToken())
			{
				break;
			}
		}
	}	
}
}