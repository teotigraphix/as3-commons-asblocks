// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g 2011-06-21 08:05:32
package org.as3commons.asblocks.parser.antlr.e4x {

    import org.as3commons.asblocks.parser.antlr.LinkedListTree;

    import org.antlr.runtime.*;
        

    public class E4XLexer extends Lexer {
        public static const EOF:int=-1;
        public static const T__20:int=20;
        public static const T__21:int=21;
        public static const T__22:int=22;
        public static const T__23:int=23;
        public static const T__24:int=24;
        public static const T__25:int=25;
        public static const T__26:int=26;
        public static const T__27:int=27;
        public static const XML_EMPTY_ELEMENT:int=4;
        public static const XML_ELEMENT:int=5;
        public static const XML_ATTRIBUTE:int=6;
        public static const XML_LIST:int=7;
        public static const XML_COMMENT:int=8;
        public static const XML_CDATA:int=9;
        public static const XML_PI:int=10;
        public static const XML_LCHEVRON:int=11;
        public static const XML_WS:int=12;
        public static const XML_TEXT:int=13;
        public static const XML_NAME:int=14;
        public static const XML_ATTRIBUTE_VALUE:int=15;
        public static const XML_NAME_START:int=16;
        public static const XML_NAME_PART:int=17;
        public static const UNICODE_LETTER:int=18;
        public static const UNICODE_DIGIT:int=19;

        // delegates
        // delegators

        public function E4XLexer(input:CharStream = null, state:RecognizerSharedState = null) {
            super(input, state);

            dfa9 = new DFA(this, 9,
                        "1:1: Tokens : ( T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | XML_LCHEVRON | XML_WS | XML_NAME | XML_ATTRIBUTE_VALUE | XML_PI | XML_COMMENT | XML_CDATA | XML_TEXT );",
                        DFA9_eot, DFA9_eof, DFA9_min,
                        DFA9_max, DFA9_accept, DFA9_special,
                        DFA9_transition, DFA9_specialStateTransition);


        }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g"; }

        // $ANTLR start T__20
        public final function mT__20():void {
            try {
                var _type:int = T__20;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:12:7: ( '/>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:12:9: '/>'
                {
                matchString("/>"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__20

        // $ANTLR start T__21
        public final function mT__21():void {
            try {
                var _type:int = T__21;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:13:7: ( '>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:13:9: '>'
                {
                match(62); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__21

        // $ANTLR start T__22
        public final function mT__22():void {
            try {
                var _type:int = T__22;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:14:7: ( '</' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:14:9: '</'
                {
                matchString("</"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__22

        // $ANTLR start T__23
        public final function mT__23():void {
            try {
                var _type:int = T__23;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:15:7: ( '{' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:15:9: '{'
                {
                match(123); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__23

        // $ANTLR start T__24
        public final function mT__24():void {
            try {
                var _type:int = T__24;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:16:7: ( '}' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:16:9: '}'
                {
                match(125); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__24

        // $ANTLR start T__25
        public final function mT__25():void {
            try {
                var _type:int = T__25;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:17:7: ( '=' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:17:9: '='
                {
                match(61); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__25

        // $ANTLR start T__26
        public final function mT__26():void {
            try {
                var _type:int = T__26;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:18:7: ( '<>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:18:9: '<>'
                {
                matchString("<>"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__26

        // $ANTLR start T__27
        public final function mT__27():void {
            try {
                var _type:int = T__27;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:19:7: ( '</>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:19:9: '</>'
                {
                matchString("</>"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end T__27

        // $ANTLR start XML_LCHEVRON
        public final function mXML_LCHEVRON():void {
            try {
                var _type:int = XML_LCHEVRON;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:166:15: ( '<' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:166:17: '<'
                {
                match(60); 

                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_LCHEVRON

        // $ANTLR start XML_WS
        public final function mXML_WS():void {
            try {
                var _type:int = XML_WS;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:168:10: ( ( ' ' | '\\t' | '\\n' | '\\r' )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:168:12: ( ' ' | '\\t' | '\\n' | '\\r' )+
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:168:12: ( ' ' | '\\t' | '\\n' | '\\r' )+
                var cnt1:int=0;
                loop1:
                do {
                    var alt1:int=2;
                    var LA1_0:int = input.LA(1);

                    if ( ((LA1_0>=9 && LA1_0<=10)||LA1_0==13||LA1_0==32) ) {
                        alt1=1;
                    }


                    switch (alt1) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                	    {
                	    if ( (input.LA(1)>=9 && input.LA(1)<=10)||input.LA(1)==13||input.LA(1)==32 ) {
                	        input.consume();

                	    }
                	    else {
                	        throw recover(new MismatchedSetException(null,input));
                	    }


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
        // $ANTLR end XML_WS

        // $ANTLR start XML_NAME
        public final function mXML_NAME():void {
            try {
                var _type:int = XML_NAME;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:170:11: ( XML_NAME_START ( XML_NAME_PART )* )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:170:13: XML_NAME_START ( XML_NAME_PART )*
                {
                mXML_NAME_START(); 
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:170:28: ( XML_NAME_PART )*
                loop2:
                do {
                    var alt2:int=2;
                    var LA2_0:int = input.LA(1);

                    if ( ((LA2_0>=45 && LA2_0<=46)||(LA2_0>=48 && LA2_0<=58)||(LA2_0>=65 && LA2_0<=90)||LA2_0==95||(LA2_0>=97 && LA2_0<=122)) ) {
                        alt2=1;
                    }


                    switch (alt2) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:170:28: XML_NAME_PART
                	    {
                	    mXML_NAME_PART(); 

                	    }
                	    break;

                	default :
                	    break loop2;
                    }
                } while (true);


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_NAME

        // $ANTLR start XML_ATTRIBUTE_VALUE
        public final function mXML_ATTRIBUTE_VALUE():void {
            try {
                var _type:int = XML_ATTRIBUTE_VALUE;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:174:2: ( '\\'' ( options {greedy=false; } : . )* '\\'' | '\"' ( options {greedy=false; } : . )* '\"' )
                var alt5:int=2;
                var LA5_0:int = input.LA(1);

                if ( (LA5_0==39) ) {
                    alt5=1;
                }
                else if ( (LA5_0==34) ) {
                    alt5=2;
                }
                else {
                    throw new NoViableAltException("", 5, 0, input);

                }
                switch (alt5) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:174:4: '\\'' ( options {greedy=false; } : . )* '\\''
                        {
                        match(39); 
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:174:9: ( options {greedy=false; } : . )*
                        loop3:
                        do {
                            var alt3:int=2;
                            var LA3_0:int = input.LA(1);

                            if ( (LA3_0==39) ) {
                                alt3=2;
                            }
                            else if ( ((LA3_0>=0 && LA3_0<=38)||(LA3_0>=40 && LA3_0<=65535)) ) {
                                alt3=1;
                            }


                            switch (alt3) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:174:37: .
                        	    {
                        	    matchAny(); 

                        	    }
                        	    break;

                        	default :
                        	    break loop3;
                            }
                        } while (true);

                        match(39); 

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:175:4: '\"' ( options {greedy=false; } : . )* '\"'
                        {
                        match(34); 
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:175:8: ( options {greedy=false; } : . )*
                        loop4:
                        do {
                            var alt4:int=2;
                            var LA4_0:int = input.LA(1);

                            if ( (LA4_0==34) ) {
                                alt4=2;
                            }
                            else if ( ((LA4_0>=0 && LA4_0<=33)||(LA4_0>=35 && LA4_0<=65535)) ) {
                                alt4=1;
                            }


                            switch (alt4) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:175:36: .
                        	    {
                        	    matchAny(); 

                        	    }
                        	    break;

                        	default :
                        	    break loop4;
                            }
                        } while (true);

                        match(34); 

                        }
                        break;

                }
                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_ATTRIBUTE_VALUE

        // $ANTLR start XML_PI
        public final function mXML_PI():void {
            try {
                var _type:int = XML_PI;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:180:10: ( '<?' ( options {greedy=false; } : . )* '?>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:180:12: '<?' ( options {greedy=false; } : . )* '?>'
                {
                matchString("<?"); 

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:180:17: ( options {greedy=false; } : . )*
                loop6:
                do {
                    var alt6:int=2;
                    var LA6_0:int = input.LA(1);

                    if ( (LA6_0==63) ) {
                        var LA6_1:int = input.LA(2);

                        if ( (LA6_1==62) ) {
                            alt6=2;
                        }
                        else if ( ((LA6_1>=0 && LA6_1<=61)||(LA6_1>=63 && LA6_1<=65535)) ) {
                            alt6=1;
                        }


                    }
                    else if ( ((LA6_0>=0 && LA6_0<=62)||(LA6_0>=64 && LA6_0<=65535)) ) {
                        alt6=1;
                    }


                    switch (alt6) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:180:45: .
                	    {
                	    matchAny(); 

                	    }
                	    break;

                	default :
                	    break loop6;
                    }
                } while (true);

                matchString("?>"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_PI

        // $ANTLR start XML_COMMENT
        public final function mXML_COMMENT():void {
            try {
                var _type:int = XML_COMMENT;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:183:14: ( '<!--' ( options {greedy=false; } : . )* '-->' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:183:16: '<!--' ( options {greedy=false; } : . )* '-->'
                {
                matchString("<!--"); 

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:183:23: ( options {greedy=false; } : . )*
                loop7:
                do {
                    var alt7:int=2;
                    var LA7_0:int = input.LA(1);

                    if ( (LA7_0==45) ) {
                        var LA7_1:int = input.LA(2);

                        if ( (LA7_1==45) ) {
                            var LA7_3:int = input.LA(3);

                            if ( (LA7_3==62) ) {
                                alt7=2;
                            }
                            else if ( ((LA7_3>=0 && LA7_3<=61)||(LA7_3>=63 && LA7_3<=65535)) ) {
                                alt7=1;
                            }


                        }
                        else if ( ((LA7_1>=0 && LA7_1<=44)||(LA7_1>=46 && LA7_1<=65535)) ) {
                            alt7=1;
                        }


                    }
                    else if ( ((LA7_0>=0 && LA7_0<=44)||(LA7_0>=46 && LA7_0<=65535)) ) {
                        alt7=1;
                    }


                    switch (alt7) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:183:51: .
                	    {
                	    matchAny(); 

                	    }
                	    break;

                	default :
                	    break loop7;
                    }
                } while (true);

                matchString("-->"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_COMMENT

        // $ANTLR start XML_CDATA
        public final function mXML_CDATA():void {
            try {
                var _type:int = XML_CDATA;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:185:12: ( '<![CDATA[' ( options {greedy=false; } : . )* ']]>' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:185:14: '<![CDATA[' ( options {greedy=false; } : . )* ']]>'
                {
                matchString("<![CDATA["); 

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:185:26: ( options {greedy=false; } : . )*
                loop8:
                do {
                    var alt8:int=2;
                    var LA8_0:int = input.LA(1);

                    if ( (LA8_0==93) ) {
                        var LA8_1:int = input.LA(2);

                        if ( (LA8_1==93) ) {
                            var LA8_3:int = input.LA(3);

                            if ( (LA8_3==62) ) {
                                alt8=2;
                            }
                            else if ( ((LA8_3>=0 && LA8_3<=61)||(LA8_3>=63 && LA8_3<=65535)) ) {
                                alt8=1;
                            }


                        }
                        else if ( ((LA8_1>=0 && LA8_1<=92)||(LA8_1>=94 && LA8_1<=65535)) ) {
                            alt8=1;
                        }


                    }
                    else if ( ((LA8_0>=0 && LA8_0<=92)||(LA8_0>=94 && LA8_0<=65535)) ) {
                        alt8=1;
                    }


                    switch (alt8) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:185:54: .
                	    {
                	    matchAny(); 

                	    }
                	    break;

                	default :
                	    break loop8;
                    }
                } while (true);

                matchString("]]>"); 


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_CDATA

        // $ANTLR start XML_NAME_START
        public final function mXML_NAME_START():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:187:25: ( UNICODE_LETTER | '_' | ':' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                {
                if ( input.LA(1)==58||(input.LA(1)>=65 && input.LA(1)<=90)||input.LA(1)==95||(input.LA(1)>=97 && input.LA(1)<=122) ) {
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
        // $ANTLR end XML_NAME_START

        // $ANTLR start XML_NAME_PART
        public final function mXML_NAME_PART():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:188:24: ( UNICODE_LETTER | UNICODE_DIGIT | '.' | '-' | '_' | ':' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                {
                if ( (input.LA(1)>=45 && input.LA(1)<=46)||(input.LA(1)>=48 && input.LA(1)<=58)||(input.LA(1)>=65 && input.LA(1)<=90)||input.LA(1)==95||(input.LA(1)>=97 && input.LA(1)<=122) ) {
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
        // $ANTLR end XML_NAME_PART

        // $ANTLR start UNICODE_LETTER
        public final function mUNICODE_LETTER():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:191:25: ( 'a' .. 'z' | 'A' .. 'Z' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                {
                if ( (input.LA(1)>=65 && input.LA(1)<=90)||(input.LA(1)>=97 && input.LA(1)<=122) ) {
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
        // $ANTLR end UNICODE_LETTER

        // $ANTLR start UNICODE_DIGIT
        public final function mUNICODE_DIGIT():void {
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:192:24: ( '0' .. '9' )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:192:26: '0' .. '9'
                {
                matchRange(48,57); 

                }

            }
            finally {
            }
        }
        // $ANTLR end UNICODE_DIGIT

        // $ANTLR start XML_TEXT
        public final function mXML_TEXT():void {
            try {
                var _type:int = XML_TEXT;
                var _channel:int = DEFAULT_TOKEN_CHANNEL;
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:195:2: ( (~ ( XML_LCHEVRON | '{' ) ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:195:4: (~ ( XML_LCHEVRON | '{' ) )
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:195:4: (~ ( XML_LCHEVRON | '{' ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:195:5: ~ ( XML_LCHEVRON | '{' )
                {
                if ( (input.LA(1)>=0 && input.LA(1)<=59)||(input.LA(1)>=61 && input.LA(1)<=122)||(input.LA(1)>=124 && input.LA(1)<=65535) ) {
                    input.consume();

                }
                else {
                    throw recover(new MismatchedSetException(null,input));
                }


                }


                }

                this.state.type = _type;
                this.state.channel = _channel;
            }
            finally {
            }
        }
        // $ANTLR end XML_TEXT

        public override function mTokens():void {
            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:8: ( T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | T__27 | XML_LCHEVRON | XML_WS | XML_NAME | XML_ATTRIBUTE_VALUE | XML_PI | XML_COMMENT | XML_CDATA | XML_TEXT )
            var alt9:int=16;
            alt9 = dfa9.predict(input);
            switch (alt9) {
                case 1 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:10: T__20
                    {
                    mT__20(); 

                    }
                    break;
                case 2 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:16: T__21
                    {
                    mT__21(); 

                    }
                    break;
                case 3 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:22: T__22
                    {
                    mT__22(); 

                    }
                    break;
                case 4 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:28: T__23
                    {
                    mT__23(); 

                    }
                    break;
                case 5 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:34: T__24
                    {
                    mT__24(); 

                    }
                    break;
                case 6 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:40: T__25
                    {
                    mT__25(); 

                    }
                    break;
                case 7 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:46: T__26
                    {
                    mT__26(); 

                    }
                    break;
                case 8 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:52: T__27
                    {
                    mT__27(); 

                    }
                    break;
                case 9 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:58: XML_LCHEVRON
                    {
                    mXML_LCHEVRON(); 

                    }
                    break;
                case 10 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:71: XML_WS
                    {
                    mXML_WS(); 

                    }
                    break;
                case 11 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:78: XML_NAME
                    {
                    mXML_NAME(); 

                    }
                    break;
                case 12 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:87: XML_ATTRIBUTE_VALUE
                    {
                    mXML_ATTRIBUTE_VALUE(); 

                    }
                    break;
                case 13 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:107: XML_PI
                    {
                    mXML_PI(); 

                    }
                    break;
                case 14 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:114: XML_COMMENT
                    {
                    mXML_COMMENT(); 

                    }
                    break;
                case 15 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:126: XML_CDATA
                    {
                    mXML_CDATA(); 

                    }
                    break;
                case 16 :
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:1:136: XML_TEXT
                    {
                    mXML_TEXT(); 

                    }
                    break;

            }

        }



        private const DFA9_eot:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x0b\x01\u80ff\xff"+
            "\x01\x12\x05\u80ff\xff\x02\x0b\x03\u80ff\xff\x01\x19\x0d\u80ff\xff");
        private const DFA9_eof:Array =
            DFA.unpackEncodedString("\x1c\u80ff\xff");
        private const DFA9_min:Array =
            DFA.unpackEncodedString("\x01\x00\x01\x3e\x01\u80ff\xff\x01"+
            "\x21\x05\u80ff\xff\x02\x00\x03\u80ff\xff\x01\x3e\x02\u80ff\xff"+
            "\x01\x2d\x0a\u80ff\xff", true);
        private const DFA9_max:Array =
            DFA.unpackEncodedString("\x01\u80ff\xff\x01\x3e\x01\u80ff\xff"+
            "\x01\x3f\x05\u80ff\xff\x02\u80ff\xff\x03\u80ff\xff\x01\x3e\x02"+
            "\u80ff\xff\x01\x5b\x0a\u80ff\xff", true);
        private const DFA9_accept:Array =
            DFA.unpackEncodedString("\x02\u80ff\xff\x01\x02\x01\u80ff\xff"+
            "\x01\x04\x01\x05\x01\x06\x01\x0a\x01\x0b\x02\u80ff\xff\x01\x10"+
            "\x01\x01\x01\x02\x01\u80ff\xff\x01\x07\x01\x0d\x01\u80ff\xff"+
            "\x01\x09\x01\x05\x01\x06\x01\x0a\x01\x0b\x01\x0c\x01\x08\x01"+
            "\x03\x01\x0e\x01\x0f");
        private const DFA9_special:Array =
            DFA.unpackEncodedString("\x01\x00\x08\u80ff\xff\x01\x01\x01"+
            "\x02\x11\u80ff\xff");
        private const DFA9_transition:Array = [
                DFA.unpackEncodedString("\x09\x0b\x02\x07\x02\x0b\x01\x07"+
                "\x12\x0b\x01\x07\x01\x0b\x01\x0a\x04\x0b\x01\x09\x07\x0b"+
                "\x01\x01\x0a\x0b\x01\x08\x01\x0b\x01\x03\x01\x06\x01\x02"+
                "\x02\x0b\x1a\x08\x04\x0b\x01\x08\x01\x0b\x1a\x08\x01\x04"+
                "\x01\x0b\x01\x05\u80ff\x82\x0b"),
                DFA.unpackEncodedString("\x01\x0c"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x11\x0d\u80ff\xff\x01\x0e"+
                "\x0e\u80ff\xff\x01\x0f\x01\x10"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x00\x17"),
                DFA.unpackEncodedString("\x00\x17"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x18"),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString(""),
                DFA.unpackEncodedString("\x01\x1a\x2d\u80ff\xff\x01\x1b"),
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
            private function DFA9_specialStateTransition(dfa:DFA, s:int, _input:IntStream):int {
                var input:IntStream = _input;
            	var _s:int = s;
                switch ( s ) {
                        case 0 : 
                            var LA9_0:int = input.LA(1);

                            s = -1;
                            if ( (LA9_0==47) ) {s = 1;}

                            else if ( (LA9_0==62) ) {s = 2;}

                            else if ( (LA9_0==60) ) {s = 3;}

                            else if ( (LA9_0==123) ) {s = 4;}

                            else if ( (LA9_0==125) ) {s = 5;}

                            else if ( (LA9_0==61) ) {s = 6;}

                            else if ( ((LA9_0>=9 && LA9_0<=10)||LA9_0==13||LA9_0==32) ) {s = 7;}

                            else if ( (LA9_0==58||(LA9_0>=65 && LA9_0<=90)||LA9_0==95||(LA9_0>=97 && LA9_0<=122)) ) {s = 8;}

                            else if ( (LA9_0==39) ) {s = 9;}

                            else if ( (LA9_0==34) ) {s = 10;}

                            else if ( ((LA9_0>=0 && LA9_0<=8)||(LA9_0>=11 && LA9_0<=12)||(LA9_0>=14 && LA9_0<=31)||LA9_0==33||(LA9_0>=35 && LA9_0<=38)||(LA9_0>=40 && LA9_0<=46)||(LA9_0>=48 && LA9_0<=57)||LA9_0==59||(LA9_0>=63 && LA9_0<=64)||(LA9_0>=91 && LA9_0<=94)||LA9_0==96||LA9_0==124||(LA9_0>=126 && LA9_0<=65535)) ) {s = 11;}

                            if ( s>=0 ) return s;
                            break;
                        case 1 : 
                            var LA9_9:int = input.LA(1);

                            s = -1;
                            if ( ((LA9_9>=0 && LA9_9<=65535)) ) {s = 23;}

                            else s = 11;

                            if ( s>=0 ) return s;
                            break;
                        case 2 : 
                            var LA9_10:int = input.LA(1);

                            s = -1;
                            if ( ((LA9_10>=0 && LA9_10<=65535)) ) {s = 23;}

                            else s = 11;

                            if ( s>=0 ) return s;
                            break;
                }
                throw dfa.error(new NoViableAltException(dfa.description, 9, _s, input));
            }

        protected var dfa9:DFA;  // initialized in constructor
     

    }
}