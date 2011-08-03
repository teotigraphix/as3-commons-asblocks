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

package org.as3commons.asblocks.dom
{
import org.as3commons.lang.StringBuffer;


/*
 * ASQName
 * 
 * IASCompilationPackage [singleton]
 *   - localName                       core
 *   - packageName                     my.domain
 *   - qualifiedName                   my.domain.core
 * 
 * IASCompilationUnit
 *   - localName                       MyClass
 *   - packageName                     my.domain.core
 *   - qualifiedName                   my.domain.core.MyClass
 * 
 * IASPackage [foreach IASCompilationUnit]
 *   - localName                       core
 *   - packageName                     my.domain
 *   - qualifiedName                   my.domain.core
 *   
 * IASType
 *   - localName                       MyClass
 *   - packageName                     my.domain.core
 *   - qualifiedName                   my.domain.core.MyClass
 * 
 * IASField
 *   - localName                       myField
 *   - packageName                     my.domain.core
 *   - qualifiedName                   my.domain.core.MyClass#myField
 * 
 * IASMethod
 *   - localName                       myMethod()
 *   - packageName                     my.domain.core
 *   - qualifiedName                   my.domain.core.MyClass#myMethod()
 * 
 * IASMetaTag                          [[[my.domain.core].MyClass]#[[style]:[myStyle]]]
 *   - localName                       myStyle
 *   - packageName                     my.domain.core
 *   - qualifiedName                   my.domain.core.MyClass#style:myStyle
 *   - fragmentName                    style:myStyle
 * 
 */

/**
 * Adds the ability for types to become dynamic.
 * 
 * @author Michael Schmalle
 * @copyright Teoti Graphix, LLC
 * @since 1.0
 */
public class ASQName
{
	private var packageName:String = null;
	private var localName:String = null;
	private var fragmentName:String = null;
	private var fragmentType:String = null;

	public function ASQName(qname:String)
	{
		if (qname == null)
			return;
		
		var pos:int = qname.lastIndexOf('.');
		if (pos != -1)
		{
			packageName = qname.substring(0, pos);
			parse(qname.substring(pos + 1));
		}
		else
		{
			packageName = null;
			parse(qname);
		}
	}

	private function parse(data:String):void
	{
		var pos:int = data.indexOf('#');
		if (pos != -1)
		{
			// next :: MyClass#myVariable
			localName = data.substring(0, pos);
			fragmentName = data.substring(pos + 1);

			pos = fragmentName.indexOf(':');
			if (pos != -1)
			{
				fragmentType = fragmentName.substring(0, pos);
				fragmentName = fragmentName.substring(pos + 1);
			}
		}
		else
		{
			localName = data;
		}
	}

	public static function int2ASQName(packageName:String, localName:String):ASQName
	{
		var o:ASQName = new ASQName(null);
		o.packageName = packageName;
		o.localName = localName;
		return o;
	}

	public static function int3ASQName(packageName:String, localName:String, fragmentName:String):ASQName
	{
		var o:ASQName = new ASQName(null);
		o.packageName = packageName;
		o.localName = localName;
		o.fragmentName = fragmentName;
		return o;
	}

	public static function int4ASQName(packageName:String, localName:String, fragmentName:String,
			fragmentType:String):ASQName
	{
		var o:ASQName = new ASQName(null);
		o.packageName = packageName;
		o.localName = localName;
		o.fragmentType = fragmentType;
		o.fragmentName = fragmentName;
		return o;
	}

	public function isQualified():Boolean
	{
		return packageName != null;
	}

	public function hasFragment():Boolean
	{
		return fragmentName != null;
	}

	public function hasFragmentType():Boolean
	{
		return fragmentType != null;
	}

	public function getLocalName():String
	{
		return localName;
	}

	public function setLocalName(localName:String):void
	{
		this.localName = localName;
	}

	public function getPackageName():String
	{
		return packageName;
	}

	public function getFragmentName():String
	{
		return fragmentName;
	}

	public function getFragmentType():String
	{
		return fragmentType;
	}

	public function setPackageName(packageName:String):void
	{
		this.packageName = packageName;
	}

	// added
	public function getQualifiedName():String
	{
		if (isQualified())
		{
			if (hasFragment())
			{
				if (hasFragmentType())
				{
					return packageName + "." + localName + "#" + fragmentType
							+ ":" + fragmentName;
				}
				else
				{
					return packageName + "." + localName + "#" + fragmentName;
				}
			}
			else
			{
				if (packageName == "")
				{
					return localName;
				}
				else
				{
					return packageName + "." + localName;
				}
			}
		}
		else
		{
			if (hasFragment())
			{
				if (hasFragmentType())
				{
					return localName + "#" + fragmentType + ":" + fragmentName;
				}
				else
				{
					return localName + "#" + fragmentName;
				}
			}
			else
			{
				return localName;
			}
		}
	}

	public function toString():String
	{
		return getQualifiedName();
	}

	// eclipse generated
	//public int hashCode()
	//{
	//	final int PRIME = 31;
	//	int result = 1;
	//	result = PRIME * result
	//			+ ((localName == null) ? 0 : localName.hashCode());
	//	result = PRIME * result
	//			+ ((packageName == null) ? 0 : packageName.hashCode());
	//	return result;
	//}

	// eclipse generated
	public function equals(obj:Object):Boolean
	{
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		//if (getClass() != obj.getClass())
		//	return false;
		var other:ASQName = obj as ASQName;
		if (localName == null)
		{
			if (other.localName != null)
				return false;
		}
		else if (!localName == other.localName)
			return false;
		if (packageName == null)
		{
			if (other.packageName != null)
				return false;
		}
		else if (!packageName == other.packageName)
			return false;
		return true;
	}

	public static function create(qname:String):ASQName
	{
		return new ASQName(qname);
	}

	public function getFragmentLink():String
	{
		if ("style" == fragmentType || "event" == fragmentType
				|| "effect" == fragmentType
				|| "skinstate" == fragmentType)
			return getQualifiedName();

		var tail:String = "";
		if ("method" == fragmentType)
			tail = "()";

		var sb:StringBuffer = new StringBuffer();
		sb.append(packageName);
		sb.append(".");
		sb.append(localName);
		sb.append("#");
		sb.append(fragmentName);
		sb.append(tail);

		return sb.toString();
	}
}
}