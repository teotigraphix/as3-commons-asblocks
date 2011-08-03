package org.as3commons.asblocks.parser.antlr
{

public interface IDelegateFactory
{
	function create(payload:LinkedListTree):ITreeTokenListUpdateDelegate;
}
}