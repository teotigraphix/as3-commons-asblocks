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
 * A documentation comment aware client.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IDocCommentAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------

	//----------------------------------
	//  description
	//----------------------------------

	/**
	 * The string description minus the doc tags.
	 */
	function getDescription():String;

	/**
	 * Sets the description of the client.
	 * 
	 * <p>When setting this value, the doc tags are left in tact. This only
	 * updates the string description.</p>
	 * 
	 * <p>This method is a shortcut for <code>IDocComment.setDescription()</code>.</p>
	 * 
	 * @see org.as3commons.asblocks.dom.IDocComment#setDescription(String)
	 */
	function setDescription(value:String):void;

	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Returns a reference to an object allowing manipulation of
	 * documentation associated with this <code>IDocCommentAware</code> API element.  
	 * 
	 * <p>If there is currently no documentation available, this method will
	 * return an 'empty' object, but modifications to that object will
	 * cause a documentation-comment to be created in the source code.</p>
	 * 
	 * @see org.as3commons.asblocks.dom.IDocComment
	 */
	function getDocumentation():IDocComment;
}
}