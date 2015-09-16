package com.tansun.eam2.common.workflow.counterSign.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.oa.GetsubjectService;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class Blyj2OAAction extends CommonAction{

	@Autowired
	private GetsubjectService gs;
	
	public String sendOAmainid(){
		String mainids = request.getParameter("mainids");
//		mainids = mainids.substring(0,mainids.length()-6);
		gs.sendOAmainid(mainids);
		return null;
	}
	
}
