package org.as3commons.asblocks.parser.antlr
{
import flash.errors.IllegalOperationError;

import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.impl.TokenBuilder;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.IllegalStateError;

public class BasicListUpdateDelegate implements ITreeTokenListUpdateDelegate
{
	// TODO: delete PLACEHOLDER tokens when they are superseded by the addition of real tokens

	public function addedChild(parent:LinkedListTree, child:LinkedListTree):void
	{
		if (isPlaceholder(parent))
		{
			if (isPlaceholder(child))
			{
				throw new IllegalArgumentError(
						"The parent node ("
								+ ASTUtils.tokenNameFromAST(parent)
								+ ") has only a placeholder token, so a child which also has only a placeholder token ("
								+ ASTUtils.tokenNameFromAST(child)
								+ ") can't be added yet");
			}
			var placeholder:LinkedListToken = parent.getStartToken();
			if (placeholder.getPrev() != null)
			{
				placeholder.getPrev().setNext(child.getStartToken());
			}
			if (placeholder.getNext() != null)
			{
				placeholder.getNext().setPrev(child.getStopToken());
			}
			parent.setStartToken(child.getStartToken());
			parent.setStopToken(child.getStopToken());
			return;
		}
		var stop:LinkedListToken = findTokenInsertionPointForChildWithinParent(
				parent, child);
		if (parent.getStartToken() == null)
		{
			parent.setStartToken(child.getStartToken());
		}
		if (stop != null)
		{
			insertAfter(stop, stop.getNext(), child.getStartToken(),
					child.getStopToken());
		}
		if (child.getStopToken() != null)
		{
			parent.setStopToken(child.getStopToken());
		}
	}

	private function isPlaceholder(ast:LinkedListTree):Boolean
	{
		return ast.getStartToken() == ast.getStopToken()
				&& ast.getStartToken() != null
				&& ast.getStartToken().type == AS3Parser.VIRTUAL_PLACEHOLDER
				&& PlaceholderLinkedListToken(ast.getStartToken()).held == ast;
	}

	private function findTokenInsertionPointForChildWithinParent(
			parent:LinkedListTree, child:LinkedListTree):LinkedListToken
	{
		// FIXME: this fails to take into account am ancestor not
		// having the same kind of TreeTokenListUpdateDelegate
		while (parent != null)
		{
			if (parent.childCount == 1)
			{
				// the just-added child is the only child of 'parent'
				if (parent.getStopToken() != null)
				{
					return parent.getStopToken();
				}
				if (parent.getStartToken() != null)
				{
					return parent.getStartToken();
				}
			}
			var index:int = parent.getIndexOfChild(child);
			if (index > 0 && index < parent.childCount - 1)
			{
				// 'child' is not the *first* child of 'parent'
				var precedent:LinkedListTree = parent.getChild(index - 1) as LinkedListTree;
				if (precedent.getStopToken() == null)
				{
					// TODO: loop, rather than recurse,
					return findTokenInsertionPointForChildWithinParent(parent,
							precedent);
				}
				return precedent.getStopToken();
			}
			if (index == 0 && parent.getStartToken() != null)
			{
				return parent.getStartToken();
			}
			if (parent.getStopToken() != null)
			{
				return parent.getStopToken();
			}
			child = parent;
			parent = parent.parent as LinkedListTree;
		}
		return null;
	}

	public function addedChildAt(parent:LinkedListTree, index:int,
			child:LinkedListTree):void
	{
		var target:LinkedListToken;
		var targetNext:LinkedListToken;
		if (index == 0)
		{
			var prevFirstChild:LinkedListTree = parent.getChild(1) as LinkedListTree;
			targetNext = prevFirstChild.getStartToken();
			target = targetNext.getPrev();
			if (targetNext == parent.getStartToken())
			{
				parent.setStartToken(child.getStartToken());
			}
		}
		else
		{
			target = LinkedListTree(parent.getChild(index - 1)).getStopToken();
			targetNext = target.getNext();
		}
		insertAfter(target, targetNext, child.getStartToken(),
				child.getStopToken());
	}

	protected static function insertAfter(target:LinkedListToken,
			targetNext:LinkedListToken, start:LinkedListToken,
			stop:LinkedListToken):void
	{
		if (target == null && targetNext == null)
		{
			throw new IllegalArgumentError(
					"At least one of target and targetNext must be non-null");
		}
		if (start != null)
		{
			//			if (start.getPrev() != null || stop.getNext() != null) {
			//				throw new IllegalArgumentException("insertAfter("+target+", "+targetNext+", "+start+", "+stop+") : start.getPrev()="+start.getPrev()+" stop.getNext()="+stop.getNext());
			//			}
			// i.e. we're not adding an imaginary node that currently
			//      has no real children
			if (target != null)
			{
				target.setNext(start);
			}
			stop.setNext(targetNext);
			if (targetNext != null)
			{
				targetNext.setPrev(stop);
			}
		}
	}

	public function appendToken(parent:LinkedListTree, append:LinkedListToken):void
	{
		if (parent.getStopToken() == null)
		{
			parent.setStartToken(append);
			parent.setStopToken(append);
		}
		else
		{
			// TODO: can this be simplified now?
			append.setNext(parent.getStopToken().getNext());
			parent.getStopToken().setNext(append);
			append.setPrev(parent.getStopToken());
			parent.setStopToken(append);
		}
	}

	public function addTokenAt(parent:LinkedListTree, index:int,
			append:LinkedListToken):void
	{
		if (isPlaceholder(parent))
		{
			var placeholder:LinkedListToken = parent.getStartToken();
			parent.setStartToken(append);
			parent.setStopToken(append);
			placeholder.setPrev(null);
			placeholder.setNext(null);
		}
		if (parent.getStopToken() == null)
		{
			parent.setStartToken(append);
			parent.setStopToken(append);
		}
		else
		{
			var target:LinkedListToken;
			var targetNext:LinkedListToken;
			if (index == 0)
			{
				targetNext = parent.getStartToken();
				target = targetNext.getPrev();
				parent.setStartToken(append);
			}
			else if (index == parent.childCount)
			{
				target = parent.getStopToken();
				targetNext = target.getNext();
				parent.setStopToken(append);
			}
			else
			{
				var beforeChild:LinkedListTree = parent.getChild(index) as LinkedListTree;
				targetNext = beforeChild.getStartToken();
				target = targetNext.getPrev();
			}
			insertAfter(target, targetNext, append, append);
		}
	}

	public function deletedChildAt(parent:LinkedListTree, index:int,
			child:LinkedListTree):void
	{
		// FIXME: this should update start/stop tokens for the parent
		//        when the first/last child is removed
		var start:LinkedListToken = child.getStartToken();
		var stop:LinkedListToken = child.getStopToken();
		var prevStart:LinkedListToken = start.getPrev();
		var nextStop:LinkedListToken = stop.getNext();
		//		if (startPrev == null) {
		//			throw new IllegalArgumentException("No start.prev: "+child);
		//		}
		//		if (stopNext == null) {
		//			throw new IllegalArgumentException("No stop.next: "+child+" (stop="+stop+")");
		//		}
		if (parent.childCount == 0 && start == parent.getStartToken()
				&& stop == parent.getStopToken())
		{
			// So, the child provided all the tokens that made up
			// the parent, and removing it will leave nothing!  In
			// this case, we insert a 'placeholder' token just so
			// there's something in the token stream for the parent
			// to reference, and the parent remains anchored to the
			// appropriate location within the source code
			var placeholder:LinkedListToken = TokenBuilder.newPlaceholder(parent);
			// XXX FIGURE OUT!
			if (prevStart != null)
			{
				prevStart.setNext(placeholder);
			}
			nextStop.setPrev(placeholder);
		}
		else
		{
			if (prevStart != null)
			{
				prevStart.setNext(nextStop);
			}
			else if (nextStop != null)
			{ // so try the other way around,
				nextStop.setPrev(prevStart);
			}
			if (parent.getStartToken() == start)
			{
				parent.setStartToken(nextStop);
			}
			if (parent.getStopToken() == stop)
			{
				parent.setStopToken(prevStart);
			}
		}
		// just to save possible confusion, break links out from the
		// removed token list too,
		start.setPrev(null);
		stop.setNext(null);
	}

	public function replacedChildAt(tree:LinkedListTree, index:int,
			child:LinkedListTree, oldChild:LinkedListTree):void
	{
		// defensive assertions to catch bugs,
		if (child.getStartToken() == null)
		{
			throw new IllegalArgumentError("No startToken: " + child);
		}
		if (child.getStopToken() == null)
		{
			throw new IllegalArgumentError("No stopToken: " + child);
		}
		// link the new child's tokens in place of the old,
		var oldBefore:LinkedListToken = findOldBeforeToken(tree, index, child,
				oldChild);
		var oldAfter:LinkedListToken = findOldAfterToken(tree, index, child,
				oldChild);
		if (oldBefore != null)
		{
			oldBefore.setNext(child.getStartToken());
		}
		if (oldAfter != null)
		{
			oldAfter.setPrev(child.getStopToken());
		}
		// just to save possible confusion, break links out from the
		// removed token list too,
		oldChild.getStartToken().setPrev(null);
		oldChild.getStopToken().setNext(null);

		if (tree.getStartToken() == oldChild.getStartToken())
		{
			tree.setStartToken(child.getStartToken());
		}
		if (tree.getStopToken() == oldChild.getStopToken())
		{
			tree.setStopToken(child.getStopToken());
		}
	}

	private function findOldBeforeToken(tree:LinkedListTree, index:int,
			child:LinkedListTree, oldChild:LinkedListTree):LinkedListToken
	{
		var oldStart:LinkedListToken = oldChild.getStartToken();
		if (oldStart == null)
		{
			throw new IllegalStateError("<" + oldChild + ">, child "
					+ index + " of <" + tree + ">, had no startToken");
		}
		return oldStart.getPrev();
	}

	private function findOldAfterToken(tree:LinkedListTree, index:int,
			child:LinkedListTree, oldChild:LinkedListTree):LinkedListToken
	{
		var oldStop:LinkedListToken = oldChild.getStopToken();
		if (oldStop == null)
		{
			throw new IllegalStateError("<" + oldChild + ">, child "
					+ index + " of <" + tree + ">, had no stopToken");
		}
		return oldStop.getNext();
	}
}
}