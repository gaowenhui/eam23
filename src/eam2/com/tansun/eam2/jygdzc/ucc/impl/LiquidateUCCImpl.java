package com.tansun.eam2.jygdzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.jygdzc.service.ILiquidateBS;
import com.tansun.eam2.jygdzc.ucc.ILiquidateUCC;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class LiquidateUCCImpl implements ILiquidateUCC {
	@Autowired
	public ILiquidateBS liquidateBS;
	
	public void deleteBody(JyzcHtqsBody body) {
		liquidateBS.deleteBody(body);
	}

	public List<JyzcHtqsBody> getBodyListByHeadId(String headid,
			Paginator paginator) {
		return liquidateBS.getBodyListByHeadId(headid, paginator);
	}

	public void saveBody(JyzcHtqsBody body) {
		liquidateBS.saveBody(body);

	}
	public void updateContractAfterApproval(String headId){
		liquidateBS.updateContractAfterApproval(headId);
	}
	/**
	 * 相关流程
	 * @param headId
	 * @return
	 */
	public String findXglc(String headId){
		return 	this.liquidateBS.findXglc(headId);
	}
}
