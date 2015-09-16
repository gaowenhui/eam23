package com.tansun.eam2.jygdzc.action;

import com.tansun.rdp4j.common.web.action.CommonAction;

public class IntentionDetailAction extends CommonAction{
	/**
	 * 给定一个清算编号，以页面形式显示资产的基本信息等内容 从清算表里取数据
	 * @return
	 */
	public String view(){
		return "view";
	}

}
