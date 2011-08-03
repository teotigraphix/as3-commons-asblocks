package org.as3commons.asblocks.parser.antlr
{
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class PlaceholderLinkedListToken extends LinkedListToken
{
	private var _held:LinkedListTree;
	
	public function get held():LinkedListTree
	{
		return _held;
	}
	
	public function PlaceholderLinkedListToken(held:LinkedListTree)
	{
		super(AS3Parser.VIRTUAL_PLACEHOLDER, "");
		channel = AS3Parser.CHANNEL_PLACEHOLDER;
		_held = held;
		_held.setStartToken(this);
		_held.setStopToken(this);
	}
}
}