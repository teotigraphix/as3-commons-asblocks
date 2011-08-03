/*
 * E4X.g
 * 
 * Copyright (c) 2006 David Holroyd
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

grammar E4X;

options {
	k = 2;
	output=AST;
	ASTLabelType=LinkedListTree;
	language=ActionScript;
}

tokens {
	XML_EMPTY_ELEMENT;
	XML_ELEMENT;
	XML_ATTRIBUTE;
	XML_LIST;
}

@parser::package {org.as3commons.asblocks.parser.antlr.e4x}

@lexer::package {org.as3commons.asblocks.parser.antlr.e4x}

@parser::header {
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
}

@lexer::header {
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

	private var lexer:E4XLexer;
	private var cs:CharStream;

	public function setInput(lexer:E4XLexer, cs:CharStream):void
	{
		this.lexer = lexer;
		this.cs = cs;
	}

	/**
	 * Returns the input left unconsumed after the last parse operation.
	 * Because of lookahead in the parser, there is no guarantee that the
	 * lexer has not consumed input ahead of the current parse-point for
	 * any abritrary rule. This method is only intended to grab the
	 * remaining input after recognising 'xmlPrimary'.
	 */
	public function getInputTail():String
	{
		return cs.substring(cs.index - 1, cs.size - 1);
	}
}

// see http://www.ecma-international.org/publications/standards/Ecma-357.htm


xmlMarkup
	:	XML_COMMENT
	|	XML_CDATA
	|	XML_PI
	;


xmlPrimary
	:	xmlInitialiser
	|	xmlListInitialiser
	;

xmlInitialiser
	:	xmlMarkup
	|	xmlElement
	;

xmlElement
	:	(XML_LCHEVRON xmlTagContent XML_WS? -> xmlTagContent)
		(
			'/>'
			-> ^(XML_EMPTY_ELEMENT $xmlElement)

		|	 '>' xmlElementContent* '</' xmlTagName XML_WS? '>'
			-> ^(XML_ELEMENT $xmlElement xmlElementContent*)
		)
	;

xmlTagContent
	:	xmlTagName xmlAttributes?
	;

xmlEmbeddedExpression
	:	'{' expression '}' -> expression
	;

// TODO: embed the as3 parser here!
expression
	:	(
			xmlText
		|	xmlEmbeddedExpression
		)+
	;

xmlText
	:	XML_TEXT | XML_NAME | XML_WS
	;

xmlTagName
	:	xmlEmbeddedExpression
	|	XML_NAME
	;

xmlAttributes
	:	(
			XML_WS xmlEmbeddedExpression
		|	xmlAttribute
		)+
	;

xmlAttribute
	:	XML_WS XML_NAME XML_WS? '=' XML_WS? xmlAttributeValue
		-> ^(XML_ATTRIBUTE XML_NAME xmlAttributeValue)
	;

xmlAttributeValue
	:	xmlEmbeddedExpression
	|	XML_ATTRIBUTE_VALUE
	;

xmlElementContent
	:	xmlEmbeddedExpression
	|	xmlMarkup
	|	xmlText
	|	xmlElement
	;

xmlListInitialiser
	:	'<>' xmlElementContent* '</>'
		-> ^(XML_LIST xmlElementContent*)
	;

XML_LCHEVRON		:	'<';

XML_WS			:	(' ' | '\t' | '\n' | '\r')+;

XML_NAME		:	XML_NAME_START XML_NAME_PART*;


XML_ATTRIBUTE_VALUE
	:	'\'' ( options {greedy=false;} : . )* '\''
	|	'"' ( options {greedy=false;} : . )* '"'
	;



XML_PI			:	'<?' ( options {greedy=false;} : . )* '?>';

// TODO: exclude the sequence '--' from being allowed,
XML_COMMENT		:	'<!--' ( options {greedy=false;} : . )* '-->';

XML_CDATA		:	'<![CDATA[' ( options {greedy=false;} : . )* ']]>';

fragment XML_NAME_START	:	UNICODE_LETTER | '_' | ':';
fragment XML_NAME_PART	:	UNICODE_LETTER | UNICODE_DIGIT | '.' | '-' | '_' | ':';

// TODO: and the rest of unicode?
fragment UNICODE_LETTER	:	'a'..'z' | 'A'..'Z';
fragment UNICODE_DIGIT	:	'0'..'9';

XML_TEXT
	:	(~(XML_LCHEVRON | '{'))
	;
