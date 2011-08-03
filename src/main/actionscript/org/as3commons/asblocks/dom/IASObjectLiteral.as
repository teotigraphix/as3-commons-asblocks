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
 * An Object literal; <code>{a:1, b:2, c:3}</code>.
 * 
 * <pre>
 * IASObjectLiteral ol = factory.newObjectLiteral();
 * </pre>
 * 
 * <p>Will produce; <code>{}</code></p>
 * 
 * <pre>
 * IASObjectLiteral ol = factory.newObjectLiteral();
 * IASPropertyField p1 = ol.newField("a", factory.newExpression("bar"));
 * IASPropertyField p2 = ol.newField("b", factory.newExpression("2"));
 * IASPropertyField p3 = ol.newField("c", factory.newExpression("{}"));
 * List&lt;IASPropertyField&gt; fields = ol.getFields();
 * // name=a value=bar
 * System.out.println("name=" + p1.getName() + " value=" + p1.getValue().toString());
 * </pre>
 * 
 * <p>Will produce; <code>{a:bar, b:2, c:{}}</code></p>
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 * 
 * @see org.as3commons.asblocks.ASFactory#newObjectLiteral()
 */
public interface IASObjectLiteral extends IASLiteral
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The object literal's <code>List of property fields.
	 */
	function getFields():IList; // IASPropertyField
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Creates a new <code>IASPropertyField</code> on the object literal.
	 * 
	 * @param A <code>String</code> indicating the name of the field.
	 * @param An <code>IASExpression</code> attached to the field name.
	 * @return A new <code>IASPropertyField</code> instance.
	 */
	function newField(name:String, expression:IASExpression):IASPropertyField;
}
}