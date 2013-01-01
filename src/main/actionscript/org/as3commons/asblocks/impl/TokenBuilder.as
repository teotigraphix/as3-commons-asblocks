package org.as3commons.asblocks.impl
{
	import org.antlr.runtime.Parser;
	import org.antlr.runtime.TokenConstants;
	import org.as3commons.asblocks.parser.antlr.LinkedListToken;
	import org.as3commons.asblocks.parser.antlr.LinkedListTree;
	import org.as3commons.asblocks.parser.antlr.PlaceholderLinkedListToken;
	import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

	public class TokenBuilder
	{

		public static function newAddAssign():LinkedListToken
		{
			return newToken(AS3Parser.PLUS_ASSIGN, "+=");
		}

		public static function newAnd():LinkedListToken
		{
			return newToken(AS3Parser.LAND, "&&");
		}

		public static function newAssign():LinkedListToken
		{
			return newToken(AS3Parser.ASSIGN, "=");
		}

		public static function newAt():LinkedListToken
		{
			return newToken(AS3Parser.E4X_ATTRI, "@");
		}

		public static function newBitAnd():LinkedListToken
		{
			return newToken(AS3Parser.BAND, "&");
		}

		public static function newBitAndAssign():LinkedListToken
		{
			return newToken(AS3Parser.BAND_ASSIGN, "&=");
		}

		public static function newBitOr():LinkedListToken
		{
			return newToken(AS3Parser.BOR, "|");
		}

		public static function newBitOrAssign():LinkedListToken
		{
			return newToken(AS3Parser.BOR_ASSIGN, "|=");
		}

		public static function newBitXor():LinkedListToken
		{
			return newToken(AS3Parser.BXOR, "^");
		}

		public static function newBitXorAssign():LinkedListToken
		{
			return newToken(AS3Parser.BXOR_ASSIGN, "^=");
		}

		public static function newClass():LinkedListToken
		{
			return newToken(AS3Parser.CLASS, "class");
		}

		public static function newColon():LinkedListToken
		{
			return newToken(AS3Parser.COLON, ":");
		}

		public static function newComma():LinkedListToken
		{
			return newToken(AS3Parser.COMMA, ",");
		}

		public static function newConst():LinkedListToken
		{
			return newToken(AS3Parser.CONST, "const");
		}

		public static function newDefault():LinkedListToken
		{
			return newToken(AS3Parser.DEFAULT, "default");
		}

		public static function newDiv():LinkedListToken
		{
			return newToken(AS3Parser.DIV, "/");
		}

		public static function newDivAssign():LinkedListToken
		{
			return newToken(AS3Parser.DIV_ASSIGN, "/=");
		}

		public static function newDot():LinkedListToken
		{
			return newToken(AS3Parser.DOT, ".");
		}

		public static function newE4XDescendant():LinkedListToken
		{
			return newToken(AS3Parser.E4X_DESC, "..");
		}

		public static function newEach():LinkedListToken
		{
			return newToken(AS3Parser.EACH, "each");
		}

		public static function newEquals():LinkedListToken
		{
			return newToken(AS3Parser.EQUAL, "==");
		}

		public static function newFunction():LinkedListToken
		{
			return newToken(AS3Parser.FUNCTION, "function");
		}

		public static function newGreater():LinkedListToken
		{
			return newToken(AS3Parser.GT, ">");
		}

		public static function newGreaterEquals():LinkedListToken
		{
			return newToken(AS3Parser.GE, ">=");
		}

		public static function newIn():LinkedListToken
		{
			return newToken(AS3Parser.IN, "in");
		}

		public static function newInterface():LinkedListToken
		{
			return newToken(AS3Parser.INTERFACE, "interface");
		}

		public static function newLBrack():LinkedListToken
		{
			return newToken(AS3Parser.LBRACK, "[");
		}

		public static function newLCurly():LinkedListToken
		{
			return newToken(AS3Parser.LBRACE, "{");
		}

		public static function newLParen():LinkedListToken
		{
			return newToken(AS3Parser.LPAREN, "(");
		}

		public static function newLess():LinkedListToken
		{
			return newToken(AS3Parser.LT, "<");
		}

		public static function newLessEquals():LinkedListToken
		{
			return newToken(AS3Parser.LE, "<=");
		}

		public static function newMLComment(text:String):LinkedListToken
		{
			return newToken(AS3Parser.ML_COMMENT, text);
		}

		public static function newMinus():LinkedListToken
		{
			return newToken(AS3Parser.MINUS, "-");
		}

		public static function newModAssign():LinkedListToken
		{
			return newToken(AS3Parser.MOD_ASSIGN, "%=");
		}

		public static function newModulo():LinkedListToken
		{
			return newToken(AS3Parser.MOD, "%");
		}

		public static function newMulAssign():LinkedListToken
		{
			return newToken(AS3Parser.STAR_ASSIGN, "*=");
		}

		public static function newMult():LinkedListToken
		{
			return newToken(AS3Parser.MULT, "*");
		}

		public static function newNamespace():LinkedListToken
		{
			return newToken(AS3Parser.NAMESPACE, "namespace");
		}

		public static function newNewline():LinkedListToken
		{
			var nl:LinkedListToken = newToken(AS3Parser.EOL, "\n");
			nl.channel = TokenConstants.HIDDEN_CHANNEL;
			return nl;
		}

		public static function newNot():LinkedListToken
		{
			return newToken(AS3Parser.LNOT, "!");
		}

		public static function newNotEquals():LinkedListToken
		{
			return newToken(AS3Parser.NOT_EQUAL, "!=");
		}

		public static function newOr():LinkedListToken
		{
			return newToken(AS3Parser.LOR, "||");
		}

		public static function newPlaceholder(held:LinkedListTree):LinkedListToken
		{
			return new PlaceholderLinkedListToken(held);
		}

		// Binary

		public static function newPlus():LinkedListToken
		{
			return newToken(AS3Parser.PLUS, "+");
		}

		public static function newPostDec():LinkedListToken
		{
			return newToken(AS3Parser.POST_DEC, "--");
		}

		public static function newPostInc():LinkedListToken
		{
			return newToken(AS3Parser.POST_INC, "++");
		}

		public static function newPreDec():LinkedListToken
		{
			return newToken(AS3Parser.PRE_DEC, "--");
		}

		public static function newPreInc():LinkedListToken
		{
			return newToken(AS3Parser.PRE_INC, "++");
		}








		public static function newQuestion():LinkedListToken
		{
			return newToken(AS3Parser.CONDITION, "?");
		}

		public static function newRBrack():LinkedListToken
		{
			return newToken(AS3Parser.RBRACK, "]");
		}

		public static function newRCurly():LinkedListToken
		{
			return newToken(AS3Parser.RBRACE, "}");
		}

		public static function newRParen():LinkedListToken
		{
			return newToken(AS3Parser.RPAREN, ")");
		}

		public static function newSLAssign():LinkedListToken
		{
			return newToken(AS3Parser.SL_ASSIGN, "<<=");
		}

		public static function newSLComment(text:String):LinkedListToken
		{
			return newToken(AS3Parser.SL_COMMENT, text);
		}

		public static function newSRAssign():LinkedListToken
		{
			return newToken(AS3Parser.SR_ASSIGN, ">>=");
		}

		public static function newSRUAssign():LinkedListToken
		{
			return newToken(AS3Parser.BSR_ASSIGN, ">>>=");
		}

		public static function newSemi():LinkedListToken
		{
			return newToken(AS3Parser.SEMI, ";");
		}

		public static function newShiftLeft():LinkedListToken
		{
			return newToken(AS3Parser.SL, "<<");
		}

		public static function newShiftRight():LinkedListToken
		{
			return newToken(AS3Parser.SR, ">>");
		}

		public static function newShiftRightUnsigned():LinkedListToken
		{
			return newToken(AS3Parser.BSR, ">>>");
		}

		public static function newSpace():LinkedListToken
		{
			return newWhiteSpace(" ");
		}

		public static function newStar():LinkedListToken
		{
			return newToken(AS3Parser.STAR, "*");
		}

		public static function newSubAssign():LinkedListToken
		{
			return newToken(AS3Parser.MINUS_ASSIGN, "-=");
		}

		public static function newTab():LinkedListToken
		{
			return newWhiteSpace("\t");
		}

		public static function newToken(type:int, text:String):LinkedListToken
		{
			return new LinkedListToken(type, text);
		}

		public static function newVar():LinkedListToken
		{
			return newToken(AS3Parser.VAR, "var");
		}

		public static function newWhile():LinkedListToken
		{
			return newToken(AS3Parser.WHILE, "while");
		}

		public static function newWhiteSpace(value:String):LinkedListToken
		{
			var ws:LinkedListToken = newToken(AS3Parser.WS, value);
			ws.channel = TokenConstants.HIDDEN_CHANNEL;
			return ws;
		}

		public static function newXml():LinkedListToken
		{
			return newToken(-2, "xml");
		}
	}
}
