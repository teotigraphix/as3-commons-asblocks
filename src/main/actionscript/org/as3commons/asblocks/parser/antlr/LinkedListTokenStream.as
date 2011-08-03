package org.as3commons.asblocks.parser.antlr
{

import org.antlr.runtime.Token;
import org.antlr.runtime.TokenConstants;
import org.antlr.runtime.TokenSource;
import org.antlr.runtime.TokenStream;
import org.as3commons.lang.StringBuffer;

public class LinkedListTokenStream implements TokenStream
{
	protected var head:LinkedListToken;
	
	protected var tail:LinkedListToken;

	/** Skip tokens on any channel but this one; this is how we skip whitespace... */
	protected var channel:int = TokenConstants.DEFAULT_CHANNEL;

	/** By default, track all incoming tokens */
	protected var discardOffChannelTokens:Boolean = false;

	/** Track the last mark() call result value for use in rewind(). */
	protected var lastMarker:LinkedListToken;
	
	private var _tokenSource:TokenSource;
	
	/** The current element in the tokens list (next token
	 *  to consume).  p==null indicates that the tokens list is empty
	 */
	protected var p:LinkedListToken = null;

	public function LinkedListTokenStream(tokenSource:TokenSource, 
										  channel:int= TokenConstants.DEFAULT_CHANNEL)
	{
		this.tokenSource = tokenSource;
		this.channel = channel;
	}
	
	public function getSource():TokenSource
	{
		return tokenSource;
	}
	
	/**
	 * Reverses the stream 'count' tokens back, causing the tokens to be
	 * removed from the stream.  Can be used to erase tokens which parser
	 * lookahead has summoned, but which represent input to be handled by
	 * an 'island grammar'.
	 */
	public function scrub(count:int):void
	{
		if (p == null)
		{
			p = tail;
		}
		
		for (; count > 0; count--)
		{
			p = p.getPrev();
		}
		
		p.setNext(null);
		tail = p;
		p = null;
	}
	
	/** Reset this token stream by setting its token source. */
	public function setTokenSource(tokenSource:TokenSource):void
	{
		this.tokenSource = tokenSource;
		p = null;
		channel = TokenConstants.DEFAULT_CHANNEL;
	}
	
	private function readNextToken():LinkedListToken
	{
		var t:LinkedListToken = LinkedListToken(tokenSource.nextToken());
		while ( t!=null && t.type != TokenConstants.EOF)
		{
			var discard:Boolean = false;
			if (discardOffChannelTokens && t.channel!= this.channel)
			{
				discard = true;
			}
			if (!discard)
			{
				if (head == null && tail == null)
				{
					head = tail = t;
				}
				else 
				{
					tail.setNext(t);
					t.setPrev(tail);
					tail = t;
				}
				break;
			}
			t = LinkedListToken(tokenSource.nextToken());
		}
		if (t.type == TokenConstants.EOF)
		{
			// prevent ourselves from producing lots of EOF tokens
			// if the parser is 'pushy'; also, do the head/tail dance
			if (tail != null && tail.type == TokenConstants.EOF)
			{
				return tail;
			}
			else
			{
				if (head == null && tail == null)
				{
					head = tail = t;
				}
				else
				{
					tail.setNext(t);
					t.setPrev(tail);
					tail = t;
				}
			}
		}
		return skipOffTokenChannels(t);
	}
	
	/**
	 * Returns the token that follows the given token in the stream, or
	 * null if there's no token following
	 */
	private function succ(tok:LinkedListToken):LinkedListToken
	{
		var next:LinkedListToken = tok.getNext();
		if (next == null)
		{
			next = readNextToken();
		}
		return next;
	}
	
	public function getToken(i:int):Token
	{
		var tok:LinkedListToken = head;
		for (var c:int = 0; c < i; c++)
		{
			tok = succ(tok);
		}
		return tok;
	}
	
	public function get tokenSource():TokenSource
	{
		return _tokenSource;
	}
	
	public function set tokenSource(value:TokenSource):void
	{
		_tokenSource = value;
	}	
	
	public function LT(k:int):Token
	{
		if (p == null)
		{
			p = readNextToken();
		}
		if (k == 0)
			return null;
		
		if (k < 0)
			return LB(-k);
		
		var i:LinkedListToken = p;
		var n:int = 1;
		// find k good tokens
		while (n < k)
		{
			var next:LinkedListToken = succ(i);
			if (i == null)
				return TokenConstants.EOF_TOKEN;
			
			// skip off-channel tokens
			i = skipOffTokenChannels(next); // leave p on valid token
			n++;
		}
		
		if (i == null)
			return TokenConstants.EOF_TOKEN;
		
		return i;

	}
	
	/** Look backwards k tokens on-channel tokens */
	protected function LB(k:int):Token
	{
		if (p == null)
		{
			p = readNextToken();
		}
		if (k == 0)
			return null;

		var i:LinkedListToken = p;
		var n:int = 1;
		// find k good tokens looking backwards
		while (n <= k)
		{
			var next:LinkedListToken = i.getPrev();
			if (next == null)
				return null;
			
			// skip off-channel tokens
			i = skipOffTokenChannelsReverse(next); // leave p on valid token
			n++;
		}
		return i;
	}
	
	public function LA(i:int):int
	{
		return LT(i).type;
	}
	
	public function get index():int
	{
		var i:int = 0;
		for (var tok:LinkedListToken = head; tok!=p&&tok!=null; tok=tok.getNext())
		{
			i++;
		}
		return i;
	}
	
	public function get size():int
	{
		var s:int = 0;
		for (var tok:LinkedListToken = head; tok!=null; tok=tok.getNext())
		{
			s++;
		}
		return s;
	}
	
	public function consume():void
	{
		do {
			p = p.getNext();
		} while (p != null && p.channel != channel);		
	}
	
	public function mark():int
	{
		// TODO: could store marks in a hash; does it make any difference?
		lastMarker = LinkedListToken(LT(1));
		return index;
	}
	
	public function release(marker:int):void
	{
		// no resources to release
	}
	
	public function rewindTo(marker:int):void
	{
		seek(marker);
	}
	
	public function rewind():void
	{
		p = lastMarker;
	}
	
	public function seek(index:int):void
	{
		p = head;
		for (var i:int = 0; i < index; i++)
		{
			p = succ(p);
		}
	}
	
	/**
	 * Given a starting token, return the first on-channel token.
	 */
	protected function skipOffTokenChannels(i:LinkedListToken):LinkedListToken
	{
		while (i != null && i.channel != channel)
		{
			i = succ(i);
		}
		return i;
	}

	protected function skipOffTokenChannelsReverse(i:LinkedListToken):LinkedListToken
	{
		while (i != null && i.channel != channel)
		{
			i = i.getPrev();
		}
		return i;
	}
	
	//override public function discardOffChannelTokens(discardOffChannelTokens:Boolean):void
	//{
	//	this.discardOffChannelTokens = discardOffChannelTokens;
	//}
	
	public function toStringWithRange(start:int, stop:int):String
	{
		var tok:LinkedListToken = head;
		var i:int = 0;
		for (; i < start && tok != null; i++)
		{
			tok = succ(tok);
		}
		var buf:StringBuffer = new StringBuffer();
		for (; i <= stop && tok != null; i++)
		{
			buf.append(tok.text);
			tok = succ(tok);
		}
		return buf.toString();
	}
	
	public function toStringWithTokenRange(start:Token, stop:Token):String
	{
		var tok:LinkedListToken = start as LinkedListToken;
		var buf:StringBuffer = new StringBuffer();
		do
		{
			buf.append(tok.text);
			tok = succ(tok);
		} while (tok != null && tok != stop);
		return buf.toString();
	}
	
	public function get sourceName():String
	{
		return null;
	}
}
}