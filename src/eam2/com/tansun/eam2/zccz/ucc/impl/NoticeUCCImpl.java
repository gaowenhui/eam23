package com.tansun.eam2.zccz.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzNoticeHead;
import com.tansun.eam2.zccz.service.INoticeBS;
import com.tansun.eam2.zccz.ucc.INoticeUCC;

/**
 * 处置公告
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
@Service
public class NoticeUCCImpl implements INoticeUCC {

	@Autowired
	private INoticeBS noticeBSImpl;

	/**
	 * 保存表头信息
	 * 
	 * @param head
	 */
	public void saveHead(CzNoticeHead head) {
		noticeBSImpl.saveHead(head);
	}

	/**
	 * 修改表头信息
	 * 
	 * @param head
	 */
	public void updateHead(CzNoticeHead head) {
		noticeBSImpl.updateHead(head);
	}

	/**
	 * 通过headid查找head内容
	 * 
	 * @param headId
	 * @return
	 */
	public CzNoticeHead findHeadByHeadId(String headId) {
		return noticeBSImpl.findHeadByHeadId(headId);
	}

	/**
	 * 通过headid查找实体body
	 * 
	 * @param headId
	 */
	public String findSTBodyByHeadId(String headId) {
		return noticeBSImpl.findSTBodyByHeadId(headId);
	}

	/**
	 * 通过headid查找资产body
	 * 
	 * @param headId
	 */
	public String findZCBodyByHeadId(String headId) {
		return noticeBSImpl.findZCBodyByHeadId(headId);
	}

	/**
	 * 通过headid查找债券body
	 * 
	 * @param headId
	 */
	public String findZQBodyByHeadId(String headId) {
		return noticeBSImpl.findZQBodyByHeadId(headId);
	}

	/**
	 * 保存处置实体表体
	 * 
	 * @param headId
	 * @param stIds
	 */
	public void saveSTBody(String headId, String[] stIds) {
		noticeBSImpl.saveSTBody(headId, stIds);
	}

	/**
	 * 保存处置资产表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZCBody(String headId, String[] zcIds) {
		noticeBSImpl.saveZCBody(headId, zcIds);
	}

	/**
	 * 保存处置公告债券表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZQBody(String headId, String[] zqIds) {
		noticeBSImpl.saveZQBody(headId, zqIds);
	}

	/**
	 * 删除处置实体表体
	 * 
	 * @param bodyIds
	 */
	public void delBody(String[] bodyIds) {
		noticeBSImpl.delBody(bodyIds);
	}

	/**
	 * 修改处置表体
	 * 
	 * @param bodyIds
	 * @param czms
	 * @param czysbs
	 */
	public void updBody(String[] bodyIds, String czms, String czysbs) {
		noticeBSImpl.updBody(bodyIds, czms, czysbs);
	}

}
