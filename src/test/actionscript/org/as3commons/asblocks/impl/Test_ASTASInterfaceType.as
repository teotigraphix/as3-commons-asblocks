package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASInterfaceType;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

public class Test_ASTASInterfaceType
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var iface:IASInterfaceType;	
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newInterface("ITest");
		iface = unit.getType() as IASInterfaceType;
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function test_parse():void
	{
		var source:String =
			"package foo.bar {" +
				" public interface Blat extends Bing,Bong {" +
					" function func(arg:Number, foo):Boolean;" +
				" }" +
			" }";
		var fact:ASFactory = new ASFactory();
		var unit:IASCompilationUnit = fact.newParser().parse(source);

		// check that everything looks as it should,
		assertEquals("foo.bar", unit.getPackageName());
		var iface:IASInterfaceType = unit.getType() as IASInterfaceType;
		assertEquals("Blat", iface.getName());
		
//		assertEquals(Arrays.asList(new String[] {"Bing", "Bong"}),
//		             iface.getSuperInterfaces());

		var meth:IASMethod = iface.getMethod("func");
		assertNotNull(meth);
		assertEquals("func", meth.getName());

		// compare the re-serialised code with the original input,
		var writer:StringWriter = new StringWriter();
		fact.newWriter().write(writer, unit);
		assertEquals(source, writer.toString());
	}
	
	[Test]
	public function test_name():void
	{
		assertEquals("ITest", iface.getName());
		iface.setName("IAnother");
		assertEquals("IAnother", iface.getName());
	}
	
	[Test]
	public function test_methods():void
	{
		var foo:IASMethod = iface.newMethod("foo", Visibility.PUBLIC, null);
		iface.newMethod("removeme", Visibility.PUBLIC, null);
		iface.newMethod("bar", Visibility.PUBLIC, null);

		iface.removeMethod("removeme");

		var methods:IList= iface.getMethods();
		assertEquals(2, methods.size);
		var method0:IASMethod = methods.itemAt(0);
		assertEquals("foo", method0.getName());
		var method1:IASMethod = methods.itemAt(1);
		assertEquals("bar", method1.getName());

		assertEquals(method1.getName(), iface.getMethod("bar").getName());
		
//		try {
//			meth1.addStmt("helloWorld()");
//			fail("adding code to interface method should fail");
//		} catch (SyntaxException e) {
//			// expected
//		}
	}	
	
	[Test]
	public function test_superInterfaces():void
	{
		assertEquals(0, iface.getSuperInterfaces().size);
		iface.addSuperInterface("InterfaceTestA");
		iface.addSuperInterface("InterfaceTestB");
		iface.addSuperInterface("pkg.InterfaceTestC");

		assertEquals(3, iface.getSuperInterfaces().size);
		iface.removeSuperInterface("InterfaceTestB");

		var interfaces:IList = iface.getSuperInterfaces();
		assertEquals(2, interfaces.size);
		var interface0:String = interfaces.itemAt(0);
		assertEquals("InterfaceTestA", interface0);
		var interface1:String = interfaces.itemAt(1);
		assertEquals("pkg.InterfaceTestC", interface1);
	}
	
	[Test]
	public function test_superInterfaces_replace():void
	{
		var source:String =
			"package foo.bar {" +
				" public interface Blat extends com.example.Bing {" +
				" }" +
			" }";


		unit = fact.newParser().parse(source);
		var iface:IASInterfaceType = unit.getType() as IASInterfaceType;
		assertEquals("com.example.Bing", iface.getSuperInterfaces().itemAt(0));
		iface.removeSuperInterface("com.example.Bing");
		iface.addSuperInterface("Bing");
	}
	
	[Test]
	public function test_packageName():void
	{
		unit.setPackageName("foo.bar");
	}	
}
}