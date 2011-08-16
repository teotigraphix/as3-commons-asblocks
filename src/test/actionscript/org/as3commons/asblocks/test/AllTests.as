////////////////////////////////////////////////////////////////////////////////
// Copyright 2011 Michael Schmalle - Teoti Graphix, LLC
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and 
// limitations under the License
// 
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package org.as3commons.asblocks.test
{

import org.as3commons.asblocks.impl.ExpressionParseTests;
import org.as3commons.asblocks.impl.OperatorPrecedenceTests;
import org.as3commons.asblocks.impl.TestASTIterator;
import org.as3commons.asblocks.impl.Test_ASTASArrayAccessExpression;
import org.as3commons.asblocks.impl.Test_ASTASAssignmentExpression;
import org.as3commons.asblocks.impl.Test_ASTASBinaryExpression;
import org.as3commons.asblocks.impl.Test_ASTASClassType;
import org.as3commons.asblocks.impl.Test_ASTASConditionalExpression;
import org.as3commons.asblocks.impl.Test_ASTASConfigStatement;
import org.as3commons.asblocks.impl.Test_ASTASFieldAccessExpression;
import org.as3commons.asblocks.impl.Test_ASTASFunctionExpression;
import org.as3commons.asblocks.impl.Test_ASTASFunctionType;
import org.as3commons.asblocks.impl.Test_ASTASInterfaceType;
import org.as3commons.asblocks.impl.Test_ASTASInvocationExpression;
import org.as3commons.asblocks.impl.Test_ASTASLiteral;
import org.as3commons.asblocks.impl.Test_ASTASMethod;
import org.as3commons.asblocks.impl.Test_ASTASNamespaceType;
import org.as3commons.asblocks.impl.Test_ASTASPackage;
import org.as3commons.asblocks.impl.Test_ASTASPostfixExpression;
import org.as3commons.asblocks.impl.Test_ASTASPrefixExpression;
import org.as3commons.asblocks.impl.Test_ASTASProject;
import org.as3commons.asblocks.impl.Test_ASTMetaTag;
import org.as3commons.asblocks.impl.Test_ASTStatementList;
import org.as3commons.asblocks.impl.Test_BasicUnit;
import org.as3commons.asblocks.impl.Test_DocComment;
import org.as3commons.asblocks.parser.antlr.TestLinkedListTree;
import org.as3commons.asblocks.parser.antlr.Test_AST;
import org.as3commons.asblocks.parser.antlr.Test_BasicListUpdateDelegate;
import org.as3commons.asblocks.parser.antlr.Test_LinkedListToken;
import org.as3commons.asblocks.parser.antlr.Test_LinkedListTokenStream;
import org.as3commons.asblocks.parser.antlr.as3.TestAS3Parser_CompilationUnit;
import org.as3commons.asblocks.parser.antlr.as3.Test_AS3ParserModes;
import org.as3commons.asblocks.parser.antlr.asdoc.TestASDocParser;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class AllTests
{
	// org.as3commons.asblocks.parser
	
	public var test_AS3ParserModes:Test_AS3ParserModes;
	public var testAS3Parser_CompilationUnit:TestAS3Parser_CompilationUnit;
	public var operatorPrecedenceTests:OperatorPrecedenceTests;
	
	public var test_AST:Test_AST;
	public var test_BasicListUpdateDelegate:Test_BasicListUpdateDelegate;
	public var testLinkedListToken:Test_LinkedListToken;
	public var testLinkedListTokenStream:Test_LinkedListTokenStream;
	public var testLinkedListTree:TestLinkedListTree;
	
	// org.as3commons.asblocks.impl
	
	public var expressionParseTests:ExpressionParseTests;
	public var test_ASTASArrayAccessExpression:Test_ASTASArrayAccessExpression;
	public var test_ASTASAssignmentExpression:Test_ASTASAssignmentExpression;
	public var test_ASTASBinaryExpression:Test_ASTASBinaryExpression;
	public var test_ASTASClassType:Test_ASTASClassType;
	public var test_ASTASConditionalExpression:Test_ASTASConditionalExpression;
	public var test_ASTASConfigStatement:Test_ASTASConfigStatement;
	public var test_ASTASFieldAccessExpression:Test_ASTASFieldAccessExpression;
	public var test_ASTASFunctionExpression:Test_ASTASFunctionExpression;
	public var test_ASTASFunctionType:Test_ASTASFunctionType;
	public var test_ASTASInterfaceType:Test_ASTASInterfaceType;
	public var test_ASTASInvocationExpression:Test_ASTASInvocationExpression;
	public var test_ASTASLiteral:Test_ASTASLiteral;
	public var test_ASTASMethod:Test_ASTASMethod;
	public var test_ASTASNamespaceType:Test_ASTASNamespaceType;
	public var test_ASTASPackage:Test_ASTASPackage;
	public var test_ASTASPostfixExpression:Test_ASTASPostfixExpression;
	public var test_ASTASPrefixExpression:Test_ASTASPrefixExpression;
	public var test_ASTASProject:Test_ASTASProject;
	public var test_ASTMetaTag:Test_ASTMetaTag;
	
	public var test_BasicUnit:Test_BasicUnit;
	public var test_DocComment:Test_DocComment;
	public var testASTIterator:TestASTIterator;
	
	public var test_ASTStatementList:Test_ASTStatementList;
}
}