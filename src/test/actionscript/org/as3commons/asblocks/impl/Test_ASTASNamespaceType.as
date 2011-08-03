package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASNamespaceType;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.fail;

public class Test_ASTASNamespaceType
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var ntype:IASNamespaceType;
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newNamespace("foo.bar.outer_space", "http://uuu.universe.com");
		ntype = unit.getType() as IASNamespaceType;
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function test_name():void
	{
		assertEquals("outer_space", ntype.getName());
		ntype.setName("the_universe");
		assertEquals("the_universe", ntype.getName());
		try
		{
			ntype.setName(null);
			fail("function name should have rejected null value");
		}
		catch (e:ASBlocksSyntaxError)
		{
		}
	}
	
	[Test]
	public function test_uri():void
	{
		assertEquals("http://uuu.universe.com", ntype.getURI());
		ntype.setURI("some/other/place");
		assertEquals("some/other/place", ntype.getURI());
		try
		{
			ntype.setURI(null);
			fail("namespace uri should have rejected null value");
		}
		catch (e:ASBlocksSyntaxError)
		{
		}	
	}
	
	[Test]
	public function test_comment():void
	{
	}
}
}