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

import org.as3commons.collections.framework.IList;

/**
 * Clients implement this interface to hold <code>IASMetaTag</code> ast.
 * 
 * @see org.as3commons.asblocks.dom.IASClassType
 * @see org.as3commons.asblocks.dom.IASInterfaceType
 * @see org.as3commons.asblocks.dom.IASField
 * @see org.as3commons.asblocks.dom.IASMethod
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IMetaTagAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  metaTags
	//----------------------------------
	
	/**
	 * The <code>IASMetaTag</code> nodes found on the host.
	 */
	function getMetaTags():IList;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Creates and returns a new <code>IASMetaTag</code> element.
	 * 
	 * @param name The String metadata name.
	 * @return An <code>IASMetaTag</code> instance.
	 */
	function newMetaTag(name:String):IASMetaTag;
	
	/**
	 * Returns the first <code>IASMetaTag</code> node named 
	 * <code>name</code>.
	 * 
	 * @param name A String indicating the first <code>IASMetaTag</code>
	 * node to return.
	 * @return An <code>IASMetaTag</code> named name.
	 */
	function getMetaTag(name:String):IASMetaTag;
	
	/**
	 * Returns all <code>IASMetaTag</code> nodes named <code>name</code>
	 * as a Vector.
	 * 
	 * <p>If <code>name</code> is <code>null</code>, the method will return
	 * all <code>IASMetaTag</code> contained on the host.</p>
	 * 
	 * @param name A String indicating the <code>IASMetaTag</code> nodes 
	 * to return.
	 * @return A Vector of <code>IASMetaTag</code> named name.
	 */
	function getAllMetaTags(name:String):IList;
	
	/**
	 * Returns whether the host contains metatag named <code>name</code>.
	 * 
	 * @param name A String indicating the metatag name to test.
	 * @return A Boolean indicating whether the metadata exists.
	 */
	function hasMetaTag(name:String):Boolean;
	
	/**
	 * Removes an <code>IASMetaTag</code> node from the host.
	 * 
	 * @param metaTag The <code>IASMetaTag</code> node to remove.
	 */
	function removeMetaTag(metaTag:IASMetaTag):Boolean;
}
}