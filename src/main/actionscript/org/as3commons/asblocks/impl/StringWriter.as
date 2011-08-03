package org.as3commons.asblocks.impl
{

import org.as3commons.lang.StringBuffer;

public class StringWriter implements IWriter
{
	private var buffer:StringBuffer;
	
	public function StringWriter()
	{
		buffer = new StringBuffer();
	}
	
	public function write(value:String):void
	{
		buffer.append(value);
	}
	
	public function flush():void
	{
		buffer = new StringBuffer();
	}
	
	public function close():void
	{
		flush();
	}
	
	public function toString():String
	{
		return buffer.toString();
	}
}
}