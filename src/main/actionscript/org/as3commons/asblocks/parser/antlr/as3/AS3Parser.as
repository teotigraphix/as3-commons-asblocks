// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g 2011-08-16 07:51:22
package org.as3commons.asblocks.parser.antlr.as3 {

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

    import org.antlr.runtime.*;
        

    import org.antlr.runtime.tree.*;


    public class AS3Parser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "COMPILATION_UNIT", "MXML_SCRIPT_UNIT", "PROGRAM_UNIT", "COMPILE_CONFIG", "ANNOTATIONS", "METATAG", "METATAG_PARAMS", "MODIFIERS", "NAMESPACE_DEF", "TYPE_BLOCK", "STATIC_BLOCK", "BLOCK", "CLASS_DEF", "INTERFACE_DEF", "FUNCTION_DEF", "FIELD_DEF", "VARIABLE_DEF", "VAR_DEC", "FUNC_DEF", "METHOD_DEF", "TYPE_SPEC", "TYPE", "TYPE_POSTFIX", "VAR_INIT", "ACCESSOR_ROLE", "PARAMS", "PARAM", "EXPR_STMNT", "ENCPS_EXPR", "CONDITION", "ELIST", "FUNCTION_CALL", "ARGUMENTS", "FIELD_ACCESS", "ARRAY_ACCESS", "MULT", "UNARY_PLUS", "UNARY_MINUS", "POST_INC", "POST_DEC", "PRE_INC", "PRE_DEC", "ARRAY_LITERAL", "OBJECT_LITERAL", "OBJECT_FIELD", "FOR_INIT", "FOR_CONDITION", "FOR_ITERATOR", "FOR_EACH", "FOR_IN", "SWITCH_STATEMENT_LIST", "LABEL_STMNT", "DEFAULT_XML_NAMESPACE", "STATIC_LINK", "SR", "BSR", "STAR_ASSIGN", "SR_ASSIGN", "BSR_ASSIGN", "GE", "E4X_FILTER", "E4X_ATTRI_PROPERTY", "E4X_ATTRI_STAR", "E4X_ATTRI_EXPR", "E4X_EXPRESSION", "VECTOR_INIT", "VIRTUAL_PLACEHOLDER", "XML_EMPTY_ELEMENT", "XML_ELEMENT", "XML_ATTRIBUTE", "XML_LIST", "PACKAGE", "LBRACE", "RBRACE", "SEMI", "IDENT", "DBL_COLON", "LBRACK", "RBRACK", "LPAREN", "COMMA", "RPAREN", "ASSIGN", "INCLUDE", "STRING_LITERAL", "USE", "NAMESPACE", "IMPORT", "DOT", "STAR", "DYNAMIC", "FINAL", "INTERNAL", "OVERRIDE", "PRIVATE", "PROTECTED", "PUBLIC", "STATIC", "NATIVE", "CLASS", "EXTENDS", "IMPLEMENTS", "INTERFACE", "FUNCTION", "GET", "SET", "VAR", "CONST", "IF", "ELSE", "FOR", "EACH", "IN", "THROW", "TRY", "CATCH", "FINALLY", "SWITCH", "CASE", "COLON", "DEFAULT", "WHILE", "DO", "WITH", "RETURN", "CONTINUE", "BREAK", "VOID", "POST", "GT", "IS", "AS", "DIV_ASSIGN", "MOD_ASSIGN", "PLUS_ASSIGN", "MINUS_ASSIGN", "SL_ASSIGN", "BAND_ASSIGN", "BXOR_ASSIGN", "BOR_ASSIGN", "LAND_ASSIGN", "LOR_ASSIGN", "QUESTION", "LOR", "LAND", "BOR", "BXOR", "BAND", "STRICT_EQUAL", "STRICT_NOT_EQUAL", "NOT_EQUAL", "EQUAL", "LT", "LE", "INSTANCEOF", "SL", "PLUS", "MINUS", "DIV", "MOD", "INC", "DEC", "DELETE", "TYPEOF", "LNOT", "BNOT", "E4X_DESC", "UNDEFINED", "THIS", "SUPER", "NEW", "NULL", "FALSE", "TRUE", "XML_LITERAL", "REGEXP_LITERAL", "HEX_LITERAL", "DECIMAL_LITERAL", "OCTAL_LITERAL", "FLOAT_LITERAL", "REST", "E4X_ATTRI", "BSLASH", "REGEX_BODY", "REGEX_POSTFIX", "XML_SUBTREE", "XML_BINDING", "XML_WS", "XML_TEXTNODE", "XML_COMMENT", "XML_CDATA", "XML_AS3_EXPRESSION", "ESC", "HEX_DIGIT", "EXPONENT", "WS", "EOL", "BOM", "SL_COMMENT", "ML_COMMENT", "OCT_DIGIT", "CTRLCHAR_ESC", "UNICODE_ESC", "OCTAL_ESC"
        ];
        public static const EOF:int=-1;
        public static const COMPILATION_UNIT:int=4;
        public static const MXML_SCRIPT_UNIT:int=5;
        public static const PROGRAM_UNIT:int=6;
        public static const COMPILE_CONFIG:int=7;
        public static const ANNOTATIONS:int=8;
        public static const METATAG:int=9;
        public static const METATAG_PARAMS:int=10;
        public static const MODIFIERS:int=11;
        public static const NAMESPACE_DEF:int=12;
        public static const TYPE_BLOCK:int=13;
        public static const STATIC_BLOCK:int=14;
        public static const BLOCK:int=15;
        public static const CLASS_DEF:int=16;
        public static const INTERFACE_DEF:int=17;
        public static const FUNCTION_DEF:int=18;
        public static const FIELD_DEF:int=19;
        public static const VARIABLE_DEF:int=20;
        public static const VAR_DEC:int=21;
        public static const FUNC_DEF:int=22;
        public static const METHOD_DEF:int=23;
        public static const TYPE_SPEC:int=24;
        public static const TYPE:int=25;
        public static const TYPE_POSTFIX:int=26;
        public static const VAR_INIT:int=27;
        public static const ACCESSOR_ROLE:int=28;
        public static const PARAMS:int=29;
        public static const PARAM:int=30;
        public static const EXPR_STMNT:int=31;
        public static const ENCPS_EXPR:int=32;
        public static const CONDITION:int=33;
        public static const ELIST:int=34;
        public static const FUNCTION_CALL:int=35;
        public static const ARGUMENTS:int=36;
        public static const FIELD_ACCESS:int=37;
        public static const ARRAY_ACCESS:int=38;
        public static const MULT:int=39;
        public static const UNARY_PLUS:int=40;
        public static const UNARY_MINUS:int=41;
        public static const POST_INC:int=42;
        public static const POST_DEC:int=43;
        public static const PRE_INC:int=44;
        public static const PRE_DEC:int=45;
        public static const ARRAY_LITERAL:int=46;
        public static const OBJECT_LITERAL:int=47;
        public static const OBJECT_FIELD:int=48;
        public static const FOR_INIT:int=49;
        public static const FOR_CONDITION:int=50;
        public static const FOR_ITERATOR:int=51;
        public static const FOR_EACH:int=52;
        public static const FOR_IN:int=53;
        public static const SWITCH_STATEMENT_LIST:int=54;
        public static const LABEL_STMNT:int=55;
        public static const DEFAULT_XML_NAMESPACE:int=56;
        public static const STATIC_LINK:int=57;
        public static const SR:int=58;
        public static const BSR:int=59;
        public static const STAR_ASSIGN:int=60;
        public static const SR_ASSIGN:int=61;
        public static const BSR_ASSIGN:int=62;
        public static const GE:int=63;
        public static const E4X_FILTER:int=64;
        public static const E4X_ATTRI_PROPERTY:int=65;
        public static const E4X_ATTRI_STAR:int=66;
        public static const E4X_ATTRI_EXPR:int=67;
        public static const E4X_EXPRESSION:int=68;
        public static const VECTOR_INIT:int=69;
        public static const VIRTUAL_PLACEHOLDER:int=70;
        public static const XML_EMPTY_ELEMENT:int=71;
        public static const XML_ELEMENT:int=72;
        public static const XML_ATTRIBUTE:int=73;
        public static const XML_LIST:int=74;
        public static const PACKAGE:int=75;
        public static const LBRACE:int=76;
        public static const RBRACE:int=77;
        public static const SEMI:int=78;
        public static const IDENT:int=79;
        public static const DBL_COLON:int=80;
        public static const LBRACK:int=81;
        public static const RBRACK:int=82;
        public static const LPAREN:int=83;
        public static const COMMA:int=84;
        public static const RPAREN:int=85;
        public static const ASSIGN:int=86;
        public static const INCLUDE:int=87;
        public static const STRING_LITERAL:int=88;
        public static const USE:int=89;
        public static const NAMESPACE:int=90;
        public static const IMPORT:int=91;
        public static const DOT:int=92;
        public static const STAR:int=93;
        public static const DYNAMIC:int=94;
        public static const FINAL:int=95;
        public static const INTERNAL:int=96;
        public static const OVERRIDE:int=97;
        public static const PRIVATE:int=98;
        public static const PROTECTED:int=99;
        public static const PUBLIC:int=100;
        public static const STATIC:int=101;
        public static const NATIVE:int=102;
        public static const CLASS:int=103;
        public static const EXTENDS:int=104;
        public static const IMPLEMENTS:int=105;
        public static const INTERFACE:int=106;
        public static const FUNCTION:int=107;
        public static const GET:int=108;
        public static const SET:int=109;
        public static const VAR:int=110;
        public static const CONST:int=111;
        public static const IF:int=112;
        public static const ELSE:int=113;
        public static const FOR:int=114;
        public static const EACH:int=115;
        public static const IN:int=116;
        public static const THROW:int=117;
        public static const TRY:int=118;
        public static const CATCH:int=119;
        public static const FINALLY:int=120;
        public static const SWITCH:int=121;
        public static const CASE:int=122;
        public static const COLON:int=123;
        public static const DEFAULT:int=124;
        public static const WHILE:int=125;
        public static const DO:int=126;
        public static const WITH:int=127;
        public static const RETURN:int=128;
        public static const CONTINUE:int=129;
        public static const BREAK:int=130;
        public static const VOID:int=131;
        public static const POST:int=132;
        public static const GT:int=133;
        public static const IS:int=134;
        public static const AS:int=135;
        public static const DIV_ASSIGN:int=136;
        public static const MOD_ASSIGN:int=137;
        public static const PLUS_ASSIGN:int=138;
        public static const MINUS_ASSIGN:int=139;
        public static const SL_ASSIGN:int=140;
        public static const BAND_ASSIGN:int=141;
        public static const BXOR_ASSIGN:int=142;
        public static const BOR_ASSIGN:int=143;
        public static const LAND_ASSIGN:int=144;
        public static const LOR_ASSIGN:int=145;
        public static const QUESTION:int=146;
        public static const LOR:int=147;
        public static const LAND:int=148;
        public static const BOR:int=149;
        public static const BXOR:int=150;
        public static const BAND:int=151;
        public static const STRICT_EQUAL:int=152;
        public static const STRICT_NOT_EQUAL:int=153;
        public static const NOT_EQUAL:int=154;
        public static const EQUAL:int=155;
        public static const LT:int=156;
        public static const LE:int=157;
        public static const INSTANCEOF:int=158;
        public static const SL:int=159;
        public static const PLUS:int=160;
        public static const MINUS:int=161;
        public static const DIV:int=162;
        public static const MOD:int=163;
        public static const INC:int=164;
        public static const DEC:int=165;
        public static const DELETE:int=166;
        public static const TYPEOF:int=167;
        public static const LNOT:int=168;
        public static const BNOT:int=169;
        public static const E4X_DESC:int=170;
        public static const UNDEFINED:int=171;
        public static const THIS:int=172;
        public static const SUPER:int=173;
        public static const NEW:int=174;
        public static const NULL:int=175;
        public static const FALSE:int=176;
        public static const TRUE:int=177;
        public static const XML_LITERAL:int=178;
        public static const REGEXP_LITERAL:int=179;
        public static const HEX_LITERAL:int=180;
        public static const DECIMAL_LITERAL:int=181;
        public static const OCTAL_LITERAL:int=182;
        public static const FLOAT_LITERAL:int=183;
        public static const REST:int=184;
        public static const E4X_ATTRI:int=185;
        public static const BSLASH:int=186;
        public static const REGEX_BODY:int=187;
        public static const REGEX_POSTFIX:int=188;
        public static const XML_SUBTREE:int=189;
        public static const XML_BINDING:int=190;
        public static const XML_WS:int=191;
        public static const XML_TEXTNODE:int=192;
        public static const XML_COMMENT:int=193;
        public static const XML_CDATA:int=194;
        public static const XML_AS3_EXPRESSION:int=195;
        public static const ESC:int=196;
        public static const HEX_DIGIT:int=197;
        public static const EXPONENT:int=198;
        public static const WS:int=199;
        public static const EOL:int=200;
        public static const BOM:int=201;
        public static const SL_COMMENT:int=202;
        public static const ML_COMMENT:int=203;
        public static const OCT_DIGIT:int=204;
        public static const CTRLCHAR_ESC:int=205;
        public static const UNICODE_ESC:int=206;
        public static const OCTAL_ESC:int=207;

        // delegates
        // delegators

        protected var InOperator_stack:Array = new Array();


            public function AS3Parser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);

                dfa14 = new DFA(this, 14,
                            "343:1: metaTagParam : ( ident ASSIGN constant -> ^( ASSIGN ident constant ) | constant -> constant | ( ident DOT )=> type -> type | ident ASSIGN ( ident DOT )=> type -> ^( ASSIGN ident type ) | ident -> ident );",
                            DFA14_eot, DFA14_eof, DFA14_min,
                            DFA14_max, DFA14_accept, DFA14_special,
                            DFA14_transition, DFA14_specialStateTransition);

                dfa27 = new DFA(this, 27,
                            "526:1: classTypeBlockEntry : ( ( configIdent LBRACE )=> configBlockEntry | ( LBRACE )=> staticBlockEntry | (a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry ) ) );",
                            DFA27_eot, DFA27_eof, DFA27_min,
                            DFA27_max, DFA27_accept, DFA27_special,
                            DFA27_transition, DFA27_specialStateTransition);

                dfa37 = new DFA(this, 37,
                            "686:1: statement options {k=1; } : ({...}? block | statementTail );",
                            DFA37_eot, DFA37_eof, DFA37_min,
                            DFA37_max, DFA37_accept, DFA37_special,
                            DFA37_transition, DFA37_specialStateTransition);

                dfa38 = new DFA(this, 38,
                            "697:4: ( declarationStatement | expressionStatement | ifStatement | ( FOR EACH )=> forEachStatement | forStatement | whileStatement | doWhileStatement | continueStatement | breakStatement | returnStatement | withStatement | labelStatement | switchStatement | throwStatement | tryStatement | defaultXMLNamespaceStatement | includeDirective | importDirective | useNamespaceDirective | configBlockDirective | emptyStatement )",
                            DFA38_eot, DFA38_eof, DFA38_min,
                            DFA38_max, DFA38_accept, DFA38_special,
                            DFA38_transition, DFA38_specialStateTransition);

                dfa43 = new DFA(this, 43,
                            "824:3: ( ( forInClauseDecl IN )=> forInClause RPAREN statement -> ^( FOR_IN[$f] forInClause statement ) | traditionalForClause RPAREN statement -> ^( $f traditionalForClause statement ) )",
                            DFA43_eot, DFA43_eof, DFA43_min,
                            DFA43_max, DFA43_accept, DFA43_special,
                            DFA43_transition, DFA43_specialStateTransition);

                dfa65 = new DFA(this, 65,
                            "1046:1: ident : ( IDENT | i= USE -> IDENT[$i] | xmlKeyword | i= DYNAMIC -> IDENT[$i] | i= NAMESPACE -> IDENT[$i] | i= IS -> IDENT[$i] | i= AS -> IDENT[$i] | i= GET -> IDENT[$i] | i= SET -> IDENT[$i] );",
                            DFA65_eot, DFA65_eof, DFA65_min,
                            DFA65_max, DFA65_accept, DFA65_special,
                            DFA65_transition, DFA65_specialStateTransition);

                dfa67 = new DFA(this, 67,
                            "()* loopback of 1082:26: ( ( assignmentOperator )=>o= assignmentOperator assignmentExpression )*",
                            DFA67_eot, DFA67_eof, DFA67_min,
                            DFA67_max, DFA67_accept, DFA67_special,
                            DFA67_transition, DFA67_specialStateTransition);

                dfa68 = new DFA(this, 68,
                            "1091:1: assignmentOperator : ( ASSIGN | ( ( '*' '=' )=> '*' '=' -> STAR_ASSIGN[\"*=\"] ) | DIV_ASSIGN | MOD_ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN | SL_ASSIGN | ( ( '>' '>' '=' )=> '>' '>' '=' -> SR_ASSIGN[\">>=\"] ) | ( ( '>' '>' '>' '=' )=> '>' '>' '>' '=' -> BSR_ASSIGN[\">>>=\"] ) | BAND_ASSIGN | BXOR_ASSIGN | BOR_ASSIGN | LAND_ASSIGN | LOR_ASSIGN );",
                            DFA68_eot, DFA68_eof, DFA68_min,
                            DFA68_max, DFA68_accept, DFA68_special,
                            DFA68_transition, DFA68_specialStateTransition);

                dfa76 = new DFA(this, 76,
                            "()* loopback of 1186:3: ( ( relationalOperator )=>o= relationalOperator shiftExpression )*",
                            DFA76_eot, DFA76_eof, DFA76_min,
                            DFA76_max, DFA76_accept, DFA76_special,
                            DFA76_transition, DFA76_specialStateTransition);

                dfa78 = new DFA(this, 78,
                            "1190:1: relationalOperator : ( ( ( '>' )=> '>' -> GT[\">\"] ) | ( ( '>' '=' )=> '>' '=' -> GE[\">=\"] ) | ({...}? IN | LT | LE | IS | AS | INSTANCEOF ) );",
                            DFA78_eot, DFA78_eof, DFA78_min,
                            DFA78_max, DFA78_accept, DFA78_special,
                            DFA78_transition, DFA78_specialStateTransition);

                dfa80 = new DFA(this, 80,
                            "1204:1: shiftOperator : ( SL | ( ( '>' '>' )=> '>' '>' -> SR[\">>\"] ) | ( ( '>' '>' '>' )=> '>' '>' '>' -> BSR[\">>>\"] ) );",
                            DFA80_eot, DFA80_eof, DFA80_min,
                            DFA80_max, DFA80_accept, DFA80_special,
                            DFA80_transition, DFA80_specialStateTransition);

                dfa88 = new DFA(this, 88,
                            "()* loopback of 1273:2: ( ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) ) | ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) ) | ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) ) | typePostfixSyntax -> ^( $leftHandSideExpression memberExpression typePostfixSyntax ) | DOT LPAREN expression RPAREN -> ^( E4X_FILTER $leftHandSideExpression expression ) | DBL_COLON eitherIdentifier -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier ) | DOT e4xAttributeIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier ) | E4X_DESC e4xExpression -> ^( E4X_DESC $leftHandSideExpression e4xExpression ) )*",
                            DFA88_eot, DFA88_eof, DFA88_min,
                            DFA88_max, DFA88_accept, DFA88_special,
                            DFA88_transition);

            }
            
        protected var adaptor:TreeAdaptor = new CommonTreeAdaptor();

        override public function set treeAdaptor(adaptor:TreeAdaptor):void {
            this.adaptor = adaptor;
        }
        override public function get treeAdaptor():TreeAdaptor {
            return adaptor;
        }

        public override function get tokenNames():Array { return AS3Parser.tokenNames; }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g"; }



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


        // $ANTLR start compilationUnit
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:218:1: compilationUnit : ( asCompilationUnit ) -> ^( COMPILATION_UNIT ( asCompilationUnit )? ) ;
        public final function compilationUnit():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var asCompilationUnit1:ParserRuleReturnScope = null;


            var stream_asCompilationUnit:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule asCompilationUnit");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:219:2: ( ( asCompilationUnit ) -> ^( COMPILATION_UNIT ( asCompilationUnit )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:219:4: ( asCompilationUnit )
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:219:4: ( asCompilationUnit )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:219:6: asCompilationUnit
                {
                pushFollow(FOLLOW_asCompilationUnit_in_compilationUnit386);
                asCompilationUnit1=asCompilationUnit();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_asCompilationUnit.add(asCompilationUnit1.tree);

                }



                // AST REWRITE
                // elements: asCompilationUnit
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 220:3: -> ^( COMPILATION_UNIT ( asCompilationUnit )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:220:6: ^( COMPILATION_UNIT ( asCompilationUnit )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(COMPILATION_UNIT, "COMPILATION_UNIT")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:220:26: ( asCompilationUnit )?
                    if ( stream_asCompilationUnit.hasNext ) {
                        adaptor.addChild(root_1, stream_asCompilationUnit.nextTree());

                    }
                    stream_asCompilationUnit.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end compilationUnit

        // $ANTLR start mxmlScriptUnit
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:225:1: mxmlScriptUnit : ( packageBlockEntry )* -> ^( MXML_SCRIPT_UNIT ( packageBlockEntry )* ) ;
        public final function mxmlScriptUnit():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var packageBlockEntry2:ParserRuleReturnScope = null;


            var stream_packageBlockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule packageBlockEntry");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:226:2: ( ( packageBlockEntry )* -> ^( MXML_SCRIPT_UNIT ( packageBlockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:226:4: ( packageBlockEntry )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:226:4: ( packageBlockEntry )*
                loop1:
                do {
                    var alt1:int=2;
                    var LA1_0:int = input.LA(1);

                    if ( ((LA1_0>=78 && LA1_0<=79)||LA1_0==81||LA1_0==87||(LA1_0>=89 && LA1_0<=91)||(LA1_0>=94 && LA1_0<=103)||(LA1_0>=106 && LA1_0<=111)||(LA1_0>=134 && LA1_0<=135)) ) {
                        alt1=1;
                    }


                    switch (alt1) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:226:4: packageBlockEntry
                	    {
                	    pushFollow(FOLLOW_packageBlockEntry_in_mxmlScriptUnit417);
                	    packageBlockEntry2=packageBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_packageBlockEntry.add(packageBlockEntry2.tree);

                	    }
                	    break;

                	default :
                	    break loop1;
                    }
                } while (true);



                // AST REWRITE
                // elements: packageBlockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 227:3: -> ^( MXML_SCRIPT_UNIT ( packageBlockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:227:6: ^( MXML_SCRIPT_UNIT ( packageBlockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(MXML_SCRIPT_UNIT, "MXML_SCRIPT_UNIT")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:227:26: ( packageBlockEntry )*
                    while ( stream_packageBlockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_packageBlockEntry.nextTree());

                    }
                    stream_packageBlockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end mxmlScriptUnit

        // $ANTLR start program
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:232:1: program : ( statement )* -> ^( PROGRAM_UNIT ( statement )* ) ;
        public final function program():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var statement3:ParserRuleReturnScope = null;


            var stream_statement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule statement");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:233:2: ( ( statement )* -> ^( PROGRAM_UNIT ( statement )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:233:4: ( statement )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:233:4: ( statement )*
                loop2:
                do {
                    var alt2:int=2;
                    var LA2_0:int = input.LA(1);

                    if ( (LA2_0==76||(LA2_0>=78 && LA2_0<=79)||LA2_0==81||LA2_0==83||(LA2_0>=87 && LA2_0<=91)||(LA2_0>=94 && LA2_0<=95)||LA2_0==97||(LA2_0>=101 && LA2_0<=102)||(LA2_0>=107 && LA2_0<=112)||(LA2_0>=114 && LA2_0<=115)||(LA2_0>=117 && LA2_0<=118)||LA2_0==121||(LA2_0>=124 && LA2_0<=131)||(LA2_0>=160 && LA2_0<=161)||(LA2_0>=164 && LA2_0<=169)||(LA2_0>=171 && LA2_0<=183)||LA2_0==185) ) {
                        alt2=1;
                    }


                    switch (alt2) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:233:4: statement
                	    {
                	    pushFollow(FOLLOW_statement_in_program445);
                	    statement3=statement();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_statement.add(statement3.tree);

                	    }
                	    break;

                	default :
                	    break loop2;
                    }
                } while (true);



                // AST REWRITE
                // elements: statement
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 234:3: -> ^( PROGRAM_UNIT ( statement )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:234:6: ^( PROGRAM_UNIT ( statement )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PROGRAM_UNIT, "PROGRAM_UNIT")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:234:22: ( statement )*
                    while ( stream_statement.hasNext ) {
                        adaptor.addChild(root_1, stream_statement.nextTree());

                    }
                    stream_statement.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end program

        // $ANTLR start asCompilationUnit
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:242:1: asCompilationUnit : packageDecl ( packageBlockEntry )* EOF ;
        public final function asCompilationUnit():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var EOF6:Token=null;
            var packageDecl4:ParserRuleReturnScope = null;

            var packageBlockEntry5:ParserRuleReturnScope = null;


            var EOF6_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:243:2: ( packageDecl ( packageBlockEntry )* EOF )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:243:4: packageDecl ( packageBlockEntry )* EOF
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_packageDecl_in_asCompilationUnit475);
                packageDecl4=packageDecl();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, packageDecl4.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:244:3: ( packageBlockEntry )*
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( ((LA3_0>=78 && LA3_0<=79)||LA3_0==81||LA3_0==87||(LA3_0>=89 && LA3_0<=91)||(LA3_0>=94 && LA3_0<=103)||(LA3_0>=106 && LA3_0<=111)||(LA3_0>=134 && LA3_0<=135)) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:244:3: packageBlockEntry
                	    {
                	    pushFollow(FOLLOW_packageBlockEntry_in_asCompilationUnit479);
                	    packageBlockEntry5=packageBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, packageBlockEntry5.tree);

                	    }
                	    break;

                	default :
                	    break loop3;
                    }
                } while (true);

                EOF6=Token(matchStream(input,EOF,FOLLOW_EOF_in_asCompilationUnit484)); if (this.state.failed) return retval;

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end asCompilationUnit

        // $ANTLR start packageDecl
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:249:1: packageDecl : PACKAGE ( type )? packageBlock ;
        public final function packageDecl():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var PACKAGE7:Token=null;
            var type8:ParserRuleReturnScope = null;

            var packageBlock9:ParserRuleReturnScope = null;


            var PACKAGE7_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:250:2: ( PACKAGE ( type )? packageBlock )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:250:4: PACKAGE ( type )? packageBlock
                {
                root_0 = LinkedListTree(adaptor.nil());

                PACKAGE7=Token(matchStream(input,PACKAGE,FOLLOW_PACKAGE_in_packageDecl497)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                PACKAGE7_tree = LinkedListTree(adaptor.create(PACKAGE7));
                root_0 = LinkedListTree(adaptor.becomeRoot(PACKAGE7_tree, root_0));
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:250:13: ( type )?
                var alt4:int=2;
                var LA4_0:int = input.LA(1);

                if ( (LA4_0==79||LA4_0==90||(LA4_0>=93 && LA4_0<=97)||(LA4_0>=101 && LA4_0<=102)||(LA4_0>=108 && LA4_0<=109)||LA4_0==115||LA4_0==124||LA4_0==131) ) {
                    alt4=1;
                }
                switch (alt4) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:250:13: type
                        {
                        pushFollow(FOLLOW_type_in_packageDecl500);
                        type8=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type8.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_packageBlock_in_packageDecl503);
                packageBlock9=packageBlock();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, packageBlock9.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end packageDecl

        // $ANTLR start packageBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:254:1: packageBlock : LBRACE ( packageBlockEntry )* RBRACE -> ^( BLOCK ( packageBlockEntry )* ) ;
        public final function packageBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE10:Token=null;
            var RBRACE12:Token=null;
            var packageBlockEntry11:ParserRuleReturnScope = null;


            var LBRACE10_tree:LinkedListTree=null;
            var RBRACE12_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_packageBlockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule packageBlockEntry");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:255:2: ( LBRACE ( packageBlockEntry )* RBRACE -> ^( BLOCK ( packageBlockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:255:4: LBRACE ( packageBlockEntry )* RBRACE
                {
                LBRACE10=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_packageBlock515)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE10);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:255:11: ( packageBlockEntry )*
                loop5:
                do {
                    var alt5:int=2;
                    var LA5_0:int = input.LA(1);

                    if ( ((LA5_0>=78 && LA5_0<=79)||LA5_0==81||LA5_0==87||(LA5_0>=89 && LA5_0<=91)||(LA5_0>=94 && LA5_0<=103)||(LA5_0>=106 && LA5_0<=111)||(LA5_0>=134 && LA5_0<=135)) ) {
                        alt5=1;
                    }


                    switch (alt5) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:255:11: packageBlockEntry
                	    {
                	    pushFollow(FOLLOW_packageBlockEntry_in_packageBlock517);
                	    packageBlockEntry11=packageBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_packageBlockEntry.add(packageBlockEntry11.tree);

                	    }
                	    break;

                	default :
                	    break loop5;
                    }
                } while (true);

                RBRACE12=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_packageBlock520)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE12);



                // AST REWRITE
                // elements: packageBlockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 256:3: -> ^( BLOCK ( packageBlockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:256:6: ^( BLOCK ( packageBlockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(BLOCK, "BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:256:15: ( packageBlockEntry )*
                    while ( stream_packageBlockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_packageBlockEntry.nextTree());

                    }
                    stream_packageBlockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end packageBlock

        // $ANTLR start packageBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:259:1: packageBlockEntry : (annos= annotations mods= modifiers ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] ) | SEMI ) ;
        public final function packageBlockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SEMI17:Token=null;
            var annos:ParserRuleReturnScope = null;

            var mods:ParserRuleReturnScope = null;

            var classDefinition13:ParserRuleReturnScope = null;

            var interfaceDefinition14:ParserRuleReturnScope = null;

            var variableDefinition15:ParserRuleReturnScope = null;

            var functionDefinition16:ParserRuleReturnScope = null;


            var SEMI17_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:260:2: ( (annos= annotations mods= modifiers ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] ) | SEMI ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:261:2: (annos= annotations mods= modifiers ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] ) | SEMI )
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:261:2: (annos= annotations mods= modifiers ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] ) | SEMI )
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( (LA7_0==79||LA7_0==81||LA7_0==87||(LA7_0>=89 && LA7_0<=91)||(LA7_0>=94 && LA7_0<=103)||(LA7_0>=106 && LA7_0<=111)||(LA7_0>=134 && LA7_0<=135)) ) {
                    alt7=1;
                }
                else if ( (LA7_0==78) ) {
                    alt7=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 7, 0, input);

                }
                switch (alt7) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:262:3: annos= annotations mods= modifiers ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] )
                        {
                        pushFollow(FOLLOW_annotations_in_packageBlockEntry551);
                        annos=annotations();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, annos.tree);
                        if ( this.state.backtracking==0 ) {
                           placeholder((annos!=null?LinkedListTree(annos.tree):null)); 
                        }
                        pushFollow(FOLLOW_modifiers_in_packageBlockEntry559);
                        mods=modifiers();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                           placeholder((mods!=null?LinkedListTree(mods.tree):null)); 
                        }
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:264:3: ( classDefinition[$mods.tree] | interfaceDefinition[$mods.tree] | variableDefinition[$mods.tree] | functionDefinition[$mods.tree] )
                        var alt6:int=4;
                        switch ( input.LA(1) ) {
                        case CLASS:
                            {
                            alt6=1;
                            }
                            break;
                        case INTERFACE:
                            {
                            alt6=2;
                            }
                            break;
                        case NAMESPACE:
                        case VAR:
                        case CONST:
                            {
                            alt6=3;
                            }
                            break;
                        case FUNCTION:
                            {
                            alt6=4;
                            }
                            break;
                        default:
                            if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                            throw new NoViableAltException("", 6, 0, input);

                        }

                        switch (alt6) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:264:5: classDefinition[$mods.tree]
                                {
                                pushFollow(FOLLOW_classDefinition_in_packageBlockEntry568);
                                classDefinition13=classDefinition((mods!=null?LinkedListTree(mods.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, classDefinition13.tree);

                                }
                                break;
                            case 2 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:265:5: interfaceDefinition[$mods.tree]
                                {
                                pushFollow(FOLLOW_interfaceDefinition_in_packageBlockEntry575);
                                interfaceDefinition14=interfaceDefinition((mods!=null?LinkedListTree(mods.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, interfaceDefinition14.tree);

                                }
                                break;
                            case 3 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:266:5: variableDefinition[$mods.tree]
                                {
                                pushFollow(FOLLOW_variableDefinition_in_packageBlockEntry582);
                                variableDefinition15=variableDefinition((mods!=null?LinkedListTree(mods.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, variableDefinition15.tree);

                                }
                                break;
                            case 4 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:267:5: functionDefinition[$mods.tree]
                                {
                                pushFollow(FOLLOW_functionDefinition_in_packageBlockEntry589);
                                functionDefinition16=functionDefinition((mods!=null?LinkedListTree(mods.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, functionDefinition16.tree);

                                }
                                break;

                        }


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:270:5: SEMI
                        {
                        SEMI17=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_packageBlockEntry601)); if (this.state.failed) return retval;

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end packageBlockEntry

        // $ANTLR start endOfFile
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:274:1: endOfFile : EOF ;
        public final function endOfFile():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var EOF18:Token=null;

            var EOF18_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:275:2: ( EOF )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:275:4: EOF
                {
                root_0 = LinkedListTree(adaptor.nil());

                EOF18=Token(matchStream(input,EOF,FOLLOW_EOF_in_endOfFile616)); if (this.state.failed) return retval;

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end endOfFile

        // $ANTLR start annotations
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:283:1: annotations : ( annotation )* -> ^( ANNOTATIONS ( annotation )* ) ;
        public final function annotations():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var annotation19:ParserRuleReturnScope = null;


            var stream_annotation:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule annotation");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:284:2: ( ( annotation )* -> ^( ANNOTATIONS ( annotation )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:284:4: ( annotation )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:284:4: ( annotation )*
                loop8:
                do {
                    var alt8:int=2;
                    switch ( input.LA(1) ) {
                    case IDENT:
                        {
                        var LA8_1:int = input.LA(2);

                        if ( (LA8_1==80) ) {
                            alt8=1;
                        }


                        }
                        break;
                    case USE:
                        {
                        var LA8_3:int = input.LA(2);

                        if ( (LA8_3==90) ) {
                            alt8=1;
                        }


                        }
                        break;
                    case LBRACK:
                    case INCLUDE:
                    case IMPORT:
                        {
                        alt8=1;
                        }
                        break;

                    }

                    switch (alt8) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:284:4: annotation
                	    {
                	    pushFollow(FOLLOW_annotation_in_annotations633);
                	    annotation19=annotation();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_annotation.add(annotation19.tree);

                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);



                // AST REWRITE
                // elements: annotation
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 285:3: -> ^( ANNOTATIONS ( annotation )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:285:6: ^( ANNOTATIONS ( annotation )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ANNOTATIONS, "ANNOTATIONS")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:285:21: ( annotation )*
                    while ( stream_annotation.hasNext ) {
                        adaptor.addChild(root_1, stream_annotation.nextTree());

                    }
                    stream_annotation.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end annotations

        // $ANTLR start annotation
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:295:1: annotation : ( configBlockDirective | metaDirective | includeDirective | importDirective | useNamespaceDirective );
        public final function annotation():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var configBlockDirective20:ParserRuleReturnScope = null;

            var metaDirective21:ParserRuleReturnScope = null;

            var includeDirective22:ParserRuleReturnScope = null;

            var importDirective23:ParserRuleReturnScope = null;

            var useNamespaceDirective24:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:296:2: ( configBlockDirective | metaDirective | includeDirective | importDirective | useNamespaceDirective )
                var alt9:int=5;
                switch ( input.LA(1) ) {
                case IDENT:
                    {
                    alt9=1;
                    }
                    break;
                case LBRACK:
                    {
                    alt9=2;
                    }
                    break;
                case INCLUDE:
                    {
                    alt9=3;
                    }
                    break;
                case IMPORT:
                    {
                    alt9=4;
                    }
                    break;
                case USE:
                    {
                    alt9=5;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 9, 0, input);

                }

                switch (alt9) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:296:5: configBlockDirective
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_configBlockDirective_in_annotation667);
                        configBlockDirective20=configBlockDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, configBlockDirective20.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:297:6: metaDirective
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_metaDirective_in_annotation674);
                        metaDirective21=metaDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, metaDirective21.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:298:5: includeDirective
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_includeDirective_in_annotation680);
                        includeDirective22=includeDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, includeDirective22.tree);

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:299:5: importDirective
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_importDirective_in_annotation687);
                        importDirective23=importDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, importDirective23.tree);

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:300:5: useNamespaceDirective
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_useNamespaceDirective_in_annotation694);
                        useNamespaceDirective24=useNamespaceDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, useNamespaceDirective24.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end annotation

        // $ANTLR start configIdent
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:318:1: configIdent : IDENT DBL_COLON IDENT ;
        public final function configIdent():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT25:Token=null;
            var DBL_COLON26:Token=null;
            var IDENT27:Token=null;

            var IDENT25_tree:LinkedListTree=null;
            var DBL_COLON26_tree:LinkedListTree=null;
            var IDENT27_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:319:2: ( IDENT DBL_COLON IDENT )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:319:4: IDENT DBL_COLON IDENT
                {
                root_0 = LinkedListTree(adaptor.nil());

                IDENT25=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_configIdent714)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IDENT25_tree = LinkedListTree(adaptor.create(IDENT25));
                adaptor.addChild(root_0, IDENT25_tree);
                }
                DBL_COLON26=Token(matchStream(input,DBL_COLON,FOLLOW_DBL_COLON_in_configIdent716)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                DBL_COLON26_tree = LinkedListTree(adaptor.create(DBL_COLON26));
                root_0 = LinkedListTree(adaptor.becomeRoot(DBL_COLON26_tree, root_0));
                }
                IDENT27=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_configIdent719)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IDENT27_tree = LinkedListTree(adaptor.create(IDENT27));
                adaptor.addChild(root_0, IDENT27_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end configIdent

        // $ANTLR start configBlockDirective
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:323:1: configBlockDirective : configIdent block -> ^( COMPILE_CONFIG configIdent block ) ;
        public final function configBlockDirective():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var configIdent28:ParserRuleReturnScope = null;

            var block29:ParserRuleReturnScope = null;


            var stream_block:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule block");
            var stream_configIdent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule configIdent");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:324:2: ( configIdent block -> ^( COMPILE_CONFIG configIdent block ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:325:3: configIdent block
                {
                pushFollow(FOLLOW_configIdent_in_configBlockDirective733);
                configIdent28=configIdent();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_configIdent.add(configIdent28.tree);
                pushFollow(FOLLOW_block_in_configBlockDirective735);
                block29=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_block.add(block29.tree);


                // AST REWRITE
                // elements: block, configIdent
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 326:3: -> ^( COMPILE_CONFIG configIdent block )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:326:6: ^( COMPILE_CONFIG configIdent block )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(COMPILE_CONFIG, "COMPILE_CONFIG")), root_1));

                    adaptor.addChild(root_1, stream_configIdent.nextTree());
                    adaptor.addChild(root_1, stream_block.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end configBlockDirective

        // $ANTLR start metaDirective
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:329:1: metaDirective : LBRACK ident ( metaDirectiveList )? RBRACK ( SEMI )? -> ^( METATAG ident ( metaDirectiveList )? ) ;
        public final function metaDirective():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACK30:Token=null;
            var RBRACK33:Token=null;
            var SEMI34:Token=null;
            var ident31:ParserRuleReturnScope = null;

            var metaDirectiveList32:ParserRuleReturnScope = null;


            var LBRACK30_tree:LinkedListTree=null;
            var RBRACK33_tree:LinkedListTree=null;
            var SEMI34_tree:LinkedListTree=null;
            var stream_RBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACK");
            var stream_LBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACK");
            var stream_SEMI:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token SEMI");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_metaDirectiveList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule metaDirectiveList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:2: ( LBRACK ident ( metaDirectiveList )? RBRACK ( SEMI )? -> ^( METATAG ident ( metaDirectiveList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:4: LBRACK ident ( metaDirectiveList )? RBRACK ( SEMI )?
                {
                LBRACK30=Token(matchStream(input,LBRACK,FOLLOW_LBRACK_in_metaDirective760)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACK.add(LBRACK30);

                pushFollow(FOLLOW_ident_in_metaDirective762);
                ident31=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident31.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:17: ( metaDirectiveList )?
                var alt10:int=2;
                var LA10_0:int = input.LA(1);

                if ( (LA10_0==83) ) {
                    alt10=1;
                }
                switch (alt10) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:17: metaDirectiveList
                        {
                        pushFollow(FOLLOW_metaDirectiveList_in_metaDirective764);
                        metaDirectiveList32=metaDirectiveList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_metaDirectiveList.add(metaDirectiveList32.tree);

                        }
                        break;

                }

                RBRACK33=Token(matchStream(input,RBRACK,FOLLOW_RBRACK_in_metaDirective767)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACK.add(RBRACK33);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:43: ( SEMI )?
                var alt11:int=2;
                var LA11_0:int = input.LA(1);

                if ( (LA11_0==78) ) {
                    alt11=1;
                }
                switch (alt11) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:330:43: SEMI
                        {
                        SEMI34=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_metaDirective769)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_SEMI.add(SEMI34);


                        }
                        break;

                }



                // AST REWRITE
                // elements: metaDirectiveList, ident
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 331:3: -> ^( METATAG ident ( metaDirectiveList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:331:6: ^( METATAG ident ( metaDirectiveList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(METATAG, "METATAG")), root_1));

                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:331:23: ( metaDirectiveList )?
                    if ( stream_metaDirectiveList.hasNext ) {
                        adaptor.addChild(root_1, stream_metaDirectiveList.nextTree());

                    }
                    stream_metaDirectiveList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end metaDirective

        // $ANTLR start metaDirectiveList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:335:1: metaDirectiveList : LPAREN ( metaTagParam ( COMMA metaTagParam )* )? RPAREN -> ^( METATAG_PARAMS ( metaTagParam )* ) ;
        public final function metaDirectiveList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN35:Token=null;
            var COMMA37:Token=null;
            var RPAREN39:Token=null;
            var metaTagParam36:ParserRuleReturnScope = null;

            var metaTagParam38:ParserRuleReturnScope = null;


            var LPAREN35_tree:LinkedListTree=null;
            var COMMA37_tree:LinkedListTree=null;
            var RPAREN39_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_COMMA:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COMMA");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_metaTagParam:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule metaTagParam");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:336:2: ( LPAREN ( metaTagParam ( COMMA metaTagParam )* )? RPAREN -> ^( METATAG_PARAMS ( metaTagParam )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:337:3: LPAREN ( metaTagParam ( COMMA metaTagParam )* )? RPAREN
                {
                LPAREN35=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_metaDirectiveList799)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN35);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:337:10: ( metaTagParam ( COMMA metaTagParam )* )?
                var alt13:int=2;
                var LA13_0:int = input.LA(1);

                if ( (LA13_0==79||(LA13_0>=88 && LA13_0<=90)||(LA13_0>=93 && LA13_0<=97)||(LA13_0>=101 && LA13_0<=102)||(LA13_0>=108 && LA13_0<=109)||LA13_0==115||LA13_0==124||LA13_0==131||(LA13_0>=134 && LA13_0<=135)||(LA13_0>=175 && LA13_0<=183)) ) {
                    alt13=1;
                }
                switch (alt13) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:337:12: metaTagParam ( COMMA metaTagParam )*
                        {
                        pushFollow(FOLLOW_metaTagParam_in_metaDirectiveList803);
                        metaTagParam36=metaTagParam();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_metaTagParam.add(metaTagParam36.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:337:25: ( COMMA metaTagParam )*
                        loop12:
                        do {
                            var alt12:int=2;
                            var LA12_0:int = input.LA(1);

                            if ( (LA12_0==84) ) {
                                alt12=1;
                            }


                            switch (alt12) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:337:27: COMMA metaTagParam
                        	    {
                        	    COMMA37=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_metaDirectiveList807)); if (this.state.failed) return retval; 
                        	    if ( this.state.backtracking==0 ) stream_COMMA.add(COMMA37);

                        	    pushFollow(FOLLOW_metaTagParam_in_metaDirectiveList809);
                        	    metaTagParam38=metaTagParam();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) stream_metaTagParam.add(metaTagParam38.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop12;
                            }
                        } while (true);


                        }
                        break;

                }

                RPAREN39=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_metaDirectiveList817)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN39);



                // AST REWRITE
                // elements: metaTagParam
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 338:3: -> ^( METATAG_PARAMS ( metaTagParam )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:338:6: ^( METATAG_PARAMS ( metaTagParam )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(METATAG_PARAMS, "METATAG_PARAMS")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:338:24: ( metaTagParam )*
                    while ( stream_metaTagParam.hasNext ) {
                        adaptor.addChild(root_1, stream_metaTagParam.nextTree());

                    }
                    stream_metaTagParam.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end metaDirectiveList

        // $ANTLR start metaTagParam
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:343:1: metaTagParam : ( ident ASSIGN constant -> ^( ASSIGN ident constant ) | constant -> constant | ( ident DOT )=> type -> type | ident ASSIGN ( ident DOT )=> type -> ^( ASSIGN ident type ) | ident -> ident );
        public final function metaTagParam():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ASSIGN41:Token=null;
            var ASSIGN46:Token=null;
            var ident40:ParserRuleReturnScope = null;

            var constant42:ParserRuleReturnScope = null;

            var constant43:ParserRuleReturnScope = null;

            var type44:ParserRuleReturnScope = null;

            var ident45:ParserRuleReturnScope = null;

            var type47:ParserRuleReturnScope = null;

            var ident48:ParserRuleReturnScope = null;


            var ASSIGN41_tree:LinkedListTree=null;
            var ASSIGN46_tree:LinkedListTree=null;
            var stream_ASSIGN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ASSIGN");
            var stream_constant:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule constant");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_type:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule type");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:344:2: ( ident ASSIGN constant -> ^( ASSIGN ident constant ) | constant -> constant | ( ident DOT )=> type -> type | ident ASSIGN ( ident DOT )=> type -> ^( ASSIGN ident type ) | ident -> ident )
                var alt14:int=5;
                alt14 = dfa14.predict(input);
                switch (alt14) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:345:3: ident ASSIGN constant
                        {
                        pushFollow(FOLLOW_ident_in_metaTagParam845);
                        ident40=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_ident.add(ident40.tree);
                        ASSIGN41=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_metaTagParam847)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(ASSIGN41);

                        pushFollow(FOLLOW_constant_in_metaTagParam849);
                        constant42=constant();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_constant.add(constant42.tree);


                        // AST REWRITE
                        // elements: constant, ASSIGN, ident
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 345:25: -> ^( ASSIGN ident constant )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:345:28: ^( ASSIGN ident constant )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_ASSIGN.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_ident.nextTree());
                            adaptor.addChild(root_1, stream_constant.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:346:4: constant
                        {
                        pushFollow(FOLLOW_constant_in_metaTagParam864);
                        constant43=constant();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_constant.add(constant43.tree);


                        // AST REWRITE
                        // elements: constant
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 346:13: -> constant
                        {
                            adaptor.addChild(root_0, stream_constant.nextTree());

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:347:5: ( ident DOT )=> type
                        {
                        pushFollow(FOLLOW_type_in_metaTagParam881);
                        type44=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_type.add(type44.tree);


                        // AST REWRITE
                        // elements: type
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 347:24: -> type
                        {
                            adaptor.addChild(root_0, stream_type.nextTree());

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:348:4: ident ASSIGN ( ident DOT )=> type
                        {
                        pushFollow(FOLLOW_ident_in_metaTagParam890);
                        ident45=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_ident.add(ident45.tree);
                        ASSIGN46=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_metaTagParam892)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(ASSIGN46);

                        pushFollow(FOLLOW_type_in_metaTagParam901);
                        type47=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_type.add(type47.tree);


                        // AST REWRITE
                        // elements: ident, type, ASSIGN
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 348:36: -> ^( ASSIGN ident type )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:348:39: ^( ASSIGN ident type )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_ASSIGN.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_ident.nextTree());
                            adaptor.addChild(root_1, stream_type.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:349:4: ident
                        {
                        pushFollow(FOLLOW_ident_in_metaTagParam916);
                        ident48=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_ident.add(ident48.tree);


                        // AST REWRITE
                        // elements: ident
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 349:10: -> ident
                        {
                            adaptor.addChild(root_0, stream_ident.nextTree());

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end metaTagParam

        // $ANTLR start includeDirective
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:353:1: includeDirective : INCLUDE STRING_LITERAL semi ;
        public final function includeDirective():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var INCLUDE49:Token=null;
            var STRING_LITERAL50:Token=null;
            var semi51:ParserRuleReturnScope = null;


            var INCLUDE49_tree:LinkedListTree=null;
            var STRING_LITERAL50_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:354:2: ( INCLUDE STRING_LITERAL semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:354:4: INCLUDE STRING_LITERAL semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                INCLUDE49=Token(matchStream(input,INCLUDE,FOLLOW_INCLUDE_in_includeDirective932)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                INCLUDE49_tree = LinkedListTree(adaptor.create(INCLUDE49));
                root_0 = LinkedListTree(adaptor.becomeRoot(INCLUDE49_tree, root_0));
                }
                STRING_LITERAL50=Token(matchStream(input,STRING_LITERAL,FOLLOW_STRING_LITERAL_in_includeDirective935)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                STRING_LITERAL50_tree = LinkedListTree(adaptor.create(STRING_LITERAL50));
                adaptor.addChild(root_0, STRING_LITERAL50_tree);
                }
                pushFollow(FOLLOW_semi_in_includeDirective937);
                semi51=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi51.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end includeDirective

        // $ANTLR start useNamespaceDirective
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:358:1: useNamespaceDirective : USE NAMESPACE ident semi ;
        public final function useNamespaceDirective():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var USE52:Token=null;
            var NAMESPACE53:Token=null;
            var ident54:ParserRuleReturnScope = null;

            var semi55:ParserRuleReturnScope = null;


            var USE52_tree:LinkedListTree=null;
            var NAMESPACE53_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:359:2: ( USE NAMESPACE ident semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:359:4: USE NAMESPACE ident semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                USE52=Token(matchStream(input,USE,FOLLOW_USE_in_useNamespaceDirective949)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                USE52_tree = LinkedListTree(adaptor.create(USE52));
                root_0 = LinkedListTree(adaptor.becomeRoot(USE52_tree, root_0));
                }
                NAMESPACE53=Token(matchStream(input,NAMESPACE,FOLLOW_NAMESPACE_in_useNamespaceDirective952)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                NAMESPACE53_tree = LinkedListTree(adaptor.create(NAMESPACE53));
                adaptor.addChild(root_0, NAMESPACE53_tree);
                }
                pushFollow(FOLLOW_ident_in_useNamespaceDirective954);
                ident54=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, ident54.tree);
                pushFollow(FOLLOW_semi_in_useNamespaceDirective956);
                semi55=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi55.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end useNamespaceDirective

        // $ANTLR start importDirective
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:363:1: importDirective : IMPORT type ( DOT STAR )? semi ;
        public final function importDirective():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IMPORT56:Token=null;
            var DOT58:Token=null;
            var STAR59:Token=null;
            var type57:ParserRuleReturnScope = null;

            var semi60:ParserRuleReturnScope = null;


            var IMPORT56_tree:LinkedListTree=null;
            var DOT58_tree:LinkedListTree=null;
            var STAR59_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:364:2: ( IMPORT type ( DOT STAR )? semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:364:4: IMPORT type ( DOT STAR )? semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                IMPORT56=Token(matchStream(input,IMPORT,FOLLOW_IMPORT_in_importDirective968)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IMPORT56_tree = LinkedListTree(adaptor.create(IMPORT56));
                root_0 = LinkedListTree(adaptor.becomeRoot(IMPORT56_tree, root_0));
                }
                pushFollow(FOLLOW_type_in_importDirective971);
                type57=type();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type57.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:364:17: ( DOT STAR )?
                var alt15:int=2;
                var LA15_0:int = input.LA(1);

                if ( (LA15_0==92) ) {
                    alt15=1;
                }
                switch (alt15) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:364:19: DOT STAR
                        {
                        DOT58=Token(matchStream(input,DOT,FOLLOW_DOT_in_importDirective975)); if (this.state.failed) return retval;
                        STAR59=Token(matchStream(input,STAR,FOLLOW_STAR_in_importDirective978)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        STAR59_tree = LinkedListTree(adaptor.create(STAR59));
                        adaptor.addChild(root_0, STAR59_tree);
                        }

                        }
                        break;

                }

                pushFollow(FOLLOW_semi_in_importDirective983);
                semi60=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi60.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end importDirective

        // $ANTLR start modifiers
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:372:1: modifiers : ( modifier )* -> ^( MODIFIERS ( modifier )* ) ;
        public final function modifiers():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var modifier61:ParserRuleReturnScope = null;


            var stream_modifier:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule modifier");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:373:2: ( ( modifier )* -> ^( MODIFIERS ( modifier )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:373:4: ( modifier )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:373:4: ( modifier )*
                loop16:
                do {
                    var alt16:int=2;
                    switch ( input.LA(1) ) {
                    case IDENT:
                        {
                        var LA16_2:int = input.LA(2);

                        if ( (LA16_2==79||(LA16_2>=89 && LA16_2<=90)||(LA16_2>=94 && LA16_2<=103)||(LA16_2>=106 && LA16_2<=111)||(LA16_2>=134 && LA16_2<=135)) ) {
                            alt16=1;
                        }


                        }
                        break;
                    case DYNAMIC:
                        {
                        var LA16_3:int = input.LA(2);

                        if ( (LA16_3==79||(LA16_3>=89 && LA16_3<=90)||(LA16_3>=94 && LA16_3<=103)||(LA16_3>=106 && LA16_3<=111)||(LA16_3>=134 && LA16_3<=135)) ) {
                            alt16=1;
                        }


                        }
                        break;
                    case FINAL:
                    case INTERNAL:
                    case OVERRIDE:
                    case PRIVATE:
                    case PROTECTED:
                    case PUBLIC:
                    case STATIC:
                    case NATIVE:
                        {
                        alt16=1;
                        }
                        break;

                    }

                    switch (alt16) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:373:4: modifier
                	    {
                	    pushFollow(FOLLOW_modifier_in_modifiers999);
                	    modifier61=modifier();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_modifier.add(modifier61.tree);

                	    }
                	    break;

                	default :
                	    break loop16;
                    }
                } while (true);



                // AST REWRITE
                // elements: modifier
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 374:3: -> ^( MODIFIERS ( modifier )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:374:6: ^( MODIFIERS ( modifier )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(MODIFIERS, "MODIFIERS")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:374:19: ( modifier )*
                    while ( stream_modifier.hasNext ) {
                        adaptor.addChild(root_1, stream_modifier.nextTree());

                    }
                    stream_modifier.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end modifiers

        // $ANTLR start modifier
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:377:1: modifier : ( DYNAMIC | FINAL | INTERNAL | OVERRIDE | PRIVATE | PROTECTED | PUBLIC | STATIC | NATIVE | IDENT );
        public final function modifier():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set62:Token=null;

            var set62_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:378:2: ( DYNAMIC | FINAL | INTERNAL | OVERRIDE | PRIVATE | PROTECTED | PUBLIC | STATIC | NATIVE | IDENT )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set62=Token(input.LT(1));
                if ( input.LA(1)==79||(input.LA(1)>=94 && input.LA(1)<=102) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set62)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end modifier

        // $ANTLR start semi
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:394:1: semi : ( SEMI | EOF | RBRACE );
        public final function semi():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SEMI63:Token=null;
            var EOF64:Token=null;
            var RBRACE65:Token=null;

            var SEMI63_tree:LinkedListTree=null;
            var EOF64_tree:LinkedListTree=null;
            var RBRACE65_tree:LinkedListTree=null;


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

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:419:2: ( SEMI | EOF | RBRACE )
                var alt17:int=3;
                switch ( input.LA(1) ) {
                case SEMI:
                    {
                    alt17=1;
                    }
                    break;
                case EOF:
                    {
                    alt17=2;
                    }
                    break;
                case RBRACE:
                    {
                    alt17=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 17, 0, input);

                }

                switch (alt17) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:419:4: SEMI
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        SEMI63=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_semi1091)); if (this.state.failed) return retval;

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:420:4: EOF
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        EOF64=Token(matchStream(input,EOF,FOLLOW_EOF_in_semi1097)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        EOF64_tree = LinkedListTree(adaptor.create(EOF64));
                        adaptor.addChild(root_0, EOF64_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:421:4: RBRACE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        RBRACE65=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_semi1103)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        RBRACE65_tree = LinkedListTree(adaptor.create(RBRACE65));
                        adaptor.addChild(root_0, RBRACE65_tree);
                        }
                        if ( this.state.backtracking==0 ) {

                          			input.rewindTo(marker); 
                          			
                          			if (onBrace)
                          			{
                          				retval.start=input.LT(-1);
                          				retval.stop=retval.start;
                          				retval.tree=null;
                          				return retval;
                          			}
                          		
                        }

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end semi

        // $ANTLR start classDefinition
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:440:1: classDefinition[LinkedListTree mods] : CLASS ident classExtendsClause classImplementsClause classTypeBlock -> ^( CLASS_DEF ident ( classExtendsClause )? ( classImplementsClause )? classTypeBlock ) ;
        public final function classDefinition(mods:LinkedListTree):ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var CLASS66:Token=null;
            var ident67:ParserRuleReturnScope = null;

            var classExtendsClause68:ParserRuleReturnScope = null;

            var classImplementsClause69:ParserRuleReturnScope = null;

            var classTypeBlock70:ParserRuleReturnScope = null;


            var CLASS66_tree:LinkedListTree=null;
            var stream_CLASS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token CLASS");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_classExtendsClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule classExtendsClause");
            var stream_classTypeBlock:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule classTypeBlock");
            var stream_classImplementsClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule classImplementsClause");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:441:2: ( CLASS ident classExtendsClause classImplementsClause classTypeBlock -> ^( CLASS_DEF ident ( classExtendsClause )? ( classImplementsClause )? classTypeBlock ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:441:4: CLASS ident classExtendsClause classImplementsClause classTypeBlock
                {
                if ( this.state.backtracking==0 ) {
                   retval.start = mods.getStartToken(); 
                }
                CLASS66=Token(matchStream(input,CLASS,FOLLOW_CLASS_in_classDefinition1129)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_CLASS.add(CLASS66);

                pushFollow(FOLLOW_ident_in_classDefinition1131);
                ident67=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident67.tree);
                pushFollow(FOLLOW_classExtendsClause_in_classDefinition1135);
                classExtendsClause68=classExtendsClause();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_classExtendsClause.add(classExtendsClause68.tree);
                pushFollow(FOLLOW_classImplementsClause_in_classDefinition1139);
                classImplementsClause69=classImplementsClause();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_classImplementsClause.add(classImplementsClause69.tree);
                pushFollow(FOLLOW_classTypeBlock_in_classDefinition1143);
                classTypeBlock70=classTypeBlock();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_classTypeBlock.add(classTypeBlock70.tree);


                // AST REWRITE
                // elements: classImplementsClause, classExtendsClause, classTypeBlock, ident
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 446:3: -> ^( CLASS_DEF ident ( classExtendsClause )? ( classImplementsClause )? classTypeBlock )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:446:6: ^( CLASS_DEF ident ( classExtendsClause )? ( classImplementsClause )? classTypeBlock )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(CLASS_DEF, "CLASS_DEF")), root_1));

                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:446:33: ( classExtendsClause )?
                    if ( stream_classExtendsClause.hasNext ) {
                        adaptor.addChild(root_1, stream_classExtendsClause.nextTree());

                    }
                    stream_classExtendsClause.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:446:53: ( classImplementsClause )?
                    if ( stream_classImplementsClause.hasNext ) {
                        adaptor.addChild(root_1, stream_classImplementsClause.nextTree());

                    }
                    stream_classImplementsClause.reset();
                    adaptor.addChild(root_1, stream_classTypeBlock.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classDefinition

        // $ANTLR start classExtendsClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:449:1: classExtendsClause : ( EXTENDS type )? ;
        public final function classExtendsClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var EXTENDS71:Token=null;
            var type72:ParserRuleReturnScope = null;


            var EXTENDS71_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:450:2: ( ( EXTENDS type )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:450:4: ( EXTENDS type )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:450:4: ( EXTENDS type )?
                var alt18:int=2;
                var LA18_0:int = input.LA(1);

                if ( (LA18_0==104) ) {
                    alt18=1;
                }
                switch (alt18) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:450:6: EXTENDS type
                        {
                        EXTENDS71=Token(matchStream(input,EXTENDS,FOLLOW_EXTENDS_in_classExtendsClause1178)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        EXTENDS71_tree = LinkedListTree(adaptor.create(EXTENDS71));
                        root_0 = LinkedListTree(adaptor.becomeRoot(EXTENDS71_tree, root_0));
                        }
                        pushFollow(FOLLOW_type_in_classExtendsClause1181);
                        type72=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type72.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classExtendsClause

        // $ANTLR start classImplementsClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:453:1: classImplementsClause : ( IMPLEMENTS type ( COMMA type )* )? ;
        public final function classImplementsClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IMPLEMENTS73:Token=null;
            var COMMA75:Token=null;
            var type74:ParserRuleReturnScope = null;

            var type76:ParserRuleReturnScope = null;


            var IMPLEMENTS73_tree:LinkedListTree=null;
            var COMMA75_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:2: ( ( IMPLEMENTS type ( COMMA type )* )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:4: ( IMPLEMENTS type ( COMMA type )* )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:4: ( IMPLEMENTS type ( COMMA type )* )?
                var alt20:int=2;
                var LA20_0:int = input.LA(1);

                if ( (LA20_0==105) ) {
                    alt20=1;
                }
                switch (alt20) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:6: IMPLEMENTS type ( COMMA type )*
                        {
                        IMPLEMENTS73=Token(matchStream(input,IMPLEMENTS,FOLLOW_IMPLEMENTS_in_classImplementsClause1197)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        IMPLEMENTS73_tree = LinkedListTree(adaptor.create(IMPLEMENTS73));
                        root_0 = LinkedListTree(adaptor.becomeRoot(IMPLEMENTS73_tree, root_0));
                        }
                        pushFollow(FOLLOW_type_in_classImplementsClause1200);
                        type74=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type74.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:23: ( COMMA type )*
                        loop19:
                        do {
                            var alt19:int=2;
                            var LA19_0:int = input.LA(1);

                            if ( (LA19_0==84) ) {
                                alt19=1;
                            }


                            switch (alt19) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:454:25: COMMA type
                        	    {
                        	    COMMA75=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_classImplementsClause1204)); if (this.state.failed) return retval;
                        	    pushFollow(FOLLOW_type_in_classImplementsClause1207);
                        	    type76=type();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type76.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop19;
                            }
                        } while (true);


                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classImplementsClause

        // $ANTLR start interfaceDefinition
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:462:1: interfaceDefinition[LinkedListTree mods] : INTERFACE ident interfaceExtendsClause interfaceTypeBlock -> ^( INTERFACE_DEF ident ( interfaceExtendsClause )? interfaceTypeBlock ) ;
        public final function interfaceDefinition(mods:LinkedListTree):ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var INTERFACE77:Token=null;
            var ident78:ParserRuleReturnScope = null;

            var interfaceExtendsClause79:ParserRuleReturnScope = null;

            var interfaceTypeBlock80:ParserRuleReturnScope = null;


            var INTERFACE77_tree:LinkedListTree=null;
            var stream_INTERFACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token INTERFACE");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_interfaceExtendsClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule interfaceExtendsClause");
            var stream_interfaceTypeBlock:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule interfaceTypeBlock");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:463:2: ( INTERFACE ident interfaceExtendsClause interfaceTypeBlock -> ^( INTERFACE_DEF ident ( interfaceExtendsClause )? interfaceTypeBlock ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:463:4: INTERFACE ident interfaceExtendsClause interfaceTypeBlock
                {
                if ( this.state.backtracking==0 ) {
                   retval.start = mods.getStartToken(); 
                }
                INTERFACE77=Token(matchStream(input,INTERFACE,FOLLOW_INTERFACE_in_interfaceDefinition1234)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_INTERFACE.add(INTERFACE77);

                pushFollow(FOLLOW_ident_in_interfaceDefinition1236);
                ident78=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident78.tree);
                pushFollow(FOLLOW_interfaceExtendsClause_in_interfaceDefinition1240);
                interfaceExtendsClause79=interfaceExtendsClause();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_interfaceExtendsClause.add(interfaceExtendsClause79.tree);
                pushFollow(FOLLOW_interfaceTypeBlock_in_interfaceDefinition1244);
                interfaceTypeBlock80=interfaceTypeBlock();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_interfaceTypeBlock.add(interfaceTypeBlock80.tree);


                // AST REWRITE
                // elements: ident, interfaceTypeBlock, interfaceExtendsClause
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 467:3: -> ^( INTERFACE_DEF ident ( interfaceExtendsClause )? interfaceTypeBlock )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:467:6: ^( INTERFACE_DEF ident ( interfaceExtendsClause )? interfaceTypeBlock )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(INTERFACE_DEF, "INTERFACE_DEF")), root_1));

                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:467:37: ( interfaceExtendsClause )?
                    if ( stream_interfaceExtendsClause.hasNext ) {
                        adaptor.addChild(root_1, stream_interfaceExtendsClause.nextTree());

                    }
                    stream_interfaceExtendsClause.reset();
                    adaptor.addChild(root_1, stream_interfaceTypeBlock.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end interfaceDefinition

        // $ANTLR start interfaceExtendsClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:470:1: interfaceExtendsClause : ( EXTENDS type ( COMMA type )* )? ;
        public final function interfaceExtendsClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var EXTENDS81:Token=null;
            var COMMA83:Token=null;
            var type82:ParserRuleReturnScope = null;

            var type84:ParserRuleReturnScope = null;


            var EXTENDS81_tree:LinkedListTree=null;
            var COMMA83_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:2: ( ( EXTENDS type ( COMMA type )* )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:4: ( EXTENDS type ( COMMA type )* )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:4: ( EXTENDS type ( COMMA type )* )?
                var alt22:int=2;
                var LA22_0:int = input.LA(1);

                if ( (LA22_0==104) ) {
                    alt22=1;
                }
                switch (alt22) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:6: EXTENDS type ( COMMA type )*
                        {
                        EXTENDS81=Token(matchStream(input,EXTENDS,FOLLOW_EXTENDS_in_interfaceExtendsClause1276)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        EXTENDS81_tree = LinkedListTree(adaptor.create(EXTENDS81));
                        root_0 = LinkedListTree(adaptor.becomeRoot(EXTENDS81_tree, root_0));
                        }
                        pushFollow(FOLLOW_type_in_interfaceExtendsClause1279);
                        type82=type();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type82.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:20: ( COMMA type )*
                        loop21:
                        do {
                            var alt21:int=2;
                            var LA21_0:int = input.LA(1);

                            if ( (LA21_0==84) ) {
                                alt21=1;
                            }


                            switch (alt21) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:471:22: COMMA type
                        	    {
                        	    COMMA83=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_interfaceExtendsClause1283)); if (this.state.failed) return retval;
                        	    pushFollow(FOLLOW_type_in_interfaceExtendsClause1286);
                        	    type84=type();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, type84.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop21;
                            }
                        } while (true);


                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end interfaceExtendsClause

        // $ANTLR start functionDefinition
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:478:1: functionDefinition[LinkedListTree mods] : FUNCTION ident parameterDeclarationList ( typeExpression )? block -> ^( FUNCTION_DEF ident parameterDeclarationList ( typeExpression )? ( block )? ) ;
        public final function functionDefinition(mods:LinkedListTree):ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var FUNCTION85:Token=null;
            var ident86:ParserRuleReturnScope = null;

            var parameterDeclarationList87:ParserRuleReturnScope = null;

            var typeExpression88:ParserRuleReturnScope = null;

            var block89:ParserRuleReturnScope = null;


            var FUNCTION85_tree:LinkedListTree=null;
            var stream_FUNCTION:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FUNCTION");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_block:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule block");
            var stream_parameterDeclarationList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule parameterDeclarationList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:479:2: ( FUNCTION ident parameterDeclarationList ( typeExpression )? block -> ^( FUNCTION_DEF ident parameterDeclarationList ( typeExpression )? ( block )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:479:4: FUNCTION ident parameterDeclarationList ( typeExpression )? block
                {
                if ( this.state.backtracking==0 ) {
                   retval.start = mods.getStartToken(); 
                }
                FUNCTION85=Token(matchStream(input,FUNCTION,FOLLOW_FUNCTION_in_functionDefinition1311)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FUNCTION.add(FUNCTION85);

                pushFollow(FOLLOW_ident_in_functionDefinition1315);
                ident86=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident86.tree);
                pushFollow(FOLLOW_parameterDeclarationList_in_functionDefinition1319);
                parameterDeclarationList87=parameterDeclarationList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_parameterDeclarationList.add(parameterDeclarationList87.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:483:3: ( typeExpression )?
                var alt23:int=2;
                var LA23_0:int = input.LA(1);

                if ( (LA23_0==123) ) {
                    alt23=1;
                }
                switch (alt23) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:483:3: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_functionDefinition1323);
                        typeExpression88=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression88.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_block_in_functionDefinition1328);
                block89=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_block.add(block89.tree);


                // AST REWRITE
                // elements: ident, block, parameterDeclarationList, typeExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 485:3: -> ^( FUNCTION_DEF ident parameterDeclarationList ( typeExpression )? ( block )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:485:6: ^( FUNCTION_DEF ident parameterDeclarationList ( typeExpression )? ( block )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FUNCTION_DEF, "FUNCTION_DEF")), root_1));

                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    adaptor.addChild(root_1, stream_parameterDeclarationList.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:488:5: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:489:5: ( block )?
                    if ( stream_block.hasNext ) {
                        adaptor.addChild(root_1, stream_block.nextTree());

                    }
                    stream_block.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end functionDefinition

        // $ANTLR start variableDefinition
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:498:1: variableDefinition[LinkedListTree mods] : vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi -> ^( VARIABLE_DEF $vm ( variableDeclarator )+ ) ;
        public final function variableDefinition(mods:LinkedListTree):ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA91:Token=null;
            var vm:ParserRuleReturnScope = null;

            var variableDeclarator90:ParserRuleReturnScope = null;

            var variableDeclarator92:ParserRuleReturnScope = null;

            var semi93:ParserRuleReturnScope = null;


            var COMMA91_tree:LinkedListTree=null;
            var stream_COMMA:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COMMA");
            var stream_variableDeclarator:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule variableDeclarator");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");
            var stream_variableModifier:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule variableModifier");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:503:2: (vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi -> ^( VARIABLE_DEF $vm ( variableDeclarator )+ ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:503:4: vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi
                {
                pushFollow(FOLLOW_variableModifier_in_variableDefinition1424);
                vm=variableModifier();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_variableModifier.add(vm.tree);
                pushFollow(FOLLOW_variableDeclarator_in_variableDefinition1426);
                variableDeclarator90=variableDeclarator();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_variableDeclarator.add(variableDeclarator90.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:503:43: ( COMMA variableDeclarator )*
                loop24:
                do {
                    var alt24:int=2;
                    var LA24_0:int = input.LA(1);

                    if ( (LA24_0==84) ) {
                        alt24=1;
                    }


                    switch (alt24) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:503:45: COMMA variableDeclarator
                	    {
                	    COMMA91=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_variableDefinition1430)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_COMMA.add(COMMA91);

                	    pushFollow(FOLLOW_variableDeclarator_in_variableDefinition1432);
                	    variableDeclarator92=variableDeclarator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_variableDeclarator.add(variableDeclarator92.tree);

                	    }
                	    break;

                	default :
                	    break loop24;
                    }
                } while (true);

                pushFollow(FOLLOW_semi_in_variableDefinition1437);
                semi93=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi93.tree);


                // AST REWRITE
                // elements: vm, variableDeclarator
                // token labels: 
                // rule labels: vm, retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_vm:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule vm",vm!=null?vm.tree:null);
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 504:3: -> ^( VARIABLE_DEF $vm ( variableDeclarator )+ )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:504:6: ^( VARIABLE_DEF $vm ( variableDeclarator )+ )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(VARIABLE_DEF, "VARIABLE_DEF")), root_1));

                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_vm.nextTree());
                    if ( !(stream_variableDeclarator.hasNext) ) {
                        throw new RewriteEarlyExitException();
                    }
                    while ( stream_variableDeclarator.hasNext ) {
                        adaptor.addChild(root_1, stream_variableDeclarator.nextTree());

                    }
                    stream_variableDeclarator.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end variableDefinition

        // $ANTLR start classTypeBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:511:1: classTypeBlock : LBRACE ( classTypeBlockEntry )* RBRACE -> ^( TYPE_BLOCK ( classTypeBlockEntry )* ) ;
        public final function classTypeBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE94:Token=null;
            var RBRACE96:Token=null;
            var classTypeBlockEntry95:ParserRuleReturnScope = null;


            var LBRACE94_tree:LinkedListTree=null;
            var RBRACE96_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_classTypeBlockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule classTypeBlockEntry");

            	if (packageBlockParse)
            	{
            		retval.tree = LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK"));
            		parseBlock(retval);
            		return retval;
            	}

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:520:2: ( LBRACE ( classTypeBlockEntry )* RBRACE -> ^( TYPE_BLOCK ( classTypeBlockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:520:4: LBRACE ( classTypeBlockEntry )* RBRACE
                {
                LBRACE94=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_classTypeBlock1475)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE94);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:521:3: ( classTypeBlockEntry )*
                loop25:
                do {
                    var alt25:int=2;
                    var LA25_0:int = input.LA(1);

                    if ( (LA25_0==76||LA25_0==79||LA25_0==81||LA25_0==87||(LA25_0>=89 && LA25_0<=91)||(LA25_0>=94 && LA25_0<=102)||(LA25_0>=107 && LA25_0<=111)||(LA25_0>=134 && LA25_0<=135)) ) {
                        alt25=1;
                    }


                    switch (alt25) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:521:3: classTypeBlockEntry
                	    {
                	    pushFollow(FOLLOW_classTypeBlockEntry_in_classTypeBlock1479);
                	    classTypeBlockEntry95=classTypeBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_classTypeBlockEntry.add(classTypeBlockEntry95.tree);

                	    }
                	    break;

                	default :
                	    break loop25;
                    }
                } while (true);

                RBRACE96=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_classTypeBlock1484)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE96);



                // AST REWRITE
                // elements: classTypeBlockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 523:3: -> ^( TYPE_BLOCK ( classTypeBlockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:523:6: ^( TYPE_BLOCK ( classTypeBlockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:523:20: ( classTypeBlockEntry )*
                    while ( stream_classTypeBlockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_classTypeBlockEntry.nextTree());

                    }
                    stream_classTypeBlockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classTypeBlock

        // $ANTLR start classTypeBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:526:1: classTypeBlockEntry : ( ( configIdent LBRACE )=> configBlockEntry | ( LBRACE )=> staticBlockEntry | (a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry ) ) );
        public final function classTypeBlockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var a:ParserRuleReturnScope = null;

            var m:ParserRuleReturnScope = null;

            var configBlockEntry97:ParserRuleReturnScope = null;

            var staticBlockEntry98:ParserRuleReturnScope = null;

            var fieldDefinitionBlockEntry99:ParserRuleReturnScope = null;

            var classMethodDefinitionBlockEntry100:ParserRuleReturnScope = null;

            var staticLinkEntry101:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:527:2: ( ( configIdent LBRACE )=> configBlockEntry | ( LBRACE )=> staticBlockEntry | (a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry ) ) )
                var alt27:int=3;
                alt27 = dfa27.predict(input);
                switch (alt27) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:528:3: ( configIdent LBRACE )=> configBlockEntry
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_configBlockEntry_in_classTypeBlockEntry1517);
                        configBlockEntry97=configBlockEntry();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, configBlockEntry97.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:530:3: ( LBRACE )=> staticBlockEntry
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_staticBlockEntry_in_classTypeBlockEntry1530);
                        staticBlockEntry98=staticBlockEntry();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, staticBlockEntry98.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:532:3: (a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry ) )
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:532:3: (a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry ) )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:533:4: a= annotations m= modifiers ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry )
                        {
                        pushFollow(FOLLOW_annotations_in_classTypeBlockEntry1545);
                        a=annotations();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                           retval.start = placeholder((a!=null?LinkedListTree(a.tree):null)); 
                        }
                        pushFollow(FOLLOW_modifiers_in_classTypeBlockEntry1555);
                        m=modifiers();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                           placeholder((m!=null?LinkedListTree(m.tree):null)); 
                        }
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:535:4: ( fieldDefinitionBlockEntry[$a.tree,$m.tree] | classMethodDefinitionBlockEntry[$a.tree,$m.tree] | staticLinkEntry )
                        var alt26:int=3;
                        switch ( input.LA(1) ) {
                        case NAMESPACE:
                            {
                            var LA26_1:int = input.LA(2);

                            if ( (LA26_1==79||(LA26_1>=89 && LA26_1<=90)||LA26_1==94||(LA26_1>=108 && LA26_1<=109)||(LA26_1>=134 && LA26_1<=135)) ) {
                                alt26=1;
                            }
                            else if ( (LA26_1==-1||(LA26_1>=77 && LA26_1<=78)) ) {
                                alt26=3;
                            }
                            else {
                                if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                                throw new NoViableAltException("", 26, 1, input);

                            }
                            }
                            break;
                        case FUNCTION:
                            {
                            alt26=2;
                            }
                            break;
                        case IDENT:
                        case USE:
                        case DYNAMIC:
                        case GET:
                        case SET:
                        case IS:
                        case AS:
                            {
                            alt26=3;
                            }
                            break;
                        case VAR:
                        case CONST:
                            {
                            alt26=1;
                            }
                            break;
                        default:
                            if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                            throw new NoViableAltException("", 26, 0, input);

                        }

                        switch (alt26) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:536:6: fieldDefinitionBlockEntry[$a.tree,$m.tree]
                                {
                                pushFollow(FOLLOW_fieldDefinitionBlockEntry_in_classTypeBlockEntry1570);
                                fieldDefinitionBlockEntry99=fieldDefinitionBlockEntry((a!=null?LinkedListTree(a.tree):null), (m!=null?LinkedListTree(m.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, fieldDefinitionBlockEntry99.tree);

                                }
                                break;
                            case 2 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:537:7: classMethodDefinitionBlockEntry[$a.tree,$m.tree]
                                {
                                pushFollow(FOLLOW_classMethodDefinitionBlockEntry_in_classTypeBlockEntry1580);
                                classMethodDefinitionBlockEntry100=classMethodDefinitionBlockEntry((a!=null?LinkedListTree(a.tree):null), (m!=null?LinkedListTree(m.tree):null));

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, classMethodDefinitionBlockEntry100.tree);

                                }
                                break;
                            case 3 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:538:7: staticLinkEntry
                                {
                                pushFollow(FOLLOW_staticLinkEntry_in_classTypeBlockEntry1589);
                                staticLinkEntry101=staticLinkEntry();

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, staticLinkEntry101.tree);

                                }
                                break;

                        }


                        }


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classTypeBlockEntry

        // $ANTLR start interfaceTypeBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:547:1: interfaceTypeBlock : LBRACE ( interfaceTypeBlockEntry )* RBRACE -> ^( TYPE_BLOCK ( interfaceTypeBlockEntry )* ) ;
        public final function interfaceTypeBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE102:Token=null;
            var RBRACE104:Token=null;
            var interfaceTypeBlockEntry103:ParserRuleReturnScope = null;


            var LBRACE102_tree:LinkedListTree=null;
            var RBRACE104_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_interfaceTypeBlockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule interfaceTypeBlockEntry");

            	if (packageBlockParse)
            	{
            		retval.tree = LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK"));
            		parseBlock(retval);
            		return retval;
            	}

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:556:2: ( LBRACE ( interfaceTypeBlockEntry )* RBRACE -> ^( TYPE_BLOCK ( interfaceTypeBlockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:556:4: LBRACE ( interfaceTypeBlockEntry )* RBRACE
                {
                LBRACE102=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_interfaceTypeBlock1618)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE102);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:557:3: ( interfaceTypeBlockEntry )*
                loop28:
                do {
                    var alt28:int=2;
                    var LA28_0:int = input.LA(1);

                    if ( (LA28_0==76||LA28_0==79||LA28_0==81||LA28_0==87||LA28_0==89||LA28_0==91||LA28_0==107) ) {
                        alt28=1;
                    }


                    switch (alt28) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:557:3: interfaceTypeBlockEntry
                	    {
                	    pushFollow(FOLLOW_interfaceTypeBlockEntry_in_interfaceTypeBlock1622);
                	    interfaceTypeBlockEntry103=interfaceTypeBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_interfaceTypeBlockEntry.add(interfaceTypeBlockEntry103.tree);

                	    }
                	    break;

                	default :
                	    break loop28;
                    }
                } while (true);

                RBRACE104=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_interfaceTypeBlock1627)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE104);



                // AST REWRITE
                // elements: interfaceTypeBlockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 559:3: -> ^( TYPE_BLOCK ( interfaceTypeBlockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:559:6: ^( TYPE_BLOCK ( interfaceTypeBlockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(TYPE_BLOCK, "TYPE_BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:559:20: ( interfaceTypeBlockEntry )*
                    while ( stream_interfaceTypeBlockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_interfaceTypeBlockEntry.nextTree());

                    }
                    stream_interfaceTypeBlockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end interfaceTypeBlock

        // $ANTLR start interfaceTypeBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:562:1: interfaceTypeBlockEntry : ( ( configIdent LBRACE )=> configBlockEntry | ( LBRACE )=> staticBlockEntry | (a= annotations ( interfaceMethodDefinitionBlockEntry[$a.tree] ) ) );
        public final function interfaceTypeBlockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var a:ParserRuleReturnScope = null;

            var configBlockEntry105:ParserRuleReturnScope = null;

            var staticBlockEntry106:ParserRuleReturnScope = null;

            var interfaceMethodDefinitionBlockEntry107:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:563:2: ( ( configIdent LBRACE )=> configBlockEntry | ( LBRACE )=> staticBlockEntry | (a= annotations ( interfaceMethodDefinitionBlockEntry[$a.tree] ) ) )
                var alt29:int=3;
                var LA29_0:int = input.LA(1);

                if ( (LA29_0==79) ) {
                    var LA29_1:int = input.LA(2);

                    if ( (synpred5_AS3()) ) {
                        alt29=1;
                    }
                    else if ( (true) ) {
                        alt29=3;
                    }
                    else {
                        if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                        throw new NoViableAltException("", 29, 1, input);

                    }
                }
                else if ( (LA29_0==76) && (synpred6_AS3())) {
                    alt29=2;
                }
                else if ( (LA29_0==81||LA29_0==87||LA29_0==89||LA29_0==91||LA29_0==107) ) {
                    alt29=3;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 29, 0, input);

                }
                switch (alt29) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:564:3: ( configIdent LBRACE )=> configBlockEntry
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_configBlockEntry_in_interfaceTypeBlockEntry1661);
                        configBlockEntry105=configBlockEntry();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, configBlockEntry105.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:566:3: ( LBRACE )=> staticBlockEntry
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_staticBlockEntry_in_interfaceTypeBlockEntry1674);
                        staticBlockEntry106=staticBlockEntry();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, staticBlockEntry106.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:568:3: (a= annotations ( interfaceMethodDefinitionBlockEntry[$a.tree] ) )
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:568:3: (a= annotations ( interfaceMethodDefinitionBlockEntry[$a.tree] ) )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:569:4: a= annotations ( interfaceMethodDefinitionBlockEntry[$a.tree] )
                        {
                        pushFollow(FOLLOW_annotations_in_interfaceTypeBlockEntry1690);
                        a=annotations();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                           retval.start = placeholder((a!=null?LinkedListTree(a.tree):null)); 
                        }
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:570:4: ( interfaceMethodDefinitionBlockEntry[$a.tree] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:571:5: interfaceMethodDefinitionBlockEntry[$a.tree]
                        {
                        pushFollow(FOLLOW_interfaceMethodDefinitionBlockEntry_in_interfaceTypeBlockEntry1704);
                        interfaceMethodDefinitionBlockEntry107=interfaceMethodDefinitionBlockEntry((a!=null?LinkedListTree(a.tree):null));

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, interfaceMethodDefinitionBlockEntry107.tree);

                        }


                        }


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end interfaceTypeBlockEntry

        // $ANTLR start configBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:581:1: configBlockEntry : configIdent LBRACE ( classTypeBlockEntry )* RBRACE -> ^( COMPILE_CONFIG configIdent ^( BLOCK ( classTypeBlockEntry )* ) ) ;
        public final function configBlockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE109:Token=null;
            var RBRACE111:Token=null;
            var configIdent108:ParserRuleReturnScope = null;

            var classTypeBlockEntry110:ParserRuleReturnScope = null;


            var LBRACE109_tree:LinkedListTree=null;
            var RBRACE111_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_classTypeBlockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule classTypeBlockEntry");
            var stream_configIdent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule configIdent");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:582:2: ( configIdent LBRACE ( classTypeBlockEntry )* RBRACE -> ^( COMPILE_CONFIG configIdent ^( BLOCK ( classTypeBlockEntry )* ) ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:583:3: configIdent LBRACE ( classTypeBlockEntry )* RBRACE
                {
                pushFollow(FOLLOW_configIdent_in_configBlockEntry1735);
                configIdent108=configIdent();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_configIdent.add(configIdent108.tree);
                LBRACE109=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_configBlockEntry1737)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE109);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:583:22: ( classTypeBlockEntry )*
                loop30:
                do {
                    var alt30:int=2;
                    var LA30_0:int = input.LA(1);

                    if ( (LA30_0==76||LA30_0==79||LA30_0==81||LA30_0==87||(LA30_0>=89 && LA30_0<=91)||(LA30_0>=94 && LA30_0<=102)||(LA30_0>=107 && LA30_0<=111)||(LA30_0>=134 && LA30_0<=135)) ) {
                        alt30=1;
                    }


                    switch (alt30) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:583:22: classTypeBlockEntry
                	    {
                	    pushFollow(FOLLOW_classTypeBlockEntry_in_configBlockEntry1739);
                	    classTypeBlockEntry110=classTypeBlockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_classTypeBlockEntry.add(classTypeBlockEntry110.tree);

                	    }
                	    break;

                	default :
                	    break loop30;
                    }
                } while (true);

                RBRACE111=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_configBlockEntry1742)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE111);



                // AST REWRITE
                // elements: classTypeBlockEntry, configIdent
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 584:3: -> ^( COMPILE_CONFIG configIdent ^( BLOCK ( classTypeBlockEntry )* ) )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:584:6: ^( COMPILE_CONFIG configIdent ^( BLOCK ( classTypeBlockEntry )* ) )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(COMPILE_CONFIG, "COMPILE_CONFIG")), root_1));

                    adaptor.addChild(root_1, stream_configIdent.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:584:36: ^( BLOCK ( classTypeBlockEntry )* )
                    {
                    var root_2:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_2 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(BLOCK, "BLOCK")), root_2));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:584:45: ( classTypeBlockEntry )*
                    while ( stream_classTypeBlockEntry.hasNext ) {
                        adaptor.addChild(root_2, stream_classTypeBlockEntry.nextTree());

                    }
                    stream_classTypeBlockEntry.reset();

                    adaptor.addChild(root_1, root_2);
                    }

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end configBlockEntry

        // $ANTLR start staticBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:591:1: staticBlockEntry : LBRACE ( blockEntry )* RBRACE -> ^( STATIC_BLOCK ( blockEntry )* ) ;
        public final function staticBlockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE112:Token=null;
            var RBRACE114:Token=null;
            var blockEntry113:ParserRuleReturnScope = null;


            var LBRACE112_tree:LinkedListTree=null;
            var RBRACE114_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_blockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule blockEntry");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:592:2: ( LBRACE ( blockEntry )* RBRACE -> ^( STATIC_BLOCK ( blockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:592:4: LBRACE ( blockEntry )* RBRACE
                {
                LBRACE112=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_staticBlockEntry1778)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE112);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:592:11: ( blockEntry )*
                loop31:
                do {
                    var alt31:int=2;
                    var LA31_0:int = input.LA(1);

                    if ( (LA31_0==76||(LA31_0>=78 && LA31_0<=79)||LA31_0==81||LA31_0==83||(LA31_0>=87 && LA31_0<=91)||(LA31_0>=94 && LA31_0<=95)||LA31_0==97||(LA31_0>=101 && LA31_0<=102)||(LA31_0>=107 && LA31_0<=112)||(LA31_0>=114 && LA31_0<=115)||(LA31_0>=117 && LA31_0<=118)||LA31_0==121||(LA31_0>=124 && LA31_0<=131)||(LA31_0>=160 && LA31_0<=161)||(LA31_0>=164 && LA31_0<=169)||(LA31_0>=171 && LA31_0<=183)||LA31_0==185) ) {
                        alt31=1;
                    }


                    switch (alt31) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:592:11: blockEntry
                	    {
                	    pushFollow(FOLLOW_blockEntry_in_staticBlockEntry1780);
                	    blockEntry113=blockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_blockEntry.add(blockEntry113.tree);

                	    }
                	    break;

                	default :
                	    break loop31;
                    }
                } while (true);

                RBRACE114=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_staticBlockEntry1783)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE114);



                // AST REWRITE
                // elements: blockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 593:3: -> ^( STATIC_BLOCK ( blockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:593:6: ^( STATIC_BLOCK ( blockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(STATIC_BLOCK, "STATIC_BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:593:22: ( blockEntry )*
                    while ( stream_blockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_blockEntry.nextTree());

                    }
                    stream_blockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end staticBlockEntry

        // $ANTLR start staticLinkEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:596:1: staticLinkEntry : ident semi -> ^( STATIC_LINK ident ) ;
        public final function staticLinkEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ident115:ParserRuleReturnScope = null;

            var semi116:ParserRuleReturnScope = null;


            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:597:2: ( ident semi -> ^( STATIC_LINK ident ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:597:4: ident semi
                {
                pushFollow(FOLLOW_ident_in_staticLinkEntry1807);
                ident115=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident115.tree);
                pushFollow(FOLLOW_semi_in_staticLinkEntry1809);
                semi116=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi116.tree);


                // AST REWRITE
                // elements: ident
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 598:3: -> ^( STATIC_LINK ident )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:598:6: ^( STATIC_LINK ident )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(STATIC_LINK, "STATIC_LINK")), root_1));

                    adaptor.addChild(root_1, stream_ident.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end staticLinkEntry

        // $ANTLR start fieldDefinitionBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:607:1: fieldDefinitionBlockEntry[LinkedListTree annos, Tree mods] : vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi -> ^( FIELD_DEF $vm ( variableDeclarator )+ ) ;
        public final function fieldDefinitionBlockEntry(annos:LinkedListTree, mods:Tree):ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA118:Token=null;
            var vm:ParserRuleReturnScope = null;

            var variableDeclarator117:ParserRuleReturnScope = null;

            var variableDeclarator119:ParserRuleReturnScope = null;

            var semi120:ParserRuleReturnScope = null;


            var COMMA118_tree:LinkedListTree=null;
            var stream_COMMA:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COMMA");
            var stream_variableDeclarator:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule variableDeclarator");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");
            var stream_variableModifier:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule variableModifier");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:612:2: (vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi -> ^( FIELD_DEF $vm ( variableDeclarator )+ ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:612:4: vm= variableModifier variableDeclarator ( COMMA variableDeclarator )* semi
                {
                pushFollow(FOLLOW_variableModifier_in_fieldDefinitionBlockEntry1851);
                vm=variableModifier();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_variableModifier.add(vm.tree);
                pushFollow(FOLLOW_variableDeclarator_in_fieldDefinitionBlockEntry1853);
                variableDeclarator117=variableDeclarator();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_variableDeclarator.add(variableDeclarator117.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:612:43: ( COMMA variableDeclarator )*
                loop32:
                do {
                    var alt32:int=2;
                    var LA32_0:int = input.LA(1);

                    if ( (LA32_0==84) ) {
                        alt32=1;
                    }


                    switch (alt32) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:612:45: COMMA variableDeclarator
                	    {
                	    COMMA118=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_fieldDefinitionBlockEntry1857)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_COMMA.add(COMMA118);

                	    pushFollow(FOLLOW_variableDeclarator_in_fieldDefinitionBlockEntry1859);
                	    variableDeclarator119=variableDeclarator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_variableDeclarator.add(variableDeclarator119.tree);

                	    }
                	    break;

                	default :
                	    break loop32;
                    }
                } while (true);

                pushFollow(FOLLOW_semi_in_fieldDefinitionBlockEntry1864);
                semi120=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi120.tree);


                // AST REWRITE
                // elements: variableDeclarator, vm
                // token labels: 
                // rule labels: vm, retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_vm:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule vm",vm!=null?vm.tree:null);
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 613:3: -> ^( FIELD_DEF $vm ( variableDeclarator )+ )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:613:6: ^( FIELD_DEF $vm ( variableDeclarator )+ )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FIELD_DEF, "FIELD_DEF")), root_1));

                    adaptor.addChild(root_1, annos);
                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_vm.nextTree());
                    if ( !(stream_variableDeclarator.hasNext) ) {
                        throw new RewriteEarlyExitException();
                    }
                    while ( stream_variableDeclarator.hasNext ) {
                        adaptor.addChild(root_1, stream_variableDeclarator.nextTree());

                    }
                    stream_variableDeclarator.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end fieldDefinitionBlockEntry

        // $ANTLR start classMethodDefinitionBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:620:1: classMethodDefinitionBlockEntry[LinkedListTree annos, Tree mods] : FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? block -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ( block )? ) ;
        public final function classMethodDefinitionBlockEntry(annos:LinkedListTree, mods:Tree):ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var FUNCTION121:Token=null;
            var r:ParserRuleReturnScope = null;

            var ident122:ParserRuleReturnScope = null;

            var parameterDeclarationList123:ParserRuleReturnScope = null;

            var typeExpression124:ParserRuleReturnScope = null;

            var block125:ParserRuleReturnScope = null;


            var FUNCTION121_tree:LinkedListTree=null;
            var stream_FUNCTION:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FUNCTION");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_optionalAccessorRole:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule optionalAccessorRole");
            var stream_block:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule block");
            var stream_parameterDeclarationList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule parameterDeclarationList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:621:2: ( FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? block -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ( block )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:621:4: FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? block
                {
                if ( this.state.backtracking==0 ) {
                   retval.start = annos.getStartToken(); 
                }
                FUNCTION121=Token(matchStream(input,FUNCTION,FOLLOW_FUNCTION_in_classMethodDefinitionBlockEntry1904)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FUNCTION.add(FUNCTION121);

                pushFollow(FOLLOW_optionalAccessorRole_in_classMethodDefinitionBlockEntry1910);
                r=optionalAccessorRole();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_optionalAccessorRole.add(r.tree);
                if ( this.state.backtracking==0 ) {
                   placeholder((r!=null?LinkedListTree(r.tree):null)); 
                }
                pushFollow(FOLLOW_ident_in_classMethodDefinitionBlockEntry1917);
                ident122=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident122.tree);
                pushFollow(FOLLOW_parameterDeclarationList_in_classMethodDefinitionBlockEntry1921);
                parameterDeclarationList123=parameterDeclarationList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_parameterDeclarationList.add(parameterDeclarationList123.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:626:3: ( typeExpression )?
                var alt33:int=2;
                var LA33_0:int = input.LA(1);

                if ( (LA33_0==123) ) {
                    alt33=1;
                }
                switch (alt33) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:626:3: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_classMethodDefinitionBlockEntry1925);
                        typeExpression124=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression124.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_block_in_classMethodDefinitionBlockEntry1930);
                block125=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_block.add(block125.tree);


                // AST REWRITE
                // elements: block, optionalAccessorRole, parameterDeclarationList, typeExpression, ident
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 628:3: -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ( block )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:628:6: ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ( block )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(METHOD_DEF, "METHOD_DEF")), root_1));

                    adaptor.addChild(root_1, annos);
                    adaptor.addChild(root_1, mods);
                    adaptor.addChild(root_1, stream_optionalAccessorRole.nextTree());
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    adaptor.addChild(root_1, stream_parameterDeclarationList.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:631:5: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:632:5: ( block )?
                    if ( stream_block.hasNext ) {
                        adaptor.addChild(root_1, stream_block.nextTree());

                    }
                    stream_block.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end classMethodDefinitionBlockEntry

        // $ANTLR start interfaceMethodDefinitionBlockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:635:1: interfaceMethodDefinitionBlockEntry[LinkedListTree annos] : FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? semi -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ) ;
        public final function interfaceMethodDefinitionBlockEntry(annos:LinkedListTree):ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var FUNCTION126:Token=null;
            var r:ParserRuleReturnScope = null;

            var ident127:ParserRuleReturnScope = null;

            var parameterDeclarationList128:ParserRuleReturnScope = null;

            var typeExpression129:ParserRuleReturnScope = null;

            var semi130:ParserRuleReturnScope = null;


            var FUNCTION126_tree:LinkedListTree=null;
            var stream_FUNCTION:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FUNCTION");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_optionalAccessorRole:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule optionalAccessorRole");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");
            var stream_parameterDeclarationList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule parameterDeclarationList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:636:2: ( FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? semi -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:636:4: FUNCTION r= optionalAccessorRole ident parameterDeclarationList ( typeExpression )? semi
                {
                if ( this.state.backtracking==0 ) {
                   retval.start = annos.getStartToken(); 
                }
                FUNCTION126=Token(matchStream(input,FUNCTION,FOLLOW_FUNCTION_in_interfaceMethodDefinitionBlockEntry2002)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FUNCTION.add(FUNCTION126);

                pushFollow(FOLLOW_optionalAccessorRole_in_interfaceMethodDefinitionBlockEntry2008);
                r=optionalAccessorRole();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_optionalAccessorRole.add(r.tree);
                if ( this.state.backtracking==0 ) {
                   placeholder((r!=null?LinkedListTree(r.tree):null)); 
                }
                pushFollow(FOLLOW_ident_in_interfaceMethodDefinitionBlockEntry2015);
                ident127=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident127.tree);
                pushFollow(FOLLOW_parameterDeclarationList_in_interfaceMethodDefinitionBlockEntry2019);
                parameterDeclarationList128=parameterDeclarationList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_parameterDeclarationList.add(parameterDeclarationList128.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:641:3: ( typeExpression )?
                var alt34:int=2;
                var LA34_0:int = input.LA(1);

                if ( (LA34_0==123) ) {
                    alt34=1;
                }
                switch (alt34) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:641:3: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_interfaceMethodDefinitionBlockEntry2023);
                        typeExpression129=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression129.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_semi_in_interfaceMethodDefinitionBlockEntry2028);
                semi130=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi130.tree);


                // AST REWRITE
                // elements: ident, optionalAccessorRole, typeExpression, parameterDeclarationList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 643:3: -> ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:643:6: ^( METHOD_DEF optionalAccessorRole ident parameterDeclarationList ( typeExpression )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(METHOD_DEF, "METHOD_DEF")), root_1));

                    adaptor.addChild(root_1, annos);
                    adaptor.addChild(root_1, stream_optionalAccessorRole.nextTree());
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    adaptor.addChild(root_1, stream_parameterDeclarationList.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:646:5: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end interfaceMethodDefinitionBlockEntry

        // $ANTLR start optionalAccessorRole
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:650:1: optionalAccessorRole : ( accessorRole )? -> ^( ACCESSOR_ROLE ( accessorRole )? ) ;
        public final function optionalAccessorRole():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var accessorRole131:ParserRuleReturnScope = null;


            var stream_accessorRole:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule accessorRole");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:651:2: ( ( accessorRole )? -> ^( ACCESSOR_ROLE ( accessorRole )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:651:4: ( accessorRole )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:651:4: ( accessorRole )?
                var alt35:int=2;
                var LA35_0:int = input.LA(1);

                if ( (LA35_0==108) ) {
                    var LA35_1:int = input.LA(2);

                    if ( (LA35_1==79||(LA35_1>=89 && LA35_1<=90)||LA35_1==94||(LA35_1>=108 && LA35_1<=109)||(LA35_1>=134 && LA35_1<=135)) ) {
                        alt35=1;
                    }
                }
                else if ( (LA35_0==109) ) {
                    var LA35_3:int = input.LA(2);

                    if ( (LA35_3==79||(LA35_3>=89 && LA35_3<=90)||LA35_3==94||(LA35_3>=108 && LA35_3<=109)||(LA35_3>=134 && LA35_3<=135)) ) {
                        alt35=1;
                    }
                }
                switch (alt35) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:651:4: accessorRole
                        {
                        pushFollow(FOLLOW_accessorRole_in_optionalAccessorRole2087);
                        accessorRole131=accessorRole();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_accessorRole.add(accessorRole131.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: accessorRole
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 652:3: -> ^( ACCESSOR_ROLE ( accessorRole )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:652:6: ^( ACCESSOR_ROLE ( accessorRole )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ACCESSOR_ROLE, "ACCESSOR_ROLE")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:652:23: ( accessorRole )?
                    if ( stream_accessorRole.hasNext ) {
                        adaptor.addChild(root_1, stream_accessorRole.nextTree());

                    }
                    stream_accessorRole.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end optionalAccessorRole

        // $ANTLR start accessorRole
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:655:1: accessorRole : ( GET | SET );
        public final function accessorRole():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set132:Token=null;

            var set132_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:656:2: ( GET | SET )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set132=Token(input.LT(1));
                if ( (input.LA(1)>=108 && input.LA(1)<=109) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set132)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end accessorRole

        // $ANTLR start block
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:664:1: block : LBRACE ( blockEntry )* RBRACE -> ^( BLOCK ( blockEntry )* ) ;
        public final function block():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE133:Token=null;
            var RBRACE135:Token=null;
            var blockEntry134:ParserRuleReturnScope = null;


            var LBRACE133_tree:LinkedListTree=null;
            var RBRACE135_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_blockEntry:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule blockEntry");

            	if (typeBlockParse)
            	{
            		retval.tree = LinkedListTree(adaptor.create(BLOCK, "BLOCK"));
            		parseBlock(retval);
            		return retval;
            	}

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:673:2: ( LBRACE ( blockEntry )* RBRACE -> ^( BLOCK ( blockEntry )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:673:4: LBRACE ( blockEntry )* RBRACE
                {
                LBRACE133=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_block2138)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE133);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:673:11: ( blockEntry )*
                loop36:
                do {
                    var alt36:int=2;
                    var LA36_0:int = input.LA(1);

                    if ( (LA36_0==76||(LA36_0>=78 && LA36_0<=79)||LA36_0==81||LA36_0==83||(LA36_0>=87 && LA36_0<=91)||(LA36_0>=94 && LA36_0<=95)||LA36_0==97||(LA36_0>=101 && LA36_0<=102)||(LA36_0>=107 && LA36_0<=112)||(LA36_0>=114 && LA36_0<=115)||(LA36_0>=117 && LA36_0<=118)||LA36_0==121||(LA36_0>=124 && LA36_0<=131)||(LA36_0>=160 && LA36_0<=161)||(LA36_0>=164 && LA36_0<=169)||(LA36_0>=171 && LA36_0<=183)||LA36_0==185) ) {
                        alt36=1;
                    }


                    switch (alt36) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:673:11: blockEntry
                	    {
                	    pushFollow(FOLLOW_blockEntry_in_block2140);
                	    blockEntry134=blockEntry();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_blockEntry.add(blockEntry134.tree);

                	    }
                	    break;

                	default :
                	    break loop36;
                    }
                } while (true);

                RBRACE135=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_block2143)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE135);



                // AST REWRITE
                // elements: blockEntry
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 674:3: -> ^( BLOCK ( blockEntry )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:674:6: ^( BLOCK ( blockEntry )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(BLOCK, "BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:674:15: ( blockEntry )*
                    while ( stream_blockEntry.hasNext ) {
                        adaptor.addChild(root_1, stream_blockEntry.nextTree());

                    }
                    stream_blockEntry.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end block

        // $ANTLR start blockEntry
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:677:1: blockEntry : statement ;
        public final function blockEntry():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var statement136:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:678:2: ( statement )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:679:3: statement
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_statement_in_blockEntry2169);
                statement136=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement136.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end blockEntry

        // $ANTLR start statement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:686:1: statement options {k=1; } : ({...}? block | statementTail );
        public final function statement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var block137:ParserRuleReturnScope = null;

            var statementTail138:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:691:2: ({...}? block | statementTail )
                var alt37:int=2;
                alt37 = dfa37.predict(input);
                switch (alt37) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:691:4: {...}? block
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        if ( !(( input.LA(1) == LBRACE )) ) {
                            if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                            throw new FailedPredicateException(input, "statement", " input.LA(1) == LBRACE ");
                        }
                        pushFollow(FOLLOW_block_in_statement2199);
                        block137=block();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, block137.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:693:4: statementTail
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_statementTail_in_statement2205);
                        statementTail138=statementTail();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statementTail138.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end statement

        // $ANTLR start statementTail
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:696:1: statementTail : ( declarationStatement | expressionStatement | ifStatement | ( FOR EACH )=> forEachStatement | forStatement | whileStatement | doWhileStatement | continueStatement | breakStatement | returnStatement | withStatement | labelStatement | switchStatement | throwStatement | tryStatement | defaultXMLNamespaceStatement | includeDirective | importDirective | useNamespaceDirective | configBlockDirective | emptyStatement ) ;
        public final function statementTail():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var declarationStatement139:ParserRuleReturnScope = null;

            var expressionStatement140:ParserRuleReturnScope = null;

            var ifStatement141:ParserRuleReturnScope = null;

            var forEachStatement142:ParserRuleReturnScope = null;

            var forStatement143:ParserRuleReturnScope = null;

            var whileStatement144:ParserRuleReturnScope = null;

            var doWhileStatement145:ParserRuleReturnScope = null;

            var continueStatement146:ParserRuleReturnScope = null;

            var breakStatement147:ParserRuleReturnScope = null;

            var returnStatement148:ParserRuleReturnScope = null;

            var withStatement149:ParserRuleReturnScope = null;

            var labelStatement150:ParserRuleReturnScope = null;

            var switchStatement151:ParserRuleReturnScope = null;

            var throwStatement152:ParserRuleReturnScope = null;

            var tryStatement153:ParserRuleReturnScope = null;

            var defaultXMLNamespaceStatement154:ParserRuleReturnScope = null;

            var includeDirective155:ParserRuleReturnScope = null;

            var importDirective156:ParserRuleReturnScope = null;

            var useNamespaceDirective157:ParserRuleReturnScope = null;

            var configBlockDirective158:ParserRuleReturnScope = null;

            var emptyStatement159:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:697:2: ( ( declarationStatement | expressionStatement | ifStatement | ( FOR EACH )=> forEachStatement | forStatement | whileStatement | doWhileStatement | continueStatement | breakStatement | returnStatement | withStatement | labelStatement | switchStatement | throwStatement | tryStatement | defaultXMLNamespaceStatement | includeDirective | importDirective | useNamespaceDirective | configBlockDirective | emptyStatement ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:697:4: ( declarationStatement | expressionStatement | ifStatement | ( FOR EACH )=> forEachStatement | forStatement | whileStatement | doWhileStatement | continueStatement | breakStatement | returnStatement | withStatement | labelStatement | switchStatement | throwStatement | tryStatement | defaultXMLNamespaceStatement | includeDirective | importDirective | useNamespaceDirective | configBlockDirective | emptyStatement )
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:697:4: ( declarationStatement | expressionStatement | ifStatement | ( FOR EACH )=> forEachStatement | forStatement | whileStatement | doWhileStatement | continueStatement | breakStatement | returnStatement | withStatement | labelStatement | switchStatement | throwStatement | tryStatement | defaultXMLNamespaceStatement | includeDirective | importDirective | useNamespaceDirective | configBlockDirective | emptyStatement )
                var alt38:int=21;
                alt38 = dfa38.predict(input);
                switch (alt38) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:697:5: declarationStatement
                        {
                        pushFollow(FOLLOW_declarationStatement_in_statementTail2217);
                        declarationStatement139=declarationStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, declarationStatement139.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:698:4: expressionStatement
                        {
                        pushFollow(FOLLOW_expressionStatement_in_statementTail2222);
                        expressionStatement140=expressionStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expressionStatement140.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:699:4: ifStatement
                        {
                        pushFollow(FOLLOW_ifStatement_in_statementTail2227);
                        ifStatement141=ifStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, ifStatement141.tree);

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:701:4: ( FOR EACH )=> forEachStatement
                        {
                        pushFollow(FOLLOW_forEachStatement_in_statementTail2240);
                        forEachStatement142=forEachStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, forEachStatement142.tree);

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:702:4: forStatement
                        {
                        pushFollow(FOLLOW_forStatement_in_statementTail2245);
                        forStatement143=forStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, forStatement143.tree);

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:703:4: whileStatement
                        {
                        pushFollow(FOLLOW_whileStatement_in_statementTail2250);
                        whileStatement144=whileStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, whileStatement144.tree);

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:704:4: doWhileStatement
                        {
                        pushFollow(FOLLOW_doWhileStatement_in_statementTail2255);
                        doWhileStatement145=doWhileStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, doWhileStatement145.tree);

                        }
                        break;
                    case 8 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:706:4: continueStatement
                        {
                        pushFollow(FOLLOW_continueStatement_in_statementTail2262);
                        continueStatement146=continueStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, continueStatement146.tree);

                        }
                        break;
                    case 9 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:707:4: breakStatement
                        {
                        pushFollow(FOLLOW_breakStatement_in_statementTail2267);
                        breakStatement147=breakStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, breakStatement147.tree);

                        }
                        break;
                    case 10 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:708:4: returnStatement
                        {
                        pushFollow(FOLLOW_returnStatement_in_statementTail2272);
                        returnStatement148=returnStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, returnStatement148.tree);

                        }
                        break;
                    case 11 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:709:4: withStatement
                        {
                        pushFollow(FOLLOW_withStatement_in_statementTail2277);
                        withStatement149=withStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, withStatement149.tree);

                        }
                        break;
                    case 12 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:710:4: labelStatement
                        {
                        pushFollow(FOLLOW_labelStatement_in_statementTail2282);
                        labelStatement150=labelStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, labelStatement150.tree);

                        }
                        break;
                    case 13 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:711:4: switchStatement
                        {
                        pushFollow(FOLLOW_switchStatement_in_statementTail2287);
                        switchStatement151=switchStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, switchStatement151.tree);

                        }
                        break;
                    case 14 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:712:4: throwStatement
                        {
                        pushFollow(FOLLOW_throwStatement_in_statementTail2292);
                        throwStatement152=throwStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, throwStatement152.tree);

                        }
                        break;
                    case 15 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:713:4: tryStatement
                        {
                        pushFollow(FOLLOW_tryStatement_in_statementTail2297);
                        tryStatement153=tryStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, tryStatement153.tree);

                        }
                        break;
                    case 16 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:715:4: defaultXMLNamespaceStatement
                        {
                        pushFollow(FOLLOW_defaultXMLNamespaceStatement_in_statementTail2303);
                        defaultXMLNamespaceStatement154=defaultXMLNamespaceStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, defaultXMLNamespaceStatement154.tree);

                        }
                        break;
                    case 17 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:716:4: includeDirective
                        {
                        pushFollow(FOLLOW_includeDirective_in_statementTail2308);
                        includeDirective155=includeDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, includeDirective155.tree);

                        }
                        break;
                    case 18 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:717:5: importDirective
                        {
                        pushFollow(FOLLOW_importDirective_in_statementTail2314);
                        importDirective156=importDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, importDirective156.tree);

                        }
                        break;
                    case 19 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:718:4: useNamespaceDirective
                        {
                        pushFollow(FOLLOW_useNamespaceDirective_in_statementTail2319);
                        useNamespaceDirective157=useNamespaceDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, useNamespaceDirective157.tree);

                        }
                        break;
                    case 20 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:720:4: configBlockDirective
                        {
                        pushFollow(FOLLOW_configBlockDirective_in_statementTail2326);
                        configBlockDirective158=configBlockDirective();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, configBlockDirective158.tree);

                        }
                        break;
                    case 21 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:722:4: emptyStatement
                        {
                        pushFollow(FOLLOW_emptyStatement_in_statementTail2334);
                        emptyStatement159=emptyStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, emptyStatement159.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end statementTail

        // $ANTLR start variableModifier
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:729:1: variableModifier : ( VAR | CONST | NAMESPACE );
        public final function variableModifier():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set160:Token=null;

            var set160_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:730:2: ( VAR | CONST | NAMESPACE )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set160=Token(input.LT(1));
                if ( input.LA(1)==90||(input.LA(1)>=110 && input.LA(1)<=111) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set160)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end variableModifier

        // $ANTLR start variableDeclarator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:736:1: variableDeclarator : ident ( typeExpression )? ( variableInitializer )? -> ^( VAR_DEC ident ( typeExpression )? ( variableInitializer )? ) ;
        public final function variableDeclarator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ident161:ParserRuleReturnScope = null;

            var typeExpression162:ParserRuleReturnScope = null;

            var variableInitializer163:ParserRuleReturnScope = null;


            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_variableInitializer:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule variableInitializer");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:2: ( ident ( typeExpression )? ( variableInitializer )? -> ^( VAR_DEC ident ( typeExpression )? ( variableInitializer )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:4: ident ( typeExpression )? ( variableInitializer )?
                {
                pushFollow(FOLLOW_ident_in_variableDeclarator2373);
                ident161=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident161.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:10: ( typeExpression )?
                var alt39:int=2;
                var LA39_0:int = input.LA(1);

                if ( (LA39_0==123) ) {
                    alt39=1;
                }
                switch (alt39) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:10: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_variableDeclarator2375);
                        typeExpression162=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression162.tree);

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:26: ( variableInitializer )?
                var alt40:int=2;
                var LA40_0:int = input.LA(1);

                if ( (LA40_0==86) ) {
                    alt40=1;
                }
                switch (alt40) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:737:26: variableInitializer
                        {
                        pushFollow(FOLLOW_variableInitializer_in_variableDeclarator2378);
                        variableInitializer163=variableInitializer();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_variableInitializer.add(variableInitializer163.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: variableInitializer, ident, typeExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 738:3: -> ^( VAR_DEC ident ( typeExpression )? ( variableInitializer )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:738:6: ^( VAR_DEC ident ( typeExpression )? ( variableInitializer )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(VAR_DEC, "VAR_DEC")), root_1));

                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:738:23: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:738:39: ( variableInitializer )?
                    if ( stream_variableInitializer.hasNext ) {
                        adaptor.addChild(root_1, stream_variableInitializer.nextTree());

                    }
                    stream_variableInitializer.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end variableDeclarator

        // $ANTLR start declarationStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:742:1: declarationStatement : declaration semi ;
        public final function declarationStatement():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var declaration164:ParserRuleReturnScope = null;

            var semi165:ParserRuleReturnScope = null;




            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:747:2: ( declaration semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:747:4: declaration semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_declaration_in_declarationStatement2419);
                declaration164=declaration();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, declaration164.tree);
                pushFollow(FOLLOW_semi_in_declarationStatement2421);
                semi165=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi165.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end declarationStatement

        // $ANTLR start declaration
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:751:1: declaration : variableModifier variableDeclarator declarationTail ;
        public final function declaration():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var variableModifier166:ParserRuleReturnScope = null;

            var variableDeclarator167:ParserRuleReturnScope = null;

            var declarationTail168:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:752:2: ( variableModifier variableDeclarator declarationTail )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:752:4: variableModifier variableDeclarator declarationTail
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_variableModifier_in_declaration2433);
                variableModifier166=variableModifier();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(variableModifier166.tree, root_0));
                pushFollow(FOLLOW_variableDeclarator_in_declaration2436);
                variableDeclarator167=variableDeclarator();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, variableDeclarator167.tree);
                pushFollow(FOLLOW_declarationTail_in_declaration2438);
                declarationTail168=declarationTail();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, declarationTail168.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end declaration

        // $ANTLR start declarationTail
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:756:1: declarationTail : ( COMMA variableDeclarator )* ;
        public final function declarationTail():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA169:Token=null;
            var variableDeclarator170:ParserRuleReturnScope = null;


            var COMMA169_tree:LinkedListTree=null;


            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:761:3: ( ( COMMA variableDeclarator )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:761:5: ( COMMA variableDeclarator )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:761:5: ( COMMA variableDeclarator )*
                loop41:
                do {
                    var alt41:int=2;
                    var LA41_0:int = input.LA(1);

                    if ( (LA41_0==84) ) {
                        alt41=1;
                    }


                    switch (alt41) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:761:7: COMMA variableDeclarator
                	    {
                	    COMMA169=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_declarationTail2463)); if (this.state.failed) return retval;
                	    pushFollow(FOLLOW_variableDeclarator_in_declarationTail2466);
                	    variableDeclarator170=variableDeclarator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, variableDeclarator170.tree);

                	    }
                	    break;

                	default :
                	    break loop41;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end declarationTail

        // $ANTLR start variableInitializer
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:765:1: variableInitializer : ASSIGN assignmentExpression ;
        public final function variableInitializer():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ASSIGN171:Token=null;
            var assignmentExpression172:ParserRuleReturnScope = null;


            var ASSIGN171_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:766:2: ( ASSIGN assignmentExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:766:4: ASSIGN assignmentExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                ASSIGN171=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_variableInitializer2481)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                ASSIGN171_tree = LinkedListTree(adaptor.create(ASSIGN171));
                root_0 = LinkedListTree(adaptor.becomeRoot(ASSIGN171_tree, root_0));
                }
                pushFollow(FOLLOW_assignmentExpression_in_variableInitializer2484);
                assignmentExpression172=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression172.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end variableInitializer

        // $ANTLR start emptyStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:769:1: emptyStatement : SEMI ;
        public final function emptyStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SEMI173:Token=null;

            var SEMI173_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:770:2: ( SEMI )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:770:4: SEMI
                {
                root_0 = LinkedListTree(adaptor.nil());

                SEMI173=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_emptyStatement2495)); if (this.state.failed) return retval;

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end emptyStatement

        // $ANTLR start expressionStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:777:1: expressionStatement : expressionList semi -> ^( EXPR_STMNT expressionList ) ;
        public final function expressionStatement():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var expressionList174:ParserRuleReturnScope = null;

            var semi175:ParserRuleReturnScope = null;


            var stream_expressionList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expressionList");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:782:2: ( expressionList semi -> ^( EXPR_STMNT expressionList ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:782:4: expressionList semi
                {
                pushFollow(FOLLOW_expressionList_in_expressionStatement2521);
                expressionList174=expressionList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_expressionList.add(expressionList174.tree);
                pushFollow(FOLLOW_semi_in_expressionStatement2523);
                semi175=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi175.tree);


                // AST REWRITE
                // elements: expressionList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 783:3: -> ^( EXPR_STMNT expressionList )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:783:6: ^( EXPR_STMNT expressionList )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(EXPR_STMNT, "EXPR_STMNT")), root_1));

                    adaptor.addChild(root_1, stream_expressionList.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end expressionStatement

        // $ANTLR start ifStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:790:1: ifStatement : IF condition statement ( ( ELSE )=> elseClause )? ;
        public final function ifStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IF176:Token=null;
            var condition177:ParserRuleReturnScope = null;

            var statement178:ParserRuleReturnScope = null;

            var elseClause179:ParserRuleReturnScope = null;


            var IF176_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:791:2: ( IF condition statement ( ( ELSE )=> elseClause )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:791:4: IF condition statement ( ( ELSE )=> elseClause )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                IF176=Token(matchStream(input,IF,FOLLOW_IF_in_ifStatement2550)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IF176_tree = LinkedListTree(adaptor.create(IF176));
                root_0 = LinkedListTree(adaptor.becomeRoot(IF176_tree, root_0));
                }
                pushFollow(FOLLOW_condition_in_ifStatement2553);
                condition177=condition();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, condition177.tree);
                pushFollow(FOLLOW_statement_in_ifStatement2555);
                statement178=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement178.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:792:3: ( ( ELSE )=> elseClause )?
                var alt42:int=2;
                var LA42_0:int = input.LA(1);

                if ( (LA42_0==113) ) {
                    var LA42_1:int = input.LA(2);

                    if ( (synpred8_AS3()) ) {
                        alt42=1;
                    }
                }
                switch (alt42) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:792:5: ( ELSE )=> elseClause
                        {
                        pushFollow(FOLLOW_elseClause_in_ifStatement2566);
                        elseClause179=elseClause();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, elseClause179.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end ifStatement

        // $ANTLR start elseClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:795:1: elseClause : ELSE statement ;
        public final function elseClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ELSE180:Token=null;
            var statement181:ParserRuleReturnScope = null;


            var ELSE180_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:796:2: ( ELSE statement )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:796:4: ELSE statement
                {
                root_0 = LinkedListTree(adaptor.nil());

                ELSE180=Token(matchStream(input,ELSE,FOLLOW_ELSE_in_elseClause2580)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                ELSE180_tree = LinkedListTree(adaptor.create(ELSE180));
                root_0 = LinkedListTree(adaptor.becomeRoot(ELSE180_tree, root_0));
                }
                pushFollow(FOLLOW_statement_in_elseClause2583);
                statement181=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement181.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end elseClause

        // $ANTLR start condition
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:799:1: condition : LPAREN expression RPAREN -> ^( CONDITION expression ) ;
        public final function condition():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN182:Token=null;
            var RPAREN184:Token=null;
            var expression183:ParserRuleReturnScope = null;


            var LPAREN182_tree:LinkedListTree=null;
            var RPAREN184_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_expression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:800:2: ( LPAREN expression RPAREN -> ^( CONDITION expression ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:800:4: LPAREN expression RPAREN
                {
                LPAREN182=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_condition2594)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN182);

                pushFollow(FOLLOW_expression_in_condition2596);
                expression183=expression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_expression.add(expression183.tree);
                RPAREN184=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_condition2598)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN184);



                // AST REWRITE
                // elements: expression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 801:3: -> ^( CONDITION expression )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:801:6: ^( CONDITION expression )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(CONDITION, "CONDITION")), root_1));

                    adaptor.addChild(root_1, stream_expression.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end condition

        // $ANTLR start forEachStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:808:1: forEachStatement : f= FOR EACH LPAREN forInClause RPAREN statement -> ^( FOR_EACH[$f] forInClause statement ) ;
        public final function forEachStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var f:Token=null;
            var EACH185:Token=null;
            var LPAREN186:Token=null;
            var RPAREN188:Token=null;
            var forInClause187:ParserRuleReturnScope = null;

            var statement189:ParserRuleReturnScope = null;


            var f_tree:LinkedListTree=null;
            var EACH185_tree:LinkedListTree=null;
            var LPAREN186_tree:LinkedListTree=null;
            var RPAREN188_tree:LinkedListTree=null;
            var stream_FOR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FOR");
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_EACH:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token EACH");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_statement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule statement");
            var stream_forInClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule forInClause");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:809:2: (f= FOR EACH LPAREN forInClause RPAREN statement -> ^( FOR_EACH[$f] forInClause statement ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:809:4: f= FOR EACH LPAREN forInClause RPAREN statement
                {
                f=Token(matchStream(input,FOR,FOLLOW_FOR_in_forEachStatement2627)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FOR.add(f);

                EACH185=Token(matchStream(input,EACH,FOLLOW_EACH_in_forEachStatement2629)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_EACH.add(EACH185);

                LPAREN186=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_forEachStatement2631)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN186);

                pushFollow(FOLLOW_forInClause_in_forEachStatement2633);
                forInClause187=forInClause();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_forInClause.add(forInClause187.tree);
                RPAREN188=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_forEachStatement2635)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN188);

                pushFollow(FOLLOW_statement_in_forEachStatement2639);
                statement189=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_statement.add(statement189.tree);


                // AST REWRITE
                // elements: statement, forInClause
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 811:3: -> ^( FOR_EACH[$f] forInClause statement )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:811:6: ^( FOR_EACH[$f] forInClause statement )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FOR_EACH, f)), root_1));

                    adaptor.addChild(root_1, stream_forInClause.nextTree());
                    adaptor.addChild(root_1, stream_statement.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end forEachStatement

        // $ANTLR start forStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:818:1: forStatement : f= FOR LPAREN ( ( forInClauseDecl IN )=> forInClause RPAREN statement -> ^( FOR_IN[$f] forInClause statement ) | traditionalForClause RPAREN statement -> ^( $f traditionalForClause statement ) ) ;
        public final function forStatement():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var f:Token=null;
            var LPAREN190:Token=null;
            var RPAREN192:Token=null;
            var RPAREN195:Token=null;
            var forInClause191:ParserRuleReturnScope = null;

            var statement193:ParserRuleReturnScope = null;

            var traditionalForClause194:ParserRuleReturnScope = null;

            var statement196:ParserRuleReturnScope = null;


            var f_tree:LinkedListTree=null;
            var LPAREN190_tree:LinkedListTree=null;
            var RPAREN192_tree:LinkedListTree=null;
            var RPAREN195_tree:LinkedListTree=null;
            var stream_FOR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FOR");
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_statement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule statement");
            var stream_traditionalForClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule traditionalForClause");
            var stream_forInClause:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule forInClause");

            	InOperator_stack[InOperator_stack.length-1].allowed = false;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:823:2: (f= FOR LPAREN ( ( forInClauseDecl IN )=> forInClause RPAREN statement -> ^( FOR_IN[$f] forInClause statement ) | traditionalForClause RPAREN statement -> ^( $f traditionalForClause statement ) ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:823:4: f= FOR LPAREN ( ( forInClauseDecl IN )=> forInClause RPAREN statement -> ^( FOR_IN[$f] forInClause statement ) | traditionalForClause RPAREN statement -> ^( $f traditionalForClause statement ) )
                {
                f=Token(matchStream(input,FOR,FOLLOW_FOR_in_forStatement2681)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FOR.add(f);

                LPAREN190=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_forStatement2683)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN190);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:824:3: ( ( forInClauseDecl IN )=> forInClause RPAREN statement -> ^( FOR_IN[$f] forInClause statement ) | traditionalForClause RPAREN statement -> ^( $f traditionalForClause statement ) )
                var alt43:int=2;
                alt43 = dfa43.predict(input);
                switch (alt43) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:825:4: ( forInClauseDecl IN )=> forInClause RPAREN statement
                        {
                        pushFollow(FOLLOW_forInClause_in_forStatement2698);
                        forInClause191=forInClause();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_forInClause.add(forInClause191.tree);
                        RPAREN192=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_forStatement2700)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN192);

                        pushFollow(FOLLOW_statement_in_forStatement2702);
                        statement193=statement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_statement.add(statement193.tree);


                        // AST REWRITE
                        // elements: forInClause, statement
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 826:4: -> ^( FOR_IN[$f] forInClause statement )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:826:7: ^( FOR_IN[$f] forInClause statement )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FOR_IN, f)), root_1));

                            adaptor.addChild(root_1, stream_forInClause.nextTree());
                            adaptor.addChild(root_1, stream_statement.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:828:4: traditionalForClause RPAREN statement
                        {
                        pushFollow(FOLLOW_traditionalForClause_in_forStatement2728);
                        traditionalForClause194=traditionalForClause();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_traditionalForClause.add(traditionalForClause194.tree);
                        RPAREN195=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_forStatement2730)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN195);

                        pushFollow(FOLLOW_statement_in_forStatement2732);
                        statement196=statement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_statement.add(statement196.tree);


                        // AST REWRITE
                        // elements: f, traditionalForClause, statement
                        // token labels: f
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_f:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token f",f);
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 829:4: -> ^( $f traditionalForClause statement )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:829:7: ^( $f traditionalForClause statement )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_f.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_traditionalForClause.nextTree());
                            adaptor.addChild(root_1, stream_statement.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forStatement

        // $ANTLR start traditionalForClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:833:1: traditionalForClause : a= forInit SEMI b= forCond SEMI c= forIter ;
        public final function traditionalForClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SEMI197:Token=null;
            var SEMI198:Token=null;
            var a:ParserRuleReturnScope = null;

            var b:ParserRuleReturnScope = null;

            var c:ParserRuleReturnScope = null;


            var SEMI197_tree:LinkedListTree=null;
            var SEMI198_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:834:2: (a= forInit SEMI b= forCond SEMI c= forIter )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:834:4: a= forInit SEMI b= forCond SEMI c= forIter
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_forInit_in_traditionalForClause2765);
                a=forInit();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, a.tree);
                if ( this.state.backtracking==0 ) {
                  placeholder((a!=null?LinkedListTree(a.tree):null));
                }
                SEMI197=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_traditionalForClause2769)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_forCond_in_traditionalForClause2777);
                b=forCond();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, b.tree);
                if ( this.state.backtracking==0 ) {
                  placeholder((b!=null?LinkedListTree(b.tree):null));
                }
                SEMI198=Token(matchStream(input,SEMI,FOLLOW_SEMI_in_traditionalForClause2781)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_forIter_in_traditionalForClause2789);
                c=forIter();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, c.tree);
                if ( this.state.backtracking==0 ) {
                  placeholder((c!=null?LinkedListTree(c.tree):null));
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end traditionalForClause

        // $ANTLR start forInClause
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:839:1: forInClause : forInClauseDecl IN forInClauseTail ;
        public final function forInClause():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IN200:Token=null;
            var forInClauseDecl199:ParserRuleReturnScope = null;

            var forInClauseTail201:ParserRuleReturnScope = null;


            var IN200_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:840:2: ( forInClauseDecl IN forInClauseTail )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:840:4: forInClauseDecl IN forInClauseTail
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_forInClauseDecl_in_forInClause2803);
                forInClauseDecl199=forInClauseDecl();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, forInClauseDecl199.tree);
                IN200=Token(matchStream(input,IN,FOLLOW_IN_in_forInClause2805)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_forInClauseTail_in_forInClause2808);
                forInClauseTail201=forInClauseTail();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, forInClauseTail201.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end forInClause

        // $ANTLR start forInClauseDecl
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:843:1: forInClauseDecl : ( declaration | ident );
        public final function forInClauseDecl():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var declaration202:ParserRuleReturnScope = null;

            var ident203:ParserRuleReturnScope = null;




            	InOperator_stack[InOperator_stack.length-1].allowed = false;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:848:2: ( declaration | ident )
                var alt44:int=2;
                switch ( input.LA(1) ) {
                case NAMESPACE:
                    {
                    var LA44_1:int = input.LA(2);

                    if ( (LA44_1==79||(LA44_1>=89 && LA44_1<=90)||LA44_1==94||(LA44_1>=108 && LA44_1<=109)||(LA44_1>=134 && LA44_1<=135)) ) {
                        alt44=1;
                    }
                    else if ( (LA44_1==116) ) {
                        alt44=2;
                    }
                    else {
                        if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                        throw new NoViableAltException("", 44, 1, input);

                    }
                    }
                    break;
                case IDENT:
                case USE:
                case DYNAMIC:
                case GET:
                case SET:
                case IS:
                case AS:
                    {
                    alt44=2;
                    }
                    break;
                case VAR:
                case CONST:
                    {
                    alt44=1;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 44, 0, input);

                }

                switch (alt44) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:848:4: declaration
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_declaration_in_forInClauseDecl2829);
                        declaration202=declaration();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, declaration202.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:848:18: ident
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_ident_in_forInClauseDecl2833);
                        ident203=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, ident203.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forInClauseDecl

        // $ANTLR start forInClauseTail
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:852:1: forInClauseTail : expressionList ;
        public final function forInClauseTail():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var expressionList204:ParserRuleReturnScope = null;




            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:857:2: ( expressionList )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:857:4: expressionList
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_expressionList_in_forInClauseTail2855);
                expressionList204=expressionList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expressionList204.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forInClauseTail

        // $ANTLR start forInit
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:861:1: forInit : ( declaration | expressionList )? -> ^( FOR_INIT ( declaration )? ( expressionList )? ) ;
        public final function forInit():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var declaration205:ParserRuleReturnScope = null;

            var expressionList206:ParserRuleReturnScope = null;


            var stream_declaration:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule declaration");
            var stream_expressionList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expressionList");

            	InOperator_stack[InOperator_stack.length-1].allowed = false;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:866:2: ( ( declaration | expressionList )? -> ^( FOR_INIT ( declaration )? ( expressionList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:866:4: ( declaration | expressionList )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:866:4: ( declaration | expressionList )?
                var alt45:int=3;
                switch ( input.LA(1) ) {
                    case NAMESPACE:
                        {
                        switch ( input.LA(2) ) {
                            case IDENT:
                            case USE:
                            case NAMESPACE:
                            case DYNAMIC:
                            case GET:
                            case SET:
                                {
                                alt45=1;
                                }
                                break;
                            case IS:
                                {
                                var LA45_5:int = input.LA(3);

                                if ( (LA45_5==78||LA45_5==84||LA45_5==86||LA45_5==123) ) {
                                    alt45=1;
                                }
                                else if ( (LA45_5==76||LA45_5==79||LA45_5==81||LA45_5==83||LA45_5==88||LA45_5==90||(LA45_5>=94 && LA45_5<=95)||LA45_5==97||(LA45_5>=101 && LA45_5<=102)||(LA45_5>=107 && LA45_5<=109)||LA45_5==115||LA45_5==131||(LA45_5>=160 && LA45_5<=161)||(LA45_5>=164 && LA45_5<=169)||(LA45_5>=171 && LA45_5<=183)||LA45_5==185) ) {
                                    alt45=2;
                                }
                                }
                                break;
                            case AS:
                                {
                                var LA45_6:int = input.LA(3);

                                if ( (LA45_6==78||LA45_6==84||LA45_6==86||LA45_6==123) ) {
                                    alt45=1;
                                }
                                else if ( (LA45_6==76||LA45_6==79||LA45_6==81||LA45_6==83||LA45_6==88||LA45_6==90||(LA45_6>=94 && LA45_6<=95)||LA45_6==97||(LA45_6>=101 && LA45_6<=102)||(LA45_6>=107 && LA45_6<=109)||LA45_6==115||LA45_6==131||(LA45_6>=160 && LA45_6<=161)||(LA45_6>=164 && LA45_6<=169)||(LA45_6>=171 && LA45_6<=183)||LA45_6==185) ) {
                                    alt45=2;
                                }
                                }
                                break;
                            case SEMI:
                            case DBL_COLON:
                            case LBRACK:
                            case LPAREN:
                            case COMMA:
                            case ASSIGN:
                            case DOT:
                            case STAR:
                            case IN:
                            case POST:
                            case GT:
                            case DIV_ASSIGN:
                            case MOD_ASSIGN:
                            case PLUS_ASSIGN:
                            case MINUS_ASSIGN:
                            case SL_ASSIGN:
                            case BAND_ASSIGN:
                            case BXOR_ASSIGN:
                            case BOR_ASSIGN:
                            case LAND_ASSIGN:
                            case LOR_ASSIGN:
                            case QUESTION:
                            case LOR:
                            case LAND:
                            case BOR:
                            case BXOR:
                            case BAND:
                            case STRICT_EQUAL:
                            case STRICT_NOT_EQUAL:
                            case NOT_EQUAL:
                            case EQUAL:
                            case LT:
                            case LE:
                            case INSTANCEOF:
                            case SL:
                            case PLUS:
                            case MINUS:
                            case DIV:
                            case MOD:
                            case INC:
                            case DEC:
                            case E4X_DESC:
                                {
                                alt45=2;
                                }
                                break;
                        }

                        }
                        break;
                    case LBRACE:
                    case IDENT:
                    case LBRACK:
                    case LPAREN:
                    case STRING_LITERAL:
                    case DYNAMIC:
                    case FINAL:
                    case OVERRIDE:
                    case STATIC:
                    case NATIVE:
                    case FUNCTION:
                    case GET:
                    case SET:
                    case EACH:
                    case VOID:
                    case PLUS:
                    case MINUS:
                    case INC:
                    case DEC:
                    case DELETE:
                    case TYPEOF:
                    case LNOT:
                    case BNOT:
                    case UNDEFINED:
                    case THIS:
                    case SUPER:
                    case NEW:
                    case NULL:
                    case FALSE:
                    case TRUE:
                    case XML_LITERAL:
                    case REGEXP_LITERAL:
                    case HEX_LITERAL:
                    case DECIMAL_LITERAL:
                    case OCTAL_LITERAL:
                    case FLOAT_LITERAL:
                    case E4X_ATTRI:
                        {
                        alt45=2;
                        }
                        break;
                    case VAR:
                    case CONST:
                        {
                        alt45=1;
                        }
                        break;
                }

                switch (alt45) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:866:6: declaration
                        {
                        pushFollow(FOLLOW_declaration_in_forInit2880);
                        declaration205=declaration();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_declaration.add(declaration205.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:866:20: expressionList
                        {
                        pushFollow(FOLLOW_expressionList_in_forInit2884);
                        expressionList206=expressionList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_expressionList.add(expressionList206.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: expressionList, declaration
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 867:3: -> ^( FOR_INIT ( declaration )? ( expressionList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:867:6: ^( FOR_INIT ( declaration )? ( expressionList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FOR_INIT, "FOR_INIT")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:867:18: ( declaration )?
                    if ( stream_declaration.hasNext ) {
                        adaptor.addChild(root_1, stream_declaration.nextTree());

                    }
                    stream_declaration.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:867:31: ( expressionList )?
                    if ( stream_expressionList.hasNext ) {
                        adaptor.addChild(root_1, stream_expressionList.nextTree());

                    }
                    stream_expressionList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forInit

        // $ANTLR start forCond
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:870:1: forCond : ( expressionList )? -> ^( FOR_CONDITION ( expressionList )? ) ;
        public final function forCond():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var expressionList207:ParserRuleReturnScope = null;


            var stream_expressionList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expressionList");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:875:2: ( ( expressionList )? -> ^( FOR_CONDITION ( expressionList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:875:4: ( expressionList )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:875:4: ( expressionList )?
                var alt46:int=2;
                var LA46_0:int = input.LA(1);

                if ( (LA46_0==76||LA46_0==79||LA46_0==81||LA46_0==83||LA46_0==88||LA46_0==90||(LA46_0>=94 && LA46_0<=95)||LA46_0==97||(LA46_0>=101 && LA46_0<=102)||(LA46_0>=107 && LA46_0<=109)||LA46_0==115||LA46_0==131||(LA46_0>=160 && LA46_0<=161)||(LA46_0>=164 && LA46_0<=169)||(LA46_0>=171 && LA46_0<=183)||LA46_0==185) ) {
                    alt46=1;
                }
                switch (alt46) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:875:4: expressionList
                        {
                        pushFollow(FOLLOW_expressionList_in_forCond2924);
                        expressionList207=expressionList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_expressionList.add(expressionList207.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: expressionList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 876:3: -> ^( FOR_CONDITION ( expressionList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:876:6: ^( FOR_CONDITION ( expressionList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FOR_CONDITION, "FOR_CONDITION")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:876:23: ( expressionList )?
                    if ( stream_expressionList.hasNext ) {
                        adaptor.addChild(root_1, stream_expressionList.nextTree());

                    }
                    stream_expressionList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forCond

        // $ANTLR start forIter
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:879:1: forIter : ( expressionList )? -> ^( FOR_ITERATOR ( expressionList )? ) ;
        public final function forIter():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var expressionList208:ParserRuleReturnScope = null;


            var stream_expressionList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expressionList");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:884:2: ( ( expressionList )? -> ^( FOR_ITERATOR ( expressionList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:884:4: ( expressionList )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:884:4: ( expressionList )?
                var alt47:int=2;
                var LA47_0:int = input.LA(1);

                if ( (LA47_0==76||LA47_0==79||LA47_0==81||LA47_0==83||LA47_0==88||LA47_0==90||(LA47_0>=94 && LA47_0<=95)||LA47_0==97||(LA47_0>=101 && LA47_0<=102)||(LA47_0>=107 && LA47_0<=109)||LA47_0==115||LA47_0==131||(LA47_0>=160 && LA47_0<=161)||(LA47_0>=164 && LA47_0<=169)||(LA47_0>=171 && LA47_0<=183)||LA47_0==185) ) {
                    alt47=1;
                }
                switch (alt47) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:884:4: expressionList
                        {
                        pushFollow(FOLLOW_expressionList_in_forIter2959);
                        expressionList208=expressionList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_expressionList.add(expressionList208.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: expressionList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 885:3: -> ^( FOR_ITERATOR ( expressionList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:885:6: ^( FOR_ITERATOR ( expressionList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FOR_ITERATOR, "FOR_ITERATOR")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:885:22: ( expressionList )?
                    if ( stream_expressionList.hasNext ) {
                        adaptor.addChild(root_1, stream_expressionList.nextTree());

                    }
                    stream_expressionList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end forIter

        // $ANTLR start throwStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:892:1: throwStatement : THROW expression semi ;
        public final function throwStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var THROW209:Token=null;
            var expression210:ParserRuleReturnScope = null;

            var semi211:ParserRuleReturnScope = null;


            var THROW209_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:893:2: ( THROW expression semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:893:4: THROW expression semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                THROW209=Token(matchStream(input,THROW,FOLLOW_THROW_in_throwStatement2988)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                THROW209_tree = LinkedListTree(adaptor.create(THROW209));
                root_0 = LinkedListTree(adaptor.becomeRoot(THROW209_tree, root_0));
                }
                pushFollow(FOLLOW_expression_in_throwStatement2991);
                expression210=expression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expression210.tree);
                pushFollow(FOLLOW_semi_in_throwStatement2993);
                semi211=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end throwStatement

        // $ANTLR start tryStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:896:1: tryStatement : TRY block ( finallyBlock | ( catchBlock )+ ( finallyBlock )? ) -> ^( TRY block ( catchBlock )* ( finallyBlock )? ) ;
        public final function tryStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var TRY212:Token=null;
            var block213:ParserRuleReturnScope = null;

            var finallyBlock214:ParserRuleReturnScope = null;

            var catchBlock215:ParserRuleReturnScope = null;

            var finallyBlock216:ParserRuleReturnScope = null;


            var TRY212_tree:LinkedListTree=null;
            var stream_TRY:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token TRY");
            var stream_catchBlock:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule catchBlock");
            var stream_block:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule block");
            var stream_finallyBlock:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule finallyBlock");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:897:2: ( TRY block ( finallyBlock | ( catchBlock )+ ( finallyBlock )? ) -> ^( TRY block ( catchBlock )* ( finallyBlock )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:897:4: TRY block ( finallyBlock | ( catchBlock )+ ( finallyBlock )? )
                {
                TRY212=Token(matchStream(input,TRY,FOLLOW_TRY_in_tryStatement3005)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_TRY.add(TRY212);

                pushFollow(FOLLOW_block_in_tryStatement3009);
                block213=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_block.add(block213.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:899:2: ( finallyBlock | ( catchBlock )+ ( finallyBlock )? )
                var alt50:int=2;
                var LA50_0:int = input.LA(1);

                if ( (LA50_0==120) ) {
                    alt50=1;
                }
                else if ( (LA50_0==119) ) {
                    alt50=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 50, 0, input);

                }
                switch (alt50) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:899:4: finallyBlock
                        {
                        pushFollow(FOLLOW_finallyBlock_in_tryStatement3014);
                        finallyBlock214=finallyBlock();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_finallyBlock.add(finallyBlock214.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:900:4: ( catchBlock )+ ( finallyBlock )?
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:900:4: ( catchBlock )+
                        var cnt48:int=0;
                        loop48:
                        do {
                            var alt48:int=2;
                            var LA48_0:int = input.LA(1);

                            if ( (LA48_0==119) ) {
                                alt48=1;
                            }


                            switch (alt48) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:900:4: catchBlock
                        	    {
                        	    pushFollow(FOLLOW_catchBlock_in_tryStatement3019);
                        	    catchBlock215=catchBlock();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) stream_catchBlock.add(catchBlock215.tree);

                        	    }
                        	    break;

                        	default :
                        	    if ( cnt48 >= 1 ) break loop48;
                        	    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                                    throw new EarlyExitException(48, input);

                            }
                            cnt48++;
                        } while (true);

                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:901:3: ( finallyBlock )?
                        var alt49:int=2;
                        var LA49_0:int = input.LA(1);

                        if ( (LA49_0==120) ) {
                            alt49=1;
                        }
                        switch (alt49) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:901:3: finallyBlock
                                {
                                pushFollow(FOLLOW_finallyBlock_in_tryStatement3024);
                                finallyBlock216=finallyBlock();

                                state._fsp = state._fsp - 1;
                                if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) stream_finallyBlock.add(finallyBlock216.tree);

                                }
                                break;

                        }


                        }
                        break;

                }



                // AST REWRITE
                // elements: catchBlock, finallyBlock, block, TRY
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 903:3: -> ^( TRY block ( catchBlock )* ( finallyBlock )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:903:6: ^( TRY block ( catchBlock )* ( finallyBlock )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(stream_TRY.nextNode(), root_1));

                    adaptor.addChild(root_1, stream_block.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:903:19: ( catchBlock )*
                    while ( stream_catchBlock.hasNext ) {
                        adaptor.addChild(root_1, stream_catchBlock.nextTree());

                    }
                    stream_catchBlock.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:903:31: ( finallyBlock )?
                    if ( stream_finallyBlock.hasNext ) {
                        adaptor.addChild(root_1, stream_finallyBlock.nextTree());

                    }
                    stream_finallyBlock.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end tryStatement

        // $ANTLR start catchBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:906:1: catchBlock : CATCH LPAREN ident ( typeExpression )? RPAREN block -> ^( CATCH ident ( typeExpression )? block ) ;
        public final function catchBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var CATCH217:Token=null;
            var LPAREN218:Token=null;
            var RPAREN221:Token=null;
            var ident219:ParserRuleReturnScope = null;

            var typeExpression220:ParserRuleReturnScope = null;

            var block222:ParserRuleReturnScope = null;


            var CATCH217_tree:LinkedListTree=null;
            var LPAREN218_tree:LinkedListTree=null;
            var RPAREN221_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_CATCH:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token CATCH");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_block:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule block");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:907:2: ( CATCH LPAREN ident ( typeExpression )? RPAREN block -> ^( CATCH ident ( typeExpression )? block ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:907:4: CATCH LPAREN ident ( typeExpression )? RPAREN block
                {
                CATCH217=Token(matchStream(input,CATCH,FOLLOW_CATCH_in_catchBlock3057)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_CATCH.add(CATCH217);

                LPAREN218=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_catchBlock3059)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN218);

                pushFollow(FOLLOW_ident_in_catchBlock3061);
                ident219=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident219.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:907:23: ( typeExpression )?
                var alt51:int=2;
                var LA51_0:int = input.LA(1);

                if ( (LA51_0==123) ) {
                    alt51=1;
                }
                switch (alt51) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:907:23: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_catchBlock3063);
                        typeExpression220=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression220.tree);

                        }
                        break;

                }

                RPAREN221=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_catchBlock3066)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN221);

                pushFollow(FOLLOW_block_in_catchBlock3070);
                block222=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_block.add(block222.tree);


                // AST REWRITE
                // elements: typeExpression, CATCH, block, ident
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 909:3: -> ^( CATCH ident ( typeExpression )? block )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:909:6: ^( CATCH ident ( typeExpression )? block )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(stream_CATCH.nextNode(), root_1));

                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:909:21: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();
                    adaptor.addChild(root_1, stream_block.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end catchBlock

        // $ANTLR start finallyBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:912:1: finallyBlock : FINALLY block ;
        public final function finallyBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var FINALLY223:Token=null;
            var block224:ParserRuleReturnScope = null;


            var FINALLY223_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:913:2: ( FINALLY block )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:913:4: FINALLY block
                {
                root_0 = LinkedListTree(adaptor.nil());

                FINALLY223=Token(matchStream(input,FINALLY,FOLLOW_FINALLY_in_finallyBlock3098)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                FINALLY223_tree = LinkedListTree(adaptor.create(FINALLY223));
                root_0 = LinkedListTree(adaptor.becomeRoot(FINALLY223_tree, root_0));
                }
                pushFollow(FOLLOW_block_in_finallyBlock3101);
                block224=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, block224.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end finallyBlock

        // $ANTLR start switchStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:920:1: switchStatement : SWITCH condition switchBlock ;
        public final function switchStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SWITCH225:Token=null;
            var condition226:ParserRuleReturnScope = null;

            var switchBlock227:ParserRuleReturnScope = null;


            var SWITCH225_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:921:2: ( SWITCH condition switchBlock )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:921:4: SWITCH condition switchBlock
                {
                root_0 = LinkedListTree(adaptor.nil());

                SWITCH225=Token(matchStream(input,SWITCH,FOLLOW_SWITCH_in_switchStatement3116)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                SWITCH225_tree = LinkedListTree(adaptor.create(SWITCH225));
                root_0 = LinkedListTree(adaptor.becomeRoot(SWITCH225_tree, root_0));
                }
                pushFollow(FOLLOW_condition_in_switchStatement3119);
                condition226=condition();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, condition226.tree);
                pushFollow(FOLLOW_switchBlock_in_switchStatement3123);
                switchBlock227=switchBlock();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, switchBlock227.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end switchStatement

        // $ANTLR start switchBlock
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:925:1: switchBlock : LBRACE ( caseStatement )* ( defaultStatement )? RBRACE -> ^( BLOCK ( caseStatement )* ( defaultStatement )? ) ;
        public final function switchBlock():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE228:Token=null;
            var RBRACE231:Token=null;
            var caseStatement229:ParserRuleReturnScope = null;

            var defaultStatement230:ParserRuleReturnScope = null;


            var LBRACE228_tree:LinkedListTree=null;
            var RBRACE231_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_caseStatement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule caseStatement");
            var stream_defaultStatement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule defaultStatement");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:926:2: ( LBRACE ( caseStatement )* ( defaultStatement )? RBRACE -> ^( BLOCK ( caseStatement )* ( defaultStatement )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:926:4: LBRACE ( caseStatement )* ( defaultStatement )? RBRACE
                {
                LBRACE228=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_switchBlock3134)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE228);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:927:3: ( caseStatement )*
                loop52:
                do {
                    var alt52:int=2;
                    var LA52_0:int = input.LA(1);

                    if ( (LA52_0==122) ) {
                        alt52=1;
                    }


                    switch (alt52) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:927:5: caseStatement
                	    {
                	    pushFollow(FOLLOW_caseStatement_in_switchBlock3140);
                	    caseStatement229=caseStatement();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_caseStatement.add(caseStatement229.tree);

                	    }
                	    break;

                	default :
                	    break loop52;
                    }
                } while (true);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:928:3: ( defaultStatement )?
                var alt53:int=2;
                var LA53_0:int = input.LA(1);

                if ( (LA53_0==124) ) {
                    alt53=1;
                }
                switch (alt53) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:928:5: defaultStatement
                        {
                        pushFollow(FOLLOW_defaultStatement_in_switchBlock3149);
                        defaultStatement230=defaultStatement();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_defaultStatement.add(defaultStatement230.tree);

                        }
                        break;

                }

                RBRACE231=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_switchBlock3156)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE231);



                // AST REWRITE
                // elements: defaultStatement, caseStatement
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 930:3: -> ^( BLOCK ( caseStatement )* ( defaultStatement )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:930:6: ^( BLOCK ( caseStatement )* ( defaultStatement )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(BLOCK, "BLOCK")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:930:15: ( caseStatement )*
                    while ( stream_caseStatement.hasNext ) {
                        adaptor.addChild(root_1, stream_caseStatement.nextTree());

                    }
                    stream_caseStatement.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:930:30: ( defaultStatement )?
                    if ( stream_defaultStatement.hasNext ) {
                        adaptor.addChild(root_1, stream_defaultStatement.nextTree());

                    }
                    stream_defaultStatement.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end switchBlock

        // $ANTLR start caseStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:933:1: caseStatement : CASE expression COLON l= switchStatementList ;
        public final function caseStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var CASE232:Token=null;
            var COLON234:Token=null;
            var l:ParserRuleReturnScope = null;

            var expression233:ParserRuleReturnScope = null;


            var CASE232_tree:LinkedListTree=null;
            var COLON234_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:934:2: ( CASE expression COLON l= switchStatementList )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:934:4: CASE expression COLON l= switchStatementList
                {
                root_0 = LinkedListTree(adaptor.nil());

                CASE232=Token(matchStream(input,CASE,FOLLOW_CASE_in_caseStatement3183)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                CASE232_tree = LinkedListTree(adaptor.create(CASE232));
                root_0 = LinkedListTree(adaptor.becomeRoot(CASE232_tree, root_0));
                }
                pushFollow(FOLLOW_expression_in_caseStatement3186);
                expression233=expression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expression233.tree);
                COLON234=Token(matchStream(input,COLON,FOLLOW_COLON_in_caseStatement3188)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_switchStatementList_in_caseStatement3193);
                l=switchStatementList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, l.tree);
                if ( this.state.backtracking==0 ) {
                   placeholder((l!=null?LinkedListTree(l.tree):null)); 
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end caseStatement

        // $ANTLR start defaultStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:937:1: defaultStatement : DEFAULT COLON l= switchStatementList ;
        public final function defaultStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var DEFAULT235:Token=null;
            var COLON236:Token=null;
            var l:ParserRuleReturnScope = null;


            var DEFAULT235_tree:LinkedListTree=null;
            var COLON236_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:938:2: ( DEFAULT COLON l= switchStatementList )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:938:4: DEFAULT COLON l= switchStatementList
                {
                root_0 = LinkedListTree(adaptor.nil());

                DEFAULT235=Token(matchStream(input,DEFAULT,FOLLOW_DEFAULT_in_defaultStatement3207)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                DEFAULT235_tree = LinkedListTree(adaptor.create(DEFAULT235));
                root_0 = LinkedListTree(adaptor.becomeRoot(DEFAULT235_tree, root_0));
                }
                COLON236=Token(matchStream(input,COLON,FOLLOW_COLON_in_defaultStatement3210)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_switchStatementList_in_defaultStatement3215);
                l=switchStatementList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, l.tree);
                if ( this.state.backtracking==0 ) {
                   placeholder((l!=null?LinkedListTree(l.tree):null)); 
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end defaultStatement

        // $ANTLR start switchStatementList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:941:1: switchStatementList : ( statement )* -> ^( SWITCH_STATEMENT_LIST ( statement )* ) ;
        public final function switchStatementList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var statement237:ParserRuleReturnScope = null;


            var stream_statement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule statement");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:2: ( ( statement )* -> ^( SWITCH_STATEMENT_LIST ( statement )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:4: ( statement )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:4: ( statement )*
                loop54:
                do {
                    var alt54:int=2;
                    var LA54_0:int = input.LA(1);

                    if ( (LA54_0==124) ) {
                        var LA54_1:int = input.LA(2);

                        if ( (LA54_1==79) ) {
                            alt54=1;
                        }


                    }
                    else if ( (LA54_0==76||(LA54_0>=78 && LA54_0<=79)||LA54_0==81||LA54_0==83||(LA54_0>=87 && LA54_0<=91)||(LA54_0>=94 && LA54_0<=95)||LA54_0==97||(LA54_0>=101 && LA54_0<=102)||(LA54_0>=107 && LA54_0<=112)||(LA54_0>=114 && LA54_0<=115)||(LA54_0>=117 && LA54_0<=118)||LA54_0==121||(LA54_0>=125 && LA54_0<=131)||(LA54_0>=160 && LA54_0<=161)||(LA54_0>=164 && LA54_0<=169)||(LA54_0>=171 && LA54_0<=183)||LA54_0==185) ) {
                        alt54=1;
                    }


                    switch (alt54) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:4: statement
                	    {
                	    pushFollow(FOLLOW_statement_in_switchStatementList3228);
                	    statement237=statement();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_statement.add(statement237.tree);

                	    }
                	    break;

                	default :
                	    break loop54;
                    }
                } while (true);



                // AST REWRITE
                // elements: statement
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 942:15: -> ^( SWITCH_STATEMENT_LIST ( statement )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:18: ^( SWITCH_STATEMENT_LIST ( statement )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(SWITCH_STATEMENT_LIST, "SWITCH_STATEMENT_LIST")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:942:43: ( statement )*
                    while ( stream_statement.hasNext ) {
                        adaptor.addChild(root_1, stream_statement.nextTree());

                    }
                    stream_statement.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end switchStatementList

        // $ANTLR start whileStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:949:1: whileStatement : WHILE condition statement ;
        public final function whileStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var WHILE238:Token=null;
            var condition239:ParserRuleReturnScope = null;

            var statement240:ParserRuleReturnScope = null;


            var WHILE238_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:950:2: ( WHILE condition statement )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:950:4: WHILE condition statement
                {
                root_0 = LinkedListTree(adaptor.nil());

                WHILE238=Token(matchStream(input,WHILE,FOLLOW_WHILE_in_whileStatement3255)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                WHILE238_tree = LinkedListTree(adaptor.create(WHILE238));
                root_0 = LinkedListTree(adaptor.becomeRoot(WHILE238_tree, root_0));
                }
                pushFollow(FOLLOW_condition_in_whileStatement3258);
                condition239=condition();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, condition239.tree);
                pushFollow(FOLLOW_statement_in_whileStatement3260);
                statement240=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement240.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end whileStatement

        // $ANTLR start doWhileStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:953:1: doWhileStatement : DO statement WHILE condition semi ;
        public final function doWhileStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var DO241:Token=null;
            var WHILE243:Token=null;
            var statement242:ParserRuleReturnScope = null;

            var condition244:ParserRuleReturnScope = null;

            var semi245:ParserRuleReturnScope = null;


            var DO241_tree:LinkedListTree=null;
            var WHILE243_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:954:2: ( DO statement WHILE condition semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:954:4: DO statement WHILE condition semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                DO241=Token(matchStream(input,DO,FOLLOW_DO_in_doWhileStatement3271)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                DO241_tree = LinkedListTree(adaptor.create(DO241));
                root_0 = LinkedListTree(adaptor.becomeRoot(DO241_tree, root_0));
                }
                pushFollow(FOLLOW_statement_in_doWhileStatement3274);
                statement242=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement242.tree);
                WHILE243=Token(matchStream(input,WHILE,FOLLOW_WHILE_in_doWhileStatement3276)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_condition_in_doWhileStatement3279);
                condition244=condition();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, condition244.tree);
                pushFollow(FOLLOW_semi_in_doWhileStatement3281);
                semi245=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi245.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end doWhileStatement

        // $ANTLR start withStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:961:1: withStatement : WITH condition statement ;
        public final function withStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var WITH246:Token=null;
            var condition247:ParserRuleReturnScope = null;

            var statement248:ParserRuleReturnScope = null;


            var WITH246_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:962:2: ( WITH condition statement )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:962:4: WITH condition statement
                {
                root_0 = LinkedListTree(adaptor.nil());

                WITH246=Token(matchStream(input,WITH,FOLLOW_WITH_in_withStatement3296)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                WITH246_tree = LinkedListTree(adaptor.create(WITH246));
                root_0 = LinkedListTree(adaptor.becomeRoot(WITH246_tree, root_0));
                }
                pushFollow(FOLLOW_condition_in_withStatement3299);
                condition247=condition();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, condition247.tree);
                pushFollow(FOLLOW_statement_in_withStatement3301);
                statement248=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, statement248.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end withStatement

        // $ANTLR start labelStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:969:1: labelStatement : IDENT COLON statement -> ^( LABEL_STMNT IDENT statement ) ;
        public final function labelStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT249:Token=null;
            var COLON250:Token=null;
            var statement251:ParserRuleReturnScope = null;


            var IDENT249_tree:LinkedListTree=null;
            var COLON250_tree:LinkedListTree=null;
            var stream_COLON:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COLON");
            var stream_IDENT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token IDENT");
            var stream_statement:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule statement");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:970:2: ( IDENT COLON statement -> ^( LABEL_STMNT IDENT statement ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:970:4: IDENT COLON statement
                {
                IDENT249=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_labelStatement3316)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_IDENT.add(IDENT249);

                COLON250=Token(matchStream(input,COLON,FOLLOW_COLON_in_labelStatement3318)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_COLON.add(COLON250);

                pushFollow(FOLLOW_statement_in_labelStatement3320);
                statement251=statement();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_statement.add(statement251.tree);


                // AST REWRITE
                // elements: IDENT, statement
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 971:3: -> ^( LABEL_STMNT IDENT statement )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:971:6: ^( LABEL_STMNT IDENT statement )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(LABEL_STMNT, "LABEL_STMNT")), root_1));

                    adaptor.addChild(root_1, stream_IDENT.nextNode());
                    adaptor.addChild(root_1, stream_statement.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end labelStatement

        // $ANTLR start returnStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:978:1: returnStatement : RETURN ( expression )? semi ;
        public final function returnStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var RETURN252:Token=null;
            var expression253:ParserRuleReturnScope = null;

            var semi254:ParserRuleReturnScope = null;


            var RETURN252_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:979:2: ( RETURN ( expression )? semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:979:4: RETURN ( expression )? semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                RETURN252=Token(matchStream(input,RETURN,FOLLOW_RETURN_in_returnStatement3349)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                RETURN252_tree = LinkedListTree(adaptor.create(RETURN252));
                root_0 = LinkedListTree(adaptor.becomeRoot(RETURN252_tree, root_0));
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:979:12: ( expression )?
                var alt55:int=2;
                var LA55_0:int = input.LA(1);

                if ( (LA55_0==76||LA55_0==79||LA55_0==81||LA55_0==83||LA55_0==88||LA55_0==90||(LA55_0>=94 && LA55_0<=95)||LA55_0==97||(LA55_0>=101 && LA55_0<=102)||(LA55_0>=107 && LA55_0<=109)||LA55_0==115||LA55_0==131||(LA55_0>=160 && LA55_0<=161)||(LA55_0>=164 && LA55_0<=169)||(LA55_0>=171 && LA55_0<=183)||LA55_0==185) ) {
                    alt55=1;
                }
                switch (alt55) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:979:12: expression
                        {
                        pushFollow(FOLLOW_expression_in_returnStatement3352);
                        expression253=expression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expression253.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_semi_in_returnStatement3355);
                semi254=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi254.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end returnStatement

        // $ANTLR start continueStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:982:1: continueStatement : CONTINUE ( ident )? semi ;
        public final function continueStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var CONTINUE255:Token=null;
            var ident256:ParserRuleReturnScope = null;

            var semi257:ParserRuleReturnScope = null;


            var CONTINUE255_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:983:2: ( CONTINUE ( ident )? semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:983:4: CONTINUE ( ident )? semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                CONTINUE255=Token(matchStream(input,CONTINUE,FOLLOW_CONTINUE_in_continueStatement3366)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                CONTINUE255_tree = LinkedListTree(adaptor.create(CONTINUE255));
                root_0 = LinkedListTree(adaptor.becomeRoot(CONTINUE255_tree, root_0));
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:983:14: ( ident )?
                var alt56:int=2;
                var LA56_0:int = input.LA(1);

                if ( (LA56_0==79||(LA56_0>=89 && LA56_0<=90)||LA56_0==94||(LA56_0>=108 && LA56_0<=109)||(LA56_0>=134 && LA56_0<=135)) ) {
                    alt56=1;
                }
                switch (alt56) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:983:14: ident
                        {
                        pushFollow(FOLLOW_ident_in_continueStatement3369);
                        ident256=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, ident256.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_semi_in_continueStatement3372);
                semi257=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi257.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end continueStatement

        // $ANTLR start breakStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:986:1: breakStatement : BREAK ( ident )? semi ;
        public final function breakStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var BREAK258:Token=null;
            var ident259:ParserRuleReturnScope = null;

            var semi260:ParserRuleReturnScope = null;


            var BREAK258_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:987:2: ( BREAK ( ident )? semi )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:987:4: BREAK ( ident )? semi
                {
                root_0 = LinkedListTree(adaptor.nil());

                BREAK258=Token(matchStream(input,BREAK,FOLLOW_BREAK_in_breakStatement3383)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                BREAK258_tree = LinkedListTree(adaptor.create(BREAK258));
                root_0 = LinkedListTree(adaptor.becomeRoot(BREAK258_tree, root_0));
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:987:11: ( ident )?
                var alt57:int=2;
                var LA57_0:int = input.LA(1);

                if ( (LA57_0==79||(LA57_0>=89 && LA57_0<=90)||LA57_0==94||(LA57_0>=108 && LA57_0<=109)||(LA57_0>=134 && LA57_0<=135)) ) {
                    alt57=1;
                }
                switch (alt57) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:987:11: ident
                        {
                        pushFollow(FOLLOW_ident_in_breakStatement3386);
                        ident259=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, ident259.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_semi_in_breakStatement3389);
                semi260=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, semi260.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end breakStatement

        // $ANTLR start defaultXMLNamespaceStatement
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:990:1: defaultXMLNamespaceStatement : DEFAULT xmlKeyword NAMESPACE ASSIGN expression semi -> ^( DEFAULT_XML_NAMESPACE expression ) ;
        public final function defaultXMLNamespaceStatement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var DEFAULT261:Token=null;
            var NAMESPACE263:Token=null;
            var ASSIGN264:Token=null;
            var xmlKeyword262:ParserRuleReturnScope = null;

            var expression265:ParserRuleReturnScope = null;

            var semi266:ParserRuleReturnScope = null;


            var DEFAULT261_tree:LinkedListTree=null;
            var NAMESPACE263_tree:LinkedListTree=null;
            var ASSIGN264_tree:LinkedListTree=null;
            var stream_NAMESPACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token NAMESPACE");
            var stream_DEFAULT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DEFAULT");
            var stream_ASSIGN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ASSIGN");
            var stream_expression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expression");
            var stream_semi:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule semi");
            var stream_xmlKeyword:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlKeyword");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:991:2: ( DEFAULT xmlKeyword NAMESPACE ASSIGN expression semi -> ^( DEFAULT_XML_NAMESPACE expression ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:991:4: DEFAULT xmlKeyword NAMESPACE ASSIGN expression semi
                {
                DEFAULT261=Token(matchStream(input,DEFAULT,FOLLOW_DEFAULT_in_defaultXMLNamespaceStatement3400)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_DEFAULT.add(DEFAULT261);

                pushFollow(FOLLOW_xmlKeyword_in_defaultXMLNamespaceStatement3402);
                xmlKeyword262=xmlKeyword();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_xmlKeyword.add(xmlKeyword262.tree);
                NAMESPACE263=Token(matchStream(input,NAMESPACE,FOLLOW_NAMESPACE_in_defaultXMLNamespaceStatement3404)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_NAMESPACE.add(NAMESPACE263);

                ASSIGN264=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_defaultXMLNamespaceStatement3406)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_ASSIGN.add(ASSIGN264);

                pushFollow(FOLLOW_expression_in_defaultXMLNamespaceStatement3408);
                expression265=expression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_expression.add(expression265.tree);
                pushFollow(FOLLOW_semi_in_defaultXMLNamespaceStatement3410);
                semi266=semi();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_semi.add(semi266.tree);


                // AST REWRITE
                // elements: expression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 992:3: -> ^( DEFAULT_XML_NAMESPACE expression )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:992:6: ^( DEFAULT_XML_NAMESPACE expression )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(DEFAULT_XML_NAMESPACE, "DEFAULT_XML_NAMESPACE")), root_1));

                    adaptor.addChild(root_1, stream_expression.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end defaultXMLNamespaceStatement

        // $ANTLR start typeExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1004:1: typeExpression : c= COLON type -> ^( TYPE_SPEC[$c] type ) ;
        public final function typeExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var c:Token=null;
            var type267:ParserRuleReturnScope = null;


            var c_tree:LinkedListTree=null;
            var stream_COLON:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COLON");
            var stream_type:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule type");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1005:2: (c= COLON type -> ^( TYPE_SPEC[$c] type ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1005:4: c= COLON type
                {
                c=Token(matchStream(input,COLON,FOLLOW_COLON_in_typeExpression3444)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_COLON.add(c);

                pushFollow(FOLLOW_type_in_typeExpression3446);
                type267=type();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_type.add(type267.tree);


                // AST REWRITE
                // elements: type
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1006:3: -> ^( TYPE_SPEC[$c] type )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1006:6: ^( TYPE_SPEC[$c] type )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(TYPE_SPEC, c)), root_1));

                    adaptor.addChild(root_1, stream_type.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end typeExpression

        // $ANTLR start type
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1009:1: type : ( qualifiedName | VOID | STAR ) -> ^( TYPE ( qualifiedName )? ( VOID )? ( STAR )? ) ;
        public final function type():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var VOID269:Token=null;
            var STAR270:Token=null;
            var qualifiedName268:ParserRuleReturnScope = null;


            var VOID269_tree:LinkedListTree=null;
            var STAR270_tree:LinkedListTree=null;
            var stream_STAR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token STAR");
            var stream_VOID:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token VOID");
            var stream_qualifiedName:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule qualifiedName");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:2: ( ( qualifiedName | VOID | STAR ) -> ^( TYPE ( qualifiedName )? ( VOID )? ( STAR )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:4: ( qualifiedName | VOID | STAR )
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:4: ( qualifiedName | VOID | STAR )
                var alt58:int=3;
                switch ( input.LA(1) ) {
                case IDENT:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case INTERNAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case GET:
                case SET:
                case EACH:
                case DEFAULT:
                    {
                    alt58=1;
                    }
                    break;
                case VOID:
                    {
                    alt58=2;
                    }
                    break;
                case STAR:
                    {
                    alt58=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 58, 0, input);

                }

                switch (alt58) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:6: qualifiedName
                        {
                        pushFollow(FOLLOW_qualifiedName_in_type3474);
                        qualifiedName268=qualifiedName();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_qualifiedName.add(qualifiedName268.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:22: VOID
                        {
                        VOID269=Token(matchStream(input,VOID,FOLLOW_VOID_in_type3478)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_VOID.add(VOID269);


                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1010:29: STAR
                        {
                        STAR270=Token(matchStream(input,STAR,FOLLOW_STAR_in_type3482)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_STAR.add(STAR270);


                        }
                        break;

                }



                // AST REWRITE
                // elements: STAR, VOID, qualifiedName
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1011:3: -> ^( TYPE ( qualifiedName )? ( VOID )? ( STAR )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1011:6: ^( TYPE ( qualifiedName )? ( VOID )? ( STAR )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(TYPE, "TYPE")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1011:14: ( qualifiedName )?
                    if ( stream_qualifiedName.hasNext ) {
                        adaptor.addChild(root_1, stream_qualifiedName.nextTree());

                    }
                    stream_qualifiedName.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1011:29: ( VOID )?
                    if ( stream_VOID.hasNext ) {
                        adaptor.addChild(root_1, stream_VOID.nextNode());

                    }
                    stream_VOID.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1011:35: ( STAR )?
                    if ( stream_STAR.hasNext ) {
                        adaptor.addChild(root_1, stream_STAR.nextNode());

                    }
                    stream_STAR.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end type

        // $ANTLR start qualifiedName
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1014:1: qualifiedName : standardQualifiedName ( typePostfixSyntax )? ;
        public final function qualifiedName():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var standardQualifiedName271:ParserRuleReturnScope = null;

            var typePostfixSyntax272:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1015:2: ( standardQualifiedName ( typePostfixSyntax )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1015:4: standardQualifiedName ( typePostfixSyntax )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_standardQualifiedName_in_qualifiedName3514);
                standardQualifiedName271=standardQualifiedName();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, standardQualifiedName271.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1015:26: ( typePostfixSyntax )?
                var alt59:int=2;
                var LA59_0:int = input.LA(1);

                if ( (LA59_0==132) ) {
                    alt59=1;
                }
                switch (alt59) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1015:28: typePostfixSyntax
                        {
                        pushFollow(FOLLOW_typePostfixSyntax_in_qualifiedName3518);
                        typePostfixSyntax272=typePostfixSyntax();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, typePostfixSyntax272.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end qualifiedName

        // $ANTLR start standardQualifiedName
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1018:1: standardQualifiedName : typeSpecifier ( DOT typeSpecifier )* ;
        public final function standardQualifiedName():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var DOT274:Token=null;
            var typeSpecifier273:ParserRuleReturnScope = null;

            var typeSpecifier275:ParserRuleReturnScope = null;


            var DOT274_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1019:2: ( typeSpecifier ( DOT typeSpecifier )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1019:4: typeSpecifier ( DOT typeSpecifier )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_typeSpecifier_in_standardQualifiedName3533);
                typeSpecifier273=typeSpecifier();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, typeSpecifier273.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1019:18: ( DOT typeSpecifier )*
                loop60:
                do {
                    var alt60:int=2;
                    var LA60_0:int = input.LA(1);

                    if ( (LA60_0==92) ) {
                        var LA60_2:int = input.LA(2);

                        if ( (LA60_2==79||LA60_2==90||(LA60_2>=94 && LA60_2<=97)||(LA60_2>=101 && LA60_2<=102)||(LA60_2>=108 && LA60_2<=109)||LA60_2==115||LA60_2==124) ) {
                            alt60=1;
                        }


                    }


                    switch (alt60) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1019:20: DOT typeSpecifier
                	    {
                	    DOT274=Token(matchStream(input,DOT,FOLLOW_DOT_in_standardQualifiedName3537)); if (this.state.failed) return retval;
                	    pushFollow(FOLLOW_typeSpecifier_in_standardQualifiedName3540);
                	    typeSpecifier275=typeSpecifier();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, typeSpecifier275.tree);

                	    }
                	    break;

                	default :
                	    break loop60;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end standardQualifiedName

        // $ANTLR start typeSpecifier
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1022:1: typeSpecifier : ( IDENT | notQuiteReservedWord | INTERNAL | DEFAULT );
        public final function typeSpecifier():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT276:Token=null;
            var INTERNAL278:Token=null;
            var DEFAULT279:Token=null;
            var notQuiteReservedWord277:ParserRuleReturnScope = null;


            var IDENT276_tree:LinkedListTree=null;
            var INTERNAL278_tree:LinkedListTree=null;
            var DEFAULT279_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1022:14: ( IDENT | notQuiteReservedWord | INTERNAL | DEFAULT )
                var alt61:int=4;
                switch ( input.LA(1) ) {
                case IDENT:
                    {
                    alt61=1;
                    }
                    break;
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case GET:
                case SET:
                case EACH:
                    {
                    alt61=2;
                    }
                    break;
                case INTERNAL:
                    {
                    alt61=3;
                    }
                    break;
                case DEFAULT:
                    {
                    alt61=4;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 61, 0, input);

                }

                switch (alt61) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1023:2: IDENT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        IDENT276=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_typeSpecifier3553)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        IDENT276_tree = LinkedListTree(adaptor.create(IDENT276));
                        adaptor.addChild(root_0, IDENT276_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1023:10: notQuiteReservedWord
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_notQuiteReservedWord_in_typeSpecifier3557);
                        notQuiteReservedWord277=notQuiteReservedWord();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, notQuiteReservedWord277.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1023:33: INTERNAL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        INTERNAL278=Token(matchStream(input,INTERNAL,FOLLOW_INTERNAL_in_typeSpecifier3561)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        INTERNAL278_tree = LinkedListTree(adaptor.create(INTERNAL278));
                        adaptor.addChild(root_0, INTERNAL278_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1023:44: DEFAULT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        DEFAULT279=Token(matchStream(input,DEFAULT,FOLLOW_DEFAULT_in_typeSpecifier3565)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        DEFAULT279_tree = LinkedListTree(adaptor.create(DEFAULT279));
                        adaptor.addChild(root_0, DEFAULT279_tree);
                        }

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end typeSpecifier

        // $ANTLR start namespaceName
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1030:1: namespaceName : ( IDENT | reservedNamespace );
        public final function namespaceName():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT280:Token=null;
            var reservedNamespace281:ParserRuleReturnScope = null;


            var IDENT280_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1031:2: ( IDENT | reservedNamespace )
                var alt62:int=2;
                var LA62_0:int = input.LA(1);

                if ( (LA62_0==79) ) {
                    alt62=1;
                }
                else if ( (LA62_0==96||(LA62_0>=98 && LA62_0<=100)) ) {
                    alt62=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 62, 0, input);

                }
                switch (alt62) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1031:4: IDENT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        IDENT280=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_namespaceName3580)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        IDENT280_tree = LinkedListTree(adaptor.create(IDENT280));
                        adaptor.addChild(root_0, IDENT280_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1031:12: reservedNamespace
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_reservedNamespace_in_namespaceName3584);
                        reservedNamespace281=reservedNamespace();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, reservedNamespace281.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end namespaceName

        // $ANTLR start reservedNamespace
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1034:1: reservedNamespace : ( PUBLIC | PRIVATE | PROTECTED | INTERNAL );
        public final function reservedNamespace():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set282:Token=null;

            var set282_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1035:2: ( PUBLIC | PRIVATE | PROTECTED | INTERNAL )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set282=Token(input.LT(1));
                if ( input.LA(1)==96||(input.LA(1)>=98 && input.LA(1)<=100) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set282)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end reservedNamespace

        // $ANTLR start typePostfixSyntax
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1041:1: typePostfixSyntax : POST ( standardQualifiedName | STAR ) ( typePostfixSyntax )? GT -> ^( TYPE_POSTFIX ( standardQualifiedName )? ( STAR )? ( typePostfixSyntax )? ) ;
        public final function typePostfixSyntax():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var POST283:Token=null;
            var STAR285:Token=null;
            var GT287:Token=null;
            var standardQualifiedName284:ParserRuleReturnScope = null;

            var typePostfixSyntax286:ParserRuleReturnScope = null;


            var POST283_tree:LinkedListTree=null;
            var STAR285_tree:LinkedListTree=null;
            var GT287_tree:LinkedListTree=null;
            var stream_POST:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token POST");
            var stream_GT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GT");
            var stream_STAR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token STAR");
            var stream_standardQualifiedName:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule standardQualifiedName");
            var stream_typePostfixSyntax:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typePostfixSyntax");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:2: ( POST ( standardQualifiedName | STAR ) ( typePostfixSyntax )? GT -> ^( TYPE_POSTFIX ( standardQualifiedName )? ( STAR )? ( typePostfixSyntax )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:4: POST ( standardQualifiedName | STAR ) ( typePostfixSyntax )? GT
                {
                POST283=Token(matchStream(input,POST,FOLLOW_POST_in_typePostfixSyntax3621)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_POST.add(POST283);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:9: ( standardQualifiedName | STAR )
                var alt63:int=2;
                var LA63_0:int = input.LA(1);

                if ( (LA63_0==79||LA63_0==90||(LA63_0>=94 && LA63_0<=97)||(LA63_0>=101 && LA63_0<=102)||(LA63_0>=108 && LA63_0<=109)||LA63_0==115||LA63_0==124) ) {
                    alt63=1;
                }
                else if ( (LA63_0==93) ) {
                    alt63=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 63, 0, input);

                }
                switch (alt63) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:11: standardQualifiedName
                        {
                        pushFollow(FOLLOW_standardQualifiedName_in_typePostfixSyntax3625);
                        standardQualifiedName284=standardQualifiedName();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_standardQualifiedName.add(standardQualifiedName284.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:35: STAR
                        {
                        STAR285=Token(matchStream(input,STAR,FOLLOW_STAR_in_typePostfixSyntax3629)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_STAR.add(STAR285);


                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:42: ( typePostfixSyntax )?
                var alt64:int=2;
                var LA64_0:int = input.LA(1);

                if ( (LA64_0==132) ) {
                    alt64=1;
                }
                switch (alt64) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1042:44: typePostfixSyntax
                        {
                        pushFollow(FOLLOW_typePostfixSyntax_in_typePostfixSyntax3635);
                        typePostfixSyntax286=typePostfixSyntax();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typePostfixSyntax.add(typePostfixSyntax286.tree);

                        }
                        break;

                }

                GT287=Token(matchStream(input,GT,FOLLOW_GT_in_typePostfixSyntax3640)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_GT.add(GT287);



                // AST REWRITE
                // elements: standardQualifiedName, typePostfixSyntax, STAR
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1043:3: -> ^( TYPE_POSTFIX ( standardQualifiedName )? ( STAR )? ( typePostfixSyntax )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1043:6: ^( TYPE_POSTFIX ( standardQualifiedName )? ( STAR )? ( typePostfixSyntax )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(TYPE_POSTFIX, "TYPE_POSTFIX")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1043:22: ( standardQualifiedName )?
                    if ( stream_standardQualifiedName.hasNext ) {
                        adaptor.addChild(root_1, stream_standardQualifiedName.nextTree());

                    }
                    stream_standardQualifiedName.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1043:45: ( STAR )?
                    if ( stream_STAR.hasNext ) {
                        adaptor.addChild(root_1, stream_STAR.nextNode());

                    }
                    stream_STAR.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1043:51: ( typePostfixSyntax )?
                    if ( stream_typePostfixSyntax.hasNext ) {
                        adaptor.addChild(root_1, stream_typePostfixSyntax.nextTree());

                    }
                    stream_typePostfixSyntax.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end typePostfixSyntax

        // $ANTLR start ident
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1046:1: ident : ( IDENT | i= USE -> IDENT[$i] | xmlKeyword | i= DYNAMIC -> IDENT[$i] | i= NAMESPACE -> IDENT[$i] | i= IS -> IDENT[$i] | i= AS -> IDENT[$i] | i= GET -> IDENT[$i] | i= SET -> IDENT[$i] );
        public final function ident():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var i:Token=null;
            var IDENT288:Token=null;
            var xmlKeyword289:ParserRuleReturnScope = null;


            var i_tree:LinkedListTree=null;
            var IDENT288_tree:LinkedListTree=null;
            var stream_AS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token AS");
            var stream_SET:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token SET");
            var stream_GET:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GET");
            var stream_USE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token USE");
            var stream_IS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token IS");
            var stream_NAMESPACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token NAMESPACE");
            var stream_DYNAMIC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DYNAMIC");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1047:2: ( IDENT | i= USE -> IDENT[$i] | xmlKeyword | i= DYNAMIC -> IDENT[$i] | i= NAMESPACE -> IDENT[$i] | i= IS -> IDENT[$i] | i= AS -> IDENT[$i] | i= GET -> IDENT[$i] | i= SET -> IDENT[$i] )
                var alt65:int=9;
                alt65 = dfa65.predict(input);
                switch (alt65) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1047:4: IDENT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        IDENT288=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_ident3670)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        IDENT288_tree = LinkedListTree(adaptor.create(IDENT288));
                        adaptor.addChild(root_0, IDENT288_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1048:4: i= USE
                        {
                        i=Token(matchStream(input,USE,FOLLOW_USE_in_ident3677)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_USE.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1048:10: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1049:4: xmlKeyword
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlKeyword_in_ident3687);
                        xmlKeyword289=xmlKeyword();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, xmlKeyword289.tree);

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1050:4: i= DYNAMIC
                        {
                        i=Token(matchStream(input,DYNAMIC,FOLLOW_DYNAMIC_in_ident3695)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_DYNAMIC.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1050:14: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1051:4: i= NAMESPACE
                        {
                        i=Token(matchStream(input,NAMESPACE,FOLLOW_NAMESPACE_in_ident3707)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_NAMESPACE.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1051:16: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1052:4: i= IS
                        {
                        i=Token(matchStream(input,IS,FOLLOW_IS_in_ident3719)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_IS.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1052:9: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1053:4: i= AS
                        {
                        i=Token(matchStream(input,AS,FOLLOW_AS_in_ident3731)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_AS.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1053:9: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 8 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1054:4: i= GET
                        {
                        i=Token(matchStream(input,GET,FOLLOW_GET_in_ident3743)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GET.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1054:10: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 9 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1055:4: i= SET
                        {
                        i=Token(matchStream(input,SET,FOLLOW_SET_in_ident3755)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_SET.add(i);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1055:10: -> IDENT[$i]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(IDENT, i)));

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end ident

        // $ANTLR start expression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1064:1: expression : assignmentExpression ;
        public final function expression():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var assignmentExpression290:ParserRuleReturnScope = null;




            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1069:2: ( assignmentExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1069:4: assignmentExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_assignmentExpression_in_expression3787);
                assignmentExpression290=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression290.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end expression

        // $ANTLR start expressionList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1073:1: expressionList : assignmentExpression ( COMMA assignmentExpression )* -> ( assignmentExpression )+ ;
        public final function expressionList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA292:Token=null;
            var assignmentExpression291:ParserRuleReturnScope = null;

            var assignmentExpression293:ParserRuleReturnScope = null;


            var COMMA292_tree:LinkedListTree=null;
            var stream_COMMA:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COMMA");
            var stream_assignmentExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule assignmentExpression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1074:2: ( assignmentExpression ( COMMA assignmentExpression )* -> ( assignmentExpression )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1074:4: assignmentExpression ( COMMA assignmentExpression )*
                {
                pushFollow(FOLLOW_assignmentExpression_in_expressionList3799);
                assignmentExpression291=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_assignmentExpression.add(assignmentExpression291.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1074:25: ( COMMA assignmentExpression )*
                loop66:
                do {
                    var alt66:int=2;
                    var LA66_0:int = input.LA(1);

                    if ( (LA66_0==84) ) {
                        alt66=1;
                    }


                    switch (alt66) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1074:27: COMMA assignmentExpression
                	    {
                	    COMMA292=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_expressionList3803)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_COMMA.add(COMMA292);

                	    pushFollow(FOLLOW_assignmentExpression_in_expressionList3805);
                	    assignmentExpression293=assignmentExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_assignmentExpression.add(assignmentExpression293.tree);

                	    }
                	    break;

                	default :
                	    break loop66;
                    }
                } while (true);



                // AST REWRITE
                // elements: assignmentExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1075:3: -> ( assignmentExpression )+
                {
                    if ( !(stream_assignmentExpression.hasNext) ) {
                        throw new RewriteEarlyExitException();
                    }
                    while ( stream_assignmentExpression.hasNext ) {
                        adaptor.addChild(root_0, stream_assignmentExpression.nextTree());

                    }
                    stream_assignmentExpression.reset();

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end expressionList

        // $ANTLR start assignmentExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1081:1: assignmentExpression : conditionalExpression ( ( assignmentOperator )=>o= assignmentOperator assignmentExpression )* ;
        public final function assignmentExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var conditionalExpression294:ParserRuleReturnScope = null;

            var assignmentExpression295:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:2: ( conditionalExpression ( ( assignmentOperator )=>o= assignmentOperator assignmentExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:4: conditionalExpression ( ( assignmentOperator )=>o= assignmentOperator assignmentExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_conditionalExpression_in_assignmentExpression3829);
                conditionalExpression294=conditionalExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, conditionalExpression294.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:26: ( ( assignmentOperator )=>o= assignmentOperator assignmentExpression )*
                loop67:
                do {
                    var alt67:int=2;
                    alt67 = dfa67.predict(input);
                    switch (alt67) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:28: ( assignmentOperator )=>o= assignmentOperator assignmentExpression
                	    {
                	    pushFollow(FOLLOW_assignmentOperator_in_assignmentExpression3844);
                	    o=assignmentOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_assignmentExpression_in_assignmentExpression3847);
                	    assignmentExpression295=assignmentExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression295.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop67;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end assignmentExpression

        // $ANTLR start assignmentOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1091:1: assignmentOperator : ( ASSIGN | ( ( '*' '=' )=> '*' '=' -> STAR_ASSIGN[\"*=\"] ) | DIV_ASSIGN | MOD_ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN | SL_ASSIGN | ( ( '>' '>' '=' )=> '>' '>' '=' -> SR_ASSIGN[\">>=\"] ) | ( ( '>' '>' '>' '=' )=> '>' '>' '>' '=' -> BSR_ASSIGN[\">>>=\"] ) | BAND_ASSIGN | BXOR_ASSIGN | BOR_ASSIGN | LAND_ASSIGN | LOR_ASSIGN );
        public final function assignmentOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ASSIGN296:Token=null;
            var char_literal297:Token=null;
            var char_literal298:Token=null;
            var DIV_ASSIGN299:Token=null;
            var MOD_ASSIGN300:Token=null;
            var PLUS_ASSIGN301:Token=null;
            var MINUS_ASSIGN302:Token=null;
            var SL_ASSIGN303:Token=null;
            var char_literal304:Token=null;
            var char_literal305:Token=null;
            var char_literal306:Token=null;
            var char_literal307:Token=null;
            var char_literal308:Token=null;
            var char_literal309:Token=null;
            var char_literal310:Token=null;
            var BAND_ASSIGN311:Token=null;
            var BXOR_ASSIGN312:Token=null;
            var BOR_ASSIGN313:Token=null;
            var LAND_ASSIGN314:Token=null;
            var LOR_ASSIGN315:Token=null;

            var ASSIGN296_tree:LinkedListTree=null;
            var char_literal297_tree:LinkedListTree=null;
            var char_literal298_tree:LinkedListTree=null;
            var DIV_ASSIGN299_tree:LinkedListTree=null;
            var MOD_ASSIGN300_tree:LinkedListTree=null;
            var PLUS_ASSIGN301_tree:LinkedListTree=null;
            var MINUS_ASSIGN302_tree:LinkedListTree=null;
            var SL_ASSIGN303_tree:LinkedListTree=null;
            var char_literal304_tree:LinkedListTree=null;
            var char_literal305_tree:LinkedListTree=null;
            var char_literal306_tree:LinkedListTree=null;
            var char_literal307_tree:LinkedListTree=null;
            var char_literal308_tree:LinkedListTree=null;
            var char_literal309_tree:LinkedListTree=null;
            var char_literal310_tree:LinkedListTree=null;
            var BAND_ASSIGN311_tree:LinkedListTree=null;
            var BXOR_ASSIGN312_tree:LinkedListTree=null;
            var BOR_ASSIGN313_tree:LinkedListTree=null;
            var LAND_ASSIGN314_tree:LinkedListTree=null;
            var LOR_ASSIGN315_tree:LinkedListTree=null;
            var stream_GT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GT");
            var stream_STAR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token STAR");
            var stream_ASSIGN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ASSIGN");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1092:2: ( ASSIGN | ( ( '*' '=' )=> '*' '=' -> STAR_ASSIGN[\"*=\"] ) | DIV_ASSIGN | MOD_ASSIGN | PLUS_ASSIGN | MINUS_ASSIGN | SL_ASSIGN | ( ( '>' '>' '=' )=> '>' '>' '=' -> SR_ASSIGN[\">>=\"] ) | ( ( '>' '>' '>' '=' )=> '>' '>' '>' '=' -> BSR_ASSIGN[\">>>=\"] ) | BAND_ASSIGN | BXOR_ASSIGN | BOR_ASSIGN | LAND_ASSIGN | LOR_ASSIGN )
                var alt68:int=14;
                alt68 = dfa68.predict(input);
                switch (alt68) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1092:5: ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        ASSIGN296=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_assignmentOperator3869)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        ASSIGN296_tree = LinkedListTree(adaptor.create(ASSIGN296));
                        adaptor.addChild(root_0, ASSIGN296_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1094:4: ( ( '*' '=' )=> '*' '=' -> STAR_ASSIGN[\"*=\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1094:4: ( ( '*' '=' )=> '*' '=' -> STAR_ASSIGN[\"*=\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1094:6: ( '*' '=' )=> '*' '='
                        {
                        char_literal297=Token(matchStream(input,STAR,FOLLOW_STAR_in_assignmentOperator3884)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_STAR.add(char_literal297);

                        char_literal298=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_assignmentOperator3886)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(char_literal298);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1094:26: -> STAR_ASSIGN[\"*=\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(STAR_ASSIGN, "*=")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1095:4: DIV_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        DIV_ASSIGN299=Token(matchStream(input,DIV_ASSIGN,FOLLOW_DIV_ASSIGN_in_assignmentOperator3897)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        DIV_ASSIGN299_tree = LinkedListTree(adaptor.create(DIV_ASSIGN299));
                        adaptor.addChild(root_0, DIV_ASSIGN299_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1096:4: MOD_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        MOD_ASSIGN300=Token(matchStream(input,MOD_ASSIGN,FOLLOW_MOD_ASSIGN_in_assignmentOperator3902)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        MOD_ASSIGN300_tree = LinkedListTree(adaptor.create(MOD_ASSIGN300));
                        adaptor.addChild(root_0, MOD_ASSIGN300_tree);
                        }

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1097:4: PLUS_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        PLUS_ASSIGN301=Token(matchStream(input,PLUS_ASSIGN,FOLLOW_PLUS_ASSIGN_in_assignmentOperator3907)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        PLUS_ASSIGN301_tree = LinkedListTree(adaptor.create(PLUS_ASSIGN301));
                        adaptor.addChild(root_0, PLUS_ASSIGN301_tree);
                        }

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1098:4: MINUS_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        MINUS_ASSIGN302=Token(matchStream(input,MINUS_ASSIGN,FOLLOW_MINUS_ASSIGN_in_assignmentOperator3912)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        MINUS_ASSIGN302_tree = LinkedListTree(adaptor.create(MINUS_ASSIGN302));
                        adaptor.addChild(root_0, MINUS_ASSIGN302_tree);
                        }

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1099:4: SL_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        SL_ASSIGN303=Token(matchStream(input,SL_ASSIGN,FOLLOW_SL_ASSIGN_in_assignmentOperator3917)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        SL_ASSIGN303_tree = LinkedListTree(adaptor.create(SL_ASSIGN303));
                        adaptor.addChild(root_0, SL_ASSIGN303_tree);
                        }

                        }
                        break;
                    case 8 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1102:4: ( ( '>' '>' '=' )=> '>' '>' '=' -> SR_ASSIGN[\">>=\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1102:4: ( ( '>' '>' '=' )=> '>' '>' '=' -> SR_ASSIGN[\">>=\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1102:6: ( '>' '>' '=' )=> '>' '>' '='
                        {
                        char_literal304=Token(matchStream(input,GT,FOLLOW_GT_in_assignmentOperator3935)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal304);

                        char_literal305=Token(matchStream(input,GT,FOLLOW_GT_in_assignmentOperator3937)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal305);

                        char_literal306=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_assignmentOperator3939)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(char_literal306);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1102:34: -> SR_ASSIGN[\">>=\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(SR_ASSIGN, ">>=")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 9 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1103:4: ( ( '>' '>' '>' '=' )=> '>' '>' '>' '=' -> BSR_ASSIGN[\">>>=\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1103:4: ( ( '>' '>' '>' '=' )=> '>' '>' '>' '=' -> BSR_ASSIGN[\">>>=\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1103:6: ( '>' '>' '>' '=' )=> '>' '>' '>' '='
                        {
                        char_literal307=Token(matchStream(input,GT,FOLLOW_GT_in_assignmentOperator3965)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal307);

                        char_literal308=Token(matchStream(input,GT,FOLLOW_GT_in_assignmentOperator3967)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal308);

                        char_literal309=Token(matchStream(input,GT,FOLLOW_GT_in_assignmentOperator3969)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal309);

                        char_literal310=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_assignmentOperator3971)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(char_literal310);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1103:42: -> BSR_ASSIGN[\">>>=\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(BSR_ASSIGN, ">>>=")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 10 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1104:4: BAND_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        BAND_ASSIGN311=Token(matchStream(input,BAND_ASSIGN,FOLLOW_BAND_ASSIGN_in_assignmentOperator3983)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        BAND_ASSIGN311_tree = LinkedListTree(adaptor.create(BAND_ASSIGN311));
                        adaptor.addChild(root_0, BAND_ASSIGN311_tree);
                        }

                        }
                        break;
                    case 11 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1105:4: BXOR_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        BXOR_ASSIGN312=Token(matchStream(input,BXOR_ASSIGN,FOLLOW_BXOR_ASSIGN_in_assignmentOperator3988)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        BXOR_ASSIGN312_tree = LinkedListTree(adaptor.create(BXOR_ASSIGN312));
                        adaptor.addChild(root_0, BXOR_ASSIGN312_tree);
                        }

                        }
                        break;
                    case 12 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1106:4: BOR_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        BOR_ASSIGN313=Token(matchStream(input,BOR_ASSIGN,FOLLOW_BOR_ASSIGN_in_assignmentOperator3993)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        BOR_ASSIGN313_tree = LinkedListTree(adaptor.create(BOR_ASSIGN313));
                        adaptor.addChild(root_0, BOR_ASSIGN313_tree);
                        }

                        }
                        break;
                    case 13 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1107:4: LAND_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        LAND_ASSIGN314=Token(matchStream(input,LAND_ASSIGN,FOLLOW_LAND_ASSIGN_in_assignmentOperator3998)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        LAND_ASSIGN314_tree = LinkedListTree(adaptor.create(LAND_ASSIGN314));
                        adaptor.addChild(root_0, LAND_ASSIGN314_tree);
                        }

                        }
                        break;
                    case 14 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1108:4: LOR_ASSIGN
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        LOR_ASSIGN315=Token(matchStream(input,LOR_ASSIGN,FOLLOW_LOR_ASSIGN_in_assignmentOperator4003)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        LOR_ASSIGN315_tree = LinkedListTree(adaptor.create(LOR_ASSIGN315));
                        adaptor.addChild(root_0, LOR_ASSIGN315_tree);
                        }

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end assignmentOperator

        // $ANTLR start conditionalExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1113:1: conditionalExpression : ( logicalOrExpression -> logicalOrExpression ) ( QUESTION conditionalSubExpression -> ^( QUESTION $conditionalExpression conditionalSubExpression ) )? ;
        public final function conditionalExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var QUESTION317:Token=null;
            var logicalOrExpression316:ParserRuleReturnScope = null;

            var conditionalSubExpression318:ParserRuleReturnScope = null;


            var QUESTION317_tree:LinkedListTree=null;
            var stream_QUESTION:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token QUESTION");
            var stream_logicalOrExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule logicalOrExpression");
            var stream_conditionalSubExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule conditionalSubExpression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1114:2: ( ( logicalOrExpression -> logicalOrExpression ) ( QUESTION conditionalSubExpression -> ^( QUESTION $conditionalExpression conditionalSubExpression ) )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1114:4: ( logicalOrExpression -> logicalOrExpression ) ( QUESTION conditionalSubExpression -> ^( QUESTION $conditionalExpression conditionalSubExpression ) )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1114:4: ( logicalOrExpression -> logicalOrExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1114:6: logicalOrExpression
                {
                pushFollow(FOLLOW_logicalOrExpression_in_conditionalExpression4018);
                logicalOrExpression316=logicalOrExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_logicalOrExpression.add(logicalOrExpression316.tree);


                // AST REWRITE
                // elements: logicalOrExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1114:26: -> logicalOrExpression
                {
                    adaptor.addChild(root_0, stream_logicalOrExpression.nextTree());

                }

                retval.tree = root_0;}
                }

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1115:3: ( QUESTION conditionalSubExpression -> ^( QUESTION $conditionalExpression conditionalSubExpression ) )?
                var alt69:int=2;
                var LA69_0:int = input.LA(1);

                if ( (LA69_0==146) ) {
                    alt69=1;
                }
                switch (alt69) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1116:4: QUESTION conditionalSubExpression
                        {
                        QUESTION317=Token(matchStream(input,QUESTION,FOLLOW_QUESTION_in_conditionalExpression4033)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_QUESTION.add(QUESTION317);

                        pushFollow(FOLLOW_conditionalSubExpression_in_conditionalExpression4035);
                        conditionalSubExpression318=conditionalSubExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_conditionalSubExpression.add(conditionalSubExpression318.tree);


                        // AST REWRITE
                        // elements: conditionalSubExpression, conditionalExpression, QUESTION
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1117:4: -> ^( QUESTION $conditionalExpression conditionalSubExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1117:7: ^( QUESTION $conditionalExpression conditionalSubExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_QUESTION.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_retval.nextTree());
                            adaptor.addChild(root_1, stream_conditionalSubExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end conditionalExpression

        // $ANTLR start conditionalSubExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1122:1: conditionalSubExpression : assignmentExpression COLON assignmentExpression ;
        public final function conditionalSubExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COLON320:Token=null;
            var assignmentExpression319:ParserRuleReturnScope = null;

            var assignmentExpression321:ParserRuleReturnScope = null;


            var COLON320_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1123:2: ( assignmentExpression COLON assignmentExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1123:4: assignmentExpression COLON assignmentExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_assignmentExpression_in_conditionalSubExpression4068);
                assignmentExpression319=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression319.tree);
                COLON320=Token(matchStream(input,COLON,FOLLOW_COLON_in_conditionalSubExpression4070)); if (this.state.failed) return retval;
                pushFollow(FOLLOW_assignmentExpression_in_conditionalSubExpression4073);
                assignmentExpression321=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression321.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end conditionalSubExpression

        // $ANTLR start logicalOrExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1128:1: logicalOrExpression : logicalAndExpression (o= logicalOrOperator logicalAndExpression )* ;
        public final function logicalOrExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var logicalAndExpression322:ParserRuleReturnScope = null;

            var logicalAndExpression323:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1129:2: ( logicalAndExpression (o= logicalOrOperator logicalAndExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1129:4: logicalAndExpression (o= logicalOrOperator logicalAndExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_logicalAndExpression_in_logicalOrExpression4086);
                logicalAndExpression322=logicalAndExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, logicalAndExpression322.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1130:3: (o= logicalOrOperator logicalAndExpression )*
                loop70:
                do {
                    var alt70:int=2;
                    var LA70_0:int = input.LA(1);

                    if ( (LA70_0==147) ) {
                        alt70=1;
                    }


                    switch (alt70) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1130:5: o= logicalOrOperator logicalAndExpression
                	    {
                	    pushFollow(FOLLOW_logicalOrOperator_in_logicalOrExpression4094);
                	    o=logicalOrOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_logicalAndExpression_in_logicalOrExpression4097);
                	    logicalAndExpression323=logicalAndExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, logicalAndExpression323.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop70;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end logicalOrExpression

        // $ANTLR start logicalOrOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1134:1: logicalOrOperator : LOR ;
        public final function logicalOrOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LOR324:Token=null;

            var LOR324_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1135:2: ( LOR )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1135:4: LOR
                {
                root_0 = LinkedListTree(adaptor.nil());

                LOR324=Token(matchStream(input,LOR,FOLLOW_LOR_in_logicalOrOperator4114)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                LOR324_tree = LinkedListTree(adaptor.create(LOR324));
                adaptor.addChild(root_0, LOR324_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end logicalOrOperator

        // $ANTLR start logicalAndExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1139:1: logicalAndExpression : bitwiseOrExpression (o= logicalAndOperator bitwiseOrExpression )* ;
        public final function logicalAndExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var bitwiseOrExpression325:ParserRuleReturnScope = null;

            var bitwiseOrExpression326:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1140:2: ( bitwiseOrExpression (o= logicalAndOperator bitwiseOrExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1140:4: bitwiseOrExpression (o= logicalAndOperator bitwiseOrExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_bitwiseOrExpression_in_logicalAndExpression4126);
                bitwiseOrExpression325=bitwiseOrExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseOrExpression325.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1141:3: (o= logicalAndOperator bitwiseOrExpression )*
                loop71:
                do {
                    var alt71:int=2;
                    var LA71_0:int = input.LA(1);

                    if ( (LA71_0==148) ) {
                        alt71=1;
                    }


                    switch (alt71) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1141:5: o= logicalAndOperator bitwiseOrExpression
                	    {
                	    pushFollow(FOLLOW_logicalAndOperator_in_logicalAndExpression4134);
                	    o=logicalAndOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_bitwiseOrExpression_in_logicalAndExpression4137);
                	    bitwiseOrExpression326=bitwiseOrExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseOrExpression326.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop71;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end logicalAndExpression

        // $ANTLR start logicalAndOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1144:1: logicalAndOperator : LAND ;
        public final function logicalAndOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LAND327:Token=null;

            var LAND327_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1145:2: ( LAND )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1145:4: LAND
                {
                root_0 = LinkedListTree(adaptor.nil());

                LAND327=Token(matchStream(input,LAND,FOLLOW_LAND_in_logicalAndOperator4153)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                LAND327_tree = LinkedListTree(adaptor.create(LAND327));
                adaptor.addChild(root_0, LAND327_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end logicalAndOperator

        // $ANTLR start bitwiseOrExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1150:1: bitwiseOrExpression : bitwiseXorExpression (o= BOR bitwiseXorExpression )* ;
        public final function bitwiseOrExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:Token=null;
            var bitwiseXorExpression328:ParserRuleReturnScope = null;

            var bitwiseXorExpression329:ParserRuleReturnScope = null;


            var o_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1151:2: ( bitwiseXorExpression (o= BOR bitwiseXorExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1151:4: bitwiseXorExpression (o= BOR bitwiseXorExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_bitwiseXorExpression_in_bitwiseOrExpression4166);
                bitwiseXorExpression328=bitwiseXorExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseXorExpression328.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1152:3: (o= BOR bitwiseXorExpression )*
                loop72:
                do {
                    var alt72:int=2;
                    var LA72_0:int = input.LA(1);

                    if ( (LA72_0==149) ) {
                        alt72=1;
                    }


                    switch (alt72) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1152:5: o= BOR bitwiseXorExpression
                	    {
                	    o=Token(matchStream(input,BOR,FOLLOW_BOR_in_bitwiseOrExpression4174)); if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) {
                	    o_tree = LinkedListTree(adaptor.create(o));
                	    root_0 = LinkedListTree(adaptor.becomeRoot(o_tree, root_0));
                	    }
                	    pushFollow(FOLLOW_bitwiseXorExpression_in_bitwiseOrExpression4177);
                	    bitwiseXorExpression329=bitwiseXorExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseXorExpression329.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate(o_tree);
                	    }

                	    }
                	    break;

                	default :
                	    break loop72;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end bitwiseOrExpression

        // $ANTLR start bitwiseXorExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1157:1: bitwiseXorExpression : bitwiseAndExpression (o= BXOR bitwiseAndExpression )* ;
        public final function bitwiseXorExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:Token=null;
            var bitwiseAndExpression330:ParserRuleReturnScope = null;

            var bitwiseAndExpression331:ParserRuleReturnScope = null;


            var o_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1158:2: ( bitwiseAndExpression (o= BXOR bitwiseAndExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1158:4: bitwiseAndExpression (o= BXOR bitwiseAndExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_bitwiseAndExpression_in_bitwiseXorExpression4195);
                bitwiseAndExpression330=bitwiseAndExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseAndExpression330.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1159:3: (o= BXOR bitwiseAndExpression )*
                loop73:
                do {
                    var alt73:int=2;
                    var LA73_0:int = input.LA(1);

                    if ( (LA73_0==150) ) {
                        alt73=1;
                    }


                    switch (alt73) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1159:5: o= BXOR bitwiseAndExpression
                	    {
                	    o=Token(matchStream(input,BXOR,FOLLOW_BXOR_in_bitwiseXorExpression4203)); if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) {
                	    o_tree = LinkedListTree(adaptor.create(o));
                	    root_0 = LinkedListTree(adaptor.becomeRoot(o_tree, root_0));
                	    }
                	    pushFollow(FOLLOW_bitwiseAndExpression_in_bitwiseXorExpression4206);
                	    bitwiseAndExpression331=bitwiseAndExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, bitwiseAndExpression331.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate(o_tree);
                	    }

                	    }
                	    break;

                	default :
                	    break loop73;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end bitwiseXorExpression

        // $ANTLR start bitwiseAndExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1164:1: bitwiseAndExpression : equalityExpression (o= BAND equalityExpression )* ;
        public final function bitwiseAndExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:Token=null;
            var equalityExpression332:ParserRuleReturnScope = null;

            var equalityExpression333:ParserRuleReturnScope = null;


            var o_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1165:2: ( equalityExpression (o= BAND equalityExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1165:4: equalityExpression (o= BAND equalityExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_equalityExpression_in_bitwiseAndExpression4224);
                equalityExpression332=equalityExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, equalityExpression332.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1166:3: (o= BAND equalityExpression )*
                loop74:
                do {
                    var alt74:int=2;
                    var LA74_0:int = input.LA(1);

                    if ( (LA74_0==151) ) {
                        alt74=1;
                    }


                    switch (alt74) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1166:5: o= BAND equalityExpression
                	    {
                	    o=Token(matchStream(input,BAND,FOLLOW_BAND_in_bitwiseAndExpression4232)); if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) {
                	    o_tree = LinkedListTree(adaptor.create(o));
                	    root_0 = LinkedListTree(adaptor.becomeRoot(o_tree, root_0));
                	    }
                	    pushFollow(FOLLOW_equalityExpression_in_bitwiseAndExpression4235);
                	    equalityExpression333=equalityExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, equalityExpression333.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate(o_tree);
                	    }

                	    }
                	    break;

                	default :
                	    break loop74;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end bitwiseAndExpression

        // $ANTLR start equalityExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1170:1: equalityExpression : relationalExpression (o= equalityOperator relationalExpression )* ;
        public final function equalityExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var relationalExpression334:ParserRuleReturnScope = null;

            var relationalExpression335:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1171:2: ( relationalExpression (o= equalityOperator relationalExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1171:4: relationalExpression (o= equalityOperator relationalExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_relationalExpression_in_equalityExpression4252);
                relationalExpression334=relationalExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, relationalExpression334.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1172:3: (o= equalityOperator relationalExpression )*
                loop75:
                do {
                    var alt75:int=2;
                    var LA75_0:int = input.LA(1);

                    if ( ((LA75_0>=152 && LA75_0<=155)) ) {
                        alt75=1;
                    }


                    switch (alt75) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1172:5: o= equalityOperator relationalExpression
                	    {
                	    pushFollow(FOLLOW_equalityOperator_in_equalityExpression4260);
                	    o=equalityOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_relationalExpression_in_equalityExpression4263);
                	    relationalExpression335=relationalExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, relationalExpression335.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop75;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end equalityExpression

        // $ANTLR start equalityOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1175:1: equalityOperator : ( STRICT_EQUAL | STRICT_NOT_EQUAL | NOT_EQUAL | EQUAL );
        public final function equalityOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set336:Token=null;

            var set336_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1176:2: ( STRICT_EQUAL | STRICT_NOT_EQUAL | NOT_EQUAL | EQUAL )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set336=Token(input.LT(1));
                if ( (input.LA(1)>=152 && input.LA(1)<=155) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set336)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end equalityOperator

        // $ANTLR start relationalExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1184:1: relationalExpression : shiftExpression ( ( relationalOperator )=>o= relationalOperator shiftExpression )* ;
        public final function relationalExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var shiftExpression337:ParserRuleReturnScope = null;

            var shiftExpression338:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1185:2: ( shiftExpression ( ( relationalOperator )=>o= relationalOperator shiftExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1185:4: shiftExpression ( ( relationalOperator )=>o= relationalOperator shiftExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_shiftExpression_in_relationalExpression4310);
                shiftExpression337=shiftExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, shiftExpression337.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1186:3: ( ( relationalOperator )=>o= relationalOperator shiftExpression )*
                loop76:
                do {
                    var alt76:int=2;
                    alt76 = dfa76.predict(input);
                    switch (alt76) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1186:5: ( relationalOperator )=>o= relationalOperator shiftExpression
                	    {
                	    pushFollow(FOLLOW_relationalOperator_in_relationalExpression4323);
                	    o=relationalOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_shiftExpression_in_relationalExpression4326);
                	    shiftExpression338=shiftExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, shiftExpression338.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop76;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end relationalExpression

        // $ANTLR start relationalOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1190:1: relationalOperator : ( ( ( '>' )=> '>' -> GT[\">\"] ) | ( ( '>' '=' )=> '>' '=' -> GE[\">=\"] ) | ({...}? IN | LT | LE | IS | AS | INSTANCEOF ) );
        public final function relationalOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var char_literal339:Token=null;
            var char_literal340:Token=null;
            var char_literal341:Token=null;
            var IN342:Token=null;
            var LT343:Token=null;
            var LE344:Token=null;
            var IS345:Token=null;
            var AS346:Token=null;
            var INSTANCEOF347:Token=null;

            var char_literal339_tree:LinkedListTree=null;
            var char_literal340_tree:LinkedListTree=null;
            var char_literal341_tree:LinkedListTree=null;
            var IN342_tree:LinkedListTree=null;
            var LT343_tree:LinkedListTree=null;
            var LE344_tree:LinkedListTree=null;
            var IS345_tree:LinkedListTree=null;
            var AS346_tree:LinkedListTree=null;
            var INSTANCEOF347_tree:LinkedListTree=null;
            var stream_GT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GT");
            var stream_ASSIGN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ASSIGN");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1191:2: ( ( ( '>' )=> '>' -> GT[\">\"] ) | ( ( '>' '=' )=> '>' '=' -> GE[\">=\"] ) | ({...}? IN | LT | LE | IS | AS | INSTANCEOF ) )
                var alt78:int=3;
                alt78 = dfa78.predict(input);
                switch (alt78) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1192:3: ( ( '>' )=> '>' -> GT[\">\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1192:3: ( ( '>' )=> '>' -> GT[\">\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1192:5: ( '>' )=> '>'
                        {
                        char_literal339=Token(matchStream(input,GT,FOLLOW_GT_in_relationalOperator4353)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal339);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1192:17: -> GT[\">\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(GT, ">")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1193:4: ( ( '>' '=' )=> '>' '=' -> GE[\">=\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1193:4: ( ( '>' '=' )=> '>' '=' -> GE[\">=\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1193:6: ( '>' '=' )=> '>' '='
                        {
                        char_literal340=Token(matchStream(input,GT,FOLLOW_GT_in_relationalOperator4375)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal340);

                        char_literal341=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_relationalOperator4377)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_ASSIGN.add(char_literal341);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1193:26: -> GE[\">=\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(GE, ">=")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:4: ({...}? IN | LT | LE | IS | AS | INSTANCEOF )
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:4: ({...}? IN | LT | LE | IS | AS | INSTANCEOF )
                        var alt77:int=6;
                        switch ( input.LA(1) ) {
                        case IN:
                            {
                            alt77=1;
                            }
                            break;
                        case LT:
                            {
                            alt77=2;
                            }
                            break;
                        case LE:
                            {
                            alt77=3;
                            }
                            break;
                        case IS:
                            {
                            alt77=4;
                            }
                            break;
                        case AS:
                            {
                            alt77=5;
                            }
                            break;
                        case INSTANCEOF:
                            {
                            alt77=6;
                            }
                            break;
                        default:
                            if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                            throw new NoViableAltException("", 77, 0, input);

                        }

                        switch (alt77) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:6: {...}? IN
                                {
                                if ( !((InOperator_stack[InOperator_stack.length-1].allowed)) ) {
                                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                                    throw new FailedPredicateException(input, "relationalOperator", "$InOperator::allowed");
                                }
                                IN342=Token(matchStream(input,IN,FOLLOW_IN_in_relationalOperator4392)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                IN342_tree = LinkedListTree(adaptor.create(IN342));
                                adaptor.addChild(root_0, IN342_tree);
                                }

                                }
                                break;
                            case 2 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:35: LT
                                {
                                LT343=Token(matchStream(input,LT,FOLLOW_LT_in_relationalOperator4396)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                LT343_tree = LinkedListTree(adaptor.create(LT343));
                                adaptor.addChild(root_0, LT343_tree);
                                }

                                }
                                break;
                            case 3 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:40: LE
                                {
                                LE344=Token(matchStream(input,LE,FOLLOW_LE_in_relationalOperator4400)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                LE344_tree = LinkedListTree(adaptor.create(LE344));
                                adaptor.addChild(root_0, LE344_tree);
                                }

                                }
                                break;
                            case 4 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:45: IS
                                {
                                IS345=Token(matchStream(input,IS,FOLLOW_IS_in_relationalOperator4404)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                IS345_tree = LinkedListTree(adaptor.create(IS345));
                                adaptor.addChild(root_0, IS345_tree);
                                }

                                }
                                break;
                            case 5 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:50: AS
                                {
                                AS346=Token(matchStream(input,AS,FOLLOW_AS_in_relationalOperator4408)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                AS346_tree = LinkedListTree(adaptor.create(AS346));
                                adaptor.addChild(root_0, AS346_tree);
                                }

                                }
                                break;
                            case 6 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1194:55: INSTANCEOF
                                {
                                INSTANCEOF347=Token(matchStream(input,INSTANCEOF,FOLLOW_INSTANCEOF_in_relationalOperator4412)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                INSTANCEOF347_tree = LinkedListTree(adaptor.create(INSTANCEOF347));
                                adaptor.addChild(root_0, INSTANCEOF347_tree);
                                }

                                }
                                break;

                        }


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end relationalOperator

        // $ANTLR start shiftExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1198:1: shiftExpression : additiveExpression (o= shiftOperator additiveExpression )* ;
        public final function shiftExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var additiveExpression348:ParserRuleReturnScope = null;

            var additiveExpression349:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1199:2: ( additiveExpression (o= shiftOperator additiveExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1199:4: additiveExpression (o= shiftOperator additiveExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_additiveExpression_in_shiftExpression4426);
                additiveExpression348=additiveExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, additiveExpression348.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1200:3: (o= shiftOperator additiveExpression )*
                loop79:
                do {
                    var alt79:int=2;
                    var LA79_0:int = input.LA(1);

                    if ( (LA79_0==133) ) {
                        var LA79_1:int = input.LA(2);

                        if ( (LA79_1==133) ) {
                            var LA79_4:int = input.LA(3);

                            if ( (LA79_4==133) ) {
                                var LA79_5:int = input.LA(4);

                                if ( (LA79_5==76||LA79_5==79||LA79_5==81||LA79_5==83||LA79_5==88||LA79_5==90||(LA79_5>=94 && LA79_5<=95)||LA79_5==97||(LA79_5>=101 && LA79_5<=102)||(LA79_5>=107 && LA79_5<=109)||LA79_5==115||LA79_5==131||(LA79_5>=160 && LA79_5<=161)||(LA79_5>=164 && LA79_5<=169)||(LA79_5>=171 && LA79_5<=183)||LA79_5==185) ) {
                                    alt79=1;
                                }


                            }
                            else if ( (LA79_4==76||LA79_4==79||LA79_4==81||LA79_4==83||LA79_4==88||LA79_4==90||(LA79_4>=94 && LA79_4<=95)||LA79_4==97||(LA79_4>=101 && LA79_4<=102)||(LA79_4>=107 && LA79_4<=109)||LA79_4==115||LA79_4==131||(LA79_4>=160 && LA79_4<=161)||(LA79_4>=164 && LA79_4<=169)||(LA79_4>=171 && LA79_4<=183)||LA79_4==185) ) {
                                alt79=1;
                            }


                        }


                    }
                    else if ( (LA79_0==159) ) {
                        alt79=1;
                    }


                    switch (alt79) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1200:5: o= shiftOperator additiveExpression
                	    {
                	    pushFollow(FOLLOW_shiftOperator_in_shiftExpression4434);
                	    o=shiftOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_additiveExpression_in_shiftExpression4437);
                	    additiveExpression349=additiveExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, additiveExpression349.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop79;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end shiftExpression

        // $ANTLR start shiftOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1204:1: shiftOperator : ( SL | ( ( '>' '>' )=> '>' '>' -> SR[\">>\"] ) | ( ( '>' '>' '>' )=> '>' '>' '>' -> BSR[\">>>\"] ) );
        public final function shiftOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var SL350:Token=null;
            var char_literal351:Token=null;
            var char_literal352:Token=null;
            var char_literal353:Token=null;
            var char_literal354:Token=null;
            var char_literal355:Token=null;

            var SL350_tree:LinkedListTree=null;
            var char_literal351_tree:LinkedListTree=null;
            var char_literal352_tree:LinkedListTree=null;
            var char_literal353_tree:LinkedListTree=null;
            var char_literal354_tree:LinkedListTree=null;
            var char_literal355_tree:LinkedListTree=null;
            var stream_GT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GT");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1205:2: ( SL | ( ( '>' '>' )=> '>' '>' -> SR[\">>\"] ) | ( ( '>' '>' '>' )=> '>' '>' '>' -> BSR[\">>>\"] ) )
                var alt80:int=3;
                alt80 = dfa80.predict(input);
                switch (alt80) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1205:4: SL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        SL350=Token(matchStream(input,SL,FOLLOW_SL_in_shiftOperator4454)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        SL350_tree = LinkedListTree(adaptor.create(SL350));
                        adaptor.addChild(root_0, SL350_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1206:4: ( ( '>' '>' )=> '>' '>' -> SR[\">>\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1206:4: ( ( '>' '>' )=> '>' '>' -> SR[\">>\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1206:6: ( '>' '>' )=> '>' '>'
                        {
                        char_literal351=Token(matchStream(input,GT,FOLLOW_GT_in_shiftOperator4469)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal351);

                        char_literal352=Token(matchStream(input,GT,FOLLOW_GT_in_shiftOperator4471)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal352);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1206:26: -> SR[\">>\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(SR, ">>")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1207:4: ( ( '>' '>' '>' )=> '>' '>' '>' -> BSR[\">>>\"] )
                        {
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1207:4: ( ( '>' '>' '>' )=> '>' '>' '>' -> BSR[\">>>\"] )
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1207:6: ( '>' '>' '>' )=> '>' '>' '>'
                        {
                        char_literal353=Token(matchStream(input,GT,FOLLOW_GT_in_shiftOperator4495)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal353);

                        char_literal354=Token(matchStream(input,GT,FOLLOW_GT_in_shiftOperator4497)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal354);

                        char_literal355=Token(matchStream(input,GT,FOLLOW_GT_in_shiftOperator4499)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_GT.add(char_literal355);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1207:34: -> BSR[\">>>\"]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(BSR, ">>>")));

                        }

                        retval.tree = root_0;}
                        }


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end shiftOperator

        // $ANTLR start additiveExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1211:1: additiveExpression : multiplicativeExpression (o= additiveOperator multiplicativeExpression )* ;
        public final function additiveExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var multiplicativeExpression356:ParserRuleReturnScope = null;

            var multiplicativeExpression357:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1212:2: ( multiplicativeExpression (o= additiveOperator multiplicativeExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1212:4: multiplicativeExpression (o= additiveOperator multiplicativeExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_multiplicativeExpression_in_additiveExpression4517);
                multiplicativeExpression356=multiplicativeExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, multiplicativeExpression356.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1213:3: (o= additiveOperator multiplicativeExpression )*
                loop81:
                do {
                    var alt81:int=2;
                    var LA81_0:int = input.LA(1);

                    if ( ((LA81_0>=160 && LA81_0<=161)) ) {
                        alt81=1;
                    }


                    switch (alt81) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1213:5: o= additiveOperator multiplicativeExpression
                	    {
                	    pushFollow(FOLLOW_additiveOperator_in_additiveExpression4525);
                	    o=additiveOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_multiplicativeExpression_in_additiveExpression4528);
                	    multiplicativeExpression357=multiplicativeExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, multiplicativeExpression357.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop81;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end additiveExpression

        // $ANTLR start additiveOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1216:1: additiveOperator : ( PLUS | MINUS );
        public final function additiveOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set358:Token=null;

            var set358_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1217:2: ( PLUS | MINUS )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set358=Token(input.LT(1));
                if ( (input.LA(1)>=160 && input.LA(1)<=161) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set358)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end additiveOperator

        // $ANTLR start multiplicativeExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1223:1: multiplicativeExpression : unaryExpression (o= multiplicativeOperator unaryExpression )* ;
        public final function multiplicativeExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var o:ParserRuleReturnScope = null;

            var unaryExpression359:ParserRuleReturnScope = null;

            var unaryExpression360:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1224:2: ( unaryExpression (o= multiplicativeOperator unaryExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1224:4: unaryExpression (o= multiplicativeOperator unaryExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_unaryExpression_in_multiplicativeExpression4563);
                unaryExpression359=unaryExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, unaryExpression359.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1225:3: (o= multiplicativeOperator unaryExpression )*
                loop82:
                do {
                    var alt82:int=2;
                    var LA82_0:int = input.LA(1);

                    if ( (LA82_0==93) ) {
                        var LA82_2:int = input.LA(2);

                        if ( (LA82_2==76||LA82_2==79||LA82_2==81||LA82_2==83||LA82_2==88||LA82_2==90||(LA82_2>=94 && LA82_2<=95)||LA82_2==97||(LA82_2>=101 && LA82_2<=102)||(LA82_2>=107 && LA82_2<=109)||LA82_2==115||LA82_2==131||(LA82_2>=160 && LA82_2<=161)||(LA82_2>=164 && LA82_2<=169)||(LA82_2>=171 && LA82_2<=183)||LA82_2==185) ) {
                            alt82=1;
                        }


                    }
                    else if ( ((LA82_0>=162 && LA82_0<=163)) ) {
                        alt82=1;
                    }


                    switch (alt82) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1225:5: o= multiplicativeOperator unaryExpression
                	    {
                	    pushFollow(FOLLOW_multiplicativeOperator_in_multiplicativeExpression4572);
                	    o=multiplicativeOperator();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(o.tree, root_0));
                	    pushFollow(FOLLOW_unaryExpression_in_multiplicativeExpression4575);
                	    unaryExpression360=unaryExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, unaryExpression360.tree);
                	    if ( this.state.backtracking==0 ) {
                	      demarcate((o!=null?LinkedListTree(o.tree):null));
                	    }

                	    }
                	    break;

                	default :
                	    break loop82;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end multiplicativeExpression

        // $ANTLR start multiplicativeOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1229:1: multiplicativeOperator : (s= STAR -> MULT[$s] | DIV | MOD );
        public final function multiplicativeOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var s:Token=null;
            var DIV361:Token=null;
            var MOD362:Token=null;

            var s_tree:LinkedListTree=null;
            var DIV361_tree:LinkedListTree=null;
            var MOD362_tree:LinkedListTree=null;
            var stream_STAR:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token STAR");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1230:2: (s= STAR -> MULT[$s] | DIV | MOD )
                var alt83:int=3;
                switch ( input.LA(1) ) {
                case STAR:
                    {
                    alt83=1;
                    }
                    break;
                case DIV:
                    {
                    alt83=2;
                    }
                    break;
                case MOD:
                    {
                    alt83=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 83, 0, input);

                }

                switch (alt83) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1230:4: s= STAR
                        {
                        s=Token(matchStream(input,STAR,FOLLOW_STAR_in_multiplicativeOperator4594)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_STAR.add(s);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1230:11: -> MULT[$s]
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(MULT, s)));

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1231:4: DIV
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        DIV361=Token(matchStream(input,DIV,FOLLOW_DIV_in_multiplicativeOperator4604)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        DIV361_tree = LinkedListTree(adaptor.create(DIV361));
                        adaptor.addChild(root_0, DIV361_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1232:4: MOD
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        MOD362=Token(matchStream(input,MOD,FOLLOW_MOD_in_multiplicativeOperator4609)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        MOD362_tree = LinkedListTree(adaptor.create(MOD362));
                        adaptor.addChild(root_0, MOD362_tree);
                        }

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end multiplicativeOperator

        // $ANTLR start unaryExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1241:1: unaryExpression : (inc= INC unaryExpression -> ^( PRE_INC[$inc] unaryExpression ) | de= DEC unaryExpression -> ^( PRE_DEC[$de] unaryExpression ) | MINUS unaryExpression -> ^( UNARY_MINUS unaryExpression ) | PLUS unaryExpression -> ^( UNARY_PLUS unaryExpression ) | unaryExpressionNotPlusMinus );
        public final function unaryExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var inc:Token=null;
            var de:Token=null;
            var MINUS365:Token=null;
            var PLUS367:Token=null;
            var unaryExpression363:ParserRuleReturnScope = null;

            var unaryExpression364:ParserRuleReturnScope = null;

            var unaryExpression366:ParserRuleReturnScope = null;

            var unaryExpression368:ParserRuleReturnScope = null;

            var unaryExpressionNotPlusMinus369:ParserRuleReturnScope = null;


            var inc_tree:LinkedListTree=null;
            var de_tree:LinkedListTree=null;
            var MINUS365_tree:LinkedListTree=null;
            var PLUS367_tree:LinkedListTree=null;
            var stream_DEC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DEC");
            var stream_INC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token INC");
            var stream_PLUS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token PLUS");
            var stream_MINUS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token MINUS");
            var stream_unaryExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule unaryExpression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1242:2: (inc= INC unaryExpression -> ^( PRE_INC[$inc] unaryExpression ) | de= DEC unaryExpression -> ^( PRE_DEC[$de] unaryExpression ) | MINUS unaryExpression -> ^( UNARY_MINUS unaryExpression ) | PLUS unaryExpression -> ^( UNARY_PLUS unaryExpression ) | unaryExpressionNotPlusMinus )
                var alt84:int=5;
                switch ( input.LA(1) ) {
                case INC:
                    {
                    alt84=1;
                    }
                    break;
                case DEC:
                    {
                    alt84=2;
                    }
                    break;
                case MINUS:
                    {
                    alt84=3;
                    }
                    break;
                case PLUS:
                    {
                    alt84=4;
                    }
                    break;
                case LBRACE:
                case IDENT:
                case LBRACK:
                case LPAREN:
                case STRING_LITERAL:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case FUNCTION:
                case GET:
                case SET:
                case EACH:
                case VOID:
                case DELETE:
                case TYPEOF:
                case LNOT:
                case BNOT:
                case UNDEFINED:
                case THIS:
                case SUPER:
                case NEW:
                case NULL:
                case FALSE:
                case TRUE:
                case XML_LITERAL:
                case REGEXP_LITERAL:
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                case E4X_ATTRI:
                    {
                    alt84=5;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 84, 0, input);

                }

                switch (alt84) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1242:4: inc= INC unaryExpression
                        {
                        inc=Token(matchStream(input,INC,FOLLOW_INC_in_unaryExpression4628)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_INC.add(inc);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpression4630);
                        unaryExpression363=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression363.tree);


                        // AST REWRITE
                        // elements: unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1242:28: -> ^( PRE_INC[$inc] unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1242:31: ^( PRE_INC[$inc] unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PRE_INC, inc)), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1243:4: de= DEC unaryExpression
                        {
                        de=Token(matchStream(input,DEC,FOLLOW_DEC_in_unaryExpression4648)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_DEC.add(de);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpression4650);
                        unaryExpression364=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression364.tree);


                        // AST REWRITE
                        // elements: unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1243:27: -> ^( PRE_DEC[$de] unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1243:30: ^( PRE_DEC[$de] unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PRE_DEC, de)), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1244:4: MINUS unaryExpression
                        {
                        MINUS365=Token(matchStream(input,MINUS,FOLLOW_MINUS_in_unaryExpression4666)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_MINUS.add(MINUS365);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpression4668);
                        unaryExpression366=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression366.tree);


                        // AST REWRITE
                        // elements: unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1244:26: -> ^( UNARY_MINUS unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1244:29: ^( UNARY_MINUS unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(UNARY_MINUS, "UNARY_MINUS")), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1245:4: PLUS unaryExpression
                        {
                        PLUS367=Token(matchStream(input,PLUS,FOLLOW_PLUS_in_unaryExpression4683)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_PLUS.add(PLUS367);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpression4685);
                        unaryExpression368=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression368.tree);


                        // AST REWRITE
                        // elements: unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1245:25: -> ^( UNARY_PLUS unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1245:28: ^( UNARY_PLUS unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(UNARY_PLUS, "UNARY_PLUS")), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1246:4: unaryExpressionNotPlusMinus
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_unaryExpressionNotPlusMinus_in_unaryExpression4700);
                        unaryExpressionNotPlusMinus369=unaryExpressionNotPlusMinus();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, unaryExpressionNotPlusMinus369.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end unaryExpression

        // $ANTLR start unaryExpressionNotPlusMinus
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1250:1: unaryExpressionNotPlusMinus : ( DELETE postfixExpression -> ^( DELETE postfixExpression ) | VOID unaryExpression -> ^( VOID unaryExpression ) | TYPEOF unaryExpression -> ^( TYPEOF unaryExpression ) | LNOT unaryExpression -> ^( LNOT unaryExpression ) | BNOT unaryExpression -> ^( BNOT unaryExpression ) | postfixExpression );
        public final function unaryExpressionNotPlusMinus():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var DELETE370:Token=null;
            var VOID372:Token=null;
            var TYPEOF374:Token=null;
            var LNOT376:Token=null;
            var BNOT378:Token=null;
            var postfixExpression371:ParserRuleReturnScope = null;

            var unaryExpression373:ParserRuleReturnScope = null;

            var unaryExpression375:ParserRuleReturnScope = null;

            var unaryExpression377:ParserRuleReturnScope = null;

            var unaryExpression379:ParserRuleReturnScope = null;

            var postfixExpression380:ParserRuleReturnScope = null;


            var DELETE370_tree:LinkedListTree=null;
            var VOID372_tree:LinkedListTree=null;
            var TYPEOF374_tree:LinkedListTree=null;
            var LNOT376_tree:LinkedListTree=null;
            var BNOT378_tree:LinkedListTree=null;
            var stream_LNOT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LNOT");
            var stream_BNOT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token BNOT");
            var stream_VOID:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token VOID");
            var stream_DELETE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DELETE");
            var stream_TYPEOF:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token TYPEOF");
            var stream_unaryExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule unaryExpression");
            var stream_postfixExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule postfixExpression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1251:2: ( DELETE postfixExpression -> ^( DELETE postfixExpression ) | VOID unaryExpression -> ^( VOID unaryExpression ) | TYPEOF unaryExpression -> ^( TYPEOF unaryExpression ) | LNOT unaryExpression -> ^( LNOT unaryExpression ) | BNOT unaryExpression -> ^( BNOT unaryExpression ) | postfixExpression )
                var alt85:int=6;
                switch ( input.LA(1) ) {
                case DELETE:
                    {
                    alt85=1;
                    }
                    break;
                case VOID:
                    {
                    alt85=2;
                    }
                    break;
                case TYPEOF:
                    {
                    alt85=3;
                    }
                    break;
                case LNOT:
                    {
                    alt85=4;
                    }
                    break;
                case BNOT:
                    {
                    alt85=5;
                    }
                    break;
                case LBRACE:
                case IDENT:
                case LBRACK:
                case LPAREN:
                case STRING_LITERAL:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case FUNCTION:
                case GET:
                case SET:
                case EACH:
                case UNDEFINED:
                case THIS:
                case SUPER:
                case NEW:
                case NULL:
                case FALSE:
                case TRUE:
                case XML_LITERAL:
                case REGEXP_LITERAL:
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                case E4X_ATTRI:
                    {
                    alt85=6;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 85, 0, input);

                }

                switch (alt85) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1251:4: DELETE postfixExpression
                        {
                        DELETE370=Token(matchStream(input,DELETE,FOLLOW_DELETE_in_unaryExpressionNotPlusMinus4712)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_DELETE.add(DELETE370);

                        pushFollow(FOLLOW_postfixExpression_in_unaryExpressionNotPlusMinus4714);
                        postfixExpression371=postfixExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_postfixExpression.add(postfixExpression371.tree);


                        // AST REWRITE
                        // elements: DELETE, postfixExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1251:29: -> ^( DELETE postfixExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1251:32: ^( DELETE postfixExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_DELETE.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_postfixExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1252:4: VOID unaryExpression
                        {
                        VOID372=Token(matchStream(input,VOID,FOLLOW_VOID_in_unaryExpressionNotPlusMinus4729)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_VOID.add(VOID372);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4731);
                        unaryExpression373=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression373.tree);


                        // AST REWRITE
                        // elements: VOID, unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1252:25: -> ^( VOID unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1252:28: ^( VOID unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_VOID.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1253:4: TYPEOF unaryExpression
                        {
                        TYPEOF374=Token(matchStream(input,TYPEOF,FOLLOW_TYPEOF_in_unaryExpressionNotPlusMinus4746)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_TYPEOF.add(TYPEOF374);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4748);
                        unaryExpression375=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression375.tree);


                        // AST REWRITE
                        // elements: TYPEOF, unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1253:27: -> ^( TYPEOF unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1253:30: ^( TYPEOF unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_TYPEOF.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1254:4: LNOT unaryExpression
                        {
                        LNOT376=Token(matchStream(input,LNOT,FOLLOW_LNOT_in_unaryExpressionNotPlusMinus4763)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_LNOT.add(LNOT376);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4765);
                        unaryExpression377=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression377.tree);


                        // AST REWRITE
                        // elements: LNOT, unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1254:25: -> ^( LNOT unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1254:28: ^( LNOT unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_LNOT.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1255:4: BNOT unaryExpression
                        {
                        BNOT378=Token(matchStream(input,BNOT,FOLLOW_BNOT_in_unaryExpressionNotPlusMinus4780)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_BNOT.add(BNOT378);

                        pushFollow(FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4782);
                        unaryExpression379=unaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_unaryExpression.add(unaryExpression379.tree);


                        // AST REWRITE
                        // elements: BNOT, unaryExpression
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1255:25: -> ^( BNOT unaryExpression )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1255:28: ^( BNOT unaryExpression )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(stream_BNOT.nextNode(), root_1));

                            adaptor.addChild(root_1, stream_unaryExpression.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1256:4: postfixExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_postfixExpression_in_unaryExpressionNotPlusMinus4797);
                        postfixExpression380=postfixExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, postfixExpression380.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end unaryExpressionNotPlusMinus

        // $ANTLR start postfixExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1259:1: postfixExpression : leftHandSideExpression ( postfixOperator )? ;
        public final function postfixExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var leftHandSideExpression381:ParserRuleReturnScope = null;

            var postfixOperator382:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1260:2: ( leftHandSideExpression ( postfixOperator )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1260:4: leftHandSideExpression ( postfixOperator )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_leftHandSideExpression_in_postfixExpression4808);
                leftHandSideExpression381=leftHandSideExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, leftHandSideExpression381.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1260:27: ( postfixOperator )?
                var alt86:int=2;
                var LA86_0:int = input.LA(1);

                if ( ((LA86_0>=164 && LA86_0<=165)) ) {
                    alt86=1;
                }
                switch (alt86) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1260:29: postfixOperator
                        {
                        pushFollow(FOLLOW_postfixOperator_in_postfixExpression4812);
                        postfixOperator382=postfixOperator();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) root_0 = LinkedListTree(adaptor.becomeRoot(postfixOperator382.tree, root_0));

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end postfixExpression

        // $ANTLR start postfixOperator
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1263:1: postfixOperator : (inc= INC -> ^( POST_INC[$inc] ) | de= DEC -> ^( POST_DEC[$de] ) );
        public final function postfixOperator():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var inc:Token=null;
            var de:Token=null;

            var inc_tree:LinkedListTree=null;
            var de_tree:LinkedListTree=null;
            var stream_DEC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DEC");
            var stream_INC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token INC");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1264:2: (inc= INC -> ^( POST_INC[$inc] ) | de= DEC -> ^( POST_DEC[$de] ) )
                var alt87:int=2;
                var LA87_0:int = input.LA(1);

                if ( (LA87_0==164) ) {
                    alt87=1;
                }
                else if ( (LA87_0==165) ) {
                    alt87=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 87, 0, input);

                }
                switch (alt87) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1264:4: inc= INC
                        {
                        inc=Token(matchStream(input,INC,FOLLOW_INC_in_postfixOperator4829)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_INC.add(inc);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1264:12: -> ^( POST_INC[$inc] )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1264:15: ^( POST_INC[$inc] )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(POST_INC, inc)), root_1));

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1265:4: de= DEC
                        {
                        de=Token(matchStream(input,DEC,FOLLOW_DEC_in_postfixOperator4845)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_DEC.add(de);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1265:11: -> ^( POST_DEC[$de] )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1265:14: ^( POST_DEC[$de] )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(POST_DEC, de)), root_1));

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end postfixOperator

        // $ANTLR start leftHandSideExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1268:1: leftHandSideExpression : ( memberExpression -> memberExpression ) ( ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) ) | ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) ) | ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) ) | typePostfixSyntax -> ^( $leftHandSideExpression memberExpression typePostfixSyntax ) | DOT LPAREN expression RPAREN -> ^( E4X_FILTER $leftHandSideExpression expression ) | DBL_COLON eitherIdentifier -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier ) | DOT e4xAttributeIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier ) | E4X_DESC e4xExpression -> ^( E4X_DESC $leftHandSideExpression e4xExpression ) )* ;
        public final function leftHandSideExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var rb:Token=null;
            var LBRACK385:Token=null;
            var DOT387:Token=null;
            var DOT390:Token=null;
            var LPAREN391:Token=null;
            var RPAREN393:Token=null;
            var DBL_COLON394:Token=null;
            var DOT396:Token=null;
            var E4X_DESC398:Token=null;
            var memberExpression383:ParserRuleReturnScope = null;

            var argumentList384:ParserRuleReturnScope = null;

            var expression386:ParserRuleReturnScope = null;

            var eitherIdentifier388:ParserRuleReturnScope = null;

            var typePostfixSyntax389:ParserRuleReturnScope = null;

            var expression392:ParserRuleReturnScope = null;

            var eitherIdentifier395:ParserRuleReturnScope = null;

            var e4xAttributeIdentifier397:ParserRuleReturnScope = null;

            var e4xExpression399:ParserRuleReturnScope = null;


            var rb_tree:LinkedListTree=null;
            var LBRACK385_tree:LinkedListTree=null;
            var DOT387_tree:LinkedListTree=null;
            var DOT390_tree:LinkedListTree=null;
            var LPAREN391_tree:LinkedListTree=null;
            var RPAREN393_tree:LinkedListTree=null;
            var DBL_COLON394_tree:LinkedListTree=null;
            var DOT396_tree:LinkedListTree=null;
            var E4X_DESC398_tree:LinkedListTree=null;
            var stream_RBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACK");
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_E4X_DESC:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token E4X_DESC");
            var stream_LBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACK");
            var stream_DOT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DOT");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_DBL_COLON:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token DBL_COLON");
            var stream_memberExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule memberExpression");
            var stream_expression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expression");
            var stream_eitherIdentifier:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule eitherIdentifier");
            var stream_typePostfixSyntax:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typePostfixSyntax");
            var stream_e4xAttributeIdentifier:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule e4xAttributeIdentifier");
            var stream_argumentList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule argumentList");
            var stream_e4xExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule e4xExpression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1269:2: ( ( memberExpression -> memberExpression ) ( ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) ) | ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) ) | ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) ) | typePostfixSyntax -> ^( $leftHandSideExpression memberExpression typePostfixSyntax ) | DOT LPAREN expression RPAREN -> ^( E4X_FILTER $leftHandSideExpression expression ) | DBL_COLON eitherIdentifier -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier ) | DOT e4xAttributeIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier ) | E4X_DESC e4xExpression -> ^( E4X_DESC $leftHandSideExpression e4xExpression ) )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1270:2: ( memberExpression -> memberExpression ) ( ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) ) | ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) ) | ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) ) | typePostfixSyntax -> ^( $leftHandSideExpression memberExpression typePostfixSyntax ) | DOT LPAREN expression RPAREN -> ^( E4X_FILTER $leftHandSideExpression expression ) | DBL_COLON eitherIdentifier -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier ) | DOT e4xAttributeIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier ) | E4X_DESC e4xExpression -> ^( E4X_DESC $leftHandSideExpression e4xExpression ) )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1270:2: ( memberExpression -> memberExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1271:3: memberExpression
                {
                pushFollow(FOLLOW_memberExpression_in_leftHandSideExpression4870);
                memberExpression383=memberExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_memberExpression.add(memberExpression383.tree);


                // AST REWRITE
                // elements: memberExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1271:22: -> memberExpression
                {
                    adaptor.addChild(root_0, stream_memberExpression.nextTree());

                }

                retval.tree = root_0;}
                }

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1273:2: ( ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) ) | ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) ) | ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) ) | typePostfixSyntax -> ^( $leftHandSideExpression memberExpression typePostfixSyntax ) | DOT LPAREN expression RPAREN -> ^( E4X_FILTER $leftHandSideExpression expression ) | DBL_COLON eitherIdentifier -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier ) | DOT e4xAttributeIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier ) | E4X_DESC e4xExpression -> ^( E4X_DESC $leftHandSideExpression e4xExpression ) )*
                loop88:
                do {
                    var alt88:int=9;
                    alt88 = dfa88.predict(input);
                    switch (alt88) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1274:3: ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) )
                	    {
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1274:3: ( argumentList -> ^( FUNCTION_CALL $leftHandSideExpression argumentList ) )
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1274:4: argumentList
                	    {
                	    pushFollow(FOLLOW_argumentList_in_leftHandSideExpression4887);
                	    argumentList384=argumentList();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_argumentList.add(argumentList384.tree);


                	    // AST REWRITE
                	    // elements: leftHandSideExpression, argumentList
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1274:19: -> ^( FUNCTION_CALL $leftHandSideExpression argumentList )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1274:22: ^( FUNCTION_CALL $leftHandSideExpression argumentList )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FUNCTION_CALL, "FUNCTION_CALL")), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_argumentList.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }

                	    if ( this.state.backtracking==0 ) {
                	      demarcate(root_0.getFirstChild());
                	    }

                	    }
                	    break;
                	case 2 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1275:5: ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) )
                	    {
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1275:5: ( LBRACK expression rb= RBRACK -> ^( ARRAY_ACCESS $leftHandSideExpression expression ) )
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1275:6: LBRACK expression rb= RBRACK
                	    {
                	    LBRACK385=Token(matchStream(input,LBRACK,FOLLOW_LBRACK_in_leftHandSideExpression4912)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_LBRACK.add(LBRACK385);

                	    pushFollow(FOLLOW_expression_in_leftHandSideExpression4914);
                	    expression386=expression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_expression.add(expression386.tree);
                	    rb=Token(matchStream(input,RBRACK,FOLLOW_RBRACK_in_leftHandSideExpression4918)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_RBRACK.add(rb);



                	    // AST REWRITE
                	    // elements: leftHandSideExpression, expression
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1275:34: -> ^( ARRAY_ACCESS $leftHandSideExpression expression )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1275:37: ^( ARRAY_ACCESS $leftHandSideExpression expression )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ARRAY_ACCESS, "ARRAY_ACCESS")), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_expression.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }

                	    if ( this.state.backtracking==0 ) {
                	      demarcate(root_0.getFirstChild()); root_0.getFirstChild().setStopToken(LinkedListToken(rb));
                	    }

                	    }
                	    break;
                	case 3 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1276:5: ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) )
                	    {
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1276:5: ( DOT eitherIdentifier -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier ) )
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1276:6: DOT eitherIdentifier
                	    {
                	    DOT387=Token(matchStream(input,DOT,FOLLOW_DOT_in_leftHandSideExpression4941)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_DOT.add(DOT387);

                	    pushFollow(FOLLOW_eitherIdentifier_in_leftHandSideExpression4943);
                	    eitherIdentifier388=eitherIdentifier();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_eitherIdentifier.add(eitherIdentifier388.tree);


                	    // AST REWRITE
                	    // elements: eitherIdentifier, leftHandSideExpression
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1276:28: -> ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1276:31: ^( FIELD_ACCESS $leftHandSideExpression eitherIdentifier )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FIELD_ACCESS, "FIELD_ACCESS")), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_eitherIdentifier.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }

                	    if ( this.state.backtracking==0 ) {
                	      demarcate(root_0.getFirstChild());
                	    }

                	    }
                	    break;
                	case 4 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1277:5: typePostfixSyntax
                	    {
                	    pushFollow(FOLLOW_typePostfixSyntax_in_leftHandSideExpression4966);
                	    typePostfixSyntax389=typePostfixSyntax();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_typePostfixSyntax.add(typePostfixSyntax389.tree);


                	    // AST REWRITE
                	    // elements: leftHandSideExpression, typePostfixSyntax, memberExpression
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1277:24: -> ^( $leftHandSideExpression memberExpression typePostfixSyntax )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1277:27: ^( $leftHandSideExpression memberExpression typePostfixSyntax )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(stream_retval.nextNode(), root_1));

                	        adaptor.addChild(root_1, stream_memberExpression.nextTree());
                	        adaptor.addChild(root_1, stream_typePostfixSyntax.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }
                	    break;
                	case 5 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1278:5: DOT LPAREN expression RPAREN
                	    {
                	    DOT390=Token(matchStream(input,DOT,FOLLOW_DOT_in_leftHandSideExpression4986)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_DOT.add(DOT390);

                	    LPAREN391=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_leftHandSideExpression4988)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN391);

                	    pushFollow(FOLLOW_expression_in_leftHandSideExpression4990);
                	    expression392=expression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_expression.add(expression392.tree);
                	    RPAREN393=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_leftHandSideExpression4992)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN393);



                	    // AST REWRITE
                	    // elements: leftHandSideExpression, expression
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1278:34: -> ^( E4X_FILTER $leftHandSideExpression expression )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1278:37: ^( E4X_FILTER $leftHandSideExpression expression )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(E4X_FILTER, "E4X_FILTER")), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_expression.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }
                	    break;
                	case 6 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1279:5: DBL_COLON eitherIdentifier
                	    {
                	    DBL_COLON394=Token(matchStream(input,DBL_COLON,FOLLOW_DBL_COLON_in_leftHandSideExpression5011)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_DBL_COLON.add(DBL_COLON394);

                	    pushFollow(FOLLOW_eitherIdentifier_in_leftHandSideExpression5013);
                	    eitherIdentifier395=eitherIdentifier();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_eitherIdentifier.add(eitherIdentifier395.tree);


                	    // AST REWRITE
                	    // elements: leftHandSideExpression, DBL_COLON, eitherIdentifier
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1279:32: -> ^( DBL_COLON $leftHandSideExpression eitherIdentifier )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1279:35: ^( DBL_COLON $leftHandSideExpression eitherIdentifier )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(stream_DBL_COLON.nextNode(), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_eitherIdentifier.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }
                	    break;
                	case 7 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1280:5: DOT e4xAttributeIdentifier
                	    {
                	    DOT396=Token(matchStream(input,DOT,FOLLOW_DOT_in_leftHandSideExpression5032)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_DOT.add(DOT396);

                	    pushFollow(FOLLOW_e4xAttributeIdentifier_in_leftHandSideExpression5034);
                	    e4xAttributeIdentifier397=e4xAttributeIdentifier();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_e4xAttributeIdentifier.add(e4xAttributeIdentifier397.tree);


                	    // AST REWRITE
                	    // elements: e4xAttributeIdentifier, leftHandSideExpression
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1280:32: -> ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1280:35: ^( FIELD_ACCESS $leftHandSideExpression e4xAttributeIdentifier )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FIELD_ACCESS, "FIELD_ACCESS")), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_e4xAttributeIdentifier.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }
                	    break;
                	case 8 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1281:5: E4X_DESC e4xExpression
                	    {
                	    E4X_DESC398=Token(matchStream(input,E4X_DESC,FOLLOW_E4X_DESC_in_leftHandSideExpression5053)); if (this.state.failed) return retval; 
                	    if ( this.state.backtracking==0 ) stream_E4X_DESC.add(E4X_DESC398);

                	    pushFollow(FOLLOW_e4xExpression_in_leftHandSideExpression5055);
                	    e4xExpression399=e4xExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_e4xExpression.add(e4xExpression399.tree);


                	    // AST REWRITE
                	    // elements: leftHandSideExpression, e4xExpression, E4X_DESC
                	    // token labels: 
                	    // rule labels: retval
                	    // token list labels: 
                	    // rule list labels: 
                	    if ( this.state.backtracking==0 ) {
                	    retval.tree = root_0;
                	    var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                	    root_0 = LinkedListTree(adaptor.nil());
                	    // 1281:28: -> ^( E4X_DESC $leftHandSideExpression e4xExpression )
                	    {
                	        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1281:31: ^( E4X_DESC $leftHandSideExpression e4xExpression )
                	        {
                	        var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                	        root_1 = LinkedListTree(adaptor.becomeRoot(stream_E4X_DESC.nextNode(), root_1));

                	        adaptor.addChild(root_1, stream_retval.nextTree());
                	        adaptor.addChild(root_1, stream_e4xExpression.nextTree());

                	        adaptor.addChild(root_0, root_1);
                	        }

                	    }

                	    retval.tree = root_0;}
                	    }
                	    break;

                	default :
                	    break loop88;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end leftHandSideExpression

        // $ANTLR start eitherIdentifier
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1285:1: eitherIdentifier : IDENT ;
        public final function eitherIdentifier():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT400:Token=null;

            var IDENT400_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1286:2: ( IDENT )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1286:4: IDENT
                {
                root_0 = LinkedListTree(adaptor.nil());

                IDENT400=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_eitherIdentifier5086)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IDENT400_tree = LinkedListTree(adaptor.create(IDENT400));
                adaptor.addChild(root_0, IDENT400_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end eitherIdentifier

        // $ANTLR start memberExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1291:1: memberExpression : ( primaryExpression | functionExpression | newExpression );
        public final function memberExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var primaryExpression401:ParserRuleReturnScope = null;

            var functionExpression402:ParserRuleReturnScope = null;

            var newExpression403:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1292:2: ( primaryExpression | functionExpression | newExpression )
                var alt89:int=3;
                switch ( input.LA(1) ) {
                case LBRACE:
                case IDENT:
                case LBRACK:
                case LPAREN:
                case STRING_LITERAL:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case GET:
                case SET:
                case EACH:
                case UNDEFINED:
                case THIS:
                case SUPER:
                case NULL:
                case FALSE:
                case TRUE:
                case XML_LITERAL:
                case REGEXP_LITERAL:
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                case E4X_ATTRI:
                    {
                    alt89=1;
                    }
                    break;
                case FUNCTION:
                    {
                    alt89=2;
                    }
                    break;
                case NEW:
                    {
                    alt89=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 89, 0, input);

                }

                switch (alt89) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1292:4: primaryExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_primaryExpression_in_memberExpression5099);
                        primaryExpression401=primaryExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, primaryExpression401.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1293:4: functionExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_functionExpression_in_memberExpression5104);
                        functionExpression402=functionExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, functionExpression402.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1294:4: newExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_newExpression_in_memberExpression5109);
                        newExpression403=newExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, newExpression403.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end memberExpression

        // $ANTLR start primaryExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1297:1: primaryExpression : primaryExpressionHelper ;
        public final function primaryExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var primaryExpressionHelper404:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1298:2: ( primaryExpressionHelper )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1298:4: primaryExpressionHelper
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_primaryExpressionHelper_in_primaryExpression5120);
                primaryExpressionHelper404=primaryExpressionHelper();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, primaryExpressionHelper404.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end primaryExpression

        // $ANTLR start primaryExpressionHelper
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1301:1: primaryExpressionHelper : ( UNDEFINED | THIS | SUPER | identiferLiteral | constant | arrayLiteral | objectLiteral | encapsulatedExpression | e4xAttributeIdentifier );
        public final function primaryExpressionHelper():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var UNDEFINED405:Token=null;
            var THIS406:Token=null;
            var SUPER407:Token=null;
            var identiferLiteral408:ParserRuleReturnScope = null;

            var constant409:ParserRuleReturnScope = null;

            var arrayLiteral410:ParserRuleReturnScope = null;

            var objectLiteral411:ParserRuleReturnScope = null;

            var encapsulatedExpression412:ParserRuleReturnScope = null;

            var e4xAttributeIdentifier413:ParserRuleReturnScope = null;


            var UNDEFINED405_tree:LinkedListTree=null;
            var THIS406_tree:LinkedListTree=null;
            var SUPER407_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1302:2: ( UNDEFINED | THIS | SUPER | identiferLiteral | constant | arrayLiteral | objectLiteral | encapsulatedExpression | e4xAttributeIdentifier )
                var alt90:int=9;
                switch ( input.LA(1) ) {
                case UNDEFINED:
                    {
                    alt90=1;
                    }
                    break;
                case THIS:
                    {
                    alt90=2;
                    }
                    break;
                case SUPER:
                    {
                    alt90=3;
                    }
                    break;
                case IDENT:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case GET:
                case SET:
                case EACH:
                    {
                    alt90=4;
                    }
                    break;
                case STRING_LITERAL:
                case NULL:
                case FALSE:
                case TRUE:
                case XML_LITERAL:
                case REGEXP_LITERAL:
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                    {
                    alt90=5;
                    }
                    break;
                case LBRACK:
                    {
                    alt90=6;
                    }
                    break;
                case LBRACE:
                    {
                    alt90=7;
                    }
                    break;
                case LPAREN:
                    {
                    alt90=8;
                    }
                    break;
                case E4X_ATTRI:
                    {
                    alt90=9;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 90, 0, input);

                }

                switch (alt90) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1302:4: UNDEFINED
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        UNDEFINED405=Token(matchStream(input,UNDEFINED,FOLLOW_UNDEFINED_in_primaryExpressionHelper5131)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        UNDEFINED405_tree = LinkedListTree(adaptor.create(UNDEFINED405));
                        adaptor.addChild(root_0, UNDEFINED405_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1303:4: THIS
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        THIS406=Token(matchStream(input,THIS,FOLLOW_THIS_in_primaryExpressionHelper5136)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        THIS406_tree = LinkedListTree(adaptor.create(THIS406));
                        adaptor.addChild(root_0, THIS406_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1304:4: SUPER
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        SUPER407=Token(matchStream(input,SUPER,FOLLOW_SUPER_in_primaryExpressionHelper5141)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        SUPER407_tree = LinkedListTree(adaptor.create(SUPER407));
                        adaptor.addChild(root_0, SUPER407_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1305:4: identiferLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_identiferLiteral_in_primaryExpressionHelper5146);
                        identiferLiteral408=identiferLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, identiferLiteral408.tree);

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1306:4: constant
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_constant_in_primaryExpressionHelper5151);
                        constant409=constant();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, constant409.tree);

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1307:4: arrayLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_arrayLiteral_in_primaryExpressionHelper5156);
                        arrayLiteral410=arrayLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, arrayLiteral410.tree);

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1308:4: objectLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_objectLiteral_in_primaryExpressionHelper5161);
                        objectLiteral411=objectLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, objectLiteral411.tree);

                        }
                        break;
                    case 8 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1309:4: encapsulatedExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_encapsulatedExpression_in_primaryExpressionHelper5166);
                        encapsulatedExpression412=encapsulatedExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, encapsulatedExpression412.tree);

                        }
                        break;
                    case 9 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1310:4: e4xAttributeIdentifier
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_e4xAttributeIdentifier_in_primaryExpressionHelper5171);
                        e4xAttributeIdentifier413=e4xAttributeIdentifier();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, e4xAttributeIdentifier413.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end primaryExpressionHelper

        // $ANTLR start newExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1314:1: newExpression : NEW primaryExpression ;
        public final function newExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var NEW414:Token=null;
            var primaryExpression415:ParserRuleReturnScope = null;


            var NEW414_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1315:2: ( NEW primaryExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1315:4: NEW primaryExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                NEW414=Token(matchStream(input,NEW,FOLLOW_NEW_in_newExpression5183)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                NEW414_tree = LinkedListTree(adaptor.create(NEW414));
                root_0 = LinkedListTree(adaptor.becomeRoot(NEW414_tree, root_0));
                }
                pushFollow(FOLLOW_primaryExpression_in_newExpression5186);
                primaryExpression415=primaryExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, primaryExpression415.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end newExpression

        // $ANTLR start identiferLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1322:1: identiferLiteral : ( IDENT | notQuiteReservedWord );
        public final function identiferLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT416:Token=null;
            var notQuiteReservedWord417:ParserRuleReturnScope = null;


            var IDENT416_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1323:2: ( IDENT | notQuiteReservedWord )
                var alt91:int=2;
                var LA91_0:int = input.LA(1);

                if ( (LA91_0==79) ) {
                    alt91=1;
                }
                else if ( (LA91_0==90||(LA91_0>=94 && LA91_0<=95)||LA91_0==97||(LA91_0>=101 && LA91_0<=102)||(LA91_0>=108 && LA91_0<=109)||LA91_0==115) ) {
                    alt91=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 91, 0, input);

                }
                switch (alt91) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1323:4: IDENT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        IDENT416=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_identiferLiteral5202)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        IDENT416_tree = LinkedListTree(adaptor.create(IDENT416));
                        adaptor.addChild(root_0, IDENT416_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1324:4: notQuiteReservedWord
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_notQuiteReservedWord_in_identiferLiteral5208);
                        notQuiteReservedWord417=notQuiteReservedWord();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, notQuiteReservedWord417.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end identiferLiteral

        // $ANTLR start constant
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1328:1: constant : ( NULL | FALSE | TRUE | numericLiteral | stringLiteral | XML_LITERAL | REGEXP_LITERAL );
        public final function constant():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var NULL418:Token=null;
            var FALSE419:Token=null;
            var TRUE420:Token=null;
            var XML_LITERAL423:Token=null;
            var REGEXP_LITERAL424:Token=null;
            var numericLiteral421:ParserRuleReturnScope = null;

            var stringLiteral422:ParserRuleReturnScope = null;


            var NULL418_tree:LinkedListTree=null;
            var FALSE419_tree:LinkedListTree=null;
            var TRUE420_tree:LinkedListTree=null;
            var XML_LITERAL423_tree:LinkedListTree=null;
            var REGEXP_LITERAL424_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1329:2: ( NULL | FALSE | TRUE | numericLiteral | stringLiteral | XML_LITERAL | REGEXP_LITERAL )
                var alt92:int=7;
                switch ( input.LA(1) ) {
                case NULL:
                    {
                    alt92=1;
                    }
                    break;
                case FALSE:
                    {
                    alt92=2;
                    }
                    break;
                case TRUE:
                    {
                    alt92=3;
                    }
                    break;
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                    {
                    alt92=4;
                    }
                    break;
                case STRING_LITERAL:
                    {
                    alt92=5;
                    }
                    break;
                case XML_LITERAL:
                    {
                    alt92=6;
                    }
                    break;
                case REGEXP_LITERAL:
                    {
                    alt92=7;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 92, 0, input);

                }

                switch (alt92) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1330:3: NULL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        NULL418=Token(matchStream(input,NULL,FOLLOW_NULL_in_constant5224)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        NULL418_tree = LinkedListTree(adaptor.create(NULL418));
                        adaptor.addChild(root_0, NULL418_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1331:4: FALSE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        FALSE419=Token(matchStream(input,FALSE,FOLLOW_FALSE_in_constant5229)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        FALSE419_tree = LinkedListTree(adaptor.create(FALSE419));
                        adaptor.addChild(root_0, FALSE419_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1332:4: TRUE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        TRUE420=Token(matchStream(input,TRUE,FOLLOW_TRUE_in_constant5234)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        TRUE420_tree = LinkedListTree(adaptor.create(TRUE420));
                        adaptor.addChild(root_0, TRUE420_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1333:4: numericLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_numericLiteral_in_constant5239);
                        numericLiteral421=numericLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, numericLiteral421.tree);

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1334:4: stringLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_stringLiteral_in_constant5244);
                        stringLiteral422=stringLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, stringLiteral422.tree);

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1336:5: XML_LITERAL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        XML_LITERAL423=Token(matchStream(input,XML_LITERAL,FOLLOW_XML_LITERAL_in_constant5251)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        XML_LITERAL423_tree = LinkedListTree(adaptor.create(XML_LITERAL423));
                        adaptor.addChild(root_0, XML_LITERAL423_tree);
                        }

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1338:4: REGEXP_LITERAL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        REGEXP_LITERAL424=Token(matchStream(input,REGEXP_LITERAL,FOLLOW_REGEXP_LITERAL_in_constant5257)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        REGEXP_LITERAL424_tree = LinkedListTree(adaptor.create(REGEXP_LITERAL424));
                        adaptor.addChild(root_0, REGEXP_LITERAL424_tree);
                        }

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end constant

        // $ANTLR start numericLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1363:1: numericLiteral : ( HEX_LITERAL | DECIMAL_LITERAL | OCTAL_LITERAL | FLOAT_LITERAL );
        public final function numericLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set425:Token=null;

            var set425_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1364:2: ( HEX_LITERAL | DECIMAL_LITERAL | OCTAL_LITERAL | FLOAT_LITERAL )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set425=Token(input.LT(1));
                if ( (input.LA(1)>=180 && input.LA(1)<=183) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set425)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end numericLiteral

        // $ANTLR start stringLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1371:1: stringLiteral : STRING_LITERAL ;
        public final function stringLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var STRING_LITERAL426:Token=null;

            var STRING_LITERAL426_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1372:2: ( STRING_LITERAL )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1372:4: STRING_LITERAL
                {
                root_0 = LinkedListTree(adaptor.nil());

                STRING_LITERAL426=Token(matchStream(input,STRING_LITERAL,FOLLOW_STRING_LITERAL_in_stringLiteral5300)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                STRING_LITERAL426_tree = LinkedListTree(adaptor.create(STRING_LITERAL426));
                adaptor.addChild(root_0, STRING_LITERAL426_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end stringLiteral

        // $ANTLR start arrayLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1380:1: arrayLiteral : LBRACK ( elementList )? RBRACK -> ^( ARRAY_LITERAL ( elementList )? ) ;
        public final function arrayLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACK427:Token=null;
            var RBRACK429:Token=null;
            var elementList428:ParserRuleReturnScope = null;


            var LBRACK427_tree:LinkedListTree=null;
            var RBRACK429_tree:LinkedListTree=null;
            var stream_RBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACK");
            var stream_LBRACK:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACK");
            var stream_elementList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule elementList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1381:2: ( LBRACK ( elementList )? RBRACK -> ^( ARRAY_LITERAL ( elementList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1381:4: LBRACK ( elementList )? RBRACK
                {
                LBRACK427=Token(matchStream(input,LBRACK,FOLLOW_LBRACK_in_arrayLiteral5316)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACK.add(LBRACK427);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1381:11: ( elementList )?
                var alt93:int=2;
                var LA93_0:int = input.LA(1);

                if ( (LA93_0==76||LA93_0==79||LA93_0==81||(LA93_0>=83 && LA93_0<=84)||LA93_0==88||LA93_0==90||(LA93_0>=94 && LA93_0<=95)||LA93_0==97||(LA93_0>=101 && LA93_0<=102)||(LA93_0>=107 && LA93_0<=109)||LA93_0==115||LA93_0==131||(LA93_0>=160 && LA93_0<=161)||(LA93_0>=164 && LA93_0<=169)||(LA93_0>=171 && LA93_0<=183)||LA93_0==185) ) {
                    alt93=1;
                }
                switch (alt93) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1381:11: elementList
                        {
                        pushFollow(FOLLOW_elementList_in_arrayLiteral5318);
                        elementList428=elementList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_elementList.add(elementList428.tree);

                        }
                        break;

                }

                RBRACK429=Token(matchStream(input,RBRACK,FOLLOW_RBRACK_in_arrayLiteral5321)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACK.add(RBRACK429);



                // AST REWRITE
                // elements: elementList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1382:3: -> ^( ARRAY_LITERAL ( elementList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1382:6: ^( ARRAY_LITERAL ( elementList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ARRAY_LITERAL, "ARRAY_LITERAL")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1382:23: ( elementList )?
                    if ( stream_elementList.hasNext ) {
                        adaptor.addChild(root_1, stream_elementList.nextTree());

                    }
                    stream_elementList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end arrayLiteral

        // $ANTLR start elementList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1386:1: elementList : ( COMMA | nonemptyElementList );
        public final function elementList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA430:Token=null;
            var nonemptyElementList431:ParserRuleReturnScope = null;


            var COMMA430_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1387:2: ( COMMA | nonemptyElementList )
                var alt94:int=2;
                var LA94_0:int = input.LA(1);

                if ( (LA94_0==84) ) {
                    alt94=1;
                }
                else if ( (LA94_0==76||LA94_0==79||LA94_0==81||LA94_0==83||LA94_0==88||LA94_0==90||(LA94_0>=94 && LA94_0<=95)||LA94_0==97||(LA94_0>=101 && LA94_0<=102)||(LA94_0>=107 && LA94_0<=109)||LA94_0==115||LA94_0==131||(LA94_0>=160 && LA94_0<=161)||(LA94_0>=164 && LA94_0<=169)||(LA94_0>=171 && LA94_0<=183)||LA94_0==185) ) {
                    alt94=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 94, 0, input);

                }
                switch (alt94) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1387:4: COMMA
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        COMMA430=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_elementList5346)); if (this.state.failed) return retval;

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1388:4: nonemptyElementList
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_nonemptyElementList_in_elementList5352);
                        nonemptyElementList431=nonemptyElementList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, nonemptyElementList431.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end elementList

        // $ANTLR start nonemptyElementList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1392:1: nonemptyElementList : assignmentExpression ( COMMA assignmentExpression )* ;
        public final function nonemptyElementList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA433:Token=null;
            var assignmentExpression432:ParserRuleReturnScope = null;

            var assignmentExpression434:ParserRuleReturnScope = null;


            var COMMA433_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1393:2: ( assignmentExpression ( COMMA assignmentExpression )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1393:4: assignmentExpression ( COMMA assignmentExpression )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_assignmentExpression_in_nonemptyElementList5364);
                assignmentExpression432=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression432.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1393:25: ( COMMA assignmentExpression )*
                loop95:
                do {
                    var alt95:int=2;
                    var LA95_0:int = input.LA(1);

                    if ( (LA95_0==84) ) {
                        alt95=1;
                    }


                    switch (alt95) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1393:27: COMMA assignmentExpression
                	    {
                	    COMMA433=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_nonemptyElementList5368)); if (this.state.failed) return retval;
                	    pushFollow(FOLLOW_assignmentExpression_in_nonemptyElementList5371);
                	    assignmentExpression434=assignmentExpression();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression434.tree);

                	    }
                	    break;

                	default :
                	    break loop95;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end nonemptyElementList

        // $ANTLR start objectLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1401:1: objectLiteral : LBRACE ( fieldList )? RBRACE -> ^( OBJECT_LITERAL ( fieldList )? ) ;
        public final function objectLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE435:Token=null;
            var RBRACE437:Token=null;
            var fieldList436:ParserRuleReturnScope = null;


            var LBRACE435_tree:LinkedListTree=null;
            var RBRACE437_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_fieldList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule fieldList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1402:2: ( LBRACE ( fieldList )? RBRACE -> ^( OBJECT_LITERAL ( fieldList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1402:4: LBRACE ( fieldList )? RBRACE
                {
                LBRACE435=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_objectLiteral5390)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE435);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1402:11: ( fieldList )?
                var alt96:int=2;
                var LA96_0:int = input.LA(1);

                if ( (LA96_0==79||LA96_0==88||LA96_0==90||(LA96_0>=94 && LA96_0<=95)||LA96_0==97||(LA96_0>=101 && LA96_0<=102)||(LA96_0>=108 && LA96_0<=109)||LA96_0==115||(LA96_0>=180 && LA96_0<=183)) ) {
                    alt96=1;
                }
                switch (alt96) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1402:11: fieldList
                        {
                        pushFollow(FOLLOW_fieldList_in_objectLiteral5392);
                        fieldList436=fieldList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_fieldList.add(fieldList436.tree);

                        }
                        break;

                }

                RBRACE437=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_objectLiteral5395)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE437);



                // AST REWRITE
                // elements: fieldList
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1403:3: -> ^( OBJECT_LITERAL ( fieldList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1403:6: ^( OBJECT_LITERAL ( fieldList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(OBJECT_LITERAL, "OBJECT_LITERAL")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1403:24: ( fieldList )?
                    if ( stream_fieldList.hasNext ) {
                        adaptor.addChild(root_1, stream_fieldList.nextTree());

                    }
                    stream_fieldList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end objectLiteral

        // $ANTLR start fieldList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1407:1: fieldList : literalField ( COMMA ( literalField )? )* ;
        public final function fieldList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COMMA439:Token=null;
            var literalField438:ParserRuleReturnScope = null;

            var literalField440:ParserRuleReturnScope = null;


            var COMMA439_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:2: ( literalField ( COMMA ( literalField )? )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:4: literalField ( COMMA ( literalField )? )*
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_literalField_in_fieldList5420);
                literalField438=literalField();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, literalField438.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:17: ( COMMA ( literalField )? )*
                loop98:
                do {
                    var alt98:int=2;
                    var LA98_0:int = input.LA(1);

                    if ( (LA98_0==84) ) {
                        alt98=1;
                    }


                    switch (alt98) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:19: COMMA ( literalField )?
                	    {
                	    COMMA439=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_fieldList5424)); if (this.state.failed) return retval;
                	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:26: ( literalField )?
                	    var alt97:int=2;
                	    var LA97_0:int = input.LA(1);

                	    if ( (LA97_0==79||LA97_0==88||LA97_0==90||(LA97_0>=94 && LA97_0<=95)||LA97_0==97||(LA97_0>=101 && LA97_0<=102)||(LA97_0>=108 && LA97_0<=109)||LA97_0==115||(LA97_0>=180 && LA97_0<=183)) ) {
                	        alt97=1;
                	    }
                	    switch (alt97) {
                	        case 1 :
                	            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1408:26: literalField
                	            {
                	            pushFollow(FOLLOW_literalField_in_fieldList5427);
                	            literalField440=literalField();

                	            state._fsp = state._fsp - 1;
                	            if (this.state.failed) return retval;
                	            if ( this.state.backtracking==0 ) adaptor.addChild(root_0, literalField440.tree);

                	            }
                	            break;

                	    }


                	    }
                	    break;

                	default :
                	    break loop98;
                    }
                } while (true);


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end fieldList

        // $ANTLR start literalField
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1412:1: literalField : fieldName COLON element -> ^( OBJECT_FIELD fieldName element ) ;
        public final function literalField():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var COLON442:Token=null;
            var fieldName441:ParserRuleReturnScope = null;

            var element443:ParserRuleReturnScope = null;


            var COLON442_tree:LinkedListTree=null;
            var stream_COLON:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COLON");
            var stream_element:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule element");
            var stream_fieldName:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule fieldName");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1413:2: ( fieldName COLON element -> ^( OBJECT_FIELD fieldName element ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1413:4: fieldName COLON element
                {
                pushFollow(FOLLOW_fieldName_in_literalField5443);
                fieldName441=fieldName();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_fieldName.add(fieldName441.tree);
                COLON442=Token(matchStream(input,COLON,FOLLOW_COLON_in_literalField5445)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_COLON.add(COLON442);

                pushFollow(FOLLOW_element_in_literalField5447);
                element443=element();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_element.add(element443.tree);


                // AST REWRITE
                // elements: element, fieldName
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1414:3: -> ^( OBJECT_FIELD fieldName element )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1414:6: ^( OBJECT_FIELD fieldName element )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(OBJECT_FIELD, "OBJECT_FIELD")), root_1));

                    adaptor.addChild(root_1, stream_fieldName.nextTree());
                    adaptor.addChild(root_1, stream_element.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end literalField

        // $ANTLR start fieldName
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1418:1: fieldName : ( identiferLiteral | numericLiteral | stringLiteral );
        public final function fieldName():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var identiferLiteral444:ParserRuleReturnScope = null;

            var numericLiteral445:ParserRuleReturnScope = null;

            var stringLiteral446:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1419:2: ( identiferLiteral | numericLiteral | stringLiteral )
                var alt99:int=3;
                switch ( input.LA(1) ) {
                case IDENT:
                case NAMESPACE:
                case DYNAMIC:
                case FINAL:
                case OVERRIDE:
                case STATIC:
                case NATIVE:
                case GET:
                case SET:
                case EACH:
                    {
                    alt99=1;
                    }
                    break;
                case HEX_LITERAL:
                case DECIMAL_LITERAL:
                case OCTAL_LITERAL:
                case FLOAT_LITERAL:
                    {
                    alt99=2;
                    }
                    break;
                case STRING_LITERAL:
                    {
                    alt99=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 99, 0, input);

                }

                switch (alt99) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1419:4: identiferLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_identiferLiteral_in_fieldName5473);
                        identiferLiteral444=identiferLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, identiferLiteral444.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1420:4: numericLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_numericLiteral_in_fieldName5478);
                        numericLiteral445=numericLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, numericLiteral445.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1421:4: stringLiteral
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_stringLiteral_in_fieldName5483);
                        stringLiteral446=stringLiteral();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, stringLiteral446.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end fieldName

        // $ANTLR start element
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1425:1: element : assignmentExpression ;
        public final function element():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var assignmentExpression447:ParserRuleReturnScope = null;




            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1430:2: ( assignmentExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1430:4: assignmentExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_assignmentExpression_in_element5505);
                assignmentExpression447=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression447.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end element

        // $ANTLR start functionExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1437:1: functionExpression : FUNCTION functionCommon -> ^( FUNC_DEF functionCommon ) ;
        public final function functionExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var FUNCTION448:Token=null;
            var functionCommon449:ParserRuleReturnScope = null;


            var FUNCTION448_tree:LinkedListTree=null;
            var stream_FUNCTION:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token FUNCTION");
            var stream_functionCommon:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule functionCommon");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1438:2: ( FUNCTION functionCommon -> ^( FUNC_DEF functionCommon ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1438:4: FUNCTION functionCommon
                {
                FUNCTION448=Token(matchStream(input,FUNCTION,FOLLOW_FUNCTION_in_functionExpression5520)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_FUNCTION.add(FUNCTION448);

                pushFollow(FOLLOW_functionCommon_in_functionExpression5522);
                functionCommon449=functionCommon();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_functionCommon.add(functionCommon449.tree);


                // AST REWRITE
                // elements: functionCommon
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1439:3: -> ^( FUNC_DEF functionCommon )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1439:6: ^( FUNC_DEF functionCommon )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FUNC_DEF, "FUNC_DEF")), root_1));

                    adaptor.addChild(root_1, stream_functionCommon.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end functionExpression

        // $ANTLR start castExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1442:1: castExpression : ident ( typePostfixSyntax )? argumentList -> ^( FUNC_DEF ident typePostfixSyntax ( argumentList )? ) ;
        public final function castExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ident450:ParserRuleReturnScope = null;

            var typePostfixSyntax451:ParserRuleReturnScope = null;

            var argumentList452:ParserRuleReturnScope = null;


            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typePostfixSyntax:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typePostfixSyntax");
            var stream_argumentList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule argumentList");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1443:2: ( ident ( typePostfixSyntax )? argumentList -> ^( FUNC_DEF ident typePostfixSyntax ( argumentList )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1443:4: ident ( typePostfixSyntax )? argumentList
                {
                pushFollow(FOLLOW_ident_in_castExpression5545);
                ident450=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident450.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1443:10: ( typePostfixSyntax )?
                var alt100:int=2;
                var LA100_0:int = input.LA(1);

                if ( (LA100_0==132) ) {
                    alt100=1;
                }
                switch (alt100) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1443:10: typePostfixSyntax
                        {
                        pushFollow(FOLLOW_typePostfixSyntax_in_castExpression5547);
                        typePostfixSyntax451=typePostfixSyntax();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typePostfixSyntax.add(typePostfixSyntax451.tree);

                        }
                        break;

                }

                pushFollow(FOLLOW_argumentList_in_castExpression5550);
                argumentList452=argumentList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_argumentList.add(argumentList452.tree);


                // AST REWRITE
                // elements: ident, argumentList, typePostfixSyntax
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1444:3: -> ^( FUNC_DEF ident typePostfixSyntax ( argumentList )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1444:6: ^( FUNC_DEF ident typePostfixSyntax ( argumentList )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(FUNC_DEF, "FUNC_DEF")), root_1));

                    adaptor.addChild(root_1, stream_ident.nextTree());
                    adaptor.addChild(root_1, stream_typePostfixSyntax.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1444:42: ( argumentList )?
                    if ( stream_argumentList.hasNext ) {
                        adaptor.addChild(root_1, stream_argumentList.nextTree());

                    }
                    stream_argumentList.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end castExpression

        // $ANTLR start functionCommon
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1447:1: functionCommon : functionSignature block ;
        public final function functionCommon():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var functionSignature453:ParserRuleReturnScope = null;

            var block454:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1448:2: ( functionSignature block )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1448:4: functionSignature block
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_functionSignature_in_functionCommon5578);
                functionSignature453=functionSignature();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, functionSignature453.tree);
                pushFollow(FOLLOW_block_in_functionCommon5580);
                block454=block();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, block454.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end functionCommon

        // $ANTLR start functionSignature
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1451:1: functionSignature : parameterDeclarationList ( typeExpression )? ;
        public final function functionSignature():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var parameterDeclarationList455:ParserRuleReturnScope = null;

            var typeExpression456:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1452:2: ( parameterDeclarationList ( typeExpression )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1452:4: parameterDeclarationList ( typeExpression )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_parameterDeclarationList_in_functionSignature5591);
                parameterDeclarationList455=parameterDeclarationList();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, parameterDeclarationList455.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1452:29: ( typeExpression )?
                var alt101:int=2;
                var LA101_0:int = input.LA(1);

                if ( (LA101_0==123) ) {
                    alt101=1;
                }
                switch (alt101) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1452:29: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_functionSignature5593);
                        typeExpression456=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, typeExpression456.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end functionSignature

        // $ANTLR start parameterDeclarationList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1457:1: parameterDeclarationList : LPAREN ( parameterDeclaration ( COMMA parameterDeclaration )* )? RPAREN -> ^( PARAMS ( parameterDeclaration )* ) ;
        public final function parameterDeclarationList():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN457:Token=null;
            var COMMA459:Token=null;
            var RPAREN461:Token=null;
            var parameterDeclaration458:ParserRuleReturnScope = null;

            var parameterDeclaration460:ParserRuleReturnScope = null;


            var LPAREN457_tree:LinkedListTree=null;
            var COMMA459_tree:LinkedListTree=null;
            var RPAREN461_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_COMMA:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token COMMA");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_parameterDeclaration:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule parameterDeclaration");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1458:2: ( LPAREN ( parameterDeclaration ( COMMA parameterDeclaration )* )? RPAREN -> ^( PARAMS ( parameterDeclaration )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1458:4: LPAREN ( parameterDeclaration ( COMMA parameterDeclaration )* )? RPAREN
                {
                LPAREN457=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_parameterDeclarationList5607)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN457);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1459:3: ( parameterDeclaration ( COMMA parameterDeclaration )* )?
                var alt103:int=2;
                var LA103_0:int = input.LA(1);

                if ( (LA103_0==79||(LA103_0>=89 && LA103_0<=90)||LA103_0==94||(LA103_0>=108 && LA103_0<=109)||LA103_0==111||(LA103_0>=134 && LA103_0<=135)||LA103_0==184) ) {
                    alt103=1;
                }
                switch (alt103) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1459:5: parameterDeclaration ( COMMA parameterDeclaration )*
                        {
                        pushFollow(FOLLOW_parameterDeclaration_in_parameterDeclarationList5614);
                        parameterDeclaration458=parameterDeclaration();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_parameterDeclaration.add(parameterDeclaration458.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1459:26: ( COMMA parameterDeclaration )*
                        loop102:
                        do {
                            var alt102:int=2;
                            var LA102_0:int = input.LA(1);

                            if ( (LA102_0==84) ) {
                                alt102=1;
                            }


                            switch (alt102) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1459:27: COMMA parameterDeclaration
                        	    {
                        	    COMMA459=Token(matchStream(input,COMMA,FOLLOW_COMMA_in_parameterDeclarationList5617)); if (this.state.failed) return retval; 
                        	    if ( this.state.backtracking==0 ) stream_COMMA.add(COMMA459);

                        	    pushFollow(FOLLOW_parameterDeclaration_in_parameterDeclarationList5619);
                        	    parameterDeclaration460=parameterDeclaration();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) stream_parameterDeclaration.add(parameterDeclaration460.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop102;
                            }
                        } while (true);


                        }
                        break;

                }

                RPAREN461=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_parameterDeclarationList5629)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN461);



                // AST REWRITE
                // elements: parameterDeclaration
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1461:3: -> ^( PARAMS ( parameterDeclaration )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1461:6: ^( PARAMS ( parameterDeclaration )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PARAMS, "PARAMS")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1461:16: ( parameterDeclaration )*
                    while ( stream_parameterDeclaration.hasNext ) {
                        adaptor.addChild(root_1, stream_parameterDeclaration.nextTree());

                    }
                    stream_parameterDeclaration.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end parameterDeclarationList

        // $ANTLR start parameterDeclaration
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1464:1: parameterDeclaration : ( basicParameterDeclaration | parameterRestDeclaration );
        public final function parameterDeclaration():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var basicParameterDeclaration462:ParserRuleReturnScope = null;

            var parameterRestDeclaration463:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1465:2: ( basicParameterDeclaration | parameterRestDeclaration )
                var alt104:int=2;
                var LA104_0:int = input.LA(1);

                if ( (LA104_0==79||(LA104_0>=89 && LA104_0<=90)||LA104_0==94||(LA104_0>=108 && LA104_0<=109)||LA104_0==111||(LA104_0>=134 && LA104_0<=135)) ) {
                    alt104=1;
                }
                else if ( (LA104_0==184) ) {
                    alt104=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 104, 0, input);

                }
                switch (alt104) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1465:4: basicParameterDeclaration
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_basicParameterDeclaration_in_parameterDeclaration5653);
                        basicParameterDeclaration462=basicParameterDeclaration();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, basicParameterDeclaration462.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1466:4: parameterRestDeclaration
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_parameterRestDeclaration_in_parameterDeclaration5659);
                        parameterRestDeclaration463=parameterRestDeclaration();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, parameterRestDeclaration463.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end parameterDeclaration

        // $ANTLR start basicParameterDeclaration
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1469:1: basicParameterDeclaration : ( CONST )? ident ( typeExpression )? ( parameterDefault )? -> ^( PARAM ( CONST )? ident ( typeExpression )? ( parameterDefault )? ) ;
        public final function basicParameterDeclaration():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var CONST464:Token=null;
            var ident465:ParserRuleReturnScope = null;

            var typeExpression466:ParserRuleReturnScope = null;

            var parameterDefault467:ParserRuleReturnScope = null;


            var CONST464_tree:LinkedListTree=null;
            var stream_CONST:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token CONST");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            var stream_typeExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule typeExpression");
            var stream_parameterDefault:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule parameterDefault");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:2: ( ( CONST )? ident ( typeExpression )? ( parameterDefault )? -> ^( PARAM ( CONST )? ident ( typeExpression )? ( parameterDefault )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:4: ( CONST )? ident ( typeExpression )? ( parameterDefault )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:4: ( CONST )?
                var alt105:int=2;
                var LA105_0:int = input.LA(1);

                if ( (LA105_0==111) ) {
                    alt105=1;
                }
                switch (alt105) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:4: CONST
                        {
                        CONST464=Token(matchStream(input,CONST,FOLLOW_CONST_in_basicParameterDeclaration5670)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_CONST.add(CONST464);


                        }
                        break;

                }

                pushFollow(FOLLOW_ident_in_basicParameterDeclaration5673);
                ident465=ident();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_ident.add(ident465.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:17: ( typeExpression )?
                var alt106:int=2;
                var LA106_0:int = input.LA(1);

                if ( (LA106_0==123) ) {
                    alt106=1;
                }
                switch (alt106) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:17: typeExpression
                        {
                        pushFollow(FOLLOW_typeExpression_in_basicParameterDeclaration5675);
                        typeExpression466=typeExpression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_typeExpression.add(typeExpression466.tree);

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:33: ( parameterDefault )?
                var alt107:int=2;
                var LA107_0:int = input.LA(1);

                if ( (LA107_0==86) ) {
                    alt107=1;
                }
                switch (alt107) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1470:33: parameterDefault
                        {
                        pushFollow(FOLLOW_parameterDefault_in_basicParameterDeclaration5678);
                        parameterDefault467=parameterDefault();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_parameterDefault.add(parameterDefault467.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: parameterDefault, ident, CONST, typeExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1471:3: -> ^( PARAM ( CONST )? ident ( typeExpression )? ( parameterDefault )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1471:6: ^( PARAM ( CONST )? ident ( typeExpression )? ( parameterDefault )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PARAM, "PARAM")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1471:15: ( CONST )?
                    if ( stream_CONST.hasNext ) {
                        adaptor.addChild(root_1, stream_CONST.nextNode());

                    }
                    stream_CONST.reset();
                    adaptor.addChild(root_1, stream_ident.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1471:28: ( typeExpression )?
                    if ( stream_typeExpression.hasNext ) {
                        adaptor.addChild(root_1, stream_typeExpression.nextTree());

                    }
                    stream_typeExpression.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1471:44: ( parameterDefault )?
                    if ( stream_parameterDefault.hasNext ) {
                        adaptor.addChild(root_1, stream_parameterDefault.nextTree());

                    }
                    stream_parameterDefault.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end basicParameterDeclaration

        // $ANTLR start parameterDefault
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1474:1: parameterDefault : ASSIGN assignmentExpression ;
        public final function parameterDefault():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ASSIGN468:Token=null;
            var assignmentExpression469:ParserRuleReturnScope = null;


            var ASSIGN468_tree:LinkedListTree=null;


            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1480:2: ( ASSIGN assignmentExpression )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1480:4: ASSIGN assignmentExpression
                {
                root_0 = LinkedListTree(adaptor.nil());

                ASSIGN468=Token(matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_parameterDefault5724)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                ASSIGN468_tree = LinkedListTree(adaptor.create(ASSIGN468));
                root_0 = LinkedListTree(adaptor.becomeRoot(ASSIGN468_tree, root_0));
                }
                pushFollow(FOLLOW_assignmentExpression_in_parameterDefault5727);
                assignmentExpression469=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, assignmentExpression469.tree);

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end parameterDefault

        // $ANTLR start parameterRestDeclaration
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1483:1: parameterRestDeclaration : REST ( ident )? -> ^( PARAM REST ( ident )? ) ;
        public final function parameterRestDeclaration():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var REST470:Token=null;
            var ident471:ParserRuleReturnScope = null;


            var REST470_tree:LinkedListTree=null;
            var stream_REST:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token REST");
            var stream_ident:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule ident");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1484:2: ( REST ( ident )? -> ^( PARAM REST ( ident )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1484:4: REST ( ident )?
                {
                REST470=Token(matchStream(input,REST,FOLLOW_REST_in_parameterRestDeclaration5738)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_REST.add(REST470);

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1484:9: ( ident )?
                var alt108:int=2;
                var LA108_0:int = input.LA(1);

                if ( (LA108_0==79||(LA108_0>=89 && LA108_0<=90)||LA108_0==94||(LA108_0>=108 && LA108_0<=109)||(LA108_0>=134 && LA108_0<=135)) ) {
                    alt108=1;
                }
                switch (alt108) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1484:9: ident
                        {
                        pushFollow(FOLLOW_ident_in_parameterRestDeclaration5740);
                        ident471=ident();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_ident.add(ident471.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: ident, REST
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1485:3: -> ^( PARAM REST ( ident )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1485:6: ^( PARAM REST ( ident )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PARAM, "PARAM")), root_1));

                    adaptor.addChild(root_1, stream_REST.nextNode());
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1485:20: ( ident )?
                    if ( stream_ident.hasNext ) {
                        adaptor.addChild(root_1, stream_ident.nextTree());

                    }
                    stream_ident.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end parameterRestDeclaration

        // $ANTLR start argumentList
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1488:1: argumentList : ( LPAREN expressionList RPAREN -> ^( ARGUMENTS expressionList ) | LPAREN RPAREN -> ARGUMENTS );
        public final function argumentList():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN472:Token=null;
            var RPAREN474:Token=null;
            var LPAREN475:Token=null;
            var RPAREN476:Token=null;
            var expressionList473:ParserRuleReturnScope = null;


            var LPAREN472_tree:LinkedListTree=null;
            var RPAREN474_tree:LinkedListTree=null;
            var LPAREN475_tree:LinkedListTree=null;
            var RPAREN476_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_expressionList:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expressionList");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1493:2: ( LPAREN expressionList RPAREN -> ^( ARGUMENTS expressionList ) | LPAREN RPAREN -> ARGUMENTS )
                var alt109:int=2;
                var LA109_0:int = input.LA(1);

                if ( (LA109_0==83) ) {
                    var LA109_1:int = input.LA(2);

                    if ( (LA109_1==85) ) {
                        alt109=2;
                    }
                    else if ( (LA109_1==76||LA109_1==79||LA109_1==81||LA109_1==83||LA109_1==88||LA109_1==90||(LA109_1>=94 && LA109_1<=95)||LA109_1==97||(LA109_1>=101 && LA109_1<=102)||(LA109_1>=107 && LA109_1<=109)||LA109_1==115||LA109_1==131||(LA109_1>=160 && LA109_1<=161)||(LA109_1>=164 && LA109_1<=169)||(LA109_1>=171 && LA109_1<=183)||LA109_1==185) ) {
                        alt109=1;
                    }
                    else {
                        if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                        throw new NoViableAltException("", 109, 1, input);

                    }
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 109, 0, input);

                }
                switch (alt109) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1493:4: LPAREN expressionList RPAREN
                        {
                        LPAREN472=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_argumentList5777)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN472);

                        pushFollow(FOLLOW_expressionList_in_argumentList5779);
                        expressionList473=expressionList();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) stream_expressionList.add(expressionList473.tree);
                        RPAREN474=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_argumentList5781)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN474);



                        // AST REWRITE
                        // elements: expressionList
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1494:3: -> ^( ARGUMENTS expressionList )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1494:6: ^( ARGUMENTS expressionList )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ARGUMENTS, "ARGUMENTS")), root_1));

                            adaptor.addChild(root_1, stream_expressionList.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;}
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1495:4: LPAREN RPAREN
                        {
                        LPAREN475=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_argumentList5798)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN475);

                        RPAREN476=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_argumentList5800)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN476);



                        // AST REWRITE
                        // elements: 
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        if ( this.state.backtracking==0 ) {
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 1496:3: -> ARGUMENTS
                        {
                            adaptor.addChild(root_0, LinkedListTree(adaptor.create(ARGUMENTS, "ARGUMENTS")));

                        }

                        retval.tree = root_0;}
                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end argumentList

        // $ANTLR start vectorInitializer
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1499:1: vectorInitializer : LT type GT arrayLiteral -> ^( VECTOR_INIT type arrayLiteral ) ;
        public final function vectorInitializer():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LT477:Token=null;
            var GT479:Token=null;
            var type478:ParserRuleReturnScope = null;

            var arrayLiteral480:ParserRuleReturnScope = null;


            var LT477_tree:LinkedListTree=null;
            var GT479_tree:LinkedListTree=null;
            var stream_GT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token GT");
            var stream_LT:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LT");
            var stream_arrayLiteral:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule arrayLiteral");
            var stream_type:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule type");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1500:2: ( LT type GT arrayLiteral -> ^( VECTOR_INIT type arrayLiteral ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1501:3: LT type GT arrayLiteral
                {
                LT477=Token(matchStream(input,LT,FOLLOW_LT_in_vectorInitializer5819)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LT.add(LT477);

                pushFollow(FOLLOW_type_in_vectorInitializer5821);
                type478=type();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_type.add(type478.tree);
                GT479=Token(matchStream(input,GT,FOLLOW_GT_in_vectorInitializer5823)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_GT.add(GT479);

                pushFollow(FOLLOW_arrayLiteral_in_vectorInitializer5825);
                arrayLiteral480=arrayLiteral();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_arrayLiteral.add(arrayLiteral480.tree);


                // AST REWRITE
                // elements: type, arrayLiteral
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1502:3: -> ^( VECTOR_INIT type arrayLiteral )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1502:6: ^( VECTOR_INIT type arrayLiteral )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(VECTOR_INIT, "VECTOR_INIT")), root_1));

                    adaptor.addChild(root_1, stream_type.nextTree());
                    adaptor.addChild(root_1, stream_arrayLiteral.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end vectorInitializer

        // $ANTLR start encapsulatedExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1510:1: encapsulatedExpression : LPAREN assignmentExpression RPAREN -> ^( ENCPS_EXPR assignmentExpression ) ;
        public final function encapsulatedExpression():ParserRuleReturnScope {
            InOperator_stack.push(new Object());

            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN481:Token=null;
            var RPAREN483:Token=null;
            var assignmentExpression482:ParserRuleReturnScope = null;


            var LPAREN481_tree:LinkedListTree=null;
            var RPAREN483_tree:LinkedListTree=null;
            var stream_RPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RPAREN");
            var stream_LPAREN:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LPAREN");
            var stream_assignmentExpression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule assignmentExpression");

            	InOperator_stack[InOperator_stack.length-1].allowed = true;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1515:2: ( LPAREN assignmentExpression RPAREN -> ^( ENCPS_EXPR assignmentExpression ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1515:4: LPAREN assignmentExpression RPAREN
                {
                LPAREN481=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_encapsulatedExpression5865)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LPAREN.add(LPAREN481);

                pushFollow(FOLLOW_assignmentExpression_in_encapsulatedExpression5867);
                assignmentExpression482=assignmentExpression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_assignmentExpression.add(assignmentExpression482.tree);
                RPAREN483=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_encapsulatedExpression5869)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RPAREN.add(RPAREN483);



                // AST REWRITE
                // elements: assignmentExpression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 1516:3: -> ^( ENCPS_EXPR assignmentExpression )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1516:6: ^( ENCPS_EXPR assignmentExpression )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ENCPS_EXPR, "ENCPS_EXPR")), root_1));

                    adaptor.addChild(root_1, stream_assignmentExpression.nextTree());

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;}
                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
                InOperator_stack.pop();

            }
            return retval;
        }
        // $ANTLR end encapsulatedExpression

        // $ANTLR start e4xExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1519:1: e4xExpression : ( STAR | e4xAttributeIdentifier | e4xFilterPredicate | eitherIdentifier );
        public final function e4xExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var STAR484:Token=null;
            var e4xAttributeIdentifier485:ParserRuleReturnScope = null;

            var e4xFilterPredicate486:ParserRuleReturnScope = null;

            var eitherIdentifier487:ParserRuleReturnScope = null;


            var STAR484_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1520:2: ( STAR | e4xAttributeIdentifier | e4xFilterPredicate | eitherIdentifier )
                var alt110:int=4;
                switch ( input.LA(1) ) {
                case STAR:
                    {
                    alt110=1;
                    }
                    break;
                case E4X_ATTRI:
                    {
                    alt110=2;
                    }
                    break;
                case LPAREN:
                    {
                    alt110=3;
                    }
                    break;
                case IDENT:
                    {
                    alt110=4;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 110, 0, input);

                }

                switch (alt110) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1520:4: STAR
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        STAR484=Token(matchStream(input,STAR,FOLLOW_STAR_in_e4xExpression5892)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        STAR484_tree = LinkedListTree(adaptor.create(STAR484));
                        adaptor.addChild(root_0, STAR484_tree);
                        }

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1521:4: e4xAttributeIdentifier
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_e4xAttributeIdentifier_in_e4xExpression5897);
                        e4xAttributeIdentifier485=e4xAttributeIdentifier();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, e4xAttributeIdentifier485.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1522:4: e4xFilterPredicate
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_e4xFilterPredicate_in_e4xExpression5902);
                        e4xFilterPredicate486=e4xFilterPredicate();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, e4xFilterPredicate486.tree);

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1523:4: eitherIdentifier
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_eitherIdentifier_in_e4xExpression5907);
                        eitherIdentifier487=eitherIdentifier();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, eitherIdentifier487.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end e4xExpression

        // $ANTLR start e4xAttributeIdentifier
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1526:1: e4xAttributeIdentifier : E4X_ATTRI ( eitherIdentifier | STAR | LBRACK expression RBRACK ) ;
        public final function e4xAttributeIdentifier():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var E4X_ATTRI488:Token=null;
            var STAR490:Token=null;
            var LBRACK491:Token=null;
            var RBRACK493:Token=null;
            var eitherIdentifier489:ParserRuleReturnScope = null;

            var expression492:ParserRuleReturnScope = null;


            var E4X_ATTRI488_tree:LinkedListTree=null;
            var STAR490_tree:LinkedListTree=null;
            var LBRACK491_tree:LinkedListTree=null;
            var RBRACK493_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1527:2: ( E4X_ATTRI ( eitherIdentifier | STAR | LBRACK expression RBRACK ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1527:4: E4X_ATTRI ( eitherIdentifier | STAR | LBRACK expression RBRACK )
                {
                root_0 = LinkedListTree(adaptor.nil());

                E4X_ATTRI488=Token(matchStream(input,E4X_ATTRI,FOLLOW_E4X_ATTRI_in_e4xAttributeIdentifier5918)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                E4X_ATTRI488_tree = LinkedListTree(adaptor.create(E4X_ATTRI488));
                adaptor.addChild(root_0, E4X_ATTRI488_tree);
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1528:3: ( eitherIdentifier | STAR | LBRACK expression RBRACK )
                var alt111:int=3;
                switch ( input.LA(1) ) {
                case IDENT:
                    {
                    alt111=1;
                    }
                    break;
                case STAR:
                    {
                    alt111=2;
                    }
                    break;
                case LBRACK:
                    {
                    alt111=3;
                    }
                    break;
                default:
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 111, 0, input);

                }

                switch (alt111) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1529:4: eitherIdentifier
                        {
                        pushFollow(FOLLOW_eitherIdentifier_in_e4xAttributeIdentifier5927);
                        eitherIdentifier489=eitherIdentifier();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, eitherIdentifier489.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1530:5: STAR
                        {
                        STAR490=Token(matchStream(input,STAR,FOLLOW_STAR_in_e4xAttributeIdentifier5933)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        STAR490_tree = LinkedListTree(adaptor.create(STAR490));
                        adaptor.addChild(root_0, STAR490_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1531:5: LBRACK expression RBRACK
                        {
                        LBRACK491=Token(matchStream(input,LBRACK,FOLLOW_LBRACK_in_e4xAttributeIdentifier5939)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        LBRACK491_tree = LinkedListTree(adaptor.create(LBRACK491));
                        adaptor.addChild(root_0, LBRACK491_tree);
                        }
                        pushFollow(FOLLOW_expression_in_e4xAttributeIdentifier5941);
                        expression492=expression();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expression492.tree);
                        RBRACK493=Token(matchStream(input,RBRACK,FOLLOW_RBRACK_in_e4xAttributeIdentifier5943)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        RBRACK493_tree = LinkedListTree(adaptor.create(RBRACK493));
                        adaptor.addChild(root_0, RBRACK493_tree);
                        }

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end e4xAttributeIdentifier

        // $ANTLR start e4xFilterPredicate
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1535:1: e4xFilterPredicate : LPAREN expression RPAREN ;
        public final function e4xFilterPredicate():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LPAREN494:Token=null;
            var RPAREN496:Token=null;
            var expression495:ParserRuleReturnScope = null;


            var LPAREN494_tree:LinkedListTree=null;
            var RPAREN496_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1536:2: ( LPAREN expression RPAREN )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1536:4: LPAREN expression RPAREN
                {
                root_0 = LinkedListTree(adaptor.nil());

                LPAREN494=Token(matchStream(input,LPAREN,FOLLOW_LPAREN_in_e4xFilterPredicate5958)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                LPAREN494_tree = LinkedListTree(adaptor.create(LPAREN494));
                adaptor.addChild(root_0, LPAREN494_tree);
                }
                pushFollow(FOLLOW_expression_in_e4xFilterPredicate5960);
                expression495=expression();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) adaptor.addChild(root_0, expression495.tree);
                RPAREN496=Token(matchStream(input,RPAREN,FOLLOW_RPAREN_in_e4xFilterPredicate5962)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                RPAREN496_tree = LinkedListTree(adaptor.create(RPAREN496));
                adaptor.addChild(root_0, RPAREN496_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end e4xFilterPredicate

        // $ANTLR start xmlKeyword
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1539:1: xmlKeyword : {...}? IDENT ;
        public final function xmlKeyword():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var IDENT497:Token=null;

            var IDENT497_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1540:2: ({...}? IDENT )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1540:4: {...}? IDENT
                {
                root_0 = LinkedListTree(adaptor.nil());

                if ( !((input.LT(1).text == "xml")) ) {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new FailedPredicateException(input, "xmlKeyword", "input.LT(1).text == \"xml\"");
                }
                IDENT497=Token(matchStream(input,IDENT,FOLLOW_IDENT_in_xmlKeyword5975)); if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) {
                IDENT497_tree = LinkedListTree(adaptor.create(IDENT497));
                adaptor.addChild(root_0, IDENT497_tree);
                }

                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlKeyword

        // $ANTLR start notQuiteReservedWord
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1543:1: notQuiteReservedWord : ( NATIVE | EACH | GET | SET | NAMESPACE | DYNAMIC | FINAL | OVERRIDE | STATIC );
        public final function notQuiteReservedWord():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set498:Token=null;

            var set498_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1544:2: ( NATIVE | EACH | GET | SET | NAMESPACE | DYNAMIC | FINAL | OVERRIDE | STATIC )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set498=Token(input.LT(1));
                if ( input.LA(1)==90||(input.LA(1)>=94 && input.LA(1)<=95)||input.LA(1)==97||(input.LA(1)>=101 && input.LA(1)<=102)||(input.LA(1)>=108 && input.LA(1)<=109)||input.LA(1)==115 ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set498)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end notQuiteReservedWord

        // $ANTLR start allKeywords
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1547:1: allKeywords : ( reservedWord | notQuiteReservedWord ) ;
        public final function allKeywords():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var reservedWord499:ParserRuleReturnScope = null;

            var notQuiteReservedWord500:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1548:2: ( ( reservedWord | notQuiteReservedWord ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1548:4: ( reservedWord | notQuiteReservedWord )
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1548:4: ( reservedWord | notQuiteReservedWord )
                var alt112:int=2;
                var LA112_0:int = input.LA(1);

                if ( (LA112_0==75||LA112_0==87||LA112_0==89||LA112_0==91||LA112_0==96||(LA112_0>=98 && LA112_0<=100)||(LA112_0>=103 && LA112_0<=107)||(LA112_0>=110 && LA112_0<=114)||(LA112_0>=116 && LA112_0<=122)||(LA112_0>=124 && LA112_0<=131)||(LA112_0>=134 && LA112_0<=135)||LA112_0==158||(LA112_0>=166 && LA112_0<=167)||(LA112_0>=172 && LA112_0<=177)) ) {
                    alt112=1;
                }
                else if ( (LA112_0==90||(LA112_0>=94 && LA112_0<=95)||LA112_0==97||(LA112_0>=101 && LA112_0<=102)||(LA112_0>=108 && LA112_0<=109)||LA112_0==115) ) {
                    alt112=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 112, 0, input);

                }
                switch (alt112) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1548:6: reservedWord
                        {
                        pushFollow(FOLLOW_reservedWord_in_allKeywords6033);
                        reservedWord499=reservedWord();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, reservedWord499.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1548:21: notQuiteReservedWord
                        {
                        pushFollow(FOLLOW_notQuiteReservedWord_in_allKeywords6037);
                        notQuiteReservedWord500=notQuiteReservedWord();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, notQuiteReservedWord500.tree);

                        }
                        break;

                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end allKeywords

        // $ANTLR start reservedWord
        // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1551:1: reservedWord : ( AS | BREAK | CASE | CATCH | CLASS | CONST | CONTINUE | DEFAULT | DELETE | DO | ELSE | EXTENDS | FALSE | FINALLY | FOR | FUNCTION | IF | IMPLEMENTS | IMPORT | IN | INSTANCEOF | INTERFACE | INTERNAL | IS | NEW | NULL | PACKAGE | PRIVATE | PROTECTED | PUBLIC | RETURN | SUPER | SWITCH | THIS | THROW | TRUE | TRY | TYPEOF | USE | VAR | VOID | WHILE | WITH | INCLUDE ) ;
        public final function reservedWord():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set501:Token=null;

            var set501_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1552:2: ( ( AS | BREAK | CASE | CATCH | CLASS | CONST | CONTINUE | DEFAULT | DELETE | DO | ELSE | EXTENDS | FALSE | FINALLY | FOR | FUNCTION | IF | IMPLEMENTS | IMPORT | IN | INSTANCEOF | INTERFACE | INTERNAL | IS | NEW | NULL | PACKAGE | PRIVATE | PROTECTED | PUBLIC | RETURN | SUPER | SWITCH | THIS | THROW | TRUE | TRY | TYPEOF | USE | VAR | VOID | WHILE | WITH | INCLUDE ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1553:2: ( AS | BREAK | CASE | CATCH | CLASS | CONST | CONTINUE | DEFAULT | DELETE | DO | ELSE | EXTENDS | FALSE | FINALLY | FOR | FUNCTION | IF | IMPLEMENTS | IMPORT | IN | INSTANCEOF | INTERFACE | INTERNAL | IS | NEW | NULL | PACKAGE | PRIVATE | PROTECTED | PUBLIC | RETURN | SUPER | SWITCH | THIS | THROW | TRUE | TRY | TYPEOF | USE | VAR | VOID | WHILE | WITH | INCLUDE )
                {
                root_0 = LinkedListTree(adaptor.nil());

                set501=Token(input.LT(1));
                if ( input.LA(1)==75||input.LA(1)==87||input.LA(1)==89||input.LA(1)==91||input.LA(1)==96||(input.LA(1)>=98 && input.LA(1)<=100)||(input.LA(1)>=103 && input.LA(1)<=107)||(input.LA(1)>=110 && input.LA(1)<=114)||(input.LA(1)>=116 && input.LA(1)<=122)||(input.LA(1)>=124 && input.LA(1)<=131)||(input.LA(1)>=134 && input.LA(1)<=135)||input.LA(1)==158||(input.LA(1)>=166 && input.LA(1)<=167)||(input.LA(1)>=172 && input.LA(1)<=177) ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set501)));
                    this.state.errorRecovery=false;this.state.failed=false;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                if ( this.state.backtracking==0 ) {

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));
                }
            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end reservedWord

        // $ANTLR start synpred1_AS3
        public final function synpred1_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:347:5: ( ident DOT )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:347:6: ident DOT
            {
            pushFollow(FOLLOW_ident_in_synpred1_AS3875);
            ident();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;
            matchStream(input,DOT,FOLLOW_DOT_in_synpred1_AS3877); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred1_AS3

        // $ANTLR start synpred3_AS3
        public final function synpred3_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:528:3: ( configIdent LBRACE )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:528:4: configIdent LBRACE
            {
            pushFollow(FOLLOW_configIdent_in_synpred3_AS31511);
            configIdent();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred3_AS31513); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred3_AS3

        // $ANTLR start synpred4_AS3
        public final function synpred4_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:530:3: ( LBRACE )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:530:4: LBRACE
            {
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred4_AS31526); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred4_AS3

        // $ANTLR start synpred5_AS3
        public final function synpred5_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:564:3: ( configIdent LBRACE )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:564:4: configIdent LBRACE
            {
            pushFollow(FOLLOW_configIdent_in_synpred5_AS31655);
            configIdent();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred5_AS31657); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred5_AS3

        // $ANTLR start synpred6_AS3
        public final function synpred6_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:566:3: ( LBRACE )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:566:4: LBRACE
            {
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred6_AS31670); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred6_AS3

        // $ANTLR start synpred7_AS3
        public final function synpred7_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:701:4: ( FOR EACH )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:701:5: FOR EACH
            {
            matchStream(input,FOR,FOLLOW_FOR_in_synpred7_AS32234); if (this.state.failed) return ;
            matchStream(input,EACH,FOLLOW_EACH_in_synpred7_AS32236); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred7_AS3

        // $ANTLR start synpred8_AS3
        public final function synpred8_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:792:5: ( ELSE )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:792:6: ELSE
            {
            matchStream(input,ELSE,FOLLOW_ELSE_in_synpred8_AS32562); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred8_AS3

        // $ANTLR start synpred9_AS3
        public final function synpred9_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:825:4: ( forInClauseDecl IN )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:825:5: forInClauseDecl IN
            {
            pushFollow(FOLLOW_forInClauseDecl_in_synpred9_AS32693);
            forInClauseDecl();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;
            matchStream(input,IN,FOLLOW_IN_in_synpred9_AS32695); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred9_AS3

        // $ANTLR start synpred10_AS3
        public final function synpred10_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:28: ( assignmentOperator )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1082:29: assignmentOperator
            {
            pushFollow(FOLLOW_assignmentOperator_in_synpred10_AS33834);
            assignmentOperator();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred10_AS3

        // $ANTLR start synpred11_AS3
        public final function synpred11_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1094:6: ( '*' '=' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1094:7: '*' '='
            {
            matchStream(input,STAR,FOLLOW_STAR_in_synpred11_AS33878); if (this.state.failed) return ;
            matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_synpred11_AS33880); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred11_AS3

        // $ANTLR start synpred12_AS3
        public final function synpred12_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1102:6: ( '>' '>' '=' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1102:7: '>' '>' '='
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred12_AS33927); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred12_AS33929); if (this.state.failed) return ;
            matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_synpred12_AS33931); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred12_AS3

        // $ANTLR start synpred13_AS3
        public final function synpred13_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1103:6: ( '>' '>' '>' '=' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1103:7: '>' '>' '>' '='
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred13_AS33955); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred13_AS33957); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred13_AS33959); if (this.state.failed) return ;
            matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_synpred13_AS33961); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred13_AS3

        // $ANTLR start synpred14_AS3
        public final function synpred14_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1186:5: ( relationalOperator )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1186:6: relationalOperator
            {
            pushFollow(FOLLOW_relationalOperator_in_synpred14_AS34317);
            relationalOperator();

            state._fsp = state._fsp - 1;
            if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred14_AS3

        // $ANTLR start synpred15_AS3
        public final function synpred15_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1192:5: ( '>' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1192:6: '>'
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred15_AS34349); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred15_AS3

        // $ANTLR start synpred16_AS3
        public final function synpred16_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1193:6: ( '>' '=' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1193:7: '>' '='
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred16_AS34369); if (this.state.failed) return ;
            matchStream(input,ASSIGN,FOLLOW_ASSIGN_in_synpred16_AS34371); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred16_AS3

        // $ANTLR start synpred17_AS3
        public final function synpred17_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1206:6: ( '>' '>' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1206:7: '>' '>'
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred17_AS34463); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred17_AS34465); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred17_AS3

        // $ANTLR start synpred18_AS3
        public final function synpred18_AS3_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1207:6: ( '>' '>' '>' )
            // C:\\Users\\Teoti\\Documents\\Flash\\as-blocks-project\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\as3\\AS3.g:1207:7: '>' '>' '>'
            {
            matchStream(input,GT,FOLLOW_GT_in_synpred18_AS34487); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred18_AS34489); if (this.state.failed) return ;
            matchStream(input,GT,FOLLOW_GT_in_synpred18_AS34491); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred18_AS3


           // Delegated rules

        public final function synpred7_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred7_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred8_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred8_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred13_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred13_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred6_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred6_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred16_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred16_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred10_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred10_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred14_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred14_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred3_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred3_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred11_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred11_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred9_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred9_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred17_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred17_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred4_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred4_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred5_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred5_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred1_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred1_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred18_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred18_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred15_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred15_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred12_AS3():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred12_AS3_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }



        private const DFA14_eot:Array =
            DFA.unpackEncodedString("\x14\u80ff\xff");
        private const DFA14_eof:Array =
            DFA.unpackEncodedString("\x14\u80ff\xff");
        private const DFA14_min:Array =
            DFA.unpackEncodedString("\x01\x4f\x01\x56\x01\x54\x02\x56\x02"+
            "\x54\x02\x56\x06\u80ff\xff\x01\x4f\x01\u80ff\xff\x01\x4f\x02"+
            "\u80ff\xff", true);
        private const DFA14_max:Array =
            DFA.unpackEncodedString("\x01\xb7\x08\x56\x06\u80ff\xff\x01"+
            "\xb7\x01\u80ff\xff\x01\xb7\x02\u80ff\xff", true);
        private const DFA14_accept:Array =
            DFA.unpackEncodedString("\x09\u80ff\xff\x01\x02\x05\x03\x01"+
            "\u80ff\xff\x01\x05\x01\u80ff\xff\x01\x01\x01\x04");
        private const DFA14_special:Array =
            DFA.unpackEncodedString("\x01\x05\x01\x03\x01\u80ff\xff\x01"+
            "\x01\x01\x00\x02\u80ff\xff\x01\x04\x01\x02\x0b\u80ff\xff");
        private const DFA14_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x08\u80ff\xff\x01\x09"+
                "\x01\x02\x01\x04\x02\u80ff\xff\x01\x0e\x01\x03\x01\x0a\x01"+
                "\x0b\x01\x0a\x03\u80ff\xff\x02\x0a\x05\u80ff\xff\x01\x07"+
                "\x01\x08\x05\u80ff\xff\x01\x0a\x08\u80ff\xff\x01\x0c\x06"+
                "\u80ff\xff\x01\x0d\x02\u80ff\xff\x01\x05\x01\x06\x27\u80ff\xff"+
                "\x09\x09"),
                DFA.unpackEncodedString("\x01\x0f"),
                DFA.unpackEncodedString("\x02\x10\x01\x11"),
                DFA.unpackEncodedString("\x01\x11"),
                DFA.unpackEncodedString("\x01\x11"),
                DFA.unpackEncodedString("\x02\x10\x01\x11"),
                DFA.unpackEncodedString("\x02\x10\x01\x11"),
                DFA.unpackEncodedString("\x01\x11"),
                DFA.unpackEncodedString("\x01\x11"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x13\x08\u80ff\xff\x01\x12"+
                "\x01\u80ff\xff\x01\x13\x02\u80ff\xff\x05\x13\x03\u80ff\xff"+
                "\x02\x13\x05\u80ff\xff\x02\x13\x05\u80ff\xff\x01\x13\x08"+
                "\u80ff\xff\x01\x13\x06\u80ff\xff\x01\x13\x2b\u80ff\xff\x09"+
                "\x12"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x13\x08\u80ff\xff\x01\x12"+
                "\x01\u80ff\xff\x01\x13\x02\u80ff\xff\x05\x13\x03\u80ff\xff"+
                "\x02\x13\x05\u80ff\xff\x02\x13\x05\u80ff\xff\x01\x13\x08"+
                "\u80ff\xff\x01\x13\x06\u80ff\xff\x01\x13\x2b\u80ff\xff\x09"+
                "\x12"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA14_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA14_4:int = input.LA(1);

                             
                            var index14_4:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_4==86) ) {s = 17;}

                            else if ( (synpred1_AS3()) ) {s = 14;}

                            else if ( (true) ) {s = 16;}

                             
                            input.seek(index14_4);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA14_3:int = input.LA(1);

                             
                            var index14_3:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_3==86) ) {s = 17;}

                            else if ( (synpred1_AS3()) ) {s = 14;}

                            else if ( (true) ) {s = 16;}

                             
                            input.seek(index14_3);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA14_8:int = input.LA(1);

                             
                            var index14_8:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_8==86) ) {s = 17;}

                            else if ( (synpred1_AS3()) ) {s = 14;}

                            else if ( (true) ) {s = 16;}

                             
                            input.seek(index14_8);
                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA14_1:int = input.LA(1);

                             
                            var index14_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_1==86) ) {s = 15;}

                            else if ( (synpred1_AS3()) ) {s = 14;}

                            else if ( (true) ) {s = 16;}

                             
                            input.seek(index14_1);
                            if ( s>=0 ) return s;
                            break;
                        case 4 : 
                            var LA14_7:int = input.LA(1);

                             
                            var index14_7:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_7==86) ) {s = 17;}

                            else if ( (synpred1_AS3()) ) {s = 14;}

                            else if ( (true) ) {s = 16;}

                             
                            input.seek(index14_7);
                            if ( s>=0 ) return s;
                            break;
                        case 5 : 
                            var LA14_0:int = input.LA(1);

                             
                            var index14_0:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA14_0==79) ) {s = 1;}

                            else if ( (LA14_0==89) ) {s = 2;}

                            else if ( (LA14_0==94) ) {s = 3;}

                            else if ( (LA14_0==90) ) {s = 4;}

                            else if ( (LA14_0==134) ) {s = 5;}

                            else if ( (LA14_0==135) ) {s = 6;}

                            else if ( (LA14_0==108) ) {s = 7;}

                            else if ( (LA14_0==109) ) {s = 8;}

                            else if ( (LA14_0==88||(LA14_0>=175 && LA14_0<=183)) ) {s = 9;}

                            else if ( (LA14_0==95||LA14_0==97||(LA14_0>=101 && LA14_0<=102)||LA14_0==115) && (synpred1_AS3())) {s = 10;}

                            else if ( (LA14_0==96) && (synpred1_AS3())) {s = 11;}

                            else if ( (LA14_0==124) && (synpred1_AS3())) {s = 12;}

                            else if ( (LA14_0==131) && (synpred1_AS3())) {s = 13;}

                            else if ( (LA14_0==93) && (synpred1_AS3())) {s = 14;}

                             
                            input.seek(index14_0);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 14, _s, input));
            }

        protected var dfa14:DFA;  // initialized in constructor

        private const DFA27_eot:Array =
            DFA.unpackEncodedString("\x11\u80ff\xff");
        private const DFA27_eof:Array =
            DFA.unpackEncodedString("\x11\u80ff\xff");
        private const DFA27_min:Array =
            DFA.unpackEncodedString("\x01\x4c\x01\x00\x0f\u80ff\xff", true);
        private const DFA27_max:Array =
            DFA.unpackEncodedString("\x01\x87\x01\x00\x0f\u80ff\xff", true);
        private const DFA27_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x03\x0c"+
            "\u80ff\xff\x01\x01");
        private const DFA27_special:Array =
            DFA.unpackEncodedString("\x01\x00\x01\x01\x0f\u80ff\xff");
        private const DFA27_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x02\u80ff\xff\x01\x01"+
                "\x01\u80ff\xff\x01\x03\x05\u80ff\xff\x01\x03\x01\u80ff\xff"+
                "\x03\x03\x02\u80ff\xff\x09\x03\x04\u80ff\xff\x05\x03\x16"+
                "\u80ff\xff\x02\x03"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA27_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA27_0:int = input.LA(1);

                             
                            var index27_0:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA27_0==79) ) {s = 1;}

                            else if ( (LA27_0==76) && (synpred4_AS3())) {s = 2;}

                            else if ( (LA27_0==81||LA27_0==87||(LA27_0>=89 && LA27_0<=91)||(LA27_0>=94 && LA27_0<=102)||(LA27_0>=107 && LA27_0<=111)||(LA27_0>=134 && LA27_0<=135)) ) {s = 3;}

                             
                            input.seek(index27_0);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA27_1:int = input.LA(1);

                             
                            var index27_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred3_AS3()) ) {s = 16;}

                            else if ( (true) ) {s = 3;}

                             
                            input.seek(index27_1);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 27, _s, input));
            }

        protected var dfa27:DFA;  // initialized in constructor

        private const DFA37_eot:Array =
            DFA.unpackEncodedString("\x2f\u80ff\xff");
        private const DFA37_eof:Array =
            DFA.unpackEncodedString("\x2f\u80ff\xff");
        private const DFA37_min:Array =
            DFA.unpackEncodedString("\x01\x4c\x01\x00\x2d\u80ff\xff", true);
        private const DFA37_max:Array =
            DFA.unpackEncodedString("\x01\xb9\x01\x00\x2d\u80ff\xff", true);
        private const DFA37_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x2b\u80ff\xff"+
            "\x01\x01");
        private const DFA37_special:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x00\x2d\u80ff\xff");
        private const DFA37_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x01\u80ff\xff\x02\x02"+
                "\x01\u80ff\xff\x01\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff"+
                "\x05\x02\x02\u80ff\xff\x02\x02\x01\u80ff\xff\x01\x02\x03"+
                "\u80ff\xff\x02\x02\x04\u80ff\xff\x06\x02\x01\u80ff\xff\x02"+
                "\x02\x01\u80ff\xff\x02\x02\x02\u80ff\xff\x01\x02\x02\u80ff\xff"+
                "\x08\x02\x1c\u80ff\xff\x02\x02\x02\u80ff\xff\x06\x02\x01"+
                "\u80ff\xff\x0d\x02\x01\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA37_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA37_1:int = input.LA(1);

                             
                            var index37_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (( input.LA(1) == LBRACE )) ) {s = 46;}

                            else if ( (true) ) {s = 2;}

                             
                            input.seek(index37_1);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 37, _s, input));
            }

        protected var dfa37:DFA;  // initialized in constructor

        private const DFA38_eot:Array =
            DFA.unpackEncodedString("\x1d\u80ff\xff");
        private const DFA38_eof:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x02\x11\u80ff\xff\x02\x04\x04\u80ff\xff\x01\x02\x01\u80ff\xff");
        private const DFA38_min:Array =
            DFA.unpackEncodedString("\x01\x4c\x01\x4d\x01\u80ff\xff\x01"+
            "\x4d\x02\u80ff\xff\x01\x53\x0e\u80ff\xff\x02\x4c\x01\u80ff\xff"+
            "\x01\x4f\x02\u80ff\xff\x01\x4c\x01\u80ff\xff", true);
        private const DFA38_max:Array =
            DFA.unpackEncodedString("\x01\xb9\x01\xaa\x01\u80ff\xff\x01"+
            "\xaa\x02\u80ff\xff\x01\x73\x0e\u80ff\xff\x02\xb9\x01\u80ff\xff"+
            "\x01\x4f\x02\u80ff\xff\x01\xaa\x01\u80ff\xff", true);
        private const DFA38_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x01\x01\x03\x01\u80ff\xff\x01\x06\x01\x07\x01\x08\x01\x09"+
            "\x01\x0a\x01\x0b\x01\x0d\x01\x0e\x01\x0f\x01\x10\x01\x11\x01"+
            "\x12\x01\x13\x01\x15\x02\u80ff\xff\x01\x0c\x01\u80ff\xff\x01"+
            "\x04\x01\x05\x01\u80ff\xff\x01\x14");
        private const DFA38_special:Array =
            DFA.unpackEncodedString("\x06\u80ff\xff\x01\x00\x16\u80ff\xff");
        private const DFA38_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x01\u80ff\xff\x01\x14"+
                "\x01\x03\x01\u80ff\xff\x01\x02\x01\u80ff\xff\x01\x02\x03"+
                "\u80ff\xff\x01\x11\x01\x02\x01\x13\x01\x01\x01\x12\x02\u80ff\xff"+
                "\x02\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff\x02\x02\x04"+
                "\u80ff\xff\x03\x02\x02\x04\x01\x05\x01\u80ff\xff\x01\x06"+
                "\x01\x02\x01\u80ff\xff\x01\x0e\x01\x0f\x02\u80ff\xff\x01"+
                "\x0d\x02\u80ff\xff\x01\x10\x01\x07\x01\x08\x01\x0c\x01\x0b"+
                "\x01\x09\x01\x0a\x01\x02\x1c\u80ff\xff\x02\x02\x02\u80ff\xff"+
                "\x06\x02\x01\u80ff\xff\x0d\x02\x01\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString("\x02\x02\x01\x04\x02\x02\x01\u80ff\xff"+
                "\x02\x02\x01\u80ff\xff\x01\x02\x02\u80ff\xff\x02\x04\x01"+
                "\u80ff\xff\x02\x02\x01\x04\x0d\u80ff\xff\x02\x04\x06\u80ff\xff"+
                "\x01\x02\x0f\u80ff\xff\x02\x02\x01\x15\x01\x16\x1e\x02\x04"+
                "\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x02\x02\x01\u80ff\xff\x01\x18"+
                "\x01\x02\x01\u80ff\xff\x02\x02\x01\u80ff\xff\x01\x02\x05"+
                "\u80ff\xff\x02\x02\x16\u80ff\xff\x01\x02\x06\u80ff\xff\x01"+
                "\x17\x08\u80ff\xff\x22\x02\x04\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x1a\x1f\u80ff\xff\x01\x19"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x02\x02\x04\x01\x02\x01\u80ff\xff"+
                "\x01\x02\x01\u80ff\xff\x01\x02\x01\x04\x01\u80ff\xff\x01"+
                "\x04\x01\u80ff\xff\x01\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff"+
                "\x02\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff\x02\x02\x04"+
                "\u80ff\xff\x03\x02\x05\u80ff\xff\x01\x02\x07\u80ff\xff\x01"+
                "\x04\x07\u80ff\xff\x01\x02\x1c\u80ff\xff\x02\x02\x02\u80ff\xff"+
                "\x06\x02\x01\u80ff\xff\x0d\x02\x01\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString("\x01\x02\x02\x04\x01\x02\x01\u80ff\xff"+
                "\x01\x02\x01\u80ff\xff\x01\x02\x01\x04\x01\u80ff\xff\x01"+
                "\x04\x01\u80ff\xff\x01\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff"+
                "\x02\x02\x01\u80ff\xff\x01\x02\x03\u80ff\xff\x02\x02\x04"+
                "\u80ff\xff\x03\x02\x05\u80ff\xff\x01\x02\x07\u80ff\xff\x01"+
                "\x04\x07\u80ff\xff\x01\x02\x1c\u80ff\xff\x02\x02\x02\u80ff\xff"+
                "\x06\x02\x01\u80ff\xff\x0d\x02\x01\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x1b"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x1c\x02\x02\x01\u80ff\xff"+
                "\x02\x02\x01\u80ff\xff\x02\x02\x01\u80ff\xff\x01\x02\x05"+
                "\u80ff\xff\x02\x02\x16\u80ff\xff\x01\x02\x0f\u80ff\xff\x22"+
                "\x02\x04\u80ff\xff\x01\x02"),
                DFA.unpackEncodedString("")
        ];
            private function DFA38_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA38_6:int = input.LA(1);

                             
                            var index38_6:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA38_6==115) && (synpred7_AS3())) {s = 25;}

                            else if ( (LA38_6==83) ) {s = 26;}

                             
                            input.seek(index38_6);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 38, _s, input));
            }

        protected var dfa38:DFA;  // initialized in constructor

        private const DFA43_eot:Array =
            DFA.unpackEncodedString("\x25\u80ff\xff");
        private const DFA43_eof:Array =
            DFA.unpackEncodedString("\x25\u80ff\xff");
        private const DFA43_min:Array =
            DFA.unpackEncodedString("\x01\x4c\x02\x00\x01\u80ff\xff\x02"+
            "\x00\x02\u80ff\xff\x02\x00\x1b\u80ff\xff", true);
        private const DFA43_max:Array =
            DFA.unpackEncodedString("\x01\xb9\x02\x00\x01\u80ff\xff\x02"+
            "\x00\x02\u80ff\xff\x02\x00\x1b\u80ff\xff", true);
        private const DFA43_accept:Array =
            DFA.unpackEncodedString("\x03\u80ff\xff\x01\x01\x02\u80ff\xff"+
            "\x02\x01\x02\u80ff\xff\x01\x02\x1a\u80ff\xff");
        private const DFA43_special:Array =
            DFA.unpackEncodedString("\x01\x00\x01\x01\x01\x02\x01\u80ff\xff"+
            "\x01\x03\x01\x04\x02\u80ff\xff\x01\x05\x01\x06\x1b\u80ff\xff");
        private const DFA43_transition:Array = [
                DFA.unpackEncodedString("\x01\x0a\x01\u80ff\xff\x01\x0a"+
                "\x01\x02\x01\u80ff\xff\x01\x0a\x01\u80ff\xff\x01\x0a\x04"+
                "\u80ff\xff\x01\x0a\x01\x03\x01\x01\x03\u80ff\xff\x01\x04"+
                "\x01\x0a\x01\u80ff\xff\x01\x0a\x03\u80ff\xff\x02\x0a\x04"+
                "\u80ff\xff\x01\x0a\x01\x08\x01\x09\x02\x05\x03\u80ff\xff"+
                "\x01\x0a\x0f\u80ff\xff\x01\x0a\x02\u80ff\xff\x01\x06\x01"+
                "\x07\x18\u80ff\xff\x02\x0a\x02\u80ff\xff\x06\x0a\x01\u80ff\xff"+
                "\x0d\x0a\x01\u80ff\xff\x01\x0a"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA43_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA43_0:int = input.LA(1);

                             
                            var index43_0:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA43_0==90) ) {s = 1;}

                            else if ( (LA43_0==79) ) {s = 2;}

                            else if ( (LA43_0==89) && (synpred9_AS3())) {s = 3;}

                            else if ( (LA43_0==94) ) {s = 4;}

                            else if ( ((LA43_0>=110 && LA43_0<=111)) ) {s = 5;}

                            else if ( (LA43_0==134) && (synpred9_AS3())) {s = 6;}

                            else if ( (LA43_0==135) && (synpred9_AS3())) {s = 7;}

                            else if ( (LA43_0==108) ) {s = 8;}

                            else if ( (LA43_0==109) ) {s = 9;}

                            else if ( (LA43_0==76||LA43_0==78||LA43_0==81||LA43_0==83||LA43_0==88||LA43_0==95||LA43_0==97||(LA43_0>=101 && LA43_0<=102)||LA43_0==107||LA43_0==115||LA43_0==131||(LA43_0>=160 && LA43_0<=161)||(LA43_0>=164 && LA43_0<=169)||(LA43_0>=171 && LA43_0<=183)||LA43_0==185) ) {s = 10;}

                             
                            input.seek(index43_0);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA43_1:int = input.LA(1);

                             
                            var index43_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred9_AS3()) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_1);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA43_2:int = input.LA(1);

                             
                            var index43_2:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( ((synpred9_AS3()||(synpred9_AS3()&&(input.LT(1).text == "xml")))) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_2);
                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA43_4:int = input.LA(1);

                             
                            var index43_4:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred9_AS3()) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_4);
                            if ( s>=0 ) return s;
                            break;
                        case 4 : 
                            var LA43_5:int = input.LA(1);

                             
                            var index43_5:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred9_AS3()) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_5);
                            if ( s>=0 ) return s;
                            break;
                        case 5 : 
                            var LA43_8:int = input.LA(1);

                             
                            var index43_8:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred9_AS3()) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_8);
                            if ( s>=0 ) return s;
                            break;
                        case 6 : 
                            var LA43_9:int = input.LA(1);

                             
                            var index43_9:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred9_AS3()) ) {s = 7;}

                            else if ( (true) ) {s = 10;}

                             
                            input.seek(index43_9);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 43, _s, input));
            }

        protected var dfa43:DFA;  // initialized in constructor

        private const DFA65_eot:Array =
            DFA.unpackEncodedString("\x0b\u80ff\xff");
        private const DFA65_eof:Array =
            DFA.unpackEncodedString("\x0b\u80ff\xff");
        private const DFA65_min:Array =
            DFA.unpackEncodedString("\x01\x4f\x01\x00\x09\u80ff\xff", true);
        private const DFA65_max:Array =
            DFA.unpackEncodedString("\x01\x87\x01\x00\x09\u80ff\xff", true);
        private const DFA65_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x04\x01"+
            "\x05\x01\x06\x01\x07\x01\x08\x01\x09\x01\x01\x01\x03");
        private const DFA65_special:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x00\x09\u80ff\xff");
        private const DFA65_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x09\u80ff\xff\x01\x02"+
                "\x01\x04\x03\u80ff\xff\x01\x03\x0d\u80ff\xff\x01\x07\x01"+
                "\x08\x18\u80ff\xff\x01\x05\x01\x06"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA65_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA65_1:int = input.LA(1);

                             
                            var index65_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (!(((input.LT(1).text == "xml")))) ) {s = 9;}

                            else if ( ((input.LT(1).text == "xml")) ) {s = 10;}

                             
                            input.seek(index65_1);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 65, _s, input));
            }

        protected var dfa65:DFA;  // initialized in constructor

        private const DFA67_eot:Array =
            DFA.unpackEncodedString("\x10\u80ff\xff");
        private const DFA67_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x0f\u80ff\xff");
        private const DFA67_min:Array =
            DFA.unpackEncodedString("\x01\x4d\x01\u80ff\xff\x0d\x00\x01"+
            "\u80ff\xff", true);
        private const DFA67_max:Array =
            DFA.unpackEncodedString("\x01\x91\x01\u80ff\xff\x0d\x00\x01"+
            "\u80ff\xff", true);
        private const DFA67_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x0d\u80ff\xff"+
            "\x01\x01");
        private const DFA67_special:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x08\x01\x09\x01"+
            "\x03\x01\x04\x01\x06\x01\x0a\x01\x0c\x01\x02\x01\x01\x01\x00"+
            "\x01\x0b\x01\x07\x01\x05\x01\u80ff\xff");
        private const DFA67_transition:Array = [
                DFA.unpackEncodedString("\x02\x01\x03\u80ff\xff\x01\x01"+
                "\x01\u80ff\xff\x02\x01\x01\x02\x06\u80ff\xff\x01\x03\x16"+
                "\u80ff\xff\x01\x01\x06\u80ff\xff\x01\x01\x09\u80ff\xff\x01"+
                "\x09\x02\u80ff\xff\x01\x04\x01\x05\x01\x06\x01\x07\x01\x08"+
                "\x01\x0a\x01\x0b\x01\x0c\x01\x0d\x01\x0e"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("")
        ];
            private function DFA67_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA67_11:int = input.LA(1);

                             
                            var index67_11:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_11);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA67_10:int = input.LA(1);

                             
                            var index67_10:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_10);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA67_9:int = input.LA(1);

                             
                            var index67_9:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_9);
                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA67_4:int = input.LA(1);

                             
                            var index67_4:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_4);
                            if ( s>=0 ) return s;
                            break;
                        case 4 : 
                            var LA67_5:int = input.LA(1);

                             
                            var index67_5:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_5);
                            if ( s>=0 ) return s;
                            break;
                        case 5 : 
                            var LA67_14:int = input.LA(1);

                             
                            var index67_14:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_14);
                            if ( s>=0 ) return s;
                            break;
                        case 6 : 
                            var LA67_6:int = input.LA(1);

                             
                            var index67_6:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_6);
                            if ( s>=0 ) return s;
                            break;
                        case 7 : 
                            var LA67_13:int = input.LA(1);

                             
                            var index67_13:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_13);
                            if ( s>=0 ) return s;
                            break;
                        case 8 : 
                            var LA67_2:int = input.LA(1);

                             
                            var index67_2:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_2);
                            if ( s>=0 ) return s;
                            break;
                        case 9 : 
                            var LA67_3:int = input.LA(1);

                             
                            var index67_3:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_3);
                            if ( s>=0 ) return s;
                            break;
                        case 10 : 
                            var LA67_7:int = input.LA(1);

                             
                            var index67_7:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_7);
                            if ( s>=0 ) return s;
                            break;
                        case 11 : 
                            var LA67_12:int = input.LA(1);

                             
                            var index67_12:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_12);
                            if ( s>=0 ) return s;
                            break;
                        case 12 : 
                            var LA67_8:int = input.LA(1);

                             
                            var index67_8:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred10_AS3()) ) {s = 15;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index67_8);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 67, _s, input));
            }

        protected var dfa67:DFA;  // initialized in constructor

        private const DFA68_eot:Array =
            DFA.unpackEncodedString("\x11\u80ff\xff");
        private const DFA68_eof:Array =
            DFA.unpackEncodedString("\x11\u80ff\xff");
        private const DFA68_min:Array =
            DFA.unpackEncodedString("\x01\x56\x07\u80ff\xff\x01\x85\x05"+
            "\u80ff\xff\x01\x56\x02\u80ff\xff", true);
        private const DFA68_max:Array =
            DFA.unpackEncodedString("\x01\x91\x07\u80ff\xff\x01\x85\x05"+
            "\u80ff\xff\x01\x85\x02\u80ff\xff", true);
        private const DFA68_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x01\x01\x02\x01"+
            "\x03\x01\x04\x01\x05\x01\x06\x01\x07\x01\u80ff\xff\x01\x0a\x01"+
            "\x0b\x01\x0c\x01\x0d\x01\x0e\x01\u80ff\xff\x01\x08\x01\x09");
        private const DFA68_special:Array =
            DFA.unpackEncodedString("\x01\x01\x0d\u80ff\xff\x01\x00\x02"+
            "\u80ff\xff");
        private const DFA68_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x06\u80ff\xff\x01\x02"+
                "\x27\u80ff\xff\x01\x08\x02\u80ff\xff\x01\x03\x01\x04\x01"+
                "\x05\x01\x06\x01\x07\x01\x09\x01\x0a\x01\x0b\x01\x0c\x01"+
                "\x0d"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x0e"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x0f\x2e\u80ff\xff\x01\x10"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA68_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA68_14:int = input.LA(1);

                             
                            var index68_14:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA68_14==86) && (synpred12_AS3())) {s = 15;}

                            else if ( (LA68_14==133) && (synpred13_AS3())) {s = 16;}

                             
                            input.seek(index68_14);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA68_0:int = input.LA(1);

                             
                            var index68_0:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA68_0==86) ) {s = 1;}

                            else if ( (LA68_0==93) && (synpred11_AS3())) {s = 2;}

                            else if ( (LA68_0==136) ) {s = 3;}

                            else if ( (LA68_0==137) ) {s = 4;}

                            else if ( (LA68_0==138) ) {s = 5;}

                            else if ( (LA68_0==139) ) {s = 6;}

                            else if ( (LA68_0==140) ) {s = 7;}

                            else if ( (LA68_0==133) ) {s = 8;}

                            else if ( (LA68_0==141) ) {s = 9;}

                            else if ( (LA68_0==142) ) {s = 10;}

                            else if ( (LA68_0==143) ) {s = 11;}

                            else if ( (LA68_0==144) ) {s = 12;}

                            else if ( (LA68_0==145) ) {s = 13;}

                             
                            input.seek(index68_0);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 68, _s, input));
            }

        protected var dfa68:DFA;  // initialized in constructor

        private const DFA76_eot:Array =
            DFA.unpackEncodedString("\x22\u80ff\xff");
        private const DFA76_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x21\u80ff\xff");
        private const DFA76_min:Array =
            DFA.unpackEncodedString("\x01\x4d\x0e\u80ff\xff\x01\x00\x09"+
            "\u80ff\xff\x01\x00\x08\u80ff\xff", true);
        private const DFA76_max:Array =
            DFA.unpackEncodedString("\x01\x9e\x0e\u80ff\xff\x01\x00\x09"+
            "\u80ff\xff\x01\x00\x08\u80ff\xff", true);
        private const DFA76_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x1b\u80ff\xff"+
            "\x05\x01");
        private const DFA76_special:Array =
            DFA.unpackEncodedString("\x01\x00\x0e\u80ff\xff\x01\x01\x09"+
            "\u80ff\xff\x01\x02\x08\u80ff\xff");
        private const DFA76_transition:Array = [
                DFA.unpackEncodedString("\x02\x01\x03\u80ff\xff\x01\x01"+
                "\x01\u80ff\xff\x03\x01\x06\u80ff\xff\x01\x01\x16\u80ff\xff"+
                "\x01\x19\x06\u80ff\xff\x01\x01\x09\u80ff\xff\x01\x0f\x01"+
                "\x1f\x01\x20\x14\x01\x01\x1d\x01\x1e\x01\x21"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA76_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA76_0:int = input.LA(1);

                             
                            var index76_0:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA76_0==-1||(LA76_0>=77 && LA76_0<=78)||LA76_0==82||(LA76_0>=84 && LA76_0<=86)||LA76_0==93||LA76_0==123||(LA76_0>=136 && LA76_0<=155)) ) {s = 1;}

                            else if ( (LA76_0==133) ) {s = 15;}

                            else if ( (LA76_0==116) ) {s = 25;}

                            else if ( (LA76_0==156) && (synpred14_AS3())) {s = 29;}

                            else if ( (LA76_0==157) && (synpred14_AS3())) {s = 30;}

                            else if ( (LA76_0==134) && (synpred14_AS3())) {s = 31;}

                            else if ( (LA76_0==135) && (synpred14_AS3())) {s = 32;}

                            else if ( (LA76_0==158) && (synpred14_AS3())) {s = 33;}

                             
                            input.seek(index76_0);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA76_15:int = input.LA(1);

                             
                            var index76_15:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred14_AS3()) ) {s = 33;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index76_15);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA76_25:int = input.LA(1);

                             
                            var index76_25:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( ((synpred14_AS3()&&(InOperator_stack[InOperator_stack.length-1].allowed))) ) {s = 33;}

                            else if ( (true) ) {s = 1;}

                             
                            input.seek(index76_25);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 76, _s, input));
            }

        protected var dfa76:DFA;  // initialized in constructor

        private const DFA78_eot:Array =
            DFA.unpackEncodedString("\x20\u80ff\xff");
        private const DFA78_eof:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x1f\x1e\u80ff\xff");
        private const DFA78_min:Array =
            DFA.unpackEncodedString("\x01\x74\x01\x4c\x1e\u80ff\xff", true);
        private const DFA78_max:Array =
            DFA.unpackEncodedString("\x01\x9e\x01\xb9\x1e\u80ff\xff", true);
        private const DFA78_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x03\x01\x02\x1c"+
            "\x01");
        private const DFA78_special:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x00\x1e\u80ff\xff");
        private const DFA78_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x10\u80ff\xff\x01\x01"+
                "\x02\x02\x14\u80ff\xff\x03\x02"),
                DFA.unpackEncodedString("\x01\x1a\x02\u80ff\xff\x01\x10"+
                "\x01\u80ff\xff\x01\x19\x01\u80ff\xff\x01\x1b\x02\u80ff\xff"+
                "\x01\x03\x01\u80ff\xff\x01\x16\x01\u80ff\xff\x01\x11\x03"+
                "\u80ff\xff\x02\x11\x01\u80ff\xff\x01\x11\x03\u80ff\xff\x02"+
                "\x11\x04\u80ff\xff\x01\x1d\x02\x11\x05\u80ff\xff\x01\x11"+
                "\x0f\u80ff\xff\x01\x09\x1c\u80ff\xff\x01\x07\x01\x06\x02"+
                "\u80ff\xff\x01\x04\x01\x05\x01\x08\x01\x0a\x01\x0b\x01\x0c"+
                "\x01\u80ff\xff\x01\x0d\x01\x0e\x01\x0f\x01\x1e\x01\x12\x01"+
                "\x13\x01\x14\x01\x17\x01\x18\x04\x15\x01\u80ff\xff\x01\x1c"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA78_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA78_1:int = input.LA(1);

                             
                            var index78_1:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA78_1==86) && (synpred16_AS3())) {s = 3;}

                            else if ( (LA78_1==164) && (synpred15_AS3())) {s = 4;}

                            else if ( (LA78_1==165) && (synpred15_AS3())) {s = 5;}

                            else if ( (LA78_1==161) && (synpred15_AS3())) {s = 6;}

                            else if ( (LA78_1==160) && (synpred15_AS3())) {s = 7;}

                            else if ( (LA78_1==166) && (synpred15_AS3())) {s = 8;}

                            else if ( (LA78_1==131) && (synpred15_AS3())) {s = 9;}

                            else if ( (LA78_1==167) && (synpred15_AS3())) {s = 10;}

                            else if ( (LA78_1==168) && (synpred15_AS3())) {s = 11;}

                            else if ( (LA78_1==169) && (synpred15_AS3())) {s = 12;}

                            else if ( (LA78_1==171) && (synpred15_AS3())) {s = 13;}

                            else if ( (LA78_1==172) && (synpred15_AS3())) {s = 14;}

                            else if ( (LA78_1==173) && (synpred15_AS3())) {s = 15;}

                            else if ( (LA78_1==79) && (synpred15_AS3())) {s = 16;}

                            else if ( (LA78_1==90||(LA78_1>=94 && LA78_1<=95)||LA78_1==97||(LA78_1>=101 && LA78_1<=102)||(LA78_1>=108 && LA78_1<=109)||LA78_1==115) && (synpred15_AS3())) {s = 17;}

                            else if ( (LA78_1==175) && (synpred15_AS3())) {s = 18;}

                            else if ( (LA78_1==176) && (synpred15_AS3())) {s = 19;}

                            else if ( (LA78_1==177) && (synpred15_AS3())) {s = 20;}

                            else if ( ((LA78_1>=180 && LA78_1<=183)) && (synpred15_AS3())) {s = 21;}

                            else if ( (LA78_1==88) && (synpred15_AS3())) {s = 22;}

                            else if ( (LA78_1==178) && (synpred15_AS3())) {s = 23;}

                            else if ( (LA78_1==179) && (synpred15_AS3())) {s = 24;}

                            else if ( (LA78_1==81) && (synpred15_AS3())) {s = 25;}

                            else if ( (LA78_1==76) && (synpred15_AS3())) {s = 26;}

                            else if ( (LA78_1==83) && (synpred15_AS3())) {s = 27;}

                            else if ( (LA78_1==185) && (synpred15_AS3())) {s = 28;}

                            else if ( (LA78_1==107) && (synpred15_AS3())) {s = 29;}

                            else if ( (LA78_1==174) && (synpred15_AS3())) {s = 30;}

                            else if ( (LA78_1==-1) && (synpred15_AS3())) {s = 31;}

                             
                            input.seek(index78_1);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 78, _s, input));
            }

        protected var dfa78:DFA;  // initialized in constructor

        private const DFA80_eot:Array =
            DFA.unpackEncodedString("\x20\u80ff\xff");
        private const DFA80_eof:Array =
            DFA.unpackEncodedString("\x20\u80ff\xff");
        private const DFA80_min:Array =
            DFA.unpackEncodedString("\x01\x85\x01\u80ff\xff\x01\x85\x01"+
            "\x4c\x1c\u80ff\xff", true);
        private const DFA80_max:Array =
            DFA.unpackEncodedString("\x01\x9f\x01\u80ff\xff\x01\x85\x01"+
            "\xb9\x1c\u80ff\xff", true);
        private const DFA80_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x01\x02\u80ff\xff"+
            "\x01\x03\x1b\x02");
        private const DFA80_special:Array =
            DFA.unpackEncodedString("\x03\u80ff\xff\x01\x00\x1c\u80ff\xff");
        private const DFA80_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x19\u80ff\xff\x01\x01"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x03"),
                DFA.unpackEncodedString("\x01\x1b\x02\u80ff\xff\x01\x11"+
                "\x01\u80ff\xff\x01\x1a\x01\u80ff\xff\x01\x1c\x04\u80ff\xff"+
                "\x01\x17\x01\u80ff\xff\x01\x12\x03\u80ff\xff\x02\x12\x01"+
                "\u80ff\xff\x01\x12\x03\u80ff\xff\x02\x12\x04\u80ff\xff\x01"+
                "\x1e\x02\x12\x05\u80ff\xff\x01\x12\x0f\u80ff\xff\x01\x0a"+
                "\x01\u80ff\xff\x01\x04\x1a\u80ff\xff\x01\x08\x01\x07\x02"+
                "\u80ff\xff\x01\x05\x01\x06\x01\x09\x01\x0b\x01\x0c\x01\x0d"+
                "\x01\u80ff\xff\x01\x0e\x01\x0f\x01\x10\x01\x1f\x01\x13\x01"+
                "\x14\x01\x15\x01\x18\x01\x19\x04\x16\x01\u80ff\xff\x01\x1d"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA80_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA80_3:int = input.LA(1);

                             
                            var index80_3:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (LA80_3==133) && (synpred18_AS3())) {s = 4;}

                            else if ( (LA80_3==164) && (synpred17_AS3())) {s = 5;}

                            else if ( (LA80_3==165) && (synpred17_AS3())) {s = 6;}

                            else if ( (LA80_3==161) && (synpred17_AS3())) {s = 7;}

                            else if ( (LA80_3==160) && (synpred17_AS3())) {s = 8;}

                            else if ( (LA80_3==166) && (synpred17_AS3())) {s = 9;}

                            else if ( (LA80_3==131) && (synpred17_AS3())) {s = 10;}

                            else if ( (LA80_3==167) && (synpred17_AS3())) {s = 11;}

                            else if ( (LA80_3==168) && (synpred17_AS3())) {s = 12;}

                            else if ( (LA80_3==169) && (synpred17_AS3())) {s = 13;}

                            else if ( (LA80_3==171) && (synpred17_AS3())) {s = 14;}

                            else if ( (LA80_3==172) && (synpred17_AS3())) {s = 15;}

                            else if ( (LA80_3==173) && (synpred17_AS3())) {s = 16;}

                            else if ( (LA80_3==79) && (synpred17_AS3())) {s = 17;}

                            else if ( (LA80_3==90||(LA80_3>=94 && LA80_3<=95)||LA80_3==97||(LA80_3>=101 && LA80_3<=102)||(LA80_3>=108 && LA80_3<=109)||LA80_3==115) && (synpred17_AS3())) {s = 18;}

                            else if ( (LA80_3==175) && (synpred17_AS3())) {s = 19;}

                            else if ( (LA80_3==176) && (synpred17_AS3())) {s = 20;}

                            else if ( (LA80_3==177) && (synpred17_AS3())) {s = 21;}

                            else if ( ((LA80_3>=180 && LA80_3<=183)) && (synpred17_AS3())) {s = 22;}

                            else if ( (LA80_3==88) && (synpred17_AS3())) {s = 23;}

                            else if ( (LA80_3==178) && (synpred17_AS3())) {s = 24;}

                            else if ( (LA80_3==179) && (synpred17_AS3())) {s = 25;}

                            else if ( (LA80_3==81) && (synpred17_AS3())) {s = 26;}

                            else if ( (LA80_3==76) && (synpred17_AS3())) {s = 27;}

                            else if ( (LA80_3==83) && (synpred17_AS3())) {s = 28;}

                            else if ( (LA80_3==185) && (synpred17_AS3())) {s = 29;}

                            else if ( (LA80_3==107) && (synpred17_AS3())) {s = 30;}

                            else if ( (LA80_3==174) && (synpred17_AS3())) {s = 31;}

                             
                            input.seek(index80_3);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 80, _s, input));
            }

        protected var dfa80:DFA;  // initialized in constructor

        private const DFA88_eot:Array =
            DFA.unpackEncodedString("\x0b\u80ff\xff");
        private const DFA88_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x0a\u80ff\xff");
        private const DFA88_min:Array =
            DFA.unpackEncodedString("\x01\x4d\x03\u80ff\xff\x01\x4f\x06"+
            "\u80ff\xff", true);
        private const DFA88_max:Array =
            DFA.unpackEncodedString("\x01\xaa\x03\u80ff\xff\x01\xb9\x06"+
            "\u80ff\xff", true);
        private const DFA88_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x09\x01\x01\x01"+
            "\x02\x01\u80ff\xff\x01\x04\x01\x06\x01\x08\x01\x05\x01\x03\x01"+
            "\x07");
        private const DFA88_special:Array =
            DFA.unpackEncodedString("\x0b\u80ff\xff");
        private const DFA88_transition:Array = [
                DFA.unpackEncodedString("\x02\x01\x01\u80ff\xff\x01\x06"+
                "\x01\x03\x01\x01\x01\x02\x03\x01\x05\u80ff\xff\x01\x04\x01"+
                "\x01\x16\u80ff\xff\x01\x01\x06\u80ff\xff\x01\x01\x08\u80ff\xff"+
                "\x01\x05\x21\x01\x04\u80ff\xff\x01\x07"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x09\x03\u80ff\xff\x01\x08"+
                "\x65\u80ff\xff\x01\x0a"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
        protected var dfa88:DFA;  // initialized in constructor
     

        public static const FOLLOW_asCompilationUnit_in_compilationUnit386:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_packageBlockEntry_in_mxmlScriptUnit417:BitSet = new BitSet([0x00000002, 0x00000000, 0xCE82C000, 0x0000CCFF]);
        public static const FOLLOW_statement_in_program445:BitSet = new BitSet([0x00000002, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_packageDecl_in_asCompilationUnit475:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82C000, 0x0000CCFF]);
        public static const FOLLOW_packageBlockEntry_in_asCompilationUnit479:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82C000, 0x0000CCFF]);
        public static const FOLLOW_EOF_in_asCompilationUnit484:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_PACKAGE_in_packageDecl497:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4009000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_packageDecl500:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4009000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_packageBlock_in_packageDecl503:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_packageBlock515:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82E000, 0x0000CCFF]);
        public static const FOLLOW_packageBlockEntry_in_packageBlock517:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82E000, 0x0000CCFF]);
        public static const FOLLOW_RBRACE_in_packageBlock520:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_annotations_in_packageBlockEntry551:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE828000, 0x0000CCFF]);
        public static const FOLLOW_modifiers_in_packageBlockEntry559:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE828000, 0x0000CCFF]);
        public static const FOLLOW_classDefinition_in_packageBlockEntry568:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_interfaceDefinition_in_packageBlockEntry575:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_variableDefinition_in_packageBlockEntry582:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_functionDefinition_in_packageBlockEntry589:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SEMI_in_packageBlockEntry601:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_EOF_in_endOfFile616:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_annotation_in_annotations633:BitSet = new BitSet([0x00000002, 0x00000000, 0x0A828000, 0x00000000]);
        public static const FOLLOW_configBlockDirective_in_annotation667:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_metaDirective_in_annotation674:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_includeDirective_in_annotation680:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_importDirective_in_annotation687:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_useNamespaceDirective_in_annotation694:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_configIdent714:BitSet = new BitSet([0x00000000, 0x00000000, 0x00010000, 0x00000000]);
        public static const FOLLOW_DBL_COLON_in_configIdent716:BitSet = new BitSet([0x00000000, 0x00000000, 0x00008000, 0x00000000]);
        public static const FOLLOW_IDENT_in_configIdent719:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configIdent_in_configBlockDirective733:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_configBlockDirective735:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACK_in_metaDirective760:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_metaDirective762:BitSet = new BitSet([0x00000000, 0x00000000, 0x000C0000, 0x00000000]);
        public static const FOLLOW_metaDirectiveList_in_metaDirective764:BitSet = new BitSet([0x00000000, 0x00000000, 0x00040000, 0x00000000]);
        public static const FOLLOW_RBRACK_in_metaDirective767:BitSet = new BitSet([0x00000002, 0x00000000, 0x00004000, 0x00000000]);
        public static const FOLLOW_SEMI_in_metaDirective769:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_metaDirectiveList799:BitSet = new BitSet([0x00000000, 0x00000000, 0xE7208000, 0x10083063, 0x000000C8, 0x00FF8000]);
        public static const FOLLOW_metaTagParam_in_metaDirectiveList803:BitSet = new BitSet([0x00000000, 0x00000000, 0x00300000, 0x00000000]);
        public static const FOLLOW_COMMA_in_metaDirectiveList807:BitSet = new BitSet([0x00000000, 0x00000000, 0xE7008000, 0x10083063, 0x000000C8, 0x00FF8000]);
        public static const FOLLOW_metaTagParam_in_metaDirectiveList809:BitSet = new BitSet([0x00000000, 0x00000000, 0x00300000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_metaDirectiveList817:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_metaTagParam845:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_metaTagParam847:BitSet = new BitSet([0x00000000, 0x00000000, 0x01000000, 0x00000000, 0x00000000, 0x00FF8000]);
        public static const FOLLOW_constant_in_metaTagParam849:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_constant_in_metaTagParam864:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_type_in_metaTagParam881:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_metaTagParam890:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_metaTagParam892:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_metaTagParam901:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_metaTagParam916:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_INCLUDE_in_includeDirective932:BitSet = new BitSet([0x00000000, 0x00000000, 0x01000000, 0x00000000]);
        public static const FOLLOW_STRING_LITERAL_in_includeDirective935:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_includeDirective937:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_USE_in_useNamespaceDirective949:BitSet = new BitSet([0x00000000, 0x00000000, 0x04000000, 0x00000000]);
        public static const FOLLOW_NAMESPACE_in_useNamespaceDirective952:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_useNamespaceDirective954:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_useNamespaceDirective956:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IMPORT_in_importDirective968:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_importDirective971:BitSet = new BitSet([0x00000000, 0x00000000, 0x10006000, 0x00000000]);
        public static const FOLLOW_DOT_in_importDirective975:BitSet = new BitSet([0x00000000, 0x00000000, 0x20000000, 0x00000000]);
        public static const FOLLOW_STAR_in_importDirective978:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_importDirective983:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_modifier_in_modifiers999:BitSet = new BitSet([0x00000002, 0x00000000, 0xC0008000, 0x0000007F]);
        public static const FOLLOW_set_in_modifier0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SEMI_in_semi1091:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_EOF_in_semi1097:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_RBRACE_in_semi1103:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_CLASS_in_classDefinition1129:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_classDefinition1131:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000300]);
        public static const FOLLOW_classExtendsClause_in_classDefinition1135:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000300]);
        public static const FOLLOW_classImplementsClause_in_classDefinition1139:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000300]);
        public static const FOLLOW_classTypeBlock_in_classDefinition1143:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_EXTENDS_in_classExtendsClause1178:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_classExtendsClause1181:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IMPLEMENTS_in_classImplementsClause1197:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_classImplementsClause1200:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_COMMA_in_classImplementsClause1204:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_classImplementsClause1207:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_INTERFACE_in_interfaceDefinition1234:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_interfaceDefinition1236:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000100]);
        public static const FOLLOW_interfaceExtendsClause_in_interfaceDefinition1240:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000100]);
        public static const FOLLOW_interfaceTypeBlock_in_interfaceDefinition1244:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_EXTENDS_in_interfaceExtendsClause1276:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_interfaceExtendsClause1279:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_COMMA_in_interfaceExtendsClause1283:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_interfaceExtendsClause1286:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_FUNCTION_in_functionDefinition1311:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_functionDefinition1315:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_parameterDeclarationList_in_functionDefinition1319:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_functionDefinition1323:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_functionDefinition1328:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_variableModifier_in_variableDefinition1424:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_variableDefinition1426:BitSet = new BitSet([0x00000000, 0x00000000, 0x00106000, 0x00000000]);
        public static const FOLLOW_COMMA_in_variableDefinition1430:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_variableDefinition1432:BitSet = new BitSet([0x00000000, 0x00000000, 0x00106000, 0x00000000]);
        public static const FOLLOW_semi_in_variableDefinition1437:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_classTypeBlock1475:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82B000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_classTypeBlockEntry_in_classTypeBlock1479:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82B000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_RBRACE_in_classTypeBlock1484:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configBlockEntry_in_classTypeBlockEntry1517:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_staticBlockEntry_in_classTypeBlockEntry1530:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_annotations_in_classTypeBlockEntry1545:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE829000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_modifiers_in_classTypeBlockEntry1555:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE829000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_fieldDefinitionBlockEntry_in_classTypeBlockEntry1570:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_classMethodDefinitionBlockEntry_in_classTypeBlockEntry1580:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_staticLinkEntry_in_classTypeBlockEntry1589:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_interfaceTypeBlock1618:BitSet = new BitSet([0x00000000, 0x00000000, 0x0A82B000, 0x00000800]);
        public static const FOLLOW_interfaceTypeBlockEntry_in_interfaceTypeBlock1622:BitSet = new BitSet([0x00000000, 0x00000000, 0x0A82B000, 0x00000800]);
        public static const FOLLOW_RBRACE_in_interfaceTypeBlock1627:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configBlockEntry_in_interfaceTypeBlockEntry1661:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_staticBlockEntry_in_interfaceTypeBlockEntry1674:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_annotations_in_interfaceTypeBlockEntry1690:BitSet = new BitSet([0x00000000, 0x00000000, 0x0A829000, 0x00000800]);
        public static const FOLLOW_interfaceMethodDefinitionBlockEntry_in_interfaceTypeBlockEntry1704:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configIdent_in_configBlockEntry1735:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_LBRACE_in_configBlockEntry1737:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82B000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_classTypeBlockEntry_in_configBlockEntry1739:BitSet = new BitSet([0x00000000, 0x00000000, 0xCE82B000, 0x0000F87F, 0x000000C0, 0x00000000]);
        public static const FOLLOW_RBRACE_in_configBlockEntry1742:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_staticBlockEntry1778:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AF000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_blockEntry_in_staticBlockEntry1780:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AF000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_RBRACE_in_staticBlockEntry1783:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_staticLinkEntry1807:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_staticLinkEntry1809:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_variableModifier_in_fieldDefinitionBlockEntry1851:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_fieldDefinitionBlockEntry1853:BitSet = new BitSet([0x00000000, 0x00000000, 0x00106000, 0x00000000]);
        public static const FOLLOW_COMMA_in_fieldDefinitionBlockEntry1857:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_fieldDefinitionBlockEntry1859:BitSet = new BitSet([0x00000000, 0x00000000, 0x00106000, 0x00000000]);
        public static const FOLLOW_semi_in_fieldDefinitionBlockEntry1864:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FUNCTION_in_classMethodDefinitionBlockEntry1904:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_optionalAccessorRole_in_classMethodDefinitionBlockEntry1910:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_classMethodDefinitionBlockEntry1917:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_parameterDeclarationList_in_classMethodDefinitionBlockEntry1921:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_classMethodDefinitionBlockEntry1925:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_classMethodDefinitionBlockEntry1930:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FUNCTION_in_interfaceMethodDefinitionBlockEntry2002:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_optionalAccessorRole_in_interfaceMethodDefinitionBlockEntry2008:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_interfaceMethodDefinitionBlockEntry2015:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_parameterDeclarationList_in_interfaceMethodDefinitionBlockEntry2019:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_interfaceMethodDefinitionBlockEntry2023:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_interfaceMethodDefinitionBlockEntry2028:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_accessorRole_in_optionalAccessorRole2087:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_accessorRole0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_block2138:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AF000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_blockEntry_in_block2140:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AF000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_RBRACE_in_block2143:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_statement_in_blockEntry2169:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_block_in_statement2199:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_statementTail_in_statement2205:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_declarationStatement_in_statementTail2217:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionStatement_in_statementTail2222:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ifStatement_in_statementTail2227:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_forEachStatement_in_statementTail2240:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_forStatement_in_statementTail2245:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_whileStatement_in_statementTail2250:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_doWhileStatement_in_statementTail2255:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_continueStatement_in_statementTail2262:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_breakStatement_in_statementTail2267:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_returnStatement_in_statementTail2272:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_withStatement_in_statementTail2277:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_labelStatement_in_statementTail2282:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_switchStatement_in_statementTail2287:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_throwStatement_in_statementTail2292:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_tryStatement_in_statementTail2297:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_defaultXMLNamespaceStatement_in_statementTail2303:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_includeDirective_in_statementTail2308:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_importDirective_in_statementTail2314:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_useNamespaceDirective_in_statementTail2319:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configBlockDirective_in_statementTail2326:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_emptyStatement_in_statementTail2334:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_variableModifier0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_variableDeclarator2373:BitSet = new BitSet([0x00000002, 0x00000000, 0x00400000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_variableDeclarator2375:BitSet = new BitSet([0x00000002, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_variableInitializer_in_variableDeclarator2378:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_declaration_in_declarationStatement2419:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_declarationStatement2421:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_variableModifier_in_declaration2433:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_declaration2436:BitSet = new BitSet([0x00000000, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_declarationTail_in_declaration2438:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_COMMA_in_declarationTail2463:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_variableDeclarator_in_declarationTail2466:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_variableInitializer2481:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_variableInitializer2484:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SEMI_in_emptyStatement2495:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionList_in_expressionStatement2521:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_expressionStatement2523:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IF_in_ifStatement2550:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_condition_in_ifStatement2553:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26FF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_ifStatement2555:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00020000]);
        public static const FOLLOW_elseClause_in_ifStatement2566:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ELSE_in_elseClause2580:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_elseClause2583:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_condition2594:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_condition2596:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_condition2598:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FOR_in_forEachStatement2627:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00080000]);
        public static const FOLLOW_EACH_in_forEachStatement2629:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_LPAREN_in_forEachStatement2631:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x0000F000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_forInClause_in_forEachStatement2633:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_forEachStatement2635:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_forEachStatement2639:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FOR_in_forStatement2681:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_LPAREN_in_forStatement2683:BitSet = new BitSet([0x00000000, 0x00000000, 0xC70AD000, 0x0008F862, 0x000000C8, 0x02FFFBF3]);
        public static const FOLLOW_forInClause_in_forStatement2698:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_forStatement2700:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_forStatement2702:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_traditionalForClause_in_forStatement2728:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_forStatement2730:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_forStatement2732:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_forInit_in_traditionalForClause2765:BitSet = new BitSet([0x00000000, 0x00000000, 0x00004000, 0x00000000]);
        public static const FOLLOW_SEMI_in_traditionalForClause2769:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50AD000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_forCond_in_traditionalForClause2777:BitSet = new BitSet([0x00000000, 0x00000000, 0x00004000, 0x00000000]);
        public static const FOLLOW_SEMI_in_traditionalForClause2781:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_forIter_in_traditionalForClause2789:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_forInClauseDecl_in_forInClause2803:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00100000]);
        public static const FOLLOW_IN_in_forInClause2805:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_forInClauseTail_in_forInClause2808:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_declaration_in_forInClauseDecl2829:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_forInClauseDecl2833:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionList_in_forInClauseTail2855:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_declaration_in_forInit2880:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionList_in_forInit2884:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionList_in_forCond2924:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_expressionList_in_forIter2959:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_THROW_in_throwStatement2988:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_throwStatement2991:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_throwStatement2993:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_TRY_in_tryStatement3005:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_tryStatement3009:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x01800000]);
        public static const FOLLOW_finallyBlock_in_tryStatement3014:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_catchBlock_in_tryStatement3019:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x01800000]);
        public static const FOLLOW_finallyBlock_in_tryStatement3024:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_CATCH_in_catchBlock3057:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_LPAREN_in_catchBlock3059:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_catchBlock3061:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_catchBlock3063:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_catchBlock3066:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_catchBlock3070:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FINALLY_in_finallyBlock3098:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_finallyBlock3101:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SWITCH_in_switchStatement3116:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_condition_in_switchStatement3119:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_switchBlock_in_switchStatement3123:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_switchBlock3134:BitSet = new BitSet([0x00000000, 0x00000000, 0x00002000, 0x14000000]);
        public static const FOLLOW_caseStatement_in_switchBlock3140:BitSet = new BitSet([0x00000000, 0x00000000, 0x00002000, 0x14000000]);
        public static const FOLLOW_defaultStatement_in_switchBlock3149:BitSet = new BitSet([0x00000000, 0x00000000, 0x00002000, 0x00000000]);
        public static const FOLLOW_RBRACE_in_switchBlock3156:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_CASE_in_caseStatement3183:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_caseStatement3186:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_COLON_in_caseStatement3188:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_switchStatementList_in_caseStatement3193:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DEFAULT_in_defaultStatement3207:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_COLON_in_defaultStatement3210:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_switchStatementList_in_defaultStatement3215:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_statement_in_switchStatementList3228:BitSet = new BitSet([0x00000002, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_WHILE_in_whileStatement3255:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_condition_in_whileStatement3258:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_whileStatement3260:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DO_in_doWhileStatement3271:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_doWhileStatement3274:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x20000000]);
        public static const FOLLOW_WHILE_in_doWhileStatement3276:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_condition_in_doWhileStatement3279:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_doWhileStatement3281:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_WITH_in_withStatement3296:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_condition_in_withStatement3299:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_withStatement3301:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_labelStatement3316:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_COLON_in_labelStatement3318:BitSet = new BitSet([0x00000000, 0x00000000, 0xCF8AD000, 0xF26DF862, 0x0000000F, 0x02FFFBF3]);
        public static const FOLLOW_statement_in_labelStatement3320:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_RETURN_in_returnStatement3349:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50AF000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_returnStatement3352:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_returnStatement3355:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_CONTINUE_in_continueStatement3366:BitSet = new BitSet([0x00000000, 0x00000000, 0x4600E000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_continueStatement3369:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_continueStatement3372:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_BREAK_in_breakStatement3383:BitSet = new BitSet([0x00000000, 0x00000000, 0x4600E000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_breakStatement3386:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_breakStatement3389:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DEFAULT_in_defaultXMLNamespaceStatement3400:BitSet = new BitSet([0x00000000, 0x00000000, 0x00008000, 0x00000000]);
        public static const FOLLOW_xmlKeyword_in_defaultXMLNamespaceStatement3402:BitSet = new BitSet([0x00000000, 0x00000000, 0x04000000, 0x00000000]);
        public static const FOLLOW_NAMESPACE_in_defaultXMLNamespaceStatement3404:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_defaultXMLNamespaceStatement3406:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_defaultXMLNamespaceStatement3408:BitSet = new BitSet([0x00000000, 0x00000000, 0x00006000, 0x00000000]);
        public static const FOLLOW_semi_in_defaultXMLNamespaceStatement3410:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_COLON_in_typeExpression3444:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_typeExpression3446:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_qualifiedName_in_type3474:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_VOID_in_type3478:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STAR_in_type3482:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_standardQualifiedName_in_qualifiedName3514:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0x00000000]);
        public static const FOLLOW_typePostfixSyntax_in_qualifiedName3518:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_typeSpecifier_in_standardQualifiedName3533:BitSet = new BitSet([0x00000002, 0x00000000, 0x10000000, 0x00000000]);
        public static const FOLLOW_DOT_in_standardQualifiedName3537:BitSet = new BitSet([0x00000000, 0x00000000, 0xC4008000, 0x10083063]);
        public static const FOLLOW_typeSpecifier_in_standardQualifiedName3540:BitSet = new BitSet([0x00000002, 0x00000000, 0x10000000, 0x00000000]);
        public static const FOLLOW_IDENT_in_typeSpecifier3553:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_notQuiteReservedWord_in_typeSpecifier3557:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_INTERNAL_in_typeSpecifier3561:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DEFAULT_in_typeSpecifier3565:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_namespaceName3580:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_reservedNamespace_in_namespaceName3584:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_reservedNamespace0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_POST_in_typePostfixSyntax3621:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063]);
        public static const FOLLOW_standardQualifiedName_in_typePostfixSyntax3625:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000030, 0x00000000]);
        public static const FOLLOW_STAR_in_typePostfixSyntax3629:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000030, 0x00000000]);
        public static const FOLLOW_typePostfixSyntax_in_typePostfixSyntax3635:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_typePostfixSyntax3640:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_ident3670:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_USE_in_ident3677:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlKeyword_in_ident3687:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DYNAMIC_in_ident3695:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_NAMESPACE_in_ident3707:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IS_in_ident3719:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_AS_in_ident3731:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GET_in_ident3743:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SET_in_ident3755:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentExpression_in_expression3787:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentExpression_in_expressionList3799:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_COMMA_in_expressionList3803:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_expressionList3805:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_conditionalExpression_in_assignmentExpression3829:BitSet = new BitSet([0x00000002, 0x00000000, 0x20400000, 0x00000000, 0x0003FF20, 0x00000000]);
        public static const FOLLOW_assignmentOperator_in_assignmentExpression3844:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_assignmentExpression3847:BitSet = new BitSet([0x00000002, 0x00000000, 0x20400000, 0x00000000, 0x0003FF20, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_assignmentOperator3869:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STAR_in_assignmentOperator3884:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_assignmentOperator3886:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DIV_ASSIGN_in_assignmentOperator3897:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_MOD_ASSIGN_in_assignmentOperator3902:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_PLUS_ASSIGN_in_assignmentOperator3907:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_MINUS_ASSIGN_in_assignmentOperator3912:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SL_ASSIGN_in_assignmentOperator3917:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_assignmentOperator3935:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_assignmentOperator3937:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_assignmentOperator3939:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_assignmentOperator3965:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_assignmentOperator3967:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_assignmentOperator3969:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_assignmentOperator3971:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_BAND_ASSIGN_in_assignmentOperator3983:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_BXOR_ASSIGN_in_assignmentOperator3988:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_BOR_ASSIGN_in_assignmentOperator3993:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LAND_ASSIGN_in_assignmentOperator3998:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LOR_ASSIGN_in_assignmentOperator4003:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_logicalOrExpression_in_conditionalExpression4018:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00040000, 0x00000000]);
        public static const FOLLOW_QUESTION_in_conditionalExpression4033:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_conditionalSubExpression_in_conditionalExpression4035:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentExpression_in_conditionalSubExpression4068:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_COLON_in_conditionalSubExpression4070:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_conditionalSubExpression4073:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_logicalAndExpression_in_logicalOrExpression4086:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_logicalOrOperator_in_logicalOrExpression4094:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_logicalAndExpression_in_logicalOrExpression4097:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_LOR_in_logicalOrOperator4114:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_bitwiseOrExpression_in_logicalAndExpression4126:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_logicalAndOperator_in_logicalAndExpression4134:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_bitwiseOrExpression_in_logicalAndExpression4137:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_LAND_in_logicalAndOperator4153:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_bitwiseXorExpression_in_bitwiseOrExpression4166:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_BOR_in_bitwiseOrExpression4174:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_bitwiseXorExpression_in_bitwiseOrExpression4177:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_bitwiseAndExpression_in_bitwiseXorExpression4195:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_BXOR_in_bitwiseXorExpression4203:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_bitwiseAndExpression_in_bitwiseXorExpression4206:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_equalityExpression_in_bitwiseAndExpression4224:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00800000, 0x00000000]);
        public static const FOLLOW_BAND_in_bitwiseAndExpression4232:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_equalityExpression_in_bitwiseAndExpression4235:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00800000, 0x00000000]);
        public static const FOLLOW_relationalExpression_in_equalityExpression4252:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x0F000000, 0x00000000]);
        public static const FOLLOW_equalityOperator_in_equalityExpression4260:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_relationalExpression_in_equalityExpression4263:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x0F000000, 0x00000000]);
        public static const FOLLOW_set_in_equalityOperator0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_shiftExpression_in_relationalExpression4310:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00100000, 0x700000E0, 0x00000000]);
        public static const FOLLOW_relationalOperator_in_relationalExpression4323:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_shiftExpression_in_relationalExpression4326:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00100000, 0x700000E0, 0x00000000]);
        public static const FOLLOW_GT_in_relationalOperator4353:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_relationalOperator4375:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_relationalOperator4377:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IN_in_relationalOperator4392:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LT_in_relationalOperator4396:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LE_in_relationalOperator4400:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IS_in_relationalOperator4404:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_AS_in_relationalOperator4408:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_INSTANCEOF_in_relationalOperator4412:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_additiveExpression_in_shiftExpression4426:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x80000020, 0x00000000]);
        public static const FOLLOW_shiftOperator_in_shiftExpression4434:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_additiveExpression_in_shiftExpression4437:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x80000020, 0x00000000]);
        public static const FOLLOW_SL_in_shiftOperator4454:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_shiftOperator4469:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_shiftOperator4471:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_shiftOperator4495:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_shiftOperator4497:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_shiftOperator4499:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_multiplicativeExpression_in_additiveExpression4517:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000003]);
        public static const FOLLOW_additiveOperator_in_additiveExpression4525:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_multiplicativeExpression_in_additiveExpression4528:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000003]);
        public static const FOLLOW_set_in_additiveOperator0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_unaryExpression_in_multiplicativeExpression4563:BitSet = new BitSet([0x00000002, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x0000000C]);
        public static const FOLLOW_multiplicativeOperator_in_multiplicativeExpression4572:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_multiplicativeExpression4575:BitSet = new BitSet([0x00000002, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x0000000C]);
        public static const FOLLOW_STAR_in_multiplicativeOperator4594:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DIV_in_multiplicativeOperator4604:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_MOD_in_multiplicativeOperator4609:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_INC_in_unaryExpression4628:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpression4630:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DEC_in_unaryExpression4648:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpression4650:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_MINUS_in_unaryExpression4666:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpression4668:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_PLUS_in_unaryExpression4683:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpression4685:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_unaryExpressionNotPlusMinus_in_unaryExpression4700:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DELETE_in_unaryExpressionNotPlusMinus4712:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_postfixExpression_in_unaryExpressionNotPlusMinus4714:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_VOID_in_unaryExpressionNotPlusMinus4729:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4731:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_TYPEOF_in_unaryExpressionNotPlusMinus4746:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4748:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LNOT_in_unaryExpressionNotPlusMinus4763:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4765:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_BNOT_in_unaryExpressionNotPlusMinus4780:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_unaryExpression_in_unaryExpressionNotPlusMinus4782:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_postfixExpression_in_unaryExpressionNotPlusMinus4797:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_leftHandSideExpression_in_postfixExpression4808:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000030]);
        public static const FOLLOW_postfixOperator_in_postfixExpression4812:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_INC_in_postfixOperator4829:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_DEC_in_postfixOperator4845:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_memberExpression_in_leftHandSideExpression4870:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_argumentList_in_leftHandSideExpression4887:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_LBRACK_in_leftHandSideExpression4912:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_leftHandSideExpression4914:BitSet = new BitSet([0x00000000, 0x00000000, 0x00040000, 0x00000000]);
        public static const FOLLOW_RBRACK_in_leftHandSideExpression4918:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_DOT_in_leftHandSideExpression4941:BitSet = new BitSet([0x00000000, 0x00000000, 0x00008000, 0x00000000]);
        public static const FOLLOW_eitherIdentifier_in_leftHandSideExpression4943:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_typePostfixSyntax_in_leftHandSideExpression4966:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_DOT_in_leftHandSideExpression4986:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_LPAREN_in_leftHandSideExpression4988:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_leftHandSideExpression4990:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_leftHandSideExpression4992:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_DBL_COLON_in_leftHandSideExpression5011:BitSet = new BitSet([0x00000000, 0x00000000, 0x00008000, 0x00000000]);
        public static const FOLLOW_eitherIdentifier_in_leftHandSideExpression5013:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_DOT_in_leftHandSideExpression5032:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083062, 0x00000000, 0x02FFB800]);
        public static const FOLLOW_e4xAttributeIdentifier_in_leftHandSideExpression5034:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_E4X_DESC_in_leftHandSideExpression5053:BitSet = new BitSet([0x00000000, 0x00000000, 0xE50A9000, 0x00083062, 0x00000000, 0x02FFB800]);
        public static const FOLLOW_e4xExpression_in_leftHandSideExpression5055:BitSet = new BitSet([0x00000002, 0x00000000, 0x100B0000, 0x00000000, 0x00000010, 0x00000400]);
        public static const FOLLOW_IDENT_in_eitherIdentifier5086:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_primaryExpression_in_memberExpression5099:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_functionExpression_in_memberExpression5104:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_newExpression_in_memberExpression5109:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_primaryExpressionHelper_in_primaryExpression5120:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_UNDEFINED_in_primaryExpressionHelper5131:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_THIS_in_primaryExpressionHelper5136:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_SUPER_in_primaryExpressionHelper5141:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_identiferLiteral_in_primaryExpressionHelper5146:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_constant_in_primaryExpressionHelper5151:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_arrayLiteral_in_primaryExpressionHelper5156:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_objectLiteral_in_primaryExpressionHelper5161:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_encapsulatedExpression_in_primaryExpressionHelper5166:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_e4xAttributeIdentifier_in_primaryExpressionHelper5171:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_NEW_in_newExpression5183:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083062, 0x00000000, 0x02FFB800]);
        public static const FOLLOW_primaryExpression_in_newExpression5186:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_identiferLiteral5202:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_notQuiteReservedWord_in_identiferLiteral5208:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_NULL_in_constant5224:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FALSE_in_constant5229:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_TRUE_in_constant5234:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_numericLiteral_in_constant5239:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_stringLiteral_in_constant5244:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_XML_LITERAL_in_constant5251:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_REGEXP_LITERAL_in_constant5257:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_numericLiteral0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STRING_LITERAL_in_stringLiteral5300:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACK_in_arrayLiteral5316:BitSet = new BitSet([0x00000000, 0x00000000, 0xC51E9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_elementList_in_arrayLiteral5318:BitSet = new BitSet([0x00000000, 0x00000000, 0x00040000, 0x00000000]);
        public static const FOLLOW_RBRACK_in_arrayLiteral5321:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_COMMA_in_elementList5346:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_nonemptyElementList_in_elementList5352:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentExpression_in_nonemptyElementList5364:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_COMMA_in_nonemptyElementList5368:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_nonemptyElementList5371:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_LBRACE_in_objectLiteral5390:BitSet = new BitSet([0x00000000, 0x00000000, 0xC500A000, 0x00083062, 0x00000000, 0x00F00000]);
        public static const FOLLOW_fieldList_in_objectLiteral5392:BitSet = new BitSet([0x00000000, 0x00000000, 0x00002000, 0x00000000]);
        public static const FOLLOW_RBRACE_in_objectLiteral5395:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_literalField_in_fieldList5420:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_COMMA_in_fieldList5424:BitSet = new BitSet([0x00000002, 0x00000000, 0xC5108000, 0x00083062, 0x00000000, 0x00F00000]);
        public static const FOLLOW_literalField_in_fieldList5427:BitSet = new BitSet([0x00000002, 0x00000000, 0x00100000, 0x00000000]);
        public static const FOLLOW_fieldName_in_literalField5443:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_COLON_in_literalField5445:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_element_in_literalField5447:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_identiferLiteral_in_fieldName5473:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_numericLiteral_in_fieldName5478:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_stringLiteral_in_fieldName5483:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentExpression_in_element5505:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FUNCTION_in_functionExpression5520:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_functionCommon_in_functionExpression5522:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_castExpression5545:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000, 0x00000010, 0x00000000]);
        public static const FOLLOW_typePostfixSyntax_in_castExpression5547:BitSet = new BitSet([0x00000000, 0x00000000, 0x00080000, 0x00000000]);
        public static const FOLLOW_argumentList_in_castExpression5550:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_functionSignature_in_functionCommon5578:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_block_in_functionCommon5580:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_parameterDeclarationList_in_functionSignature5591:BitSet = new BitSet([0x00000002, 0x00000000, 0x00000000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_functionSignature5593:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_parameterDeclarationList5607:BitSet = new BitSet([0x00000000, 0x00000000, 0x46208000, 0x0000B000, 0x000000C0, 0x01000000]);
        public static const FOLLOW_parameterDeclaration_in_parameterDeclarationList5614:BitSet = new BitSet([0x00000000, 0x00000000, 0x00300000, 0x00000000]);
        public static const FOLLOW_COMMA_in_parameterDeclarationList5617:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x0000B000, 0x000000C0, 0x01000000]);
        public static const FOLLOW_parameterDeclaration_in_parameterDeclarationList5619:BitSet = new BitSet([0x00000000, 0x00000000, 0x00300000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_parameterDeclarationList5629:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_basicParameterDeclaration_in_parameterDeclaration5653:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_parameterRestDeclaration_in_parameterDeclaration5659:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_CONST_in_basicParameterDeclaration5670:BitSet = new BitSet([0x00000000, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_basicParameterDeclaration5673:BitSet = new BitSet([0x00000002, 0x00000000, 0x00400000, 0x08000000]);
        public static const FOLLOW_typeExpression_in_basicParameterDeclaration5675:BitSet = new BitSet([0x00000002, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_parameterDefault_in_basicParameterDeclaration5678:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_parameterDefault5724:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_parameterDefault5727:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_REST_in_parameterRestDeclaration5738:BitSet = new BitSet([0x00000002, 0x00000000, 0x46008000, 0x00003000, 0x000000C0, 0x00000000]);
        public static const FOLLOW_ident_in_parameterRestDeclaration5740:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_argumentList5777:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expressionList_in_argumentList5779:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_argumentList5781:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_argumentList5798:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_argumentList5800:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LT_in_vectorInitializer5819:BitSet = new BitSet([0x00000000, 0x00000000, 0xE4008000, 0x10083063, 0x00000008, 0x00000000]);
        public static const FOLLOW_type_in_vectorInitializer5821:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_vectorInitializer5823:BitSet = new BitSet([0x00000000, 0x00000000, 0x00020000, 0x00000000]);
        public static const FOLLOW_arrayLiteral_in_vectorInitializer5825:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_encapsulatedExpression5865:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_assignmentExpression_in_encapsulatedExpression5867:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_encapsulatedExpression5869:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STAR_in_e4xExpression5892:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_e4xAttributeIdentifier_in_e4xExpression5897:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_e4xFilterPredicate_in_e4xExpression5902:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_eitherIdentifier_in_e4xExpression5907:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_E4X_ATTRI_in_e4xAttributeIdentifier5918:BitSet = new BitSet([0x00000000, 0x00000000, 0x20028000, 0x00000000]);
        public static const FOLLOW_eitherIdentifier_in_e4xAttributeIdentifier5927:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STAR_in_e4xAttributeIdentifier5933:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACK_in_e4xAttributeIdentifier5939:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_e4xAttributeIdentifier5941:BitSet = new BitSet([0x00000000, 0x00000000, 0x00040000, 0x00000000]);
        public static const FOLLOW_RBRACK_in_e4xAttributeIdentifier5943:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LPAREN_in_e4xFilterPredicate5958:BitSet = new BitSet([0x00000000, 0x00000000, 0xC50A9000, 0x00083862, 0x00000008, 0x02FFFBF3]);
        public static const FOLLOW_expression_in_e4xFilterPredicate5960:BitSet = new BitSet([0x00000000, 0x00000000, 0x00200000, 0x00000000]);
        public static const FOLLOW_RPAREN_in_e4xFilterPredicate5962:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_IDENT_in_xmlKeyword5975:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_notQuiteReservedWord0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_reservedWord_in_allKeywords6033:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_notQuiteReservedWord_in_allKeywords6037:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_reservedWord6051:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ident_in_synpred1_AS3875:BitSet = new BitSet([0x00000000, 0x00000000, 0x10000000, 0x00000000]);
        public static const FOLLOW_DOT_in_synpred1_AS3877:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configIdent_in_synpred3_AS31511:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred3_AS31513:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred4_AS31526:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_configIdent_in_synpred5_AS31655:BitSet = new BitSet([0x00000000, 0x00000000, 0x00001000, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred5_AS31657:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred6_AS31670:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_FOR_in_synpred7_AS32234:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00080000]);
        public static const FOLLOW_EACH_in_synpred7_AS32236:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ELSE_in_synpred8_AS32562:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_forInClauseDecl_in_synpred9_AS32693:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00100000]);
        public static const FOLLOW_IN_in_synpred9_AS32695:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_assignmentOperator_in_synpred10_AS33834:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STAR_in_synpred11_AS33878:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_synpred11_AS33880:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred12_AS33927:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred12_AS33929:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_synpred12_AS33931:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred13_AS33955:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred13_AS33957:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred13_AS33959:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_synpred13_AS33961:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_relationalOperator_in_synpred14_AS34317:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred15_AS34349:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred16_AS34369:BitSet = new BitSet([0x00000000, 0x00000000, 0x00400000, 0x00000000]);
        public static const FOLLOW_ASSIGN_in_synpred16_AS34371:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred17_AS34463:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred17_AS34465:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_GT_in_synpred18_AS34487:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred18_AS34489:BitSet = new BitSet([0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000]);
        public static const FOLLOW_GT_in_synpred18_AS34491:BitSet = new BitSet([0x00000002, 0x00000000]);

    }
}