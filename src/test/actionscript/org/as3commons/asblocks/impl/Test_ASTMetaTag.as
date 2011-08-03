package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASMetaTag;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASPackage;
import org.as3commons.asblocks.dom.IMetaTagAware;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;

public class Test_ASTMetaTag
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	
	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}

	// TODO: test doc-comments get attached in the correct place
	[Test]
	public function testMethod():void
	{
		var clazz:IASClassType = unit.getType() as IASClassType;
		var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, null);
		check(meth);
	}
	
	[Test]
	public function testClass():void
	{
		var pckg:IASPackage = unit.getPackage() as IASPackage;
		var clazz:IASClassType = unit.getType() as IASClassType;
		check(pckg);
	}
	
	[Test]
	public function testType():void
	{
		//		check(unit.getType());
	}
	
	public function check(taggable:IMetaTagAware):void
	{
		//assertEquals(Collections.EMPTY_LIST, taggable.getMetaTags());
		assertNull(taggable.getMetaTag("missing"));
		//assertEquals(Collections.EMPTY_LIST, taggable.getAllMetaTags("missing"));
		var bindable:IASMetaTag = taggable.newMetaTag("Biddable");
		assertEquals("Biddable", bindable.getName());
		assertEquals(1, taggable.getMetaTags().size);
		//assertEquals(Collections.EMPTY_LIST, bindable.getParameters());
		assertNull(bindable.getParameterValue("missing"));
		bindable.addBooleanParam(true);
		bindable.addIntParam(123);
		bindable.addStringParam("test");
		bindable.addStringParam("value", "name");
		var params:IList = bindable.getParameters();
		assertEquals(4, params.size);
		assertEquals(true, params.itemAt(0));
		assertEquals(123, params.itemAt(1));
		assertEquals("test", params.itemAt(2));
		assertEquals("value", bindable.getParameterValue("name"));
		var event:IASMetaTag = taggable.newMetaTag("Event");
		assertNotNull(taggable.getMetaTag("Event"));
		var foo:IASMetaTag = taggable.newMetaTag("Foo");
		assertEquals(1, taggable.getAllMetaTags("Foo").size);
	}
	
	[Test]
	public function testParsed():void
	{
		var src:String = "package framework.business{\n"
				+ "	import com.adobe.cairngorm.business.ServiceLocator;\n"
				+ "	import mx.rpc.IResponder;\n"
				+ "	/**\n"
				+ "	 * BDelegate comment\n"
				+ "	 */\n"
				+ "	[Bindable]\n"
				+ "	public class TestDelegate {\n"
				+ "		private var responder:IResponder;\n"
				+ "		private var service:Object;\n"
				+ "		public function TestDelegate(responder:mx.rpc.IResponder) {\n"
				+ "			//Save Responder\n"
				+ "			//this.responder = responder;\n"
				+ "			//Save Service\n"
				+ "			//this.service = ServiceLocator.getInstance().getService(\"TestRO\");\n"
				+ "		}\n" + "		public function findAndUpdate():void {\n"
				+ "			var call:Object = this.service.findAndUpdate();\n"
				+ "			call.addResponder(responder);\n" + "		}\n" + "	}\n"
				+ "}\n";
		unit = fact.newParser().parse(src);
		//IASType testType = unit.getType();
		var pckg:IASPackage = unit.getPackage() as IASPackage;
		assertEquals(1, pckg.getMetaTags().size);
		assertEquals(0, pckg.getAllMetaTags("RemoteClass").size);
		assertEquals(1, pckg.getAllMetaTags("Bindable").size);
	}
	
	[Test]
	public function testParseValuedParam():void
	{
		var AS_CLASS:String = "package org.test\n" + "{\n"
				+ "       public class MetaTagTest\n" + "       {\n"
				+ "               [MyMetaTag(param=\"value\")]  \n"
				+ "               public function myFunction():void\n"
				+ "               {\n" + "               }\n" + "       }\n"
				+ "}";

		unit = fact.newParser().parse(AS_CLASS);
		var asClass:IASClassType = unit.getType() as IASClassType;
		var asMethod:IASMethod = asClass.getMethods().iterator().next() as IASMethod;
		var asMetaTag:IASMetaTag = asMethod.getMetaTags().iterator().next() as IASMetaTag;

		assertEquals("MyMetaTag", asMetaTag.getName());
		assertEquals("value", asMetaTag.getParameterValue("param"));

		var params:IList = asMetaTag.getParameters();
		ExtraAssertions.assertSize(1, params);
	}
}
}