package com.tansun.eam2.zccz.service;

import com.tansun.eam2.common.model.orm.bo.CzHgshXx;

public interface IBldDao {

	public CzHgshXx viewAdvice(String cldId);
	
	public void saveAdvice(CzHgshXx advice);
}
