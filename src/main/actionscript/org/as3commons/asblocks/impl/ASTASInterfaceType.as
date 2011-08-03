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

import org.as3commons.asblocks.dom.IASInterfaceType;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASInterfaceType extends ASTASType implements IASInterfaceType
{
	private static const EXTENDS_INDEX:int = 2;
	
	public function ASTASInterfaceType(ast:LinkedListTree)
	{
		super(ast);
	}
	
	override public function isSubType():Boolean
	{
		return getSuperInterfaces().size > 0;
	}

	public function getMethods():IList // <IASMethod>
	{
		return MethodAwareUtils.getMethods(ast);
	}
	
	public function newMethod(name:String, visibility:Visibility = null, returnType:String = null):IASMethod
	{
		if (visibility == null)
		{
			visibility = Visibility.DEFAULT;
		}
		var meth:ASTASMethod = ASTTypeBuilder.newInterfaceMethod(name, visibility, returnType) as ASTASMethod;
		addMethod(meth);
		return meth;
	}
		
	public function addMethod(meth:ASTASMethod):void
	{
		ASTUtils.addChildWithIndentation(findTypeBlock(), meth.getAST());
	}
	
	public function getMethod(name:String):IASMethod
	{
		return MethodAwareUtils.getMethod(ast, name);
	}
	
	public function removeMethod(name:String):IASMethod
	{
		return MethodAwareUtils.removeMethod(ast, name);
	}
	
	public function getSuperInterfaces():IList
	{
		var results:IList = new ArrayList();
		var impls:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.EXTENDS);
		if (impls != null) {
			for (var i:ASTIterator = new ASTIterator(impls); i.hasNext(); )
			{
				results.add(ASTUtils.typeText(i.next()));
			}
		}
		return results;
	}
	
	public function addSuperInterface(name:String):Boolean
	{
		var iface:LinkedListTree = AS3FragmentParser.parseType(name);
		var ext:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.EXTENDS);
		if (ext == null)
		{
			ext = ASTUtils.newAST(AS3Parser.EXTENDS, "extends");
			//ext.appendToken(TokenBuilder.newSpace());
			// hack a space in at the right point,
			var sp:LinkedListToken = TokenBuilder.newSpace();
			ext.getStartToken().prependToken(sp);
			ext.setStartToken(sp);
			ast.addChildAtWithTokens(EXTENDS_INDEX, ext);
		} 
		else
		{
			ext.appendToken(TokenBuilder.newComma());
		}
		ext.appendToken(TokenBuilder.newSpace());
		ext.addChildWithTokens(iface);
		return true;
	}
	
	public function removeSuperInterface(iname:String):Boolean
	{
		var impls:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.EXTENDS);
		var count:int = 0;
		for (var i:ASTIterator = new ASTIterator(impls); i.hasNext(); )
		{
			var iface:LinkedListTree = i.next();
			var name:String = ASTUtils.typeText(iface);
			if (name == iname)
			{
				if (i.hasNext())
				{
					ASTUtils.removeTrailingWhitespaceAndComma(iface.getStopToken());
				}
				else if (count == 0)
				{
					// no interfaces left, so remove the
					// 'implements' clause completely,
					ast.deleteChild(ast.getIndexOfChild(impls));
					break;
				}
				i.remove();
				if (i.hasNext())
				{
					count++;
				}
				break;
			}
			count++;
		}
		return true;
	}
}
}