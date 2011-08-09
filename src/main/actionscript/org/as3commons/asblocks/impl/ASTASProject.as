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

import org.antlr.runtime.tree.RewriteEmptyStreamException;
import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.ASFactory;
import org.as3commons.asblocks.IASParser;
import org.as3commons.asblocks.IASProject;
import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASFile;
import org.as3commons.asblocks.dom.IClassPathEntry;
import org.as3commons.asblocks.dom.IFile;
import org.as3commons.asblocks.dom.IResourceRoot;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.collections.ArrayList;
import org.as3commons.collections.Map;
import org.as3commons.collections.framework.ICollection;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.IList;
import org.as3commons.collections.framework.IMap;
import org.as3commons.collections.utils.Lists;
import org.as3commons.lang.HashArray;
import org.as3commons.lang.IllegalArgumentError;
import org.as3commons.lang.StringUtils;

/**
 * The default implementation of the <code>IASProject</code> API.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @productversion 1.0
 */
public class ASTASProject implements IASProject
{
	private var factory:ASFactory;

	private var compilationUnits:IList = new ArrayList();

	private var classPaths:IList = new ArrayList();

	private var classPathResourceRoots:IMap = new Map();

	private var outputLocation:String;

	private var sourcePaths:IList = new ArrayList();

	private var sourcePathResourceRoots:IMap = new Map();

	private var files:IMap = new Map();

	//--------------------------------------------------------------------------
	//
	//  IASProject API :: Properties
	//
	//--------------------------------------------------------------------------

	
	public function getCompilationUnits():IList
	{
		return compilationUnits; // TODO unmodifiable
	}
	
	public function getClassPathEntries():IList
	{
		return classPaths; // TODO unmodifiable
	}
	
	public function getClassPathResourceRoots():IList
	{
		return Lists.newArrayList(classPathResourceRoots.toArray());
	}
	
	public function getSourcePathEntries():IList
	{
		return sourcePaths; // TODO unmodifiable
	}
	
	public function getSourcePathResourceRoots():IList
	{
		return Lists.newArrayList(classPathResourceRoots.toArray());
	}
	
	public function getFile(file:IFile):IASFile
	{
		return files.itemFor(file.nativePath);
	}
	
	public function getFileForCompilationUnit(unit:IASCompilationUnit):IASFile
	{
		for each(var file:IASFile in files.toArray())
		{
			if (file.getCompilationUnit() == unit) // TODO equals()
			{
				return file;
			}
		}
		return null;
	}
	
	public function getASFiles():IList
	{
		return Lists.newArrayList(files.toArray());
	}
	
	public function getOutputLocation():String
	{
		return outputLocation;
	}
	
	public function setOutputLocation(outputLocation:String):void
	{
		this.outputLocation = outputLocation;
	}
	
	private function getAbsoluteOutputLocation():IFile
	{
		return FileUtil.newFile(outputLocation);
	}

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 * Constructor, creates a new project with the associated factory.
	 * 
	 * @param factory The <code>ASFactory</code> implementation used with the
	 * project. This instance will be used when creating types.
	 */
	public function ASTASProject(factory:ASFactory)
	{
		this.factory = factory;
	}

	//--------------------------------------------------------------------------
	//
	//  IASProject API :: Methods
	//
	//--------------------------------------------------------------------------
	
	public function addCompilationUnit(unit:IASCompilationUnit):Boolean
	{
		compilationUnits.add(unit);
		addFileUnit(unit);
		return true;
	}
	
	public function removeCompilationUnit(unit:IASCompilationUnit):Boolean
	{
		compilationUnits.remove(unit);
		//TODO removeFileUnit()
		return true;
	}
	
	public function addClassPath(classpathEntry:String):Boolean
	{
		if (classPaths.has(classpathEntry))
			return false;

		var root:IResourceRoot = resourceRootFor(classpathEntry);
		classPathResourceRoots.add(classpathEntry, root);
		classPaths.add(classpathEntry);

		return true;
	}
	
	public function removeClassPath(classPathEntry:String):Boolean
	{
		classPaths.remove(classPathEntry);
		classPathResourceRoots.remove(classPathEntry);
		return true;
	}
	
	public function addSourcePath(sourcePathEntry:String):Boolean
	{
		if (sourcePaths.has(sourcePathEntry))
			return false;

		var root:IResourceRoot = resourceRootFor(sourcePathEntry);
		sourcePathResourceRoots.add(sourcePathEntry, root);
		sourcePaths.add(sourcePathEntry);

		return true;
	}
	
	public function removeSourcePath(sourcePathEntry:String):Boolean
	{
		sourcePaths.remove(sourcePathEntry);
		sourcePathResourceRoots.remove(sourcePathEntry);
		return true;
	}

	
	public function newClass(qualifiedClassName:String):IASCompilationUnit
	{
		var unit:IASCompilationUnit = factory.newClass(qualifiedClassName);
		addCompilationUnit(unit);
		return unit;
	}

	
	public function newInterface(qualifiedInterfaceName:String):IASCompilationUnit
	{
		var unit:IASCompilationUnit = factory.newInterface(qualifiedInterfaceName);
		addCompilationUnit(unit);
		return unit;
	}

	
	public function newFunction(qualifiedName:String,
			visibility:Visibility, returnType:String):IASCompilationUnit
	{
		var unit:IASCompilationUnit = factory.newFunction(qualifiedName, returnType);
		addCompilationUnit(unit);
		return unit;
	}
	
	public function newNamespace(name:String, uri:String):IASCompilationUnit
	{
		var unit:IASCompilationUnit = factory.newNamespace(name, uri);
		addCompilationUnit(unit);
		return unit;
	}
	
	public function readAll():void
	{
		var failedFiles:IList = new ArrayList();

		for each(var root:IResourceRoot in sourcePathResourceRoots.toArray())
		{
			var qnames:IList = root.getDefinitionQNames();
			for each(var qname:ASQName in qnames.toArray())
			{
				trace(qname.toString());
				var asparser:IASParser = factory.newParser();
//				var fxparser:IASParser = new ASTFXParser();

				var file:IFile = toSourceFile(root.getPath(), qname);

//				FileInputStream in;
				var unit:IASCompilationUnit;
				try
				{
					if (StringUtils.endsWith(file.nativePath, ".as"))
					{
//						in = new FileInputStream(file);
//						unit = asparser.parseHighlevelIn(new InputStreamReader(
//								in));
//						addCompilationUnit(unit);
					}
					else if (StringUtils.endsWith(file.nativePath, ".mxml"))
					{
//						in = new FileInputStream(file);
//						unit = fxparser.parseIn(new InputStreamReader(in));
//						((ASTFXCompilationUnit) unit).setQName((FXQname) qname);
//						addCompilationUnit(unit);
					}

					//addFile(file, unit);
				}
				catch (e:ASBlocksSyntaxError)
				{
//					String error = file.getAbsolutePath() + "\n" + "-"
//							+ e.getMessage();
//
//					System.err.println(error);
//
					failedFiles.add(e);
				}
				catch (e:RewriteEmptyStreamException)
				{
//					String error = file.getAbsolutePath() + "\n" + "-"
//							+ e.getMessage();
//
//					System.err.println(error);

					failedFiles.add(e);
				}
				//InputStream in = getClass().getClassLoader().getResourceAsStream("AllSyntax.as");
				//ActionScriptParser parser = fact.newParser();
				//ASCompilationUnit unit = parser.parse(new InputStreamReader(in));				

			}
		}
		trace("done");
	}

	private function addFile(file:IFile, unit:IASCompilationUnit):void
	{
//		files.add(file.nativePath, new ASTASFile(file, unit));
	}

	private function toSourceFile(path:IFile, name:ASQName):IFile
	{
//		if (name instanceof FXQname)
//		{
//			String base = path.getAbsolutePath();
//			String tail = name.toString().replace(".", File.separator);
//			return new File(base + File.separator + tail + ".mxml");
//		}
//		else
//		{
			var base:String = path.nativePath;
			var tail:String = name.toString().replace(".", FileUtil.separator);
			return FileUtil.newFile(base + FileUtil.separator + tail + ".as");
//		}
	}

	
	public function writeAll():void
	{
		for (var i:IIterator = compilationUnits.iterator(); i.hasNext();)
		{
			var cu:IASCompilationUnit = i.next() as IASCompilationUnit;
			write(outputLocation, cu);
		}
	}

	//--------------------------------------------------------------------------
	//
	//  Private :: Methods
	//
	//--------------------------------------------------------------------------

	private function resourceRootFor(classpathEntry:String):IResourceRoot
	{
		var path:IFile;
		if (classpathEntry == ".")
		{
			path = FileUtil.applicationDirectory;
		}
		else
		{
			// add try {}
			path = FileUtil.newFile(classpathEntry);
		}
		
		if (path.isDirectory)
		{
			return new SourceFolderResourceRoot(path);
		}
		if (StringUtils.endsWith(classpathEntry, ".swc"))
		{
			try
			{
//				return new SWCResourceRoot(path);
			}
			catch (e:Error)
			{
//				throw new RuntimeException(e);
			}
		}
		throw new IllegalArgumentError("Unknown resorce type: "
				+ classpathEntry);
	}

	public function performAutoImport():void
	{
		//AutoImporter autoImporter = new AutoImporter();
		//autoImporter.performAutoImport(this);
	}

	/**
	 * Writes the ActionScript code in the given CompilationUnit to the
	 * given directory, creating any subfolders for package hierarchy as
	 * appropriate, and deriving the filename from the name of the type
	 * defined by the compilation unit.
	 */
	private function write(destinationDir:String, cu:IASCompilationUnit):void
	{
		var path:String = filenameFor(cu);
		var base:String = outputLocation;
		if (base == ".")
		{
			base = FileUtil.applicationDirectory.nativePath;
		}
		
		var out:StringWriter = new StringWriter();
		factory.newWriter().write(out, cu);		
		var file:IFile = FileUtil.newFile(base);
		file = FileUtil.resolvePath(file, path);
		FileUtil.writeFile(file, out.toString());
	}

	private static function filenameFor(unit:IASCompilationUnit):String
	{
		var name:String;
		var pkg:String = unit.getPackageName();
		if (pkg == null || pkg == "")
		{
			name = unit.getType().getName();
		}
		else
		{
			name = unit.getPackageName() + "." + unit.getType().getName();
		}
		return name.split(".").join(FileUtil.separator) + ".as";
	}

	private function addFileUnit(unit:IASCompilationUnit):void
	{
//		var path:File = getAbsoluteOutputLocation();
//		var file:File = toSourceFile(path, unit.getQName());
//		addFile(file, unit);
	}
}
}