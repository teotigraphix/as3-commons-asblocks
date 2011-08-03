package org.as3commons.asblocks.parser.antlr
{
import org.antlr.runtime.Token;
import org.antlr.runtime.TokenSource;

public class LinkedListTokenSource implements TokenSource
{
	private var delegate:TokenSource;
	private var last:LinkedListToken = null;

	public function LinkedListTokenSource(delegate:TokenSource)
	{
		this.delegate = delegate;
	}
	
	public function nextToken():Token
	{
		var curr:LinkedListToken = createToken(delegate.nextToken());
		if (last != null) {
			last.setNext(curr);
		}
		curr.setPrev(last);
		last = curr;
		return curr;

	}
	
	private function createToken(tok:Token):LinkedListToken
	{
		var result:LinkedListToken = new LinkedListToken(tok.type, tok.text);
		result.line = tok.line;
		result.charPositionInLine = tok.charPositionInLine;
		result.channel = tok.channel;
		result.tokenIndex = tok.tokenIndex;
		return result;
	}
	
	/**
	 * Overrides the 'last' token which this object is remembering in order
	 * to build next/previous links.
	 */
	public function setLast(tok:LinkedListToken):void
	{
	}
	
	/**
	 * Redefines the TokenSource to which this object delagates the task of
	 * token creation.  This can be used to switch Lexers when an island
	 * grammar is required, for instance.
	 */
	public function setDelegate(delegate:TokenSource):void {
		this.delegate = delegate;
	}

	
	public function get sourceName():String
	{
		return null;
	}
}
}