package com.tansun.eam2.cjtz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICzZcXxService;
import com.tansun.eam2.cjtz.service.impl.CzZcXxServiceImpl;
import com.tansun.eam2.cjtz.ucc.ICjtzBodyUcc;
import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.AssetCardUtil;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;

@Service
public class CjtzBodyUCCImp implements ICjtzBodyUcc {

	private ICzZcXxService czzcxxBS;
	//经营性固定资产BS
	private IAssetBS jygdzcBS;
	
	private ICodeService codeBS;
	private AssetCardUtil assetCardUtil;
	
	//实体BS
	private IEntityService entityBS;
	
	@Autowired
	public void setAssetCardUtil(AssetCardUtil assetCardUtil) {
		this.assetCardUtil = assetCardUtil;
	}

	@Autowired
	public void setCodeBS(ICodeService codeBS) {
		this.codeBS = codeBS;
	}

	@Autowired
	public void setEntityBS(IEntityService entityBS) {
		this.entityBS = entityBS;
	}

	@Autowired
	public void setCzzcxxBS(CzZcXxServiceImpl czzcxxBS) {
		this.czzcxxBS = czzcxxBS;
	}

	@Autowired
	public void setJygdzcBS(IAssetBS jygdzcBS) {
		this.jygdzcBS = jygdzcBS;
	}

	/**
	 * 添加经营性固定资产\待处置资产 到body表中
	 * @param zcIds : 经营固定资产\待处置资产的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherJygdzc(String zcIds, String cldId, String fenlei) {
		List<JyzcXx> jygdzcList = null;
		if(StringUtils.isNotEmpty(zcIds)){
			jygdzcList = jygdzcBS.getJygdzcListByIds(zcIds.split(","));
		}
		for(JyzcXx jygdzc : jygdzcList){
			CzZcXx czzcxx = new CzZcXx();
			czzcxx.setZclb(StringUtils.equals("1", fenlei)?
					ZcczCommon.MANAGE_FIXED_ASSEET:
						ZcczCommon.DEALING_ASSET);//分类为经营性固定资产
			czzcxx.setTzzcid(jygdzc.getId());//保存资产Id
			czzcxx.setZcbh(jygdzc.getZcbh());//保存资产编号
			czzcxx.setZcmc(jygdzc.getZcmc());//保存资产名称
			Cardinfo card = null;
			if(StringUtils.isNotEmpty(jygdzc.getId()))							//如果经营资产id不为空,取得主卡片
				card = assetCardUtil.getCardinfo(jygdzc.getId());
			if(card != null){													//如果卡片不为空,取得卡片管理部门名称
				if(StringUtils.isNotEmpty(card.getGlbm())){						//管理部门编号不为空
					PTDeptBO dept = czzcxxBS.getDeptByCode(card.getGlbm());
					czzcxx.setZcglbmmc(dept==null?"":dept.getDeptName());//保存管理部门名称
				}
			}
			if(StringUtils.isNotEmpty(jygdzc.getCZcdq()))				//保存省份、或地区、或详细地址
				czzcxx.setShengfen(codeBS.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", jygdzc.getCZcdq()));
			czzcxx.setCldId(cldId);
			czzcxxBS.save(czzcxx);
		}
	}

	/**
	 * 添加实体 到body表中
	 * @param stIds : 实体的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherSti(String stIds, String cldId) throws IllegalAccessException, InvocationTargetException {
		List<StJbxx> stList = null;
		if(StringUtils.isNotEmpty(stIds)){
			stList = entityBS.getEntityListByIds(stIds.split(","));
		}
		for(StJbxx st : stList){
			CzZcXx czzcxx = new CzZcXx();
			czzcxx.setZclb(ZcczCommon.ENTITY);//保存资产类别
			czzcxx.setTzzcid(st.getId());//保存资产ID
			czzcxx.setZcbh(st.getZcbh());//保存资产编号
			czzcxx.setZcmc(st.getStzwmc());//保存资产名称
			if(StringUtils.isNotEmpty(st.getCGlbm())){
				PTDeptBO dept = czzcxxBS.getDeptByCode(st.getCGlbm());
				czzcxx.setZcglbmmc(dept==null?"":dept.getDeptName());//保存管理部门名称
			}
			if(StringUtils.isNotEmpty(st.getCShengfen())){
				//保存省份、地区或详细地址
				czzcxx.setShengfen(codeBS.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", st.getCShengfen()));
			}
			czzcxx.setCldId(cldId);
			czzcxxBS.save(czzcxx);
		}
	}

	/**
	 * 添加实体内资产 到body表中
	 * @param stid	:	实体Id
	 * @param landList	:	土地资产Id
	 * @param houseList	:	房屋资产Id
	 * @param machineList	:	机器资产Id
	 * @param trafficList	:	交通工具资产Id
	 * @param otherassetList	:	其它资产Id
	 * @param cldId		:	处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherStlzc(String stid, String landList, String houseList, 
			String machineList, String trafficList, String otherassetList,
			String cldId) throws IllegalAccessException, InvocationTargetException {
		addStAssOrWddzw(stid, landList, houseList, machineList, 
				trafficList, otherassetList, cldId, ZcczCommon.ENTITY_ASSET);
	}

	private void addStAssOrWddzw(String stid, String landList, String houseList, 
			String machineList, String trafficList, String otherassetList,
			String cldId, String zclb) throws IllegalAccessException, InvocationTargetException{
		List<StFsxx> fsxxList = null;
		StJbxx st = (StJbxx)czzcxxBS.findById(StJbxx.class, stid);
		String glbm = null;
		if(StringUtils.isNotEmpty(st.getCGlbm())){
			PTDeptBO dept = czzcxxBS.getDeptByCode(st.getCGlbm());
			glbm = dept==null?"":dept.getDeptName();//保存管理部门名称
		}
		
		//土地
		if(StringUtils.isNotEmpty(landList)){
			fsxxList = entityBS.getFsxxListByIds(landList.split(","));
			for(StFsxx fsxx : fsxxList){
				addCzzcxx(zclb, fsxx.getId(), 
						fsxx.getJtdbh(), fsxx.getJtdmc(), glbm, fsxx.getJtdms(), cldId);
			}
		}
		//房屋
		if(StringUtils.isNotEmpty(houseList)){
			fsxxList = entityBS.getFsxxListByIds(houseList.split(","));
			for(StFsxx fsxx : fsxxList){
				addCzzcxx(zclb, fsxx.getId(), 
						fsxx.getKfwbh(), fsxx.getKfwmc(), glbm, fsxx.getKfwdz(), cldId);
			}
		}
		//机械设备
		if(StringUtils.isNotEmpty(machineList)){
			fsxxList = entityBS.getFsxxListByIds(machineList.split(","));
			for(StFsxx fsxx : fsxxList){
				addCzzcxx(zclb, fsxx.getId(), 
						fsxx.getMsbbh(), fsxx.getMsbmc(), glbm, fsxx.getMsbcfwz(), cldId);
			}
		}
		//交通工具
		if(StringUtils.isNotEmpty(trafficList)){
			fsxxList = entityBS.getFsxxListByIds(trafficList.split(","));
			for(StFsxx fsxx : fsxxList){
				addCzzcxx(zclb, fsxx.getId(), 
						fsxx.getLjtgjbh(), fsxx.getLcph(), glbm, fsxx.getLjtgjcfwz(), cldId);
			}
		}
		//其它资产
		if(StringUtils.isNotEmpty(otherassetList)){
			fsxxList = entityBS.getFsxxListByIds(otherassetList.split(","));
			for(StFsxx fsxx : fsxxList){
				addCzzcxx(zclb, fsxx.getId(), 
						fsxx.getPqtzcbh(), fsxx.getPqtzcmc(), glbm, fsxx.getPqtzccfwz(), cldId);
			}
		}
	}
	
	/**
	 * 添加委贷抵债物 到body表中
	 * @param loanId	:	委贷Id
	 * @param landList	:	土地资产Id
	 * @param houseList	:	房屋资产Id
	 * @param machineList	:	机器资产Id
	 * @param trafficList	:	交通工具资产Id
	 * @param otherassetList	:	其它资产Id
	 * @param cldId		:	处理单Id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addOtherWddzw(String loanId, String landList, String houseList, String machineList, String trafficList, String otherassetList,
			String cldId) throws IllegalAccessException, InvocationTargetException {
		addStAssOrWddzw(loanId, landList, houseList, machineList, trafficList, otherassetList, cldId, ZcczCommon.LOAN_PLEDGE);
	}

	/**
	 * 添加债券 到body表中
	 * @param zqIds : 债券的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherZQuan(String zqIds, String cldId) {
		if(StringUtils.isNotEmpty(zqIds)){
			for(String zqId : zqIds.split(",")){
				StockInfo stock = (StockInfo)czzcxxBS.findById(StockInfo.class, zqId);
				addCzzcxx(ZcczCommon.STOCK, stock.getId(), 
						"", stock.getZqmc(), "", stock.getJhfhmc(), cldId);
			}
		}
	}

	/**
	 * 添加自用资产到body表中
	 * @param zcIds : 自用资产的id like 'id0,id1,id2,id3'
	 * @param cldId : 处理单Id
	 */
	public void addOtherZyzc(String zcIds, String cldId) {
		if(StringUtils.isNotEmpty(zcIds)){
			for(String zcId : zcIds.split(",")){
				ZyZc zc = (ZyZc)czzcxxBS.findById(ZyZc.class, zcId);
				addCzzcxx(ZcczCommon.ZYZC_ASSET, zc.getZcId(), 
						zc.getZcbh(), zc.getZcmc(), "办公室", zc.getBgdd(), cldId);
			}
		}
	}

	
	private void addCzzcxx(String zclb,String zcId, 
			String zcbh, String zcmc, String glbmmc, String shengfen, String cldId){
		CzZcXx czzcxx = new CzZcXx();
		czzcxx.setZclb(zclb);//保存资产类别
		czzcxx.setTzzcid(zcId);//保存资产ID
		czzcxx.setZcbh(zcbh);//保存资产编号
		czzcxx.setZcmc(zcmc);//保存资产名称
		czzcxx.setZcglbmmc(glbmmc);//保存管理部门名称
		//保存省份、地区或详细地址
		czzcxx.setShengfen(shengfen);
		czzcxx.setCldId(cldId);
		czzcxxBS.save(czzcxx);
	}

	public String getOtherBodyJson(String cldId) {
		List<CzZcXx> bodyList = czzcxxBS.findCzzcxxByCldId(cldId);
		return BodyListToJSON.getJSON(bodyList, 1, 1, 999999999);
	}

	public String getStlxByStid(String stid) {
		return czzcxxBS.getStlxByStid(stid);
	}
}
