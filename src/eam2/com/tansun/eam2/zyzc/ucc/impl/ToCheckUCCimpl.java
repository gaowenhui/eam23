package com.tansun.eam2.zyzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.ToCheckBS;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class ToCheckUCCimpl implements ToCheckUCC {
	@Autowired
	ToCheckBS toCheckBSimpl;

	public ZyPdxx createZyPdxxByZcId(String zcId) {
		return toCheckBSimpl.createZyPdxxByZcId(zcId);
	}

//	public ZyPdxx findZyPdxxWithzcId(String zcId) {
//		return toCheckBSimpl.findZyPdxxWithzcId(zcId);
//	}

	public List<ZyPdxx> queryAllPdxx() {
		return toCheckBSimpl.queryAllPdxx();
	}
	
	public List<ZyPdxx> queryPdxxWithPclx(String pclx){
		return toCheckBSimpl.queryPdxxWithPclx(pclx);
	}
	
	/**
	 * 查询出已经办结了个盘点信息 
	 */
	public List<ZyPdxx> queryPdxxEnd(){
		return toCheckBSimpl.queryPdxxEnd();
	}
	
	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc(Paginator paginator){
		return toCheckBSimpl.queryPdxxWithoutPdpc(paginator);
	}
	
	public List<ZyPdxx> queryAllPdxxWithoutPdpc(){
		return toCheckBSimpl.queryAllPdxxWithoutPdpc();
	}

	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录（没有分页器）
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc(){
		return toCheckBSimpl.queryPdxxWithoutPdpc();
	}
	
	public String queryWithCondition(PdxxVO Pdxx ) {
		return toCheckBSimpl.queryWithCondition(Pdxx);
	}

	public void saveZyPdxx(ZyPdxx zyPdxx) {
		toCheckBSimpl.saveZyPdxx(zyPdxx);
	}

	/**
	 * 弹出页面中根据传过来的ZyPdxx(bo)中存储的查询条件查询出资产表和台账表中的数据
	 * 存到List<ZyPdxx>并返回
	 */
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,Paginator paginator) {
		return toCheckBSimpl.subPageQueryWithCondition(zyPdxx,paginator);
	}
	
	//盘点
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,Paginator paginator){
		return toCheckBSimpl.subPageQueryWithCondition(zyPdxx, pclx, paginator);
	}

	//盘库非易耗品
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator){
		return toCheckBSimpl.subPageQueryWithCondition(zyPdxx, pclx, isConsuming, paginator);
	}

	public void update(ZyPdxx zyPdxx) {
		toCheckBSimpl.update(zyPdxx);
	}
	
	/**
	 * 根据表体zcId删除相应的记录
	 */
	public void deleteBody(String[] delIds){
		toCheckBSimpl.deleteBody(delIds);
	}

	/**
	 * 根据盘点批次在pdxx表中查询单条ZyPdxx记录
	 */
	public List<ZyPdxx> findZyPdxxWithPdpc(String pdpc){
		return toCheckBSimpl.findZyPdxxWithPdpc(pdpc);
	}
	
	public List<ZyPdxx> findZyPdxxWithPdpcAndPager(String pdpc,Paginator paginator){
		return toCheckBSimpl.findZyPdxxWithPdpcAndPager(pdpc, paginator);
	}
	
	/**
	 * 根据资产ID和表UUID在pdxx表中查询单条ZyPdxx记录
	 */
	public ZyPdxx findZyPdxxWithID(String id) {
		return toCheckBSimpl.findZyPdxxWithID(id);
	}
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID){
		return toCheckBSimpl.modifyBody(zyPdID);
	}
	
	/**
	 * 根据headId到pdxx表中查找pdpc
	 * @param headId
	 * @return
	 */
	public String getPdpcWithHeadId(String headId){
		return toCheckBSimpl.getPdpcWithHeadId(headId);
	}
	
	/**
	 * 根据Pdxx中的查询条件(盘点批次，盘点日期)到台账表中查询数据，供批次查询使用
	 */
	public String query4PanYingPanKui(PdxxVO pdxxVo,Paginator paginator) {
		return toCheckBSimpl.query4PanYingPanKui(pdxxVo, paginator);
	}
	
	public String getMaxPdpc(String pclx){
		return toCheckBSimpl.getMaxPdpc(pclx);
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,Paginator paginator){
		return toCheckBSimpl.subPageQueryWithConditionId(zyPdxx, paginator);
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,Paginator paginator){
		return toCheckBSimpl.subPageQueryWithConditionId(zyPdxx, pclx, paginator);
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator){
		return toCheckBSimpl.subPageQueryWithConditionId(zyPdxx, pclx, isConsuming, paginator);
	}
	
	public void deleteRedundancyDataFromPdxx(String headId,String pc){
		toCheckBSimpl.deleteRedundancyDataFromPdxx(headId, pc);
	}
	
}
