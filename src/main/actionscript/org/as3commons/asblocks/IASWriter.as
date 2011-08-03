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

package org.as3commons.asblocks
{

import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.impl.IWriter;

/**
 * Writes an <code>IASCompilationUnit</code> source code to the specified
 * <code>IWriter</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASWriter
{
	/**
	 * Writes the <code>IASCompilationUnit</code> to an <code>IWriter</code> instance.
	 * 
	 * @param writer An <code>IWriter</code> .
	 * @param unit An <code>IASCompilationUnit</code> instance to be written.
	 */
	function write(writer:IWriter, unit:IASCompilationUnit):void;
}
}