package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchQueryBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class BatchQueryBSimpl implements BatchQueryBS {
	@Autowired
	PublicDao publicDao;
	
	/**
	 * 根据Pdxx中的查询条件到台账表中查询数据，供批次查询使用
	 */
	public List<ZyPdxx> queryWithCondition(ZyPdxx Pdxx) {
		List params = new ArrayList();
		List resultList = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String strHQL = "from  ZyPdxx o where 1=1 ";
		if (Pdxx.getPdpc() != null && Pdxx.getPdpc().trim().length() > 0) {
			strWhere.append(" and o.pdpc = ? ");
			params.add(Pdxx.getPdpc());
		}
		if (Pdxx.getPdrq() != null) {
			strWhere.append(" and o.pdrq = ? ");
			params.add(Pdxx.getPdrq());
		}
		strHQL = strHQL + strWhere.toString();
		resultList = publicDao.find(strHQL, params);
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}
	
	/**
	 * 查询出盘点信息表中所有的数据
	 */
	public List<ZyPdxx> queryAllPdxx(){
		String str = "from ZyPdxx o";
		return (List<ZyPdxx>)publicDao.find(str);
	}
}
