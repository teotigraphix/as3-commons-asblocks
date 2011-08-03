// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g 2011-07-31 13:46:42
package org.as3commons.asblocks.parser.antlr.asdoc {

    import org.as3commons.asblocks.parser.antlr.LinkedListToken;
    import org.as3commons.asblocks.parser.antlr.LinkedListTree;
    import org.antlr.runtime.MismatchedTokenException;
    import org.as3commons.asblocks.impl.TokenBuilder;

    import org.antlr.runtime.*;
        

    import org.antlr.runtime.tree.*;


    public class ASDocParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ASDOC", "INLINE_TAG", "DESCRIPTION", "PARA_TAG", "TEXT_LINE", "VIRTUAL_WS", "NL", "WORD", "STARS", "WS", "LBRACE", "RBRACE", "AT", "ATWORD", "WORD_TAIL"
        ];
        public static const EOF:int=-1;
        public static const ASDOC:int=4;
        public static const INLINE_TAG:int=5;
        public static const DESCRIPTION:int=6;
        public static const PARA_TAG:int=7;
        public static const TEXT_LINE:int=8;
        public static const VIRTUAL_WS:int=9;
        public static const NL:int=10;
        public static const WORD:int=11;
        public static const STARS:int=12;
        public static const WS:int=13;
        public static const LBRACE:int=14;
        public static const RBRACE:int=15;
        public static const AT:int=16;
        public static const ATWORD:int=17;
        public static const WORD_TAIL:int=18;

        // delegates
        // delegators


            public function ASDocParser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);

                dfa2 = new DFA(this, 2,
                            "()* loopback of 91:4: ( textLine )*",
                            DFA2_eot, DFA2_eof, DFA2_min,
                            DFA2_max, DFA2_accept, DFA2_special,
                            DFA2_transition);

                dfa3 = new DFA(this, 3,
                            "()* loopback of 97:3: ( textLineContent )*",
                            DFA3_eot, DFA3_eof, DFA3_min,
                            DFA3_max, DFA3_accept, DFA3_special,
                            DFA3_transition);

                dfa6 = new DFA(this, 6,
                            "102:1: textLineStart : ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT );",
                            DFA6_eot, DFA6_eof, DFA6_min,
                            DFA6_max, DFA6_accept, DFA6_special,
                            DFA6_transition, DFA6_specialStateTransition);

                dfa7 = new DFA(this, 7,
                            "107:1: textLineContent : ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT | ATWORD );",
                            DFA7_eot, DFA7_eof, DFA7_min,
                            DFA7_max, DFA7_accept, DFA7_special,
                            DFA7_transition, DFA7_specialStateTransition);

                dfa9 = new DFA(this, 9,
                            "()* loopback of 127:4: ( textLineContent )*",
                            DFA9_eot, DFA9_eof, DFA9_min,
                            DFA9_max, DFA9_accept, DFA9_special,
                            DFA9_transition);

                dfa10 = new DFA(this, 10,
                            "()* loopback of 128:8: ( textLine )*",
                            DFA10_eot, DFA10_eof, DFA10_min,
                            DFA10_max, DFA10_accept, DFA10_special,
                            DFA10_transition);

            }
            
        protected var adaptor:TreeAdaptor = new CommonTreeAdaptor();

        override public function set treeAdaptor(adaptor:TreeAdaptor):void {
            this.adaptor = adaptor;
        }
        override public function get treeAdaptor():TreeAdaptor {
            return adaptor;
        }

        public override function get tokenNames():Array { return ASDocParser.tokenNames; }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g"; }


        	//protected void mismatch(IntStream input, int ttype, BitSet follow)
        	//	throws RecognitionException
        	//{
        	//	throw new MismatchedTokenException(ttype, input);
        	//}

        	private function placeholder(imaginary:LinkedListTree):void {
        		
        		if (imaginary.childCount > 0)
        			return;

        		var tok:LinkedListToken = LinkedListToken(input.LT(1));
        		var placeholder:LinkedListToken = TokenBuilder.newPlaceholder(imaginary);
        		tok.prependToken(placeholder);
        	}



        // $ANTLR start commentBody
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:82:1: commentBody : d= description ( paragraphTag )* EOF -> ^( ASDOC description ( paragraphTag )* ) ;
        public final function commentBody():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var EOF2:Token=null;
            var d:ParserRuleReturnScope = null;

            var paragraphTag1:ParserRuleReturnScope = null;


            var EOF2_tree:LinkedListTree=null;
            var stream_EOF:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token EOF");
            var stream_paragraphTag:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule paragraphTag");
            var stream_description:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule description");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:83:2: (d= description ( paragraphTag )* EOF -> ^( ASDOC description ( paragraphTag )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:83:4: d= description ( paragraphTag )* EOF
                {
                pushFollow(FOLLOW_description_in_commentBody137);
                d=description();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_description.add(d.tree);
                if ( this.state.backtracking==0 ) {
                  placeholder((d!=null?LinkedListTree(d.tree):null));
                }
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:84:3: ( paragraphTag )*
                loop1:
                do {
                    var alt1:int=2;
                    var LA1_0:int = input.LA(1);

                    if ( (LA1_0==17) ) {
                        alt1=1;
                    }


                    switch (alt1) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:84:3: paragraphTag
                	    {
                	    pushFollow(FOLLOW_paragraphTag_in_commentBody143);
                	    paragraphTag1=paragraphTag();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_paragraphTag.add(paragraphTag1.tree);

                	    }
                	    break;

                	default :
                	    break loop1;
                    }
                } while (true);

                EOF2=Token(matchStream(input,EOF,FOLLOW_EOF_in_commentBody148)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_EOF.add(EOF2);



                // AST REWRITE
                // elements: description, paragraphTag
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 86:3: -> ^( ASDOC description ( paragraphTag )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:86:6: ^( ASDOC description ( paragraphTag )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(ASDOC, "ASDOC")), root_1));

                    adaptor.addChild(root_1, stream_description.nextTree());
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:86:26: ( paragraphTag )*
                    while ( stream_paragraphTag.hasNext ) {
                        adaptor.addChild(root_1, stream_paragraphTag.nextTree());

                    }
                    stream_paragraphTag.reset();

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
        // $ANTLR end commentBody

        // $ANTLR start description
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:90:1: description : ( textLine )* -> ^( DESCRIPTION ( textLine )* ) ;
        public final function description():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var textLine3:ParserRuleReturnScope = null;


            var stream_textLine:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule textLine");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:91:2: ( ( textLine )* -> ^( DESCRIPTION ( textLine )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:91:4: ( textLine )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:91:4: ( textLine )*
                loop2:
                do {
                    var alt2:int=2;
                    alt2 = dfa2.predict(input);
                    switch (alt2) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:91:4: textLine
                	    {
                	    pushFollow(FOLLOW_textLine_in_description173);
                	    textLine3=textLine();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_textLine.add(textLine3.tree);

                	    }
                	    break;

                	default :
                	    break loop2;
                    }
                } while (true);



                // AST REWRITE
                // elements: textLine
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 92:3: -> ^( DESCRIPTION ( textLine )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:92:6: ^( DESCRIPTION ( textLine )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(DESCRIPTION, "DESCRIPTION")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:92:20: ( textLine )*
                    while ( stream_textLine.hasNext ) {
                        adaptor.addChild(root_1, stream_textLine.nextTree());

                    }
                    stream_textLine.reset();

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
        // $ANTLR end description

        // $ANTLR start textLine
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:95:1: textLine : ( textLineStart ( textLineContent )* ( NL | EOF ) | NL );
        public final function textLine():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var NL6:Token=null;
            var EOF7:Token=null;
            var NL8:Token=null;
            var textLineStart4:ParserRuleReturnScope = null;

            var textLineContent5:ParserRuleReturnScope = null;


            var NL6_tree:LinkedListTree=null;
            var EOF7_tree:LinkedListTree=null;
            var NL8_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:96:2: ( textLineStart ( textLineContent )* ( NL | EOF ) | NL )
                var alt5:int=2;
                var LA5_0:int = input.LA(1);

                if ( ((LA5_0>=11 && LA5_0<=16)) ) {
                    alt5=1;
                }
                else if ( (LA5_0==10) ) {
                    alt5=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 5, 0, input);

                }
                switch (alt5) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:96:4: textLineStart ( textLineContent )* ( NL | EOF )
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_textLineStart_in_textLine196);
                        textLineStart4=textLineStart();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, textLineStart4.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:97:3: ( textLineContent )*
                        loop3:
                        do {
                            var alt3:int=2;
                            alt3 = dfa3.predict(input);
                            switch (alt3) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:97:3: textLineContent
                        	    {
                        	    pushFollow(FOLLOW_textLineContent_in_textLine200);
                        	    textLineContent5=textLineContent();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, textLineContent5.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop3;
                            }
                        } while (true);

                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:98:3: ( NL | EOF )
                        var alt4:int=2;
                        var LA4_0:int = input.LA(1);

                        if ( (LA4_0==10) ) {
                            alt4=1;
                        }
                        else if ( (LA4_0==-1) ) {
                            alt4=2;
                        }
                        else {
                            if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                            throw new NoViableAltException("", 4, 0, input);

                        }
                        switch (alt4) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:98:4: NL
                                {
                                NL6=Token(matchStream(input,NL,FOLLOW_NL_in_textLine206)); if (this.state.failed) return retval;
                                if ( this.state.backtracking==0 ) {
                                NL6_tree = LinkedListTree(adaptor.create(NL6));
                                adaptor.addChild(root_0, NL6_tree);
                                }

                                }
                                break;
                            case 2 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:98:9: EOF
                                {
                                EOF7=Token(matchStream(input,EOF,FOLLOW_EOF_in_textLine210)); if (this.state.failed) return retval;

                                }
                                break;

                        }


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:99:4: NL
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        NL8=Token(matchStream(input,NL,FOLLOW_NL_in_textLine217)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        NL8_tree = LinkedListTree(adaptor.create(NL8));
                        adaptor.addChild(root_0, NL8_tree);
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
        // $ANTLR end textLine

        // $ANTLR start textLineStart
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:102:1: textLineStart : ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT );
        public final function textLineStart():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var WORD10:Token=null;
            var STARS11:Token=null;
            var WS12:Token=null;
            var LBRACE13:Token=null;
            var RBRACE14:Token=null;
            var AT15:Token=null;
            var inlineTag9:ParserRuleReturnScope = null;


            var WORD10_tree:LinkedListTree=null;
            var STARS11_tree:LinkedListTree=null;
            var WS12_tree:LinkedListTree=null;
            var LBRACE13_tree:LinkedListTree=null;
            var RBRACE14_tree:LinkedListTree=null;
            var AT15_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:103:2: ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT )
                var alt6:int=7;
                alt6 = dfa6.predict(input);
                switch (alt6) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:103:4: ( LBRACE ATWORD )=> inlineTag
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_inlineTag_in_textLineStart235);
                        inlineTag9=inlineTag();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, inlineTag9.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:4: WORD
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        WORD10=Token(matchStream(input,WORD,FOLLOW_WORD_in_textLineStart240)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        WORD10_tree = LinkedListTree(adaptor.create(WORD10));
                        adaptor.addChild(root_0, WORD10_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:11: STARS
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        STARS11=Token(matchStream(input,STARS,FOLLOW_STARS_in_textLineStart244)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        STARS11_tree = LinkedListTree(adaptor.create(STARS11));
                        adaptor.addChild(root_0, STARS11_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:19: WS
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        WS12=Token(matchStream(input,WS,FOLLOW_WS_in_textLineStart248)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        WS12_tree = LinkedListTree(adaptor.create(WS12));
                        adaptor.addChild(root_0, WS12_tree);
                        }

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:24: LBRACE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        LBRACE13=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_textLineStart252)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        LBRACE13_tree = LinkedListTree(adaptor.create(LBRACE13));
                        adaptor.addChild(root_0, LBRACE13_tree);
                        }

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:33: RBRACE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        RBRACE14=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_textLineStart256)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        RBRACE14_tree = LinkedListTree(adaptor.create(RBRACE14));
                        adaptor.addChild(root_0, RBRACE14_tree);
                        }

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:104:42: AT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        AT15=Token(matchStream(input,AT,FOLLOW_AT_in_textLineStart260)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        AT15_tree = LinkedListTree(adaptor.create(AT15));
                        adaptor.addChild(root_0, AT15_tree);
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
        // $ANTLR end textLineStart

        // $ANTLR start textLineContent
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:107:1: textLineContent : ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT | ATWORD );
        public final function textLineContent():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var WORD17:Token=null;
            var STARS18:Token=null;
            var WS19:Token=null;
            var LBRACE20:Token=null;
            var RBRACE21:Token=null;
            var AT22:Token=null;
            var ATWORD23:Token=null;
            var inlineTag16:ParserRuleReturnScope = null;


            var WORD17_tree:LinkedListTree=null;
            var STARS18_tree:LinkedListTree=null;
            var WS19_tree:LinkedListTree=null;
            var LBRACE20_tree:LinkedListTree=null;
            var RBRACE21_tree:LinkedListTree=null;
            var AT22_tree:LinkedListTree=null;
            var ATWORD23_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:108:2: ( ( LBRACE ATWORD )=> inlineTag | WORD | STARS | WS | LBRACE | RBRACE | AT | ATWORD )
                var alt7:int=8;
                alt7 = dfa7.predict(input);
                switch (alt7) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:108:4: ( LBRACE ATWORD )=> inlineTag
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_inlineTag_in_textLineContent278);
                        inlineTag16=inlineTag();

                        state._fsp = state._fsp - 1;
                        if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) adaptor.addChild(root_0, inlineTag16.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:4: WORD
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        WORD17=Token(matchStream(input,WORD,FOLLOW_WORD_in_textLineContent283)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        WORD17_tree = LinkedListTree(adaptor.create(WORD17));
                        adaptor.addChild(root_0, WORD17_tree);
                        }

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:11: STARS
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        STARS18=Token(matchStream(input,STARS,FOLLOW_STARS_in_textLineContent287)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        STARS18_tree = LinkedListTree(adaptor.create(STARS18));
                        adaptor.addChild(root_0, STARS18_tree);
                        }

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:19: WS
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        WS19=Token(matchStream(input,WS,FOLLOW_WS_in_textLineContent291)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        WS19_tree = LinkedListTree(adaptor.create(WS19));
                        adaptor.addChild(root_0, WS19_tree);
                        }

                        }
                        break;
                    case 5 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:24: LBRACE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        LBRACE20=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_textLineContent295)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        LBRACE20_tree = LinkedListTree(adaptor.create(LBRACE20));
                        adaptor.addChild(root_0, LBRACE20_tree);
                        }

                        }
                        break;
                    case 6 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:33: RBRACE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        RBRACE21=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_textLineContent299)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        RBRACE21_tree = LinkedListTree(adaptor.create(RBRACE21));
                        adaptor.addChild(root_0, RBRACE21_tree);
                        }

                        }
                        break;
                    case 7 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:42: AT
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        AT22=Token(matchStream(input,AT,FOLLOW_AT_in_textLineContent303)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        AT22_tree = LinkedListTree(adaptor.create(AT22));
                        adaptor.addChild(root_0, AT22_tree);
                        }

                        }
                        break;
                    case 8 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:109:47: ATWORD
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        ATWORD23=Token(matchStream(input,ATWORD,FOLLOW_ATWORD_in_textLineContent307)); if (this.state.failed) return retval;
                        if ( this.state.backtracking==0 ) {
                        ATWORD23_tree = LinkedListTree(adaptor.create(ATWORD23));
                        adaptor.addChild(root_0, ATWORD23_tree);
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
        // $ANTLR end textLineContent

        // $ANTLR start inlineTag
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:112:1: inlineTag : LBRACE ATWORD ( inlineTagContent )* RBRACE -> ^( INLINE_TAG ATWORD ( inlineTagContent )* ) ;
        public final function inlineTag():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var LBRACE24:Token=null;
            var ATWORD25:Token=null;
            var RBRACE27:Token=null;
            var inlineTagContent26:ParserRuleReturnScope = null;


            var LBRACE24_tree:LinkedListTree=null;
            var ATWORD25_tree:LinkedListTree=null;
            var RBRACE27_tree:LinkedListTree=null;
            var stream_RBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token RBRACE");
            var stream_ATWORD:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ATWORD");
            var stream_LBRACE:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token LBRACE");
            var stream_inlineTagContent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule inlineTagContent");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:113:2: ( LBRACE ATWORD ( inlineTagContent )* RBRACE -> ^( INLINE_TAG ATWORD ( inlineTagContent )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:113:4: LBRACE ATWORD ( inlineTagContent )* RBRACE
                {
                LBRACE24=Token(matchStream(input,LBRACE,FOLLOW_LBRACE_in_inlineTag318)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_LBRACE.add(LBRACE24);

                ATWORD25=Token(matchStream(input,ATWORD,FOLLOW_ATWORD_in_inlineTag320)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_ATWORD.add(ATWORD25);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:113:18: ( inlineTagContent )*
                loop8:
                do {
                    var alt8:int=2;
                    var LA8_0:int = input.LA(1);

                    if ( ((LA8_0>=10 && LA8_0<=13)||LA8_0==16) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:113:18: inlineTagContent
                	    {
                	    pushFollow(FOLLOW_inlineTagContent_in_inlineTag322);
                	    inlineTagContent26=inlineTagContent();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_inlineTagContent.add(inlineTagContent26.tree);

                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);

                RBRACE27=Token(matchStream(input,RBRACE,FOLLOW_RBRACE_in_inlineTag325)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_RBRACE.add(RBRACE27);



                // AST REWRITE
                // elements: inlineTagContent, ATWORD
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 114:3: -> ^( INLINE_TAG ATWORD ( inlineTagContent )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:114:6: ^( INLINE_TAG ATWORD ( inlineTagContent )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(INLINE_TAG, "INLINE_TAG")), root_1));

                    adaptor.addChild(root_1, stream_ATWORD.nextNode());
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:114:26: ( inlineTagContent )*
                    while ( stream_inlineTagContent.hasNext ) {
                        adaptor.addChild(root_1, stream_inlineTagContent.nextTree());

                    }
                    stream_inlineTagContent.reset();

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
        // $ANTLR end inlineTag

        // $ANTLR start inlineTagContent
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:117:1: inlineTagContent : ( WORD | STARS | WS | AT | NL );
        public final function inlineTagContent():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set28:Token=null;

            var set28_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:118:2: ( WORD | STARS | WS | AT | NL )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set28=Token(input.LT(1));
                if ( (input.LA(1)>=10 && input.LA(1)<=13)||input.LA(1)==16 ) {
                    input.consume();
                    if ( this.state.backtracking==0 ) adaptor.addChild(root_0, LinkedListTree(adaptor.create(set28)));
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
        // $ANTLR end inlineTagContent

        // $ANTLR start paragraphTag
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:121:1: paragraphTag : ATWORD paragraphTagTail -> ^( PARA_TAG ATWORD paragraphTagTail ) ;
        public final function paragraphTag():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var ATWORD29:Token=null;
            var paragraphTagTail30:ParserRuleReturnScope = null;


            var ATWORD29_tree:LinkedListTree=null;
            var stream_ATWORD:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token ATWORD");
            var stream_paragraphTagTail:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule paragraphTagTail");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:122:2: ( ATWORD paragraphTagTail -> ^( PARA_TAG ATWORD paragraphTagTail ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:122:4: ATWORD paragraphTagTail
                {
                ATWORD29=Token(matchStream(input,ATWORD,FOLLOW_ATWORD_in_paragraphTag376)); if (this.state.failed) return retval; 
                if ( this.state.backtracking==0 ) stream_ATWORD.add(ATWORD29);

                pushFollow(FOLLOW_paragraphTagTail_in_paragraphTag378);
                paragraphTagTail30=paragraphTagTail();

                state._fsp = state._fsp - 1;
                if (this.state.failed) return retval;
                if ( this.state.backtracking==0 ) stream_paragraphTagTail.add(paragraphTagTail30.tree);


                // AST REWRITE
                // elements: ATWORD, paragraphTagTail
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 123:3: -> ^( PARA_TAG ATWORD paragraphTagTail )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:123:6: ^( PARA_TAG ATWORD paragraphTagTail )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(PARA_TAG, "PARA_TAG")), root_1));

                    adaptor.addChild(root_1, stream_ATWORD.nextNode());
                    adaptor.addChild(root_1, stream_paragraphTagTail.nextTree());

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
        // $ANTLR end paragraphTag

        // $ANTLR start paragraphTagTail
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:126:1: paragraphTagTail : ( textLineContent )* ( NL ( textLine )* | EOF ) -> ( textLineContent )* ( NL )? ( textLine )* ;
        public final function paragraphTagTail():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var NL32:Token=null;
            var EOF34:Token=null;
            var textLineContent31:ParserRuleReturnScope = null;

            var textLine33:ParserRuleReturnScope = null;


            var NL32_tree:LinkedListTree=null;
            var EOF34_tree:LinkedListTree=null;
            var stream_NL:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token NL");
            var stream_EOF:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token EOF");
            var stream_textLineContent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule textLineContent");
            var stream_textLine:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule textLine");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:127:2: ( ( textLineContent )* ( NL ( textLine )* | EOF ) -> ( textLineContent )* ( NL )? ( textLine )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:127:4: ( textLineContent )* ( NL ( textLine )* | EOF )
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:127:4: ( textLineContent )*
                loop9:
                do {
                    var alt9:int=2;
                    alt9 = dfa9.predict(input);
                    switch (alt9) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:127:4: textLineContent
                	    {
                	    pushFollow(FOLLOW_textLineContent_in_paragraphTagTail401);
                	    textLineContent31=textLineContent();

                	    state._fsp = state._fsp - 1;
                	    if (this.state.failed) return retval;
                	    if ( this.state.backtracking==0 ) stream_textLineContent.add(textLineContent31.tree);

                	    }
                	    break;

                	default :
                	    break loop9;
                    }
                } while (true);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:128:3: ( NL ( textLine )* | EOF )
                var alt11:int=2;
                var LA11_0:int = input.LA(1);

                if ( (LA11_0==10) ) {
                    alt11=1;
                }
                else if ( (LA11_0==-1) ) {
                    alt11=2;
                }
                else {
                    if (this.state.backtracking>0) {this.state.failed=true; return retval;}
                    throw new NoViableAltException("", 11, 0, input);

                }
                switch (alt11) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:128:5: NL ( textLine )*
                        {
                        NL32=Token(matchStream(input,NL,FOLLOW_NL_in_paragraphTagTail408)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_NL.add(NL32);

                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:128:8: ( textLine )*
                        loop10:
                        do {
                            var alt10:int=2;
                            alt10 = dfa10.predict(input);
                            switch (alt10) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:128:8: textLine
                        	    {
                        	    pushFollow(FOLLOW_textLine_in_paragraphTagTail410);
                        	    textLine33=textLine();

                        	    state._fsp = state._fsp - 1;
                        	    if (this.state.failed) return retval;
                        	    if ( this.state.backtracking==0 ) stream_textLine.add(textLine33.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop10;
                            }
                        } while (true);


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:129:5: EOF
                        {
                        EOF34=Token(matchStream(input,EOF,FOLLOW_EOF_in_paragraphTagTail417)); if (this.state.failed) return retval; 
                        if ( this.state.backtracking==0 ) stream_EOF.add(EOF34);


                        }
                        break;

                }



                // AST REWRITE
                // elements: textLine, textLineContent, NL
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                if ( this.state.backtracking==0 ) {
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 131:3: -> ( textLineContent )* ( NL )? ( textLine )*
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:131:6: ( textLineContent )*
                    while ( stream_textLineContent.hasNext ) {
                        adaptor.addChild(root_0, stream_textLineContent.nextTree());

                    }
                    stream_textLineContent.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:131:23: ( NL )?
                    if ( stream_NL.hasNext ) {
                        adaptor.addChild(root_0, stream_NL.nextNode());

                    }
                    stream_NL.reset();
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:131:27: ( textLine )*
                    while ( stream_textLine.hasNext ) {
                        adaptor.addChild(root_0, stream_textLine.nextTree());

                    }
                    stream_textLine.reset();

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
        // $ANTLR end paragraphTagTail

        // $ANTLR start synpred1_ASDoc
        public final function synpred1_ASDoc_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:103:4: ( LBRACE ATWORD )
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:103:5: LBRACE ATWORD
            {
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred1_ASDoc229); if (this.state.failed) return ;
            matchStream(input,ATWORD,FOLLOW_ATWORD_in_synpred1_ASDoc231); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred1_ASDoc

        // $ANTLR start synpred2_ASDoc
        public final function synpred2_ASDoc_fragment():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:108:4: ( LBRACE ATWORD )
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:108:5: LBRACE ATWORD
            {
            matchStream(input,LBRACE,FOLLOW_LBRACE_in_synpred2_ASDoc272); if (this.state.failed) return ;
            matchStream(input,ATWORD,FOLLOW_ATWORD_in_synpred2_ASDoc274); if (this.state.failed) return ;

            }
        }
        // $ANTLR end synpred2_ASDoc


           // Delegated rules

        public final function synpred2_ASDoc():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred2_ASDoc_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }
        public final function synpred1_ASDoc():Boolean {
            this.state.backtracking++;
            var start:int = input.mark();
            try {
                synpred1_ASDoc_fragment(); // can never throw exception
            } catch (re:RecognitionException) {
                trace("impossible: "+re);
            }
            var success:Boolean = !this.state.failed;
            input.rewindTo(start);
            this.state.backtracking--;
            this.state.failed=false;
            return success;
        }



        private const DFA2_eot:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA2_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x09\u80ff\xff");
        private const DFA2_min:Array =
            DFA.unpackEncodedString("\x01\x0a\x09\u80ff\xff", true);
        private const DFA2_max:Array =
            DFA.unpackEncodedString("\x01\x11\x09\u80ff\xff", true);
        private const DFA2_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x01\x06\u80ff\xff");
        private const DFA2_special:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA2_transition:Array = [
                DFA.unpackEncodedString("\x07\x03\x01\x01"),
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
        protected var dfa2:DFA;  // initialized in constructor

        private const DFA3_eot:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA3_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x09\u80ff\xff");
        private const DFA3_min:Array =
            DFA.unpackEncodedString("\x01\x0a\x09\u80ff\xff", true);
        private const DFA3_max:Array =
            DFA.unpackEncodedString("\x01\x11\x09\u80ff\xff", true);
        private const DFA3_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x01\x06\u80ff\xff");
        private const DFA3_special:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA3_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x07\x03"),
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
        protected var dfa3:DFA;  // initialized in constructor

        private const DFA6_eot:Array =
            DFA.unpackEncodedString("\x50\u80ff\xff");
        private const DFA6_eof:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x08\x05\u80ff\xff"+
            "\x01\x08\x08\u80ff\xff\x01\x08\x01\u80ff\xff\x01\x08\x02\u80ff\xff"+
            "\x03\x08\x38\u80ff\xff");
        private const DFA6_min:Array =
            DFA.unpackEncodedString("\x01\x0b\x01\x0a\x05\u80ff\xff\x01"+
            "\x0a\x08\u80ff\xff\x01\x0a\x01\x00\x01\x0a\x02\u80ff\xff\x03"+
            "\x0a\x01\u80ff\xff\x02\x00\x03\u80ff\xff\x04\x00\x0a\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff"+
            "\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff", true);
        private const DFA6_max:Array =
            DFA.unpackEncodedString("\x01\x10\x01\x11\x05\u80ff\xff\x01"+
            "\x11\x08\u80ff\xff\x01\x11\x01\x00\x01\x11\x02\u80ff\xff\x03"+
            "\x11\x01\u80ff\xff\x02\x00\x03\u80ff\xff\x04\x00\x0a\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff"+
            "\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff", true);
        private const DFA6_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x03\x01"+
            "\x04\x01\x06\x01\x07\x01\u80ff\xff\x01\x05\x22\u80ff\xff\x01"+
            "\x01\x24\u80ff\xff");
        private const DFA6_special:Array =
            DFA.unpackEncodedString("\x11\u80ff\xff\x01\x00\x07\u80ff\xff"+
            "\x01\x01\x01\x02\x03\u80ff\xff\x01\x03\x01\x04\x01\x05\x01\x06"+
            "\x0a\u80ff\xff\x01\x07\x01\x08\x01\x09\x02\u80ff\xff\x01\x0a"+
            "\x01\x0b\x01\x0c\x01\u80ff\xff\x01\x0d\x01\x0e\x01\x0f\x02\u80ff\xff"+
            "\x01\x10\x01\x11\x01\x12\x01\u80ff\xff\x01\x13\x01\x14\x01\x15"+
            "\x02\u80ff\xff\x01\x16\x01\x17\x01\x18\x01\u80ff\xff\x01\x19"+
            "\x01\x1a\x01\x1b\x02\u80ff\xff\x01\x1c\x01\x1d\x01\x1e\x01\u80ff\xff");
        private const DFA6_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x01\x03\x01\x04\x01\x01"+
                "\x01\x05\x01\x06"),
                DFA.unpackEncodedString("\x07\x08\x01\x07"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x10\x01\x12\x01\x15\x01\x16"+
                "\x01\x08\x01\x11\x01\x17\x01\x08"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x21\x01\x1a\x01\x1e\x01\x1f"+
                "\x01\x08\x01\x19\x01\x20\x01\x08"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\x2d\x01\x2e\x01\x31\x01\x32"+
                "\x01\x08\x01\x2c\x01\x33\x01\x08"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x36\x01\x37\x01\x3a\x01\x3b"+
                "\x01\x08\x01\x35\x01\x3c\x01\x08"),
                DFA.unpackEncodedString("\x01\x3f\x01\x40\x01\x43\x01\x44"+
                "\x01\x08\x01\x3e\x01\x45\x01\x08"),
                DFA.unpackEncodedString("\x01\x48\x01\x49\x01\x4c\x01\x4d"+
                "\x01\x08\x01\x47\x01\x4e\x01\x08"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
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
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("")
        ];
            private function DFA6_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA6_17:int = input.LA(1);

                             
                            var index6_17:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_17);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA6_25:int = input.LA(1);

                             
                            var index6_25:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_25);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA6_26:int = input.LA(1);

                             
                            var index6_26:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_26);
                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA6_30:int = input.LA(1);

                             
                            var index6_30:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_30);
                            if ( s>=0 ) return s;
                            break;
                        case 4 : 
                            var LA6_31:int = input.LA(1);

                             
                            var index6_31:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_31);
                            if ( s>=0 ) return s;
                            break;
                        case 5 : 
                            var LA6_32:int = input.LA(1);

                             
                            var index6_32:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_32);
                            if ( s>=0 ) return s;
                            break;
                        case 6 : 
                            var LA6_33:int = input.LA(1);

                             
                            var index6_33:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_33);
                            if ( s>=0 ) return s;
                            break;
                        case 7 : 
                            var LA6_44:int = input.LA(1);

                             
                            var index6_44:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_44);
                            if ( s>=0 ) return s;
                            break;
                        case 8 : 
                            var LA6_45:int = input.LA(1);

                             
                            var index6_45:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_45);
                            if ( s>=0 ) return s;
                            break;
                        case 9 : 
                            var LA6_46:int = input.LA(1);

                             
                            var index6_46:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_46);
                            if ( s>=0 ) return s;
                            break;
                        case 10 : 
                            var LA6_49:int = input.LA(1);

                             
                            var index6_49:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_49);
                            if ( s>=0 ) return s;
                            break;
                        case 11 : 
                            var LA6_50:int = input.LA(1);

                             
                            var index6_50:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_50);
                            if ( s>=0 ) return s;
                            break;
                        case 12 : 
                            var LA6_51:int = input.LA(1);

                             
                            var index6_51:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_51);
                            if ( s>=0 ) return s;
                            break;
                        case 13 : 
                            var LA6_53:int = input.LA(1);

                             
                            var index6_53:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_53);
                            if ( s>=0 ) return s;
                            break;
                        case 14 : 
                            var LA6_54:int = input.LA(1);

                             
                            var index6_54:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_54);
                            if ( s>=0 ) return s;
                            break;
                        case 15 : 
                            var LA6_55:int = input.LA(1);

                             
                            var index6_55:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_55);
                            if ( s>=0 ) return s;
                            break;
                        case 16 : 
                            var LA6_58:int = input.LA(1);

                             
                            var index6_58:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_58);
                            if ( s>=0 ) return s;
                            break;
                        case 17 : 
                            var LA6_59:int = input.LA(1);

                             
                            var index6_59:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_59);
                            if ( s>=0 ) return s;
                            break;
                        case 18 : 
                            var LA6_60:int = input.LA(1);

                             
                            var index6_60:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_60);
                            if ( s>=0 ) return s;
                            break;
                        case 19 : 
                            var LA6_62:int = input.LA(1);

                             
                            var index6_62:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_62);
                            if ( s>=0 ) return s;
                            break;
                        case 20 : 
                            var LA6_63:int = input.LA(1);

                             
                            var index6_63:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_63);
                            if ( s>=0 ) return s;
                            break;
                        case 21 : 
                            var LA6_64:int = input.LA(1);

                             
                            var index6_64:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_64);
                            if ( s>=0 ) return s;
                            break;
                        case 22 : 
                            var LA6_67:int = input.LA(1);

                             
                            var index6_67:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_67);
                            if ( s>=0 ) return s;
                            break;
                        case 23 : 
                            var LA6_68:int = input.LA(1);

                             
                            var index6_68:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_68);
                            if ( s>=0 ) return s;
                            break;
                        case 24 : 
                            var LA6_69:int = input.LA(1);

                             
                            var index6_69:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_69);
                            if ( s>=0 ) return s;
                            break;
                        case 25 : 
                            var LA6_71:int = input.LA(1);

                             
                            var index6_71:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_71);
                            if ( s>=0 ) return s;
                            break;
                        case 26 : 
                            var LA6_72:int = input.LA(1);

                             
                            var index6_72:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_72);
                            if ( s>=0 ) return s;
                            break;
                        case 27 : 
                            var LA6_73:int = input.LA(1);

                             
                            var index6_73:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_73);
                            if ( s>=0 ) return s;
                            break;
                        case 28 : 
                            var LA6_76:int = input.LA(1);

                             
                            var index6_76:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_76);
                            if ( s>=0 ) return s;
                            break;
                        case 29 : 
                            var LA6_77:int = input.LA(1);

                             
                            var index6_77:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_77);
                            if ( s>=0 ) return s;
                            break;
                        case 30 : 
                            var LA6_78:int = input.LA(1);

                             
                            var index6_78:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred1_ASDoc()) ) {s = 43;}

                            else if ( (true) ) {s = 8;}

                             
                            input.seek(index6_78);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 6, _s, input));
            }

        protected var dfa6:DFA;  // initialized in constructor

        private const DFA7_eot:Array =
            DFA.unpackEncodedString("\x51\u80ff\xff");
        private const DFA7_eof:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x09\x06\u80ff\xff"+
            "\x01\x09\x08\u80ff\xff\x01\x09\x01\u80ff\xff\x01\x09\x02\u80ff\xff"+
            "\x03\x09\x38\u80ff\xff");
        private const DFA7_min:Array =
            DFA.unpackEncodedString("\x01\x0b\x01\x0a\x06\u80ff\xff\x01"+
            "\x0a\x08\u80ff\xff\x01\x0a\x01\x00\x01\x0a\x02\u80ff\xff\x03"+
            "\x0a\x01\u80ff\xff\x02\x00\x03\u80ff\xff\x04\x00\x0a\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff"+
            "\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff", true);
        private const DFA7_max:Array =
            DFA.unpackEncodedString("\x02\x11\x06\u80ff\xff\x01\x11\x08"+
            "\u80ff\xff\x01\x11\x01\x00\x01\x11\x02\u80ff\xff\x03\x11\x01"+
            "\u80ff\xff\x02\x00\x03\u80ff\xff\x04\x00\x0a\u80ff\xff\x03\x00"+
            "\x02\u80ff\xff\x03\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff\x03"+
            "\x00\x01\u80ff\xff\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff"+
            "\x03\x00\x02\u80ff\xff\x03\x00\x01\u80ff\xff", true);
        private const DFA7_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x03\x01"+
            "\x04\x01\x06\x01\x07\x01\x08\x01\u80ff\xff\x01\x05\x22\u80ff\xff"+
            "\x01\x01\x24\u80ff\xff");
        private const DFA7_special:Array =
            DFA.unpackEncodedString("\x12\u80ff\xff\x01\x00\x07\u80ff\xff"+
            "\x01\x01\x01\x02\x03\u80ff\xff\x01\x03\x01\x04\x01\x05\x01\x06"+
            "\x0a\u80ff\xff\x01\x07\x01\x08\x01\x09\x02\u80ff\xff\x01\x0a"+
            "\x01\x0b\x01\x0c\x01\u80ff\xff\x01\x0d\x01\x0e\x01\x0f\x02\u80ff\xff"+
            "\x01\x10\x01\x11\x01\x12\x01\u80ff\xff\x01\x13\x01\x14\x01\x15"+
            "\x02\u80ff\xff\x01\x16\x01\x17\x01\x18\x01\u80ff\xff\x01\x19"+
            "\x01\x1a\x01\x1b\x02\u80ff\xff\x01\x1c\x01\x1d\x01\x1e\x01\u80ff\xff");
        private const DFA7_transition:Array = [
                DFA.unpackEncodedString("\x01\x02\x01\x03\x01\x04\x01\x01"+
                "\x01\x05\x01\x06\x01\x07"),
                DFA.unpackEncodedString("\x07\x09\x01\x08"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x11\x01\x13\x01\x16\x01\x17"+
                "\x01\x09\x01\x12\x01\x18\x01\x09"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x22\x01\x1b\x01\x1f\x01\x20"+
                "\x01\x09\x01\x1a\x01\x21\x01\x09"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\x2e\x01\x2f\x01\x32\x01\x33"+
                "\x01\x09\x01\x2d\x01\x34\x01\x09"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x37\x01\x38\x01\x3b\x01\x3c"+
                "\x01\x09\x01\x36\x01\x3d\x01\x09"),
                DFA.unpackEncodedString("\x01\x40\x01\x41\x01\x44\x01\x45"+
                "\x01\x09\x01\x3f\x01\x46\x01\x09"),
                DFA.unpackEncodedString("\x01\x49\x01\x4a\x01\x4d\x01\x4e"+
                "\x01\x09\x01\x48\x01\x4f\x01\x09"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
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
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("\x01\u80ff\xff"),
                DFA.unpackEncodedString("")
        ];
            private function DFA7_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:TokenStream = TokenStream(_input);
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA7_18:int = input.LA(1);

                             
                            var index7_18:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_18);
                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA7_26:int = input.LA(1);

                             
                            var index7_26:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_26);
                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA7_27:int = input.LA(1);

                             
                            var index7_27:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_27);
                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA7_31:int = input.LA(1);

                             
                            var index7_31:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_31);
                            if ( s>=0 ) return s;
                            break;
                        case 4 : 
                            var LA7_32:int = input.LA(1);

                             
                            var index7_32:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_32);
                            if ( s>=0 ) return s;
                            break;
                        case 5 : 
                            var LA7_33:int = input.LA(1);

                             
                            var index7_33:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_33);
                            if ( s>=0 ) return s;
                            break;
                        case 6 : 
                            var LA7_34:int = input.LA(1);

                             
                            var index7_34:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_34);
                            if ( s>=0 ) return s;
                            break;
                        case 7 : 
                            var LA7_45:int = input.LA(1);

                             
                            var index7_45:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_45);
                            if ( s>=0 ) return s;
                            break;
                        case 8 : 
                            var LA7_46:int = input.LA(1);

                             
                            var index7_46:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_46);
                            if ( s>=0 ) return s;
                            break;
                        case 9 : 
                            var LA7_47:int = input.LA(1);

                             
                            var index7_47:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_47);
                            if ( s>=0 ) return s;
                            break;
                        case 10 : 
                            var LA7_50:int = input.LA(1);

                             
                            var index7_50:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_50);
                            if ( s>=0 ) return s;
                            break;
                        case 11 : 
                            var LA7_51:int = input.LA(1);

                             
                            var index7_51:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_51);
                            if ( s>=0 ) return s;
                            break;
                        case 12 : 
                            var LA7_52:int = input.LA(1);

                             
                            var index7_52:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_52);
                            if ( s>=0 ) return s;
                            break;
                        case 13 : 
                            var LA7_54:int = input.LA(1);

                             
                            var index7_54:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_54);
                            if ( s>=0 ) return s;
                            break;
                        case 14 : 
                            var LA7_55:int = input.LA(1);

                             
                            var index7_55:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_55);
                            if ( s>=0 ) return s;
                            break;
                        case 15 : 
                            var LA7_56:int = input.LA(1);

                             
                            var index7_56:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_56);
                            if ( s>=0 ) return s;
                            break;
                        case 16 : 
                            var LA7_59:int = input.LA(1);

                             
                            var index7_59:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_59);
                            if ( s>=0 ) return s;
                            break;
                        case 17 : 
                            var LA7_60:int = input.LA(1);

                             
                            var index7_60:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_60);
                            if ( s>=0 ) return s;
                            break;
                        case 18 : 
                            var LA7_61:int = input.LA(1);

                             
                            var index7_61:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_61);
                            if ( s>=0 ) return s;
                            break;
                        case 19 : 
                            var LA7_63:int = input.LA(1);

                             
                            var index7_63:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_63);
                            if ( s>=0 ) return s;
                            break;
                        case 20 : 
                            var LA7_64:int = input.LA(1);

                             
                            var index7_64:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_64);
                            if ( s>=0 ) return s;
                            break;
                        case 21 : 
                            var LA7_65:int = input.LA(1);

                             
                            var index7_65:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_65);
                            if ( s>=0 ) return s;
                            break;
                        case 22 : 
                            var LA7_68:int = input.LA(1);

                             
                            var index7_68:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_68);
                            if ( s>=0 ) return s;
                            break;
                        case 23 : 
                            var LA7_69:int = input.LA(1);

                             
                            var index7_69:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_69);
                            if ( s>=0 ) return s;
                            break;
                        case 24 : 
                            var LA7_70:int = input.LA(1);

                             
                            var index7_70:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_70);
                            if ( s>=0 ) return s;
                            break;
                        case 25 : 
                            var LA7_72:int = input.LA(1);

                             
                            var index7_72:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_72);
                            if ( s>=0 ) return s;
                            break;
                        case 26 : 
                            var LA7_73:int = input.LA(1);

                             
                            var index7_73:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_73);
                            if ( s>=0 ) return s;
                            break;
                        case 27 : 
                            var LA7_74:int = input.LA(1);

                             
                            var index7_74:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_74);
                            if ( s>=0 ) return s;
                            break;
                        case 28 : 
                            var LA7_77:int = input.LA(1);

                             
                            var index7_77:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_77);
                            if ( s>=0 ) return s;
                            break;
                        case 29 : 
                            var LA7_78:int = input.LA(1);

                             
                            var index7_78:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_78);
                            if ( s>=0 ) return s;
                            break;
                        case 30 : 
                            var LA7_79:int = input.LA(1);

                             
                            var index7_79:int = input.index;
                            input.rewind();
                            s = -1;
                            if ( (synpred2_ASDoc()) ) {s = 44;}

                            else if ( (true) ) {s = 9;}

                             
                            input.seek(index7_79);
                            if ( s>=0 ) return s;
                            break;
                }
                if (this.state.backtracking>0) {this.state.failed=true; return -1;}
                throw dfa.error(new NoViableAltException(dfa.description, 7, _s, input));
            }

        protected var dfa7:DFA;  // initialized in constructor

        private const DFA9_eot:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA9_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x09\u80ff\xff");
        private const DFA9_min:Array =
            DFA.unpackEncodedString("\x01\x0a\x09\u80ff\xff", true);
        private const DFA9_max:Array =
            DFA.unpackEncodedString("\x01\x11\x09\u80ff\xff", true);
        private const DFA9_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x01\x06\u80ff\xff");
        private const DFA9_special:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA9_transition:Array = [
                DFA.unpackEncodedString("\x01\x01\x07\x03"),
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
        protected var dfa9:DFA;  // initialized in constructor

        private const DFA10_eot:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA10_eof:Array =
            DFA.unpackEncodedString("\x01\x01\x09\u80ff\xff");
        private const DFA10_min:Array =
            DFA.unpackEncodedString("\x01\x0a\x09\u80ff\xff", true);
        private const DFA10_max:Array =
            DFA.unpackEncodedString("\x01\x11\x09\u80ff\xff", true);
        private const DFA10_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x01\x06\u80ff\xff");
        private const DFA10_special:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA10_transition:Array = [
                DFA.unpackEncodedString("\x07\x03\x01\x01"),
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
        protected var dfa10:DFA;  // initialized in constructor
     

        public static const FOLLOW_description_in_commentBody137:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_paragraphTag_in_commentBody143:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_EOF_in_commentBody148:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_textLine_in_description173:BitSet = new BitSet([0x0001FC02, 0x00000000]);
        public static const FOLLOW_textLineStart_in_textLine196:BitSet = new BitSet([0x0003FC00, 0x00000000]);
        public static const FOLLOW_textLineContent_in_textLine200:BitSet = new BitSet([0x0003FC00, 0x00000000]);
        public static const FOLLOW_NL_in_textLine206:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_EOF_in_textLine210:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_NL_in_textLine217:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_inlineTag_in_textLineStart235:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_WORD_in_textLineStart240:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STARS_in_textLineStart244:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_WS_in_textLineStart248:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_textLineStart252:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_RBRACE_in_textLineStart256:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_AT_in_textLineStart260:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_inlineTag_in_textLineContent278:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_WORD_in_textLineContent283:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_STARS_in_textLineContent287:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_WS_in_textLineContent291:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_textLineContent295:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_RBRACE_in_textLineContent299:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_AT_in_textLineContent303:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ATWORD_in_textLineContent307:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_inlineTag318:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_ATWORD_in_inlineTag320:BitSet = new BitSet([0x0001BC00, 0x00000000]);
        public static const FOLLOW_inlineTagContent_in_inlineTag322:BitSet = new BitSet([0x0001BC00, 0x00000000]);
        public static const FOLLOW_RBRACE_in_inlineTag325:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_set_in_inlineTagContent0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_ATWORD_in_paragraphTag376:BitSet = new BitSet([0x0003FC00, 0x00000000]);
        public static const FOLLOW_paragraphTagTail_in_paragraphTag378:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_textLineContent_in_paragraphTagTail401:BitSet = new BitSet([0x0003FC00, 0x00000000]);
        public static const FOLLOW_NL_in_paragraphTagTail408:BitSet = new BitSet([0x0001FC00, 0x00000000]);
        public static const FOLLOW_textLine_in_paragraphTagTail410:BitSet = new BitSet([0x0001FC02, 0x00000000]);
        public static const FOLLOW_EOF_in_paragraphTagTail417:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred1_ASDoc229:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_ATWORD_in_synpred1_ASDoc231:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_LBRACE_in_synpred2_ASDoc272:BitSet = new BitSet([0x00020000, 0x00000000]);
        public static const FOLLOW_ATWORD_in_synpred2_ASDoc274:BitSet = new BitSet([0x00000002, 0x00000000]);

    }
}