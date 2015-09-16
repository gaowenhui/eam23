package com.tansun.eam2.zccz.service;

import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;

public interface ICzXmSpwYjDao {

	public CzXmSpwYj getCzXmSpwYjById(String id);
	
	public void updateCzXmSpwYj(CzXmSpwYj czXmSpwYj);
	
	public CzXmSpwYj getCzXmSpwYjByXmIdWyId(String xmId, String spwy);
	
}
