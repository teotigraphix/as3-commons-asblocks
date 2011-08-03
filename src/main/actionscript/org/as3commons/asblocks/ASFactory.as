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

package org.as3commons.asblocks
{

import org.as3commons.asblocks.dom.IASArrayAccessExpression;
import org.as3commons.asblocks.dom.IASArrayLiteral;
import org.as3commons.asblocks.dom.IASAssignmentExpression;
import org.as3commons.asblocks.dom.IASBinaryExpression;
import org.as3commons.asblocks.dom.IASBlock;
import org.as3commons.asblocks.dom.IASBooleanLiteral;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASConditionalExpression;
import org.as3commons.asblocks.dom.IASDeclarationStatement;
import org.as3commons.asblocks.dom.IASDescendantExpression;
import org.as3commons.asblocks.dom.IASExpression;
import org.as3commons.asblocks.dom.IASExpressionAttribute;
import org.as3commons.asblocks.dom.IASFieldAccessExpression;
import org.as3commons.asblocks.dom.IASFilterExpression;
import org.as3commons.asblocks.dom.IASFunctionExpression;
import org.as3commons.asblocks.dom.IASIntegerLiteral;
import org.as3commons.asblocks.dom.IASInvocationExpression;
import org.as3commons.asblocks.dom.IASNewExpression;
import org.as3commons.asblocks.dom.IASNullLiteral;
import org.as3commons.asblocks.dom.IASObjectLiteral;
import org.as3commons.asblocks.dom.IASPostfixExpression;
import org.as3commons.asblocks.dom.IASPrefixExpression;
import org.as3commons.asblocks.dom.IASPropertyAttribute;
import org.as3commons.asblocks.dom.IASRegexpLiteral;
import org.as3commons.asblocks.dom.IASSimpleNameExpression;
import org.as3commons.asblocks.dom.IASStarAttribute;
import org.as3commons.asblocks.dom.IASStatement;
import org.as3commons.asblocks.dom.IASStringLiteral;
import org.as3commons.asblocks.dom.IASUndefinedLiteral;
import org.as3commons.asblocks.dom.IASXMLLiteral;
import org.as3commons.asblocks.impl.ASTASParser;
import org.as3commons.asblocks.impl.ASTASProject;
import org.as3commons.asblocks.impl.ASTASWriter;
import org.as3commons.asblocks.impl.ASTE4XExpressionBuilder;
import org.as3commons.asblocks.impl.ASTExpressionBuilder;
import org.as3commons.asblocks.impl.ASTLiteralBuilder;
import org.as3commons.asblocks.impl.ASTStatementBuilder;
import org.as3commons.asblocks.impl.ASTTypeBuilder;
import org.as3commons.asblocks.impl.TokenBuilder;
import org.as3commons.collections.framework.IList;

/**
 * The <code>ASFactory</code> is the default concrete interface factory for the
 * creation of ActionScript 3 building blocks in the ASBlocks framework.
 * 
 * <p>Creating a factory allows the developer to create and write projects, 
 * classes, interfaces and other ActionScript 3 building blocks. The factory
 * also allows the developer to read and parse ActionScript 3 code files and 
 * Strings into Abstract Syntax Trees (AST). After the AST has been created,
 * the ASBlocks DOM can then be used to modify the source code.</p>
 * 
 * <p>The default base implementation of the <code>ASFactory</code> allows 
 * for creation of expressions, literals, blocks, projects, parsers and writers.</p>
 * 
 * <pre>
 * // create a class unit with out the project overhead
 * var factory:ASFactory = new ASFactory();
 * var cunit:IASCompilationUnit = factory.newClass("foo.bar.Baz");
 * // or create a class unit using the project
 * var factory:ASFactory = new ASFactory();
 * var project:IASProject = factory.newEmptyASProject(".");
 * // creates and adds the compilation unit to the project
 * var cunit:IASCompilationUnit = project.newClass("foo.bar.Baz");
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.IASProject
 */
public class ASFactory
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 * Constructor.
	 */
	public function ASFactory()
	{
	}

	//--------------------------------------------------------------------------
	//
	//  Public Global Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new <code>IASBlockProject</code> project and sets it's 
	 * <code>outputLocation</code>.
	 * 
	 * <p><strong>Note:</strong> Subclasses can override the default behavior 
	 * and return their own custom instances of <code>IASBlockProject</code>. This
	 * is true for the <code>ASBuilderFactory</code> which returns an AIR dependent 
	 * project which can access the file system and load SWC resources.</p>
	 * 
	 * @param outputLocation A <code>String</code> indicating the output location
	 * of the project's source code.
	 * @return The implemented <code>IASBlockProject</code> project.
	 * 
	 * @see org.as3commons.asblocks.IASBlockProject
	 */
	public function newEmptyASProject(outputLocation:String):IASProject
	{
		var result:IASProject = createASProject();
		result.setOutputLocation(outputLocation);
		return result;
	}

	/**
	 * Returns a new <code>IASParser</code> implementation.
	 * 
	 * @return The implemented <code>IASParser</code> parser.
	 * 
	 * @see org.as3commons.asblocks.IASParser
	 */
	public function newParser():IASParser
	{
		return new ASTASParser();
	}

	/**
	 * Returns a new <code>IASWriter</code> implementation.
	 * 
	 * @return The implemented <code>IASWriter</code> writer.
	 * 
	 * @see org.as3commons.asblocks.IASWriter
	 */
	public function newWriter():IASWriter
	{
		return new ASTASWriter();
	}

	/**
	 * Creates a new block statement <code>{ }</code>.
	 * 
	 * @return A new <code>IASBlock</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBlock
	 * @see org.as3commons.asblocks.dom.IASStatement
	 * @see org.as3commons.asblocks.dom.IStatementContainer
	 */
	public function newBlock():IASBlock
	{
		return ASTStatementBuilder.newBlock();
	}

	//--------------------------------------------------------------------------
	//
	//  Public Type Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new public <strong>class</strong> <code>IASCompilationUnit</code>.
	 * 
	 * @param qualifiedName The <code>String</code> qualified name of the class.
	 * @return A new class <code>IASCompilationUnit</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASClassType
	 */
	public function newClass(qualifiedName:String):IASCompilationUnit
	{
		return ASTTypeBuilder.newClass(qualifiedName);
	}

	/**
	 * Creates a new public <strong>interface</strong> <code>IASCompilationUnit</code>.
	 * 
	 * @param qualifiedName The <code>String</code> qualified name of the interface.
	 * @return A new interface <code>IASCompilationUnit</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASInterfaceType
	 */
	public function newInterface(qualifiedName:String):IASCompilationUnit
	{
		return ASTTypeBuilder.newInterface(qualifiedName);
	}

	/**
	 * Creates a new public <strong>function</strong> <code>IASCompilationUnit</code>.
	 * 
	 * @param qualifiedName The <code>String</code> qualified name of the function.
	 * @param returnType The <code>String</code> return type of the function.
	 * @return A new interface <code>IASCompilationUnit</code>. 
	 * 
	 * @see org.as3commons.asblocks.dom.IASFunctionType
	 */
	public function newFunction(qualifiedName:String,
			returnType:String):IASCompilationUnit
	{

		return ASTTypeBuilder.newFunction(qualifiedName, returnType);
	}

	/**
	 * Creates a new public <strong>namespace</strong> <code>IASCompilationUnit</code>.
	 * 
	 * @param qualifiedName The <code>String</code> qualified name of the namespace.
	 * @param uri The <code>String</code> uri namespace.
	 * @return A new interface <code>IASCompilationUnit</code>.
	 * 
	 * @see org.as3commons.asblocks.dom.IASNamespaceType
	 */
	public function newNamespace(qualifiedName:String, uri:String):IASCompilationUnit
	{
		return ASTTypeBuilder.newNamespace(qualifiedName, uri);
	}

	//--------------------------------------------------------------------------
	//
	//  Public Literals Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new <code>int</code> literal.
	 * 
	 * @param number The <code>int</code> value for the literal.
	 * @return A new <code>IASIntegerLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASIntegerLiteral
	 */
	public function newIntegerLiteral(number:int):IASIntegerLiteral
	{
		return ASTLiteralBuilder.newIntegerLiteral(number);
	}

	/**
	 * Creates a new <code>null</code> literal.
	 * 
	 * @return A new <code>IASNullLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASNullLiteral
	 */
	public function newNullLiteral():IASNullLiteral
	{
		return ASTLiteralBuilder.newNullLiteral();
	}

	/**
	 * Creates a new <code>undefined</code> literal.
	 * 
	 * @return A new <code>IASUndefinedLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASUndefinedLiteral
	 */
	public function newUndefinedLiteral():IASUndefinedLiteral
	{
		return ASTLiteralBuilder.newUndefinedLiteral();
	}

	/**
	 * Creates a new <code>Boolean</code> literal.
	 * 
	 * @param bool The <code>Boolean</code> value for the literal.
	 * @return A new <code>IASBooleanLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBooleanLiteral
	 */
	public function newBooleanLiteral(bool:Boolean):IASBooleanLiteral
	{
		return ASTLiteralBuilder.newBooleanLiteral(bool);
	}

	/**
	 * Creates a new <code>String</code> literal.
	 * 
	 * <p>Note: The passed value does not inlude the start and end quotes, 
	 * unless they need to be escaped.</p>
	 * 
	 * @param string The <code>String</code> value for the literal.
	 * @return A new <code>IASStringLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASStringLiteral
	 */
	public function newStringLiteral(string:String):IASStringLiteral
	{
		return ASTLiteralBuilder.newStringLiteral(string);
	}

	/**
	 * Creates a new <code>[a, b, c]</code> literal.
	 * 
	 * @return A new <code>IASArrayLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASArrayLiteral
	 */
	public function newArrayLiteral():IASArrayLiteral
	{
		return ASTLiteralBuilder.newArrayLiteral();
	}

	/**
	 * Creates a new <code>{a:1, b:2, c:3}</code> literal.
	 * 
	 * @return A new <code>IASObjectLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASObjectLiteral
	 */
	public function newObjectLiteral():IASObjectLiteral
	{
		return ASTLiteralBuilder.newObjectLiteral();
	}

	/**
	 * Creates a new <code>function():void {}</code> literal.
	 * 
	 * @return A new <code>IASFunctionExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASFunctionExpression
	 */
	public function newFunctionExpression():IASFunctionExpression
	{
		return ASTLiteralBuilder.newFunctionExpression();
	}

	/**
	 * Creates a new <code>xml</code> literal.
	 * 
	 * @return A new <code>IASXMLLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASXMLLiteral
	 */
	public function newXMLLiteral(sml:String):IASXMLLiteral
	{
		return ASTLiteralBuilder.newXMLLiteral(sml);
	}

	/**
	 * Creates a new <code>/.../</code> literal.
	 * 
	 * @return A new <code>IASRegexpLiteral</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASRegexpLiteral
	 */
	public function newRegexpLiteral(value:String, flags:int):IASRegexpLiteral
	{
		return ASTLiteralBuilder.newRegexpLiteral(value, flags);
	}

	//--------------------------------------------------------------------------
	//
	//  Public Expressions Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new <code>IASExpression</code> by parsing the expression String.
	 * 
	 * @param expression A <code>String</code> expression to parse.
	 * @return A new <code>IASExpression</code>.
	 */
	public function newExpression(expression:String):IASExpression
	{
		return ASTExpressionBuilder.newExpression(expression);
	}

	/**
	 * Creates a new <code>var i:int = 0;</code> that can be turned into
	 * a <code>const i:int = 0, j:int = 1;</code> statement.
	 * 
	 * @return A new <code>IASDeclarationStatement</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASDeclarationStatement
	 */
	public function newDeclaration(declaration:String):IASDeclarationStatement
	{
		return ASTStatementBuilder.newDeclaration(declaration);
	}

	//----------------------------------
	//  Assignment
	//----------------------------------

	/**
	 * Creates a new <code>a = b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newAssign(), left, right);
	}

	/**
	 * Creates a new <code>a += b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newAddAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newAddAssign(), left, right);
	}

	/**
	 * Creates a new <code>a &amp;= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newBitAndAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newBitAndAssign(), left, right);
	}

	/**
	 * Creates a new <code>a |= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newBitOrAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newBitOrAssign(), left, right);
	}

	/**
	 * Creates a new <code>a |= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newBitXorAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newBitXorAssign(), left, right);
	}

	/**
	 * Creates a new <code>a \= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newDivideAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newDivAssign(), left, right);
	}

	/**
	 * Creates a new <code>a %= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newModuloAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newModAssign(), left, right);
	}

	/**
	 * Creates a new <code>a *= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newMultiplyAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newMulAssign(), left, right);
	}

	/**
	 * Creates a new <code>a &lt;&lt;= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newShiftLeftAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newSLAssign(), left, right);
	}

	/**
	 * Creates a new <code>a &gt;&gt;= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newShiftRightAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newSRAssign(), left, right);
	}

	/**
	 * @private
	 */
	public function newShiftRightUnsignedAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newSRUAssign(), left, right);
	}

	/**
	 * Creates a new <code>a -= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASAssignmentExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
	 */
	public function newSubtractAssignExpression(left:IASExpression, right:IASExpression):IASAssignmentExpression
	{
		return ASTExpressionBuilder.newAssignExpression(TokenBuilder.newSubAssign(), left, right);
	}

	//----------------------------------
	//  Binary
	//----------------------------------

	/**
	 * Creates a new <code>a + b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newAddExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newPlus(), left, right);
	}

	/**
	 * Creates a new <code>a &amp;&amp; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newAndExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newAnd(), left, right);
	}

	/**
	 * Creates a new <code>a &amp; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newBitAndExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newBitAnd(), left, right);
	}

	/**
	 * Creates a new <code>a | b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newBitOrExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newBitOr(), left, right);
	}

	/**
	 * Creates a new <code>a ^ b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newBitXorExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newBitXor(), left, right);
	}

	/**
	 * Creates a new <code>a / b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newDivisionExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newDiv(), left, right);
	}

	/**
	 * Creates a new <code>a == b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newEqualsExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newEquals(), left, right);
	}

	/**
	 * Creates a new <code>a &gt;= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newGreaterEqualsExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newGreaterEquals(), left, right);
	}

	/**
	 * Creates a new <code>a &gt; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newGreaterThanExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newGreater(), left, right);
	}

	/**
	 * Creates a new <code>a &lt;= b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newLessEqualsExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newLessEquals(), left, right);
	}

	/**
	 * Creates a new <code>a &lt; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newLessThanExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newLess(), left, right);
	}

	/**
	 * Creates a new <code>a % b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newModuloExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newModulo(), left, right);
	}

	/**
	 * Creates a new <code>a * b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newMultiplyExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newMult(), left, right);
	}

	/**
	 * Creates a new <code>a != b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newNotEqualsExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newNotEquals(), left, right);
	}

	/**
	 * Creates a new <code>a || b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newOrExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newOr(), left, right);
	}

	/**
	 * Creates a new <code>a &lt;&lt; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newShiftLeftExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newShiftLeft(), left, right);
	}

	/**
	 * Creates a new <code>a &gt;&gt; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newShiftRightExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newShiftRight(), left, right);
	}

	/**
	 * Creates a new <code>a &gt;&gt;&gt; b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newShiftRightUnsignedExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newShiftRightUnsigned(), left, right);
	}

	/**
	 * Creates a new <code>a - b</code> expression.
	 * 
	 * @param left The left side <code>IASExpression</code>.
	 * @param right The right side <code>IASExpression</code>.
	 * @return A new <code>IASBinaryExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASBinaryExpression
	 */
	public function newSubtractExpression(left:IASExpression, right:IASExpression):IASBinaryExpression
	{
		return ASTExpressionBuilder.newBinaryExpression(TokenBuilder.newMinus(), left, right);
	}

	//----------------------------------
	//  Conditional
	//----------------------------------

	/**
	 * Creates a new <code>condition ? then : else</code> expression.
	 * 
	 * @param conditionExpression The evaluated condition <code>IASExpression</code>.
	 * @param thenExpression The <code>true</code> executed <code>IASExpression</code>.
	 * @param elseExpression The <code>false</code> executed <code>IASExpression</code>.
	 * @return A new <code>IASConditionalExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASConditionalExpression
	 */
	public function newConditionalExpression(
			conditionExpression:IASExpression, thenExpression:IASExpression,
			elseExpression:IASExpression):IASConditionalExpression
	{
		return ASTExpressionBuilder.newConditionalExpression(conditionExpression, thenExpression, elseExpression);
	}

	//----------------------------------
	//  Invocation
	//----------------------------------

	/**
	 * Creates a new <code>target(arguments)</code> expression.
	 * 
	 * @param target The invocation target <code>IASExpression</code>.
	 * @param arguments The <code>Vector</code> of <code>IASExpression</code> 
	 * invocation arguments.
	 * @return A new <code>IASINvocationExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASInvocationExpression
	 */
	public function newInvocationExpression(
			target:IASExpression, arguments:IList):IASInvocationExpression
	{
		return ASTExpressionBuilder.newInvocationExpression(target, arguments);
	}

	/**
	 * Creates a new <code>new Target(arguments)</code> expression.
	 * 
	 * @param target The instantiation invocation target <code>IASExpression</code>.
	 * @param arguments The <code>Vector</code> of <code>IASExpression</code> 
	 * invocation arguments.
	 * @return A new <code>IASNewExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASNewExpression
	 */
	public function newNewExpression(target:IASExpression,
			arguments:IList = null):IASNewExpression
	{
		return ASTExpressionBuilder.newNewExpression(target, arguments);
	}

	//----------------------------------
	//  Prefix & Post
	//----------------------------------

	/**
	 * Creates a new <code>expression--</code> expression.
	 * 
	 * @param expression The decrement <code>IASExpression</code>.
	 * @return A new <code>IASPostfixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPostfixExpression
	 */
	public function newPostDecExpression(expression:IASExpression):IASPostfixExpression
	{
		return ASTExpressionBuilder.newPostfixExpression(TokenBuilder.newPostDec(), expression);
	}

	/**
	 * Creates a new <code>expression++</code> expression.
	 * 
	 * @param expression The increment <code>IASExpression</code>.
	 * @return A new <code>IASPostfixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPostfixExpression
	 */
	public function newPostIncExpression(expression:IASExpression):IASPostfixExpression
	{
		return ASTExpressionBuilder.newPostfixExpression(TokenBuilder.newPostInc(), expression);
	}

	/**
	 * Creates a new <code>--expression</code> expression.
	 * 
	 * @param expression The decrement <code>IASExpression</code>.
	 * @return A new <code>IASPrefixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPrefixExpression
	 */
	public function newPreDecExpression(expression:IASExpression):IASPrefixExpression
	{
		return ASTExpressionBuilder.newPrefixExpression(TokenBuilder.newPreDec(), expression);
	}

	/**
	 * Creates a new <code>++expression</code> expression.
	 * 
	 * @param expression The increment <code>IASExpression</code>.
	 * @return A new <code>IASPrefixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPrefixExpression
	 */
	public function newPreIncExpression(expression:IASExpression):IASPrefixExpression
	{
		return ASTExpressionBuilder.newPrefixExpression(TokenBuilder.newPreInc(), expression);
	}

	/**
	 * Creates a new <code>+expression</code> expression.
	 * 
	 * @param expression The positive <code>IASExpression</code>.
	 * @return A new <code>IASPrefixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPrefixExpression
	 */
	public function newPositiveExpression(expression:IASExpression):IASPrefixExpression
	{
		return ASTExpressionBuilder.newPrefixExpression(TokenBuilder.newPlus(), expression);
	}

	/**
	 * Creates a new <code>-expression</code> expression.
	 * 
	 * @param expression The negetive <code>IASExpression</code>.
	 * @return A new <code>IASPrefixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPrefixExpression
	 */
	public function newNegativeExpression(expression:IASExpression):IASPrefixExpression
	{
		return ASTExpressionBuilder.newPrefixExpression(TokenBuilder.newMinus(), expression);
	}

	/**
	 * Creates a new <code>!expression</code> expression.
	 * 
	 * @param expression The not <code>IASExpression</code>.
	 * @return A new <code>IASPrefixExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASPrefixExpression
	 */
	public function newNotExpression(expression:IASExpression):IASPrefixExpression
	{
		return ASTExpressionBuilder.newPrefixExpression(TokenBuilder.newNot(), expression);
	}

	//----------------------------------
	//  Access
	//----------------------------------

	/**
	 * Creates a new <code>target.name</code> expression.
	 * 
	 * @param target The target access <code>IASExpression</code>.
	 * @param name The name of the target access <code>IASExpression</code>.
	 * @return A new <code>IASFieldAccessExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASFieldAccessExpression
	 */
	public function newFieldAccessExpression(
			target:IASExpression, name:String):IASFieldAccessExpression
	{
		return ASTExpressionBuilder.newFieldAccessExpression(target, name);
	}

	/**
	 * Creates a new <code>target[subscript]</code> expression.
	 * 
	 * @param target The target access <code>IASExpression</code>.
	 * @param target The subscript of the target access <code>IASExpression</code>.
	 * @return A new <code>IASArrayAccessExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASArrayAccessExpression
	 */
	public function newArrayAccessExpression(
			target:IASExpression, subscript:IASExpression):IASArrayAccessExpression
	{
		return ASTExpressionBuilder.newArrayAccessExpression(target, subscript);
	}

	//----------------------------------
	//  Name
	//----------------------------------

	/**
	 * Creates a new <code>name</code> expression.
	 * 
	 * @param name The <code>String</code> name.
	 * @return A new <code>IASSimpleNameExpression</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASSimpleNameExpression
	 */
	public function newSimpleNameExpression(name:String):IASSimpleNameExpression
	{
		return ASTExpressionBuilder.newSimpleNameExpression(name);
	}

	//--------------------------------------------------------------------------
	//
	//  Public Statement Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates a new statement using the <code>AS3FragmentParser.parseStatement()</code>
	 * and the <code>StatementBuilder.build()</code> to construct the new statement.
	 * 
	 * @param statement The <code>String</code> statement to be parsed and built.
	 * @return A new <code>IASStatement</code> instance.
	 * 
	 * @see org.as3commons.asblocks.dom.IASStatement
	 */
	public function newStatement(statement:String):IASStatement
	{
		return ASTStatementBuilder.newStatement(statement);
	}

	//--------------------------------------------------------------------------
	//
	//  Public E4X Expressions Creation :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * @param target
	 * @param selector
	 * @return
	 */
	public function newDescendantExpression(
			target:IASExpression, selector:IASExpression):IASDescendantExpression
	{
		return ASTE4XExpressionBuilder.newDescendantExpression(target, selector);
	}

	/**
	 * @param target
	 * @param selector
	 * @return
	 */
	public function newFilterExpression(target:IASExpression,
			selector:IASExpression):IASFilterExpression
	{
		return ASTE4XExpressionBuilder.newFilterExpression(target, selector);
	}

	/**
	 * @return
	 */
	public function newStarAttribute():IASStarAttribute
	{
		return ASTE4XExpressionBuilder.newStarAttribute();
	}

	/**
	 * @param propertyName
	 * @return
	 */
	public function newPropertyAttribute(propertyName:String):IASPropertyAttribute
	{
		return ASTE4XExpressionBuilder.newPropertyAttribute(propertyName);
	}

	/**
	 * @param expr
	 * @return
	 */
	public function newExpressionAttribute(
			expression:IASExpression):IASExpressionAttribute
	{
		return ASTE4XExpressionBuilder.newExpressionAttribute(expression);
	}

	//--------------------------------------------------------------------------
	//
	//  Protected :: Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Returns an instance of the <code>IASProject</code> project for the 
	 * specific factory implementation.
	 * 
	 * return The implemented <code>IASProject</code> project.
	 */
	protected function createASProject():IASProject
	{
		var result:IASProject = new ASTASProject(this);
		return result;
	}
}
}