package org.as3commons.asblocks.impl
{
import org.as3commons.asblocks.dom.IASRegexpLiteral;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;

public class ASTASRegexpLiteral extends ASTLiteral implements IASRegexpLiteral
{
	// put in enum
	/** represents no active flags for a regexp */
	public static const FLAG_NONE:int = 0;
	/** represents the 'i' regexp flag */
	public static const FLAG_IGNORE_CASE:int = 0;
	/** represents the 'g' regexp flag */
	public static const FLAG_GLOBAL:int = 0;
	/** represents the 's' regexp flag */
	public static const FLAG_DOT_ALL:int = 0;
	/** represents the 'x' regexp flag */
	public static const FLAG_EXTENDED:int = 0;	
	
	public function ASTASRegexpLiteral(ast:LinkedListTree)
	{
		super(ast);
	}
}
}