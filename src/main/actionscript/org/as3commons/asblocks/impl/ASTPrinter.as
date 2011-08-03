package org.as3commons.asblocks.impl
{
import org.antlr.runtime.TokenConstants;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTPrinter
{
	private var writer:IWriter;
	// PrintWriter out;
	
	public function ASTPrinter(writer:IWriter)
	{
		this.writer = writer;
		// this.out = new PrintWriter(out);
	}
	
	public function print(ast:LinkedListTree):void
	{
		for (var tok:LinkedListToken=findStart(ast); tok!=null; tok=tok.getNext())
		{
			printToken(tok);
		}
	}

	private function findStart(ast:LinkedListTree):LinkedListToken
	{
		var result:LinkedListToken = null;
		for (var tok:LinkedListToken=ast.getStartToken(); viable(tok); tok=tok.getPrev())
		{
			result = tok;
		}
		return result;
	}

	private function viable(tok:LinkedListToken):Boolean
	{
		return tok != null && tok.type != TokenConstants.EOF;
	}

	private function printToken(tok:LinkedListToken):void
	{
		if (tok.text != null)
		{
			writer.write(tok.text);
		}
	}	
}
}