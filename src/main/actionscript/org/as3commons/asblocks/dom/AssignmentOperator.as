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
 * An assignment operator for the <code>IASAssignmentExpression</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IASAssignmentExpression
 */
public final class AssignmentOperator
{	
	//--------------------------------------------------------------------------
	//
	//  Public :: Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The <code>+</code> operator.
	 */
	public static var ADD_ASSIGN:AssignmentOperator = AssignmentOperator.create("ADD_ASSIGN");
	
	/**
	 * The <code>&&</code> operator.
	 */
	public static var ASSIGN:AssignmentOperator = AssignmentOperator.create("ASSIGN");
	
	/**
	 * The <code>&</code> operator.
	 */
	public static var BITAND_ASSIGN:AssignmentOperator = AssignmentOperator.create("BITAND_ASSIGN");
	
	/**
	 * The <code>|</code> operator.
	 */
	public static var BITOR_ASSIGN:AssignmentOperator = AssignmentOperator.create("BITOR_ASSIGN");
	
	/**
	 * The <code>|</code> operator.
	 */
	public static var BITXOR_ASSIGN:AssignmentOperator = AssignmentOperator.create("BITXOR_ASSIGN");
	
	/**
	 * The <code>^</code> operator.
	 */
	public static var DIV_ASSIGN:AssignmentOperator = AssignmentOperator.create("DIV_ASSIGN");
	
	/**
	 * The <code>/</code> operator.
	 */
	public static var MOD_ASSIGN:AssignmentOperator = AssignmentOperator.create("MOD_ASSIGN");
	
	/**
	 * The <code>==</code> operator.
	 */
	public static var MUL_ASSIGN:AssignmentOperator = AssignmentOperator.create("MUL_ASSIGN");
	
	/**
	 * The <code>>=</code> operator.
	 */
	public static var SL_ASSIGN:AssignmentOperator = AssignmentOperator.create("SL_ASSIGN");
	
	/**
	 * The <code>></code> operator.
	 */
	public static var SR_ASSIGN:AssignmentOperator = AssignmentOperator.create("SR_ASSIGN");
	
	/**
	 * The <code<=</code> operator.
	 */
	public static var SRU_ASSIGN:AssignmentOperator = AssignmentOperator.create("SRU_ASSIGN");
	
	/**
	 * The <code><</code> operator.
	 */
	public static var SUB_ASSIGN:AssignmentOperator = AssignmentOperator.create("SUB_ASSIGN");
	
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
		
		mapOp(AS3Parser.PLUS_ASSIGN, "+=", AssignmentOperator.ADD_ASSIGN);
		mapOp(AS3Parser.ASSIGN, "=", AssignmentOperator.ASSIGN);
		mapOp(AS3Parser.BAND_ASSIGN, "&=", AssignmentOperator.BITAND_ASSIGN);
		mapOp(AS3Parser.BOR_ASSIGN, "|=", AssignmentOperator.BITOR_ASSIGN);
		mapOp(AS3Parser.BXOR_ASSIGN, "^=", AssignmentOperator.BITXOR_ASSIGN);
		mapOp(AS3Parser.DIV_ASSIGN, "/=", AssignmentOperator.DIV_ASSIGN);
		mapOp(AS3Parser.MOD_ASSIGN, "%=", AssignmentOperator.MOD_ASSIGN);
		mapOp(AS3Parser.STAR_ASSIGN, "*=", AssignmentOperator.MUL_ASSIGN);
		mapOp(AS3Parser.SL_ASSIGN, "<<=", AssignmentOperator.SL_ASSIGN);
		mapOp(AS3Parser.SR_ASSIGN, ">>=", AssignmentOperator.SR_ASSIGN);
		mapOp(AS3Parser.BSR_ASSIGN, ">>>=", AssignmentOperator.SRU_ASSIGN);
		mapOp(AS3Parser.MINUS_ASSIGN, "-=", AssignmentOperator.SUB_ASSIGN);	
		
		intialized = true;
	}
	
	/**
	 * @private
	 */
	private static function mapOp(type:int, text:String, operator:AssignmentOperator):void
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
	public function AssignmentOperator(name:String)
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
	public function equals(other:AssignmentOperator):Boolean
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
	 * @return The <code>AssignmentOperator</code> for the node kind or throws
	 * an error.
	 * @throws IllegalOperationError No operator for token-type
	 */
	public static function opFromType(type:int):AssignmentOperator
	{
		if (!intialized)
		{
			initialize();
		}
		
		var op:AssignmentOperator = OPERATORS_BY_TYPE.itemFor(type);
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
	 * @param operator The <code>AssignmentOperator</code> to initialize the token.
	 * an error.
	 * @param token The <code>IToken</code> to initialize.
	 * @throws IllegalOperationError No operator for Op
	 */
	public static function initializeFromOp(operator:AssignmentOperator, 
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
	 * Creates a new <code>AssignmentOperator</code>.
	 * 
	 * @param name A <code>String</code> indicating the name of the 
	 * <code>AssignmentOperator</code>.
	 * @return A new <code>AssignmentOperator</code> instance.
	 */
	private static function create(name:String):AssignmentOperator
	{
		return new AssignmentOperator(name);
	}
}
}