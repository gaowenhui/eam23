package com.tansun.eam2.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class AssetCardUtil {
	
	private PublicDao publicDao;

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	@SuppressWarnings("unchecked")
	public Cardinfo getCardinfo(String zcId) {
		// 查询主卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		Object[] params = new Object[] { zcId };
		List<CardAssetHistory> tempList = (List<CardAssetHistory>) publicDao.find(hql, params);
		CardAssetHistory history = null;
		if (tempList != null && tempList.size()>0) {
			history = tempList.get(0);
		} 
		if(history != null){
			return publicDao.findById(Cardinfo.class, Long.parseLong(history.getKpId()));
		}else{
			return null;
		}
	}
	
	// 返回原币原值
	@SuppressWarnings("unchecked")
	public Map<String,Double> getYbyz(String zcId) {
		Map<String, Double> assetCardHzMessage = new HashMap<String, Double>();
		Double ybyz = new Double(0);
		Double je = new Double(0);
		Double jz = new Double(0);
		// 根据资产id查询出所有的卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0'";
		Object[] params = new Object[] { zcId };
		List<CardAssetHistory> cardinfoList = (List<CardAssetHistory>) publicDao.find(hql, params);
		if (cardinfoList != null) {
			for (int i = 0; i < cardinfoList.size(); i++) {
				CardAssetHistory history = cardinfoList.get(i);
				if(history != null){
					Cardinfo card = publicDao.findById(Cardinfo.class, Long.parseLong(history.getKpId()));
					if(card != null)
						ybyz += (card.getYbyz() == null?0D:card.getYbyz());
						je += (card.getJevalue() == null?0D:card.getJevalue());
						jz += (card.getJvalue() == null?0D:card.getJvalue());
				}
			}
			assetCardHzMessage.put("ybyz", ybyz);
			assetCardHzMessage.put("je", je);
			assetCardHzMessage.put("jz", jz);
			return assetCardHzMessage;
		} else {
			return null;
		}
	}
	
}
