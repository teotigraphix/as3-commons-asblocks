package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASImportStatement;
import org.as3commons.asblocks.dom.IASIncludeStatement;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IASUseStatement;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

public class Test_ASTASPackage
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var pckg:IASPackage;
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newClass("foo.Goo");
		pckg = unit.getPackage();
	}

	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function testParent():void
	{
		assertTrue(pckg.getParent() is IASCompilationUnit);
	}
		
	[Test]
	public function test_qname():void
	{
		assertNotNull(unit.getQName());
		assertEquals("foo", unit.getQName().getPackageName());
		assertEquals("Goo", unit.getQName().getLocalName());
		assertEquals("foo.Goo", unit.getQName().toString());
		assertTrue(unit.getQName().isQualified());
		unit.setPackageName(null);
		unit.getType().setName("Boo");
		assertFalse(unit.getQName().isQualified());
		assertNull(unit.getQName().getPackageName());
		assertEquals("Boo", unit.getQName().getLocalName());
	}
		
	[Test]
	public function test_newImp():void
	{
		pckg.parseImport("foo.bar");
		pckg.parseImport("foo");
		pckg.parseImport("foo.bar.baz.*");
		
		assertEquals(3, pckg.getImports().size);
		assertEquals("foo.bar", pckg.getImports().itemAt(0).getTargetString());
		assertEquals("foo", pckg.getImports().itemAt(1).getTargetString());
		assertEquals("foo.bar.baz.*", pckg.getImports().itemAt(2).getTargetString());
		
		var statement:IASImportStatement = pckg.removeImport("foo.bar");
		assertNotNull(statement);
		var s:String = unit.toString();
		
		assertEquals(2, pckg.getImports().size);
		assertEquals("foo", pckg.getImports().itemAt(0).getTargetString());
		assertEquals("foo.bar.baz.*", pckg.getImports().itemAt(1).getTargetString());
		
		var e1:IASImportStatement = pckg.getImports().itemAt(0);
		e1.parseTarget("foo.Baz");
		assertEquals("foo.Baz", e1.getTargetString());
	}
	
	[Test]
	public function test_newUse():void
	{
		pckg.parseUse("the_universe");
		pckg.parseUse("life");
		pckg.parseUse("and_everything");
		
		assertEquals(3, pckg.getUses().size);
		assertEquals("the_universe", pckg.getUses().itemAt(0).getName());
		assertEquals("life", pckg.getUses().itemAt(1).getName());
		assertEquals("and_everything", pckg.getUses().itemAt(2).getName());
		
		var statement:IASUseStatement = pckg.removeUse("life");
		assertNotNull(statement);
		
		assertEquals(2, pckg.getUses().size);
		assertEquals("the_universe", pckg.getUses().itemAt(0).getName());
		assertEquals("and_everything", pckg.getUses().itemAt(1).getName());
		
		var e1:IASUseStatement = pckg.getUses().itemAt(0);
		e1.setName("the_universe_and_everything");
		assertEquals("the_universe_and_everything", e1.getName());		
	}
		
	[Test]
	public function test_newInclude():void
	{
		pckg.parseInclude("my.as");
		pckg.parseInclude("your.as");
		pckg.parseInclude("../../their/other.as");
		
		assertEquals(3, pckg.getIncludes().size);
		assertEquals("my.as", pckg.getIncludes().itemAt(0).getTargetString());
		assertEquals("your.as", pckg.getIncludes().itemAt(1).getTargetString());
		assertEquals("../../their/other.as", pckg.getIncludes().itemAt(2).getTargetString());
		
		var statement:IASIncludeStatement = pckg.removeInclude("my.as");
		assertNotNull(statement);
		
		assertEquals(2, pckg.getIncludes().size);
		assertEquals("your.as", pckg.getIncludes().itemAt(0).getTargetString());
		assertEquals("../../their/other.as", pckg.getIncludes().itemAt(1).getTargetString());
		
		var e1:IASIncludeStatement = pckg.getIncludes().itemAt(0);
		e1.parseTarget("your/other.as");
		assertEquals("your/other.as", e1.getTargetString());
	}
		
	[Test]
	public function test_name():void
	{
		assertEquals("foo", pckg.getName());
		pckg.setName("foo.bar.baz");
		assertEquals("foo.bar.baz", pckg.getName());
		pckg.setName(null);
		assertNull(pckg.getName());
	}
	
	[Test]
	public function test_type():void
	{
		assertNotNull(pckg.getType());
		assertTrue(pckg.getType() is IASClassType);
	}
}
}