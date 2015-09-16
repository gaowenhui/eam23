package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

public interface BatchSelectBS {
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx);
}
