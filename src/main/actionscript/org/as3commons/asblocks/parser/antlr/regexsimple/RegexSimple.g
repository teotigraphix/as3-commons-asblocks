/*
 * RegexSimple.g
 * 
 * Copyright (c) 2007 David Holroyd
 * Copyright (c) 2010-2011 Michael Schmalle
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Provides a simple scanner that can recognose the extent of a regular
 * expression within the surrounding actionscript program, without parsing
 * it 'fully'.  This should be the simplest possible handling that
 * will allow the 'outer' actionscript grammar to find the end of the
 * regular expression literal, anc continue parsing the rest of the code.
 */
grammar RegexSimple;

options {
	output=AST;
	ASTLabelType=LinkedListTree;
	language=ActionScript;
}

tokens {
	REGEXP_LITERAL;
	REGEXP_BODY;
	REGEXP_FLAGS;
}

@parser::package {org.as3commons.asblocks.parser.antlr.regexsimple}

@lexer::package {org.as3commons.asblocks.parser.antlr.regexsimple}

@parser::header {
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
}
@lexer::header {
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
}


// disable standard error handling; be strict
@rulecatch { }

@parser::members {
	// disable standard error handling; be strict
	//protected void mismatch(IntStream input, int ttype, BitSet follow)
	//	throws RecognitionException
	//{
	//	throw new MismatchedTokenException(ttype, input);
	//}

	private var lexer:RegexSimpleLexer;
	private var cs:CharStream;

	public function setInput(lexer:RegexSimpleLexer, cs:CharStream) :void
	{
		this.lexer = lexer;
		this.cs = cs;
	}

	/**
	 * Returns the input left unconsumed after the last parse operation.
	 * Because of lookahead in the parser, there is no guarantee that the
	 * lexer has not consumed input ahead of the current parse-point for
	 * any abritrary rule. This method is only intended to grab the
	 * remaining input after recognising 'regexpLiteral'.
	 */
	public function getInputTail():String
	{
		return cs.substring(cs.index - 1, cs.size - 1);
	}
}


regexpLiteral
	:	s=REGEXP_DELIMITER regexpBody REGEXP_DELIMITER
		regexpFlags?
		-> ^(REGEXP_LITERAL[$s] regexpBody regexpFlags?)
	;

regexpBody
	:	bodyChar+
		-> ^(REGEXP_BODY bodyChar+)
	;

bodyChar
	:	REGEXP_CHAR | REGEXP_FLAG
	;

regexpFlags
	:	REGEXP_FLAG+
		-> ^(REGEXP_FLAGS REGEXP_FLAG+)
	;

REGEXP_DELIMITER
	:	'/';


REGEXP_FLAG
	:	CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE
	|	NULL_ESCAPE
	;

REGEXP_CHAR
	:	ORDINARY_REGEXP_CHAR
	|	ESC NON_TERMINATOR
	;

fragment TERMINATOR
	:	'\n' | '\r'
	;

fragment ORDINARY_REGEXP_CHAR
	:	~('\n' | '\r' | '\\' | '/')
	;

fragment NON_TERMINATOR
	:	~TERMINATOR
	;

fragment ESC
	:	'\\'
	;

fragment NULL_ESCAPE
	:	ESC '_'
	;

fragment CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE
	:	CONTINUING_IDENTIFIER_CHAR
	|	ESC HEX_ESCAPE
	;

fragment CONTINUING_IDENTIFIER_CHAR
	:	UNICODE_ALPHANUMERIC | '$' | '_'
	;

// TODO: and the rest of unicode..?
fragment UNICODE_ALPHANUMERIC
	:	'a'..'z' | 'A'..'Z' | '0'..'9'
	;

fragment HEX_ESCAPE
	:	'x' HEX_DIGIT HEX_DIGIT
	|	'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
	|	'U' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
	;

fragment HEX_DIGIT
	:	'0'..'9' | 'a'..'f' | 'A'..'F'
	;
