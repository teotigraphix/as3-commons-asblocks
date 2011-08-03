package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.Map;
import org.as3commons.collections.framework.IList;
import org.as3commons.collections.framework.IMap;
import org.as3commons.lang.IllegalArgumentError;

public class ModifierUtils
{
	private static var modinfoByTokenType:IMap = new Map();
	private static var modinfoByVisibility:IMap = new Map();	
	
	{
		mapMod(AS3Parser.PRIVATE, Visibility.PRIVATE, "private");
		mapMod(AS3Parser.PUBLIC, Visibility.PUBLIC, "public");
		mapMod(AS3Parser.PROTECTED, Visibility.PROTECTED, "protected");
		mapMod(AS3Parser.INTERNAL, Visibility.INTERNAL, "internal");
		mapMod(AS3Parser.NAMESPACE, Visibility.NAMESPACE, null);
		mapMod(int.MIN_VALUE, Visibility.DEFAULT, null);
	}
	
	private static function mapMod(tokenType:int, vis:Visibility, keyword:String):void
	{
		var inf:ModifierInfo = new ModifierInfo(tokenType, vis, keyword);
		modinfoByTokenType.add(tokenType, inf);
		modinfoByVisibility.add(vis, inf);
	}	
	
	private static function getModInfo(tokenType:int):ModifierInfo
	{
		return modinfoByTokenType.itemFor(tokenType);
	}
	
	private static function getModInfoByVis(vis:Visibility):ModifierInfo
	{
		var result:ModifierInfo = modinfoByVisibility.itemFor(vis);
		if (result == null)
		{
			throw new IllegalArgumentError("unknown kind of visibility: " + vis);
		}
		return result;
	}
	
	public static function getVisibility(modifiers:LinkedListTree):Visibility
	{
		if (modifiers == null)
			return Visibility.DEFAULT;
		
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext(); )
		{
			var mod:LinkedListTree = i.next();
			var modInfo:ModifierInfo = getModInfo(mod.type);
			if (modInfo != null)
				return modInfo.vis;
		}
		return Visibility.DEFAULT;
	}

	private static function hasModifierFlag(modifiers:LinkedListTree, type:int):Boolean
	{
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext(); ) 
		{
			var mod:LinkedListTree = i.next();
			if (mod.type == type)
				return true;
		}
		return false;
	}
	
	public static function hasModifier(modifiers:LinkedListTree, modifier:String):Boolean
	{
		if (modifiers == null)
			return false;
		
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext();)
		{
			var mod:LinkedListTree = i.next();
			if (mod.getText() == modifier)
				return true;
		}
		return false;
	}
	
	public static function getModifiers(modifiers:LinkedListTree):IList
	{
		if (modifiers == null)
			return null;
		var result:IList = new ArrayList();
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext();)
		{
			var mod:LinkedListTree = i.next();
			result.add(mod.getText());
		}
		return result;
	}
	
	public static function isDynamic(modifiers:LinkedListTree):Boolean
	{
		return hasModifierFlag(modifiers, AS3Parser.DYNAMIC);
	}

	public static function isOverride(modifiers:LinkedListTree):Boolean
	{
		return hasModifierFlag(modifiers, AS3Parser.OVERRIDE);
	}

	public static function isFinal(modifiers:LinkedListTree):Boolean
	{
		return hasModifierFlag(modifiers, AS3Parser.FINAL);
	}

	public static function setDynamic(modifiers:LinkedListTree, value:Boolean):void
	{
		setModifierFlag(modifiers, value, AS3Parser.DYNAMIC, "dynamic");
	}

	public static function setOverride(modifiers:LinkedListTree, value:Boolean):void
	{
		setModifierFlag(modifiers, value, AS3Parser.OVERRIDE, "override");
	}

	public static function setFinal(modifiers:LinkedListTree, value:Boolean):void
	{
		setModifierFlag(modifiers, value, AS3Parser.FINAL, "final");
	}

	private static function setModifierFlag(modifiers:LinkedListTree, 
											flag:Boolean, 
											type:int, 
											text:String):void
	{
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext(); )
		{
			var mod:LinkedListTree = i.next();
			if (mod.type == type)
			{
				if (flag) 
					return;
				else 
				{
					i.remove();
					if (modifiers.childCount == 0)
					{
						deleteAllChildTokens(modifiers);
					}
				}
				return;
			}
		}
		if (flag)
		{
			var node:LinkedListTree = ASTUtils.newAST(type, text);
			node.appendToken(TokenBuilder.newSpace());
			modifiers.addChildWithTokens(node);
		}
	}
	
	public static function setVisibility(modifiers:LinkedListTree, protection:Visibility):void
	{
		var modInfo:ModifierInfo = getModInfoByVis(protection);
		removeNamespace(modifiers);
		for (var i:ASTIterator = new ASTIterator(modifiers); i.hasNext(); )
		{
			var mod:LinkedListTree = i.next();
			if (isVisibilityKeyword(mod))
			{
				if (modInfo.keyword == null)
				{
					i.remove();
					if (modifiers.childCount == 0)
					{
						deleteAllChildTokens(modifiers);
					}
				} 
				else
				{
					mod.token.type = modInfo.tokenType;
					mod.token.text = modInfo.keyword;
				}
				return;
			}
		}
		var modifier:LinkedListTree = ASTUtils.newAST(modInfo.tokenType, modInfo.keyword);
		modifier.appendToken(TokenBuilder.newSpace());
		modifiers.addChildWithTokens(modifier);
	}
	
	private static function removeNamespace(modifiers:LinkedListTree):void
	{
		var ast:LinkedListTree = ASTUtils.findChildByType(modifiers, AS3Parser.IDENT);
		if (ast != null)
		{
			modifiers.deleteChild(modifiers.getIndexOfChild(ast));
		}
	}	
	
	private static function isVisibilityKeyword(mod:LinkedListTree):Boolean
	{
		return getModInfo(mod.type) != null;
	}

	private static function deleteAllChildTokens(modifiers:LinkedListTree):void
	{
		for (var tok:LinkedListToken = modifiers.getStartToken(); tok!=null && tok!=modifiers.getStopToken(); )
		{
			var next:LinkedListToken = tok.getNext();
			tok.deleteToken();
			tok = next;
		}
		modifiers.setStartToken(null);
		modifiers.setStopToken(null);
	}
	

	/**
	 * Constructs a new MODIFIERS node which represents the given
	 * visibility as an AST containing either "public", "private",
	 * "protected", "internal" or no children (i.e. default visibility).
	 */
	public static function toModifiers(visibility:Visibility):LinkedListTree
	{
		if (Visibility.DEFAULT.equals(visibility)) {
			return ASTUtils.newPlaceholderAST(AS3Parser.MODIFIERS);
		}
		var modifiers:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.MODIFIERS);
		var modInfo:ModifierInfo = getModInfoByVis(visibility);
		var mod:LinkedListTree = ASTUtils.newAST(modInfo.tokenType, modInfo.keyword);
		mod.appendToken(TokenBuilder.newSpace());
		modifiers.addChildWithTokens(mod);
		return modifiers;
	}
	
	
	public static function setNamespace(modifiers:LinkedListTree, name:String):void
	{
		// Special, cannot be PUBLIC, PROTECTED, PRIVATE or INTERNAL
		setVisibility(modifiers, Visibility.DEFAULT);
		setModifierFlag(modifiers, true, AS3Parser.IDENT, name);
	}

	public static function getNamespace(modifiers:LinkedListTree):String
	{
		var ast:LinkedListTree = ASTUtils.findChildByType(modifiers, AS3Parser.IDENT);
		if (ast == null)
			return null;
		return ast.getText();
	}
}
}