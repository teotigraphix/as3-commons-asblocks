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

import org.as3commons.asblocks.dom.IASLiteral;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

/**
 * The <code>IASLiteral</code> implementation.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class ASTLiteral extends ASTExpression implements IASLiteral
{
	public function ASTLiteral(ast:LinkedListTree)
	{
		super(ast);
	}

	//----------------------------------
	//  tokenText
	//----------------------------------

	/**
	 * @private
	 */
	protected function getLiteralNode():LinkedListTree
	{
		return ast;
	}

	protected function getTokenText():String
	{
		return ast.getText();
	}

	protected function setTokenText(text:String):void
	{
		ast.getToken().text = text;
	}
}
}