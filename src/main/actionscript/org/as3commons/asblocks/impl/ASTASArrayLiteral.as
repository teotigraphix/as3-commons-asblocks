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

import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

/**
 * The <code>IASArrayLiteral</code> implementation.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class ASTASArrayLiteral extends ASTLiteral implements IASArrayLiteral
{
	//--------------------------------------------------------------------------
	//
	//  IASArrayLiteral API :: Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  entries
	//----------------------------------
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASArrayLiteral#entries
	 */
	public function getEntries():IList
	{
		var result:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(ast);
		while (i.hasNext())
		{
			result.add(ExpressionBuilder.build(i.next()));
		}
		return result;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor.
	 */
	public function ASTASArrayLiteral(ast:LinkedListTree)
	{
		super(ast);
	}
	
	//--------------------------------------------------------------------------
	//
	//  IASArrayLiteral API :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASArrayLiteral#add()
	 */
	public function add(expression:IASExpression):void
	{
		if (ast.childCount > 0)
		{
			ast.appendToken(TokenBuilder.newComma());
			ast.appendToken(TokenBuilder.newSpace());
		}
		ast.addChildWithTokens(toAST(expression));		
	}
	
	/**
	 * @copy org.as3commons.asblocks.dom.IASArrayLiteral#add()
	 */
	public function remove(index:int):IASExpression
	{
		var old:LinkedListTree = LinkedListTree(ast.getChild(index));
		if (ast.childCount - 1 > index)
		{
			ASTUtils.removeTrailingWhitespaceAndComma(old.getStopToken());
		}
		else if (index > 0)
		{
			ASTUtils.removePreceedingWhitespaceAndComma(old.getStartToken());
		}
		ast.deleteChild(index);
		return ExpressionBuilder.build(old);
	}
}
}