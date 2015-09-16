package com.tansun.eam2.common.commonService.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class CommonBSImpl implements ICommonBS{
	
	@Autowired	
	private PublicDao publicDao;

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public void delete(CommonBO commonBO) {
		this.publicDao.delete(commonBO);
	}

	@SuppressWarnings("unchecked")
	public CommonBO findById(Class cls,String id) {
		if(id!=null){
			return (CommonBO)this.publicDao.findById(cls, id);
		}else{
			return null;
		}
		
	}

	public void save(CommonBO commonBO) {
		this.publicDao.save(commonBO);
	}

	public void saveOrUpdate(CommonBO commonBO) {
		this.publicDao.saveOrUpdate(commonBO);
	}

	public void update(CommonBO commonBO) {
		this.publicDao.update(commonBO);
	}

}
