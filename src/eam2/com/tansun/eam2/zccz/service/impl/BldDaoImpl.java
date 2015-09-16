package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.model.orm.bo.CzHgshXx;
import com.tansun.eam2.zccz.service.IBldDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class BldDaoImpl implements IBldDao {

	public PublicDao publicDao;
	
	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public CzHgshXx viewAdvice(String cldId) {
		List<String> params = new ArrayList<String>();
		params.add(cldId);
		CzHgshXx advice = (CzHgshXx)publicDao.findSingleResult("from CzHgshXx o where o.cldId=?", params);
		if(advice != null){
			return advice;
		}
		advice = new CzHgshXx();
		advice.setCldId(cldId);
		return advice;
	}

	public void saveAdvice(CzHgshXx advice) {
		if(StringUtils.isNotEmpty(advice.getId()))
			publicDao.saveOrUpdate(advice);
		else
			publicDao.save(advice);
	}

}
