package com.tansun.eam2.zyzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchQueryBS;
import com.tansun.eam2.zyzc.ucc.BatchQueryUCC;

@Service
public class BatchQueryUCCimpl implements BatchQueryUCC {
	@Autowired
	BatchQueryBS batchQueryBSimpl;
	public List<ZyPdxx> queryWithCondition(ZyPdxx Pdxx) {
		return batchQueryBSimpl.queryWithCondition(Pdxx);
	}

	public List<ZyPdxx> queryAllPdxx(){
		return batchQueryBSimpl.queryAllPdxx();
	}
}
