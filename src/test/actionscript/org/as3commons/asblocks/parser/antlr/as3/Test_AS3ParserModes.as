package org.as3commons.asblocks.parser.antlr.as3
{
import org.antlr.runtime.ParserRuleReturnScope;
import org.antlr.runtime.RecognitionException;
import org.as3commons.asblocks.dom.IASClassType;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.impl.ASTASCompilationUnit;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.flexunit.asserts.assertEquals;

public class Test_AS3ParserModes
{
	private var t:LinkedListTree;
	private var parser:AS3Parser = null;
	private var r:String = null;
	private var xml:String = null;
	
	public static function tree(returnScope:ParserRuleReturnScope):LinkedListTree
	{
		return returnScope.tree as LinkedListTree;
	}
	
	[Test]
	public function test_packageBlockParse():void
	{
		var data:String = "/* leading comment */\n";
		data += "package foo.bar {\n";
		data += "  [Foo(bar)]\n";
		data += "  import bar.*;\n";
		data += "  public dynamic class Baz extends Baz2 implements IGoo, IBar {\n";
		data += "    public var goo:int = 1;\n";
		data += "    [Foo(\"goo\")]\n";
		data += "    foo_bar function go(back:Boolean):String {\n";
		data += "      return null;\n";
		data += "    }\n";
		data += "  }\n";
		data += "}\n";
		
		parser = ASTUtils.parse(data);
		parser.setPackageBlockParse(true);
		
		try {
			t = tree(parser.compilationUnit());
		} catch (e:RecognitionException) {
			throw ASTUtils.buildSyntaxException(null, parser, e);
		}
		
		parser.setPackageBlockParse(false);
		
		var unit:IASCompilationUnit = new ASTASCompilationUnit(t);
		var ctype:IASClassType = unit.getType() as IASClassType;
		assertEquals("foo.bar", unit.getPackageName());
		assertEquals("Baz", ctype.getName());
		assertEquals("Baz2", ctype.getSuperClass());
		
		assertEquals(2, ctype.getImplementedInterfaces().size);
	}
}
}