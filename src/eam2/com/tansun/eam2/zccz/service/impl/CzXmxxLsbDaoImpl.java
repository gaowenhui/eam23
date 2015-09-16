package com.tansun.eam2.zccz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.service.ICzXmxxLsbDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class CzXmxxLsbDaoImpl extends CommonBSImpl implements ICommonBS, ICzXmxxLsbDao {

	public PublicDao publicDao;
	
	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public CzXmxxLsb getCzXmxxLsbById(String id) {
		CzXmxxLsb lsb = publicDao.findById(CzXmxxLsb.class, id);
		if(lsb != null)return lsb;
		return new CzXmxxLsb();
	}

	public void saveOrUpdateCzXmxxLsb(CzXmxxLsb czXmxxLsb) {
		publicDao.saveOrUpdate(czXmxxLsb);
	}

	public List<CzXmxxLsb> getXmListByHyId(String hyId) {
		return (List<CzXmxxLsb>)publicDao.find("from CzXmxxLsb xm where xm.hyId=?",new String[]{hyId});
	}

}
