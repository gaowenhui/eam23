package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchSelectBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class BatchSelectBSimpl implements BatchSelectBS {
	@Autowired
	PublicDao publicDao;

	/**
	 * 弹出页面中根据传过来的ZyPdxx(bo)中存储的查询条件查询出资产表和台账表中的数据
	 * 存到List<ZyPdxx>并返回
	 */
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyPdxx> resultList=new ArrayList();

		String preparSQL = "select * from zy_zc a, zy_kctz b  where a.zc_id = b.zc_id ";

		if (zyPdxx.getYjflbm() != null
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and a.ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());

		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and b.lybmmc = ?  ");
			strWhere.append(" and b.jybmmc = ? ");
			params.add(zyPdxx.getSybmbmc());
			params.add(zyPdxx.getSybmbmc());

		}
		if (zyPdxx.getSjflbm() != null
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.sjflbm = ?  ");
			params.add(zyPdxx.getYjflbm());
		}

		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and a.bgdd = ? ");
			params.add(zyPdxx.getCfdd());
		}
		preparSQL = preparSQL + strWhere.toString();
		tempList = publicDao.queryForList(preparSQL, params);

		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyPdxx pdxx = new ZyPdxx();
		
			pdxx.setZcId((String)map.get("ZC_ID"));
			pdxx.setYjflmc((String)map.get("YJFLMC"));
			pdxx.setEjflmc((String)map.get("EJFLMC"));
			pdxx.setSjflmc((String)map.get("SJFLMC"));
			pdxx.setZcmc((String)map.get("ZCMC"));
			pdxx.setZcbh((String)map.get("ZCBH"));
			pdxx.setGg((String)map.get("GG"));
			pdxx.setJldw((String)map.get("JLDW"));
			pdxx.setSyrmc((String)map.get("LYRMC"));
			pdxx.setSybmbmc((String)map.get("LYBMMC"));
			pdxx.setCfdd((String)map.get("BGDD"));
			pdxx.setSl(new Double(  map.get("KCSL").toString()));
			resultList.add(pdxx);
		}
		return resultList;
	}
}
