package com.tansun.eam2.zccz.service;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

public interface IDealEvalBodyDao extends ICommonBS {

	public PageableList getBodyPagerByCldId(Paginator paginator, String cldId) throws IllegalAccessException, InvocationTargetException;
	
	public void addBodys(List<CzPgxxLsb> bodyList);
	
	public List<CardAssetHistory> getCardIdListByAssetId(String assetId);

	//根据处理单id删除经营性固定资产
	public void delAssets(String cldId, String assetIds);

	public void saveBody(CzPgxxLsb cpl);
	
	public void updateBody(CzPgxxLsb cpl);
	
	/**
	 * 通过id查找ZcPgXx信息
	 * @param id
	 * @return
	 */
	public ZcPgXx getZcPgXxInfo(String id);
	
	
	/**
	 * 通过stfsxxid查找信息
	 * @param stfsxxid
	 * @return
	 */
	public CzPgxxLsb getCzPgxxLsbInfo(String stfsxxid,String czpgscclid);
	
	
	/**
	 * 显示czpgscclid相同的 数据
	 * @param czpgscclid
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<CzPgxxLsb> getCzPgxxLsbList(String czpgscclid) throws IllegalAccessException, InvocationTargetException;
	
	/**
	 * 删除CzPgxxLsb信息
	 * @param id
	 */
	public void deletCzPgxxLsbInfo(String cldId,String[] id);
	
	public List<CzPgxxLsb> getPgxxLsbByIds(String assetIds);
	
	public void updateGqjzrjzcz(String bodyId, Double gqjzrjzcz, Double pingguzhi);
	
	public void updatePgjzrzmzqz(String bodyId, Double pgjzrzmzqz, Double pingguzhi);
	
	//根据卡片编号获得卡片名称
	public String getCardNameByCode(String kpbh);
	
	public ZcPgXx findPgXx(String zcid, String wdid, String stid, String gqid,
			String zqid, String zyid, Date pgjzr);
}
