package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.error.NoSuchElementError;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.IllegalStateError;
import org.flexunit.Assert;

public class TestASTIterator
{
	[Test]
	public function testCtor():void
	{
		try {
			new ASTIterator(null);
			Assert.fail("should have rejected null constructor argument");
		} catch (e:IllegalArgumentError) {
			// expected
		}
	}
	
	[Test]
	public function testNextNoElement():void
	{
		var i:ASTIterator = iterateTreeWithSingleChild();
		i.next();
		try {
			i.next();
			Assert.fail("expected exception when there is no next element");
		} catch (e:NoSuchElementError) {
			// expected
		}
	}
	
	[Test]
	public function testTypedNextNoElement():void
	{
		var i:ASTIterator = iterateTreeWithSingleChild();
		i.next();
		try {
			i.next(AS3Parser.DECIMAL_LITERAL);
			Assert.fail("expected exception when there is no next element");
		} catch (e:IllegalStateError) {
			// expected
		}
	}
	
	[Test]
	public function testTypedNextNotFound():void
	{
		var i:ASTIterator = iterateTreeWithSingleChild();
		try {
			i.next(AS3Parser.STRING_LITERAL);
			Assert.fail("expected exception when the next element is of the wrong type");
		} catch (e:IllegalStateError) {
			// expected
		}
	}
	
	[Test]
	public function testTypedNextFound():void
	{
		var i:ASTIterator = iterateTreeWithSingleChild();
		var ast:LinkedListTree = i.next(AS3Parser.DECIMAL_LITERAL);
		Assert.assertEquals("200", ast.getText());
	}
	
	[Test]
	public function testFindNotFound():void
	{
		var i:ASTIterator = iterateTreeWithSingleChild();
		try {
			i.find(AS3Parser.STRING_LITERAL);
			Assert.fail("expected exception when no child has the given type");
		} catch (e:IllegalStateError) {
			// expected
		}
	}
	
	private function iterateTreeWithSingleChild():ASTIterator
	{
		var tree:LinkedListTree = ASTUtils.newAST(AS3Parser.DECIMAL_LITERAL, "100");
		tree.addChildWithTokens(ASTUtils.newAST(AS3Parser.DECIMAL_LITERAL, "200"));
		return new ASTIterator(tree);
	}	
}
}