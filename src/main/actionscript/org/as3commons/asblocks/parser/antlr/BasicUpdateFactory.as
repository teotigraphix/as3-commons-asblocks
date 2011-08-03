package org.as3commons.asblocks.parser.antlr
{

public class BasicUpdateFactory implements IDelegateFactory
{
	private var delegate:BasicListUpdateDelegate = new BasicListUpdateDelegate();
	
	public function BasicUpdateFactory()
	{
	}
		
	public function create(payload:LinkedListTree):ITreeTokenListUpdateDelegate
	{
		return delegate;
	}
}
}