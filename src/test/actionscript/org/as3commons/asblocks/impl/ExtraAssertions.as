package org.as3commons.asblocks.impl
{
import flash.utils.getQualifiedClassName;

import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertTrue;

public class ExtraAssertions
{
	public static function assertInstanceof(instance:Object, type:Class):void
	{
		assertTrue("expected an instance of <" + getQualifiedClassName(type) + 
			">, but got <" + getQualifiedClassName(instance) + ">", instance is type);
	}
	
	public static function assertLength(length:int, list:Array):void
	{
		assertEquals(length, list.length);
	}
	
	public static function assertSize(size:int, list:IList):void
	{
		assertEquals(size, list.size);
	}
	
	public static function assertBothEquals(arg0:IScriptElement, arg1:IScriptElement):void
	{
		assertEquals(ASTScriptElement(arg0).toString(), ASTScriptElement(arg1).toString());
	}	
}
}