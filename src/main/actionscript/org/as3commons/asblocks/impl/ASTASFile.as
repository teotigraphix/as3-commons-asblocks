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

import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASFile;
import org.as3commons.asblocks.dom.IFile;

public class ASTASFile implements IASFile
{
	private var file:IFile;
	
	private var unit:IASCompilationUnit;
	
	public function ASTASFile(file:IFile, unit:IASCompilationUnit)
	{
		this.file = file;
		this.unit = unit;
	}
	
	public function getFile():IFile
	{
		return file;
	}
	
	public function getCompilationUnit():IASCompilationUnit
	{
		return unit;
	}
	
	public function getQName():ASQName
	{
		return unit.getQName();
	}
}
}