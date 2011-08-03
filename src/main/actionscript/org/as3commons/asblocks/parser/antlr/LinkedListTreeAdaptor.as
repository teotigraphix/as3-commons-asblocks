package org.as3commons.asblocks.parser.antlr
{
import org.antlr.runtime.CommonToken;
import org.antlr.runtime.Token;
import org.antlr.runtime.tree.BaseTreeAdaptor;
import org.antlr.runtime.tree.CommonTreeAdaptor;
import org.antlr.runtime.tree.Tree;

public class LinkedListTreeAdaptor extends BaseTreeAdaptor
{
	private var factory:IDelegateFactory = new BasicUpdateFactory();
	
	public function setFactory(value:IDelegateFactory):void
	{
		factory = value;
	}
	
	public function LinkedListTreeAdaptor(value:IDelegateFactory = null)
	{
		super();
		
		if (value)
			factory = value;
	}
	
	override public function createToken(fromToken:Token):Token
	{
		return new LinkedListToken(fromToken.type, fromToken.text);
	}
	
	override public function createWithPayload(payload:Token):Object
	{
		var result:LinkedListTree = new LinkedListTree();
		result.setToken(payload);
		result.tokenListUpdater = factory.create(result);

		if (payload is LinkedListToken)
		{
			result.setStartToken(payload as LinkedListToken);
			result.setStopToken(payload as LinkedListToken);
		}
		
		return result as LinkedListTree;
	}
	
	override public function createTokenFromType(tokenType:int, text:String):Token
	{
		// creates the CU
		return new CommonToken(tokenType, text);
	}
	
	override public function setTokenBoundaries(t:Object, 
												startToken:Token, 
												stopToken:Token):void
	{
		if (t == null)
			return;
		
		var tree:LinkedListTree = t as LinkedListTree;
		tree.setStartToken(LinkedListToken(startToken));
		tree.setStopToken(LinkedListToken(stopToken));
	}
	
	override public function dupNode(t:Object):Object
	{
		return Tree(t).dupNode();
	}
	
	override public function getText(t:Object):String
	{
		return t.text;
	}
	
	override public function getType(t:Object):int
	{
		return t.type;
	}
	
	override public function getToken(t:Object):Token
	{
		return LinkedListTree(t).getToken();
	}
	
	/*
	
	parameters	[] (@7b2d309)	
	[0]	5	
	[1]	"INLINE_TAG"	
	length	2	
	
	override public function create(...parameters):Object
	{
		if (parameters.length == 1)
			return createWithPayload(parameters[0]);
		
		return createTokenFromType(parameters[0], parameters[1]);
	}
	

	
	override public function createTokenFromType(tokenType:int, text:String):Token
	{
		return createWithPayload(new LinkedListToken(tokenType, text)) as Token;
		//return new LinkedListToken(tokenType, text);
	}
	
	override public function setTokenBoundaries(t:Object, 
												startToken:Token, 
												stopToken:Token):void
	{
		if (t == null)
			return;
		
		if (!(startToken is LinkedListTree))
			return;
		
		var tree:LinkedListTree = t as LinkedListTree;
		tree.setStartToken(LinkedListToken(startToken));
		tree.setStopToken(LinkedListToken(stopToken));
	}
	*/
}
}