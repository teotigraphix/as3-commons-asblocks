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

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASFunctionExpression;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASNullLiteral;
import org.as3commons.asblocks.dom.IASObjectLiteral;
import org.as3commons.asblocks.dom.IASRegexpLiteral;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.dom.IASUndefinedLiteral;
import org.as3commons.asblocks.dom.IASXMLLiteral;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.StringBuffer;

public class ASTLiteralBuilder
{
	public static function newIntegerLiteral(value:int):IASIntegerLiteral
	{
		var ast:LinkedListTree = AS3FragmentParser.parseExpression(value.toString());
		return new ASTASIntegerLiteral(ast);
	}

	public static function newStringLiteral(value:String):IASStringLiteral
	{
		return new ASTASStringLiteral(ASTUtils.newAST(AS3Parser.STRING_LITERAL, ASTUtils.str(value)));
	}

	public static function newNullLiteral():IASNullLiteral
	{
		return new ASTASNullLiteral(ASTUtils.newAST(AS3Parser.NULL, "null"));
	}

	public static function newUndefinedLiteral():IASUndefinedLiteral
	{
		return new ASTASUndefinedLiteral(ASTUtils.newAST(AS3Parser.UNDEFINED, "undefined"));
	}

	public static function newBooleanLiteral(boolean:Boolean):IASBooleanLiteral
	{
		var ast:LinkedListTree = boolean ? ASTUtils.newAST(AS3Parser.TRUE, "true")
										 : ASTUtils.newAST(AS3Parser.FALSE, "false");
		return new ASTASBooleanLiteral(ast);
	}

	public static function newArrayLiteral():IASArrayLiteral
	{
		var ast:LinkedListTree = ASTUtils.newParentheticAST(
			AS3Parser.ARRAY_LITERAL, AS3Parser.LBRACK, "[", AS3Parser.RBRACK, "]");
		return new ASTASArrayLiteral(ast);
	}

	public static function newObjectLiteral():IASObjectLiteral
	{
		var ast:LinkedListTree = newObjectLiteralAST();
		return new ASTASObjectLiteral(ast);
	}

	public static function newObjectLiteralAST():LinkedListTree
	{
		var lit:LinkedListTree = ASTBuilder.newBlock(AS3Parser.OBJECT_LITERAL);
		return lit;
	}

	public static function newObjectFieldAST(name:String,
			value:LinkedListTree):LinkedListTree
	{
		var field:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.OBJECT_FIELD);
		field.addChildWithTokens(AS3FragmentParser.parseSimpleIdent(name));
		field.appendToken(TokenBuilder.newColon());
		field.appendToken(TokenBuilder.newSpace());
		field.addChildWithTokens(value);
		return field;
	}

	public static function newFunctionExpression():IASFunctionExpression
	{
		var ast:LinkedListTree = newFunctionExpressionAST();
		return new ASTASFunctionExpression(ast);
	}

	public static function newXMLLiteral(xml:String):IASXMLLiteral
	{
		var ast:LinkedListTree = AS3FragmentParser.parseExpression(xml);
		return new ASTASXMLLiteral(ast);
	}

	public static function newRegexpLiteral(value:String, flags:int):IASRegexpLiteral
	{
		var flagList:StringBuffer = new StringBuffer();
		if ((flags & ASTASRegexpLiteral.FLAG_DOT_ALL) != 0) {
			flagList.append('s');
		}
		if ((flags & ASTASRegexpLiteral.FLAG_EXTENDED) != 0) {
			flagList.append('x');
		}
		if ((flags & ASTASRegexpLiteral.FLAG_GLOBAL) != 0) {
			flagList.append('g');
		}
		if ((flags & ASTASRegexpLiteral.FLAG_IGNORE_CASE) != 0) {
			flagList.append('i');
		}
		value = regexpEscapeDelimiter(value);
		var ast:LinkedListTree = AS3FragmentParser.parseExpression("/" + value + "/" + flagList.toString());
		return new ASTASRegexpLiteral(ast);
	}

	private static function regexpEscapeDelimiter(value:String):String
	{
		var result:StringBuffer = new StringBuffer();
		for (var i:int = 0; i < value.length; i++)
		{
			var c:String = value.charAt(i);
			switch (c)
			{
				case '/': 
					result.append("\\/");
					break;
				default: 
					result.append(c);
			}
		}
		return result.toString();
	}

	public static function newFunctionExpressionAST():LinkedListTree
	{
		var def:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.FUNC_DEF);
		def.appendToken(TokenBuilder.newFunction());
		def.appendToken(TokenBuilder.newSpace());
		// TODO: placeholder for name?
		def.addChildWithTokens(ASTUtils.newParentheticAST(AS3Parser.PARAMS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")"));
		def.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree = ASTBuilder.newBlock();
		def.addChildWithTokens(block);
		return def;
	}	
}
}