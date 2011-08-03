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

import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.IList;

/**
 * The comment node of an <code>IDocCommentAware</code> client.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.dom.IDocCommentAware
 */
public interface IDocComment extends IScriptElement
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
	 * The <code>String</code> description of the comment.
	 * 
	 * <p>The description is all text minus an doc tags.</p>
	 * 
	 * @throws ASBlocksSyntaxError if the given text contains an end-of-comment
	 *         marker, or a tagged-paragraph
	 */
	function getDescription():String;

	/**
	 * @see #getDescription()
	 * 
	 * @param value A <code>String</code> either creating a new description
	 * or replacing the old description AST nodes.
	 */
	function setDescription(value:String):void;

	/**
	 * Returns the <code>String</code> short description based on period and line
	 * ending format.
	 * 
	 * @return The <code>String</code> short description.
	 */
	function getShortDescription():String;

	/**
	 * Returns the <code>String</code> long description based on period and line
	 * ending format of the short description.
	 * 
	 * <p>If there is only a short description, it will be returned.</p>
	 * 
	 * @return The <code>String</code> long description.
	 */
	function getLongDescription():String;

	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Creates and appends a <code>IDocTag</code> tag to the documentation.
	 * 
	 * @param name The name of the new doc tag.
	 * @param body The body of the new doc tag.
	 * @return A new <code>IDocTag</code> instance.
	 * @throws ASBlocksSyntaxError if the given text contains an end-of-comment
	 *         marker, or a tagged-paragraph
	 */
	function newDocTag(name:String, body:String = null):IDocTag;

	/**
	 * Returns a <code>boolean</code> indicating whether the documentation
	 * contains an <code>IDocTag</code> by the name <code>name</code>.
	 * 
	 * @param name The <code>String</code> doc tag name to search for.
	 * @return A <code>boolean</code>; <code>true</code> contains the tag or
	 * <code>false</code> does not contain the tag.
	 */
	function hasDocTag(name:String):Boolean;

	/**
	 * Returns an <code>Iterator</code> for all the tags by <code>name</code>.
	 * 
	 * <p>If the documentation does not contain any tags by name, the 
	 * <code>Iterator</code> is returned but containes nothing.</p>
	 * 
	 * @param name The name of <code>IDocTag</code> to return an 
	 * <code>Iterator</code> for.
	 * @return An <code>IDocTag</code> <code>Iterator</code>.
	 */
	function getTags(name:String):IIterator;

	/**
	 * Returns the first <code>IDocTag</code> found in the documentation,
	 * <code>null</code> if there are no tags by name.
	 * 
	 * @param name The <code>IDocTag</code> name to search for.
	 * @return An <code>IDocTag</code> or <code>null</code>.  
	 */
	function findFirstTag(name:String):IDocTag;

	/**
	 * Removes the tag from the documentation.
	 * 
	 * @param The <code>IDocTag</code> to remove.
	 */
	function removeDocTag(tag:IDocTag):Boolean;
}
}