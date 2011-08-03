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
 * The <code>IASFunctionType</code> interface exposes documentation, metadata,
 * and single public <code>function</code> type.
 * 
 * <pre>
 * ASFactory factory = new ASFactory();
 * IASProject project = new ASFactory(factory);
 * IASCompilationUnit unit = project.newFunction("my.domain.myFunction");
 * IASFunctionType type = (IASFunctionType) unit.getType();
 * </pre>
 * 
 * <p>Will produce;</p>
 * <pre>
 * package my.domain {
 *     public function myFunction():void {
 *     }
 * }
 * </pre>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newFunction(String, String)
 * @see org.as3commons.asblocks.IASProject#newFunction(String, Visibility, String)
 * @see org.as3commons.asblocks.dom.IASCompilationUnit
 */
public interface IASFunctionType extends IASType, IFunctionCommon, IStatementContainer
{
	
	/**
	 * The return type of the function, this value may include a period.
	 * 
	 * <p>If a period is found in the type, the type is considered a
	 * qualified type else it is a simple type.</p>
	 */
	function getType():String;

	/**
	 * @private
	 */
	function setType(value:String):void;
}
}