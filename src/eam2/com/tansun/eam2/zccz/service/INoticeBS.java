package com.tansun.eam2.zccz.service;

import com.tansun.eam2.common.model.orm.bo.CzNoticeHead;

/**
 * 处置公告
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
public interface INoticeBS {

	/**
	 * 保存表头信息
	 * 
	 * @param head
	 */
	public void saveHead(CzNoticeHead head);

	/**
	 * 修改表头信息
	 * 
	 * @param head
	 */
	public void updateHead(CzNoticeHead head);

	/**
	 * 通过headid查找head内容
	 * 
	 * @param headId
	 * @return
	 */
	public CzNoticeHead findHeadByHeadId(String headId);

	/**
	 * 通过headid查找实体body
	 * 
	 * @param headId
	 */
	public String findSTBodyByHeadId(String headId);

	/**
	 * 通过headid查找资产body
	 * 
	 * @param headId
	 */
	public String findZCBodyByHeadId(String headId);

	/**
	 * 通过headid查找债券body
	 * 
	 * @param headId
	 */
	public String findZQBodyByHeadId(String headId);

	/**
	 * 保存处置公告实体表体
	 * 
	 * @param headId
	 * @param stIds
	 */
	public void saveSTBody(String headId, String[] stIds);

	/**
	 * 保存处置公告资产表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZCBody(String headId, String[] zcIds);

	/**
	 * 保存处置公告债券表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZQBody(String headId, String[] zqIds);

	/**
	 * 删除处置实体表体
	 * 
	 * @param bodyIds
	 */
	public void delBody(String[] bodyIds);

	/**
	 * 修改处置表体
	 * 
	 * @param bodyIds
	 * @param czms
	 * @param czysbs
	 */
	public void updBody(String[] bodyIds, String czms, String czysbs);

}
