package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.ASBlocksSyntaxError;
import org.as3commons.asblocks.dom.IASCompilationUnit;
import org.as3commons.asblocks.dom.IASField;
import org.as3commons.asblocks.dom.IASMethod;
import org.as3commons.asblocks.dom.Visibility;
import org.as3commons.asblocks.parser.antlr.LinkedListToken;
import org.as3commons.asblocks.parser.antlr.LinkedListTree;
import org.as3commons.asblocks.parser.antlr.as3.AS3Parser;

public class ASTTypeBuilder
{
	public static function newClass(qualifiedName:String):IASCompilationUnit
	{
		return synthesizeClass(qualifiedName);
	}

	public static function newInterface(qualifiedName:String):IASCompilationUnit
	{
		return synthesizeInterface(qualifiedName);
	}

	public static function newFunction(qualifiedName:String,
			returnType:String):IASCompilationUnit
	{
		return synthesizeFunction(qualifiedName, returnType);
	}

	public static function newNamespace(qualifiedName:String,
			uri:String):IASCompilationUnit
	{
		return synthesizeNamespace(qualifiedName, uri);
	}

	public static function synthesizeClass(qualifiedName:String):ASTASCompilationUnit
	{
		// add the CU
		var unit:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILATION_UNIT);
		var packageAST:LinkedListTree = ASTUtils.newAST(AS3Parser.PACKAGE, "package");
		packageAST.appendToken(TokenBuilder.newSpace());

		// add the CU/PACKAGE
		unit.addChildWithTokens(packageAST);

		var packageName:String = packageNameFrom(qualifiedName);
		if (packageName != null)
		{
			// add the CU/PACKAGE/TYPE
			var space:LinkedListToken = TokenBuilder.newSpace();
			var typeSpec:LinkedListTree = AS3FragmentParser.parseType(packageName);
			packageAST.addChildWithTokens(typeSpec);
			// add the space to the typeSpec so it gets removed when the name is removed
			typeSpec.appendToken(space);
		}

		var packageBlock:LinkedListTree = ASTBuilder.newBlock();
		// add the CU/PACKAGE/BLOCK/ANNOTATIONS
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);

		// ad the CU/PACKAGE/BLOCK
		packageAST.addChildWithTokens(packageBlock);
		var className:String = typeNameFrom(qualifiedName);

		var clazz:LinkedListTree = synthesizeAS3ClassAST(className);
		ASTUtils.addChildWithIndentation(packageBlock, clazz);

		packageBlock.addChildAtWithTokens(0, annos);

		return new ASTASCompilationUnit(unit);
	}

	public static function synthesizeInterface(qualifiedName:String):IASCompilationUnit
	{
		var unit:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILATION_UNIT);
		var packageAST:LinkedListTree = ASTUtils.newAST(AS3Parser.PACKAGE, "package");
		packageAST.appendToken(TokenBuilder.newSpace());

		// add the CU/PACKAGE
		unit.addChildWithTokens(packageAST);

		var packageName:String = packageNameFrom(qualifiedName);
		if (packageName != null)
		{
			// add the CU/PACKAGE/TYPE
			var space:LinkedListToken = TokenBuilder.newSpace();
			var typeSpec:LinkedListTree = AS3FragmentParser.parseType(packageName);
			packageAST.addChildWithTokens(typeSpec);
			// add the space to the typeSpec so it gets removed when the name is removed
			typeSpec.appendToken(space);
		}

		var packageBlock:LinkedListTree = ASTBuilder.newBlock();
		// add the CU/PACKAGE/BLOCK/ANNOTATIONS
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);

		// ad the CU/PACKAGE/BLOCK
		packageAST.addChildWithTokens(packageBlock);

		var iface:LinkedListTree = synthesizeAS3InterfaceAST(qualifiedName);
		ASTUtils.addChildWithIndentation(packageBlock, iface);

		packageBlock.addChildAtWithTokens(0, annos);

		return new ASTASCompilationUnit(unit);
	}

	public static function synthesizeFunction(qualifiedName:String,
			returnType:String):ASTASCompilationUnit
	{
		// add the CU
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILATION_UNIT);

		var packageAST:LinkedListTree = ASTUtils.newAST(AS3Parser.PACKAGE, "package");
		packageAST.appendToken(TokenBuilder.newSpace());
		// add the CU/PACKAGE
		ast.addChildWithTokens(packageAST);

		var packageName:String = packageNameFrom(qualifiedName);
		if (packageName != null)
		{
			// add the CU/PACKAGE/TYPE
			var space:LinkedListToken = TokenBuilder.newSpace();
			var typeSpec:LinkedListTree = AS3FragmentParser.parseType(packageName);
			packageAST.addChildWithTokens(typeSpec);
			// add the space to the typeSpec so it gets removed when the name is removed
			typeSpec.appendToken(space);
		}

		var packageBlock:LinkedListTree = ASTBuilder.newBlock();
		// add the CU/PACKAGE/BLOCK/ANNOTATIONS
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);

		// ad the CU/PACKAGE/BLOOCK
		packageAST.addChildWithTokens(packageBlock);
		var functionName:String = typeNameFrom(qualifiedName);

		var clazz:LinkedListTree = synthesizeAS3FunctionAST(functionName, returnType);
		ASTUtils.addChildWithIndentation(packageBlock, clazz);

		// add the annos last so the indentation of the CLASS_DEF dosn't mess up
		packageBlock.addChildAtWithTokens(0, annos);

		return new ASTASCompilationUnit(ast);
	}

	public static function synthesizeNamespace(
			qualifiedName:String, uri:String):ASTASCompilationUnit
	{
		// add the CU
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.COMPILATION_UNIT);

		var packageAST:LinkedListTree = ASTUtils.newAST(AS3Parser.PACKAGE, "package");
		packageAST.appendToken(TokenBuilder.newSpace());
		// add the CU/PACKAGE
		ast.addChildWithTokens(packageAST);

		var packageName:String = packageNameFrom(qualifiedName);
		if (packageName != null)
		{
			// add the CU/PACKAGE/TYPE
			var space:LinkedListToken = TokenBuilder.newSpace();
			var typeSpec:LinkedListTree = AS3FragmentParser.parseType(packageName);
			packageAST.addChildWithTokens(typeSpec);
			// add the space to the typeSpec so it gets removed when the name is removed
			typeSpec.appendToken(space);
		}

		var packageBlock:LinkedListTree = ASTBuilder.newBlock();
		// add the CU/PACKAGE/BLOCK/ANNOTATIONS
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);

		// ad the CU/PACKAGE/BLOOCK
		packageAST.addChildWithTokens(packageBlock);
		var functionName:String = typeNameFrom(qualifiedName);

		var nspace:LinkedListTree = synthesizeAS3NamespaceAST(functionName, uri);
		ASTUtils.addChildWithIndentation(packageBlock, nspace);

		// add the annos last so the indentation of the CLASS_DEF dosn't mess up
		packageBlock.addChildAtWithTokens(0, annos);

		return new ASTASCompilationUnit(ast);
	}

	private static function synthesizeAS3NamespaceAST(
			qualifiedName:String, uri:String):LinkedListTree
	{
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.VARIABLE_DEF);
		var modifiers:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.MODIFIERS);
		ast.addChildWithTokens(modifiers);
		modifiers.addChildWithTokens(ASTUtils.newAST(AS3Parser.PUBLIC, "public"));
		modifiers.appendToken(TokenBuilder.newSpace());
		ast.addChildWithTokens(ASTUtils.newAST(AS3Parser.NAMESPACE, "namespace"));
		ast.appendToken(TokenBuilder.newSpace());

		var varDec:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.VAR_DEC);
		varDec.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, typeNameFrom(qualifiedName)));
		var assign:LinkedListTree = ASTUtils.newAST(AS3Parser.ASSIGN, "=");
		assign.addChildWithTokens(ASTUtils.newASTFromToken(ASTUtils.newStringLiteral(uri)));
		varDec.addChildWithTokens(assign);
		ast.addChildWithTokens(varDec);

		ast.appendToken(TokenBuilder.newSemi());
		return ast;
	}

	private static function synthesizeAS3InterfaceAST(qualifiedName:String):LinkedListTree
	{
		var iface:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.INTERFACE_DEF);
		var modifiers:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.MODIFIERS);
		iface.addChildWithTokens(modifiers);
		modifiers.addChildWithTokens(ASTUtils.newAST(AS3Parser.PUBLIC, "public"));
		modifiers.appendToken(TokenBuilder.newSpace());
		iface.appendToken(TokenBuilder.newInterface());
		iface.appendToken(TokenBuilder.newSpace());
		iface.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, typeNameFrom(qualifiedName)));
		iface.appendToken(TokenBuilder.newSpace());
		iface.addChildWithTokens(ASTBuilder.newTypeBlock());
		return iface;
	}

	private static function typeNameFrom(qualifiedName:String):String
	{
		var p:int = qualifiedName.lastIndexOf('.');
		if (p == -1)
		{
			return qualifiedName;
		}
		return qualifiedName.substring(p + 1);
	}

	private static function synthesizeAS3ClassAST(className:String):LinkedListTree
	{
		var clazz:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.CLASS_DEF);
		var modifiers:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.MODIFIERS);
		clazz.addChildWithTokens(modifiers);
		var modPublic:LinkedListTree = ASTUtils.newAST(AS3Parser.PUBLIC, "public");
		modifiers.addChildWithTokens(modPublic);
		modifiers.appendToken(TokenBuilder.newSpace());
		clazz.appendToken(TokenBuilder.newClass());
		clazz.appendToken(TokenBuilder.newSpace());
		clazz.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, className));
		clazz.appendToken(TokenBuilder.newSpace());
		clazz.addChildWithTokens(ASTBuilder.newTypeBlock());
		return clazz;
	}

	private static function synthesizeAS3FunctionAST(functionName:String,
			returnType:String):LinkedListTree
	{
		var clazz:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.FUNCTION_DEF);
		var modifiers:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.MODIFIERS);
		clazz.addChildWithTokens(modifiers);
		var modPublic:LinkedListTree = ASTUtils.newAST(AS3Parser.PUBLIC, "public");
		modifiers.addChildWithTokens(modPublic);
		modifiers.appendToken(TokenBuilder.newSpace());
		clazz.appendToken(TokenBuilder.newFunction());
		clazz.appendToken(TokenBuilder.newSpace());
		clazz.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, functionName));

		clazz.addChildWithTokens(ASTUtils.newParentheticAST(AS3Parser.PARAMS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")"));
		if (returnType != null)
		{
			clazz.addChildWithTokens(AS3FragmentParser.parseTypeSpec(returnType));
		}

		clazz.appendToken(TokenBuilder.newSpace());
		clazz.addChildWithTokens(ASTBuilder.newBlock());
		return clazz;
	}

	private static function packageNameFrom(qualifiedName:String):String
	{
		var p:int = qualifiedName.lastIndexOf('.');
		if (p == -1)
		{
			return null;
		}
		return qualifiedName.substring(0, p);
	}

	public static function newField(name:String, visibility:Visibility,
			type:String):IASField
	{
		if (name.indexOf('.') != -1)
		{
			throw new ASBlocksSyntaxError("field name must not contain '.'");
		}
		var ast:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.FIELD_DEF);
		var annotations:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);
		ast.addChildWithTokens(annotations);
		ast.addChildWithTokens(ModifierUtils.toModifiers(visibility));
		ast.addChildWithTokens(ASTUtils.newAST(AS3Parser.VAR, "var"));
		ast.appendToken(TokenBuilder.newSpace());

		var varDec:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.VAR_DEC);
		var def:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, name);
		varDec.addChildWithTokens(def);

		ast.addChildWithTokens(varDec);
		if (type != null)
		{
			varDec.addChildWithTokens(AS3FragmentParser.parseTypeSpec(type));
		}
		ast.appendToken(TokenBuilder.newSemi());

		var field:IASField = new ASTASField(ast);

		return field;
	}
/*
	public static IASNamespace newNamespace(String name, String uri,
			Visibility visibility)
	{
		LinkedListTree ast = ASTUtils.newImaginaryAST(AS3Parser.FIELD_DEF);
		LinkedListTree annotations = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);
		ast.addChildWithTokens(annotations);
		ast.addChildWithTokens(ModifierUtils.toModifiers(visibility));

		ast.addChildWithTokens(ASTUtils.newAST(AS3Parser.NAMESPACE, "namespace"));

		ast.appendToken(TokenBuilder.newSpace());

		LinkedListTree varDec = ASTUtils.newImaginaryAST(AS3Parser.VAR_DEC);
		varDec.addChildWithTokens(ASTUtils.newAST(AS3Parser.IDENT, name));
		LinkedListTree assign = ASTUtils.newAST(AS3Parser.ASSIGN, "=");
		assign.addChildWithTokens(ASTUtils.newAST(ASTUtils.newStringLiteral(uri)));
		varDec.addChildWithTokens(assign);
		ast.addChildWithTokens(varDec);

		ast.appendToken(TokenBuilder.newSemi());
		return new ASTASNamespace(ast);
	}
*/
	public static function newClassMethod(name:String, visibility:Visibility,
			returnType:String):IASMethod
	{
		var def:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.METHOD_DEF);
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);
		def.addChildWithTokens(annos);

		def.addChildWithTokens(ModifierUtils.toModifiers(visibility));
		def.appendToken(TokenBuilder.newFunction());
		def.appendToken(TokenBuilder.newSpace());
		var acc:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ACCESSOR_ROLE);
		def.addChildWithTokens(acc);
		var methName:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, name);
		def.addChildWithTokens(methName);
		def.addChildWithTokens(ASTUtils.newParentheticAST(AS3Parser.PARAMS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")"));

		if (returnType != null)
		{
			def.addChildWithTokens(AS3FragmentParser.parseTypeSpec(returnType));
		}
		def.appendToken(TokenBuilder.newSpace());
		var block:LinkedListTree = ASTBuilder.newBlock();
		def.addChildWithTokens(block);

		return new ASTASMethod(def);
	}

	public static function newInterfaceMethod(name:String,
			visibility:Visibility, returnType:String):IASMethod
	{
		var def:LinkedListTree = ASTUtils.newImaginaryAST(AS3Parser.METHOD_DEF);
		var annos:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ANNOTATIONS);
		def.addChildWithTokens(annos);
		//def.addChildWithTokens(ModifierUtils.toModifiers(visibility));
		// all interface methods have default (public) visibility
		//def.addChildWithTokens(ModifierUtils.toModifiers(Visibility.DEFAULT));
		def.appendToken(TokenBuilder.newFunction());
		def.appendToken(TokenBuilder.newSpace());
		var acc:LinkedListTree = ASTUtils.newPlaceholderAST(AS3Parser.ACCESSOR_ROLE);
		def.addChildWithTokens(acc);
		var methName:LinkedListTree = ASTUtils.newAST(AS3Parser.IDENT, name);
		def.addChildWithTokens(methName);
		def.addChildWithTokens(ASTUtils.newParentheticAST(AS3Parser.PARAMS, AS3Parser.LPAREN, "(", AS3Parser.RPAREN, ")"));
		if (returnType != null)
		{
			def.addChildWithTokens(AS3FragmentParser.parseTypeSpec(returnType));
		}
		def.appendToken(TokenBuilder.newSemi());

		return new ASTASMethod(def);
	}
}
}