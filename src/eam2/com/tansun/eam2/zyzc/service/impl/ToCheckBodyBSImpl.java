package com.tansun.eam2.zyzc.service.impl;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.ToCheckBodyBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * @author 薛崇杰  2010-11-23 下午10:47:28
 */
@Service
public class ToCheckBodyBSImpl implements ToCheckBodyBS{

	@Autowired
	PublicDao publicDao;
	/**
	 * 保存页面的盘点信息，有插入，也有修改
	 * @return
	 */
	public void saveBody(ZyPdxx zyPdxx){
		publicDao.saveOrUpdate(zyPdxx);
	}
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID){
		List param =new ArrayList();
		param.add(zyPdID);
		return (ZyPdxx)publicDao.findSingleResult("from ZyPdxx o where o.id=? ",param);
	}
}
