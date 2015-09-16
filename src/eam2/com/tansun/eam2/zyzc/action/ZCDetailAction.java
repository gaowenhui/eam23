package com.tansun.eam2.zyzc.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.ucc.ZCDetailUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * ZCDetailAction用来实现对自用资产信息的查询功能和选取功能
 * @author 穆占强
 * @date 2010-11-20
 * 
 */

//@Controller
//@Scope("prototype")
public class ZCDetailAction extends CommonAction {
	
	private ZyZc zyZc;
	private String zcid="";
	@Autowired
	private ZCDetailUCC zCDetailUCC;
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * @return
	 */
	public String view(){
		//step1:根据传入的zcid来检索数据库的对应数据
		
		zCDetailUCC.readZC(zyZc.getZcId());
		
		//step2:结束工作，转到相关页面 ZCQuery.jsp
		return "view";
	}

	
	//-------------------------------------------------------------
	//下面的代码是程序自动生成的GetSet方法
	//-------------------------------------------------------------
	public String getZcid() {
		return zcid;
	}
	public void setZcid(String zcid) {
		this.zcid = zcid;
	}


	public ZyZc getZyZc() {
		return zyZc;
	}


	public void setZyZc(ZyZc zyZc) {
		this.zyZc = zyZc;
	}
}
