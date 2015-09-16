package com.tansun.eam2.zccz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.zccz.service.ICzXmSpwYjDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class CzXmSpwYjDaoImpl implements ICzXmSpwYjDao {
	
	public PublicDao publicDao;

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public CzXmSpwYj getCzXmSpwYjById(String id) {
		CzXmSpwYj czXmSpwYj = publicDao.findById(CzXmSpwYj.class, id);
		if(czXmSpwYj != null)return czXmSpwYj;
		return new CzXmSpwYj();
	}

	public void updateCzXmSpwYj(CzXmSpwYj czXmSpwYj) {
		publicDao.update(czXmSpwYj);
	}

	public CzXmSpwYj getCzXmSpwYjByXmIdWyId(String xmId, String spwy) {
		return (CzXmSpwYj)publicDao.findSingleResult("from CzXmSpwYj yj where yj.xmId=? and spwy=?"
				, new String[]{xmId,spwy});
	}

}
