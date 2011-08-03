package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IList;

public class ASTASClassType extends ASTASType implements IASClassType
{
	private static const EXTENDS_INDEX:int = 2;
	
	public function ASTASClassType(ast:LinkedListTree)
	{
		super(ast);
	}
		
	override public function isSubType():Boolean
	{
		return getSuperClass() != null;
	}
	
	public function isDynamic():Boolean
	{
		return ModifierUtils.isDynamic(findModifiers());
	}
	
	public function setDynamic(value:Boolean):void
	{
		ModifierUtils.setDynamic(findModifiers(), value);
	}
	
	public function isFinal():Boolean
	{
		return ModifierUtils.isFinal(findModifiers());
	}
	
	public function setFinal(value:Boolean):void
	{
		ModifierUtils.setFinal(findModifiers(), value);
	}
	
	public function getSuperClass():String
	{
		var ext:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.EXTENDS);
		if (ext == null) return null;
		return ASTUtils.typeText(ext.getFirstChild());
	}
	
	public function setSuperClass(value:String):void
	{
		if (value == null)
		{
			removeExtendsClause();
			return;
		}
		var extendsAST:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.EXTENDS);
		var superType:LinkedListTree = AS3FragmentParser.parseType(value);
		if (extendsAST == null)
		{
			extendsAST = ASTUtils.newAST(AS3Parser.EXTENDS, "extends");
			// add the space in front of the 'extends' keyword
			extendsAST.appendToken(TokenBuilder.newSpace());

			var spaceTok:LinkedListToken = TokenBuilder.newSpace();

			extendsAST.getStartToken().prependToken(spaceTok);
			// reset the extends start token to the space so that when the
			// key word is removed, the space dies with it
			extendsAST.setStartToken(spaceTok);
			// add the extends node to the CLASS_DEF node
			ast.addChildAtWithTokens(EXTENDS_INDEX, extendsAST);
			extendsAST.addChildWithTokens(superType);
			// add a space after the identifier, this automatically gets
			// set as the nodes stop token, dies with it
			//extendsAST.appendToken(TokenBuilder.newSpace());
		}
		else
		{
			// replace the existing type node
			extendsAST.setChildWithTokens(0, superType);
		}	
	}
	
	public function getImplementedInterfaces():IList // <String>
	{
		var results:IList = new ArrayList();
		var impls:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.IMPLEMENTS);
		if (impls != null)
		{
			for (var i:ASTIterator = new ASTIterator(impls); i.hasNext();)
			{
				results.add(ASTUtils.typeText(i.next()));
			}
		}
		return results;
	}
			
	public function hasImplementations():Boolean
	{
		return ASTUtils.findChildByType(ast, AS3Parser.IMPLEMENTS) != null;
	}
	
	public function addImplementedInterface(name:String):Boolean
	{
		var iface:LinkedListTree = AS3FragmentParser.parseType(name);
		var impls:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.IMPLEMENTS);
		if (impls == null)
		{
			var i:ASTIterator = new ASTIterator(ast);
			i.find(AS3Parser.TYPE_BLOCK);
			impls = ASTUtils.newAST(AS3Parser.IMPLEMENTS, "implements");
			i.insertBeforeCurrent(impls);
			var sp:LinkedListToken = TokenBuilder.newSpace();
			impls.getStartToken().prependToken(sp);
		}
		else
		{
			impls.appendToken(TokenBuilder.newComma());
		}
		impls.appendToken(TokenBuilder.newSpace());
		impls.addChildWithTokens(iface);
		return true;
	}
	
	public function removeImplementedInterface(name:String):Boolean
	{
		var impls:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.IMPLEMENTS);
		var count:int = 0;
		for (var i:ASTIterator = new ASTIterator(impls); i.hasNext();)
		{
			var iface:LinkedListTree = i.next();
			var interfaceName:String = ASTUtils.typeText(iface);
			if (name == interfaceName)
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
	
	public function getMethods():IList // <IASMethod>
	{
		return MethodAwareUtils.getMethods(ast);
	}
	
	public function newMethod(name:String, visibility:Visibility = null, returnType:String = null):IASMethod
	{
		if (visibility == null)
		{
			visibility =Visibility.DEFAULT;
		}
		var method:IASMethod = ASTTypeBuilder.newClassMethod(name, visibility, returnType);
		addMethod(method);
		return method;
	}
	
	public function addMethod(method:IASMethod):void
	{
		ASTUtils.addChildWithIndentation(findTypeBlock(), ASTScriptElement(method).getAST());
	}
	
	public function getMethod(name:String):IASMethod
	{
		return MethodAwareUtils.getMethod(ast, name);
	}
	
	public function removeMethod(name:String):IASMethod
	{
		return MethodAwareUtils.removeMethod(ast, name);
	}
	
	public function getFields():IList // <IASField>
	{
		var results:IList = new ArrayList();
		for (var i:ASTIterator = blockIterator(); i.hasNext(); )
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.FIELD_DEF)
			{
				results.add(new ASTASField(member));
			}
		}
		return results;
	}
	
	public function newField(name:String, visibility:Visibility = null, type:String = null):IASField
	{
		if (visibility == null)
		{
			visibility = Visibility.DEFAULT;
		}
		var field:ASTASField = ASTTypeBuilder.newField(name, visibility, type) as ASTASField;
		addField(field);
		return field;
	}
	
	public function addField(field:ASTASField):void
	{
		ASTUtils.addChildWithIndentation(findTypeBlock(), field.getAST());
	}
	
	public function getField(name:String):IASField
	{
		for (var i:ASTIterator = blockIterator(); i.hasNext(); )
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.FIELD_DEF)
			{
				var field:IASField = new ASTASField(member);
				if (field.getName() == name)
					return field;
			}
		}
		return null;
	}
	
	public function removeField(name:String):IASField
	{
		for (var i:ASTIterator = blockIterator(); i.hasNext(); )
		{
			var member:LinkedListTree = i.next();
			if (member.type == AS3Parser.FIELD_DEF)
			{
				var field:IASField = new ASTASField(member);
				if (field.getName() == name)
				{
					i.remove();
					return field;
				}
			}
		}
		return null;
	}
	
	private function removeExtendsClause():void
	{
		for (var i:ASTIterator = new ASTIterator(ast); i.hasNext(); )
		{
			var node:LinkedListTree = i.next();
			if (node.type == AS3Parser.EXTENDS)
			{
				i.remove();
				break;
			}
		}
	}
}
}