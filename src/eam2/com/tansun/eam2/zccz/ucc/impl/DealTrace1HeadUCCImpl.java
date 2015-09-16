package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.service.IDealTrace1HeadBS;
import com.tansun.eam2.zccz.ucc.IDealTrace1HeadUCC;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;
@Service
public class DealTrace1HeadUCCImpl implements IDealTrace1HeadUCC {

	@Autowired
	IDealTrace1HeadBS bs;
	
	private IUserBS userBS;
	
	@Autowired
	public void setUserBS(IUserBS userBS) {
		this.userBS = userBS;
	}

	/**
	 * 查询列表json字符串
	 * @return
	 */
	public String getQueryJSONStr(DealQueryVo vo,Paginator paginator){
		return bs.getQueryJSONStr(vo,paginator);
	}
	
	
	/**
	 * 查询处置资产项目信息临时表
	 * @param xmId
	 * @return
	 */
	public CzXmxxLsb findCzXmXxLSBById(String xmId){
		return bs.findCzXmXxLSBById(xmId);
	}
	/**
	 * 查询处置资产项目信息
	 * @param xmId
	 * @return
	 */
	public CzXmXx findCzXmXxById(String xmId){
		return bs.findCzXmXxById(xmId);
	}
	
	/**
	 * 处理单列表json字符串
	 * @return
	 */
	public String findCzXmByCldId(String headId){
		return bs.findCzXmByCldId(headId);
	}

	/**
	 * 处理单列表json字符串
	 * @return
	 */
	public String findCzXmLsbByCldId(String cld){
		CzXmxxLsb temp = bs.findCzXmxxLsbByCldId(cld);
		return temp.getId();
	}
	
	/**
	 * 删除处置项目，实际是取消项目与结案处理单的关联
	 * @param cldId
	 * @param xmIds
	 */
	public void deleteCzxm(String cldId, String[] xmIds){
		bs.deleteCzxm(cldId,xmIds);
	}
	
	/**
	 * 关联处理单和项目
	 * @return
	 */
	public void saveXm2Cld(String headId, String[] xmIds){
		bs.saveXm2Cld(headId, xmIds);
	}

	public CzCztzfaXx findCldById(String cldId) {
		return (CzCztzfaXx)this.bs.findById(CzCztzfaXx.class, cldId);
	}

	public List<CzZcXx> findAssetListByIdAndZclb(String cldId, String zclb) {
		return this.bs.findAssetListByIdAndZclb(cldId, zclb);
	}
	
	/**
	 * 根据id查询处置项目结案表头
	 * @param headId
	 * @return
	 */
	public CzXmjaHead getCzXmjaHeadById(String headId){
		return bs.getCzXmjaHeadById(headId);
	}
	
	/**
	 * 更新项目结案body表
	 * @param body
	 * @param type
	 */
	public void update(CzXmjaBody body, String type){
		bs.update(body,type);
	}
	
	/**
	 * 根据处理单id 和xmId查找body信息
	 * @param xmId
	 * @param cldId
	 * @return
	 */
	public CzXmjaBody findCzXmjaBodyByXmIdAndCldId(String xmId, String cldId){
		return bs.findCzXmjaBodyByXmIdAndCldId(xmId, cldId);
	}

	public String getGenzongFeiyong(String xmId) {
		List<CzFysrMx> genzongList = bs.getCzFysrMxListByXmId(xmId);
		for(CzFysrMx fy : genzongList){
			if(StringUtils.equals(fy.getJieduan(), "chuzhihuikuan"))
				genzongList.remove(fy);
		}
		return BodyListToJSON.getJSON(genzongList, 1, 1, Integer.MAX_VALUE);
	}

	public String getHuikuan(String xmId) {
		List<CzFysrMx> huikuanList = bs.getCzFysrMxListByXmId(xmId);
		return BodyListToJSON.getJSON(huikuanList, 1, 1, Integer.MAX_VALUE);
	}
	
	/**
	 * 流程办结
	 * @return
	 */
	public String banjie(String headId){
		return bs.banjie(headId);
	}

	public void updateSjzc(String id, Double sjzc) {
		CzFysrMx fy = (CzFysrMx)bs.findById(CzFysrMx.class, id);
		fy.setSjzc(sjzc);
		bs.update(fy);
	}
	
	/**
	 * 全部结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quanbujiean(String headId, String xmIds){
		return bs.quanbujiean( headId,  xmIds);
	}
	/**
	 * 部分结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String bufenjiean(String headId, String xmIds,String zcIds,String zclb){
		return bs.bufenjiean( headId,  xmIds,zcIds,zclb);
	}
	/**
	 * 取消结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quxiaojiean(String headId, String xmIds,String zcIds,String zclb){
		return bs.quxiaojiean( headId,  xmIds,zcIds,zclb);
	}

	public String look_oa(String itemId) {
		
		return bs.look_oa(itemId);
	}

	public String findCzXmxxIdByLsbId(String cldId) {
		return bs.findCzXmxxIdByLsbId(cldId);
	}
	
}
