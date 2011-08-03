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

import flash.filesystem.File;

import org.as3commons.asblocks.dom.IResourceRoot;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.IList;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.StringUtils;
import org.as3commons.asblocks.dom.ASQName;

/**
 * A ResourceRoot implementation that finds QNames from ActionScript source
 * files in a source folder hierarchy.
 */
public class SourceFolderResourceRoot implements IResourceRoot
{
	private var path:File;

	private var qnames:IList = null; // ASQName

	/**
	 * @param path
	 */
	public function SourceFolderResourceRoot(path:File)
	{
		this.path = path;
	}

	public function getDefinitionQNames():IList
	{
		if (qnames == null)
		{
			var result:IList = new ArrayList();
			loadQNames("", result);
			qnames = toQNames(result);
		}
		return qnames;
	}

	private function toQNames(files:IList):IList
	{
		var result:IList = new ArrayList();
		for (var i:IIterator = files.iterator(); i.hasNext();)
		{
			var file:String = i.next();
			result.add(toQName(file));
		}
		return result;
	}

	private function toQName(file:String):ASQName
	{
		if (StringUtils.endsWith(file, ".as"))
		{
			var typeName:String = file.replace(File.separator, '.').substring(0, file.length - 3);
			return new ASQName(typeName);
		}
		else if (StringUtils.endsWith(file, ".mxml"))
		{
			var mtypeName:String = file.replace(File.separator, '.').substring(0, file.length - 5);
			return new FXQname(mtypeName, new File(path.nativePath));
		}
		throw new IllegalArgumentError("Unkown file type for Resource " + file);
	}

	private function loadQNames(subfolder:String, result:IList):void
	{
		var here:File = new File(subfolder + File.separator + path);
		var list:Array = here.getDirectoryListing();
		for (var i:int = 0; i < list.length; i++)
		{
			var entry:File = list[i];
			var name:String = entry.name;
			var newname:String;
			if (subfolder.length == 0)
			{
				newname = name;
			}
			else
			{
				newname = subfolder + File.separator + name;
			}
			if (entry.isDirectory)
			{
				loadQNames(newname, result);
			}
			else
			{
				if (StringUtils.endsWith(name, ".as") || StringUtils.endsWith(name, ".mxml"))
				{
					result.add(newname);
				}
			}
		}
	}

	public function getPath():File
	{
		return path;
	}
}
}