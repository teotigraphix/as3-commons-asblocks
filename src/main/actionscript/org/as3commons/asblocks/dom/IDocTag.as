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
 * A documentation tag.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IDocCommentAware
 * @see org.as3commons.asblocks.dom.IDocComment
 * @see org.as3commons.asblocks.dom.IDocComment#newDocTag(String)
 * @see org.as3commons.asblocks.dom.IDocComment#newDocTag(String, String)
 */
public interface IDocTag
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  name
	//----------------------------------

	/**
	 * The document tag's name text.
	 */
	function getName():String;

	/**
	 * @see #getName()
	 */
	function setName(value:String):void;

	//----------------------------------
	//  body
	//----------------------------------

	/**
	 * The document tag's body text.
	 */
	function getBody():String;

	/**
	 * @see #getBody()
	 */
	function setBody(value:String):void;
}
}