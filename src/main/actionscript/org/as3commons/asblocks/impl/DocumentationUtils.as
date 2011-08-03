////////////////////////////////////////////////////////////////////////////////
// Copyright 2011 Michael Schmalle - Teoti Graphix, LLC
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package org.as3commons.asblocks.impl
{

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.runtime.MismatchedTokenException;
import org.antlr.runtime.RecognitionException;
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.dom.IDocComment;
import org.as3commons.asblocks.dom.IDocTag;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenSource;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.asblocks.parser.antlr.asdoc.ASDocHelper;
import org.as3commons.asblocks.parser.antlr.asdoc.ASDocLexer;
import org.as3commons.asblocks.parser.antlr.asdoc.ASDocParser;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.lang.StringBuffer;
import org.as3commons.lang.StringUtils;

public class DocumentationUtils
{
	private static const TREE_ADAPTOR:LinkedListTreeAdaptor = new LinkedListTreeAdaptor();

	public static function getDocComment(node:LinkedListTree):String
	{
		var tok:LinkedListToken = findDocCommentToken(node);
		if (tok == null)
			return null;
		return commentToString(tok);
	}

	public static function findDocCommentToken(node:LinkedListTree):LinkedListToken
	{
		node = findCommentStartAST(node);

		var tok:LinkedListToken = node.getStartToken();
		if (tok == null)
			return null;

		// find the first non-hidden token
		outer: while (true)
		{
			switch (tok.type)
			{
			case AS3Parser.WS:
			case AS3Parser.EOL:
			case AS3Parser.ML_COMMENT:
			case AS3Parser.SL_COMMENT:
				tok = tok.getNext();
				break;
			default:
				break outer;
			}
		}

		// search backwards from the first non-hidden token until 
		// we reach the first ML_COMMENT
		for (tok = tok.getPrev(); tok != null; tok = tok.getPrev())
		{
			switch (tok.type)
			{
			case AS3Parser.WS:
			case AS3Parser.EOL:
			case AS3Parser.SL_COMMENT:
			case AS3Parser.VIRTUAL_PLACEHOLDER:
				continue;
			case AS3Parser.ML_COMMENT:
				if (StringUtils.startsWith(StringUtils.trim(tok.text), "/\\*\\*"))
					return tok;
			default:
				return null;
			}
		}
		return null;
	}

	private static function commentToString(tok:LinkedListToken):String
	{
		var text:String = tok.text;
		
		text = text.replace(new RegExp("\\A/\\*+"), "");
		text = text.replace(new RegExp("(?:(?<=[\n\r])[ \t]+)?\\*+/\\Z"), "");
		text = text.replace(new RegExp("([\n\r])\\s*\\*", 'g'), "$1");
		
//		return tok.getText().replaceFirst("\\A/\\*+", "")
//		                    .replaceFirst("(?:(?<=[\n\r])[ \t]+)?\\*+/\\Z", "")
//		                    .replaceAll("([\n\r])\\s*\\*", "$1");
		
		return text;
	}

	public static function setDocComment(node:LinkedListTree, text:String):void
	{
		var tok:LinkedListToken = findDocCommentToken(node);
		if (text == null)
		{
			if (tok != null)
			{
				var next:LinkedListToken = tok.getNext();
				var prev:LinkedListToken = tok.getPrev();
				tok.deleteToken();
				// TODO: looks like I didn't finish here,
				if (next.type == AS3Parser.EOL)
				{
					next.getNext();
				}
				if (prev.type == AS3Parser.WS)
				{
					prev.getPrev();
				}
			}
			return;
		}
		assertValidContent(text);
		var indent:String = ASTUtils.findIndent(node);
		text = "/**" + text.replace(/(\n|\r\n|\r)/g, "$1" + indent + " *");
		
		//if (!text.endsWith("*"))
		if (text.charAt(text.length - 1) != "*")
		{
			text += "*";
		}
		text += "/";
		if (tok == null)
		{
			var comment:LinkedListToken = TokenBuilder.newMLComment(text);

			insertDocComment(node, indent, comment);
		}
		else
		{
			tok.text = text;
		}
	}

	private static function insertDocComment(node:LinkedListTree, indent:String,
			comment:LinkedListToken):void
	{
		var nl:LinkedListToken = TokenBuilder.newNewline();

		findTokenToInsertCommentBefore(node).prependToken(comment);
		comment.appendToken(nl);
		if (indent.length > 0)
		{
			var indentTok:LinkedListToken = TokenBuilder.newWhiteSpace(indent);
			nl.appendToken(indentTok);
		}
	}

	private static function findCommentStartAST(ast:LinkedListTree):LinkedListTree
	{
		var mods:LinkedListTree = ASTUtils.findChildByType(ast, AS3Parser.MODIFIERS);
		if (mods != null)
		{
			ast = mods;
		}
		return ast;
	}

	private static function findTokenToInsertCommentBefore(node:LinkedListTree):LinkedListToken
	{
		node = findCommentStartAST(node);

		var tok:LinkedListToken = node.getStartToken();
		outer: while (true)
		{
			switch (tok.type)
			{
			case AS3Parser.WS:
			case AS3Parser.EOL:
				tok = tok.getNext();
				break;
			default:
				break outer;
			}
		}
		return tok;
	}

	public static function assertValidContent(text:String):void
	{
		var pos:int = text.indexOf("*/");
		if (pos != -1)
		{
			throw new ASBlocksSyntaxError(
					"End-on-comment marker found at position " + pos);
		}
	}

	public static function increaseCommentIndent(tok:LinkedListToken, indent:String):void
	{
		tok.text = tok.text.replace("/(\n|\r\n|\r)/g", "$1" + indent);
	}

	public static function getDescriptionString(ast:LinkedListTree):String
	{
		var asdoc:LinkedListTree = buildASDoc(ast);
		if (asdoc == null)
			return null;
		var desc:LinkedListTree = asdoc.getFirstChild();
		return stringify(desc);
	}

	public static function getShortDescriptionString(ast:LinkedListTree):String
	{
		var asdoc:LinkedListTree = buildASDoc(ast);
		if (asdoc == null)
			return null;
		var desc:LinkedListTree = asdoc.getFirstChild();
		return stringifyShort(desc);
	}

	public static function getLongDescriptionString(ast:LinkedListTree):String
	{
		var asdoc:LinkedListTree = buildASDoc(ast);
		if (asdoc == null)
			return null;
		var desc:LinkedListTree = asdoc.getFirstChild();
		return stringifyLong(desc);
	}

	public static function buildASDoc(ast:LinkedListTree):LinkedListTree
	{
		var doc:LinkedListToken = findDocCommentToken(ast);
		if (doc == null)
			return null;
		var body:String = getCommentBody(doc);
		var asdoc:LinkedListTree = parse(body);
		return asdoc;
	}

	private static function getCommentBody(doc:LinkedListToken):String
	{
		var text:String = doc.text;
		return text.substring(3, text.length - 2);
	}

	private static function stringify(ast:LinkedListTree):String
	{
		var result:StringBuffer = new StringBuffer();
		for (var tok:LinkedListToken = ast.getStartToken(); tok != null
				&& tok.type != -1; tok = tok.getNext())
		{
			result.append(stringifyToken(tok));
			if (tok == ast.getStopToken())
				break;
		}
		return result.toString();
	}

	private static function stringifyShort(ast:LinkedListTree):String
	{
		var result:StringBuffer = new StringBuffer();
		for (var tok:LinkedListToken = ast.getStartToken(); tok != null
				&& tok.type != -1; tok = tok.getNext())
		{
			result.append(stringifyToken(tok));

			if (isShortEnd(tok))
				break;

			if (tok == ast.getStopToken())
				break;
		}
		// short descriptions are always trimmed
		return StringUtils.trim(result.toString());
	}

	private static function stringifyLong(ast:LinkedListTree):String
	{
		var comsume:Boolean = false;
		var result:StringBuffer = new StringBuffer();
		for (var tok:LinkedListToken = ast.getStartToken(); tok != null
				&& tok.type != -1; tok = tok.getNext())
		{
			if (comsume)
			{
				result.append(stringifyToken(tok));
			}
			if (!comsume)
			{
				comsume = isShortEnd(tok);
			}
			if (tok == ast.getStopToken())
				break;
		}
		// long descriptions are always trimmed
		return StringUtils.trim(result.toString());
	}

	private static function isShortEnd(tok:LinkedListToken):Boolean
	{
		var next:LinkedListToken = tok.getNext();
		if (next != null)
		{
			// the period is attached unless there is a space
			if (StringUtils.endsWith(tok.text, ".") && next.type == ASDocParser.NL)
				return true;
			if (tok.text == "." && next.type == ASDocParser.NL)
				return true;
		}
		return false;
	}

	private static function stringifyToken(tok:LinkedListToken):String
	{
		switch (tok.type)
		{
		case ASDocParser.NL:
			// TODO: use the original line-ending format
			return "\n";
		default:
			return tok.text;
		}
	}

	public static function setDescriptionString(ast:LinkedListTree, value:String):void
	{
		var commentToken:LinkedListToken = findDocCommentToken(ast);
		var asdoc:LinkedListTree = null;
		var descriptionAST:LinkedListTree = null;

		if (commentToken != null)
		{
			var body:String = getCommentBody(commentToken);
			// turn the string back into ASDoc AST
			asdoc = parse(body);
			// take the trailing EOFs off
			trimEOF(asdoc);
			// get the DESCRIPTION node
			descriptionAST = asdoc.getFirstChild();
		}

		// ASDOC/DESCRIPTION/(WS|WORD)*
		// ASDOC/DESCRIPTION/PARA_TAG*
		if (value == null)
		{
			// setting the comment to null will wipe out the doccomment token
			// and remove the AST from the parent
			//doc.delete();
			if (descriptionAST != null)
			{
				// ASTUtils.deleteAllChildren(descriptionAST);
				// leave the first child of the DESCRIPTION
				var first:LinkedListTree = LinkedListTree(descriptionAST.getChild(0));
				ASTUtils.deleteAllChildrenTo(descriptionAST, first);

				commentToken.text = "/**" + ASTUtils.stringifyNode(asdoc) + "*/";
			}
			return;
		}

		assertValidContent(value);
		var newline:String = getNewlineText(ast, asdoc);

		if (value.charAt(0) != "\n")
		{
			value = "\n" + value;
		}

		value = value.replace(/\n/g, newline);
		var newDesc:LinkedListTree = parseDescription(value);

		if (commentToken == null)
		{
			var indent:String = ASTUtils.findIndent(ast);
			var newComment:String = ASTUtils.stringifyNode(newDesc) + "\n" + indent;
			newComment = "/**" + newComment + " */";
			commentToken = TokenBuilder.newMLComment(newComment);
			insertDocComment(ast, indent, commentToken);
		}
		else
		{
			newDesc.appendToken(new LinkedListToken(ASDocParser.NL, newline));
			asdoc.setChildWithTokens(0, newDesc);
			commentToken.text = "/**" + ASTUtils.stringifyNode(asdoc) + "*/";
		}
	}

	public static function getNewlineText(ast:LinkedListTree, asdoc:LinkedListTree):String
	{
		var newline:String = null;
		if (asdoc != null)
		{
			newline = findNewline(asdoc);
		}
		if (newline == null)
		{
			newline = "\n" + ASTUtils.findIndent(ast) + " * "; // TODO: use document existing end-of-line format
		}
		return newline;
	}

	public static function findNewline(asdoc:LinkedListTree):String
	{
		var tok:LinkedListToken = asdoc.getStopToken();
		if (tok.type == ASDocParser.NL)
		{
			// Skip the very-last NL, since this will precede the
			// closing-comment marker, and therefore will lack the
			// '*' that should be present at the start of every
			// other line,
			tok = tok.getPrev();
		}
		for (; tok != null; tok = tok.getPrev())
		{
			if (tok.type == ASDocParser.NL)
			{
				return tok.text;
			}
		}
		return null;
	}

	private static function parseDescription(description:String):LinkedListTree
	{
		try
		{
			var parser:ASDocParser = parserOn(description);
			var desc:LinkedListTree = LinkedListTree(parser.description().tree);
			var after:LinkedListToken = LinkedListToken(parser.tokenStream.LT(1));
			if (!isEOF(after))
			{
				throw new ASBlocksSyntaxError(
						"trailing content after description: "
								+ ASTUtils.str(after.text));
			}
			trimEOF(desc);
			return desc;
		}
//		catch (IOException e)
//		{
//			throw new ASBlocksSyntaxError(e);
//		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	private static function isEOF(after:LinkedListToken):Boolean
	{
		return after.type == ASDocParser.EOF;
	}

	/**
	 * removes trailing enf-of-file tokens from the AST
	 */
	private static function trimEOF(desc:LinkedListTree):void
	{
		var lastChild:LinkedListTree = desc.getLastChild();
		if (lastChild != null)
		{
			trimEOF(lastChild);
		}
		while (isEOF(desc.getStopToken()))
		{
			var stop:LinkedListToken = desc.getStopToken();
			var prev:LinkedListToken = stop.getPrev();
			desc.setStopToken(prev);
			stop.deleteToken();
		}
	}

	private static function parse(body:String):LinkedListTree
	{
		try {
			var parser:ASDocParser = parserOn(body);
			var result:LinkedListTree = LinkedListTree(parser.commentBody().tree);
			trimEOF(result);
			return result;
		//} catch (IOException e) {
		//	throw new ASBlocksSyntaxError(e);
		} catch (e:RecognitionException) {
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseParaTag(text:String):LinkedListTree
	{
		try
		{
			var parser:ASDocParser = parserOn(text);
			var result:LinkedListTree = LinkedListTree(parser.paragraphTag().tree);
			trimEOF(result);
			return result;
		}
//		catch (IOException e)
//		{
//			throw new ASBlocksSyntaxError(e);
//		}
		catch (e:MismatchedTokenException)
		{
			throw new ASBlocksSyntaxError("Expexted "
					+ ASDocParser.tokenNames[e.expecting] + " but found "
					+ ASDocParser.tokenNames[e.unexpectedType], e);
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	private static function parserOn(text:String):ASDocParser
	{
		//StringReader in = new StringReader(text);
		var cs:ANTLRStringStream = new ANTLRStringStream(text);
		var lexer:ASDocLexer = new ASDocLexer(cs);
		var source:LinkedListTokenSource = new LinkedListTokenSource(lexer);
		var stream:LinkedListTokenStream = new LinkedListTokenStream(source);
		var parser:ASDocParser = new ASDocParser(stream);
		parser.treeAdaptor = TREE_ADAPTOR;
		return parser;
	}

	public static function createDocComment(ast:LinkedListTree):ASTDocComment
	{
		return new ASTDocComment(ast);
	}

	public static function findParam(doc:IDocComment, name:String):IDocTag
	{
		var params:IIterator = doc.getTags("param");
		//Pattern p = Pattern.compile("\\s*\\Q" + name + "\\E\\b");

		while (params.hasNext())
		{
			var param:IDocTag = params.next() as IDocTag;
			if (param.getBody().match("\\s*\\Q" + name + "\\E\\b").length > 0)
			{
				return param;
			}
		}
		
		return null;
	}
}
}