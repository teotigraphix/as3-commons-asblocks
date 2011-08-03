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
import org.as3commons.asblocks.impl.IReader;

/**
 * The <code>IASParser</code> defines an abstract way to interact with the
 * <code>AS3Parser</code>.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public interface IASParser
{
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------

	/**
	 * Parses the <code>String</code> source code data.
	 * 
	 * @param source The <code>String</code> source code.
	 * @return An <code>IASCompilationUnit</code> detailing the AST source code
	 * tree.
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError
	 * 
	 * @since 1.0
	 */
	function parse(source:String):IASCompilationUnit;

	/**
	 * Parses the <code>Reader</code>s source code data.
	 * 
	 * @param reader The <code>Reader</code> holding source code.
	 * @return An <code>IASCompilationUnit</code> detailing the AST source code
	 * tree.
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError
	 * 
	 * @since 1.0
	 */
	function parseIn(reader:IReader):IASCompilationUnit;

	/**
	 * Parses the <code>String</code> source code data at a highlevel.
	 * 
	 * <p>Highlevel parsing entails skipping anything under a 
	 * <code>METHOD_DEF</code> block. Using this form of parsing speeds the
	 * parsing up by at least 10</p>
	 * 
	 * <p>Documenting type applications can benefit from this version of
	 * parsing. Also note, since the parser uses linked list tokens it's
	 * possible to selectively parse the blocks beneath the <code>METHOD_DEF</code> 
	 * block after the initial parse pass.</p>
	 * 
	 * @param source The <code>String</code> source code.
	 * @return An <code>IASCompilationUnit</code> detailing the AST source code
	 * tree.
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError
	 * 
	 * @since 1.0
	 */
	function parseHighlevel(source:String):IASCompilationUnit;

	/**
	 * Parses the <code>Reader</code>s source code data at a highlevel.
	 * 
	 * @param reader The <code>Reader</code> holding source code.
	 * @return An <code>IASCompilationUnit</code> detailing the AST source code
	 * tree.
	 * @throws org.as3commons.asblocks.ASBlocksSyntaxError
	 * 
	 * @since 1.0
	 * @see #parseHighlevel()
	 */
	function parseHighlevelIn(reader:IReader):IASCompilationUnit;
}
}