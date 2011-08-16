/*
 * AS3.g3
 *
 * Copyright (c) 2005 Martin Schnabel
 * Copyright (c) 2006-2008 David Holroyd
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

grammar AS3;

// Originally derived from the ANTLRv2 ActionScript grammar by
// Martin Schnabel, included in the ASDT project,
//   http://www.asdt.org
//   http://sourceforge.net/projects/aseclipseplugin/

// Second refactor - David Holroyd in Java metaas project
//   http://www.badgers-in-foil.co.uk/projects/metaas/

// Third refactor - Michael Schmalle in ASBlocks ActionsScript/Java project
//   http://www.teotigraphix.org/asblocks
//   - there are some grammar fragments from Patrick Hulsmeijer's ES3.g.
//   - as well as some grammar fragments from Ernest Pasour's AS3_Ext.g
//     - Thank you to all those and more that have helped me understand
//       this antlr stuff through free examples! Feel free to learn from
//       this as well, I know I'm not finished with it. :)

options {
	output=AST;
	ASTLabelType=LinkedListTree;
	language=ActionScript;
}

tokens {
	COMPILATION_UNIT; MXML_SCRIPT_UNIT; PROGRAM_UNIT;
	COMPILE_CONFIG;
	ANNOTATIONS; METATAG; METATAG_PARAMS;
	MODIFIERS; NAMESPACE_DEF;
	TYPE_BLOCK; STATIC_BLOCK; BLOCK;
	CLASS_DEF; INTERFACE_DEF; FUNCTION_DEF;
	FIELD_DEF; VARIABLE_DEF; VAR_DEC; FUNC_DEF; METHOD_DEF;
	TYPE_SPEC; TYPE; TYPE_POSTFIX; VAR_INIT;
	ACCESSOR_ROLE; PARAMS; PARAM;
	EXPR_STMNT; ENCPS_EXPR; CONDITION; ELIST;
	FUNCTION_CALL; ARGUMENTS;
	FIELD_ACCESS;ARRAY_ACCESS;
	MULT; UNARY_PLUS; UNARY_MINUS; POST_INC; POST_DEC; PRE_INC; PRE_DEC;
	ARRAY_LITERAL; OBJECT_LITERAL; OBJECT_FIELD; /*XML_LITERAL; REGEXP_LITERAL;*/
	FOR_INIT; FOR_CONDITION; FOR_ITERATOR;
	FOR_EACH; FOR_IN;
	SWITCH_STATEMENT_LIST;
	LABEL_STMNT;
	DEFAULT_XML_NAMESPACE;
	STATIC_LINK;
	
	SR; BSR;
	STAR_ASSIGN;
	SR_ASSIGN; BSR_ASSIGN;
	GE;
	
	E4X_FILTER; E4X_ATTRI_PROPERTY; E4X_ATTRI_STAR; E4X_ATTRI_EXPR;
	E4X_EXPRESSION;VECTOR_INIT;
	
	VIRTUAL_PLACEHOLDER;
	
	XML_EMPTY_ELEMENT;
	XML_ELEMENT;
	XML_ATTRIBUTE;
	XML_LIST;	
}

scope InOperator {
	boolean allowed;
}

@parser::package {org.as3commons.asblocks.parser.antlr.as3}

@parser::header {
import org.antlr.runtime.BitSet;
import org.antlr.runtime.CharStream;
import org.antlr.runtime.MismatchedTokenException;
import org.as3commons.asblocks.impl.TokenBuilder;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.LinkedListTreeAdaptor;
import org.as3commons.asblocks.parser.antlr.e4x.E4XHelper;
import org.as3commons.asblocks.parser.antlr.regexsimple.RegexSimpleHelper;
}

@lexer::package {org.as3commons.asblocks.parser.antlr.as3}

@lexer::header {
}

@rulecatch { }

@lexer::members {
	private var lastToken:Token;

	override public function nextToken():Token
	{
		var t:CommonToken = super.nextToken() as CommonToken;
		if (t.channel != HIDDEN)
		{
			lastToken = t;
		}
		return t;
	}

	/*
	   Used for resolving ambiguity between operators and constants,
	   such as division '/' versus the regular expression syntax /hello/
	*/
	private function constantIsOk():Boolean
	{
		// I added null for testing
		if (lastToken == null)
			return true;
		var type:int = lastToken.type;
		return type == ASSIGN || type == LPAREN || type == LBRACK
				|| type == RETURN || type == COLON || type == LNOT
				|| type == LT || type == GT || type == EQUAL || type == COMMA;
	}
}

@parser::members {

	public static const CHANNEL_PLACEHOLDER:int = 999;
	
	private var lexer:AS3Lexer;
	
	private var cs:CharStream;
	
	public function setInput(lexer:AS3Lexer, cs:CharStream):void
	{
		this.lexer = lexer;
		this.cs = cs;
	}
	
	override protected function mismatch(input:IntStream, ttype:int, follow:BitSet):void
	{
		throw new MismatchedTokenException(ttype, input);
	}
	
	private function parseXMLLiteral():LinkedListTree
	{
		return E4XHelper.parseXMLLiteral(lexer, cs, LinkedListTokenStream(input));
	}
	
	private function parseRegexpLiteral(startMarker:LinkedListToken):LinkedListTree
	{
		return RegexSimpleHelper.parseRegexpLiteral(startMarker, lexer, cs, LinkedListTokenStream(input));
	}

	private function placeholder(imaginary:LinkedListTree):LinkedListToken
	{
		return AS3ParserHelper.placeholder(input, imaginary);
	}
	
	private function demarcate(parent:LinkedListTree):void
	{
		AS3ParserHelper.demarcate(parent);
	}
	
	private function findVirtualHiddenToken(retval:ParserRuleReturnScope):Boolean
	{
		return AS3ParserHelper.findVirtualHiddenToken(input, retval);
	}
	
	private var packageBlockParse:Boolean = false;
	
	public function getPackageBlockParse():Boolean
	{
		return packageBlockParse;
	}	
	
	public function setPackageBlockParse(value:Boolean):void
	{
		packageBlockParse = value;
	}
	
	private var typeBlockParse:Boolean = false;
	
	public function getTypeBlockParse():Boolean
	{
		return typeBlockParse;
	}	
	
	public function setTypeBlockParse(value:Boolean):void
	{
		typeBlockParse = value;
	}
	
	private function parseBlock(retval:ParserRuleReturnScope):Boolean
	{
		return AS3ParserHelper.parseBlock(input, retval, LinkedListTreeAdaptor(adaptor));
	}	
}

//------------------------------------------------------------------------------
// Entry Rules
//------------------------------------------------------------------------------

// A full compilation unit with package, internal class & function elements
// parses an as3 class, interface, function, namespace
compilationUnit
	:	( asCompilationUnit ) 
		-> ^( COMPILATION_UNIT asCompilationUnit? )
	;

// A chunk of code from an mxml <Script> tag
// parses elements that are found in class blocks var, method
mxmlScriptUnit 	
	:	packageBlockEntry*
		-> ^( MXML_SCRIPT_UNIT packageBlockEntry* )
	;

// Flash timeline scripts
// parses a list of statements if, iterations, function var etc.
program 
	:	statement*
		-> ^( PROGRAM_UNIT statement* )
	;

//------------------------------------------------------------------------------
// CompilationUnit
//------------------------------------------------------------------------------

// full unit
asCompilationUnit
	:	packageDecl
		packageBlockEntry*
		EOF!
	;

// package foo.bar { ... }
packageDecl
	:	PACKAGE^ type? packageBlock
	;

// { ... }
packageBlock
	:	LBRACE packageBlockEntry* RBRACE
		-> ^( BLOCK packageBlockEntry* )
	;

packageBlockEntry
	:
	(
		annos=annotations { placeholder($annos.tree); }
		mods=modifiers! { placeholder($mods.tree); }
		(	classDefinition[$mods.tree]
		|	interfaceDefinition[$mods.tree]
		|	variableDefinition[$mods.tree]
		|	functionDefinition[$mods.tree]
//		|	namespaceDefinition[$mods.tree]
		)
		|	SEMI!
	)
	;

endOfFile
	:	EOF!
	;

//------------------------------------------------------------------------------
// Annotations
//------------------------------------------------------------------------------

// CONFIG::foo, [Foo], include, use, import
annotations
	:	annotation*
		-> ^( ANNOTATIONS annotation* )
	;

// The prolem with annotations/directives is there is no order to them! :)
// to create a grammar that would semanticaly satisfy each would make it
// in my opinion overly complicated(as far as AST tree construction goes). 
// So I have decided for now, to make all below annotations. For the class 
// it does kindof make sense but, in the typeBlock where an include could 
// annotate a variable, it seems weird. I have chosen to opt for the post 
// proccessing angle for now.
annotation 
	:		configBlockDirective
		| 	metaDirective
		|	includeDirective 
		|	importDirective 
		|	useNamespaceDirective 
	;

/*
directive 
	:
			conditionalBlockDirective
		|	importDirective
		|	includeDirective
		|	useNamespaceDirective
	;
*/

//--------------------------------------
// Directives
//--------------------------------------

// CONFIG::debug
configIdent
	:	IDENT DBL_COLON^ IDENT
	;

// found in a blockEntry
configBlockDirective
	:
		configIdent block
		-> ^( COMPILE_CONFIG configIdent block )
	;

metaDirective
	:	LBRACK ident metaDirectiveList? RBRACK SEMI?
		-> ^( METATAG ident metaDirectiveList? )
	;

// metaTagParam, metaTagParam, ...metaTagParam
metaDirectiveList
	:
		LPAREN ( metaTagParam ( COMMA metaTagParam )* )? RPAREN
		-> ^( METATAG_PARAMS metaTagParam* )
	;

// metaTagParams do not require an assignment
// true, false, 42, my.scope.Type, "string"
metaTagParam
	:
		ident ASSIGN constant -> ^(ASSIGN ident constant)
	|	constant -> constant
	| 	(ident DOT)=> type -> type
	|	ident ASSIGN (ident DOT)=> type -> ^(ASSIGN ident type)
	|	ident -> ident
	;

// include '...'; or include "...";
includeDirective
	:	INCLUDE^ STRING_LITERAL semi
	;

// use namespace my_name_space;
useNamespaceDirective
	:	USE^ NAMESPACE ident semi
	;

// import Foo;, import foo.Bar; or import foo.bar.*;
importDirective
	:	IMPORT^ type ( DOT! STAR )? semi
	;

//------------------------------------------------------------------------------
// Modifiers
//------------------------------------------------------------------------------

// a list of member modifiers
modifiers
	:	modifier*
		-> ^( MODIFIERS modifier* )
	;

modifier
	:	DYNAMIC
	|	FINAL
	|	INTERNAL
	|	OVERRIDE
	|	PRIVATE
	|	PROTECTED
	|	PUBLIC
	| 	STATIC
	|	NATIVE	
	|	IDENT
	;

//--------------------------------------
// SemiColon
//--------------------------------------

semi
@init
{
	// Mark current position so we can unconsume a RBRACE.
	var marker:int = input.mark();
	// Promote EOL if appropriate
	var onBrace:Boolean=false;
	
	if (retval.start.text != null && retval.start.text == "}")
	{
		onBrace=true;
		//we don't want to consume the '}' during the prediction phase
		if (state.backtracking > 0)
		{
			retval.stop = retval.start;
			return retval;
		}
	}
	
	if (findVirtualHiddenToken(retval))
	{
		retval.stop = retval.start;
		return retval;
	}
}
	:	SEMI!
	|	EOF 
	|	RBRACE	
		{
			input.rewindTo(marker); 
			
			if (onBrace)
			{
				retval.start=input.LT(-1);
				retval.stop=retval.start;
				retval.tree=null;
				return retval;
			}
		}
	;

//------------------------------------------------------------------------------
// Package/Inner Class
//------------------------------------------------------------------------------

// in the interest of performance over semantics, leave class name as ident instead of "type"
classDefinition[LinkedListTree mods]
	:	{ retval.start = mods.getStartToken(); }
		CLASS ident
		classExtendsClause
		classImplementsClause
		classTypeBlock
		-> ^( CLASS_DEF {$mods} ident classExtendsClause? classImplementsClause? classTypeBlock )
	;

classExtendsClause
	:	( EXTENDS^ type )?
	;

classImplementsClause
	:	( IMPLEMENTS^ type ( COMMA! type )* )?
	;

//------------------------------------------------------------------------------
// Package Interface
//------------------------------------------------------------------------------

// in the interest of performance over semantics, leave interface name as ident instead of "type"
interfaceDefinition[LinkedListTree mods]
	:	{ retval.start = mods.getStartToken(); }
		INTERFACE ident
		interfaceExtendsClause
		interfaceTypeBlock
		-> ^( INTERFACE_DEF {$mods} ident interfaceExtendsClause? interfaceTypeBlock )
	;

interfaceExtendsClause
	:	( EXTENDS^ type ( COMMA! type)* )?
	;

//------------------------------------------------------------------------------
// Package Function
//------------------------------------------------------------------------------

functionDefinition[LinkedListTree mods]
	:	{ retval.start = mods.getStartToken(); }
		FUNCTION
		ident
		parameterDeclarationList
		typeExpression?
		block
		-> ^( FUNCTION_DEF {$mods}
		                ident
		                parameterDeclarationList
				typeExpression?
				block? )
	;

//------------------------------------------------------------------------------
// Package Variable
//------------------------------------------------------------------------------

// the var/const found in the typeBlockEntry
// public var foo:Bar, baz:Goo = null;
variableDefinition[LinkedListTree mods]
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	vm=variableModifier variableDeclarator ( COMMA variableDeclarator )* semi
		-> ^( VARIABLE_DEF {$mods} $vm variableDeclarator+ )
	;

//------------------------------------------------------------------------------
// TypeBlock
//------------------------------------------------------------------------------

classTypeBlock
@init {
	if (packageBlockParse)
	{
		retval.tree = LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK"));
		parseBlock(retval);
		return retval;
	}
}
	:	LBRACE
		classTypeBlockEntry*
		RBRACE
		-> ^( TYPE_BLOCK classTypeBlockEntry* )
	;

classTypeBlockEntry
	:
		(configIdent LBRACE)=> configBlockEntry
		|
		(LBRACE)=> staticBlockEntry
		|
		(
			a=annotations! { retval.start = placeholder($a.tree); }
			m=modifiers! { placeholder($m.tree); }
			(
					fieldDefinitionBlockEntry[$a.tree,$m.tree] 
				|	classMethodDefinitionBlockEntry[$a.tree,$m.tree]
				|	staticLinkEntry
			)
		)
	;

//testme 	:
//		
//	;

interfaceTypeBlock
@init {
	if (packageBlockParse)
	{
		retval.tree = LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK"));
		parseBlock(retval);
		return retval;
	}
}
	:	LBRACE
		interfaceTypeBlockEntry*
		RBRACE
		-> ^( TYPE_BLOCK interfaceTypeBlockEntry* )
	;

interfaceTypeBlockEntry
	:	
		(configIdent LBRACE)=> configBlockEntry
		|
		(LBRACE)=> staticBlockEntry
		| 
		(
			a=annotations! { retval.start = placeholder($a.tree); }
			(
				interfaceMethodDefinitionBlockEntry[$a.tree]
			)
		)
		
	;
	
//------------------------------------------------------------------------------
// Static Block Definition
//------------------------------------------------------------------------------

configBlockEntry
	:
		configIdent LBRACE classTypeBlockEntry* RBRACE
		-> ^( COMPILE_CONFIG configIdent ^( BLOCK classTypeBlockEntry* ) )
	;

//------------------------------------------------------------------------------
// Static Block Definition
//------------------------------------------------------------------------------

staticBlockEntry
	:	LBRACE blockEntry* RBRACE
		-> ^( STATIC_BLOCK blockEntry* )
	;

staticLinkEntry
	:	ident semi
		-> ^( STATIC_LINK ident )
	;

//------------------------------------------------------------------------------
// Field Definition
//------------------------------------------------------------------------------

// the var/const found in the typeBlockEntry
// public var foo:Bar, baz:Goo = null;
fieldDefinitionBlockEntry[LinkedListTree annos, Tree mods]
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	vm=variableModifier variableDeclarator ( COMMA variableDeclarator )* semi
		-> ^( FIELD_DEF {$annos} {$mods} $vm variableDeclarator+ )
	;

//------------------------------------------------------------------------------
// Method Definition
//------------------------------------------------------------------------------

classMethodDefinitionBlockEntry[LinkedListTree annos, Tree mods]
	:	{ retval.start = annos.getStartToken(); }
		FUNCTION
		r=optionalAccessorRole  { placeholder($r.tree); }
		ident
		parameterDeclarationList
		typeExpression?
		block
		-> ^( METHOD_DEF {$annos} {$mods}
		                optionalAccessorRole ident
				parameterDeclarationList
				typeExpression?
				block? )
	;

interfaceMethodDefinitionBlockEntry[LinkedListTree annos]
	:	{ retval.start = annos.getStartToken(); }
		FUNCTION
		r=optionalAccessorRole  { placeholder($r.tree); }
		ident
		parameterDeclarationList
		typeExpression?
		semi
		-> ^( METHOD_DEF {$annos}
		                optionalAccessorRole ident
				parameterDeclarationList
				typeExpression? )
	;


optionalAccessorRole
	:	accessorRole?
		-> ^( ACCESSOR_ROLE accessorRole? )
	;

accessorRole
	:	GET
	|	SET
	;
	
//------------------------------------------------------------------------------
// Block
//------------------------------------------------------------------------------

block
@init {
	if (typeBlockParse)
	{
		retval.tree = LinkedListTree(adaptor.create(BLOCK, "BLOCK"));
		parseBlock(retval);
		return retval;
	}
}
	:	LBRACE blockEntry* RBRACE
		-> ^( BLOCK blockEntry* )
	;

blockEntry
	:
		statement
	;

//------------------------------------------------------------------------------
// Statement
//------------------------------------------------------------------------------

statement
options
{
	k = 1 ;
}
	:	{ input.LA(1) == LBRACE }? block
//	|	{ input.LA(1) == LBRACK }? metaDirective
	|	statementTail
	;

statementTail
	:	(declarationStatement
	|	expressionStatement
	|	ifStatement

	|	(FOR EACH)=> forEachStatement
	|	forStatement
	|	whileStatement
	|	doWhileStatement
	
	|	continueStatement
	|	breakStatement
	|	returnStatement
	|	withStatement
	|	labelStatement
	|	switchStatement
	|	throwStatement
	|	tryStatement

	|	defaultXMLNamespaceStatement
	|	includeDirective
	| 	importDirective
	|	useNamespaceDirective
	
	|	configBlockDirective // (configIdent)=> 
	
	|	emptyStatement)
	;

//------------------------------------------------------------------------------
// Declaration
//------------------------------------------------------------------------------

variableModifier
	:	VAR
	|	CONST
	| 	NAMESPACE
	;

// a:int = 0;
variableDeclarator
	:	ident typeExpression? variableInitializer?
		-> ^( VAR_DEC ident typeExpression? variableInitializer? )
	;

// var/const a:int = 0, b:int = 3;
declarationStatement
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	declaration semi
	;

// a var/const statement in a block
declaration
	:	variableModifier^ variableDeclarator declarationTail
	;

// , a:int = 0
declarationTail
scope InOperator;
@init {
	$InOperator::allowed = true;
}
 	:	( COMMA! variableDeclarator )*
	;

// = 0
variableInitializer
	:	ASSIGN^ assignmentExpression
	;

emptyStatement
	:	SEMI!
	;

//------------------------------------------------------------------------------
// Expression
//------------------------------------------------------------------------------

expressionStatement
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	expressionList semi
		-> ^( EXPR_STMNT expressionList )
	;

//------------------------------------------------------------------------------
// If Else
//------------------------------------------------------------------------------

ifStatement
	:	IF^ condition statement
		( (ELSE)=> elseClause )?
	;

elseClause
	:	ELSE^ statement
	;

condition
	:	LPAREN expression RPAREN
		-> ^( CONDITION expression )
	;

//------------------------------------------------------------------------------
// For Each
//------------------------------------------------------------------------------

forEachStatement
	:	f=FOR EACH LPAREN forInClause RPAREN
		statement
		-> ^( FOR_EACH[$f] forInClause statement )
	;

//------------------------------------------------------------------------------
// For
//------------------------------------------------------------------------------

forStatement
scope InOperator;
@init {
	$InOperator::allowed = false;
}
	:	f=FOR LPAREN
		(
			(forInClauseDecl IN)=>forInClause RPAREN statement
			-> ^( FOR_IN[$f] forInClause statement )
		|	
			traditionalForClause RPAREN statement
			-> ^( $f traditionalForClause statement )
		)
	;

traditionalForClause
	:	a=forInit {placeholder($a.tree);} SEMI!	// initializer
		b=forCond {placeholder($b.tree);} SEMI!	// condition test
		c=forIter {placeholder($c.tree);}	// updater
	;

forInClause
	:	forInClauseDecl IN! forInClauseTail
	;

forInClauseDecl
scope InOperator;
@init {
	$InOperator::allowed = false;
}
	:	declaration | ident
	;


forInClauseTail
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	expressionList
	;

// The initializer for a for loop
forInit	
scope InOperator;
@init {
	$InOperator::allowed = false;
}
	:	( declaration | expressionList )?
		-> ^( FOR_INIT declaration? expressionList? )
	;

forCond
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	expressionList?
		-> ^( FOR_CONDITION expressionList? )
	;

forIter
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	expressionList?
		-> ^( FOR_ITERATOR expressionList? )
	;

//------------------------------------------------------------------------------
// Error statements
//------------------------------------------------------------------------------

throwStatement
	:	THROW^ expression semi!
	;

tryStatement
	:	TRY
		block
	(	finallyBlock
	|	catchBlock+
		finallyBlock?
	)
		-> ^( TRY block catchBlock* finallyBlock? )
	;

catchBlock
	:	CATCH LPAREN ident typeExpression? RPAREN
		block
		-> ^( CATCH ident typeExpression? block )
	;

finallyBlock
	:	FINALLY^ block
	;

//------------------------------------------------------------------------------
// Switch
//------------------------------------------------------------------------------

switchStatement
	:	SWITCH^ condition
		switchBlock
	;

switchBlock
	:	LBRACE
		( caseStatement )*
		( defaultStatement )?
		RBRACE
		-> ^( BLOCK caseStatement* defaultStatement? )
	;

caseStatement
	:	CASE^ expression COLON! l=switchStatementList { placeholder($l.tree); }
	;
	
defaultStatement
	:	DEFAULT^ COLON! l=switchStatementList { placeholder($l.tree); }
	;

switchStatementList
	:	statement* -> ^( SWITCH_STATEMENT_LIST statement* )
	;

//------------------------------------------------------------------------------
// Do While
//------------------------------------------------------------------------------

whileStatement
	:	WHILE^ condition statement
	;

doWhileStatement
	:	DO^ statement WHILE! condition semi
	;

//------------------------------------------------------------------------------
// With
//------------------------------------------------------------------------------

withStatement
	:	WITH^ condition statement
	;

//------------------------------------------------------------------------------
// Label
//------------------------------------------------------------------------------

labelStatement
	:	IDENT COLON statement
		-> ^( LABEL_STMNT IDENT statement )
	;

//------------------------------------------------------------------------------
// Simple
//------------------------------------------------------------------------------

returnStatement
	:	RETURN^ expression? semi
	;

continueStatement
	:	CONTINUE^ ident? semi
	;

breakStatement
	:	BREAK^ ident? semi
	;

defaultXMLNamespaceStatement
	:	DEFAULT xmlKeyword NAMESPACE ASSIGN expression semi
		-> ^( DEFAULT_XML_NAMESPACE expression )
	;

//------------------------------------------------------------------------------
//  Identifiers
//------------------------------------------------------------------------------

//--------------------------------------
//  Types
//--------------------------------------

// : Foo, : foo.bar.Baz, : Foo.<Bar>, : Foo.<Foo.<Bar>>
typeExpression
	:	c=COLON type
		-> ^( TYPE_SPEC[$c] type )
	;

type 	
	:	( qualifiedName | VOID | STAR )
		-> ^( TYPE qualifiedName? VOID? STAR? )
	;

qualifiedName
	:	standardQualifiedName ( typePostfixSyntax )? 
	;

standardQualifiedName
	:	typeSpecifier ( DOT! typeSpecifier )*
	;

typeSpecifier:
	IDENT | notQuiteReservedWord | INTERNAL | DEFAULT
	;

//qualifiedIdent
//	:	( (namespaceName)? DBL_COLON^ )? ident 
//	;

namespaceName
	:	IDENT | reservedNamespace
	;

reservedNamespace
	:	PUBLIC
	|	PRIVATE
	|	PROTECTED
	|	INTERNAL
	;

typePostfixSyntax
	:	POST ( standardQualifiedName | STAR ) ( typePostfixSyntax )? GT
		-> ^( TYPE_POSTFIX standardQualifiedName? STAR? typePostfixSyntax? )
	;

ident
	:	IDENT
	|	i=USE -> IDENT[$i]
	|	xmlKeyword // TODO !!!
	|	i=DYNAMIC -> IDENT[$i]
	|	i=NAMESPACE -> IDENT[$i]
	|	i=IS -> IDENT[$i]
	|	i=AS -> IDENT[$i]
	|	i=GET -> IDENT[$i]
	|	i=SET -> IDENT[$i]
	;

//------------------------------------------------------------------------------
// Expressions
//------------------------------------------------------------------------------

// (ms)
// the mother of all expressions
expression
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	assignmentExpression
	;

// This is a list of expressions.
expressionList
	:	assignmentExpression ( COMMA assignmentExpression )*
		-> assignmentExpression+
	;

// (ms)
// assignment expression (level 13)
// unparent, then parent all children on assignmentOperator
assignmentExpression
	:	conditionalExpression ( (assignmentOperator)=> 
			o=assignmentOperator^ assignmentExpression {demarcate($o.tree);} )*
	;

//--------------------------------------
// Precedence
//--------------------------------------

// (ms)
assignmentOperator
	: 	ASSIGN
//	|	STAR_ASSIGN	
	|	( ('*' '=')=> '*' '=' ->STAR_ASSIGN["*="] )
	|	DIV_ASSIGN
	|	MOD_ASSIGN
	|	PLUS_ASSIGN
	|	MINUS_ASSIGN
	|	SL_ASSIGN
//	|	SR_ASSIGN
//	|	BSR_ASSIGN	
	|	( ('>' '>' '=')=> '>' '>' '=' -> SR_ASSIGN[">>="] ) 
	|	( ('>' '>' '>' '=')=> '>' '>' '>' '=' -> BSR_ASSIGN[">>>="] )
	|	BAND_ASSIGN
	|	BXOR_ASSIGN
	|	BOR_ASSIGN
	|	LAND_ASSIGN
	|	LOR_ASSIGN
	;

// (ms)
// conditional test (level 12)
conditionalExpression
	:	( logicalOrExpression -> logicalOrExpression )
		(
			QUESTION conditionalSubExpression
			-> ^( QUESTION $conditionalExpression conditionalSubExpression )
		)?
	;

// (ms)
conditionalSubExpression
	:	assignmentExpression COLON! assignmentExpression
	;

// (ms)
// logical or (||) (level 11)
logicalOrExpression
	:	logicalAndExpression
		( o=logicalOrOperator^ logicalAndExpression {demarcate($o.tree);} )*
	;

// (ms)
logicalOrOperator
	:	LOR
	;

// logical and (&&) (level 10)
logicalAndExpression
	:	bitwiseOrExpression
		( o=logicalAndOperator^ bitwiseOrExpression {demarcate($o.tree);} )*
	;

logicalAndOperator
	:	LAND
	;

// (ms)
// bitwise or non-short-circuiting or (|) (level 9)
bitwiseOrExpression
	:	bitwiseXorExpression
		( o=BOR^ bitwiseXorExpression {demarcate($o.tree);} )*
	;

// (ms)
// exclusive or (^) (level 8)
bitwiseXorExpression
	:	bitwiseAndExpression
		( o=BXOR^ bitwiseAndExpression {demarcate($o.tree);} )*
	;

// (ms)
// bitwise or non-short-circuiting and (&) (level 7)
bitwiseAndExpression
	:	equalityExpression
		( o=BAND^ equalityExpression {demarcate($o.tree);} )*
	;

// equality/inequality (==/!=) (level 6)
equalityExpression
	:	relationalExpression
		( o=equalityOperator^ relationalExpression {demarcate($o.tree);} )*
	;

equalityOperator
	:	STRICT_EQUAL 
	|	STRICT_NOT_EQUAL 
	|	NOT_EQUAL 
	|	EQUAL
	;

// (ms)
// boolean relational expressions (level 5)
relationalExpression
	:	shiftExpression
		( (relationalOperator)=> o=relationalOperator^ shiftExpression {demarcate($o.tree);} )*
	;

// (ms)
relationalOperator
	:	
		( ('>')=> '>' -> GT[">"] ) 
	|	( ('>' '=')=> '>' '=' ->GE[">="] )
	|	( {$InOperator::allowed}? IN | LT | LE | IS | AS | INSTANCEOF )
	;

// bit shift expressions (level 4)
shiftExpression
	:	additiveExpression
		( o=shiftOperator^ additiveExpression {demarcate($o.tree);} )*
	;

// (ms)
shiftOperator
	:	SL 
	|	( ('>' '>')=> '>' '>' -> SR[">>"] ) 
	|	( ('>' '>' '>')=> '>' '>' '>' ->BSR[">>>"] )
	;

// binary addition/subtraction (level 3)
additiveExpression
	:	multiplicativeExpression
		( o=additiveOperator^ multiplicativeExpression {demarcate($o.tree);} )*
	;

additiveOperator
	:	PLUS 
	|	MINUS
	;

// (ms)
// multiplication/division/modulo (level 2)
multiplicativeExpression
	:	unaryExpression 
		( o=multiplicativeOperator^ unaryExpression {demarcate($o.tree);} )*
	;

// (ms)
multiplicativeOperator
	:	s=STAR -> MULT[$s]
	|	DIV
	|	MOD
	;

//--------------------------------------
// Unary
//--------------------------------------

// (ms)
//	(level 1)
unaryExpression
	:	inc=INC unaryExpression -> ^( PRE_INC[$inc] unaryExpression )
	|	de=DEC unaryExpression -> ^( PRE_DEC[$de] unaryExpression )
	|	MINUS unaryExpression -> ^( UNARY_MINUS unaryExpression )
	|	PLUS unaryExpression -> ^( UNARY_PLUS unaryExpression )
	|	unaryExpressionNotPlusMinus
	;

// (ms)
unaryExpressionNotPlusMinus
	:	DELETE postfixExpression -> ^( DELETE postfixExpression )
	|	VOID unaryExpression -> ^( VOID unaryExpression )
	|	TYPEOF unaryExpression -> ^( TYPEOF unaryExpression )
	|	LNOT unaryExpression -> ^( LNOT unaryExpression )
	|	BNOT unaryExpression -> ^( BNOT unaryExpression )
	|	postfixExpression
	;

postfixExpression
	:	leftHandSideExpression ( postfixOperator^ )?
	;

postfixOperator
	:	inc=INC -> ^( POST_INC[$inc] )
	|	de=DEC -> ^( POST_DEC[$de] )
	;

leftHandSideExpression
	:
	(
		memberExpression 		-> memberExpression
	)
	(
		(argumentList			-> ^( FUNCTION_CALL $leftHandSideExpression argumentList )) {demarcate(root_0.getFirstChild());}
		| (LBRACK expression rb=RBRACK	-> ^( ARRAY_ACCESS $leftHandSideExpression expression )) {demarcate(root_0.getFirstChild()); root_0.getFirstChild().setStopToken(LinkedListToken($rb));}
		| (DOT eitherIdentifier		-> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier )) {demarcate(root_0.getFirstChild());}
		| typePostfixSyntax		-> ^( $leftHandSideExpression memberExpression typePostfixSyntax )
		| DOT LPAREN expression RPAREN	-> ^( E4X_FILTER $leftHandSideExpression expression )
		| DBL_COLON eitherIdentifier	-> ^( DBL_COLON $leftHandSideExpression eitherIdentifier )
		| DOT e4xAttributeIdentifier	-> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier )
		| E4X_DESC e4xExpression	-> ^( E4X_DESC $leftHandSideExpression e4xExpression )			
	)*
	;

eitherIdentifier
	: IDENT
//	 | xmlPropertyIdentifier
//	 | allKeywords
	;

memberExpression
	:	primaryExpression
	|	functionExpression
	|	newExpression
	;

primaryExpression
	:	primaryExpressionHelper
	;

primaryExpressionHelper
	:	UNDEFINED
	|	THIS
	|	SUPER
	|	identiferLiteral
	|	constant
	|	arrayLiteral
	|	objectLiteral
	|	encapsulatedExpression
	|	e4xAttributeIdentifier
//	|	(LT type GT arrayLiteral)=> vectorInitializer
	;

newExpression
	:	NEW^ primaryExpression 
	;

//------------------------------------------------------------------------------
// Literals
//------------------------------------------------------------------------------

identiferLiteral
	:	IDENT 
	|	notQuiteReservedWord
	;

// (ms) <xml>, /regexp/, 42, 'string', "string", true, false, null
constant 
	:	
		NULL
	|	FALSE
	|	TRUE
	|	numericLiteral
	|	stringLiteral
//	|	xmlLiteral
	| 	XML_LITERAL
//	|	regexpLiteral
	|	REGEXP_LITERAL
	;
	// 
/*
xmlLiteral
@init {
	LinkedListTree xml = null;
}
	:	// We have to have the LT in the outer grammar for lookahead
		// in AS3Parser to be able to predict that the xmlLiteral rule
		// should be used.
		LT
		{ xml=parseXMLLiteral(); }
		-> ^( XML_LITERAL {xml} )
	;

regexpLiteral
@init {
	LinkedListTree regexp = null;
}
	:	s=DIV { regexp=parseRegexpLiteral((LinkedListToken)$s); }
		-> ^( REGEXP_LITERAL {regexp} )
	;
*/
//(ms) 0x242, 42, 007, 0.2
numericLiteral 
	:	HEX_LITERAL
	|	DECIMAL_LITERAL
	|	OCTAL_LITERAL
	|	FLOAT_LITERAL
	;

// (ms) 'string' "string"
stringLiteral
	:	STRING_LITERAL
	;

//--------------------------------------
// Array Literal
//--------------------------------------

// (ms)
arrayLiteral
	:	LBRACK elementList? RBRACK
		-> ^( ARRAY_LITERAL elementList? )
	;

// (ms)
elementList
	:	COMMA!
	|	nonemptyElementList
	;

// (ms)
nonemptyElementList
	:	assignmentExpression ( COMMA! assignmentExpression )*
	;

//--------------------------------------
//  Object Literal
//--------------------------------------

// (ms)
objectLiteral
	:	LBRACE fieldList? RBRACE
		-> ^( OBJECT_LITERAL fieldList? )
	;

// (ms)
fieldList
	:	literalField ( COMMA! literalField? )*
	;

// (ms)
literalField
	:	fieldName COLON element
		-> ^( OBJECT_FIELD fieldName element )
	;

// (ms)
fieldName
	:	identiferLiteral
	|	numericLiteral
	|	stringLiteral
	;

// (ms)
element
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	assignmentExpression
	;

//--------------------------------------
// Function
//--------------------------------------

functionExpression
	:	FUNCTION functionCommon
		-> ^( FUNC_DEF functionCommon )
	;

castExpression
	:	ident typePostfixSyntax? argumentList
		-> ^( FUNC_DEF ident typePostfixSyntax argumentList? )
	;

functionCommon
	:	functionSignature block
	;

functionSignature
	:	parameterDeclarationList typeExpression?
	;

// A list of formal parameters
// TODO: shouldn't the 'rest' parameter only be allowed in the last position?
parameterDeclarationList
	:	LPAREN 
		( parameterDeclaration (COMMA parameterDeclaration )* )?
		RPAREN
		-> ^( PARAMS parameterDeclaration* )
	;

parameterDeclaration
	:	basicParameterDeclaration 
	|	parameterRestDeclaration
	;

basicParameterDeclaration
	:	CONST? ident typeExpression? parameterDefault?
		-> ^( PARAM CONST? ident typeExpression? parameterDefault? )
	;

parameterDefault
scope InOperator;
@init {
	$InOperator::allowed = true;
}
		// TODO: can we be more strict about allowed values?
	:	ASSIGN^ assignmentExpression
	;

parameterRestDeclaration
	:	REST ident?
		-> ^( PARAM REST ident? )
	;

argumentList
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	LPAREN expressionList RPAREN
		-> ^( ARGUMENTS expressionList )
	|	LPAREN RPAREN
		-> ARGUMENTS
	;

vectorInitializer
	:
		LT type GT arrayLiteral
		-> ^( VECTOR_INIT type arrayLiteral )
	;

//--------------------------------------
//  Encapsulated
//--------------------------------------

// (ms)
encapsulatedExpression
scope InOperator;
@init {
	$InOperator::allowed = true;
}
	:	LPAREN assignmentExpression RPAREN
		-> ^( ENCPS_EXPR assignmentExpression )
	;

e4xExpression
	:	STAR
	|	e4xAttributeIdentifier
	|	e4xFilterPredicate
	|	eitherIdentifier
	;

e4xAttributeIdentifier
	:	E4X_ATTRI
		(
			eitherIdentifier
		|	STAR
		|	LBRACK expression RBRACK
		)
	;

e4xFilterPredicate
	:	LPAREN expression RPAREN
	;

xmlKeyword
	:	{input.LT(1).text == "xml"}? IDENT
	;

notQuiteReservedWord
	:	/*TO |*/ NATIVE | EACH | GET | SET | NAMESPACE | DYNAMIC | FINAL | OVERRIDE | STATIC
	;

allKeywords
	:	( reservedWord | notQuiteReservedWord )
	;

reservedWord
	:
	(	AS          
	|	BREAK           
	|	CASE  
	|	CATCH           
	|	CLASS 
	|	CONST
	|	CONTINUE
	|	DEFAULT
	|	DELETE
	|	DO
	|	ELSE
	|	EXTENDS
	|	FALSE
	|	FINALLY
	|	FOR
	|	FUNCTION
	|	IF
	|	IMPLEMENTS
	|	IMPORT          
	|	IN
	|	INSTANCEOF      
	|	INTERFACE
	|	INTERNAL        
	|	IS
//	|	NATIVE          
	|	NEW
	|	NULL            
	|	PACKAGE  
	|	PRIVATE         
	|	PROTECTED
	|	PUBLIC          
	|	RETURN
	|	SUPER           
	|	SWITCH
	|	THIS            
	|	THROW
	|	TRUE
	|	TRY             
	|	TYPEOF
	|	USE             
	|	VAR
	|	VOID            
	|	WHILE
	|	WITH 
//	|	EACH            
//	|	GET
//	|	SET             
//	|	NAMESPACE
	|	INCLUDE         
//	|	DYNAMIC
//	|	FINAL           
//	|	OVERRIDE
//	|	STATIC)
	)
	;

// added
FINAL		: 'final';
OVERRIDE	: 'override';
INCLUDE		: 'include';
THROW		: 'throw';
TRY		: 'try';
CATCH		: 'catch';
FINALLY		: 'finally';
VOID		: 'void';
INSTANCEOF	: 'instanceof';
DELETE 		: 'delete';
TYPEOF		: 'typeof';
UNDEFINED	: 'undefined';
//TO		: 'to';
NATIVE		: 'native';

PACKAGE		: 'package';
PUBLIC		: 'public';
PRIVATE		: 'private';
PROTECTED	: 'protected';
INTERNAL	: 'internal';
FUNCTION	: 'function';
EXTENDS		: 'extends';
IMPLEMENTS	: 'implements';
VAR		: 'var';
STATIC		: 'static';
IF		: 'if';
IMPORT		: 'import';
FOR		: 'for';
EACH		: 'each';
IN		: 'in';
WHILE		: 'while';
DO		: 'do';
SWITCH		: 'switch';
CASE		: 'case';
DEFAULT		: 'default';
ELSE		: 'else';
CONST		: 'const';
CLASS		: 'class';
INTERFACE	: 'interface';
TRUE		: 'true';
FALSE		: 'false';
DYNAMIC		: 'dynamic';
USE		: 'use';
//XML		: 'xml';
NAMESPACE	: 'namespace';
IS		: 'is';
AS		: 'as';
GET		: 'get';
SET		: 'set';
WITH		: 'with';
RETURN		: 'return';
CONTINUE	: 'continue';
BREAK		: 'break';
NULL		: 'null';
NEW		: 'new';
SUPER		: 'super';
THIS		: 'this';

// OPERATORS
QUESTION	: '?' ;
LPAREN		: '(' ;
RPAREN		: ')' ;
LBRACK		: '[' ;
RBRACK		: ']' ;
LBRACE		: '{' ;
RBRACE		: '}' ;
COLON		: ':' ;
DBL_COLON	: '::' ;
COMMA		: ',' ;
ASSIGN		: '=' ;
EQUAL		: '==' ;
STRICT_EQUAL	: '===' ;
LNOT		: '!' ;
BNOT		: '~' ;
NOT_EQUAL	: '!=' ;
STRICT_NOT_EQUAL: '!==' ;
PLUS		: '+' ;
PLUS_ASSIGN	: '+=' ;
INC		: '++' ;
MINUS		: '-' ;
MINUS_ASSIGN	: '-=' ;
DEC		: '--' ;
STAR		: '*' ;
// removed for ambiguity between STAR_ASSIGN and the STAR TYPE
//STAR_ASSIGN	: '*=' ;
MOD		: '%' ;
MOD_ASSIGN	: '%=' ;
//SR		: '>>' ;
//SR_ASSIGN	: '>>=' ;
//BSR		: '>>>' ;
//BSR_ASSIGN	: '>>>=' ;
//GE		: '>=' ;
GT		: '>' ;
BXOR		: '^' ;
BXOR_ASSIGN	: '^=' ;
BOR		: '|' ;
BOR_ASSIGN	: '|=' ;
LOR		: '||' ;
BAND		: '&' ;
BAND_ASSIGN	: '&=' ;
LAND		: '&&' ;
LAND_ASSIGN	: '&&=' ;
LOR_ASSIGN	: '||=' ;
E4X_ATTRI	: '@' ;
SEMI		: ';' ;
BSLASH		: '\\';

DOT		: '.' ;
E4X_DESC	: '..' ;
REST		: '...' ;

DIV_ASSIGN : '/=';
DIV : '/';

POST		: '.<';

SL		: '<<' ;
SL_ASSIGN	: '<<=' ;
LE		: '<=' ;
LT		: '<' ;




REGEXP_LITERAL
	:	{ constantIsOk() }?=> '/' REGEX_BODY '/' REGEX_POSTFIX?
	;

fragment REGEX_POSTFIX
	:	('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$')+
	;

fragment REGEX_BODY
	:	(
			( ~('\n'|'\r'|'*'|'/'|'\\') )
			|	
			'\\'(~('\n'|'\r'))
		)
		( 
			(~('\n'|'\r'|'/'|'\\'))
			| 
			'\\'(~('\n'|'\r'))
		)*
	;

XML_LITERAL
	:	(XML_LITERAL) => XML_SUBTREE
	;

fragment XML_SUBTREE
	:	'<' (IDENT | XML_BINDING) (XML_WS | XML_ATTRIBUTE)*
		( '>' (XML_SUBTREE | XML_TEXTNODE | XML_COMMENT | XML_CDATA | XML_BINDING)*
		'</' IDENT '>'
		| '/>'
		)
	;

fragment XML_ATTRIBUTE
	:	IDENT XML_WS* ASSIGN XML_WS* (STRING_LITERAL | XML_BINDING)
	;

fragment XML_BINDING
	:	'{' XML_AS3_EXPRESSION '}'
	;

// it should be parsed as an AS3 expression...
fragment XML_AS3_EXPRESSION
	:	(~('{'|'}'))*
	;

fragment XML_TEXTNODE
	:	(
			XML_WS
			|	('/' ~'>') => '/'
			|	~('<'|'{'|'/'| XML_WS)
		)
	;

fragment XML_COMMENT
	:	'<!--'
		(
		XML_WS
		| ~('-'| XML_WS)
		| ('-' ~'-') => '-'
		)*
		'-->'
	;

fragment XML_CDATA
	:	'<![CDATA['
		( XML_WS
	        | (']' ~']') => ']'
	        | ~(']'| XML_WS)
	        )*
		']]>'
	;

fragment XML_WS
	:	' '
	|	'\t'
	|	'\f'
	|	'\r'
	|	'\n'
	;


IDENT
	:	('a'..'z'|'A'..'Z'|'_'|'$')
		('a'..'z'|'A'..'Z'|'_'|'0'..'9'|'$')*
	;

/* 
For now I turned this off, it majorly slows the parser down when parsing
in the Flash Player

IDENT
	:	UNICODE_IDENTIFIER_START
		UNICODE_IDENTIFIER_PART*
	;

// The UNICODE_IDENTIFIER_START and UNICODE_IDENTIFIER_PART rules where machine-
// generated by testing all characters from \0000 to \ffff using the methods
// of the UCharacter class from the ICU framework.

fragment UNICODE_IDENTIFIER_START
	:	'\u0041'..'\u005a' | '\u005f' | '\u0061'..'\u007a' |
		'\u00aa' | '\u00b5' | '\u00ba' | '\u00c0'..'\u00d6' |
		'\u00d8'..'\u00f6' | '\u00f8'..'\u02c1' | '\u02c6'..'\u02d1' |
		'\u02e0'..'\u02e4' | '\u02ee' | '\u037a'..'\u037d' | '\u0386' |
		'\u0388'..'\u038a' | '\u038c' | '\u038e'..'\u03a1' |
		'\u03a3'..'\u03ce' | '\u03d0'..'\u03f5' | '\u03f7'..'\u0481' |
		'\u048a'..'\u0513' | '\u0531'..'\u0556' | '\u0559' |
		'\u0561'..'\u0587' | '\u05d0'..'\u05ea' | '\u05f0'..'\u05f2' |
		'\u0621'..'\u063a' | '\u0640'..'\u064a' | '\u066e'..'\u066f' |
		'\u0671'..'\u06d3' | '\u06d5' | '\u06e5'..'\u06e6' |
		'\u06ee'..'\u06ef' | '\u06fa'..'\u06fc' | '\u06ff' | '\u0710' |
		'\u0712'..'\u072f' | '\u074d'..'\u076d' | '\u0780'..'\u07a5' |
		'\u07b1' | '\u07ca'..'\u07ea' | '\u07f4'..'\u07f5' | '\u07fa' |
		'\u0904'..'\u0939' | '\u093d' | '\u0950' | '\u0958'..'\u0961' |
		'\u097b'..'\u097f' | '\u0985'..'\u098c' | '\u098f'..'\u0990' |
		'\u0993'..'\u09a8' | '\u09aa'..'\u09b0' | '\u09b2' |
		'\u09b6'..'\u09b9' | '\u09bd' | '\u09ce' | '\u09dc'..'\u09dd' |
		'\u09df'..'\u09e1' | '\u09f0'..'\u09f1' | '\u0a05'..'\u0a0a' |
		'\u0a0f'..'\u0a10' | '\u0a13'..'\u0a28' | '\u0a2a'..'\u0a30' |
		'\u0a32'..'\u0a33' | '\u0a35'..'\u0a36' | '\u0a38'..'\u0a39' |
		'\u0a59'..'\u0a5c' | '\u0a5e' | '\u0a72'..'\u0a74' |
		'\u0a85'..'\u0a8d' | '\u0a8f'..'\u0a91' | '\u0a93'..'\u0aa8' |
		'\u0aaa'..'\u0ab0' | '\u0ab2'..'\u0ab3' | '\u0ab5'..'\u0ab9' |
		'\u0abd' | '\u0ad0' | '\u0ae0'..'\u0ae1' | '\u0b05'..'\u0b0c' |
		'\u0b0f'..'\u0b10' | '\u0b13'..'\u0b28' | '\u0b2a'..'\u0b30' |
		'\u0b32'..'\u0b33' | '\u0b35'..'\u0b39' | '\u0b3d' |
		'\u0b5c'..'\u0b5d' | '\u0b5f'..'\u0b61' | '\u0b71' | '\u0b83' |
		'\u0b85'..'\u0b8a' | '\u0b8e'..'\u0b90' | '\u0b92'..'\u0b95' |
		'\u0b99'..'\u0b9a' | '\u0b9c' | '\u0b9e'..'\u0b9f' |
		'\u0ba3'..'\u0ba4' | '\u0ba8'..'\u0baa' | '\u0bae'..'\u0bb9' |
		'\u0c05'..'\u0c0c' | '\u0c0e'..'\u0c10' | '\u0c12'..'\u0c28' |
		'\u0c2a'..'\u0c33' | '\u0c35'..'\u0c39' | '\u0c60'..'\u0c61' |
		'\u0c85'..'\u0c8c' | '\u0c8e'..'\u0c90' | '\u0c92'..'\u0ca8' |
		'\u0caa'..'\u0cb3' | '\u0cb5'..'\u0cb9' | '\u0cbd' | '\u0cde' |
		'\u0ce0'..'\u0ce1' | '\u0d05'..'\u0d0c' | '\u0d0e'..'\u0d10' |
		'\u0d12'..'\u0d28' | '\u0d2a'..'\u0d39' | '\u0d60'..'\u0d61' |
		'\u0d85'..'\u0d96' | '\u0d9a'..'\u0db1' | '\u0db3'..'\u0dbb' |
		'\u0dbd' | '\u0dc0'..'\u0dc6' | '\u0e01'..'\u0e30' |
		'\u0e32'..'\u0e33' | '\u0e40'..'\u0e46' | '\u0e81'..'\u0e82' |
		'\u0e84' | '\u0e87'..'\u0e88' | '\u0e8a' | '\u0e8d' |
		'\u0e94'..'\u0e97' | '\u0e99'..'\u0e9f' | '\u0ea1'..'\u0ea3' |
		'\u0ea5' | '\u0ea7' | '\u0eaa'..'\u0eab' | '\u0ead'..'\u0eb0' |
		'\u0eb2'..'\u0eb3' | '\u0ebd' | '\u0ec0'..'\u0ec4' | '\u0ec6' |
		'\u0edc'..'\u0edd' | '\u0f00' | '\u0f40'..'\u0f47' |
		'\u0f49'..'\u0f6a' | '\u0f88'..'\u0f8b' | '\u1000'..'\u1021' |
		'\u1023'..'\u1027' | '\u1029'..'\u102a' | '\u1050'..'\u1055' |
		'\u10a0'..'\u10c5' | '\u10d0'..'\u10fa' | '\u10fc' |
		'\u1100'..'\u1159' | '\u115f'..'\u11a2' | '\u11a8'..'\u11f9' |
		'\u1200'..'\u1248' | '\u124a'..'\u124d' | '\u1250'..'\u1256' |
		'\u1258' | '\u125a'..'\u125d' | '\u1260'..'\u1288' |
		'\u128a'..'\u128d' | '\u1290'..'\u12b0' | '\u12b2'..'\u12b5' |
		'\u12b8'..'\u12be' | '\u12c0' | '\u12c2'..'\u12c5' |
		'\u12c8'..'\u12d6' | '\u12d8'..'\u1310' | '\u1312'..'\u1315' |
		'\u1318'..'\u135a' | '\u1380'..'\u138f' | '\u13a0'..'\u13f4' |
		'\u1401'..'\u166c' | '\u166f'..'\u1676' | '\u1681'..'\u169a' |
		'\u16a0'..'\u16ea' | '\u16ee'..'\u16f0' | '\u1700'..'\u170c' |
		'\u170e'..'\u1711' | '\u1720'..'\u1731' | '\u1740'..'\u1751' |
		'\u1760'..'\u176c' | '\u176e'..'\u1770' | '\u1780'..'\u17b3' |
		'\u17d7' | '\u17dc' | '\u1820'..'\u1877' | '\u1880'..'\u18a8' |
		'\u1900'..'\u191c' | '\u1950'..'\u196d' | '\u1970'..'\u1974' |
		'\u1980'..'\u19a9' | '\u19c1'..'\u19c7' | '\u1a00'..'\u1a16' |
		'\u1b05'..'\u1b33' | '\u1b45'..'\u1b4b' | '\u1d00'..'\u1dbf' |
		'\u1e00'..'\u1e9b' | '\u1ea0'..'\u1ef9' | '\u1f00'..'\u1f15' |
		'\u1f18'..'\u1f1d' | '\u1f20'..'\u1f45' | '\u1f48'..'\u1f4d' |
		'\u1f50'..'\u1f57' | '\u1f59' | '\u1f5b' | '\u1f5d' |
		'\u1f5f'..'\u1f7d' | '\u1f80'..'\u1fb4' | '\u1fb6'..'\u1fbc' |
		'\u1fbe' | '\u1fc2'..'\u1fc4' | '\u1fc6'..'\u1fcc' |
		'\u1fd0'..'\u1fd3' | '\u1fd6'..'\u1fdb' | '\u1fe0'..'\u1fec' |
		'\u1ff2'..'\u1ff4' | '\u1ff6'..'\u1ffc' | '\u2071' | '\u207f' |
		'\u2090'..'\u2094' | '\u2102' | '\u2107' | '\u210a'..'\u2113' |
		'\u2115' | '\u2119'..'\u211d' | '\u2124' | '\u2126' | '\u2128'
		| '\u212a'..'\u212d' | '\u212f'..'\u2139' | '\u213c'..'\u213f'
		| '\u2145'..'\u2149' | '\u214e' | '\u2160'..'\u2184' |
		'\u2c00'..'\u2c2e' | '\u2c30'..'\u2c5e' | '\u2c60'..'\u2c6c' |
		'\u2c74'..'\u2c77' | '\u2c80'..'\u2ce4' | '\u2d00'..'\u2d25' |
		'\u2d30'..'\u2d65' | '\u2d6f' | '\u2d80'..'\u2d96' |
		'\u2da0'..'\u2da6' | '\u2da8'..'\u2dae' | '\u2db0'..'\u2db6' |
		'\u2db8'..'\u2dbe' | '\u2dc0'..'\u2dc6' | '\u2dc8'..'\u2dce' |
		'\u2dd0'..'\u2dd6' | '\u2dd8'..'\u2dde' | '\u3005'..'\u3007' |
		'\u3021'..'\u3029' | '\u3031'..'\u3035' | '\u3038'..'\u303c' |
		'\u3041'..'\u3096' | '\u309d'..'\u309f' | '\u30a1'..'\u30fa' |
		'\u30fc'..'\u30ff' | '\u3105'..'\u312c' | '\u3131'..'\u318e' |
		'\u31a0'..'\u31b7' | '\u31f0'..'\u31ff' | '\u3400'..'\u4db5' |
		'\u4e00'..'\u9fbb' | '\ua000'..'\ua48c' | '\ua717'..'\ua71a' |
		'\ua800'..'\ua801' | '\ua803'..'\ua805' | '\ua807'..'\ua80a' |
		'\ua80c'..'\ua822' | '\ua840'..'\ua873' | '\uac00'..'\ud7a3' |
		'\uf900'..'\ufa2d' | '\ufa30'..'\ufa6a' | '\ufa70'..'\ufad9' |
		'\ufb00'..'\ufb06' | '\ufb13'..'\ufb17' | '\ufb1d' |
		'\ufb1f'..'\ufb28' | '\ufb2a'..'\ufb36' | '\ufb38'..'\ufb3c' |
		'\ufb3e' | '\ufb40'..'\ufb41' | '\ufb43'..'\ufb44' |
		'\ufb46'..'\ufbb1' | '\ufbd3'..'\ufd3d' | '\ufd50'..'\ufd8f' |
		'\ufd92'..'\ufdc7' | '\ufdf0'..'\ufdfb' | '\ufe70'..'\ufe74' |
		'\ufe76'..'\ufefc' | '\uff21'..'\uff3a' | '\uff41'..'\uff5a' |
		'\uff66'..'\uffbe' | '\uffc2'..'\uffc7' | '\uffca'..'\uffcf' |
		'\uffd2'..'\uffd7' | '\uffda'..'\uffdc'
	;
fragment UNICODE_IDENTIFIER_PART
	:	'\u0000'..'\u0008' | '\u000e'..'\u001b' |
		'\u0030'..'\u0039' | '\u0041'..'\u005a' | '\u005f' |
		'\u0061'..'\u007a' | '\u007f'..'\u009f' | '\u00aa' | '\u00ad' |
		'\u00b5' | '\u00ba' | '\u00c0'..'\u00d6' | '\u00d8'..'\u00f6' |
		'\u00f8'..'\u02c1' | '\u02c6'..'\u02d1' | '\u02e0'..'\u02e4' |
		'\u02ee' | '\u0300'..'\u036f' | '\u037a'..'\u037d' | '\u0386' |
		'\u0388'..'\u038a' | '\u038c' | '\u038e'..'\u03a1' |
		'\u03a3'..'\u03ce' | '\u03d0'..'\u03f5' | '\u03f7'..'\u0481' |
		'\u0483'..'\u0486' | '\u048a'..'\u0513' | '\u0531'..'\u0556' |
		'\u0559' | '\u0561'..'\u0587' | '\u0591'..'\u05bd' | '\u05bf' |
		'\u05c1'..'\u05c2' | '\u05c4'..'\u05c5' | '\u05c7' |
		'\u05d0'..'\u05ea' | '\u05f0'..'\u05f2' | '\u0600'..'\u0603' |
		'\u0610'..'\u0615' | '\u0621'..'\u063a' | '\u0640'..'\u065e' |
		'\u0660'..'\u0669' | '\u066e'..'\u06d3' | '\u06d5'..'\u06dd' |
		'\u06df'..'\u06e8' | '\u06ea'..'\u06fc' | '\u06ff' |
		'\u070f'..'\u074a' | '\u074d'..'\u076d' | '\u0780'..'\u07b1' |
		'\u07c0'..'\u07f5' | '\u07fa' | '\u0901'..'\u0939' |
		'\u093c'..'\u094d' | '\u0950'..'\u0954' | '\u0958'..'\u0963' |
		'\u0966'..'\u096f' | '\u097b'..'\u097f' | '\u0981'..'\u0983' |
		'\u0985'..'\u098c' | '\u098f'..'\u0990' | '\u0993'..'\u09a8' |
		'\u09aa'..'\u09b0' | '\u09b2' | '\u09b6'..'\u09b9' |
		'\u09bc'..'\u09c4' | '\u09c7'..'\u09c8' | '\u09cb'..'\u09ce' |
		'\u09d7' | '\u09dc'..'\u09dd' | '\u09df'..'\u09e3' |
		'\u09e6'..'\u09f1' | '\u0a01'..'\u0a03' | '\u0a05'..'\u0a0a' |
		'\u0a0f'..'\u0a10' | '\u0a13'..'\u0a28' | '\u0a2a'..'\u0a30' |
		'\u0a32'..'\u0a33' | '\u0a35'..'\u0a36' | '\u0a38'..'\u0a39' |
		'\u0a3c' | '\u0a3e'..'\u0a42' | '\u0a47'..'\u0a48' |
		'\u0a4b'..'\u0a4d' | '\u0a59'..'\u0a5c' | '\u0a5e' |
		'\u0a66'..'\u0a74' | '\u0a81'..'\u0a83' | '\u0a85'..'\u0a8d' |
		'\u0a8f'..'\u0a91' | '\u0a93'..'\u0aa8' | '\u0aaa'..'\u0ab0' |
		'\u0ab2'..'\u0ab3' | '\u0ab5'..'\u0ab9' | '\u0abc'..'\u0ac5' |
		'\u0ac7'..'\u0ac9' | '\u0acb'..'\u0acd' | '\u0ad0' |
		'\u0ae0'..'\u0ae3' | '\u0ae6'..'\u0aef' | '\u0b01'..'\u0b03' |
		'\u0b05'..'\u0b0c' | '\u0b0f'..'\u0b10' | '\u0b13'..'\u0b28' |
		'\u0b2a'..'\u0b30' | '\u0b32'..'\u0b33' | '\u0b35'..'\u0b39' |
		'\u0b3c'..'\u0b43' | '\u0b47'..'\u0b48' | '\u0b4b'..'\u0b4d' |
		'\u0b56'..'\u0b57' | '\u0b5c'..'\u0b5d' | '\u0b5f'..'\u0b61' |
		'\u0b66'..'\u0b6f' | '\u0b71' | '\u0b82'..'\u0b83' |
		'\u0b85'..'\u0b8a' | '\u0b8e'..'\u0b90' | '\u0b92'..'\u0b95' |
		'\u0b99'..'\u0b9a' | '\u0b9c' | '\u0b9e'..'\u0b9f' |
		'\u0ba3'..'\u0ba4' | '\u0ba8'..'\u0baa' | '\u0bae'..'\u0bb9' |
		'\u0bbe'..'\u0bc2' | '\u0bc6'..'\u0bc8' | '\u0bca'..'\u0bcd' |
		'\u0bd7' | '\u0be6'..'\u0bef' | '\u0c01'..'\u0c03' |
		'\u0c05'..'\u0c0c' | '\u0c0e'..'\u0c10' | '\u0c12'..'\u0c28' |
		'\u0c2a'..'\u0c33' | '\u0c35'..'\u0c39' | '\u0c3e'..'\u0c44' |
		'\u0c46'..'\u0c48' | '\u0c4a'..'\u0c4d' | '\u0c55'..'\u0c56' |
		'\u0c60'..'\u0c61' | '\u0c66'..'\u0c6f' | '\u0c82'..'\u0c83' |
		'\u0c85'..'\u0c8c' | '\u0c8e'..'\u0c90' | '\u0c92'..'\u0ca8' |
		'\u0caa'..'\u0cb3' | '\u0cb5'..'\u0cb9' | '\u0cbc'..'\u0cc4' |
		'\u0cc6'..'\u0cc8' | '\u0cca'..'\u0ccd' | '\u0cd5'..'\u0cd6' |
		'\u0cde' | '\u0ce0'..'\u0ce3' | '\u0ce6'..'\u0cef' |
		'\u0d02'..'\u0d03' | '\u0d05'..'\u0d0c' | '\u0d0e'..'\u0d10' |
		'\u0d12'..'\u0d28' | '\u0d2a'..'\u0d39' | '\u0d3e'..'\u0d43' |
		'\u0d46'..'\u0d48' | '\u0d4a'..'\u0d4d' | '\u0d57' |
		'\u0d60'..'\u0d61' | '\u0d66'..'\u0d6f' | '\u0d82'..'\u0d83' |
		'\u0d85'..'\u0d96' | '\u0d9a'..'\u0db1' | '\u0db3'..'\u0dbb' |
		'\u0dbd' | '\u0dc0'..'\u0dc6' | '\u0dca' | '\u0dcf'..'\u0dd4' |
		'\u0dd6' | '\u0dd8'..'\u0ddf' | '\u0df2'..'\u0df3' |
		'\u0e01'..'\u0e3a' | '\u0e40'..'\u0e4e' | '\u0e50'..'\u0e59' |
		'\u0e81'..'\u0e82' | '\u0e84' | '\u0e87'..'\u0e88' | '\u0e8a' |
		'\u0e8d' | '\u0e94'..'\u0e97' | '\u0e99'..'\u0e9f' |
		'\u0ea1'..'\u0ea3' | '\u0ea5' | '\u0ea7' | '\u0eaa'..'\u0eab' |
		'\u0ead'..'\u0eb9' | '\u0ebb'..'\u0ebd' | '\u0ec0'..'\u0ec4' |
		'\u0ec6' | '\u0ec8'..'\u0ecd' | '\u0ed0'..'\u0ed9' |
		'\u0edc'..'\u0edd' | '\u0f00' | '\u0f18'..'\u0f19' |
		'\u0f20'..'\u0f29' | '\u0f35' | '\u0f37' | '\u0f39' |
		'\u0f3e'..'\u0f47' | '\u0f49'..'\u0f6a' | '\u0f71'..'\u0f84' |
		'\u0f86'..'\u0f8b' | '\u0f90'..'\u0f97' | '\u0f99'..'\u0fbc' |
		'\u0fc6' | '\u1000'..'\u1021' | '\u1023'..'\u1027' |
		'\u1029'..'\u102a' | '\u102c'..'\u1032' | '\u1036'..'\u1039' |
		'\u1040'..'\u1049' | '\u1050'..'\u1059' | '\u10a0'..'\u10c5' |
		'\u10d0'..'\u10fa' | '\u10fc' | '\u1100'..'\u1159' |
		'\u115f'..'\u11a2' | '\u11a8'..'\u11f9' | '\u1200'..'\u1248' |
		'\u124a'..'\u124d' | '\u1250'..'\u1256' | '\u1258' |
		'\u125a'..'\u125d' | '\u1260'..'\u1288' | '\u128a'..'\u128d' |
		'\u1290'..'\u12b0' | '\u12b2'..'\u12b5' | '\u12b8'..'\u12be' |
		'\u12c0' | '\u12c2'..'\u12c5' | '\u12c8'..'\u12d6' |
		'\u12d8'..'\u1310' | '\u1312'..'\u1315' | '\u1318'..'\u135a' |
		'\u135f' | '\u1380'..'\u138f' | '\u13a0'..'\u13f4' |
		'\u1401'..'\u166c' | '\u166f'..'\u1676' | '\u1681'..'\u169a' |
		'\u16a0'..'\u16ea' | '\u16ee'..'\u16f0' | '\u1700'..'\u170c' |
		'\u170e'..'\u1714' | '\u1720'..'\u1734' | '\u1740'..'\u1753' |
		'\u1760'..'\u176c' | '\u176e'..'\u1770' | '\u1772'..'\u1773' |
		'\u1780'..'\u17d3' | '\u17d7' | '\u17dc'..'\u17dd' |
		'\u17e0'..'\u17e9' | '\u180b'..'\u180d' | '\u1810'..'\u1819' |
		'\u1820'..'\u1877' | '\u1880'..'\u18a9' | '\u1900'..'\u191c' |
		'\u1920'..'\u192b' | '\u1930'..'\u193b' | '\u1946'..'\u196d' |
		'\u1970'..'\u1974' | '\u1980'..'\u19a9' | '\u19b0'..'\u19c9' |
		'\u19d0'..'\u19d9' | '\u1a00'..'\u1a1b' | '\u1b00'..'\u1b4b' |
		'\u1b50'..'\u1b59' | '\u1b6b'..'\u1b73' | '\u1d00'..'\u1dca' |
		'\u1dfe'..'\u1e9b' | '\u1ea0'..'\u1ef9' | '\u1f00'..'\u1f15' |
		'\u1f18'..'\u1f1d' | '\u1f20'..'\u1f45' | '\u1f48'..'\u1f4d' |
		'\u1f50'..'\u1f57' | '\u1f59' | '\u1f5b' | '\u1f5d' |
		'\u1f5f'..'\u1f7d' | '\u1f80'..'\u1fb4' | '\u1fb6'..'\u1fbc' |
		'\u1fbe' | '\u1fc2'..'\u1fc4' | '\u1fc6'..'\u1fcc' |
		'\u1fd0'..'\u1fd3' | '\u1fd6'..'\u1fdb' | '\u1fe0'..'\u1fec' |
		'\u1ff2'..'\u1ff4' | '\u1ff6'..'\u1ffc' | '\u200b'..'\u200f' |
		'\u202a'..'\u202e' | '\u203f'..'\u2040' | '\u2054' |
		'\u2060'..'\u2063' | '\u206a'..'\u206f' | '\u2071' | '\u207f' |
		'\u2090'..'\u2094' | '\u20d0'..'\u20dc' | '\u20e1' |
		'\u20e5'..'\u20ef' | '\u2102' | '\u2107' | '\u210a'..'\u2113' |
		'\u2115' | '\u2119'..'\u211d' | '\u2124' | '\u2126' | '\u2128'
		| '\u212a'..'\u212d' | '\u212f'..'\u2139' | '\u213c'..'\u213f'
		| '\u2145'..'\u2149' | '\u214e' | '\u2160'..'\u2184' |
		'\u2c00'..'\u2c2e' | '\u2c30'..'\u2c5e' | '\u2c60'..'\u2c6c' |
		'\u2c74'..'\u2c77' | '\u2c80'..'\u2ce4' | '\u2d00'..'\u2d25' |
		'\u2d30'..'\u2d65' | '\u2d6f' | '\u2d80'..'\u2d96' |
		'\u2da0'..'\u2da6' | '\u2da8'..'\u2dae' | '\u2db0'..'\u2db6' |
		'\u2db8'..'\u2dbe' | '\u2dc0'..'\u2dc6' | '\u2dc8'..'\u2dce' |
		'\u2dd0'..'\u2dd6' | '\u2dd8'..'\u2dde' | '\u3005'..'\u3007' |
		'\u3021'..'\u302f' | '\u3031'..'\u3035' | '\u3038'..'\u303c' |
		'\u3041'..'\u3096' | '\u3099'..'\u309a' | '\u309d'..'\u309f' |
		'\u30a1'..'\u30fa' | '\u30fc'..'\u30ff' | '\u3105'..'\u312c' |
		'\u3131'..'\u318e' | '\u31a0'..'\u31b7' | '\u31f0'..'\u31ff' |
		'\u3400'..'\u4db5' | '\u4e00'..'\u9fbb' | '\ua000'..'\ua48c' |
		'\ua717'..'\ua71a' | '\ua800'..'\ua827' | '\ua840'..'\ua873' |
		'\uac00'..'\ud7a3' | '\uf900'..'\ufa2d' | '\ufa30'..'\ufa6a' |
		'\ufa70'..'\ufad9' | '\ufb00'..'\ufb06' | '\ufb13'..'\ufb17' |
		'\ufb1d'..'\ufb28' | '\ufb2a'..'\ufb36' | '\ufb38'..'\ufb3c' |
		'\ufb3e' | '\ufb40'..'\ufb41' | '\ufb43'..'\ufb44' |
		'\ufb46'..'\ufbb1' | '\ufbd3'..'\ufd3d' | '\ufd50'..'\ufd8f' |
		'\ufd92'..'\ufdc7' | '\ufdf0'..'\ufdfb' | '\ufe00'..'\ufe0f' |
		'\ufe20'..'\ufe23' | '\ufe33'..'\ufe34' | '\ufe4d'..'\ufe4f' |
		'\ufe70'..'\ufe74' | '\ufe76'..'\ufefc' | '\ufeff' |
		'\uff10'..'\uff19' | '\uff21'..'\uff3a' | '\uff3f' |
		'\uff41'..'\uff5a' | '\uff66'..'\uffbe' | '\uffc2'..'\uffc7' |
		'\uffca'..'\uffcf' | '\uffd2'..'\uffd7' | '\uffda'..'\uffdc' |
		'\ufff9'..'\ufffb'
	;
*/

STRING_LITERAL
	:	'"' (ESC|~('"'|'\\'|'\n'|'\r'))* '"'
	|	'\'' (ESC|~('\''|'\\'|'\n'|'\r'))* '\''
	;

HEX_LITERAL : '0' ('x'|'X') HEX_DIGIT+ ;

DECIMAL_LITERAL : ('0' | '1'..'9' '0'..'9'*) ;

OCTAL_LITERAL : '0' ('0'..'7')+ ;

FLOAT_LITERAL
	:	('0'..'9')+ '.' ('0'..'9')* EXPONENT?
	|	'.' ('0'..'9')+ EXPONENT?
	;

// whitespace -- ignored
WS	:	(
			' '
		|	'\t'
		|	'\f'
		)+
		{$channel=HIDDEN;}
	;

EOL	
	:	(
			'\r' '\n'  	// DOS
		|	'\r'    	// Mac
		|	'\n'    	// Unix
		)
		{$channel=HIDDEN;}
	; 
   
// skip BOM bytes
BOM	:	(	'\u00EF'  '\u00BB' '\u00BF'
		|	'\uFEFF'
		)
		{ $channel=HIDDEN; };
	
// single-line comments
SL_COMMENT
	:	'//' (~('\n'|'\r'))* ('\n'|'\r'('\n')?)?
		{$channel=HIDDEN;}
	;

// multiple-line comments
ML_COMMENT
	:	'/*' ( options {greedy=false;} : . )* '*/'
		{$channel=HIDDEN;}
	;

fragment EXPONENT
	:	('e'|'E') ('+'|'-')? ('0'..'9')+
	;

fragment HEX_DIGIT
	:	('0'..'9'|'A'..'F'|'a'..'f')
	;

fragment OCT_DIGIT
	:	'0'..'7'
	;

fragment ESC
	:	CTRLCHAR_ESC
	|	UNICODE_ESC
	|	OCTAL_ESC
	;

fragment CTRLCHAR_ESC
	:	'\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
	;

fragment OCTAL_ESC
	:	'\\' ('0'..'3') ('0'..'7') ('0'..'7')
	|	'\\' ('0'..'7') ('0'..'7')
	|	'\\' ('0'..'7')
	;

fragment UNICODE_ESC
	:	'\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
	;