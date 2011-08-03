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

import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASConditionalExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.as3commons.asblocks.dom.IASNewExpression;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.IASSimpleNameExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.framework.IList;

public class ASTExpressionBuilder
{

	private static function stringifyArgs(args:IList):String
	{
		var result:String = "";
		var i:int = 0;
		for each(var expression:IASExpression in args.toArray())
		{
			result += ASTUtils.stringifyNode(ASTUtils.ast(expression));
			if (i < args.size - 1)
			{
				result += ",";
			}
			i++;
		}
		return result;
	}

	public static function newNewExpression(target:IASExpression,
			arguments:IList = null):IASNewExpression
	{
		var subExpr:LinkedListTree = ASTUtils.ast(target);

		var tarStr:String = ASTUtils.stringifyNode(subExpr);
		var argStr:String = "";
		if (arguments != null)
		{
			argStr = "(" + stringifyArgs(arguments) + ")";
		}

		var ast:LinkedListTree = AS3FragmentParser.parseExpression("new " + tarStr
				+ argStr);

		var result:ASTASNewExpression = new ASTASNewExpression(ast);
		if (arguments != null)
		{
			//			result.setArguments(arguments);
		}

		return result;
		/*
		LinkedListTree ast = ASTUtils.newAST(AS3Parser.NEW, "new");
		ast.appendToken(TokenBuilder.newSpace());
		
		ASTBuilder.assertNoParent("sub-expression", subExpr);
		// TODO: recursively check the given subexpression
		ast.addChildWithTokens(subExpr);
		LinkedListTree args = ASTUtils.newParentheticAST(AS3Parser.ARGUMENTS,
				AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		ASTASNewExpression result = new ASTASNewExpression(ast);
		result.setArguments(arguments);
		*/

	}

	public static function newArrayAccessExpression(
			target:IASExpression, subscript:IASExpression):IASArrayAccessExpression
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.ARRAY_ACCESS);
		var targetExpr:LinkedListTree = ASTUtils.ast(target);
		ASTBuilder.assertNoParent("target expression", targetExpr);
		// TODO: recursively check the given subexpression
		ast.addChildWithTokens(targetExpr);
		ast.appendToken(TokenBuilder.newLBrack());
		var subscriptExpr:LinkedListTree = ASTUtils.ast(subscript);
		ASTBuilder.assertNoParent("subscript expression", subscriptExpr);
		ast.addChildWithTokens(subscriptExpr);
		ast.appendToken(TokenBuilder.newRBrack());
		var result:ASTASArrayAccessExpression = new ASTASArrayAccessExpression(ast);
		return result;
	}

	public static function newFieldAccessExpression(
			target:IASExpression, name:String):IASFieldAccessExpression
	{
		var ast:LinkedListTree = newFieldAccessExpressionAST(ASTUtils.ast(target), 
			ASTUtils.newAST(AS3Parser.IDENT, name));
		return new ASTASFieldAccessExpression(ast);
	}
	
	public static function newFieldAccessExpressionAST(
			target:LinkedListTree, name:LinkedListTree):LinkedListTree
	{
		var op:LinkedListToken = TokenBuilder.newDot();
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		ASTBuilder.assertNoParent("target expression", target);
		// don't use addChildWithTokens(); special handling below,
		ast.addChild(target);
		ast.addChild(name);
		target.getStopToken().setNext(op);
		name.getStartToken().setPrev(op);
		ast.setStartToken(target.getStartToken());
		ast.setStopToken(name.getStopToken());
		return ast;
	}

	public static function newExpression(expression:String):IASExpression
	{
		var ast:LinkedListTree = AS3FragmentParser.parseExpression(expression);
		// ANTLR creates a 'nil' parent node (in case the result is a
		// list).  We break the link to that parent because we assert
		// the parent is null when child nodes are attached elsewhere
		// in the tree.		
		ast.parent = null;
		return ExpressionBuilder.build(ast);
	}

	public static function newSimpleNameExpression(name:String):IASSimpleNameExpression
	{
		var ast:LinkedListTree = AS3FragmentParser.parseExpression(name);
		return new ASTASSimpleNameExpression(ast);
	}

	public static function newPrefixExpression(op:LinkedListToken,
			sub:IASExpression):IASPrefixExpression
	{
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		var subExpr:LinkedListTree = ASTUtils.ast(sub);
		ASTBuilder.assertNoParent("sub-expression", subExpr);
		ast.addChildWithTokens(subExpr);
		return new ASTASPrefixExpression(ast);
	}
	
	public static function newPostfixExpression(op:LinkedListToken,
			sub:IASExpression):IASPostfixExpression
	{
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		var subExpr:LinkedListTree = ASTUtils.ast(sub);
		ASTBuilder.assertNoParent("sub-expression", subExpr);
		ast.addChild(subExpr);
		ast.setStartToken(subExpr.getStartToken());
		subExpr.getStopToken().setNext(op);
		return new ASTASPostfixExpression(ast);
	}

	public static function newInvocationExpression(
			target:IASExpression, arguments:IList):IASInvocationExpression
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.FUNCTION_CALL);
		var subExpr:LinkedListTree = ASTUtils.ast(target);
		ASTBuilder.assertNoParent("sub-expression", subExpr);
		// TODO: recursively check the given subexpression
		ast.addChildWithTokens(subExpr);
		var args:LinkedListTree = ASTUtils.newParentheticAST(AS3Parser.ARGUMENTS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")");
		ast.addChildWithTokens(args);
		var result:ASTASInvocationExpression = new ASTASInvocationExpression(ast);
		result.setArguments(arguments);
		return result;
	}
	
	public static function newAssignExpression(
			op:LinkedListToken, left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		var leftExpr:LinkedListTree = ASTUtils.ast(left);
		ASTBuilder.assertNoParent("left-hand expression", leftExpr);
		var rightExpr:LinkedListTree = ASTUtils.ast(right);
		if (ASTBuilder.precidence(ast) < ASTBuilder.precidence(leftExpr))
		{
			leftExpr = ASTBuilder.parenthise(leftExpr);
		}
		if (ASTBuilder.precidence(ast) < ASTBuilder.precidence(rightExpr))
		{
			rightExpr = ASTBuilder.parenthise(rightExpr);
		}
		// don't use addChildWithTokens(); special handling below,
		ast.addChild(leftExpr);
		ast.addChild(rightExpr);
		leftExpr.getStopToken().setNext(op);
		rightExpr.getStartToken().setPrev(op);
		ast.setStartToken(leftExpr.getStartToken());
		ast.setStopToken(rightExpr.getStopToken());
		ASTBuilder.spaceEitherSide(op);
		return new ASTASAssignmentExpression(ast);
	}
	
	public static function newBinaryExpression(op:LinkedListToken,
			left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		var leftExpr:LinkedListTree = ASTUtils.ast(left);
		ASTBuilder.assertNoParent("left-hand expression", leftExpr);
		var rightExpr:LinkedListTree = ASTUtils.ast(right);
		if (ASTBuilder.precidence(ast) < ASTBuilder.precidence(leftExpr))
		{
			leftExpr = ASTBuilder.parenthise(leftExpr);
		}
		if (ASTBuilder.precidence(ast) < ASTBuilder.precidence(rightExpr))
		{
			rightExpr = ASTBuilder.parenthise(rightExpr);
		}
		// don't use addChildWithTokens(); special handling below,
		ast.addChild(leftExpr);
		ast.addChild(rightExpr);
		leftExpr.getStopToken().setNext(op);
		rightExpr.getStartToken().setPrev(op);
		ast.setStartToken(leftExpr.getStartToken());
		ast.setStopToken(rightExpr.getStopToken());
		ASTBuilder.spaceEitherSide(op);
		return new ASTASBinaryExpression(ast);
	}
	
	public static function newConditionalExpression(
			conditionExpression:IASExpression, thenExpression:IASExpression,
			elseExpression:IASExpression):IASConditionalExpression
	{
		var conditionExpr:LinkedListTree = ASTUtils.ast(conditionExpression);
		var thenExpr:LinkedListTree = ASTUtils.ast(thenExpression);
		var elseExpr:LinkedListTree = ASTUtils.ast(elseExpression);

		var op:LinkedListToken = TokenBuilder.newQuestion();
		var colon:LinkedListToken = TokenBuilder.newColon();
		var ast:LinkedListTree = ASTUtils.newASTFromToken(op);
		// don't use addChildWithTokens(); special handling below,
		ast.addChild(conditionExpr);
		conditionExpr.getStopToken().setNext(op);
		ast.addChild(thenExpr);
		thenExpr.getStartToken().setPrev(op);
		thenExpr.getStopToken().setNext(colon);
		ast.addChild(elseExpr);
		elseExpr.getStartToken().setPrev(colon);
		ast.setStartToken(conditionExpr.getStartToken());
		ast.setStopToken(elseExpr.getStopToken());
		ASTBuilder.spaceEitherSide(op);
		ASTBuilder.spaceEitherSide(colon);
		return new ASTASConditionalExpression(ast);
	}
}
}