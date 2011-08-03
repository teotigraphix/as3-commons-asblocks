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
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.collections.Map;
import org.as3commons.collections.framework.IMap;

/**
 * Postfix operators.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public final class PostfixOperator
{
	private static var OPERATORS_BY_TYPE:IMap = new Map();
	
	private static var TYPES_BY_OPERATOR:IMap = new Map();
	
	//--------------------------------------------------------------------------
	//
	//  Public :: Constants
	//
	//--------------------------------------------------------------------------
	
	
	public static const POSTDEC:PostfixOperator = PostfixOperator.create("POSTDEC");
	
	public static const POSTINC:PostfixOperator = PostfixOperator.create("POSTINC");
	
	
	private static var intialized:Boolean = false;
	
	private static function initialize():void
	{
		if (intialized)
			return;
		
		mapOp(AS3Parser.POST_DEC, "--", PostfixOperator.POSTDEC);
		mapOp(AS3Parser.POST_INC, "++", PostfixOperator.POSTINC);
		
		intialized = true;
	}
	
	private static function mapOp(type:int, text:String, operator:PostfixOperator):void
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
	public function PostfixOperator(name:String)
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
	public function equals(other:PostfixOperator):Boolean
	{
		return _name == other.getName();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Public Class :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Creates a new PostfixOperator.
	 * 
	 * @param name A String indicating the name of the PostfixOperator.
	 * @return A new PostfixOperator instance.
	 */
	private static function create(name:String):PostfixOperator
	{
		return new PostfixOperator(name);
	}
	
	public static function opFromType(type:int):PostfixOperator
	{
		if (!intialized)
		{
			initialize();
		}
		
		var op:PostfixOperator = OPERATORS_BY_TYPE.itemFor(type);
		if (op == null) 
		{
			throw new IllegalOperationError("No operator for token-type '" + 
				ASTUtils.tokenName(type) + "'");
		}
		return op;
	}
	
	public static function initializeFromOp(operator:PostfixOperator, token:Token):void
	{
		if (!intialized)
		{
			initialize();
		}
		
		var me:LinkedListToken = TYPES_BY_OPERATOR.itemFor(operator);
		if (me == null) 
		{
			throw new IllegalOperationError("No operator for Op " + operator);
		}
		token.type = me.type;
		token.text = me.text;
	}
}
}