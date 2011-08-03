package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.parser.antlr.ITreeTokenListUpdateDelegate;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.IllegalArgumentError;

public class ParentheticListUpdateDelegate implements ITreeTokenListUpdateDelegate
{
	private var tokenTypeOpen:int;
	private var tokenTypeClose:int;	
	
	public function ParentheticListUpdateDelegate(tokenTypeOpen:int, tokenTypeClose:int)
	{
		this.tokenTypeOpen = tokenTypeOpen;
		this.tokenTypeClose = tokenTypeClose;
	}
	
	public function addedChild(parent:LinkedListTree, 
							   child:LinkedListTree):void
	{
		var insert:LinkedListToken = findClose(parent).getPrev();
		insertAfter(insert, insert.getNext(),
		            child.getStartToken(), child.getStopToken());		
	}
	
	private function findOpen(parent:LinkedListTree):LinkedListToken
	{
		for (var tok:LinkedListToken=parent.getStartToken(); tok!=null; tok=tok.getNext()) {
			if (tok.type == tokenTypeOpen) {
				return tok;
			}
		}
		return null;
	}	
	
	private function findClose(parent:LinkedListTree):LinkedListToken
	{
		for (var tok:LinkedListToken=parent.getStopToken(); tok!=null; tok=tok.getPrev()) {
			if (tok.type == tokenTypeClose) {
				return maybeSkiptoLinePreceeding(tok);
			}
		}
		return null;
	}
	
	private function maybeSkiptoLinePreceeding(target:LinkedListToken):LinkedListToken
	{
		for (var tok:LinkedListToken=target.getPrev(); tok!=null; tok=tok.getPrev()) {
			switch (tok.type) {
			case AS3Parser.WS:
				continue;
			case AS3Parser.EOL:
				return tok;
			default:
				return target;
			}
		}
		return target;
	}	
	
	protected static function insertAfter(target:LinkedListToken, 
										  targetNext:LinkedListToken,
										  start:LinkedListToken, 
										  stop:LinkedListToken):void
	{
		if (target == null && targetNext == null) {
			throw new IllegalArgumentError("At least one of target and targetNext must be non-null");
		}
		if (start != null) {
			// i.e. we're not adding an imaginary node that currently
			//      has no real children
			if (target != null) {
				target.setNext(start);
			}
			stop.setNext(targetNext);
			if (targetNext != null) {
				targetNext.setPrev(stop);
			}
		}
	}	
	
	public function addedChildAt(parent:LinkedListTree, 
								 index:int, 
								 child:LinkedListTree):void
	{
		var target:LinkedListToken;
		var targetNext:LinkedListToken;
		if (index == 0) {
			target = findOpen(parent);
			targetNext = target.getNext();
		} else {
			var prev:LinkedListTree = LinkedListTree(parent.getChild(index - 1));
			target = prev.getStopToken();
			targetNext = target.getNext();
		}
		insertAfter(target, targetNext,
		            child.getStartToken(), child.getStopToken());		
	}
	
	public function appendToken(parent:LinkedListTree, 
								append:LinkedListToken):void
	{
		var insert:LinkedListToken = findClose(parent).getPrev();
		insertAfter(insert, insert.getNext(),
		            append, append);		
	}
	
	public function addTokenAt(parent:LinkedListTree, 
							   index:int, 
							   append:LinkedListToken):void
	{
		var target:LinkedListToken;
		var targetNext:LinkedListToken;
		if (index == 0) {
			target = findOpen(parent);
			targetNext = target.getNext();
		} else {
			var beforeChild:LinkedListTree = LinkedListTree(parent.getChild(index));
			targetNext = beforeChild.getStartToken();
			target = targetNext.getPrev();
		}
		insertAfter(target, targetNext,
		            append, append);		
	}
	
	public function deletedChildAt(parent:LinkedListTree, 
								   index:int, 
								   child:LinkedListTree):void
	{
		var start:LinkedListToken = child.getStartToken();
		var stop:LinkedListToken = child.getStopToken();
		var startPrev:LinkedListToken = start.getPrev();
		var stopNext:LinkedListToken = stop.getNext();
		if (startPrev != null) {
			startPrev.setNext(stopNext);
		} else if (stopNext != null) {
			stopNext.setPrev(startPrev);
		}
		// just to save possible confusion, break links out from the
		// removed token list too,
		start.setPrev(null);
		stop.setNext(null);		
	}
	
	public function replacedChildAt(tree:LinkedListTree, 
									index:int, 
									child:LinkedListTree, 
									oldChild:LinkedListTree):void
	{
		// TODO Is this an ERROR? condition test killed the previous
		
		// link the new child's tokens in place of the old,
		if (oldChild.getStartToken().getPrev())
		{
			oldChild.getStartToken().getPrev().setNext(child.getStartToken());
		}
		
		oldChild.getStopToken().getNext().setPrev(child.getStopToken());
		// just to save possible confusion, break links out from the
		// removed token list too,
		oldChild.getStartToken().setPrev(null);
		oldChild.getStopToken().setNext(null);		
	}
}
}