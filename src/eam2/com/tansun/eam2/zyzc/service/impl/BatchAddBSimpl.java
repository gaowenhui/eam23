package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchAddBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class BatchAddBSimpl implements BatchAddBS {
	@Autowired
	PublicDao publicDao;

	/**
	 * 根据资产ID在pdxx表中查询单条ZyPdxx记录
	 */
	public ZyPdxx findZyPdxxWithzcId(String zcId) {
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from ZyPdxx z where z.zcId = ?";
		return (ZyPdxx)publicDao.findSingleResult(preparedHQL, params);
	}

	/**
	 * 在资产表和台账表中根据资产ID查询出数据然后存到ZyPdxx对象中，为保存到盘点信息表做准备
	 */
	public ZyPdxx createZyPdxxByZcId(String zcId) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyPdxx> resultList = new ArrayList();
		params.add(zcId);
		String preparSQL = "select * from zy_zc a, zy_kctz b  where a.zc_id = b.zc_id  and  a.zc_id =? ";
		ZyPdxx zyPdxx = new ZyPdxx();
		Map map = new HashMap();
		preparSQL = preparSQL + strWhere.toString();
		map = publicDao.queryForList(preparSQL, params).get(0);
		ZyPdxx zyPdxxBO = new ZyPdxx();
		zyPdxxBO.setZcId((String) map.get("ZC_ID"));
		zyPdxxBO.setYjflmc((String) map.get("YJFLMC"));
		zyPdxxBO.setEjflmc((String) map.get("EJFLMC"));
		zyPdxxBO.setSjflmc((String) map.get("SJFLMC"));
		zyPdxxBO.setZcmc((String) map.get("ZCMC"));
		zyPdxxBO.setZcbh((String) map.get("ZCBH"));
		zyPdxxBO.setGg((String) map.get("GG"));
		zyPdxxBO.setJldw((String) map.get("JLDW"));
		zyPdxxBO.setSyrmc((String) map.get("LYRMC"));
		zyPdxxBO.setSybmbmc((String) map.get("LYBMMC"));
		zyPdxxBO.setCfdd((String) map.get("BGDD"));
		zyPdxxBO.setSl(new Double(map.get("KCSL").toString()));
		resultList.add(zyPdxxBO);
		return zyPdxxBO;
	}

	/**
	 * 保存ZyPdxx对象到盘点信息表中
	 */
	public void saveZyPdxx(ZyPdxx zyPdxx){
		if(findZyPdxxWithzcId(zyPdxx.getZcId()) == null){
			publicDao.save(zyPdxx);
		}
	}
	
	/**
	 * 更新盘点信息表
	 */
	public void update(ZyPdxx zyPdxx) {
		publicDao.update(zyPdxx);
	}
}
