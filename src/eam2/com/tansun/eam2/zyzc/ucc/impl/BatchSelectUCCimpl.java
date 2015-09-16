package com.tansun.eam2.zyzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchSelectBS;
import com.tansun.eam2.zyzc.ucc.BatchSelectUCC;
@Service
public class BatchSelectUCCimpl implements BatchSelectUCC {
	@Autowired
	BatchSelectBS batchSelectBSimpl; 
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx){
		return batchSelectBSimpl.subPageQueryWithCondition(zyPdxx);
	}
}
