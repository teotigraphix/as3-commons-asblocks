package org.as3commons.asblocks.impl
{

import org.as3commons.asblocks.dom.Visibility;

public class ModifierInfo
{
		public var tokenType:int;
		public var vis:Visibility;
		public var keyword:String;

		public function ModifierInfo(tokenType:int, vis:Visibility, keyword:String)
		{
			this.tokenType = tokenType;
			this.vis = vis;
			this.keyword = keyword;
		}
}
}