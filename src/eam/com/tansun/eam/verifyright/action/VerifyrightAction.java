package com.tansun.eam.verifyright.action;

import com.tansun.rdp4j.common.web.action.CommonAction;


public class VerifyrightAction extends CommonAction{
	public String toAdd(){
		return "toAdd";
	}
	
	public String startVerifyright(){
		System.out.println(this.getUser().getUsername());
		return "toAdd";
	}
}
