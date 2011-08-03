package org.as3commons.asblocks.parser.antlr
{
public interface ITreeTokenListUpdateDelegate
{
	function addedChild(parent:LinkedListTree, 
						child:LinkedListTree):void;
	
	function addedChildAt(parent:LinkedListTree, 
						  index:int, 
						  child:LinkedListTree):void;
	
	function appendToken(parent:LinkedListTree, 
						 append:LinkedListToken):void;
	
	function addTokenAt(parent:LinkedListTree, 
						index:int, 
						append:LinkedListToken):void;
	
	function deletedChildAt(parent:LinkedListTree, 
							index:int, 
							child:LinkedListTree):void;
	
	function replacedChildAt(tree:LinkedListTree, 
							 index:int, 
							 child:LinkedListTree, 
							 oldChild:LinkedListTree):void;

}
}