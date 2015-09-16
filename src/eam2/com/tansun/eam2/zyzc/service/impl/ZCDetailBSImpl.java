package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.ZCDetailBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;


/**
 * @author 薛崇杰  2010-11-23 下午10:47:44
 */
@Service
public class ZCDetailBSImpl implements ZCDetailBS{

	@Autowired
	PublicDao publicDao;
	/**
	 * 根据资产id查询资产信息
	 * @param zid
	 * @return
	 */
	public ZyZc readZC(String zid){
		List list=new ArrayList();
		list.add(zid);
		return (ZyZc)publicDao.findSingleResult("from ZyZc  o where o.zcId=?", list);
	}
}