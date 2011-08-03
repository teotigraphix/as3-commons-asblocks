package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.AccessorRole;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IList;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertStrictlyEquals;
import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;

public class Test_ASTASMethod
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var clazz:IASClassType;
	private var meth:IASMethod;
	
	[Before]
	public function setUp():void
	{
		unit = fact.newClass("Test");
		clazz = unit.getType() as IASClassType;
		meth = clazz.newMethod("test", Visibility.PUBLIC, null);
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	[Test]
	public function testParent():void
	{
		assertTrue(meth.getParent() is IASClassType);
	}
	
	[Test]
	public function testNamespace():void
	{
		assertFalse("new fields should not have namespace by default",
				meth.hasNamespaceVisibility());
		meth.setNamespaceVisibility("my_space");
		assertTrue("changing to namespace failed", meth.hasNamespaceVisibility());
		assertEquals("my_space", meth.getNamespaceVisibility());
		// change to protected
		meth.setVisibility(Visibility.PROTECTED);
		assertFalse("namespace not deleted when chaning to protected",
				meth.hasNamespaceVisibility());
		// add static
		meth.setStatic(true);
		assertTrue("setting static when just removed namespace failed",
				meth.isStatic());
		meth.setNamespaceVisibility("my_universe");
		assertTrue(meth.isStatic());
		assertTrue(meth.hasNamespaceVisibility());
		assertEquals("my_universe", meth.getNamespaceVisibility());
		// change const (shouldn't even affect it) don't think this is legal
		meth.setOverride(true);
		assertTrue(meth.isStatic());
		assertTrue(meth.hasNamespaceVisibility());
		assertTrue(meth.isOverride());
		assertEquals("my_universe", meth.getNamespaceVisibility());
	}
	
	[Test]
	public function test_name():void
	{
		assertEquals("test", meth.getName());
		meth.setName("foobar");
		assertEquals("foobar", meth.getName());
		try
		{
			meth.setName("bad.name");
			fail("should not have accepted method name containing '.'");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
		try
		{
			meth.setName("bad:name");
			fail("should not have accepted method name containing ':'");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}
	
	[Test]
	public function test_static():void
	{
		assertFalse("new methods should be non-static by default", meth.isStatic());
		meth.setStatic(false);
		assertFalse(meth.isStatic());
		meth.setStatic(true);
		assertTrue(meth.isStatic());
		meth.setStatic(true);
		assertTrue(meth.isStatic());
	}
	
	[Test]
	public function test_accessorRole():void
	{
		assertEquals(AccessorRole.NORMAL, meth.getAccessorRole());
		// now add a role,
		meth.setAccessorRole(AccessorRole.GETTER);
		assertEquals(AccessorRole.GETTER, meth.getAccessorRole());
		// change existing role to set
		meth.setAccessorRole(AccessorRole.SETTER);
		assertEquals(AccessorRole.SETTER, meth.getAccessorRole());
		// change existing role to itemAt
		meth.setAccessorRole(AccessorRole.GETTER);
		assertEquals(AccessorRole.GETTER, meth.getAccessorRole());

		// check the AST internals didn't itemAt mangled along the way,
		assertEquals("test", meth.getName());

		meth.setAccessorRole(AccessorRole.NORMAL);
		assertEquals(AccessorRole.NORMAL, meth.getAccessorRole());

		// now add a role back in, but this time as a setter
		meth.setAccessorRole(AccessorRole.SETTER);
		assertEquals(AccessorRole.SETTER, meth.getAccessorRole());

		// squeeze out the last bit of code coverage,
		assertEquals("normal", AccessorRole.NORMAL.toString());
		assertEquals("getter", AccessorRole.GETTER.toString());
		assertEquals("setter", AccessorRole.SETTER.toString());
	}
	
	[Test]
	public function test_type():void
	{
		assertNull(meth.getType());
		meth.setType("pkg.Clazz");
		assertEquals("pkg.Clazz", meth.getType());
		// "function" is a keyword, rather than an IDENT
		meth.setType("_function");
		assertEquals("_function", meth.getType());
		var reflectedUnit:IASCompilationUnit = CodeMirror.assertReflection(fact, unit);
		var reflectedMethod:IASMethod = IASClassType(reflectedUnit.getType()).getMethod(meth.getName());
		assertEquals("_function", reflectedMethod.getType());
		meth.setType(null);
		assertNull(meth.getType());
	}
	
	[Test]
	public function test_protection():void
	{
		assertVisibility(Visibility.PUBLIC, meth);
		meth.setVisibility(Visibility.PRIVATE);
		assertVisibility(Visibility.PRIVATE, meth);
		meth.setVisibility(Visibility.PROTECTED);
		assertVisibility(Visibility.PROTECTED, meth);
		meth.setVisibility(Visibility.INTERNAL);
		assertVisibility(Visibility.INTERNAL, meth);
		meth.setVisibility(Visibility.PUBLIC);
		assertVisibility(Visibility.PUBLIC, meth);

		checkSetVisibilityAfterDefault(meth, Visibility.PRIVATE);
		checkSetVisibilityAfterDefault(meth, Visibility.PUBLIC);
		checkSetVisibilityAfterDefault(meth, Visibility.PROTECTED);
		checkSetVisibilityAfterDefault(meth, Visibility.INTERNAL);

		// see what happens when there is no visibility modifier, but
		// there *is* some other kind of modifier keyword,
		meth.setVisibility(Visibility.DEFAULT);
		meth.setStatic(true);
		assertVisibility(Visibility.DEFAULT, meth);

		meth.setVisibility(Visibility.PUBLIC);
		assertVisibility(Visibility.PUBLIC, meth);
		try
		{
			meth.setVisibility(null);
			fail("should reject 'null' visibility");
		}
		catch (e:Error)
		{
			// expected
		}

		// squeeze out the last bit of code coverage,
		assertEquals("public", Visibility.PUBLIC.getName());
		assertEquals("private", Visibility.PRIVATE.getName());
		assertEquals("protected", Visibility.PROTECTED.getName());
		assertEquals("internal", Visibility.INTERNAL.getName());
		assertEquals("default", Visibility.DEFAULT.getName());
	}

	private static function assertVisibility(expectedVisibility:Visibility,
											method:IASMethod):void
	{
		assertStrictlyEquals(expectedVisibility, method.getVisibility());
	}

	private static function checkSetVisibilityAfterDefault(method:IASMethod,
														visibility:Visibility):void
	{
		method.setVisibility(Visibility.DEFAULT);
		assertVisibility(Visibility.DEFAULT, method);
		method.setVisibility(visibility);
		assertVisibility(visibility, method);
	}
	
	[Test]
	public function test_protectionOnCreate():void
	{
		meth = clazz.newMethod("testDefault", Visibility.DEFAULT, null);
		assertVisibility(Visibility.DEFAULT, meth);
		meth = clazz.newMethod("testPublic", Visibility.PUBLIC, null);
		assertVisibility(Visibility.PUBLIC, meth);
		meth = clazz.newMethod("testPrivate", Visibility.PRIVATE, null);
		assertVisibility(Visibility.PRIVATE, meth);
		meth = clazz.newMethod("testProtected", Visibility.PROTECTED, null);
		assertVisibility(Visibility.PROTECTED, meth);
		meth = clazz.newMethod("testInternal", Visibility.INTERNAL, null);
		assertVisibility(Visibility.INTERNAL, meth);
	}
	
	[Test]
	public function test_parameters():void
	{
		var foo:IASParameter = meth.addParameter("foo", "Number");
		assertEquals("foo", foo.getName());
		assertEquals("Number", foo.getType());
		foo.setDefaultValue("null");
		foo.setDefaultValue("1"); // reset existing value 
		assertEquals("1", foo.getDefaultValue());
		foo.setDefaultValue(null); // remove value
		try
		{
			foo.setDefaultValue("]");
			fail("should have rejected invalid initializer value");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
		assertNull(foo.getDefaultValue());
		meth.addParameter("bar", null);
		meth.addParameter("blat", null);
		var args:IList = meth.getParameters();
		assertEquals(3, args.size);
		var arg0:IASParameter = args.itemAt(0) as IASParameter;
		assertEquals("foo", arg0.getName());
		assertEquals("Number", arg0.getType());
		assertEquals("foo:Number", arg0.toString());
		arg0.setType("String");
		assertEquals("String", arg0.getType());
		arg0.setType(null);
		assertNull(arg0.getType());
		assertEquals("foo", arg0.toString());
		var arg1:IASParameter = args.itemAt(1) as IASParameter;
		assertEquals("bar", arg1.getName());
		assertEquals("bar", arg1.toString());
		assertNull(arg1.getType());
		var arg2:IASParameter = args.itemAt(2) as IASParameter;
		arg2.setType("*");
		assertEquals("*", arg2.getType());
		assertEquals("bar", meth.removeParameter("bar").getName());
		assertEquals(2, meth.getParameters().size);
		assertNull(meth.removeParameter("missing"));
		assertEquals(2, meth.getParameters().size);

		var unit2:IASCompilationUnit = CodeMirror.assertReflection(fact, unit);
		var type2:IASClassType = unit2.getType() as IASClassType;
		var meth2:IASMethod = type2.getMethod("test");
		var args2:IList = meth2.getParameters();
		var bar2:IASParameter = args2.itemAt(1) as IASParameter;
		assertEquals("blat", bar2.getName());
		assertEquals("*", bar2.getType());
	}
	
	[Test]
	public function test_removeLastParameter():void
	{
		meth.addParameter("foo", "Number");
		meth.addRestParameter("bar");
		meth.removeParameter("bar");
		assertEquals(1, meth.getParameters().size);
	}
	
	[Test]
	public function test_restParameter():void
	{
		var foo:IASParameter = meth.addParameter("foo", "Number");
		assertFalse(foo.isRest());
		var bar:IASParameter = meth.addRestParameter("bar");
		assertTrue(bar.isRest());
		meth.removeParameter("bar");
		assertEquals(1, meth.getParameters().size);
		var rest:IASParameter = meth.addRestParameter("..."); // no name
		assertEquals("...", rest.getName());
		meth.removeParameter("...");
		assertEquals(1, meth.getParameters().size);

		rest = meth.addRestParameter("...");
		try
		{
			rest.setDefaultValue("12");
			fail("should not have been able to set a default value for a 'rest' parameter");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
		assertEquals(2, meth.getParameters().size);
	}
	
	[Test]
	public function test_docComment():void
	{
	}
}
}