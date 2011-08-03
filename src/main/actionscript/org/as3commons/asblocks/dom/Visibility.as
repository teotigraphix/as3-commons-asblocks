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

/**
 * Member visibility modifiers.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public final class Visibility
{
	//--------------------------------------------------------------------------
	//
	//  Public :: Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The default visibility (which is INTERNAL).
	 */
	public static const DEFAULT:Visibility = new Visibility("default");
	
	/**
	 * A namespace visibility.
	 */
	public static const NAMESPACE:Visibility = new Visibility("namespace");
	
	/**
	 * The <code>internal</code> visibility.
	 */
	public static const INTERNAL:Visibility = new Visibility("internal");
	
	/**
	 * The <code>private</code> visibility.
	 */
	public static const PRIVATE:Visibility = new Visibility("private");
	
	/**
	 * The <code>protected</code> visibility.
	 */
	public static const PROTECTED:Visibility = new Visibility("protected");
	
	/**
	 * The <code>public</code> visibility.
	 */
	public static const PUBLIC:Visibility = new Visibility("public");
	
	private static var list:Array;
	
	{
		list =
			[
				DEFAULT,
				INTERNAL,
				PRIVATE,
				PROTECTED,
				PUBLIC
			];
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
	 * The visibility modifier name.
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
	public function Visibility(name:String)
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
	public function equals(other:Visibility):Boolean
	{
		return _name == other.getName();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Public Class :: Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	public static function create(name:String):Visibility
	{
		for each (var element:Visibility in list) 
		{
			if (element.getName() == name)
				return element;
		}
		
		var namespace:Visibility = new Visibility(name);
		list.push(namespace);
		return namespace;
	}
	
	/**
	 * @private
	 */
	public static function hasVisibility(visibility:String):Boolean
	{
		for each (var element:Visibility in list) 
		{
			if (element.getName() == visibility)
				return true;
		}
		return false;
	}
	
	/**
	 * @private
	 */
	public static function getVisibility(visibility:String):Visibility
	{
		for each (var element:Visibility in list) 
		{
			if (element.getName() == visibility)
				return element;
		}
		return null;
	}
}
}