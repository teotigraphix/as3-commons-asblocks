package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IFile;

public class FileProxy implements IFile
{
	// flash.filesystem.File
	protected var file:Object;
	
	public function getFile():Object
	{
		return file;
	}
	
	public function get name():String
	{
		return file.name;
	}
	
	public function get extension():String
	{
		return file.extension;
	}	
	
	public function get nativePath():String
	{
		return file.nativePath;
	}
	
	public function get isDirectory():Boolean
	{
		return file.isDirectory;
	}
	
	public function FileProxy(file:Object)
	{
		this.file = file;
	}
	
	public function getDirectoryListing():Array
	{
		return file.getDirectoryListing();
	}
}
}