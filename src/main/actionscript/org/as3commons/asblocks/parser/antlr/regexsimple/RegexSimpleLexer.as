// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g 2011-06-21 08:22:08
package org.as3commons.asblocks.parser.antlr.regexsimple {

    import org.as3commons.asblocks.parser.antlr.LinkedListToken;
    import org.as3commons.asblocks.parser.antlr.LinkedListTree;

    import org.antlr.runtime.*;
        

    public class RegexSimpleLexer extends Lexer {
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

        public function RegexSimpleLexer(input:CharStream = null, state:RecognizerSharedState = null) {
            super(input, state);

            dfa5 = new DFA(this, 5,
                        "1:1: Tokens : ( REGEXP_DELIMITER | REGEXP_FLAG | REGEXP_CHAR );",
                        DFA5_eot, DFA5_eof, DFA5_min,
                        DFA5_max, DFA5_accept, DFA5_special,
                        DFA5_transition, DFA5_specialStateTransition);


        }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g"; }

        // $ANTLR start REGEXP_DELIMITER
        public final function mREGEXP_DELIMITER():void {
            try {
                var _type:int = REGEXP_DELIMITER;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:110:2: ( '/' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:110:4: '/'
                {
                match(47); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end REGEXP_DELIMITER

        // $ANTLR start REGEXP_FLAG
        public final function mREGEXP_FLAG():void {
            try {
                var _type:int = REGEXP_FLAG;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:114:2: ( CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE | NULL_ESCAPE )
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( (LA1_0==36||(LA1_0>=48 && LA1_0<=57)||(LA1_0>=65 && LA1_0<=90)||LA1_0==95||(LA1_0>=97 && LA1_0<=122)) ) {
                    alt1=1;
                }
                else if ( (LA1_0==92) ) {
                    var LA1_2:int = input.LA(2);

                    if ( (LA1_2==85||LA1_2==117||LA1_2==120) ) {
                        alt1=1;
                    }
                    else if ( (LA1_2==95) ) {
                        alt1=2;
                    }
                    else {
                        throw new NoViableAltException("", 1, 2, input);

                    }
                }
                else {
                    throw new NoViableAltException("", 1, 0, input);

                }
                switch (alt1) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:114:4: CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE
                        {
                        mCONTINUING_IDENTIFIER_CHAR_OR_ESCAPE(); 

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:115:4: NULL_ESCAPE
                        {
                        mNULL_ESCAPE(); 

                        }
                        break;

                }
                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end REGEXP_FLAG

        // $ANTLR start REGEXP_CHAR
        public final function mREGEXP_CHAR():void {
            try {
                var _type:int = REGEXP_CHAR;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:119:2: ( ORDINARY_REGEXP_CHAR | ESC NON_TERMINATOR )
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( ((LA2_0>=0 && LA2_0<=9)||(LA2_0>=11 && LA2_0<=12)||(LA2_0>=14 && LA2_0<=46)||(LA2_0>=48 && LA2_0<=91)||(LA2_0>=93 && LA2_0<=65535)) ) {
                    alt2=1;
                }
                else if ( (LA2_0==92) ) {
                    alt2=2;
                }
                else {
                    throw new NoViableAltException("", 2, 0, input);

                }
                switch (alt2) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:119:4: ORDINARY_REGEXP_CHAR
                        {
                        mORDINARY_REGEXP_CHAR(); 

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:120:4: ESC NON_TERMINATOR
                        {
                        mESC(); 
                        mNON_TERMINATOR(); 

                        }
                        break;

                }
                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end REGEXP_CHAR

        // $ANTLR start TERMINATOR
        public final function mTERMINATOR():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:124:2: ( '\\n' | '\\r' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:
                {
                if ( input.LA(1)==10||input.LA(1)==13 ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end TERMINATOR

        // $ANTLR start ORDINARY_REGEXP_CHAR
        public final function mORDINARY_REGEXP_CHAR():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:128:2: (~ ( '\\n' | '\\r' | '\\\\' | '/' ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:128:4: ~ ( '\\n' | '\\r' | '\\\\' | '/' )
                {
                if ( (input.LA(1)>=0 && input.LA(1)<=9)||(input.LA(1)>=11 && input.LA(1)<=12)||(input.LA(1)>=14 && input.LA(1)<=46)||(input.LA(1)>=48 && input.LA(1)<=91)||(input.LA(1)>=93 && input.LA(1)<=65535) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end ORDINARY_REGEXP_CHAR

        // $ANTLR start NON_TERMINATOR
        public final function mNON_TERMINATOR():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:132:2: (~ TERMINATOR )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:132:4: ~ TERMINATOR
                {
                if ( (input.LA(1)>=0 && input.LA(1)<=14)||(input.LA(1)>=16 && input.LA(1)<=65535) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end NON_TERMINATOR

        // $ANTLR start ESC
        public final function mESC():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:136:2: ( '\\\\' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:136:4: '\\\\'
                {
                match(92); 

                }

            }
            finally {
            }
        }
        // $ANTLR end ESC

        // $ANTLR start NULL_ESCAPE
        public final function mNULL_ESCAPE():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:140:2: ( ESC '_' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:140:4: ESC '_'
                {
                mESC(); 
                match(95); 

                }

            }
            finally {
            }
        }
        // $ANTLR end NULL_ESCAPE

        // $ANTLR start CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE
        public final function mCONTINUING_IDENTIFIER_CHAR_OR_ESCAPE():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:144:2: ( CONTINUING_IDENTIFIER_CHAR | ESC HEX_ESCAPE )
                var alt3:int=2;
                var LA3_0:int = input.LA(1);

                if ( (LA3_0==36||(LA3_0>=48 && LA3_0<=57)||(LA3_0>=65 && LA3_0<=90)||LA3_0==95||(LA3_0>=97 && LA3_0<=122)) ) {
                    alt3=1;
                }
                else if ( (LA3_0==92) ) {
                    alt3=2;
                }
                else {
                    throw new NoViableAltException("", 3, 0, input);

                }
                switch (alt3) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:144:4: CONTINUING_IDENTIFIER_CHAR
                        {
                        mCONTINUING_IDENTIFIER_CHAR(); 

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:145:4: ESC HEX_ESCAPE
                        {
                        mESC(); 
                        mHEX_ESCAPE(); 

                        }
                        break;

                }
            }
            finally {
            }
        }
        // $ANTLR end CONTINUING_IDENTIFIER_CHAR_OR_ESCAPE

        // $ANTLR start CONTINUING_IDENTIFIER_CHAR
        public final function mCONTINUING_IDENTIFIER_CHAR():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:149:2: ( UNICODE_ALPHANUMERIC | '$' | '_' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:
                {
                if ( input.LA(1)==36||(input.LA(1)>=48 && input.LA(1)<=57)||(input.LA(1)>=65 && input.LA(1)<=90)||input.LA(1)==95||(input.LA(1)>=97 && input.LA(1)<=122) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end CONTINUING_IDENTIFIER_CHAR

        // $ANTLR start UNICODE_ALPHANUMERIC
        public final function mUNICODE_ALPHANUMERIC():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:154:2: ( 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:
                {
                if ( (input.LA(1)>=48 && input.LA(1)<=57)||(input.LA(1)>=65 && input.LA(1)<=90)||(input.LA(1)>=97 && input.LA(1)<=122) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end UNICODE_ALPHANUMERIC

        // $ANTLR start HEX_ESCAPE
        public final function mHEX_ESCAPE():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:158:2: ( 'x' HEX_DIGIT HEX_DIGIT | 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT | 'U' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT )
                var alt4:int=3;
                switch ( input.LA(1) ) {
                case 120:
                    {
                    alt4=1;
                    }
                    break;
                case 117:
                    {
                    alt4=2;
                    }
                    break;
                case 85:
                    {
                    alt4=3;
                    }
                    break;
                default:
                    throw new NoViableAltException("", 4, 0, input);

                }

                switch (alt4) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:158:4: 'x' HEX_DIGIT HEX_DIGIT
                        {
                        match(120); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:159:4: 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
                        {
                        match(117); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:160:4: 'U' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
                        {
                        match(85); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 
                        mHEX_DIGIT(); 

                        }
                        break;

                }
            }
            finally {
            }
        }
        // $ANTLR end HEX_ESCAPE

        // $ANTLR start HEX_DIGIT
        public final function mHEX_DIGIT():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:164:2: ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:
                {
                if ( (input.LA(1)>=48 && input.LA(1)<=57)||(input.LA(1)>=65 && input.LA(1)<=70)||(input.LA(1)>=97 && input.LA(1)<=102) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }

            }
            finally {
            }
        }
        // $ANTLR end HEX_DIGIT

        public override function mTokens():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:1:8: ( REGEXP_DELIMITER | REGEXP_FLAG | REGEXP_CHAR )
            var alt5:int=3;
            alt5 = dfa5.predict(input);
            switch (alt5) {
                case 1 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:1:10: REGEXP_DELIMITER
                    {
                    mREGEXP_DELIMITER(); 

                    }
                    break;
                case 2 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:1:27: REGEXP_FLAG
                    {
                    mREGEXP_FLAG(); 

                    }
                    break;
                case 3 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\regexsimple\\RegexSimple.g:1:39: REGEXP_CHAR
                    {
                    mREGEXP_CHAR(); 

                    }
                    break;

            }

        }



        private const DFA5_eot:Array =
            DFA.unpackEncodedString("\x06\u80ff\xff\x03\x04\x01\u80ff\xff");
        private const DFA5_eof:Array =
            DFA.unpackEncodedString("\x0a\u80ff\xff");
        private const DFA5_min:Array =
            DFA.unpackEncodedString("\x01\x00\x02\u80ff\xff\x01\x00\x02"+
            "\u80ff\xff\x03\x30\x01\u80ff\xff", true);
        private const DFA5_max:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x02\u80ff\xff\x01\u80ff\xff"+
            "\x02\u80ff\xff\x03\x66\x01\u80ff\xff", true);
        private const DFA5_accept:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x01\x01\x02\x01"+
            "\u80ff\xff\x01\x03\x01\x02\x03\u80ff\xff\x01\x02");
        private const DFA5_special:Array =
            DFA.unpackEncodedString("\x01\x00\x02\u80ff\xff\x01\x01\x06"+
            "\u80ff\xff");
        private const DFA5_transition:Array = [
                DFA.unpackEncodedString("\x0a\x04\x01\u80ff\xff\x02\x04"+
                "\x01\u80ff\xff\x16\x04\x01\x02\x0a\x04\x01\x01\x0a\x02\x07"+
                "\x04\x1a\x02\x01\x04\x01\x03\x02\x04\x01\x02\x01\x04\x1a"+
                "\x02\u80ff\x85\x04"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x0a\x04\x01\u80ff\xff\x02\x04"+
                "\x01\u80ff\xff\x47\x04\x01\x08\x09\x04\x01\x09\x15\x04\x01"+
                "\x07\x02\x04\x01\x06\u80ff\x87\x04"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x0a\x05\x07\u80ff\xff\x06\x05"+
                "\x1a\u80ff\xff\x06\x05"),
                DFA.unpackEncodedString("\x0a\x05\x07\u80ff\xff\x06\x05"+
                "\x1a\u80ff\xff\x06\x05"),
                DFA.unpackEncodedString("\x0a\x05\x07\u80ff\xff\x06\x05"+
                "\x1a\u80ff\xff\x06\x05"),
                DFA.unpackEncodedString("")
        ];
            private function DFA5_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:IntStream = _input;
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA5_0:int = input.LA(1);

                            s = -1;
                            if ( (LA5_0==47) ) {s = 1;}

                            else if ( (LA5_0==36||(LA5_0>=48 && LA5_0<=57)||(LA5_0>=65 && LA5_0<=90)||LA5_0==95||(LA5_0>=97 && LA5_0<=122)) ) {s = 2;}

                            else if ( (LA5_0==92) ) {s = 3;}

                            else if ( ((LA5_0>=0 && LA5_0<=9)||(LA5_0>=11 && LA5_0<=12)||(LA5_0>=14 && LA5_0<=35)||(LA5_0>=37 && LA5_0<=46)||(LA5_0>=58 && LA5_0<=64)||LA5_0==91||(LA5_0>=93 && LA5_0<=94)||LA5_0==96||(LA5_0>=123 && LA5_0<=65535)) ) {s = 4;}

                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA5_3:int = input.LA(1);

                            s = -1;
                            if ( (LA5_3==120) ) {s = 6;}

                            else if ( (LA5_3==117) ) {s = 7;}

                            else if ( (LA5_3==85) ) {s = 8;}

                            else if ( (LA5_3==95) ) {s = 9;}

                            else if ( ((LA5_3>=0 && LA5_3<=9)||(LA5_3>=11 && LA5_3<=12)||(LA5_3>=14 && LA5_3<=84)||(LA5_3>=86 && LA5_3<=94)||(LA5_3>=96 && LA5_3<=116)||(LA5_3>=118 && LA5_3<=119)||(LA5_3>=121 && LA5_3<=65535)) ) {s = 4;}

                            if ( s>=0 ) return s;
                            break;
                }
                throw dfa.error(new NoViableAltException(dfa.description, 5, _s, input));
            }

        protected var dfa5:DFA;  // initialized in constructor
     

    }
}