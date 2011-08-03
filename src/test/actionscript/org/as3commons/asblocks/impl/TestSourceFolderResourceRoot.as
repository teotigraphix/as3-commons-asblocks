package org.as3commons.asblocks.impl
{
import flash.filesystem.File;

import org.as3commons.asblocks.dom.ASQName;
import org.as3commons.collections.framework.IList;

public class TestSourceFolderResourceRoot
{
	private var tmpDir:File;
	
	private var tmpFile1:File;
	private var tmpFile2:File;
	
	private var tmpPkg:File;
	/*
	public void setUp() throws IOException
	{
		tmpDir = File.createTempFile();
		tmpDir.mkdir();
		
		tmpFile1 = new File(tmpDir, "Test.as");
		tmpFile1.createNewFile();
		
		tmpPkg = new File(tmpDir, "pkg");
		tmpPkg.mkdir();
		
		tmpFile2 = new File(tmpPkg, "Test2.as");
		tmpFile2.createNewFile();
	}

	public void tearDown() throws IOException
	{
		assertTrue(tmpFile1.deleteFile());
		assertTrue(tmpFile2.deleteFile());
		assertTrue(tmpPkg.deleteFile());
		assertTrue(tmpDir.deleteFile());
	}
	
	@Test
	public void test_resourceRoot()
	{
		var resourceRoot:SourceFolderResourceRoot = new SourceFolderResourceRoot(tmpDir);
		var qnames:IList = resourceRoot.getDefinitionQNames();
		assertEquals(2, qnames.size);
		assertEquals(new ASQName("pkg", "Test2"), qnames.itemAt(0));
		assertEquals(new ASQName("Test"), qnames.itemAt(1));
	}
	*/
}
}