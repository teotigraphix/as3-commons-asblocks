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

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTBuilder
{
	public static function assertNoParent(astDescription:String, ast:LinkedListTree):void
	{
		if (ast.parent != null) {
			throw new ASBlocksSyntaxError(astDescription + " cannot be added to a second parent node");
		}
	}
	
	public static function newMetadataTag(name:String):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newParentheticAST(AS3Parser.METATAG,
		                                                AS3Parser.LBRACK, "[",
		                                                AS3Parser.RBRACK, "]");
		ast.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		return ast;
	}
	
	public static function newTypeBlock():LinkedListTree
	{
		return newBlock(AS3Parser.TYPE_BLOCK);
	}

	public static function newBlock(type:int = int.MAX_VALUE):LinkedListTree
	{
		if (type == int.MAX_VALUE)
		{
			return newBlock(AS3Parser.BLOCK);
		}
		var ast:LinkedListTree = ASTUtils.newParentheticAST(type, AS3Parser.LBRACE, "{", AS3Parser.RBRACE, "}");
		var nl:LinkedListToken = TokenBuilder.newNewline();
		ast.getInitialInsertionAfter().appendToken(nl);
		ast.setInitialInsertionAfter(nl);
		return ast;
	}

	public static function parenthise(expr:LinkedListTree):LinkedListTree
	{
		var result:LinkedListTree = ASTUtils.newParentheticAST(
			AS3Parser.ENCPS_EXPR, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		result.addChildWithTokens(expr);
		return result;
	}
	
	public static function precidence(ast:LinkedListTree):int
	{
		switch (ast.type) 
		{
			case AS3Parser.ASSIGN:
			case AS3Parser.STAR_ASSIGN:
			case AS3Parser.DIV_ASSIGN:
			case AS3Parser.MOD_ASSIGN:
			case AS3Parser.PLUS_ASSIGN:
			case AS3Parser.MINUS_ASSIGN:
			case AS3Parser.SL_ASSIGN:
			case AS3Parser.SR_ASSIGN:
			case AS3Parser.BSR_ASSIGN:
			case AS3Parser.BAND_ASSIGN:
			case AS3Parser.BXOR_ASSIGN:
			case AS3Parser.BOR_ASSIGN:
			case AS3Parser.LAND_ASSIGN:
			case AS3Parser.LOR_ASSIGN:
				return 13;
			case AS3Parser.QUESTION:
				return 12;
			case AS3Parser.LOR:
				return 11;
			case AS3Parser.LAND:
				return 10;
			case AS3Parser.BOR:
				return 9;
			case AS3Parser.BXOR:
				return 8;
			case AS3Parser.BAND:
				return 7;
			case AS3Parser.STRICT_EQUAL:
			case AS3Parser.STRICT_NOT_EQUAL:
			case AS3Parser.NOT_EQUAL:
			case AS3Parser.EQUAL:
				return 6;
			case AS3Parser.IN:
			case AS3Parser.LT:
			case AS3Parser.GT:
			case AS3Parser.LE:
			case AS3Parser.GE:
			case AS3Parser.IS:
			case AS3Parser.AS:
			case AS3Parser.INSTANCEOF:
				return 5;
			case AS3Parser.SL:
			case AS3Parser.SR:
			case AS3Parser.BSR:
				return 4;
			case AS3Parser.PLUS:
			case AS3Parser.MINUS:
				return 3;
			case AS3Parser.STAR:
			case AS3Parser.DIV:
			case AS3Parser.MOD:
				return 2;
			default:
				return 1;
		}
	}
	
	public static function spaceEitherSide(token:LinkedListToken):void
	{
		token.prependToken(TokenBuilder.newSpace());
		token.appendToken(TokenBuilder.newSpace());
	}
	
	/*
	public static LinkedListTree dup(LinkedListTree ast)
	{
		Map<LinkedListToken, LinkedListToken> tokens = dupTokStream(ast);
		return dupTree(ast, tokens);
	}

	@SuppressWarnings("deprecation")
	private static LinkedListTree dupTree(LinkedListTree ast,
			Map<LinkedListToken, LinkedListToken> tokens)
	{
		LinkedListToken newTok = (LinkedListToken) tokens.get(ast.getToken());
		LinkedListTree result = new LinkedListTree(newTok);
		result.setStartToken((LinkedListToken) tokens.get(ast.getStartToken()));
		result.setStopToken((LinkedListToken) tokens.get(ast.getStopToken()));
		result.setTokenListUpdater(ast.getTokenListUpdater());
		result.setInitialInsertionAfter(ast.getInitialInsertionAfter());
		result.setInitialInsertionBefore(ast.getInitialInsertionBefore());
		for (ASTIterator i = new ASTIterator(ast); i.hasNext();)
		{
			LinkedListTree newChild = dupTree(i.next(), tokens);
			result.addChild(newChild);
		}
		return result;
	}

	private static Map<LinkedListToken, LinkedListToken> dupTokStream(
			LinkedListTree ast)
	{
		Map<LinkedListToken, LinkedListToken> tokens = new HashMap<LinkedListToken, LinkedListToken>();
		LinkedListToken last = null;
		for (LinkedListToken tok = ast.getStartToken(); tok != null
				&& tok.getType() != -1; tok = tok.getNext())
		{
			LinkedListToken newTok = dupTok(tok);
			tokens.put(tok, newTok);
			if (last != null)
			{
				last.setNext(newTok);
			}
			if (tok == ast.getStopToken())
			{
				break;
			}
			last = newTok;
		}
		return tokens;
	}

	private static LinkedListToken dupTok(LinkedListToken tok)
	{
		LinkedListToken result;
		if (tok instanceof PlaceholderLinkedListToken)
		{
			result = new PlaceholderLinkedListToken(
					((PlaceholderLinkedListToken) tok).getHeld());
		}
		else
		{
			result = new LinkedListToken(tok.getType(), tok.getText());
		}
		result.setChannel(tok.getChannel());
		result.setCharPositionInLine(tok.getCharPositionInLine());
		result.setLine(tok.getLine());
		return result;
	}
	*/
}
}