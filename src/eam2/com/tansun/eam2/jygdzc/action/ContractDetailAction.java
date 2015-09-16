package com.tansun.eam2.jygdzc.action;

import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 *ContractDetailAction用来实现对经营性固定资产的信息的查询功能和选取功能
 * @author lihuan
 *
 */
public class ContractDetailAction extends CommonAction{
    //合同编码
	private String contractId;
	/**
	 * 给定一个资产编号，以页面形式显示资产的基本信息等内容 
	 * 从资产表里取数据
	 * @return
	 */
	public String view(){
       //step1:根据传入的contractId来检索数据库的对应数据
		
		//step2:结束工作，转到相关页面 contractQuery.jsp
		return "view";
	}
	//////////////get set////////////////////////////////////
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
}
