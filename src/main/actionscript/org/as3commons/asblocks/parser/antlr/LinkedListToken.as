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

package org.as3commons.asblocks.parser.antlr
{

import flash.errors.IllegalOperationError;

import org.antlr.runtime.CommonToken;

/**
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class LinkedListToken extends CommonToken
{
	private var prev:LinkedListToken = null;
	
	private var next:LinkedListToken = null;
	
	public function LinkedListToken(type:int, text:String = null)
	{
		super(type, text);
	}
	
	public function getNext():LinkedListToken
	{
		return next;
	}

	public function setNext(next:LinkedListToken):void
	{
		if (this == next)
		{
			//throw new IllegalArgumentException("Token stream loop detected ("+toString()+")");
			throw new IllegalOperationError("Token stream loop detected ("+toString()+")");
		}
		
		this.next = next;
		
		if (next != null)
		{
			next.prev = this;
		}
	}

	public function getPrev():LinkedListToken {
		return prev;
	}

	public function setPrev(prev:LinkedListToken):void
	{
		if (this == prev)
		{
			throw new IllegalOperationError("Token stream loop detected");
		}
		
		this.prev = prev;
		
		if (prev != null)
		{
			prev.next = this;
		}
	}

	public function appendToken(insert:LinkedListToken):void
	{
		if (insert.getPrev() != null)
		{
			throw new IllegalOperationError("afterInsert("+insert+") : prev was not null");
		}
		
		if (insert.getNext() != null)
		{
			throw new IllegalOperationError("afterInsert("+insert+") : next was not null");
		}
		
		insert.next = next;
		insert.prev = this;
		
		if (next != null)
		{
			next.prev = insert;
		}
		next = insert;
	}

	public function prependToken(insert:LinkedListToken):void
	{
		if (insert.getPrev() != null)
		{
			throw new IllegalOperationError("beforeInsert("+insert+") : prev was not null");
		}
		
		if (insert.getNext() != null)
		{
			throw new IllegalOperationError("beforeInsert("+insert+") : next was not null");
		}
		
		insert.prev = prev;
		insert.next = this;
		
		if (prev != null)
		{
			prev.next = insert;
		}
		prev = insert;
	}

	public function deleteToken():void
	{
		if (prev != null)
		{
			prev.next = next;
		}
		if (next != null)
		{
			next.prev = prev;
		}
		next = prev = null;
	}
}
}