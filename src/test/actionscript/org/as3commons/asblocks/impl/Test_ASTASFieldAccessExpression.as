package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

public class Test_ASTASFieldAccessExpression
{
	private var fact:ASFactory = new ASFactory();
	
	[Test]
	public function test_basic():void
	{
		var target:IASExpression = fact.newExpression("f()");
		var name:String = "foo";
		var expr:IASFieldAccessExpression = fact.newFieldAccessExpression(target, name);
		assertNotNull(expr);
		ExtraAssertions.assertInstanceof(expr.getTarget(), IASInvocationExpression);
		assertEquals(name, expr.getName());

		// test setters,
		expr.setName("bar");
		expr.setTarget(fact.newExpression("f[1]"));
		ExtraAssertions.assertInstanceof(expr.getTarget(), IASArrayAccessExpression);
		assertEquals("bar", expr.getName());
	}
}
}