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
 * A 'named parameter' within a metatag.
 * For example the following tag,
 * <pre>[Duplicatable(false, defaultValue="circular")]</pre>
 * has two parameters, the second of which is a named parameter.
 * If {@link ASMetaTag#getParams()} were called on the object
 * representing that example, the second value in the list
 * would be an ASMetaTag.Param instance which would return
 * "defaultValue" for getName() and the String "circular" for
 * getValue()
 */
public interface IASMetaTagParam
{
	function getName():String;
	
	function getValue():String;
}
}