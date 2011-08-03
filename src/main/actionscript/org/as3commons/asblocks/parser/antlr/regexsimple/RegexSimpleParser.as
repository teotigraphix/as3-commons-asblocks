// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g 2011-06-21 08:22:08
package org.as3commons.asblocks.parser.antlr.regexsimple {

    import org.as3commons.asblocks.parser.antlr.LinkedListToken;
    import org.as3commons.asblocks.parser.antlr.LinkedListTree;

    import org.antlr.runtime.*;
        

    import org.antlr.runtime.tree.*;


    /**
     * Provides a simple scanner that can recognose the extent of a regular
     * expression within the surrounding actionscript program, without parsing
     * it 'fully'.  This should be the simplest possible handling that
     * will allow the 'outer' actionscript grammar to find the end of the
     * regular expression literal, anc continue parsing the rest of the code.
     */
    public class RegexSimpleParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "REGEXP_LITERAL", "REGEXP_BODY", "REGEXP_FLAGS", "REGEXP_DELIMITER", "REGEXP_CHAR", "REGEXP_FLAG", "CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE", "NULL_ESCAPE", "ORDINARY_REGEXP_CHAR", "ESC", "NON_TERMINATOR", "TERMINATOR", "CONTINUING_IDENTIFIER_CHAR", "HEX_ESCAPE", "UNICODE_ALPHANUMERIC", "HEX_DIGIT"
        ];
        public static const EOF:int=-1;
        public static const REGEXP_LITERAL:int=4;
        public static const REGEXP_BODY:int=5;
        public static const REGEXP_FLAGS:int=6;
        public static const REGEXP_DELIMITER:int=7;
        public static const REGEXP_CHAR:int=8;
        public static const REGEXP_FLAG:int=9;
        public static const CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE:int=10;
        public static const NULL_ESCAPE:int=11;
        public static const ORDINARY_REGEXP_CHAR:int=12;
        public static const ESC:int=13;
        public static const NON_TERMINATOR:int=14;
        public static const TERMINATOR:int=15;
        public static const CONTINUING_IDENTIFIER_CHAR:int=16;
        public static const HEX_ESCAPE:int=17;
        public static const UNICODE_ALPHANUMERIC:int=18;
        public static const HEX_DIGIT:int=19;

        // delegates
        // delegators


            public function RegexSimpleParser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);
            }
            
        protected var adaptor:TreeAdaptor = new CommonTreeAdaptor();

        override public function set treeAdaptor(adaptor:TreeAdaptor):void {
            this.adaptor = adaptor;
        }
        override public function get treeAdaptor():TreeAdaptor {
            return adaptor;
        }

        public override function get tokenNames():Array { return RegexSimpleParser.tokenNames; }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g"; }


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


        // $ANTLR start regexpLiteral
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:89:1: regexpLiteral : s= REGEXP_DELIMITER regexpBody REGEXP_DELIMITER ( regexpFlags )? -> ^( REGEXP_LITERAL[$s] regexpBody ( regexpFlags )? ) ;
        public final function regexpLiteral():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var s:Token=null;
            var REGEXP_DELIMITER2:Token=null;
            var regexpBody1:ParserRuleReturnScope = null;

            var regexpFlags3:ParserRuleReturnScope = null;


            var s_tree:LinkedListTree=null;
            var REGEXP_DELIMITER2_tree:LinkedListTree=null;
            var stream_REGEXP_DELIMITER:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token REGEXP_DELIMITER");
            var stream_regexpBody:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule regexpBody");
            var stream_regexpFlags:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule regexpFlags");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:90:2: (s= REGEXP_DELIMITER regexpBody REGEXP_DELIMITER ( regexpFlags )? -> ^( REGEXP_LITERAL[$s] regexpBody ( regexpFlags )? ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:90:4: s= REGEXP_DELIMITER regexpBody REGEXP_DELIMITER ( regexpFlags )?
                {
                s=Token(matchStream(input,REGEXP_DELIMITER,FOLLOW_REGEXP_DELIMITER_in_regexpLiteral111));  
                stream_REGEXP_DELIMITER.add(s);

                pushFollow(FOLLOW_regexpBody_in_regexpLiteral113);
                regexpBody1=regexpBody();

                state._fsp = state._fsp - 1;

                stream_regexpBody.add(regexpBody1.tree);
                REGEXP_DELIMITER2=Token(matchStream(input,REGEXP_DELIMITER,FOLLOW_REGEXP_DELIMITER_in_regexpLiteral115));  
                stream_REGEXP_DELIMITER.add(REGEXP_DELIMITER2);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:91:3: ( regexpFlags )?
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( (LA1_0==9) ) {
                    alt1=1;
                }
                switch (alt1) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:91:3: regexpFlags
                        {
                        pushFollow(FOLLOW_regexpFlags_in_regexpLiteral119);
                        regexpFlags3=regexpFlags();

                        state._fsp = state._fsp - 1;

                        stream_regexpFlags.add(regexpFlags3.tree);

                        }
                        break;

                }



                // AST REWRITE
                // elements: regexpBody, regexpFlags
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 92:3: -> ^( REGEXP_LITERAL[$s] regexpBody ( regexpFlags )? )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:92:6: ^( REGEXP_LITERAL[$s] regexpBody ( regexpFlags )? )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(REGEXP_LITERAL, s)), root_1));

                    adaptor.addChild(root_1, stream_regexpBody.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:92:38: ( regexpFlags )?
                    if ( stream_regexpFlags.hasNext ) {
                        adaptor.addChild(root_1, stream_regexpFlags.nextTree());

                    }
                    stream_regexpFlags.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;
                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end regexpLiteral

        // $ANTLR start regexpBody
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:95:1: regexpBody : ( bodyChar )+ -> ^( REGEXP_BODY ( bodyChar )+ ) ;
        public final function regexpBody():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var bodyChar4:ParserRuleReturnScope = null;


            var stream_bodyChar:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule bodyChar");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:96:2: ( ( bodyChar )+ -> ^( REGEXP_BODY ( bodyChar )+ ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:96:4: ( bodyChar )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:96:4: ( bodyChar )+
                var cnt2:int=0;
                loop2:
                do {
                    var alt2:int=2;
                    var LA2_0:int = input.LA(1);

                    if ( ((LA2_0>=8 && LA2_0<=9)) ) {
                        alt2=1;
                    }


                    switch (alt2) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:96:4: bodyChar
                	    {
                	    pushFollow(FOLLOW_bodyChar_in_regexpBody145);
                	    bodyChar4=bodyChar();

                	    state._fsp = state._fsp - 1;

                	    stream_bodyChar.add(bodyChar4.tree);

                	    }
                	    break;

                	default :
                	    if ( cnt2 >= 1 ) break loop2;
                            throw new EarlyExitException(2, input);

                    }
                    cnt2++;
                } while (true);



                // AST REWRITE
                // elements: bodyChar
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 97:3: -> ^( REGEXP_BODY ( bodyChar )+ )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:97:6: ^( REGEXP_BODY ( bodyChar )+ )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(REGEXP_BODY, "REGEXP_BODY")), root_1));

                    if ( !(stream_bodyChar.hasNext) ) {
                        throw new RewriteEarlyExitException();
                    }
                    while ( stream_bodyChar.hasNext ) {
                        adaptor.addChild(root_1, stream_bodyChar.nextTree());

                    }
                    stream_bodyChar.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;
                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end regexpBody

        // $ANTLR start bodyChar
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:100:1: bodyChar : ( REGEXP_CHAR | REGEXP_FLAG );
        public final function bodyChar():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set5:Token=null;

            var set5_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:101:2: ( REGEXP_CHAR | REGEXP_FLAG )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set5=Token(input.LT(1));
                if ( (input.LA(1)>=8 && input.LA(1)<=9) ) {
                    input.consume();
                    adaptor.addChild(root_0, LinkedListTree(adaptor.create(set5)));
                    this.state.errorRecovery=false;
                }
                else {
                    throw new MismatchedSetException(null,input);
                }


                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end bodyChar

        // $ANTLR start regexpFlags
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:104:1: regexpFlags : ( REGEXP_FLAG )+ -> ^( REGEXP_FLAGS ( REGEXP_FLAG )+ ) ;
        public final function regexpFlags():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var REGEXP_FLAG6:Token=null;

            var REGEXP_FLAG6_tree:LinkedListTree=null;
            var stream_REGEXP_FLAG:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token REGEXP_FLAG");

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:105:2: ( ( REGEXP_FLAG )+ -> ^( REGEXP_FLAGS ( REGEXP_FLAG )+ ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:105:4: ( REGEXP_FLAG )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:105:4: ( REGEXP_FLAG )+
                var cnt3:int=0;
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( (LA3_0==9) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:105:4: REGEXP_FLAG
                	    {
                	    REGEXP_FLAG6=Token(matchStream(input,REGEXP_FLAG,FOLLOW_REGEXP_FLAG_in_regexpFlags183));  
                	    stream_REGEXP_FLAG.add(REGEXP_FLAG6);


                	    }
                	    break;

                	default :
                	    if ( cnt3 >= 1 ) break loop3;
                            throw new EarlyExitException(3, input);

                    }
                    cnt3++;
                } while (true);



                // AST REWRITE
                // elements: REGEXP_FLAG
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 106:3: -> ^( REGEXP_FLAGS ( REGEXP_FLAG )+ )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:106:6: ^( REGEXP_FLAGS ( REGEXP_FLAG )+ )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(REGEXP_FLAGS, "REGEXP_FLAGS")), root_1));

                    if ( !(stream_REGEXP_FLAG.hasNext) ) {
                        throw new RewriteEarlyExitException();
                    }
                    while ( stream_REGEXP_FLAG.hasNext ) {
                        adaptor.addChild(root_1, stream_REGEXP_FLAG.nextNode());

                    }
                    stream_REGEXP_FLAG.reset();

                    adaptor.addChild(root_0, root_1);
                    }

                }

                retval.tree = root_0;
                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end regexpFlags


           // Delegated rules


     

        public static const FOLLOW_REGEXP_DELIMITER_in_regexpLiteral111:BitSet = new BitSet([0x00000300, 0x00000000]);
        public static const FOLLOW_regexpBody_in_regexpLiteral113:BitSet = new BitSet([0x00000080, 0x00000000]);
        public static const FOLLOW_REGEXP_DELIMITER_in_regexpLiteral115:BitSet = new BitSet([0x00000202, 0x00000000]);
        public static const FOLLOW_regexpFlags_in_regexpLiteral119:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_bodyChar_in_regexpBody145:BitSet = new BitSet([0x00000302, 0x00000000]);
        public static const FOLLOW_set_in_bodyChar0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_REGEXP_FLAG_in_regexpFlags183:BitSet = new BitSet([0x00000202, 0x00000000]);

    }
}