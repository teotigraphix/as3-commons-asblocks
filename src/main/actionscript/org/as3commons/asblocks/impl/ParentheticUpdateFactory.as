package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.parser.antlr.BasicListUpdateDelegate;
import org.as3commons.asblocks.parser.antlr.IDelegateFactory;
import org.as3commons.asblocks.parser.antlr.ITreeTokenListUpdateDelegate;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ParentheticUpdateFactory implements IDelegateFactory
{
	private var basicDelegate:BasicListUpdateDelegate = new BasicListUpdateDelegate();
	private var blockDelegate:ParentheticListUpdateDelegate = new ParentheticListUpdateDelegate(AS3Parser.LBRACE, AS3Parser.RBRACE);
	private var metadataTagDelegate:ParentheticListUpdateDelegate = new ParentheticListUpdateDelegate(AS3Parser.LBRACK, AS3Parser.RBRACK);
	private var paramsDelegate:ParentheticListUpdateDelegate = new ParentheticListUpdateDelegate(AS3Parser.LPAREN, AS3Parser.RPAREN);
	
	public function ParentheticUpdateFactory()
	{
	}
	
	public function create(payload:LinkedListTree):ITreeTokenListUpdateDelegate
	{
		if (payload.isNil)
			return basicDelegate;
		
		switch (payload.type)
		{
			case AS3Parser.BLOCK:
			case AS3Parser.TYPE_BLOCK:
			case AS3Parser.OBJECT_LITERAL:
				return blockDelegate;
			case AS3Parser.METATAG:
			case AS3Parser.ARRAY_LITERAL:
				return metadataTagDelegate;
			case AS3Parser.PARAMS:
			case AS3Parser.METATAG_PARAMS:
			case AS3Parser.ARGUMENTS:
			case AS3Parser.ENCPS_EXPR:
			case AS3Parser.CONDITION:
				return paramsDelegate;
			default:
				return basicDelegate;
		}
	}
}
}