package com.tansun.eam2.zyzc.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchAddBS;
import com.tansun.eam2.zyzc.ucc.BatchAddUCC;
@Service
public class BatchAddUCCimpl implements BatchAddUCC {
	@Autowired
	BatchAddBS batchAddBSimpl;
//	public ZyPdxx findCheckById(String finalBodyId) {
//		return batchAddBSimpl.findCheckById(finalBodyId);
//	}
	public ZyPdxx createZyPdxxByZcId(String zcId) {
		return batchAddBSimpl.createZyPdxxByZcId(zcId);
	}
	public void saveZyPdxx(ZyPdxx zyPdxx) {
		batchAddBSimpl.saveZyPdxx(zyPdxx);
	}
	
	public ZyPdxx findZyPdxxWithzcId(String zcId) {
		return batchAddBSimpl.findZyPdxxWithzcId(zcId);
	}
	
	public void update(ZyPdxx zyPdxx) {
		batchAddBSimpl.update(zyPdxx);
	}
}
