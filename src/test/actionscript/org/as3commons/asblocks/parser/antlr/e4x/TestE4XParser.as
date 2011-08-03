package org.as3commons.asblocks.parser.antlr.e4x
{
import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CommonTokenStream;
import org.as3commons.asblocks.impl.AS3FragmentParser;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.flexunit.Assert;

public class TestE4XParser
{
	private static var TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();
	
	[Test]
	public function test_comment():void
	{
		var parser:E4XParser = parserOn("<!--foo-->");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlMarkup());
		Assert.assertEquals(E4XParser.XML_COMMENT, tree.type);
	}
	
	[Test]
	public function test_pi():void
	{
		var parser:E4XParser = parserOn("<?foo?>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlMarkup());
		Assert.assertEquals(E4XParser.XML_PI, tree.type);
	}
		
	[Test]
	public function test_cdata():void
	{
		var parser:E4XParser = parserOn("<![CDATA[foo]]>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlMarkup());
		Assert.assertEquals(E4XParser.XML_CDATA, tree.type);
	}
			
	[Test]
	public function test_emptyElement():void
	{
		var parser:E4XParser = parserOn("<foo/>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlElement());
		Assert.assertEquals(E4XParser.XML_EMPTY_ELEMENT, tree.type);
		var child:LinkedListTree = tree.getFirstChild();
		Assert.assertEquals("foo", child.text);
	}
				
	[Test]
	public function test_remainder():void
	{
		var parser:E4XParser = parserOn("<foo/>)");
		parser.xmlPrimary();
		Assert.assertEquals(")", parser.getInputTail());
	}
					
	[Test]
	public function test_elementBody():void
	{
		var parser:E4XParser = parserOn("<foo>bar &amp; blat</foo>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlPrimary());
		Assert.assertEquals(E4XParser.XML_ELEMENT, tree.type);
	}
						
	[Test]
	public function test_list():void
	{
		var parser:E4XParser = parserOn("<><foo/></>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlListInitialiser());
		Assert.assertEquals(E4XParser.XML_LIST, tree.type);
		var child:LinkedListTree = tree.getFirstChild();
		Assert.assertEquals(E4XParser.XML_EMPTY_ELEMENT, child.type);
	}
							
	[Test]
	public function test_emptyList():void
	{
		var parser:E4XParser = parserOn("<></>");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlListInitialiser());
		Assert.assertEquals(E4XParser.XML_LIST, tree.type);
		var child:LinkedListTree = tree.getFirstChild();
		Assert.assertNull(child);
	}
								
	[Test]
	public function test_attribute():void
	{
		var parser:E4XParser = parserOn(" a=\"b\"");
		var tree:LinkedListTree = AS3FragmentParser.tree(parser.xmlAttribute());
		Assert.assertEquals(E4XParser.XML_ATTRIBUTE, tree.type);
		Assert.assertEquals("a", tree.getFirstChild().text);
		Assert.assertEquals("\"b\"", tree.getLastChild().text);
	}
	
	private static function parserOn(str:String):E4XParser {
		//StringReader in = new StringReader(str);
		//return E4XHelper.parserOn(in);
		
		var cs:ANTLRStringStream = new ANTLRStringStream(str);
		var lexer:E4XLexer = new E4XLexer(cs);
		
		var linker:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(linker);
		
		var parser:E4XParser = new E4XParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		parser.setInput(lexer, cs);
		
		return parser;
	}

}
}