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
 * The <code>IASPackage</code> holds the public <code>IASClassType</code>,
 * <code>IASInterfaceType</code> and <code>IASFunctionType</code> type definitions.
 * 
 * <p>This package type gets created as a side-effect from creating one of the above
 * types in a compilation unit.</p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newClass(String)
 * @see org.as3commons.asblocks.ASFactory#newInterface(String)
 * @see org.as3commons.asblocks.ASFactory#newFunction(String, String)
 * @see org.as3commons.asblocks.ASFactory#newNamespace(String, String)
 * @see org.as3commons.asblocks.IASProject#newClass(String)
 * @see org.as3commons.asblocks.IASProject#newInterface(String)
 * @see org.as3commons.asblocks.IASProject#newFunction(String, Visibility, String)
 * @see org.as3commons.asblocks.IASProject#newNamespace(String, String)
 */
public interface IASPackage extends IScriptElement, IMetaTagAware,
		IIncludeAware, IImportAware, IUseAware, IQNameAware, IDisplayAware
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The package's <code>IASCompilationUnit</code> parent.
	 */
	function getParent():IASCompilationUnit;

	//----------------------------------
	//  name
	//----------------------------------
	
	/**
	 * @private
	 */
	function setName(value:String):void;

	//----------------------------------
	//  typeNode
	//----------------------------------

	/**
	 * The <code>public</code> type, class, interface or function.
	 */
	function getType():IASType;
}
}