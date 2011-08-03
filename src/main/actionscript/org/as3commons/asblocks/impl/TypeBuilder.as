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

package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.IASType;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class TypeBuilder
{
	/**
	 * Build a Type implementation (ASTAS*Type) appropriate for
	 * the type of the given AST node.
	 */
	public static function build(ast:LinkedListTree):IASType
	{
		switch (ast.type)
		{
		case AS3Parser.CLASS_DEF:
			return new ASTASClassType(ast);
		case AS3Parser.INTERFACE_DEF:
			return new ASTASInterfaceType(ast);
		case AS3Parser.FUNCTION_DEF:
			return new ASTASFunctionType(ast);
		case AS3Parser.VARIABLE_DEF:
			return new ASTASNamespaceType(ast);
		default:
			throw new ASBlocksSyntaxError("Unsupported type node type: "
					+ ASTUtils.tokenNameFromAST(ast) + " in "
					+ ASTUtils.str(ASTUtils.stringifyNode(ast)));
		}
	}
}
}