package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IScriptElement;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.lang.StringUtils;

public class CommentUtils
{
	public static function appendSLComment(element:IScriptElement, value:String):void
	{
		appendSLCommentAST(ASTScriptElement(element).getAST(), value);
	}

	public static function prependSLComment(element:IScriptElement, value:String):void
	{
		prependSLCommentAST(ASTScriptElement(element).getAST(), value);
	}

	public static function appendSLCommentAST(ast:LinkedListTree, value:String):void
	{
		var comment:LinkedListToken = TokenBuilder.newSLComment("//" + value);
		var indent:String = findIndentForComment(ast);
		// add the EOL after the last statement
		ast.appendToken(TokenBuilder.newNewline());
		// add the whitespace indent to push the comment in
		ast.appendToken(TokenBuilder.newWhiteSpace(indent));
		// add the actual // comment text into the token stream
		ast.appendToken(comment);
	}

	public static function prependSLCommentAST(ast:LinkedListTree, value:String):void
	{
		var comment:LinkedListToken = TokenBuilder.newSLComment("//" + value);
		var indent:String = findIndentForComment(ast);

		ast.prependToken(TokenBuilder.newWhiteSpace(indent));
		// add the actual // comment text into the token stream		
		// add the EOL after the last statement
		ast.prependToken(TokenBuilder.newNewline());
		// add the whitespace indent to push the comment in

		ast.prependToken(comment);
	}

	private static function findIndentForComment(ast:LinkedListTree):String
	{
		var last:LinkedListTree = ast.getLastChild();
		var indent:String;
		if (last == null)
		{
			indent = "\t" + ASTUtils.findIndent(ast);
		}
		else
		{
			indent = ASTUtils.findIndent(last);
		}
		return indent;
	}
	
	public static function prependMLComment(node:LinkedListTree, text:String):void
	{
		var tok:LinkedListToken = null;
		
		//		assertValidContent(text);
		var indent:String = ASTUtils.findIndent(node);
		text = "/*" + text.replace(/(\n|\r\n|\r)/g, "$1" + indent + " *");
		if (!StringUtils.endsWith(text, "*"))
		{
			text += "*";
		}
		text += "/";
		if (tok == null)
		{
			var comment:LinkedListToken = TokenBuilder.newMLComment(text);

			insertMLComment(node, indent, comment);
		}
//		else
//		{
//			tok.setText(text);
//		}
	}	

	public static function appendMLComment(node:LinkedListTree, text:String):void
	{
		//LinkedListToken tok = findDocCommentToken(node);
		var tok:LinkedListToken = null; // = node.getStopToken();
		
		//		assertValidContent(text);
		var indent:String = ASTUtils.findIndent(node);
		text = "/*" + text.replace(/(\n|\r\n|\r)/g, "$1" + indent + " *");
		if (!StringUtils.endsWith(text, "*"))
		{
			text += "*";
		}
		text += "/";
		if (tok == null)
		{
			var comment:LinkedListToken = TokenBuilder.newMLComment(text);

			insertMLComment(node, indent, comment);
		}
//		else
//		{
//			tok.setText(text);
//		}
	}

	private static function insertMLComment(node:LinkedListTree, indent:String,
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

	private static function findTokenToInsertCommentBefore(
			node:LinkedListTree):LinkedListToken
	{
		//node = findCommentStartAST(node);

		var tok:LinkedListToken = node.getStartToken();
		outer: while (true)
		{
			switch (tok.type)
			{
			case AS3Parser.WS:
//			case AS3Parser.EOL:
				tok = tok.getNext();
				break;
			default:
				break outer;
			}
		}
		return tok;
	}
}
}