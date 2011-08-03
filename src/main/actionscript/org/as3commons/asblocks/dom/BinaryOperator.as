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

package org.as3commons.asblocks.dom
{

import flash.errors.IllegalOperationError;

import org.antlr.runtime.Token;
import org.as3commons.asblocks.impl.ASTUtils;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.collections.Map;
import org.as3commons.collections.framework.IMap;

/**
 * An assignment operator for the <code>IASBinaryExpression</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASBinaryExpression
 */
public final class BinaryOperator
{	
	//--------------------------------------------------------------------------
	//
	//  Public :: Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The <code>+</code> operator.
	 */
	public static var ADD:BinaryOperator = BinaryOperator.create("ADD");
	
	/**
	 * The <code>&&</code> operator.
	 */
	public static var AND:BinaryOperator = BinaryOperator.create("AND");
	
	/**
	 * The <code>&</code> operator.
	 */
	public static var BITAND:BinaryOperator = BinaryOperator.create("BITAND");
	
	/**
	 * The <code>|</code> operator.
	 */
	public static var BITOR:BinaryOperator = BinaryOperator.create("BITOR");
	
	/**
	 * The <code>^</code> operator.
	 */
	public static var BITXOR:BinaryOperator = BinaryOperator.create("BITXOR");
	
	/**
	 * The <code>/</code> operator.
	 */
	public static var DIV:BinaryOperator = BinaryOperator.create("DIV");
	
	/**
	 * The <code>==</code> operator.
	 */
	public static var EQ:BinaryOperator = BinaryOperator.create("EQ");
	
	/**
	 * The <code>&gt;=</code> operator.
	 */
	public static var GE:BinaryOperator = BinaryOperator.create("GE");
	
	/**
	 * The <code>&gt;</code> operator.
	 */
	public static var GT:BinaryOperator = BinaryOperator.create("GT");
	
	/**
	 * The <code&lt;=</code> operator.
	 */
	public static var LE:BinaryOperator = BinaryOperator.create("LE");
	
	/**
	 * The <code>&lt;</code> operator.
	 */
	public static var LT:BinaryOperator = BinaryOperator.create("LT");
	
	/**
	 * The <code>%</code> operator.
	 */
	public static var MOD:BinaryOperator = BinaryOperator.create("MOD");
	
	/**
	 * The <code>*</code> operator.
	 */
	public static var MUL:BinaryOperator = BinaryOperator.create("MUL");
	
	/**
	 * The <code>!=</code> operator.
	 */
	public static var NE:BinaryOperator = BinaryOperator.create("NE");
	
	/**
	 * The <code>||</code> operator.
	 */
	public static var OR:BinaryOperator = BinaryOperator.create("OR");
	
	/**
	 * The <code>&lt;&lt;</code> operator.
	 */
	public static var SL:BinaryOperator = BinaryOperator.create("SL");
	
	/**
	 * The <code>&gt;&gt;</code> operator.
	 */
	public static var SR:BinaryOperator = BinaryOperator.create("SR");
	
	/**
	 * The <code>&gt;&gt;&gt;</code> operator.
	 */
	public static var SRU:BinaryOperator = BinaryOperator.create("SRU");
	
	/**
	 * The <code>-</code> operator.
	 */
	public static var SUB:BinaryOperator = BinaryOperator.create("SUB");
	
	//--------------------------------------------------------------------------
	//
	//  Private Static :: Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private static var OPERATORS_BY_TYPE:IMap = new Map();
	
	/**
	 * @private
	 */
	private static var TYPES_BY_OPERATOR:IMap = new Map();
	
	/**
	 * @private
	 */
	private static var intialized:Boolean = false;
	
	/**
	 * @private
	 */
	private static function initialize():void
	{
		if (intialized)
			return;
		
		mapOp(AS3Parser.PLUS, "+", BinaryOperator.ADD);
		mapOp(AS3Parser.LAND, "&&", BinaryOperator.AND);
		mapOp(AS3Parser.BAND, "&", BinaryOperator.BITAND);
		mapOp(AS3Parser.BOR, "|", BinaryOperator.BITOR);
		mapOp(AS3Parser.BXOR, "^", BinaryOperator.BITXOR);
		mapOp(AS3Parser.DIV, "/", BinaryOperator.DIV);
		mapOp(AS3Parser.EQUAL, "==", BinaryOperator.EQ);
		mapOp(AS3Parser.GE, ">=", BinaryOperator.GE);
		mapOp(AS3Parser.GT, ">", BinaryOperator.GT);
		mapOp(AS3Parser.LE, "<=", BinaryOperator.LE);
		mapOp(AS3Parser.LT, "<", BinaryOperator.LT);
		mapOp(AS3Parser.MOD, "%", BinaryOperator.MOD);
		mapOp(AS3Parser.MULT, "*", BinaryOperator.MUL);
		mapOp(AS3Parser.NOT_EQUAL, "!=", BinaryOperator.NE);
		mapOp(AS3Parser.LOR, "||", BinaryOperator.OR);
		mapOp(AS3Parser.SL, "<<", BinaryOperator.SL);
		mapOp(AS3Parser.SR, ">>", BinaryOperator.SR);
		mapOp(AS3Parser.BSR, ">>>", BinaryOperator.SRU);
		mapOp(AS3Parser.MINUS, "-", BinaryOperator.SUB);
		
		intialized = true;
	}
	
	/**
	 * @private
	 */
	private static function mapOp(type:int, text:String, operator:BinaryOperator):void
	{
		OPERATORS_BY_TYPE.add(type, operator);
		TYPES_BY_OPERATOR.add(operator, new LinkedListToken(type, text));
	}
	
	//--------------------------------------------------------------------------
	//
	//  Public :: Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  name
	//----------------------------------
	
	/**
	 * @private
	 */
	private var _name:String;
	
	/**
	 * The operator name.
	 */
	public function getName():String
	{
		return _name;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	public function BinaryOperator(name:String)
	{
		_name = name;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Public :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	public function toString():String
	{
		return _name;
	}
	
	/**
	 * @private
	 */
	public function equals(other:BinaryOperator):Boolean
	{
		return _name == other.getName();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Public Class :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Returns the operator from a node type.
	 * 
	 * @param The node type.
	 * @return The <code>BinaryOperator</code> for the node kind or throws
	 * an error.
	 * @throws IllegalOperationError No operator for token-type
	 */
	public static function opFromType(type:int):BinaryOperator
	{
		if (!intialized)
		{
			initialize();
		}
		
		var op:BinaryOperator = OPERATORS_BY_TYPE.itemFor(type);
		if (op == null) 
		{
			throw new IllegalOperationError("No operator for token-kind '" + 
				ASTUtils.tokenName(type) + "'");
		}
		return op;
	}
	
	/**
	 * Initializes a token from an operator.
	 * 
	 * @param operator The <code>BinaryOperator</code> to initialize the token.
	 * an error.
	 * @param token The <code>IToken</code> to initialize.
	 * @throws IllegalOperationError No operator for Op
	 */
	public static function initializeFromOp(operator:BinaryOperator, 
											token:Token):void
	{
		if (!intialized)
		{
			initialize();
		}
		
		var type:LinkedListToken = TYPES_BY_OPERATOR.itemFor(operator);
		if (type == null) 
		{
			throw new IllegalOperationError("No operator for Op " + operator);
		}
		
		token.type = type.type;
		token.text = type.text;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Private Class :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Creates a new <code>BinaryOperator</code>.
	 * 
	 * @param name A <code>String</code> indicating the name of the 
	 * <code>BinaryOperator</code>.
	 * @return A new <code>BinaryOperator</code> instance.
	 */
	private static function create(name:String):BinaryOperator
	{
		return new BinaryOperator(name);
	}
}
}