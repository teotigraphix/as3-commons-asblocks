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

import org.antlr.runtime.NoViableAltException;
import org.antlr.runtime.RecognitionException;
import org.as3commons.asblocks.IASParser;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTASParser implements IASParser
{
	public function ASTASParser()
	{
	}
	
	public function parse(source:String):IASCompilationUnit
	{
		var parser:AS3Parser = ASTUtils.parse(source);
		var ast:LinkedListTree;
		try {
			ast = AS3FragmentParser.tree(parser.compilationUnit());
		} catch (e:RecognitionException) {
			throw ASTUtils.buildSyntaxException(null, parser, e);
		}		
		return new ASTASCompilationUnit(ast);
	}
	
	public function parseIn(reader:IReader):IASCompilationUnit
	{
		return null;
	}
	
	public function parseHighlevel(source:String):IASCompilationUnit
	{
		var parser:AS3Parser = ASTUtils.parse(source);
		parser.setHighlevelParse(true);
		var ast:LinkedListTree;
		try {
			ast = AS3FragmentParser.tree(parser.compilationUnit());
		} catch (e:RecognitionException) {
			throw ASTUtils.buildSyntaxException(null, parser, e);
		} finally {
			parser.setHighlevelParse(false);
		}
		return new ASTASCompilationUnit(ast);
	}
	
	public function parseHighlevelIn(reader:IReader):IASCompilationUnit
	{
		return null;
	}
}
}