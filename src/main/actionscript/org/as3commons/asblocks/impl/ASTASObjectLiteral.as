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

import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASObjectLiteral;
import org.as3commons.asblocks.dom.IASPropertyField;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASObjectLiteral extends ASTLiteral implements IASObjectLiteral
{

	public function ASTASObjectLiteral(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function getFields():IList
	{
		var fields:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		while (i.hasNext())
		{
			fields.add(buildField(i.next()));
		}
		return fields;
	}
	
	public function newField(name:String, expression:IASExpression):IASPropertyField
	{
		var field:LinkedListTree = ASTLiteralBuilder.newObjectFieldAST(name, toAST(expression));
		var indent:String = ASTUtils.findIndent(ast) + "\t";
		ASTUtils.increaseIndent(field, indent);
		if (ast.childCount > 0)
		{
			ast.appendToken(TokenBuilder.newComma());
		}
		ast.appendToken(TokenBuilder.newNewline());
		ast.addChildWithTokens(field);
		return new ASTASPropertyField(field);
	}

	private function buildField(field:LinkedListTree):ASTASPropertyField
	{
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.OBJECT_FIELD, field.type);
		return new ASTASPropertyField(field);
	}
}
}