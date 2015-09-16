package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

public interface BatchQueryBS {
	public List<ZyPdxx> queryWithCondition(ZyPdxx Pdxx);
	
	public List<ZyPdxx> queryAllPdxx();
	
}
