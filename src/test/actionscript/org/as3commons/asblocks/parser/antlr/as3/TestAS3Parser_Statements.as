package org.as3commons.asblocks.parser.antlr.as3
{
import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.ParserRuleReturnScope;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.impl.ParentheticUpdateFactory;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.flexunit.asserts.assertEquals;

public class TestAS3Parser_Statements extends TestAS3ParserBase
{
	[Test]
	public function test_block():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("{}");
		// <BLOCK></BLOCK>
		assertEquals("BLOCK", tree(parser.statement()).toStringTree());
		
		parser = parse("{foo;{bar;}}");
		// <BLOCK><EXPR_STMNT><IDENT>foo</IDENT></EXPR_STMNT><BLOCK>
		// <EXPR_STMNT><IDENT>bar</IDENT></EXPR_STMNT></BLOCK></BLOCK>
		assertEquals("(BLOCK (EXPR_STMNT foo) (BLOCK (EXPR_STMNT bar)))", 
			tree(parser.statement()).toStringTree());
	}	
	
	[Test]
	public function test_declarationStatement():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("var i;");
		// <VAR><IDENT>i</IDENT></VAR>
		assertEquals("(var i)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("const i;");
		// <CONST><IDENT>i</IDENT></CONST>
		assertEquals("(const i)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("var i:int;");
		// <VAR><IDENT><TYPE_SPEC><IDENT>int</IDENT></TYPE_SPEC></IDENT></VAR>
		assertEquals("(var (i (: int)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("const i:int;");
		// <CONST><IDENT><TYPE_SPEC><IDENT>int</IDENT></TYPE_SPEC></IDENT></CONST>
		assertEquals("(const (i (: int)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("var i:int = 42;");
		// <VAR><IDENT><TYPE_SPEC><IDENT>int</IDENT></TYPE_SPEC><ASSIGN>
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL></ASSIGN></IDENT></VAR>
		assertEquals("(var (i (: int) (= 42)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("var m, j:int = 11, k:Vector.<Foo>;");
		// <VAR><IDENT>m</IDENT><IDENT><TYPE_SPEC><IDENT>int</IDENT>
		// </TYPE_SPEC><ASSIGN><DECIMAL_LITERAL>11</DECIMAL_LITERAL>
		// </ASSIGN></IDENT><IDENT><TYPE_SPEC><IDENT>Vector</IDENT>
		// <TYPE_POSTFIX><IDENT>Foo</IDENT></TYPE_POSTFIX></TYPE_SPEC>
		// </IDENT></VAR>
		assertEquals("(var m (j (: int) (= 11)) (k (: Vector (TYPE_POSTFIX Foo))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("var i:int = 42, j:int = 11;");
		// <VAR><IDENT><TYPE_SPEC><IDENT>int</IDENT></TYPE_SPEC><ASSIGN>
		// <DECIMAL_LITERAL>42</DECIMAL_LITERAL></ASSIGN></IDENT><IDENT>
		// <TYPE_SPEC><IDENT>int</IDENT></TYPE_SPEC><ASSIGN><DECIMAL_LITERAL>
		// 11</DECIMAL_LITERAL></ASSIGN></IDENT></VAR>
		assertEquals("(var (i (: int) (= 42)) (j (: int) (= 11)))", 
			tree(parser.statement()).toStringTree());
	}
	
	[Test]
	public function test_expressionStatement():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("a = (b > 3 && c != 42) ? foo : new Bar();");		
		// <EXPR_STMNT><ASSIGN><IDENT>a</IDENT><QUESTION><ENCPS_EXPR><LAND>
		// <GT><IDENT>b</IDENT><DECIMAL_LITERAL>3</DECIMAL_LITERAL></GT>
		// <NOT_EQUAL><IDENT>c</IDENT><DECIMAL_LITERAL>42</DECIMAL_LITERAL>
		// </NOT_EQUAL></LAND></ENCPS_EXPR><IDENT>foo</IDENT><NEW><IDENT>Bar
		// </IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW></QUESTION>
		// </ASSIGN></EXPR_STMNT>
		assertEquals("(EXPR_STMNT (= a (? (ENCPS_EXPR (&& (> b 3) " +
			"(!= c 42))) foo (new Bar ARGUMENTS))))", 
			tree(parser.statement()).toStringTree());
	}
	
	[Test]
	public function test_ifStatement():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("if (true) return;");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><RETURN>return
		// </RETURN></IF>
		assertEquals("(if (CONDITION true) return)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) return; else return;");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><RETURN>return
		// </RETURN><ELSE><RETURN>return</RETURN></ELSE></IF>
		assertEquals("(if (CONDITION true) return (else return))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) return; else if (false) return; else return;");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><RETURN>return</RETURN>
		// <ELSE><IF><CONDITION><FALSE>false</FALSE></CONDITION><RETURN>return
		// </RETURN><ELSE><RETURN>return</RETURN></ELSE></IF></ELSE></IF>
		assertEquals("(if (CONDITION true) return (else (if (CONDITION false) " +
			"return (else return))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) {return;}");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK><RETURN>
		// return</RETURN></BLOCK></IF>
		assertEquals("(if (CONDITION true) (BLOCK return))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) {return;} else {return;}");
		
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK><RETURN>
		// return</RETURN></BLOCK><ELSE><BLOCK><RETURN>return</RETURN>
		// </BLOCK></ELSE></IF>
		assertEquals("(if (CONDITION true) (BLOCK return) (else (BLOCK return)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) {return;} else if (false) {return;} else {return;}");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK><RETURN>return
		// </RETURN></BLOCK><ELSE><IF><CONDITION><FALSE>false</FALSE>
		// </CONDITION><BLOCK><RETURN>return</RETURN></BLOCK><ELSE><BLOCK>
		// <RETURN>return</RETURN></BLOCK></ELSE></IF></ELSE></IF>
		assertEquals("(if (CONDITION true) (BLOCK return) (else (if (CONDITION " +
			"false) (BLOCK return) (else (BLOCK return)))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (true) {if (false) { } else { };}");
		// <IF><CONDITION><TRUE>true</TRUE></CONDITION><BLOCK><IF><CONDITION>
		// <FALSE>false</FALSE></CONDITION><BLOCK>BLOCK</BLOCK><ELSE><BLOCK>
		// BLOCK</BLOCK></ELSE></IF></BLOCK></IF>
		assertEquals("(if (CONDITION true) (BLOCK (if (CONDITION false) " +
			"BLOCK (else BLOCK))))", 
			tree(parser.statement()).toStringTree());	
	}
	
	[Test]
	public function test_forEachStatement():void
	{
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("for each(a in b)break;");
		// <FOR_EACH><IDENT>a</IDENT><IDENT>b</IDENT><BREAK_STATEMENT>
		// <BREAK>break</BREAK></BREAK_STATEMENT></FOR_EACH>
		assertEquals("(for a b break)", 
			tree(parser.statement()).toStringTree());
		
		
		
		parser = parse("for each(a in b[c.d])break;");
		

		// <FOR_EACH><IDENT>a</IDENT><ARRAY_ACCESS><IDENT>b</IDENT>
		// <PROP_OR_IDENT><IDENT>c</IDENT><IDENT>d</IDENT></PROP_OR_IDENT>
		// </ARRAY_ACCESS><BREAK_STATEMENT><BREAK>break</BREAK>
		// </BREAK_STATEMENT></FOR_EACH>
		assertEquals("(for a (ARRAY_ACCESS b (. c d)) break)", 
			tree(parser.statement()).toStringTree());	
		
		// for each(var a:Foo in bar){}
	}
	
	//[Test]
	public function test_super():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		parser = parse("super();");
		// <SUPER><ARGUMENTS>ARGUMENTS</ARGUMENTS></SUPER>
		assertEquals("(super ARGUMENTS)", tree(parser.statement()).toStringTree());
		
		parser = parse("{foo;}");
		// <BLOCK><EXPR_STMNT><IDENT>foo</IDENT></EXPR_STMNT></BLOCK>
		assertEquals("(BLOCK (EXPR_STMNT foo))", tree(parser.statement()).toStringTree());
		
		parser = parse("var foo:bar = 42;");
		// <VAR><IDENT><TYPE_SPEC><TYPE><QNAME><IDENT>bar</IDENT></QNAME></TYPE>
		// </TYPE_SPEC><ASSIGN><DECIMAL_LITERAL>42</DECIMAL_LITERAL></ASSIGN></IDENT></VAR>
		assertEquals("(var (foo (: (TYPE (QNAME bar))) (= 42)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("a = b + 2;");
		// <EXPR_STMNT><ASSIGN><IDENT>a</IDENT><PLUS><IDENT>b</IDENT><DECIMAL_LITERAL>
		// 2</DECIMAL_LITERAL></PLUS></ASSIGN></EXPR_STMNT>
		assertEquals("(EXPR_STMNT (= a (+ b 2)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (a < b) return;");	
		// <IF><CONDITION><LT><IDENT>a</IDENT><IDENT>b</IDENT></LT></CONDITION>
		// <RETURN>return</RETURN></IF>
		assertEquals("(if (CONDITION (< a b)) return)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (a < b) return a; else return b;");
		// <IF><CONDITION><LT><IDENT>a</IDENT><IDENT>b</IDENT></LT></CONDITION>
		// <RETURN><IDENT>a</IDENT></RETURN><ELSE><RETURN><IDENT>b</IDENT></RETURN>
		// </ELSE></IF>
		assertEquals("(if (CONDITION (< a b)) (return a) (else (return b)))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (a < b) {a = b;return a;} else { return b; }");
		// <IF><CONDITION><LT><IDENT>a</IDENT><IDENT>b</IDENT></LT></CONDITION>
		// <BLOCK><EXPR_STMNT><ASSIGN><IDENT>a</IDENT><IDENT>b</IDENT></ASSIGN>
		// </EXPR_STMNT><RETURN><IDENT>a</IDENT></RETURN></BLOCK><ELSE><BLOCK>
		// <RETURN><IDENT>b</IDENT></RETURN></BLOCK></ELSE></IF>
		assertEquals("(if (CONDITION (< a b)) (BLOCK (EXPR_STMNT (= a b)) " +
			"(return a)) (else (BLOCK (return b))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (a < b) {a = b;return a;} else if (c != d) { return b; }");
		// <IF><CONDITION><LT><IDENT>a</IDENT><IDENT>b</IDENT></LT></CONDITION>
		// <BLOCK><EXPR_STMNT><ASSIGN><IDENT>a</IDENT><IDENT>b</IDENT></ASSIGN>
		// </EXPR_STMNT><RETURN><IDENT>a</IDENT></RETURN></BLOCK><ELSE><IF>
		// <CONDITION><NOT_EQUAL><IDENT>c</IDENT><IDENT>d</IDENT></NOT_EQUAL>
		// </CONDITION><BLOCK><RETURN><IDENT>b</IDENT></RETURN></BLOCK></IF></ELSE></IF>
		assertEquals("(if (CONDITION (< a b)) (BLOCK (EXPR_STMNT (= a b)) (return a)) " +
			"(else (if (CONDITION (!= c d)) (BLOCK (return b)))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("if (a < b) {a = b;return a;} else if (c != d) { return b; " +
			"} else { return 42; }");
		// <IF><CONDITION><LT><IDENT>a</IDENT><IDENT>b</IDENT></LT></CONDITION><BLOCK>
		// <EXPR_STMNT><ASSIGN><IDENT>a</IDENT><IDENT>b</IDENT></ASSIGN></EXPR_STMNT>
		// <RETURN><IDENT>a</IDENT></RETURN></BLOCK><ELSE><IF><CONDITION><NOT_EQUAL>
		// <IDENT>c</IDENT><IDENT>d</IDENT></NOT_EQUAL></CONDITION><BLOCK><RETURN>
		// <IDENT>b</IDENT></RETURN></BLOCK><ELSE><BLOCK><RETURN><DECIMAL_LITERAL>
		// 42</DECIMAL_LITERAL></RETURN></BLOCK></ELSE></IF></ELSE></IF>
		assertEquals("(if (CONDITION (< a b)) (BLOCK (EXPR_STMNT (= a b)) (return a)) " +
			"(else (if (CONDITION (!= c d)) (BLOCK (return b)) (else (BLOCK (return 42))))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("throw new Error();");
		// <THROW><NEW><IDENT>Error</IDENT><ARGUMENTS>ARGUMENTS</ARGUMENTS></NEW></THROW>
		assertEquals("(throw (new Error ARGUMENTS))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("throw e;");
		// <THROW><IDENT>e</IDENT></THROW>
		assertEquals("(throw e)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("try { } catch (e:Error) { }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e</IDENT><TYPE_SPEC><TYPE><
		// QNAME><IDENT>Error</IDENT></QNAME></TYPE></TYPE_SPEC><BLOCK>BLOCK
		// </BLOCK></CATCH></TRY>
		assertEquals("(try BLOCK (catch e (: (TYPE (QNAME Error))) BLOCK))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("try { } catch (e:Error) { } finally { }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e</IDENT><TYPE_SPEC><TYPE>
		// <QNAME><IDENT>Error</IDENT></QNAME></TYPE></TYPE_SPEC><BLOCK>
		// BLOCK</BLOCK></CATCH><FINALLY><BLOCK>BLOCK</BLOCK></FINALLY></TRY>
		assertEquals("(try BLOCK (catch e (: (TYPE (QNAME Error))) BLOCK) (finally BLOCK))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("try { } finally { }");
		// <TRY><BLOCK>BLOCK</BLOCK><CATCH><IDENT>e</IDENT><TYPE_SPEC><TYPE>
		// <QNAME><IDENT>Error</IDENT></QNAME></TYPE></TYPE_SPEC><BLOCK>
		// BLOCK</BLOCK></CATCH><FINALLY><BLOCK>BLOCK</BLOCK></FINALLY></TRY>
		assertEquals("(try BLOCK (finally BLOCK))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("switch(a) { case 1: break; default: return;}");
		// <SWITCH><CONDITION><IDENT>a</IDENT></CONDITION><BLOCK><CASE>
		// <DECIMAL_LITERAL>1</DECIMAL_LITERAL><SWITCH_STATEMENT_LIST>
		// <BREAK>break</BREAK></SWITCH_STATEMENT_LIST></CASE><DEFAULT>
		// <SWITCH_STATEMENT_LIST><RETURN>return</RETURN></SWITCH_STATEMENT_LIST>
		// </DEFAULT></BLOCK></SWITCH>
		assertEquals("(switch (CONDITION a) (BLOCK (case 1 (SWITCH_STATEMENT_LIST break)) " +
			"(default (SWITCH_STATEMENT_LIST return))))", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("return;");
		// <RETURN>return</RETURN>
		assertEquals("return", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("break;");
		// <BREAK>break</BREAK>
		assertEquals("break", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("break label;");
		// <BREAK><IDENT>label</IDENT></BREAK>
		assertEquals("(break label)", 
			tree(parser.statement()).toStringTree());
		
		parser = parse("continue;");
		// <CONTINUE>continue</CONTINUE>
		assertEquals("continue", 
			tree(parser.statement()).toStringTree());		
		
		parser = parse("continue label;");
		// <CONTINUE><IDENT>label</IDENT></CONTINUE>
		assertEquals("(continue label)", 
			tree(parser.statement()).toStringTree());
	}
	
	//[Test]
	public function test_emptyStatement():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		return;
		
		parser = parse("{;;;}");
		
		
		t = tree(parser.block());
		result = t.toStringTree();
		x = xml(t);
		
		// <SEMI>;</SEMI>
		assertEquals(";", 
			tree(parser.statement()).toStringTree());
	}	
	
	
	//[Test]
	public function test_directiveStatement():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		
		// annotation
		parser = parse("[Annotation]");
		// <DIRECTIVE_STMNT><ANNOTATION><IDENT>Annotation</IDENT></ANNOTATION></DIRECTIVE_STMNT>
		assertEquals("(DIRECTIVE_STMNT (ANNOTATION Annotation))", 
			tree(parser.statement()).toStringTree());
		
		// include
		parser = parse("include 'foo.as';");
		// <DIRECTIVE_STMNT><INCLUDE><STRING_LITERAL>'foo.as'</STRING_LITERAL></INCLUDE></DIRECTIVE_STMNT>
		assertEquals("(DIRECTIVE_STMNT (include 'foo.as'))", 
			tree(parser.statement()).toStringTree());
		
		// use namespace
		parser = parse("use namespace my_namespace;");
		// <DIRECTIVE_STMNT><USE><NAMESPACE>namespace</NAMESPACE>
		// <IDENT>my_namespace</IDENT></USE></DIRECTIVE_STMNT>
		assertEquals("(DIRECTIVE_STMNT (use namespace my_namespace))", 
			tree(parser.statement()).toStringTree());
		
		// import
		parser = parse("import foo.bar.*;");
		// <DIRECTIVE_STMNT><IMPORT><QNAME_STAR><QNAME><IDENT>foo</IDENT>
		// <IDENT>bar</IDENT></QNAME><STAR>*</STAR></QNAME_STAR></IMPORT></DIRECTIVE_STMNT>
		assertEquals("(DIRECTIVE_STMNT (import (QNAME_STAR (QNAME foo bar) *)))", 
			tree(parser.statement()).toStringTree());
		
		// default xml namespace
		parser = parse("default xml namespace = 'http://foo/bar';");
		// <DIRECTIVE_STMNT><DEFAULT_XML_NAMESPACE><STRING_LITERAL>'http://foo/bar'
		// </STRING_LITERAL></DEFAULT_XML_NAMESPACE></DIRECTIVE_STMNT>
		assertEquals("(DIRECTIVE_STMNT (DEFAULT_XML_NAMESPACE 'http://foo/bar'))", 
			tree(parser.statement()).toStringTree());
	}	
	
	
	

	
	//[Test]
	public function test_forStatement():void
	{
		var parser:AS3Parser;
		var t:LinkedListTree;
		var result:String;
		var x:String;
		return;
		parser = parse("for(;;)break;");
		// <FOR><FOR_INIT>FOR_INIT</FOR_INIT><FOR_CONDITION>FOR_CONDITION
		// </FOR_CONDITION><FOR_ITERATOR>FOR_ITERATOR</FOR_ITERATOR>
		//<BREAK>break</BREAK></FOR>
		assertEquals("(for FOR_INIT FOR_CONDITION FOR_ITERATOR break)", 
			tree(parser.statement()).toStringTree());
		
		
		
		
		
		
		
		
		parser = parse("for(var i:int = 0; i < len; i++){}");
		
		t = tree(parser.statement());
		result = t.toStringTree();
		x = xml(t);
		
		
		parser = parse("for(;;){}");
		// <FOR><FOR_INIT>FOR_INIT</FOR_INIT><FOR_CONDITION>FOR_CONDITION
		// </FOR_CONDITION><FOR_ITERATOR>FOR_ITERATOR</FOR_ITERATOR>
		// <BLOCK>BLOCK</BLOCK></FOR>
		assertEquals("(for FOR_INIT FOR_CONDITION FOR_ITERATOR BLOCK)", tree(parser.statement()).toStringTree());
		
		parser = parse("for(var i:int = 0; i < len; i++){}");
		
		t = tree(parser.statement());
		result = t.toStringTree();
		x = xml(t);
		
		
		// <FOR><FOR_INIT><VAR><IDENT><TYPE_SPEC><TYPE><QNAME>
		// <IDENT>int</IDENT></QNAME></TYPE></TYPE_SPEC><ASSIGN>
		// <DECIMAL_LITERAL>0</DECIMAL_LITERAL></ASSIGN></IDENT></VAR>
		// </FOR_INIT><FOR_CONDITION><LT><IDENT>i</IDENT><IDENT>len</IDENT>
		// </LT></FOR_CONDITION><FOR_ITERATOR><POST_INC><IDENT>i</IDENT></POST_INC>
		// </FOR_ITERATOR><BLOCK>BLOCK</BLOCK></FOR>
		assertEquals("(for (FOR_INIT (var (i (: (TYPE (QNAME int))) " +
			"(= 0)))) (FOR_CONDITION (< i len)) (FOR_ITERATOR (++ i)) BLOCK)", 
			tree(parser.statement()).toStringTree());		
	}
}
}