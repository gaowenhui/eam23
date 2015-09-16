package com.tansun.eam2.kpgl.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.kpgl.service.ICardQueryBS;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.eam2.kpgl.vo.CardListInfoVO;
import com.tansun.eam2.kpgl.vo.CardQueryVO;
import com.tansun.eam2.zyzc.vo.CardVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
 * @author 陈煜霄
 * @date 2010-11-12 卡片查询
 */
@Service
public class CardQueryUCCImpl implements ICardQueryUCC {

	@Autowired
	private ICardQueryBS cardQueryBSImpl;

	public String query(CardQueryVO queryVO, Paginator paginator) {
		return cardQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据nodeValue查询卡片类型id
	 * 
	 * @param nodeValue
	 * @return
	 */
	public Individualtree getColoNizeValue(String nodeValue) {
		return cardQueryBSImpl.getColoNizeValue(nodeValue);
	}

	/**
	 * 根据id 查询卡片类型
	 * 
	 * @param cateIds
	 * @return
	 */
	public List getCardTypeList(String[] cateIds) {
		return cardQueryBSImpl.getCardTypeList(cateIds);
	}

	/**
	 * 根据treeType和nodeValue查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByNodeValue(String treeType, String nodeValue) {
		return cardQueryBSImpl.findCateNameByNodeValue(treeType, nodeValue);
	}

	/**
	 * 根据headId查找卡片添加的表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardAddBody(String headId) {
		return cardQueryBSImpl.findCardAddBody(headId);
	}

	/**
	 * 根据headId查找卡片减少表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardReduceBody(String headId) {
		return cardQueryBSImpl.findCardReduceBody(headId);
	}

	/**
	 * 根据headId查找卡片修改表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardModifyBody(String headId) {
		return cardQueryBSImpl.findCardModifyBody(headId);
	}

	/**
	 * 根据headId查找卡片变动表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardChangeBody(String headId) {
		return cardQueryBSImpl.findCardChangeBody(headId);
	}

	/**
	 * 根据headId查找卡片减值表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardDevalueBody(String headId) {
		return cardQueryBSImpl.findCardDevalueBody(headId);
	}

	/**
	 * 根据headId查找卡片调配表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findCardAllocateBody(String headId) {
		return cardQueryBSImpl.findCardAllocateBody(headId);
	}

	/**
	 * 根据headId查找卡片拆分前表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findBeforeSplit(String headId) {
		return cardQueryBSImpl.findBeforeSplit(headId);
	}

	/**
	 * 根据headId查找卡片拆分后表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findAfterSplit(String headId) {
		return cardQueryBSImpl.findAfterSplit(headId);
	}

	/**
	 * 根据headId查找卡片合并前表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findBeforeMerge(String headId) {
		return cardQueryBSImpl.findBeforeMerge(headId);
	}

	/**
	 * 根据headId查找卡片合并后表体内容
	 * 
	 * @param headId
	 * @return
	 */
	public String findAfterMerge(String headId) {
		return cardQueryBSImpl.findAfterMerge(headId);
	}

	/**
	 * 生成编号
	 * 
	 * @param headId
	 * @return
	 */
	public String queryCode(String headId) {
		return cardQueryBSImpl.queryCode(headId);
	}

	/**
	 * 查找一级分行
	 * 
	 * @return
	 */
	public List findFirstBranch() {
		return cardQueryBSImpl.findFirstBranch();
	}
	
	/**
	 * 根据headId查找卡片添加的表体内容 自用资产
	 * 
	 * @param headId
	 * @return
	 */
	public String findAddBody4ZyKp(String headId){
		return cardQueryBSImpl.findAddBody4ZyKp(headId);
	}

	public List<CardListInfoVO> queryforAsset(CardQueryVO queryVO,
			Paginator paginator) {
		return cardQueryBSImpl.queryforAsset(queryVO, paginator);
	}
	
	/**
	 * 根据caSheadId（对应lc_cardtemp表中KPXZID的字段）和sbodid（对应zy_Sbody表中的Sbody_id）
	 * 到这两张表中查询出数据保存到VO中显示在界面上
	 * @param caSheadId
	 * @param sbodyId
	 * @return
	 */
	public List<CardVO> obtainBody4ZyKp(String caSheadId,String sbodyId){
		return cardQueryBSImpl.obtainBody4ZyKp(caSheadId, sbodyId);
	}
	
	/**
	 * @author Yanpeiling 2011-1-8
	 * 根据caSheadId（对应lc_cardtemp表中KPXZID的字段）和sbodid（对应zy_Sbody表中的Sbody_id）
	 * 到这两张表中查询出数据保存到VO中显示在界面上
	 * @param caSheadId
	 * @param sbodyId
	 * @return
	 */
	public LcCardtemp obtainLcCardtemp4ZyKp(String caSheadId,String sbodyId){
		return cardQueryBSImpl.obtainLcCardtemp4ZyKp(caSheadId, sbodyId);
	}
	
	/**
	 * 根据headId到ZyShead表中查找Ngbmyj(这个字段当作存储caSheadId使用)
	 * @param headId
	 * @return
	 */
	public String getcaSheadIdWithHeadId(String headId){
		return cardQueryBSImpl.getcaSheadIdWithHeadId(headId);
	}
	
	public String findRecordhistorys(String cardId, Paginator paginator){
		return this.cardQueryBSImpl.findRecordhistorys(cardId,  paginator);
	}
	public String findRecordhistorys1(String headId, String bodyId){
		return this.cardQueryBSImpl.findRecordhistorys1( headId,  bodyId);
	}
	public String findAsset(String cardId){
		return this.cardQueryBSImpl.findAsset(cardId);
	}
	
	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String excelCheck(String ids){
		return this.cardQueryBSImpl.excelCheck(ids);
	}
}
