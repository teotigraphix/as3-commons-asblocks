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
 * A 'metadata tag' which may be attached to types, methods or
 * fields.  A metadata tag is represented in ActionScript source code as a
 * definition within square brackets, that preceeds the API element to which
 * the metadata belongs.  For instance, this code defines the 'id' field to
 * have the metadata property 'Bindable':
 * <pre>
 * [Bindable]
 * public var id:Number;
 * </pre>
 */
public interface IASMetaTag extends IScriptElement, IDocCommentAware,
		IDisplayAware
{
	function getParameters():IList;
	
	function getParameterValue(name:String):Object;

	function addStringParam(value:String, name:String = null):void;

	function addIntParam(value:int, name:String = null):void;
	
	function addBooleanParam(value:Boolean, name:String = null):void;
}
}