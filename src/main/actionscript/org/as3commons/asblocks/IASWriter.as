package org.as3commons.asblocks
{

import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.impl.IWriter;

public interface IASWriter
{
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Writes the compilation unit to an <code>ISourceCode</code> instance.
	 * 
	 * @param code An <code>ISourceCode</code> instance holding the source
	 * code or fileName to parse.
	 * @param unit An <code>ICompilationUnit</code> instance to be written.
	 */
	function write(writer:IWriter, unit:IASCompilationUnit):void;
}
}