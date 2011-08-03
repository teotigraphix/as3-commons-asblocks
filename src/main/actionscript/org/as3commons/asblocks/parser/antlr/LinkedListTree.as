package org.as3commons.asblocks.parser.antlr
{

import org.antlr.runtime.Token;
import org.antlr.runtime.tree.BaseTree;
import org.antlr.runtime.tree.CommonTree;
import org.antlr.runtime.tree.Tree;

public class LinkedListTree extends CommonTree
{
	private function get parentTree():LinkedListTree
	{
		return parent as LinkedListTree;
	}

	private var startToken:LinkedListToken;
	private var stopToken:LinkedListToken;

	protected var initialInsertionAfter:LinkedListToken;
	protected var initialInsertionBefore:LinkedListToken;

	public var tokenListUpdater:ITreeTokenListUpdateDelegate;

	public function LinkedListTree(node:Tree = null)
	{
		super(node as CommonTree);
		
		if (node is LinkedListTree)
			_token = LinkedListTree(node).token;
	}
	
	public function setToken(token:Token):void
	{
		_token = token;
	}
	
//	public TreeTokenListUpdateDelegate getTokenListUpdater() {
//		return tokenListUpdater;
//	}
//	public void setTokenListUpdater(TreeTokenListUpdateDelegate tokenListUpdater) {
//		this.tokenListUpdater = tokenListUpdater;
//	}

//	public function setParent(parent:LinkedListTree):void {
//		this.parent = parent;
//	}
//	public function getParent():LinkedListTree {
//		return parent;
//	}

	override public function dupNode():Tree
	{
		return new LinkedListTree(this);
	}

	override public function get type():int
	{
		if (token == null)
			return 0;
		
		return token.type;
	}

	public function getText():String
	{
		return toString();
	}

	override public function get isNil():Boolean
	{
		return token == null;
	}
	
	public function getToken():Token
	{
		return token;
	}

	public function getLine():int
	{
		if (token==null || token.line==0)
		{
			if (childCount > 0)
				return getChild(0).line;
			
			return 0;
		}
		return token.line;
	}

	override public function get charPositionInLine():int
	{
		if (token==null || token.charPositionInLine==-1)
		{
			if (childCount > 0)
				return getChild(0).charPositionInLine;
			
			return 0;
		}
		return token.charPositionInLine;
	}

	override public function toString():String
	{
		if (isNil)
			return "nil";
		
		return token.text;
	}

	public function getFirstChild():LinkedListTree
	{
		if (childCount == 0)
			return null;
		
		return LinkedListTree(getChild(0));
	}

	public function getLastChild():LinkedListTree
	{
		var c:int = childCount;
		if (c == 0)
			return null;
		
		return LinkedListTree(getChild(c-1));
	}
	
	public function getIndexOfChild(child:LinkedListTree):int
	{
		return children.indexOf(child);
	}

	/**
	 * Adds the given child node to the end of the list of children
	 * maintanined by the given parent node, and inserts the tokens
	 * belonging to child into the tokenlist of parent just after the
	 * stop-token of the previous last child.
	 */
	public function addChildWithTokens(child:LinkedListTree):void
	{
		addChild(child);
		tokenListUpdater.addedChild(this, child);
	}

	public function setChildWithTokens(index:int, child:LinkedListTree):void
	{
		var oldChild:LinkedListTree = LinkedListTree(getChild(index));
		setChild(index, child);
		tokenListUpdater.replacedChildAt(this, index, child, oldChild);
	}
	// changed : was overloaded addChildWithTokens()
	public function addChildAtWithTokens(index:int, child:LinkedListTree):void
	{
		if (children == null) {
//			createChildrenList();
		}
		//children.add(index, child);
		children.splice(index, 0, child);
		if (child != null)
		{
			child.parent = this;
		}
		tokenListUpdater.addedChildAt(this, index, child);
	}

	/**
	 * @deprecated use #addChildWithTokens(LinkedListTree), damnit
	 */
	override public function addChild(child:Tree):void
	{
		super.addChild(child);
		if (child != null)
		{
			LinkedListTree(child).parent = this;
		}
	}

	/**
	 * @deprecated use #setChildWithTokens(int,LinkedListTree), damnit
	 */
	override public function setChild(index:int, child:Tree):void
	{
		super.setChild(index, child);
		
		LinkedListTree(child).parent = this;
	}

	override public function deleteChild(index:int):Object
	{
		// There is a bug in BaseTree that calls children.remove()
		// obviously remove() is not found on an Array
		//var result:LinkedListTree = LinkedListTree(super.deleteChild(index));
		var result:LinkedListTree = LinkedListTree(getChild(index));
		children.splice(index, 1);
		tokenListUpdater.deletedChildAt(this, index, result);
		result.parent = null;
		
		return result;
	}

	public function appendToken(append:LinkedListToken):void
	{
		tokenListUpdater.appendToken(this, append);
	}

	public function prependToken(append:LinkedListToken):void
	{
		tokenListUpdater.addTokenAt(this, 0, append);
	}
	
	public function addToken(index:int, append:LinkedListToken):void
	{
		tokenListUpdater.addTokenAt(this, index, append);
	}

	public function setInitialInsertionAfter(insert:LinkedListToken):void
	{
		initialInsertionAfter = insert;
	}

	public function setInitialInsertionBefore(insert:LinkedListToken):void
	{
		initialInsertionBefore = insert;
	}

	public function getInitialInsertionAfter():LinkedListToken
	{
		return initialInsertionAfter;
	}

	public function getInitialInsertionBefore():LinkedListToken
	{
		return initialInsertionBefore;
	}

	public function setStartToken(startToken:LinkedListToken):void
	{
		if (parentTree != null) {
			parentTree.notifyChildStartTokenChange(this, startToken);
		}
		this.startToken = startToken;
	}

	public function getStartToken():LinkedListToken
	{
		return startToken;
	}

	public function setStopToken(stopToken:LinkedListToken):LinkedListToken
	{
		if (parentTree != null) {
			parentTree.notifyChildStopTokenChange(this, stopToken);
		}
		return this.stopToken = stopToken;
	}

	public function getStopToken():LinkedListToken
	{
		return stopToken;
	}

	/**
	 * called when one of this node's children updates it's start-token,
	 * so that this node can potentially take action; maybe by setting
	 * the same start-token IF the child was the very-first in this node's
	 * list of children.
	 */
	private function notifyChildStartTokenChange(child:LinkedListTree, 
												 newStart:LinkedListToken):void
	{
		// TODO: maybe move to delegates
		if (isFirst(child) && isSameStartToken(child)) {
			setStartToken(newStart);
		}
	}

	private function isSameStartToken(child:LinkedListTree):Boolean
	{
		return child.getStartToken() == getStartToken();
	}

	private function isFirst(child:LinkedListTree):Boolean
	{
		return child == getFirstChild();
	}

	/**
	 * called when one of this node's children updates it's stop-token,
	 * so that this node can potentially take action; maybe by setting
	 * the same stop-token IF the child was the very-last in this node's
	 * list of children.
	 */
	private function notifyChildStopTokenChange(child:LinkedListTree, 
												newStop:LinkedListToken):void
	{
		// TODO: maybe move to delegates
		if (isLast(child) && (isSameStopToken(child) || isNoStopToken(child)))
		{
			setStopToken(newStop);
		}
	}

	private function isNoStopToken(child:LinkedListTree):Boolean
	{
		return child.getStopToken() == null;
	}

	private function isSameStopToken(child:LinkedListTree):Boolean
	{
		return child.getStopToken() == getStopToken();
	}

	private function isLast(child:LinkedListTree):Boolean
	{
		return child == getLastChild();
	}

	public function getTokenStartIndex():int
	{
		throw new Error("unimplemented");
	}

	public function getTokenStopIndex():int
	{
		throw new Error("unimplemented");
	}

	public function setTokenStartIndex(arg0:int):void
	{
		throw new Error("unimplemented");
	}

	public function setTokenStopIndex(arg0:int):void
	{
		throw new Error("unimplemented");
	}

}
}