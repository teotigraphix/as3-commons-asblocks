package org.as3commons.asblocks.impl
{

import org.antlr.runtime.ParserRuleReturnScope;
import org.antlr.runtime.RecognitionException;
import org.antlr.runtime.TokenStream;
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class AS3FragmentParser
{
	public static function parseStatement(statement:String):LinkedListTree
	{
		// We need to add a ';' so that LA(2) at the end of an
		// expression-statement will not unexpectedly find EOF. we add
		// a second ';' so that the trailing ';' can simply be omitted
		// by the caller
		var parser:AS3Parser = ASTUtils.parse(statement + ";;");
		var stmt:LinkedListTree;
		try
		{
			stmt = tree(parser.statement());
		}
		catch (e:RecognitionException)
		{
			throw ASTUtils.buildSyntaxException(statement, parser, e);
		}
		return stmt;
	}

	public static function parseExprStatement(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ";");
		try
		{
			return tree(parser.expressionStatement());
		}
		catch (e:RecognitionException)
		{
			throw ASTUtils.buildSyntaxException(expr, parser, e);
		}
		return null;
	}

	/**
	 * Attempts to parse the given string as an AS3 expression for use as
	 * a parenthesised conditional or with-statement parameter (the
	 * surronding parenthesis should not be included).
	 * 
	 * @throws ASBlocksSyntaxError if the given text doesn't form a valid
	 * expression.
	 */
	public static function parseCondition(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse("(" + expr + ")");
		try
		{
			return tree(parser.condition());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid condition "
					+ ASTUtils.str(expr), e);
		}
		return null;
	}

	/**
	 * Attempts to parse the given string as an AS3 expression.
	 * 
	 * @throws ASBlocksSyntaxError if the given text doesn't form a valid
	 * expression.
	 */
	public static function parseExpression(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr);
		try
		{
			var result:LinkedListTree = tree(parser.expression());
			//			ensureRemainingInputIs(parser.getTokenStream(), AS3Parser.RPAREN,
			//					expr);
			//			// zap the trailing ')'
			//			result.getStopToken().setNext(null);
			if (result.parent != null && result.parent.isNil)
			{
				result.parent = null;
			}
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid expression "
					+ ASTUtils.str(expr), e);
		}
		return null;
	}

	/**
	 * Attempts to parse the given string as an AS3 expression list.
	 * 
	 * @throws ASBlocksSyntaxError if the given text doesn't form a valid
	 * expression.
	 */
	public static function parseExprList(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ")");
		try
		{
			return tree(parser.expressionList());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid expression-list "
					+ ASTUtils.str(expr), e);
		}
		return null;
	}

	/**
	 * Helper to access the AST produced by a parser production
	 */
	public static function tree(returnScope:ParserRuleReturnScope):LinkedListTree
	{
		return returnScope.tree as LinkedListTree;
	}

	/**
	 * Parses the given value, returning an TYPE node.
	 * 
	 * @throws ASBlocksSyntaxError if the given text doesn't form a valid
	 * identifier.
	 */
	public static function parseType(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(value);
		try
		{
			var result:LinkedListTree = tree(parser.type());
			parser.endOfFile();
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid identifier "
					+ ASTUtils.str(value), e);
		}
		return null;
	}

	public static function parseParameterDefault(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse("=" + value);
		var def:LinkedListTree;
		try
		{
			def = tree(parser.parameterDefault());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message);
		}
		return def;
	}

	public static function parseForInit(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ";");
		try
		{
			var result:LinkedListTree = tree(parser.forInit());
			ensureRemainingInputIs(parser.tokenStream, AS3Parser.SEMI, expr);
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseForCond(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ";");
		try
		{
			var result:LinkedListTree = tree(parser.forCond());
			ensureRemainingInputIs(parser.tokenStream, AS3Parser.SEMI, expr);
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseForIter(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ")");
		try
		{
			var result:LinkedListTree = tree(parser.forIter());
			ensureRemainingInputIs(parser.tokenStream, AS3Parser.RPAREN, expr);
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	/**
	 * Given the type name to import, creates an IMPORT AST node
	 */
	public static function parseImport(name:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse("import " + name + ";");
		try
		{
			var result:LinkedListTree = tree(parser.importDirective());
			parser.endOfFile(); // assert no trailing data
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	/**
	 * Given the namespace name to use, creates an USE AST node
	 */
	public static function parseUseNamespace(name:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse("use namespace " + name + ";");
		try
		{
			var result:LinkedListTree = tree(parser.useNamespaceDirective());
			parser.endOfFile(); // assert no trailing data
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	/**
	 * Given the include path to use, creates an INCLUDE AST node
	 */
	public static function parseInclude(path:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse("include " + path + ";");
		try
		{
			var result:LinkedListTree = tree(parser.includeDirective());
			parser.endOfFile(); // assert no trailing data
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	/**
	 * Parses the given value as an IDENT, using it to construct a new
	 * TYPE_SPEC node.
	 * 
	 * @throws ASBlocksSyntaxError if the given text doesn't form a valid
	 * identifier.
	 */
	public static function parseTypeSpec(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(":" + value);
		try
		{
			var result:LinkedListTree = tree(parser.typeExpression());
			ensureNoMoreInput(parser.tokenStream, value);
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid type-spec "
					+ ASTUtils.str(value), e);
		}
		return null;
	}

	private static function ensureNoMoreInput(input:TokenStream, value:String):void
	{
		if (input.LA(1) != AS3Parser.EOF)
		{
			throw new ASBlocksSyntaxError("Unexpected tokens in input: "
					+ value);
		}
	}

	private static function ensureRemainingInputIs(input:TokenStream,
			expectedTokenType:int, value:String):void
	{
		if (input.LA(1) != expectedTokenType)
		{
			throw new ASBlocksSyntaxError("Unexpected tokens in input: "
					+ value);
		}
	}

	public static function parseForInVar(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + " in");
		try
		{
			return tree(parser.forInClauseDecl());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseForInIterated(expr:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(expr + ")");
		try
		{
			return tree(parser.forInClauseTail());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseVariableDeclarator(assignment:String):LinkedListTree
	{
		// parser adds the semi colon if missing
		var parser:AS3Parser = ASTUtils.parse(assignment);
		try
		{
			return tree(parser.variableDeclarator());
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError(e.message, e);
		}
		return null;
	}

	public static function parseSimpleIdent(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(value);
		try
		{
			var result:LinkedListTree = tree(parser.ident());
			parser.endOfFile();
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid identifier "
					+ ASTUtils.str(value), e);
		}
		return null;
	}

	public static function parseIdent(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(value);
		try
		{
			var result:LinkedListTree = tree(parser.ident());
			parser.endOfFile();
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid identifier "
					+ ASTUtils.str(value), e);
		}
		return null;
	}

	public static function parseNewExpression(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(value);
		try
		{
			var result:LinkedListTree = tree(parser.newExpression());
			parser.endOfFile();
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid identifier "
					+ ASTUtils.str(value), e);
		}
		return null;
	}

	public static function parseClassTypeBlockEntry(value:String):LinkedListTree
	{
		var parser:AS3Parser = ASTUtils.parse(value);
		try
		{
			var result:LinkedListTree = tree(parser.classTypeBlockEntry());
			parser.endOfFile();
			return result;
		}
		catch (e:RecognitionException)
		{
			throw new ASBlocksSyntaxError("invalid identifier "
					+ ASTUtils.str(value), e);
		}
		return null;
	}
}
}