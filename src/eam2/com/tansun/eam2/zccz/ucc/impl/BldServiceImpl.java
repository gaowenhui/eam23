package com.tansun.eam2.zccz.ucc.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzHgshXx;
import com.tansun.eam2.zccz.service.IBldDao;
import com.tansun.eam2.zccz.ucc.IBldService;

@Service
public class BldServiceImpl implements IBldService {

	private IBldDao bldDao;
	
	@Autowired
	public void setBldDao(IBldDao bldDao) {
		this.bldDao = bldDao;
	}

	public CzHgshXx viewAdvice(String cldId) {
		if(StringUtils.isNotEmpty(cldId)){
			return bldDao.viewAdvice(cldId);
		}
		return new CzHgshXx();
	}

	public void saveAdvice(CzHgshXx advice) {
		if(advice != null){
			bldDao.saveAdvice(advice);
		}
	}

}
