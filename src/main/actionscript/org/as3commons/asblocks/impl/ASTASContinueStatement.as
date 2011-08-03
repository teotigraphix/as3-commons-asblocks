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
import org.as3commons.asblocks.dom.IASContinueStatement;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASContinueStatement extends ASTScriptElement implements IASContinueStatement
{
	public function ASTASContinueStatement(ast:LinkedListTree)
	{
		super(ast);
	}
	
	public function setLabel(value:String):void
	{
		var child:LinkedListTree = ast.getFirstChild();
		if (value == null && child != null)
		{
			ast.deleteChild(0);
			return;
		}
		//LinkedListTree echild = ASTUtils.ast(value);
		if (child != null)
		{
			//ast.setChildWithTokens(0, echild);
		}
		else
		{
			//LinkedListToken stop = ast.getStopToken(); //SEMI
			//ast.addChildWithTokens(echild);
			//echild.setStartToken(stop.getPrev());
			//echild.setStopToken(stop);
		}		
	}
	
	public function getLabel():String
	{
		var child:LinkedListTree = ast.getFirstChild();
		if (child != null)
			return ASTUtils.identText(child);
		return null;
	}
}
}