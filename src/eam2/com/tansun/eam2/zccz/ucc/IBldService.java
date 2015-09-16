package com.tansun.eam2.zccz.ucc;

import com.tansun.eam2.common.model.orm.bo.CzHgshXx;

public interface IBldService {

	public CzHgshXx viewAdvice(String cldId);
	
	public void saveAdvice(CzHgshXx advice);
}
