// $ANTLR 3.3 Nov 30, 2010 12:45:30 C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g 2011-06-21 08:05:32
package org.as3commons.asblocks.parser.antlr.e4x {

    import org.as3commons.asblocks.parser.antlr.LinkedListTree;

    import org.antlr.runtime.*;
        

    import org.antlr.runtime.tree.*;


    public class E4XParser extends Parser {
        public static const tokenNames:Array = [
            "<invalid>", "<EOR>", "<DOWN>", "<UP>", "XML_EMPTY_ELEMENT", "XML_ELEMENT", "XML_ATTRIBUTE", "XML_LIST", "XML_COMMENT", "XML_CDATA", "XML_PI", "XML_LCHEVRON", "XML_WS", "XML_TEXT", "XML_NAME", "XML_ATTRIBUTE_VALUE", "XML_NAME_START", "XML_NAME_PART", "UNICODE_LETTER", "UNICODE_DIGIT", "'/>'", "'>'", "'</'", "'{'", "'}'", "'='", "'<>'", "'</>'"
        ];
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


            public function E4XParser(input:TokenStream, state:RecognizerSharedState = null) {
                super(input, state);
            }
            
        protected var adaptor:TreeAdaptor = new CommonTreeAdaptor();

        override public function set treeAdaptor(adaptor:TreeAdaptor):void {
            this.adaptor = adaptor;
        }
        override public function get treeAdaptor():TreeAdaptor {
            return adaptor;
        }

        public override function get tokenNames():Array { return E4XParser.tokenNames; }
        public override function get grammarFileName():String { return "C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g"; }


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


        // $ANTLR start xmlMarkup
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:84:1: xmlMarkup : ( XML_COMMENT | XML_CDATA | XML_PI );
        public final function xmlMarkup():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set1:Token=null;

            var set1_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:85:2: ( XML_COMMENT | XML_CDATA | XML_PI )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set1=Token(input.LT(1));
                if ( (input.LA(1)>=8 && input.LA(1)<=10) ) {
                    input.consume();
                    adaptor.addChild(root_0, LinkedListTree(adaptor.create(set1)));
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
        // $ANTLR end xmlMarkup

        // $ANTLR start xmlPrimary
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:91:1: xmlPrimary : ( xmlInitialiser | xmlListInitialiser );
        public final function xmlPrimary():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var xmlInitialiser2:ParserRuleReturnScope = null;

            var xmlListInitialiser3:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:92:2: ( xmlInitialiser | xmlListInitialiser )
                var alt1:int=2;
                var LA1_0:int = input.LA(1);

                if ( ((LA1_0>=8 && LA1_0<=11)) ) {
                    alt1=1;
                }
                else if ( (LA1_0==26) ) {
                    alt1=2;
                }
                else {
                    throw new NoViableAltException("", 1, 0, input);

                }
                switch (alt1) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:92:4: xmlInitialiser
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlInitialiser_in_xmlPrimary143);
                        xmlInitialiser2=xmlInitialiser();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlInitialiser2.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:93:4: xmlListInitialiser
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlListInitialiser_in_xmlPrimary148);
                        xmlListInitialiser3=xmlListInitialiser();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlListInitialiser3.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlPrimary

        // $ANTLR start xmlInitialiser
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:96:1: xmlInitialiser : ( xmlMarkup | xmlElement );
        public final function xmlInitialiser():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var xmlMarkup4:ParserRuleReturnScope = null;

            var xmlElement5:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:97:2: ( xmlMarkup | xmlElement )
                var alt2:int=2;
                var LA2_0:int = input.LA(1);

                if ( ((LA2_0>=8 && LA2_0<=10)) ) {
                    alt2=1;
                }
                else if ( (LA2_0==11) ) {
                    alt2=2;
                }
                else {
                    throw new NoViableAltException("", 2, 0, input);

                }
                switch (alt2) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:97:4: xmlMarkup
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlMarkup_in_xmlInitialiser159);
                        xmlMarkup4=xmlMarkup();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlMarkup4.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:98:4: xmlElement
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlElement_in_xmlInitialiser164);
                        xmlElement5=xmlElement();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlElement5.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlInitialiser

        // $ANTLR start xmlElement
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:101:1: xmlElement : ( XML_LCHEVRON xmlTagContent ( XML_WS )? -> xmlTagContent ) ( '/>' -> ^( XML_EMPTY_ELEMENT $xmlElement) | '>' ( xmlElementContent )* '</' xmlTagName ( XML_WS )? '>' -> ^( XML_ELEMENT $xmlElement ( xmlElementContent )* ) ) ;
        public final function xmlElement():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var XML_LCHEVRON6:Token=null;
            var XML_WS8:Token=null;
            var string_literal9:Token=null;
            var char_literal10:Token=null;
            var string_literal12:Token=null;
            var XML_WS14:Token=null;
            var char_literal15:Token=null;
            var xmlTagContent7:ParserRuleReturnScope = null;

            var xmlElementContent11:ParserRuleReturnScope = null;

            var xmlTagName13:ParserRuleReturnScope = null;


            var XML_LCHEVRON6_tree:LinkedListTree=null;
            var XML_WS8_tree:LinkedListTree=null;
            var string_literal9_tree:LinkedListTree=null;
            var char_literal10_tree:LinkedListTree=null;
            var string_literal12_tree:LinkedListTree=null;
            var XML_WS14_tree:LinkedListTree=null;
            var char_literal15_tree:LinkedListTree=null;
            var stream_21:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 21");
            var stream_20:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 20");
            var stream_XML_LCHEVRON:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token XML_LCHEVRON");
            var stream_22:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 22");
            var stream_XML_WS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token XML_WS");
            var stream_xmlTagName:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlTagName");
            var stream_xmlTagContent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlTagContent");
            var stream_xmlElementContent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlElementContent");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:2: ( ( XML_LCHEVRON xmlTagContent ( XML_WS )? -> xmlTagContent ) ( '/>' -> ^( XML_EMPTY_ELEMENT $xmlElement) | '>' ( xmlElementContent )* '</' xmlTagName ( XML_WS )? '>' -> ^( XML_ELEMENT $xmlElement ( xmlElementContent )* ) ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:4: ( XML_LCHEVRON xmlTagContent ( XML_WS )? -> xmlTagContent ) ( '/>' -> ^( XML_EMPTY_ELEMENT $xmlElement) | '>' ( xmlElementContent )* '</' xmlTagName ( XML_WS )? '>' -> ^( XML_ELEMENT $xmlElement ( xmlElementContent )* ) )
                {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:4: ( XML_LCHEVRON xmlTagContent ( XML_WS )? -> xmlTagContent )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:5: XML_LCHEVRON xmlTagContent ( XML_WS )?
                {
                XML_LCHEVRON6=Token(matchStream(input,XML_LCHEVRON,FOLLOW_XML_LCHEVRON_in_xmlElement176));  
                stream_XML_LCHEVRON.add(XML_LCHEVRON6);

                pushFollow(FOLLOW_xmlTagContent_in_xmlElement178);
                xmlTagContent7=xmlTagContent();

                state._fsp = state._fsp - 1;

                stream_xmlTagContent.add(xmlTagContent7.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:32: ( XML_WS )?
                var alt3:int=2;
                var LA3_0:int = input.LA(1);

                if ( (LA3_0==12) ) {
                    alt3=1;
                }
                switch (alt3) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:102:32: XML_WS
                        {
                        XML_WS8=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlElement180));  
                        stream_XML_WS.add(XML_WS8);


                        }
                        break;

                }



                // AST REWRITE
                // elements: xmlTagContent
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 102:40: -> xmlTagContent
                {
                    adaptor.addChild(root_0, stream_xmlTagContent.nextTree());

                }

                retval.tree = root_0;
                }

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:103:3: ( '/>' -> ^( XML_EMPTY_ELEMENT $xmlElement) | '>' ( xmlElementContent )* '</' xmlTagName ( XML_WS )? '>' -> ^( XML_ELEMENT $xmlElement ( xmlElementContent )* ) )
                var alt6:int=2;
                var LA6_0:int = input.LA(1);

                if ( (LA6_0==20) ) {
                    alt6=1;
                }
                else if ( (LA6_0==21) ) {
                    alt6=2;
                }
                else {
                    throw new NoViableAltException("", 6, 0, input);

                }
                switch (alt6) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:104:4: '/>'
                        {
                        string_literal9=Token(matchStream(input,20,FOLLOW_20_in_xmlElement195));  
                        stream_20.add(string_literal9);



                        // AST REWRITE
                        // elements: xmlElement
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 105:4: -> ^( XML_EMPTY_ELEMENT $xmlElement)
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:105:7: ^( XML_EMPTY_ELEMENT $xmlElement)
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(XML_EMPTY_ELEMENT, "XML_EMPTY_ELEMENT")), root_1));

                            adaptor.addChild(root_1, stream_retval.nextTree());

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;
                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:107:6: '>' ( xmlElementContent )* '</' xmlTagName ( XML_WS )? '>'
                        {
                        char_literal10=Token(matchStream(input,21,FOLLOW_21_in_xmlElement215));  
                        stream_21.add(char_literal10);

                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:107:10: ( xmlElementContent )*
                        loop4:
                        do {
                            var alt4:int=2;
                            var LA4_0:int = input.LA(1);

                            if ( ((LA4_0>=8 && LA4_0<=14)||LA4_0==23) ) {
                                alt4=1;
                            }


                            switch (alt4) {
                        	case 1 :
                        	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:107:10: xmlElementContent
                        	    {
                        	    pushFollow(FOLLOW_xmlElementContent_in_xmlElement217);
                        	    xmlElementContent11=xmlElementContent();

                        	    state._fsp = state._fsp - 1;

                        	    stream_xmlElementContent.add(xmlElementContent11.tree);

                        	    }
                        	    break;

                        	default :
                        	    break loop4;
                            }
                        } while (true);

                        string_literal12=Token(matchStream(input,22,FOLLOW_22_in_xmlElement220));  
                        stream_22.add(string_literal12);

                        pushFollow(FOLLOW_xmlTagName_in_xmlElement222);
                        xmlTagName13=xmlTagName();

                        state._fsp = state._fsp - 1;

                        stream_xmlTagName.add(xmlTagName13.tree);
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:107:45: ( XML_WS )?
                        var alt5:int=2;
                        var LA5_0:int = input.LA(1);

                        if ( (LA5_0==12) ) {
                            alt5=1;
                        }
                        switch (alt5) {
                            case 1 :
                                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:107:45: XML_WS
                                {
                                XML_WS14=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlElement224));  
                                stream_XML_WS.add(XML_WS14);


                                }
                                break;

                        }

                        char_literal15=Token(matchStream(input,21,FOLLOW_21_in_xmlElement227));  
                        stream_21.add(char_literal15);



                        // AST REWRITE
                        // elements: xmlElementContent, xmlElement
                        // token labels: 
                        // rule labels: retval
                        // token list labels: 
                        // rule list labels: 
                        retval.tree = root_0;
                        var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                        root_0 = LinkedListTree(adaptor.nil());
                        // 108:4: -> ^( XML_ELEMENT $xmlElement ( xmlElementContent )* )
                        {
                            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:108:7: ^( XML_ELEMENT $xmlElement ( xmlElementContent )* )
                            {
                            var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                            root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(XML_ELEMENT, "XML_ELEMENT")), root_1));

                            adaptor.addChild(root_1, stream_retval.nextTree());
                            // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:108:33: ( xmlElementContent )*
                            while ( stream_xmlElementContent.hasNext ) {
                                adaptor.addChild(root_1, stream_xmlElementContent.nextTree());

                            }
                            stream_xmlElementContent.reset();

                            adaptor.addChild(root_0, root_1);
                            }

                        }

                        retval.tree = root_0;
                        }
                        break;

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
        // $ANTLR end xmlElement

        // $ANTLR start xmlTagContent
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:112:1: xmlTagContent : xmlTagName ( xmlAttributes )? ;
        public final function xmlTagContent():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var xmlTagName16:ParserRuleReturnScope = null;

            var xmlAttributes17:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:113:2: ( xmlTagName ( xmlAttributes )? )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:113:4: xmlTagName ( xmlAttributes )?
                {
                root_0 = LinkedListTree(adaptor.nil());

                pushFollow(FOLLOW_xmlTagName_in_xmlTagContent257);
                xmlTagName16=xmlTagName();

                state._fsp = state._fsp - 1;

                adaptor.addChild(root_0, xmlTagName16.tree);
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:113:15: ( xmlAttributes )?
                var alt7:int=2;
                var LA7_0:int = input.LA(1);

                if ( (LA7_0==12) ) {
                    var LA7_1:int = input.LA(2);

                    if ( (LA7_1==14||LA7_1==23) ) {
                        alt7=1;
                    }
                }
                switch (alt7) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:113:15: xmlAttributes
                        {
                        pushFollow(FOLLOW_xmlAttributes_in_xmlTagContent259);
                        xmlAttributes17=xmlAttributes();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlAttributes17.tree);

                        }
                        break;

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
        // $ANTLR end xmlTagContent

        // $ANTLR start xmlEmbeddedExpression
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:116:1: xmlEmbeddedExpression : '{' expression '}' -> expression ;
        public final function xmlEmbeddedExpression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var char_literal18:Token=null;
            var char_literal20:Token=null;
            var expression19:ParserRuleReturnScope = null;


            var char_literal18_tree:LinkedListTree=null;
            var char_literal20_tree:LinkedListTree=null;
            var stream_23:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 23");
            var stream_24:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 24");
            var stream_expression:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule expression");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:117:2: ( '{' expression '}' -> expression )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:117:4: '{' expression '}'
                {
                char_literal18=Token(matchStream(input,23,FOLLOW_23_in_xmlEmbeddedExpression271));  
                stream_23.add(char_literal18);

                pushFollow(FOLLOW_expression_in_xmlEmbeddedExpression273);
                expression19=expression();

                state._fsp = state._fsp - 1;

                stream_expression.add(expression19.tree);
                char_literal20=Token(matchStream(input,24,FOLLOW_24_in_xmlEmbeddedExpression275));  
                stream_24.add(char_literal20);



                // AST REWRITE
                // elements: expression
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 117:23: -> expression
                {
                    adaptor.addChild(root_0, stream_expression.nextTree());

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
        // $ANTLR end xmlEmbeddedExpression

        // $ANTLR start expression
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:121:1: expression : ( xmlText | xmlEmbeddedExpression )+ ;
        public final function expression():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var xmlText21:ParserRuleReturnScope = null;

            var xmlEmbeddedExpression22:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:122:2: ( ( xmlText | xmlEmbeddedExpression )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:122:4: ( xmlText | xmlEmbeddedExpression )+
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:122:4: ( xmlText | xmlEmbeddedExpression )+
                var cnt8:int=0;
                loop8:
                do {
                    var alt8:int=3;
                    var LA8_0:int = input.LA(1);

                    if ( ((LA8_0>=12 && LA8_0<=14)) ) {
                        alt8=1;
                    }
                    else if ( (LA8_0==23) ) {
                        alt8=2;
                    }


                    switch (alt8) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:123:4: xmlText
                	    {
                	    pushFollow(FOLLOW_xmlText_in_expression296);
                	    xmlText21=xmlText();

                	    state._fsp = state._fsp - 1;

                	    adaptor.addChild(root_0, xmlText21.tree);

                	    }
                	    break;
                	case 2 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:124:5: xmlEmbeddedExpression
                	    {
                	    pushFollow(FOLLOW_xmlEmbeddedExpression_in_expression302);
                	    xmlEmbeddedExpression22=xmlEmbeddedExpression();

                	    state._fsp = state._fsp - 1;

                	    adaptor.addChild(root_0, xmlEmbeddedExpression22.tree);

                	    }
                	    break;

                	default :
                	    if ( cnt8 >= 1 ) break loop8;
                            throw new EarlyExitException(8, input);

                    }
                    cnt8++;
                } while (true);


                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end expression

        // $ANTLR start xmlText
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:128:1: xmlText : ( XML_TEXT | XML_NAME | XML_WS );
        public final function xmlText():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var set23:Token=null;

            var set23_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:129:2: ( XML_TEXT | XML_NAME | XML_WS )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:
                {
                root_0 = LinkedListTree(adaptor.nil());

                set23=Token(input.LT(1));
                if ( (input.LA(1)>=12 && input.LA(1)<=14) ) {
                    input.consume();
                    adaptor.addChild(root_0, LinkedListTree(adaptor.create(set23)));
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
        // $ANTLR end xmlText

        // $ANTLR start xmlTagName
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:132:1: xmlTagName : ( xmlEmbeddedExpression | XML_NAME );
        public final function xmlTagName():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var XML_NAME25:Token=null;
            var xmlEmbeddedExpression24:ParserRuleReturnScope = null;


            var XML_NAME25_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:133:2: ( xmlEmbeddedExpression | XML_NAME )
                var alt9:int=2;
                var LA9_0:int = input.LA(1);

                if ( (LA9_0==23) ) {
                    alt9=1;
                }
                else if ( (LA9_0==14) ) {
                    alt9=2;
                }
                else {
                    throw new NoViableAltException("", 9, 0, input);

                }
                switch (alt9) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:133:4: xmlEmbeddedExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlEmbeddedExpression_in_xmlTagName337);
                        xmlEmbeddedExpression24=xmlEmbeddedExpression();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlEmbeddedExpression24.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:134:4: XML_NAME
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        XML_NAME25=Token(matchStream(input,XML_NAME,FOLLOW_XML_NAME_in_xmlTagName342)); 
                        XML_NAME25_tree = LinkedListTree(adaptor.create(XML_NAME25));
                        adaptor.addChild(root_0, XML_NAME25_tree);


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlTagName

        // $ANTLR start xmlAttributes
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:137:1: xmlAttributes : ( XML_WS xmlEmbeddedExpression | xmlAttribute )+ ;
        public final function xmlAttributes():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var XML_WS26:Token=null;
            var xmlEmbeddedExpression27:ParserRuleReturnScope = null;

            var xmlAttribute28:ParserRuleReturnScope = null;


            var XML_WS26_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:138:2: ( ( XML_WS xmlEmbeddedExpression | xmlAttribute )+ )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:138:4: ( XML_WS xmlEmbeddedExpression | xmlAttribute )+
                {
                root_0 = LinkedListTree(adaptor.nil());

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:138:4: ( XML_WS xmlEmbeddedExpression | xmlAttribute )+
                var cnt10:int=0;
                loop10:
                do {
                    var alt10:int=3;
                    var LA10_0:int = input.LA(1);

                    if ( (LA10_0==12) ) {
                        var LA10_1:int = input.LA(2);

                        if ( (LA10_1==14) ) {
                            alt10=2;
                        }
                        else if ( (LA10_1==23) ) {
                            alt10=1;
                        }


                    }


                    switch (alt10) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:139:4: XML_WS xmlEmbeddedExpression
                	    {
                	    XML_WS26=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlAttributes358)); 
                	    XML_WS26_tree = LinkedListTree(adaptor.create(XML_WS26));
                	    adaptor.addChild(root_0, XML_WS26_tree);

                	    pushFollow(FOLLOW_xmlEmbeddedExpression_in_xmlAttributes360);
                	    xmlEmbeddedExpression27=xmlEmbeddedExpression();

                	    state._fsp = state._fsp - 1;

                	    adaptor.addChild(root_0, xmlEmbeddedExpression27.tree);

                	    }
                	    break;
                	case 2 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:140:5: xmlAttribute
                	    {
                	    pushFollow(FOLLOW_xmlAttribute_in_xmlAttributes366);
                	    xmlAttribute28=xmlAttribute();

                	    state._fsp = state._fsp - 1;

                	    adaptor.addChild(root_0, xmlAttribute28.tree);

                	    }
                	    break;

                	default :
                	    if ( cnt10 >= 1 ) break loop10;
                            throw new EarlyExitException(10, input);

                    }
                    cnt10++;
                } while (true);


                }

                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlAttributes

        // $ANTLR start xmlAttribute
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:144:1: xmlAttribute : XML_WS XML_NAME ( XML_WS )? '=' ( XML_WS )? xmlAttributeValue -> ^( XML_ATTRIBUTE XML_NAME xmlAttributeValue ) ;
        public final function xmlAttribute():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var XML_WS29:Token=null;
            var XML_NAME30:Token=null;
            var XML_WS31:Token=null;
            var char_literal32:Token=null;
            var XML_WS33:Token=null;
            var xmlAttributeValue34:ParserRuleReturnScope = null;


            var XML_WS29_tree:LinkedListTree=null;
            var XML_NAME30_tree:LinkedListTree=null;
            var XML_WS31_tree:LinkedListTree=null;
            var char_literal32_tree:LinkedListTree=null;
            var XML_WS33_tree:LinkedListTree=null;
            var stream_25:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 25");
            var stream_XML_NAME:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token XML_NAME");
            var stream_XML_WS:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token XML_WS");
            var stream_xmlAttributeValue:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlAttributeValue");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:2: ( XML_WS XML_NAME ( XML_WS )? '=' ( XML_WS )? xmlAttributeValue -> ^( XML_ATTRIBUTE XML_NAME xmlAttributeValue ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:4: XML_WS XML_NAME ( XML_WS )? '=' ( XML_WS )? xmlAttributeValue
                {
                XML_WS29=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlAttribute382));  
                stream_XML_WS.add(XML_WS29);

                XML_NAME30=Token(matchStream(input,XML_NAME,FOLLOW_XML_NAME_in_xmlAttribute384));  
                stream_XML_NAME.add(XML_NAME30);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:20: ( XML_WS )?
                var alt11:int=2;
                var LA11_0:int = input.LA(1);

                if ( (LA11_0==12) ) {
                    alt11=1;
                }
                switch (alt11) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:20: XML_WS
                        {
                        XML_WS31=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlAttribute386));  
                        stream_XML_WS.add(XML_WS31);


                        }
                        break;

                }

                char_literal32=Token(matchStream(input,25,FOLLOW_25_in_xmlAttribute389));  
                stream_25.add(char_literal32);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:32: ( XML_WS )?
                var alt12:int=2;
                var LA12_0:int = input.LA(1);

                if ( (LA12_0==12) ) {
                    alt12=1;
                }
                switch (alt12) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:145:32: XML_WS
                        {
                        XML_WS33=Token(matchStream(input,XML_WS,FOLLOW_XML_WS_in_xmlAttribute391));  
                        stream_XML_WS.add(XML_WS33);


                        }
                        break;

                }

                pushFollow(FOLLOW_xmlAttributeValue_in_xmlAttribute394);
                xmlAttributeValue34=xmlAttributeValue();

                state._fsp = state._fsp - 1;

                stream_xmlAttributeValue.add(xmlAttributeValue34.tree);


                // AST REWRITE
                // elements: XML_NAME, xmlAttributeValue
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 146:3: -> ^( XML_ATTRIBUTE XML_NAME xmlAttributeValue )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:146:6: ^( XML_ATTRIBUTE XML_NAME xmlAttributeValue )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(XML_ATTRIBUTE, "XML_ATTRIBUTE")), root_1));

                    adaptor.addChild(root_1, stream_XML_NAME.nextNode());
                    adaptor.addChild(root_1, stream_xmlAttributeValue.nextTree());

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
        // $ANTLR end xmlAttribute

        // $ANTLR start xmlAttributeValue
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:149:1: xmlAttributeValue : ( xmlEmbeddedExpression | XML_ATTRIBUTE_VALUE );
        public final function xmlAttributeValue():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var XML_ATTRIBUTE_VALUE36:Token=null;
            var xmlEmbeddedExpression35:ParserRuleReturnScope = null;


            var XML_ATTRIBUTE_VALUE36_tree:LinkedListTree=null;

            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:150:2: ( xmlEmbeddedExpression | XML_ATTRIBUTE_VALUE )
                var alt13:int=2;
                var LA13_0:int = input.LA(1);

                if ( (LA13_0==23) ) {
                    alt13=1;
                }
                else if ( (LA13_0==15) ) {
                    alt13=2;
                }
                else {
                    throw new NoViableAltException("", 13, 0, input);

                }
                switch (alt13) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:150:4: xmlEmbeddedExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlEmbeddedExpression_in_xmlAttributeValue417);
                        xmlEmbeddedExpression35=xmlEmbeddedExpression();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlEmbeddedExpression35.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:151:4: XML_ATTRIBUTE_VALUE
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        XML_ATTRIBUTE_VALUE36=Token(matchStream(input,XML_ATTRIBUTE_VALUE,FOLLOW_XML_ATTRIBUTE_VALUE_in_xmlAttributeValue422)); 
                        XML_ATTRIBUTE_VALUE36_tree = LinkedListTree(adaptor.create(XML_ATTRIBUTE_VALUE36));
                        adaptor.addChild(root_0, XML_ATTRIBUTE_VALUE36_tree);


                        }
                        break;

                }
                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlAttributeValue

        // $ANTLR start xmlElementContent
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:154:1: xmlElementContent : ( xmlEmbeddedExpression | xmlMarkup | xmlText | xmlElement );
        public final function xmlElementContent():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var xmlEmbeddedExpression37:ParserRuleReturnScope = null;

            var xmlMarkup38:ParserRuleReturnScope = null;

            var xmlText39:ParserRuleReturnScope = null;

            var xmlElement40:ParserRuleReturnScope = null;



            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:155:2: ( xmlEmbeddedExpression | xmlMarkup | xmlText | xmlElement )
                var alt14:int=4;
                switch ( input.LA(1) ) {
                case 23:
                    {
                    alt14=1;
                    }
                    break;
                case XML_COMMENT:
                case XML_CDATA:
                case XML_PI:
                    {
                    alt14=2;
                    }
                    break;
                case XML_WS:
                case XML_TEXT:
                case XML_NAME:
                    {
                    alt14=3;
                    }
                    break;
                case XML_LCHEVRON:
                    {
                    alt14=4;
                    }
                    break;
                default:
                    throw new NoViableAltException("", 14, 0, input);

                }

                switch (alt14) {
                    case 1 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:155:4: xmlEmbeddedExpression
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlEmbeddedExpression_in_xmlElementContent433);
                        xmlEmbeddedExpression37=xmlEmbeddedExpression();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlEmbeddedExpression37.tree);

                        }
                        break;
                    case 2 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:156:4: xmlMarkup
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlMarkup_in_xmlElementContent438);
                        xmlMarkup38=xmlMarkup();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlMarkup38.tree);

                        }
                        break;
                    case 3 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:157:4: xmlText
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlText_in_xmlElementContent443);
                        xmlText39=xmlText();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlText39.tree);

                        }
                        break;
                    case 4 :
                        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:158:4: xmlElement
                        {
                        root_0 = LinkedListTree(adaptor.nil());

                        pushFollow(FOLLOW_xmlElement_in_xmlElementContent448);
                        xmlElement40=xmlElement();

                        state._fsp = state._fsp - 1;

                        adaptor.addChild(root_0, xmlElement40.tree);

                        }
                        break;

                }
                retval.stop = input.LT(-1);

                retval.tree = LinkedListTree(adaptor.rulePostProcessing(root_0));
                adaptor.setTokenBoundaries(retval.tree, Token(retval.start), Token(retval.stop));

            }
                 finally {
            }
            return retval;
        }
        // $ANTLR end xmlElementContent

        // $ANTLR start xmlListInitialiser
        // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:161:1: xmlListInitialiser : '<>' ( xmlElementContent )* '</>' -> ^( XML_LIST ( xmlElementContent )* ) ;
        public final function xmlListInitialiser():ParserRuleReturnScope {
            var retval:ParserRuleReturnScope = new ParserRuleReturnScope();
            retval.start = input.LT(1);

            var root_0:LinkedListTree = null;

            var string_literal41:Token=null;
            var string_literal43:Token=null;
            var xmlElementContent42:ParserRuleReturnScope = null;


            var string_literal41_tree:LinkedListTree=null;
            var string_literal43_tree:LinkedListTree=null;
            var stream_26:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 26");
            var stream_27:RewriteRuleTokenStream=new RewriteRuleTokenStream(adaptor,"token 27");
            var stream_xmlElementContent:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule xmlElementContent");
            try {
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:162:2: ( '<>' ( xmlElementContent )* '</>' -> ^( XML_LIST ( xmlElementContent )* ) )
                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:162:4: '<>' ( xmlElementContent )* '</>'
                {
                string_literal41=Token(matchStream(input,26,FOLLOW_26_in_xmlListInitialiser459));  
                stream_26.add(string_literal41);

                // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:162:9: ( xmlElementContent )*
                loop15:
                do {
                    var alt15:int=2;
                    var LA15_0:int = input.LA(1);

                    if ( ((LA15_0>=8 && LA15_0<=14)||LA15_0==23) ) {
                        alt15=1;
                    }


                    switch (alt15) {
                	case 1 :
                	    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:162:9: xmlElementContent
                	    {
                	    pushFollow(FOLLOW_xmlElementContent_in_xmlListInitialiser461);
                	    xmlElementContent42=xmlElementContent();

                	    state._fsp = state._fsp - 1;

                	    stream_xmlElementContent.add(xmlElementContent42.tree);

                	    }
                	    break;

                	default :
                	    break loop15;
                    }
                } while (true);

                string_literal43=Token(matchStream(input,27,FOLLOW_27_in_xmlListInitialiser464));  
                stream_27.add(string_literal43);



                // AST REWRITE
                // elements: xmlElementContent
                // token labels: 
                // rule labels: retval
                // token list labels: 
                // rule list labels: 
                retval.tree = root_0;
                var stream_retval:RewriteRuleSubtreeStream=new RewriteRuleSubtreeStream(adaptor,"rule retval",retval!=null?retval.tree:null);

                root_0 = LinkedListTree(adaptor.nil());
                // 163:3: -> ^( XML_LIST ( xmlElementContent )* )
                {
                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:163:6: ^( XML_LIST ( xmlElementContent )* )
                    {
                    var root_1:LinkedListTree = LinkedListTree(adaptor.nil());
                    root_1 = LinkedListTree(adaptor.becomeRoot(LinkedListTree(adaptor.create(XML_LIST, "XML_LIST")), root_1));

                    // C:\\Users\\Teoti\\Documents\\Flash\\OpenSource\\as-blocks\\as3commons-asblocks-antlr\\org\\as3commons\\asblocks\\parser\\antlr\\e4x\\E4X.g:163:17: ( xmlElementContent )*
                    while ( stream_xmlElementContent.hasNext ) {
                        adaptor.addChild(root_1, stream_xmlElementContent.nextTree());

                    }
                    stream_xmlElementContent.reset();

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
        // $ANTLR end xmlListInitialiser


           // Delegated rules


     

        public static const FOLLOW_set_in_xmlMarkup0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlInitialiser_in_xmlPrimary143:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlListInitialiser_in_xmlPrimary148:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlMarkup_in_xmlInitialiser159:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlElement_in_xmlInitialiser164:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_XML_LCHEVRON_in_xmlElement176:BitSet = new BitSet([0x00804000, 0x00000000]);
        public static const FOLLOW_xmlTagContent_in_xmlElement178:BitSet = new BitSet([0x00301000, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlElement180:BitSet = new BitSet([0x00300000, 0x00000000]);
        public static const FOLLOW_20_in_xmlElement195:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_21_in_xmlElement215:BitSet = new BitSet([0x00C07F00, 0x00000000]);
        public static const FOLLOW_xmlElementContent_in_xmlElement217:BitSet = new BitSet([0x00C07F00, 0x00000000]);
        public static const FOLLOW_22_in_xmlElement220:BitSet = new BitSet([0x00804000, 0x00000000]);
        public static const FOLLOW_xmlTagName_in_xmlElement222:BitSet = new BitSet([0x00201000, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlElement224:BitSet = new BitSet([0x00200000, 0x00000000]);
        public static const FOLLOW_21_in_xmlElement227:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlTagName_in_xmlTagContent257:BitSet = new BitSet([0x00001002, 0x00000000]);
        public static const FOLLOW_xmlAttributes_in_xmlTagContent259:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_23_in_xmlEmbeddedExpression271:BitSet = new BitSet([0x00807000, 0x00000000]);
        public static const FOLLOW_expression_in_xmlEmbeddedExpression273:BitSet = new BitSet([0x01000000, 0x00000000]);
        public static const FOLLOW_24_in_xmlEmbeddedExpression275:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlText_in_expression296:BitSet = new BitSet([0x00807002, 0x00000000]);
        public static const FOLLOW_xmlEmbeddedExpression_in_expression302:BitSet = new BitSet([0x00807002, 0x00000000]);
        public static const FOLLOW_set_in_xmlText0:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlEmbeddedExpression_in_xmlTagName337:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_XML_NAME_in_xmlTagName342:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlAttributes358:BitSet = new BitSet([0x00800000, 0x00000000]);
        public static const FOLLOW_xmlEmbeddedExpression_in_xmlAttributes360:BitSet = new BitSet([0x00001002, 0x00000000]);
        public static const FOLLOW_xmlAttribute_in_xmlAttributes366:BitSet = new BitSet([0x00001002, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlAttribute382:BitSet = new BitSet([0x00004000, 0x00000000]);
        public static const FOLLOW_XML_NAME_in_xmlAttribute384:BitSet = new BitSet([0x02001000, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlAttribute386:BitSet = new BitSet([0x02000000, 0x00000000]);
        public static const FOLLOW_25_in_xmlAttribute389:BitSet = new BitSet([0x00809000, 0x00000000]);
        public static const FOLLOW_XML_WS_in_xmlAttribute391:BitSet = new BitSet([0x00809000, 0x00000000]);
        public static const FOLLOW_xmlAttributeValue_in_xmlAttribute394:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlEmbeddedExpression_in_xmlAttributeValue417:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_XML_ATTRIBUTE_VALUE_in_xmlAttributeValue422:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlEmbeddedExpression_in_xmlElementContent433:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlMarkup_in_xmlElementContent438:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlText_in_xmlElementContent443:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_xmlElement_in_xmlElementContent448:BitSet = new BitSet([0x00000002, 0x00000000]);
        public static const FOLLOW_26_in_xmlListInitialiser459:BitSet = new BitSet([0x08807F00, 0x00000000]);
        public static const FOLLOW_xmlElementContent_in_xmlListInitialiser461:BitSet = new BitSet([0x08807F00, 0x00000000]);
        public static const FOLLOW_27_in_xmlListInitialiser464:BitSet = new BitSet([0x00000002, 0x00000000]);

    }
}