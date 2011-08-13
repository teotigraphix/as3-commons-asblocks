package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.IASWriter;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.IASParameter;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.IDocTag;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.lang.StringUtils;
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;

public class Test_DocComment
{
	private var fact:ASFactory = new ASFactory();
	private var unit:IASCompilationUnit;
	private var clazz:IASClassType;
	
	[Before]
	public function setUp():void
	{
		var fact:ASFactory = new ASFactory();
		unit = fact.newClass("Test");
		clazz = unit.getType() as IASClassType;
	}
	
	[After]
	public function tearDown():void
	{
		CodeMirror.assertReflection(fact, unit);
	}
	
	private function trim(value:String):String
	{
		return StringUtils.trim(value);
	}
	
	[Test]
	public function test_newDocTagAt_basic():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.newDocTagAt(0, "foo");
		var tag1:IDocTag = doc.findFirstTag("foo");
		assertNotNull(tag1);
	}
	
	[Test]
	public function test_newDocTagAt():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.newDocTagAt(0, "foo");
		doc.newDocTagAt(1, "bar");
		doc.newDocTagAt(1, "baz", "asdasdasdasd\nasdasdasdasd\nasdasd22");
		doc.newDocTagAt(3, "goo", "asdasdasdasd");
		var data:String = doc.toString();
		var tag1:IDocTag = doc.findFirstTag("foo");
		assertNotNull(tag1);
		assertEquals("\n\t/**\n\t * @foo \n\t * @baz asdasdasdasd\n\t * asdasdasdasd\n\t " +
			"* asdasd22\n\t * @bar \n\t * @goo asdasdasdasd\n\t */\n\tpublic " +
			"class Test {\n\t}", data);
	}
	
	[Test]
	public function test_getShortDescription():void
	{
		var desc:String = "Start of the comment.\n" + " More lines.\n" + "<pre>\n"
				+ "    code();\n" + "    moreCode();\n" + "</pre>\n"
				+ "Last line.";

		clazz.setDescription(desc);
		assertEquals("\nStart of the comment.\n More lines.\n<pre>\n"
				+ "    code();\n    moreCode();\n</pre>\nLast line.\n", clazz.getDescription());

		clazz.setDescription("The short desc all the way to a period newline.\n   More content.");
		assertEquals("The short desc all the way to a period newline.\n   "
				+ "More content.", trim(clazz.getDescription()));
		
		// the short description is always trimmed before it is returned
		assertEquals("The short desc all the way to a period newline.", clazz.getDocumentation().getShortDescription());
	}

	[Test]
	public function test_getLongDescription():void
	{
		clazz.setDescription("The short desc all the way to a period newline.\n   More content.  \n Long desc more.\n");
		assertEquals("The short desc all the way to a period newline.\n   More content.  \n Long desc more.", trim(clazz.getDescription()));
	
		assertEquals("More content.  \n Long desc more.", clazz.getDocumentation().getLongDescription());
	}
	
	//@Test
	public function _test_comment():void
	{
		//IDocComment documentation = clazz.getDocumentation();
		/*
		clazz.getDocumentation().setDescription("A test description with a \n nelinw and another\n newline.");
		clazz.getDocumentation().newDocTag("author", "mike schmalle");
		clazz.getDocumentation().setDescription(null);
		clazz.getDocumentation().setDescription("A new value\n of text.");
		clazz.getDocumentation().setDescription(null);
		// set two descriptions i a row
		clazz.getDocumentation().setDescription("A test description with a \n nelinw and another\n newline.");
		clazz.getDocumentation().setDescription("A new value\n of text.");

		IDocComment documentation = clazz.getDocumentation();

		IDocTag tag = documentation.findFirstTag("author");
		documentation.removeDocTag(tag);

		clazz.getDocumentation().newDocTag("author", "mike schmalle1");
		clazz.getDocumentation().newDocTag("author", "mike schmalle2");
		clazz.getDocumentation().setDescription("A new value\n of text.2");

		documentation = clazz.getDocumentation();
		tag = documentation.findFirstTag("author");
		documentation.removeDocTag(tag);
		documentation = clazz.getDocumentation();
		tag = documentation.findFirstTag("author");
		documentation.removeDocTag(tag);
		*/
	}
	
	[Test]
	public function testEndOfCommentMarker():void
	{
		try
		{
			clazz.getDocumentation().setDescription("*/");
			fail("should not allow '*/' within a doc-comment");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}
	
	[Test]
	public function testParaEndOfCommentMarker():void
	{
		try
		{
			clazz.getDocumentation().newDocTag("foo", "*/");
			fail("should not allow '*/' within a doc-comment");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}
	
	[Test]
	public function testSetNewDescription():void
	{
		clazz.setDescription("hello");
		assertEquals("hello", trim(clazz.getDescription()));
	}
	
	[Test]
	public function testSetBadDescription():void
	{
		try
		{
			clazz.setDescription("hello\n@param foo great");
			fail("should have rejected description with trailing tagged-paragraph");
		}
		catch (e:ASBlocksSyntaxError)
		{
			// expected
		}
	}
	
	[Test]
	public function testGetDescriptionNoDocs():void
	{
		assertNull(clazz.getDescription());
	}
	
	[Test]
	public function testRemoveDescription():void
	{
		clazz.setDescription(null);
		assertEquals(null, clazz.getDescription());
	}
	
	[Test]
	public function testGetExistingDescription():void
	{
		clazz.getDocumentation().setDescription("hello world");
		clazz.getDocumentation().newDocTag("param", "foo bar");
		assertEquals("hello world", trim(clazz.getDescription()));
	}
	
	[Test]
	public function testNewArgNoDocs():void
	{
		var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, "void");
		var test:IASParameter = meth.addParameter("test", "String");
		assertNull(test.getDescription());
		test.setDescription("a test!");
		assertEquals("a test!", trim(test.getDescription()));
		// insert a description before the @param
		meth.setDescription("foo\nbar");
		assertEquals("foo\nbar", trim(meth.getDescription()));
		var actualDesc:String = test.getDescription();
		assertNotNull(actualDesc);
		assertEquals("a test!", trim(actualDesc));
	}
	
	[Test]
	public function testUpdateArgDocs():void
	{
		var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, "void");
		var test:IASParameter = meth.addParameter("test", "String");
		assertNull(test.getDescription());
		test.setDescription("initial text!");
		assertEquals("initial text!", trim(test.getDescription()));
		test.setDescription("replacement text");
		assertEquals("replacement text", trim(test.getDescription()));
	}
	
	[Test]
	public function testParaTagUpdateNewline():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.setDescription("blah blah\nblah");
		doc.newDocTag("foo", "foo text");
		doc.newDocTag("test", "initial text");
		// once the body has been replaced, the AST ref changes in the
		// doc tag which makes these refs useless
		var tag1:IDocTag = doc.findFirstTag("foo");
		tag1.setBody("replacement\ncontent 1 1 1");
		var tag2:IDocTag = doc.findFirstTag("test");
		tag2.setBody("replacement\ncontent 2 \n 2 \n");
		doc.setDescription("foo foo\n{@foo bar.baz} blad\nblah\n");

		tag1 = doc.findFirstTag("foo");
		tag2 = doc.findFirstTag("test");

		doc.removeDocTag(tag1);
		doc.removeDocTag(tag2);

		doc.newDocTag("foo", "foo text");
		doc.newDocTag("test", "initial text");

		var writer:IASWriter = fact.newWriter();
		var buff:StringWriter = new StringWriter();
		writer.write(buff, unit);
		var lines:Array = buff.toString().split("\n");
		// check indentation, skipping first and last lines,
		for (var i:int = 1; i < lines.length - 1; i++)
		{
			assertIndent("\t", lines[i]);
		}

	}

	private static function assertIndent(indent:String, line:String):void
	{
		if (line.length == 0)
		{
			// blank lines allowed
			return;
		}
		assertTrue("expected indentation " + ASTUtils.str(indent)
				+ " but line started with "
				+ ASTUtils.str(line.substring(0, indent.length)), StringUtils.startsWith(line, indent));
	}
	
	[Test]
	public function testReturnDocs():void
	{
		var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, "void");
		assertNull(meth.getReturnDescription());
		meth.setReturnDescription(null); // should not fail
		meth.setReturnDescription("blah blah");
		assertEquals("blah blah", trim(meth.getReturnDescription()));
	}
	
	[Test]
	public function testRemoveReturnDocs():void
	{
		var meth:IASMethod = clazz.newMethod("test", Visibility.PUBLIC, "void");
		meth.setReturnDescription("blah blah");
		meth.setReturnDescription(null);
		assertNull(meth.getReturnDescription());
	}
	
	[Test]
	public function testDocumentation():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		assertNotNull(doc);
		assertNull(doc.getDescription());
	}
	
	[Test]
	public function testFindTags():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.newDocTag("param", "arg0 blah");
		doc.newDocTag("param", "arg1 blah blah");
		doc.newDocTag("param", "arg2 blah blah blah");
		var i:IIterator = doc.getTags("param");
		assertTrue(i.hasNext());
//		assertTrue(((IDocTag) i.next()).getBody().trim().startsWith("arg0"));
//		assertTrue(i.hasNext());
//		assertTrue(((IDocTag) i.next()).getBody().trim().startsWith("arg1"));
//		assertTrue(i.hasNext());
//		assertTrue(((IDocTag) i.next()).getBody().trim().startsWith("arg2"));
	}
	
	[Test]
	public function testDocTagName():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.newDocTag("param", "arg0 blah");
		var tag:IDocTag = doc.findFirstTag("param");
		assertEquals("param", tag.getName());
		tag.setName("see");
		assertEquals("see", tag.getName());
		// TODO: assert that the comment is removed?
	}
	/*
	[Test]
	public function testDelete():void
	{
		var doc:IDocComment = clazz.getDocumentation();
		doc.setDescription("boo\nfoo");
		doc.newDocTag("param", "arg0 blah");
		doc.newDocTag("param", "arg1 blah blah");
		doc.newDocTag("param", "arg2 blah blah blah");
		var arg1:IDocTag = null;
		for (var i:IIterator = doc.getTags("param"); i.hasNext();)
		{
			var tag:IDocTag = i.next() as IDocTag;
			if (tag.getBody().trim().startsWith("arg1"))
			{
				arg1 = tag;
				break;
			}
		}
		assertNotNull(arg1);
		doc.removeDocTag(arg1);
		// check it's gone,
		Iterator<IDocTag> i = doc.getTags("param");
		assertTrue(i.hasNext());
		assertTrue(((IDocTag) i.next()).getBody().trim().startsWith("arg0"));
		assertTrue(i.hasNext());
		assertTrue(((IDocTag) i.next()).getBody().trim().startsWith("arg2"));
		//		doc.delete(doc.findFirstTag("param"));
		//		doc.delete(doc.findFirstTag("param"));
		//		i = doc.findTags();
		//		assertFalse(i.hasNext());
	}
	
	[Test]
	public function testAddToParsedContent():void
	{
		IASParser p = fact.newParser();
		StringReader in = new StringReader("package {\n"
				+ "	public class Test {\n" + "		public function foo() {\n"
				+ "		}\n" + "	}\n" + "}\n");
		unit = p.parseIn(in);
		IASMethodAware type = (IASMethodAware) unit.getType();
		IASMethod foo = type.getMethod("foo");
		foo.setDescription("woo!");
		IASWriter writer = fact.newWriter();
		StringWriter out = new StringWriter();
		writer.write(out, unit);
		String result = out.toString();
		// find the end of what would be the only comment block,
		int pos = result.indexOf("~/");
		char firstCharAfterComment = result.charAt(pos + 2);
		assertTrue("expected a newline to appear after newly inserted comment: 0x"
				+ Integer.toHexString(firstCharAfterComment), firstCharAfterComment == '\n'
				|| firstCharAfterComment == '\r');
	}
	*/
}
}