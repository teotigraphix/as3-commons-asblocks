package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.IDocTag;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.asdoc.ASDocParser;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.IList;
import org.as3commons.lang.StringUtils;

public class ASTDocComment extends ASTScriptElement implements IDocComment
{
	private var _asdoc:LinkedListTree;

	public function ASTDocComment(ast:LinkedListTree)
	{
		super(ast);
		_asdoc = DocumentationUtils.buildASDoc(ast);
	}
	
	public function getDescription():String
	{
		return DocumentationUtils.getDescriptionString(ast);
	}

	
	public function setDescription(description:String):void
	{
		DocumentationUtils.setDescriptionString(ast, description);
		_asdoc = DocumentationUtils.buildASDoc(ast);
	}

	
	public function getShortDescription():String
	{
		return DocumentationUtils.getShortDescriptionString(ast);
	}

	
	public function getLongDescription():String
	{
		return DocumentationUtils.getLongDescriptionString(ast);
	}
	
	public function newDocTag(name:String, body:String = ""):IDocTag
	{
		DocumentationUtils.assertValidContent(body);
		var newline:String = DocumentationUtils.getNewlineText(ast, _asdoc);
		var tagname:String = tagName(name);
		if (_asdoc == null)
		{
			DocumentationUtils.setDocComment(ast, "\n" + tagname + " " + body + "\n");
			_asdoc = DocumentationUtils.buildASDoc(ast);
		}
		else
		{
			body = body.replace(/\n/g, newline);
			var lastChild:LinkedListTree = _asdoc.getLastChild();
			var para:LinkedListTree = DocumentationUtils.parseParaTag(tagname + " "	+ body);
			_asdoc.addChildWithTokens(para);
			// the final NL token doesn't usually have a '*' in it
			// (as the end-of-comment provides on) so lets make
			// sure we find that and re-insert it at the new end
			// of the comment
			var trainingNL:LinkedListTree = null;
			var lastChildLast:int = lastChild.childCount - 1;
			lastChild.addChildWithTokens(ASTUtils.newAST(ASDocParser.NL, newline));
			if (lastChild.getChild(lastChildLast).type == ASDocParser.NL)
			{
				trainingNL = LinkedListTree(lastChild.deleteChild(lastChildLast));
			}
			if (trainingNL != null)
			{
				para.addChildWithTokens(trainingNL);
			}
			commitModifiedAST();
			return new ASTDocTag(new ASTDocComment(_asdoc), para);
		}
		return null;
	}
	
	public function newDocTagAt(index:int, name:String, body:String = ""):IDocTag
	{
		DocumentationUtils.assertValidContent(body);
		var newline:String = DocumentationUtils.getNewlineText(ast, _asdoc);
		var tagname:String = tagName(name);
		
		// have to adjust for the fact the description will always be 0
		index = Math.max(1, index + 1);
		
		if (_asdoc == null)
		{
			DocumentationUtils.setDocComment(ast, "\n" + tagname + " " + body + "\n");
			_asdoc = DocumentationUtils.buildASDoc(ast);
		}
		else
		{
			if (_asdoc.childCount == 1 || index == _asdoc.childCount)
				return newDocTag(name, body);			
			
			body = body.replace(/\n/g, newline);
			// create the new AST for the doc tag
			var tag:LinkedListTree = DocumentationUtils.parseParaTag(tagname + " "	+ body);
			tag.addChildWithTokens(ASTUtils.newAST(ASDocParser.NL, newline));
			_asdoc.addChildAtWithTokens(index, tag);
			commitModifiedAST();
			return null;
		}
		return null;
	}
	
//	public function newDocTag(name:String):IDocTag
//	{
//		return newDocTag(name, "");
//	}
	
	public function hasDocTag(name:String):Boolean
	{
		if (_asdoc == null)
			return false;

		var tagname:String = tagName(name);
		var i:ASTIterator = new ASTIterator(_asdoc);
		var para:LinkedListTree;
		while ((para = i.search(ASDocParser.PARA_TAG)) != null)
		{
			if (nameText(para) == tagname)
				return true;

		}
		return false;
	}
	
	public function getAllTags():IList
	{
		if (_asdoc == null)
		{
			return new ArrayList();
		}
		var tags:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(_asdoc);
		var para:LinkedListTree;
		while ((para = i.search(ASDocParser.PARA_TAG)) != null)
		{
			var tag:LinkedListTree = para.getFirstChild();
			tags.add(new ASTDocTag(this, para));
		}
		return tags;
	}	
	
	public function getTags(name:String):IIterator
	{
		if (_asdoc == null)
		{
			return new ArrayList().iterator();
		}
		var tagname:String = tagName(name);
		var tags:IList = new ArrayList();
		var i:ASTIterator = new ASTIterator(_asdoc);
		var para:LinkedListTree;
		while ((para = i.search(ASDocParser.PARA_TAG)) != null)
		{
			if (nameText(para) == tagname)
			{
				tags.add(new ASTDocTag(this, para));
			}
		}
		return tags.iterator();
	}

	
	public function findFirstTag(name:String):IDocTag
	{
		if (_asdoc == null)
			return null;

		var tagname:String = tagName(name);
		var i:ASTIterator = new ASTIterator(_asdoc);
		var para:LinkedListTree;
		while ((para = i.search(ASDocParser.PARA_TAG)) != null)
		{
			if (nameText(para) == tagname)
			{
				return new ASTDocTag(this, para);
			}
		}
		return null;
	}

	
	public function removeDocTag(tag:IDocTag):Boolean
	{
		var tagAST:LinkedListTree = ASTDocTag(tag).getAST();
		var start:LinkedListToken = tagAST.getStartToken().getPrev();

		var index:int = _asdoc.getIndexOfChild(tagAST);
		
		// this chop has to happen on the last tag
		// if there is any tags BEFORE this tag, don't chop
		if (index == _asdoc.childCount - 1)
		{
			start.text = start.text.replace(" *", "");
		}

		_asdoc.deleteChild(index);

		commitModifiedAST();
		return true;
	}

	/**
	 * Stores modifications to the asdoc comment's AST back into the
	 * comment token in the containing ActionScript AST.
	 */
	public function commitModifiedAST():void
	{
		var doc:LinkedListToken = DocumentationUtils.findDocCommentToken(ast);
		var result:String = ASTUtils.stringifyNode(_asdoc);
		doc.text = "/**" + result + "*/";
	}

	private static function tagName(name:String):String
	{
		return "@" + name;
	}
	
	private static function nameText(para:LinkedListTree):String
	{
		var v:String = StringUtils.trim(para.getFirstChild().text);
		return v;
	}
}
}