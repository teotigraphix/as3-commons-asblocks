// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g 2011-08-06 09:38:18
package org.as3commons.asblocks.parser.antlr.asdoc {


    import org.antlr.runtime.*;
        

    public class ASDocLexer extends Lexer {
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

        	//protected void mismatch(IntStream input, int ttype, BitSet follow)
        	//	throws RecognitionException
        	//{
        	//	throw new MismatchedTokenException(ttype, input);
        	//}


        // delegates
        // delegators

        public function ASDocLexer(input:CharStream = null, state:RecognizerSharedState = null) {
            super(input, state);

            dfa9 = new DFA(this, 9,
                        "1:1: Tokens : ( STARS | LBRACE | RBRACE | AT | WS | NL | ATWORD | WORD );",
                        DFA9_eot, DFA9_eof, DFA9_min,
                        DFA9_max, DFA9_accept, DFA9_special,
                        DFA9_transition, DFA9_specialStateTransition);


        }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g"; }

        // $ANTLR start STARS
        public final function mSTARS():void {
            try {
                var _type:int = STARS;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:132:6: ( ( '*' )+ ( ' ' | '\\t' )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:132:9: ( '*' )+ ( ' ' | '\\t' )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:132:9: ( '*' )+
                var cnt1:int=0;
                loop1:
                do {
                    var alt1:int=2;
                    var LA1_0:int = input.LA(1);

                    if ( (LA1_0==42) ) {
                        alt1=1;
                    }


                    switch (alt1) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:132:9: '*'
                	    {
                	    match(42); 

                	    }
                	    break;

                	default :
                	    if ( cnt1 >= 1 ) break loop1;
                            throw new EarlyExitException(1, input);

                    }
                    cnt1++;
                } while (true);

                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:132:14: ( ' ' | '\\t' )?
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( (LA2_0==9||LA2_0==32) ) {
                    alt2=1;
                }
                switch (alt2) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:
                        {
                        if ( input.LA(1)==9||input.LA(1)==32 ) {
                            input.consume();

                        }
                        else {
                            throw recover(new MismatchedSetException(null,input));
                        }


                        }
                        break;

                }


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end STARS

        // $ANTLR start LBRACE
        public final function mLBRACE():void {
            try {
                var _type:int = LBRACE;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:7: ( '{' )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:10: '{'
                {
                match(123); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end LBRACE

        // $ANTLR start RBRACE
        public final function mRBRACE():void {
            try {
                var _type:int = RBRACE;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:135:7: ( '}' )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:135:10: '}'
                {
                match(125); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end RBRACE

        // $ANTLR start AT
        public final function mAT():void {
            try {
                var _type:int = AT;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:136:3: ( '@' )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:136:6: '@'
                {
                match(64); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end AT

        // $ANTLR start WS
        public final function mWS():void {
            try {
                var _type:int = WS;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:138:3: ( ( ' ' | '\\t' )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:138:6: ( ' ' | '\\t' )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:138:6: ( ' ' | '\\t' )+
                var cnt3:int=0;
                loop3:
                do {
                    var alt3:int=2;
                    var LA3_0:int = input.LA(1);

                    if ( (LA3_0==9||LA3_0==32) ) {
                        alt3=1;
                    }


                    switch (alt3) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:
                	    {
                	    if ( input.LA(1)==9||input.LA(1)==32 ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


                	    }
                	    break;

                	default :
                	    if ( cnt3 >= 1 ) break loop3;
                            throw new EarlyExitException(3, input);

                    }
                    cnt3++;
                } while (true);


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end WS

        // $ANTLR start NL
        public final function mNL():void {
            try {
                var _type:int = NL;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:2: ( ( '\\r\\n' | '\\r' | '\\n' ) ( WS )? ( STARS )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:5: ( '\\r\\n' | '\\r' | '\\n' ) ( WS )? ( STARS )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:5: ( '\\r\\n' | '\\r' | '\\n' )
                var alt4:int=3;
                var LA4_0:int = input.LA(1);

                if ( (LA4_0==13) ) {
                    var LA4_1:int = input.LA(2);

                    if ( (LA4_1==10) ) {
                        alt4=1;
                    }
                    else {
                        alt4=2;}
                }
                else if ( (LA4_0==10) ) {
                    alt4=3;
                }
                else {
                    throw new NoViableAltException("", 4, 0, input);

                }
                switch (alt4) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:6: '\\r\\n'
                        {
                        matchString("\r\n"); 


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:15: '\\r'
                        {
                        match(13); 

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:22: '\\n'
                        {
                        match(10); 

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:28: ( WS )?
                var alt5:int=2;
                var LA5_0:int = input.LA(1);

                if ( (LA5_0==9||LA5_0==32) ) {
                    alt5=1;
                }
                switch (alt5) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:28: WS
                        {
                        mWS(); 

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:32: ( STARS )?
                var alt6:int=2;
                var LA6_0:int = input.LA(1);

                if ( (LA6_0==42) ) {
                    alt6=1;
                }
                switch (alt6) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:144:33: STARS
                        {
                        mSTARS(); 

                        }
                        break;

                }


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end NL

        // $ANTLR start ATWORD
        public final function mATWORD():void {
            try {
                var _type:int = ATWORD;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:149:7: ( ( WS )? '@' WORD WORD_TAIL )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:149:10: ( WS )? '@' WORD WORD_TAIL
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:149:10: ( WS )?
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( (LA7_0==9||LA7_0==32) ) {
                    alt7=1;
                }
                switch (alt7) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:149:10: WS
                        {
                        mWS(); 

                        }
                        break;

                }

                match(64); 
                mWORD(); 
                mWORD_TAIL(); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end ATWORD

        // $ANTLR start WORD
        public final function mWORD():void {
            try {
                var _type:int = WORD;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:151:5: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' | '@' ) WORD_TAIL )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:151:8: ~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' | '@' ) WORD_TAIL
                {
                if ( (input.LA(1)>=0 && input.LA(1)<=8)||(input.LA(1)>=11 && input.LA(1)<=12)||(input.LA(1)>=14 && input.LA(1)<=31)||(input.LA(1)>=33 && input.LA(1)<=63)||(input.LA(1)>=65 && input.LA(1)<=122)||input.LA(1)==124||(input.LA(1)>=126 && input.LA(1)<=65535) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }

                mWORD_TAIL(); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end WORD

        // $ANTLR start WORD_TAIL
        public final function mWORD_TAIL():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:155:10: ( (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:155:12: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:155:12: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )*
                loop8:
                do {
                    var alt8:int=2;
                    var LA8_0:int = input.LA(1);

                    if ( ((LA8_0>=0 && LA8_0<=8)||(LA8_0>=11 && LA8_0<=12)||(LA8_0>=14 && LA8_0<=31)||(LA8_0>=33 && LA8_0<=122)||LA8_0==124||(LA8_0>=126 && LA8_0<=65535)) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:155:13: ~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' )
                	    {
                	    if ( (input.LA(1)>=0 && input.LA(1)<=8)||(input.LA(1)>=11 && input.LA(1)<=12)||(input.LA(1)>=14 && input.LA(1)<=31)||(input.LA(1)>=33 && input.LA(1)<=122)||input.LA(1)==124||(input.LA(1)>=126 && input.LA(1)<=65535) ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);


                }

            }
            finally {
            }
        }
        // $ANTLR end WORD_TAIL

        public override function mTokens():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:8: ( STARS | LBRACE | RBRACE | AT | WS | NL | ATWORD | WORD )
            var alt9:int=8;
            alt9 = dfa9.predict(input);
            switch (alt9) {
                case 1 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:10: STARS
                    {
                    mSTARS(); 

                    }
                    break;
                case 2 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:16: LBRACE
                    {
                    mLBRACE(); 

                    }
                    break;
                case 3 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:23: RBRACE
                    {
                    mRBRACE(); 

                    }
                    break;
                case 4 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:30: AT
                    {
                    mAT(); 

                    }
                    break;
                case 5 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:33: WS
                    {
                    mWS(); 

                    }
                    break;
                case 6 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:36: NL
                    {
                    mNL(); 

                    }
                    break;
                case 7 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:39: ATWORD
                    {
                    mATWORD(); 

                    }
                    break;
                case 8 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\ws-as-blocks\\as3-commons-asblocks\\src\\main\\actionscript\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:46: WORD
                    {
                    mWORD(); 

                    }
                    break;

            }

        }



        private const DFA9_eot:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x08\x02\u80ff\xff"+
            "\x01\x0a\x01\x0c\x03\u80ff\xff\x01\x08\x03\u80ff\xff");
        private const DFA9_eof:Array =
            DFA.unpackEncodedString("\x0d\u80ff\xff");
        private const DFA9_min:Array =
            DFA.unpackEncodedString("\x02\x00\x02\u80ff\xff\x01\x00\x01"+
            "\x09\x03\u80ff\xff\x01\x00\x03\u80ff\xff", true);
        private const DFA9_max:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x02\u80ff\xff\x01\u80ff\xff"+
            "\x01\x40\x03\u80ff\xff\x01\u80ff\xff\x03\u80ff\xff", true);
        private const DFA9_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x03\x02"+
            "\u80ff\xff\x01\x06\x01\x08\x01\x01\x01\u80ff\xff\x01\x04\x01"+
            "\x07\x01\x05");
        private const DFA9_special:Array =
            DFA.unpackEncodedString("\x01\x01\x01\x02\x02\u80ff\xff\x01"+
            "\x00\x04\u80ff\xff\x01\x03\x03\u80ff\xff");
        private const DFA9_transition:Array = [
                DFA.unpackEncodedString("\x09\x07\x01\x05\x01\x06\x02\x07"+
                "\x01\x06\x12\x07\x01\x05\x09\x07\x01\x01\x15\x07\x01\x04"+
                "\x3a\x07\x01\x02\x01\x07\x01\x03\u80ff\x82\x07"),
                DFA.unpackEncodedString("\x09\x07\x02\u80ff\xff\x02\x07"+
                "\x01\u80ff\xff\x12\x07\x01\u80ff\xff\x09\x07\x01\x09\x50"+
                "\x07\x01\u80ff\xff\x01\x07\x01\u80ff\xff\u80ff\x82\x07"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x09\x0b\x02\u80ff\xff\x02\x0b"+
                "\x01\u80ff\xff\x12\x0b\x01\u80ff\xff\x1f\x0b\x01\u80ff\xff"+
                "\x3a\x0b\x01\u80ff\xff\x01\x0b\x01\u80ff\xff\u80ff\x82\x0b"),
                DFA.unpackEncodedString("\x01\x05\x16\u80ff\xff\x01\x05"+
                "\x1f\u80ff\xff\x01\x0b"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x09\x07\x02\u80ff\xff\x02\x07"+
                "\x01\u80ff\xff\x12\x07\x01\u80ff\xff\x09\x07\x01\x09\x50"+
                "\x07\x01\u80ff\xff\x01\x07\x01\u80ff\xff\u80ff\x82\x07"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA9_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:IntStream = _input;
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA9_4:int = input.LA(1);

                            s = -1;
                            if ( ((LA9_4>=0 && LA9_4<=8)||(LA9_4>=11 && LA9_4<=12)||(LA9_4>=14 && LA9_4<=31)||(LA9_4>=33 && LA9_4<=63)||(LA9_4>=65 && LA9_4<=122)||LA9_4==124||(LA9_4>=126 && LA9_4<=65535)) ) {s = 11;}

                            else s = 10;

                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA9_0:int = input.LA(1);

                            s = -1;
                            if ( (LA9_0==42) ) {s = 1;}

                            else if ( (LA9_0==123) ) {s = 2;}

                            else if ( (LA9_0==125) ) {s = 3;}

                            else if ( (LA9_0==64) ) {s = 4;}

                            else if ( (LA9_0==9||LA9_0==32) ) {s = 5;}

                            else if ( (LA9_0==10||LA9_0==13) ) {s = 6;}

                            else if ( ((LA9_0>=0 && LA9_0<=8)||(LA9_0>=11 && LA9_0<=12)||(LA9_0>=14 && LA9_0<=31)||(LA9_0>=33 && LA9_0<=41)||(LA9_0>=43 && LA9_0<=63)||(LA9_0>=65 && LA9_0<=122)||LA9_0==124||(LA9_0>=126 && LA9_0<=65535)) ) {s = 7;}

                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA9_1:int = input.LA(1);

                            s = -1;
                            if ( (LA9_1==42) ) {s = 9;}

                            else if ( ((LA9_1>=0 && LA9_1<=8)||(LA9_1>=11 && LA9_1<=12)||(LA9_1>=14 && LA9_1<=31)||(LA9_1>=33 && LA9_1<=41)||(LA9_1>=43 && LA9_1<=122)||LA9_1==124||(LA9_1>=126 && LA9_1<=65535)) ) {s = 7;}

                            else s = 8;

                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA9_9:int = input.LA(1);

                            s = -1;
                            if ( (LA9_9==42) ) {s = 9;}

                            else if ( ((LA9_9>=0 && LA9_9<=8)||(LA9_9>=11 && LA9_9<=12)||(LA9_9>=14 && LA9_9<=31)||(LA9_9>=33 && LA9_9<=41)||(LA9_9>=43 && LA9_9<=122)||LA9_9==124||(LA9_9>=126 && LA9_9<=65535)) ) {s = 7;}

                            else s = 8;

                            if ( s>=0 ) return s;
                            break;
                }
                throw dfa.error(new NoViableAltException(dfa.description, 9, _s, input));
            }

        protected var dfa9:DFA;  // initialized in constructor
     

    }
}