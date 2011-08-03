// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g 2011-07-31 13:46:42
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

            dfa8 = new DFA(this, 8,
                        "1:1: Tokens : ( STARS | LBRACE | RBRACE | AT | WS | NL | ATWORD | WORD );",
                        DFA8_eot, DFA8_eof, DFA8_min,
                        DFA8_max, DFA8_accept, DFA8_special,
                        DFA8_transition, DFA8_specialStateTransition);


        }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g"; }

        // $ANTLR start STARS
        public final function mSTARS():void {
            try {
                var _type:int = STARS;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:6: ( ( '*' )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:9: ( '*' )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:9: ( '*' )+
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
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:134:9: '*'
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:136:7: ( '{' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:136:10: '{'
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:137:7: ( '}' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:137:10: '}'
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:138:3: ( '@' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:138:6: '@'
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:140:3: ( ( ' ' | '\\t' )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:140:6: ( ' ' | '\\t' )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:140:6: ( ' ' | '\\t' )+
                var cnt2:int=0;
                loop2:
                do {
                    var alt2:int=2;
                    var LA2_0:int = input.LA(1);

                    if ( (LA2_0==9||LA2_0==32) ) {
                        alt2=1;
                    }


                    switch (alt2) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:
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
                	    if ( cnt2 >= 1 ) break loop2;
                            throw new EarlyExitException(2, input);

                    }
                    cnt2++;
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:2: ( ( '\\r\\n' | '\\r' | '\\n' ) ( WS )? ( STARS ( ' ' | '\\t' )? )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:5: ( '\\r\\n' | '\\r' | '\\n' ) ( WS )? ( STARS ( ' ' | '\\t' )? )?
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:5: ( '\\r\\n' | '\\r' | '\\n' )
                var alt3:int=3;
                var LA3_0:int = input.LA(1);

                if ( (LA3_0==13) ) {
                    var LA3_1:int = input.LA(2);

                    if ( (LA3_1==10) ) {
                        alt3=1;
                    }
                    else {
                        alt3=2;}
                }
                else if ( (LA3_0==10) ) {
                    alt3=3;
                }
                else {
                    throw new NoViableAltException("", 3, 0, input);

                }
                switch (alt3) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:6: '\\r\\n'
                        {
                        matchString("\r\n"); 


                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:15: '\\r'
                        {
                        match(13); 

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:22: '\\n'
                        {
                        match(10); 

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:28: ( WS )?
                var alt4:int=2;
                var LA4_0:int = input.LA(1);

                if ( (LA4_0==9||LA4_0==32) ) {
                    alt4=1;
                }
                switch (alt4) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:28: WS
                        {
                        mWS(); 

                        }
                        break;

                }

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:32: ( STARS ( ' ' | '\\t' )? )?
                var alt6:int=2;
                var LA6_0:int = input.LA(1);

                if ( (LA6_0==42) ) {
                    alt6=1;
                }
                switch (alt6) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:33: STARS ( ' ' | '\\t' )?
                        {
                        mSTARS(); 
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:146:39: ( ' ' | '\\t' )?
                        var alt5:int=2;
                        var LA5_0:int = input.LA(1);

                        if ( (LA5_0==9||LA5_0==32) ) {
                            alt5=1;
                        }
                        switch (alt5) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:148:7: ( '@' WORD WORD_TAIL )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:148:10: '@' WORD WORD_TAIL
                {
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:150:5: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' | '@' ) WORD_TAIL )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:150:8: ~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' | '@' ) WORD_TAIL
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
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:154:10: ( (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:154:12: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )*
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:154:12: (~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' ) )*
                loop7:
                do {
                    var alt7:int=2;
                    var LA7_0:int = input.LA(1);

                    if ( ((LA7_0>=0 && LA7_0<=8)||(LA7_0>=11 && LA7_0<=12)||(LA7_0>=14 && LA7_0<=31)||(LA7_0>=33 && LA7_0<=122)||LA7_0==124||(LA7_0>=126 && LA7_0<=65535)) ) {
                        alt7=1;
                    }


                    switch (alt7) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:154:13: ~ ( '\\n' | ' ' | '\\r' | '\\t' | '{' | '}' )
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
                	    break loop7;
                    }
                } while (true);


                }

            }
            finally {
            }
        }
        // $ANTLR end WORD_TAIL

        public override function mTokens():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:8: ( STARS | LBRACE | RBRACE | AT | WS | NL | ATWORD | WORD )
            var alt8:int=8;
            alt8 = dfa8.predict(input);
            switch (alt8) {
                case 1 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:10: STARS
                    {
                    mSTARS(); 

                    }
                    break;
                case 2 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:16: LBRACE
                    {
                    mLBRACE(); 

                    }
                    break;
                case 3 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:23: RBRACE
                    {
                    mRBRACE(); 

                    }
                    break;
                case 4 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:30: AT
                    {
                    mAT(); 

                    }
                    break;
                case 5 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:33: WS
                    {
                    mWS(); 

                    }
                    break;
                case 6 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:36: NL
                    {
                    mNL(); 

                    }
                    break;
                case 7 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:39: ATWORD
                    {
                    mATWORD(); 

                    }
                    break;
                case 8 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\asdoc\\ASDoc.g:1:46: WORD
                    {
                    mWORD(); 

                    }
                    break;

            }

        }



        private const DFA8_eot:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x08\x02\u80ff\xff"+
            "\x01\x0a\x04\u80ff\xff\x01\x08\x02\u80ff\xff");
        private const DFA8_eof:Array =
            DFA.unpackEncodedString("\x0c\u80ff\xff");
        private const DFA8_min:Array =
            DFA.unpackEncodedString("\x02\x00\x02\u80ff\xff\x01\x00\x04"+
            "\u80ff\xff\x01\x00\x02\u80ff\xff", true);
        private const DFA8_max:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x02\u80ff\xff\x01\u80ff\xff"+
            "\x04\u80ff\xff\x01\u80ff\xff\x02\u80ff\xff", true);
        private const DFA8_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\x03\x01"+
            "\u80ff\xff\x01\x05\x01\x06\x01\x08\x01\x01\x01\u80ff\xff\x01"+
            "\x04\x01\x07");
        private const DFA8_special:Array =
            DFA.unpackEncodedString("\x01\x03\x01\x01\x02\u80ff\xff\x01"+
            "\x00\x04\u80ff\xff\x01\x02\x02\u80ff\xff");
        private const DFA8_transition:Array = [
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
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x09\x07\x02\u80ff\xff\x02\x07"+
                "\x01\u80ff\xff\x12\x07\x01\u80ff\xff\x09\x07\x01\x09\x50"+
                "\x07\x01\u80ff\xff\x01\x07\x01\u80ff\xff\u80ff\x82\x07"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("")
        ];
            private function DFA8_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:IntStream = _input;
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA8_4:int = input.LA(1);

                            s = -1;
                            if ( ((LA8_4>=0 && LA8_4<=8)||(LA8_4>=11 && LA8_4<=12)||(LA8_4>=14 && LA8_4<=31)||(LA8_4>=33 && LA8_4<=63)||(LA8_4>=65 && LA8_4<=122)||LA8_4==124||(LA8_4>=126 && LA8_4<=65535)) ) {s = 11;}

                            else s = 10;

                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA8_1:int = input.LA(1);

                            s = -1;
                            if ( (LA8_1==42) ) {s = 9;}

                            else if ( ((LA8_1>=0 && LA8_1<=8)||(LA8_1>=11 && LA8_1<=12)||(LA8_1>=14 && LA8_1<=31)||(LA8_1>=33 && LA8_1<=41)||(LA8_1>=43 && LA8_1<=122)||LA8_1==124||(LA8_1>=126 && LA8_1<=65535)) ) {s = 7;}

                            else s = 8;

                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA8_9:int = input.LA(1);

                            s = -1;
                            if ( (LA8_9==42) ) {s = 9;}

                            else if ( ((LA8_9>=0 && LA8_9<=8)||(LA8_9>=11 && LA8_9<=12)||(LA8_9>=14 && LA8_9<=31)||(LA8_9>=33 && LA8_9<=41)||(LA8_9>=43 && LA8_9<=122)||LA8_9==124||(LA8_9>=126 && LA8_9<=65535)) ) {s = 7;}

                            else s = 8;

                            if ( s>=0 ) return s;
                            break;
                        case 3 : 
                            var LA8_0:int = input.LA(1);

                            s = -1;
                            if ( (LA8_0==42) ) {s = 1;}

                            else if ( (LA8_0==123) ) {s = 2;}

                            else if ( (LA8_0==125) ) {s = 3;}

                            else if ( (LA8_0==64) ) {s = 4;}

                            else if ( (LA8_0==9||LA8_0==32) ) {s = 5;}

                            else if ( (LA8_0==10||LA8_0==13) ) {s = 6;}

                            else if ( ((LA8_0>=0 && LA8_0<=8)||(LA8_0>=11 && LA8_0<=12)||(LA8_0>=14 && LA8_0<=31)||(LA8_0>=33 && LA8_0<=41)||(LA8_0>=43 && LA8_0<=63)||(LA8_0>=65 && LA8_0<=122)||LA8_0==124||(LA8_0>=126 && LA8_0<=65535)) ) {s = 7;}

                            if ( s>=0 ) return s;
                            break;
                }
                throw dfa.error(new NoViableAltException(dfa.description, 8, _s, input));
            }

        protected var dfa8:DFA;  // initialized in constructor
     

    }
}