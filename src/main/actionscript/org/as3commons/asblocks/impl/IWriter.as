package org.as3commons.asblocks.impl
{

public interface IWriter
{
	function write(value:String):void;
	
	function flush():void;
	
	function close():void;
}
}