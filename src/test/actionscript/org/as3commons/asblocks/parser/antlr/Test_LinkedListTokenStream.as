package org.as3commons.asblocks.parser.antlr
{

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.CharStream;
import org.antlr.runtime.TokenConstants;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.parser.antlr.as3.AS3Lexer;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.flexunit.Assert;

public class Test_LinkedListTokenStream
{
	public static const TYPE_TEST:int = 123;
		
	[Test]
	public function test_EOF():void
	{
		var source:TestTokenSource = new TestTokenSource();
		
		var linkedSource:LinkedListTokenSource = new LinkedListTokenSource(source);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(linkedSource);
		var tok:LinkedListToken = next(stream);
		Assert.assertEquals(TYPE_TEST, tok.type);
		var eof:LinkedListToken = next(stream);
		Assert.assertEquals(TokenConstants.EOF, eof.type);
		Assert.assertEquals(tok, eof.getPrev());

		var eof2:LinkedListToken = next(stream);
		Assert.assertEquals(TokenConstants.EOF, eof2.type);
		Assert.assertStrictlyEquals(eof, eof2);
		Assert.assertEquals(tok, eof2.getPrev());
	}
	
	private function next(stream:LinkedListTokenStream):LinkedListToken
	{
		var tok:LinkedListToken = LinkedListToken(stream.LT(1));
		stream.consume();
		return tok;
	}
	
	
	[Test]
	public function testMarkRewind():void
	{
		var input:ANTLRStringStream = new ANTLRStringStream("package  { b");
		var lex:AS3Lexer = new AS3Lexer(input);
		var src:LinkedListTokenSource = new LinkedListTokenSource(lex);
		var str:LinkedListTokenStream = new LinkedListTokenStream(src);

		ASTUtils.assertAS3TokenTypeIs(AS3Parser.PACKAGE, str.LA(1));
		str.consume();
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.LBRACE, str.LA(1));
		var mark:int = str.mark();
		Assert.assertEquals(2, mark);
		str.consume();
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.IDENT, str.LA(1));

		str.rewindTo(mark);
		ASTUtils.assertAS3TokenTypeIs(AS3Parser.LBRACE, str.LA(1));
		str.consume();

		// no-args version should just go back to last mark
		str.rewind();
		Assert.assertEquals(mark, str.index);
	}
	
}
}

import org.antlr.runtime.CommonToken;
import org.antlr.runtime.Token;
import org.antlr.runtime.TokenConstants;
import org.antlr.runtime.TokenSource;
import org.as3commons.asblocks.parser.antlr.Test_LinkedListTokenStream;

class TestTokenSource implements TokenSource
{
	public function get sourceName():String
	{
		return "";
	}
	
	private var done:Boolean = false;
	
	public function nextToken():Token
	{
		if (done)
		{
			return TokenConstants.EOF_TOKEN;
		}
		done = true;
		return new CommonToken(Test_LinkedListTokenStream.TYPE_TEST, "test");
	}
}