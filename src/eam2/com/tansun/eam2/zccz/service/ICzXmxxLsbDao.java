package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;

public interface ICzXmxxLsbDao {

	public CzXmxxLsb getCzXmxxLsbById(String id);
	
	public void saveOrUpdateCzXmxxLsb(CzXmxxLsb czXmxxLsb);
	
	public List<CzXmxxLsb> getXmListByHyId(String hyId);
}
