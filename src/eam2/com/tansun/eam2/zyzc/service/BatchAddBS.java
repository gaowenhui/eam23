package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

public interface BatchAddBS {
//	public ZyPdxx findCheckById(String finalBodyId);

	public ZyPdxx createZyPdxxByZcId(String zcId);

	public void saveZyPdxx(ZyPdxx zyPdxx);
	
	public ZyPdxx findZyPdxxWithzcId(String zcId);
	
	public void update(ZyPdxx zyPdxx);
}
