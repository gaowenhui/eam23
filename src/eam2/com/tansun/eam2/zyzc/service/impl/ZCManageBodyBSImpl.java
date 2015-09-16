package com.tansun.eam2.zyzc.service.impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.ZCManageBodyBS;
import com.tansun.eam2.zyzc.utils.CopyOfCoverMapToBody4ReBorrow;
import com.tansun.eam2.zyzc.utils.CoverMapToBody;
import com.tansun.eam2.zyzc.utils.CoverMapToViewVO;
import com.tansun.eam2.zyzc.vo.PurchaseGoodsQueryVO;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.TokenVO;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @author 薛崇杰 2010-11-23 下午10:47:53
 */
@Service
public class ZCManageBodyBSImpl implements ZCManageBodyBS {
	@Autowired
	PublicDao publicDao;
	
	/**
	 * 保存对象到相应的数据表中
	 * @param commonBO
	 */
	public void saveCommonBO(CommonBO commonBO){
		publicDao.save(commonBO);
	}

	/**
	 * 保存数据到Body表
	 */
	public void saveBody(ZySbody zySbody) {
		publicDao.save(zySbody);
	}
	
	/**
	 * 更新body
	 */
	public void updateBody(ZySbody zySbody) {
		publicDao.update(zySbody);
	}
	
	/**
	 * 保存库存台账信息
	 */
	public void saveKctz(ZyKctz zyKctz) {
		publicDao.save(zyKctz);
	}

	/**
	 * 从后台检索数据，刷新界面显示 根据表体ID检索出相应的body信息
	 */
	public ZySbody modifyBody(String sbodyId) {
		List<String> param = new ArrayList<String>();
		param.add(sbodyId);
		return (ZySbody) publicDao.findSingleResult(
				"from ZySbody where sbodyId =? ", param);
	}

	/**
	 * 从后台检索数据，刷新界面显示。 根据sbodyID检索body信息
	 */
	public ZySbody viewBody(String sbodyID) {
		List<String> param = new ArrayList<String>();
		param.add(sbodyID);
		return (ZySbody) publicDao.findSingleResult(
				"from ZySbody where sbodyId =? ", param);
	}
	
	/**
	 * 根据sbodyID检索body出记录
	 */
	public ZySbody findBody(String sbodyId) {
		List<String> param = new ArrayList<String>();
		param.add(sbodyId);
		return (ZySbody) publicDao.findSingleResult(
				"from ZySbody where sbodyId =? ", param);
	}
	
	/**
	 * 根据表体ID删除相应的表体
	 */
	public void deleteBody(String[] bodyIds) {
		String bodyIdStr = "";
		for (int i = 0; i < bodyIds.length; i++) {
			if(StringUtils.isNotEmpty(bodyIds[i]) && !bodyIdStr.contains(bodyIds[i])){
				bodyIdStr = bodyIdStr + bodyIds[i];
				String hql = "from ZySbody o where o.sbodyId = ? ";
				List<String> list = new ArrayList<String>();
				list.add(bodyIds[i]);
				ZySbody zySbody = (ZySbody) publicDao.findSingleResult(hql, list);
				publicDao.delete(zySbody);
			}
		}
	}

	public void deleteStockBody(String[] bodyIds) {
		String bodyIdStr = "";
		for (int i = 0; i < bodyIds.length; i++) {
			if(StringUtils.isNotEmpty(bodyIds[i]) && !bodyIdStr.contains(bodyIds[i])){
				bodyIdStr = bodyIdStr + bodyIds[i];
				String hql = "from ZySbody o where o.sbodyId = ? ";
				List<String> list = new ArrayList<String>();
				list.add(bodyIds[i]);
				ZySbody zySbody = (ZySbody) publicDao.findSingleResult(hql, list);
				publicDao.delete(zySbody);
				//删除三级分类和单位相同的资产
				String hql2 = "from ZySbody o where o.sheadId = ? and o.sjflmc = ? and o.jldw = ?";
				List<String> list2 = new ArrayList<String>();
				list2.add(zySbody.getSheadId());
				list2.add(zySbody.getSjflmc());
				list2.add(zySbody.getJldw());
				List<ZySbody> resulList = (List<ZySbody>) publicDao.find(hql2, list2);
				if(resulList != null && resulList.size() > 0){
					for(ZySbody temp : resulList){
						publicDao.delete(temp);
					}
				}
			}
		}
	}
	/**
	 * 到资产表和台账表中根据ZCId查询出数据，保存到ZySbody中然后显示在Jqgrid中
	 * @param zcID 资产id列表
	 * @return
	 */
	public void saveZcToBody(String[] ZCIds ,String [] headId) {
		try{
			for (int i = 0; i < ZCIds.length; i++) {
				if(StringUtils.isNotEmpty(ZCIds[i])){
					List<String> params = new ArrayList<String>();
					String preparSQL = "select tz.lybmbm,tz.lybmmc,tz.jybmbm,tz.jybmmc,tz.lyrbh,tz.lyrmc,tz.lyrq,tz.jydqrq,zc.* " +
								" from zy_zc zc,zy_kctz tz "+
								" where zc.zc_id = tz.zc_id and tz.sfzxjl = '1' " +
								" and zc.zc_id = ? and " +
								"( zc.zczt='借用' or zc.zczt = '2' or zc.zczt='02')";
					params.add(ZCIds[i]);
					List<Map<String,Object>> list = publicDao.queryForList(preparSQL, params);
					ZySbody zySbody = null;
					if(list.size() < 1){
						String ZyZcPreparSQL = "select * from zy_zc where zc_id = ?";
						List<String> ZyZcParams = new ArrayList<String>();
						ZyZcParams.add(ZCIds[i]);
						List<Map<String,Object>> ZyZclist = publicDao.queryForList(ZyZcPreparSQL, ZyZcParams);
						zySbody = CopyOfCoverMapToBody4ReBorrow.obtainZySbodyFromMap(ZyZclist.get(0));
					}else {
						Map<String,Object> map = list.get(0);
						zySbody = CopyOfCoverMapToBody4ReBorrow.obtainZySbodyFromMap(map);
					}
					
					zySbody.setSheadId(headId[0]);
					publicDao.save(zySbody);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存选中的资产信息和表头信息至表体
	 * @param zcID 资产id列表，得到相应的 zyzc表的信息， 提取相应的字段存放到表体ZySbody中，
	 * @param sheanID 其中ZySbody中的sheadID外键为参数sheanID
	 * @return
	 */
	public void saveZcToBody(String[] ids, String sheadId) {
		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isNotEmpty(ids[i])){
				boolean isZySbodyExist = obtainZySbodyByHeadIdAndZcId(sheadId,ids[i])==null?true:false;
				if(isZySbodyExist){
					List<String> params = new ArrayList<String>();
					params.add(ids[i]);
					ZyZc zyzc = (ZyZc) publicDao.findSingleResult(
							"from ZyZc o where  o.zcId =? ", params);
					ZySbody zySbody = new ZySbody();
//					BeanUtils.copyProperties(zyzc, zySbody);
					zySbody.setBxfws(zyzc.getBxfws());
					zySbody.setBxjg(zyzc.getBxfws());
					zySbody.setBz1(zyzc.getBz());
					zySbody.setCbrq(zyzc.getCbrq());
					zySbody.setCgrq(zyzc.getCgrq());
					zySbody.setCpuxh(zyzc.getCpuxh());
					zySbody.setDisk(zyzc.getDisk());
					zySbody.setDj(zyzc.getDzyhdj());
					zySbody.setEjflbm(zyzc.getEjflbm());
					zySbody.setEjflmc(zyzc.getEjflmc());
					zySbody.setFdjbh(zyzc.getFdjbh());
					zySbody.setGg(zyzc.getGg());
					zySbody.setGys(zyzc.getGys());
					zySbody.setJe(zyzc.getDzyhjg());
					zySbody.setJldw(zyzc.getJldw());
					zySbody.setMemory(zyzc.getMemory());
					zySbody.setLpdlm(zyzc.getLpdlm());
					zySbody.setLph(zyzc.getLph());
					zySbody.setLpqx(zyzc.getLpqx());
					zySbody.setLpsx(zyzc.getLpsx());
					zySbody.setNzdisk(zyzc.getNzdisk());
					zySbody.setSjflbm(zyzc.getSjflbm());
					zySbody.setSjflmc(zyzc.getSjflmc());
					zySbody.setSl(zyzc.getSl());
					zySbody.setZczt(zyzc.getZczt());
					zySbody.setZcmc(zyzc.getZcmc());
					zySbody.setZcId(zyzc.getZcId());
					zySbody.setZcbh(zyzc.getZcbh());
					zySbody.setYjflbm(zyzc.getYjflbm());
					zySbody.setYjflmc(zyzc.getYjflmc());
					zySbody.setXlh(zyzc.getXlh());
					zySbody.setXtxsq(zyzc.getXtxsq());
					zySbody.setTxmbh(zyzc.getTxmbh());
					zySbody.setSheadId(sheadId);
					publicDao.save(zySbody);
				}
			}
		}
	}
	
	/**
	 * 到资产表和台账表中根据ZCId查询出数据，保存到ZySbody中然后显示在Jqgrid中
	 * @param zcID 资产id列表
	 * @param syzt 资产使用状态 0：变更前  1：变更后
	 * @return
	 */
	public void saveZcToBody(String[] ZCIds ,String [] headId,String syzt) {
		try{
			for (int i = 0; i < ZCIds.length; i++) {
				if(StringUtils.isNotEmpty(ZCIds[i])){
					List<String> params = new ArrayList<String>();
					String preparSQL = "select tz.lybmbm,tz.lybmmc,tz.jybmbm,tz.jybmmc,tz.lyrbh,tz.lyrmc,tz.lyrq,tz.jydqrq,zc.* " +
								" from zy_zc zc,zy_kctz tz "+
								" where zc.zc_id = tz.zc_id and tz.sfzxjl = '1' " +
								" and zc.zc_id = ? and " +
								"(zc.zczt='借用' or zc.zczt ='领用' or " +
								" zc.zczt = '2' or zc.zczt='02' or " +
								" zc.zczt='3' or zc.zczt='03')";
					params.add(ZCIds[i]);
					List<Map<String,Object>> list = publicDao.queryForList(preparSQL, params);
					ZySbody zySbody = null;
					if(list.size() < 1){
						String ZyZcPreparSQL = "select * from zy_zc where zc_id = ?";
						List<String> ZyZcParams = new ArrayList<String>();
						ZyZcParams.add(ZCIds[i]);
						List<Map<String,Object>> ZyZclist = publicDao.queryForList(ZyZcPreparSQL, ZyZcParams);
						zySbody = CoverMapToBody.obtainZySbodyFromMap(ZyZclist.get(0));
					}else {
						Map<String,Object> map = list.get(0);
						zySbody = CoverMapToBody.obtainZySbodyFromMap(map);
					}
					
					zySbody.setSheadId(headId[0]);
					zySbody.setSyzt(syzt);
					publicDao.save(zySbody);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 到资产表和台账表中根据ZCId查询出数据，保存到ZySbody中然后显示在Jqgrid中
	 * @param zcID 资产id列表
	 * @param syzt 资产使用状态 0：变更前  1：变更后
	 * @param beforeBodyId 坏了的物品的SbodyId
	 * @return
	 */
	public void saveZcToBody(String[] zcids ,String [] headId,String syzt,String beforeBodyId) {
		try{
			for (int i = 0; i < zcids.length; i++) {
				if(StringUtils.isNotEmpty(zcids[i])){
					boolean isZySbodyExist = obtainZySbodyByHeadIdAndZcId(headId[0],zcids[i])==null?true:false;
					if(isZySbodyExist){
						ZySbody body = this.findBody(beforeBodyId);
						List<String> params = new ArrayList<String>();
						params.add(zcids[i]);
						ZyZc zyzc = (ZyZc) publicDao.findSingleResult(
								"from ZyZc o where  o.zcId = ? ", params);
						ZySbody zySbody = new ZySbody();
						BeanUtils.copyProperties(zyzc, zySbody);
						zySbody.setSheadId(headId[0]);
						zySbody.setSqrid(body.getSqrid());
						zySbody.setSqrmc(body.getSqrmc());
						zySbody.setSqbmid(body.getSqbmid());
						zySbody.setSqbmmc(body.getSqbmmc());
						zySbody.setGrsqdbodyid(beforeBodyId);
						zySbody.setSyzt(syzt);
						publicDao.save(zySbody);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//更新
	public void updateStockGoodsBody(String ids [],String sheadId){
		for(String bodyId : ids){
			if(StringUtils.isNotEmpty(bodyId)){
				ZySbody body = this.findBody(bodyId);
				body.setSheadId(sheadId);
				this.updateBody(body);
			}
		}
		deleteUselessBodyRecord(sheadId);
	}
	
	public void deleteUselessBodyRecord(String sheadId){
		String hql = "from ZySbody where sheadId is null and grsqdbodyid = '"+ sheadId +"'";
		List<ZySbody> tempBodyList = (List<ZySbody>)publicDao.find(hql);
		for(ZySbody body : tempBodyList){
			publicDao.delete(body);
		}
	}
	
	/**
	 * 保存选中的资产信息和表头信息至表体(更换用)
	 * @param zcID 资产id列表，得到相应的 zyzc表的信息， 提取相应的字段存放到表体ZySbody中，
	 * @param sheanID 其中ZySbody中的sheadID外键为参数sheanID
	 * @return
	 */
	@Deprecated
	public void saveZcToBody(String[] ids, String sheadId, String syzt) {
		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isNotEmpty(ids[i])){
				boolean isZySbodyExist = obtainZySbodyByHeadIdAndZcId(sheadId,ids[i])==null?true:false;
				if(isZySbodyExist){
					List<String> params = new ArrayList<String>();
					params.add(ids[i]);
					ZyZc zyzc = (ZyZc) publicDao.findSingleResult(
							"from ZyZc o where  o.zcId =? ", params);
					ZySbody zySbody = new ZySbody();
					BeanUtils.copyProperties(zyzc, zySbody);
					zySbody.setSheadId(sheadId);
					zySbody.setSyzt(syzt);
					publicDao.save(zySbody);
				}
			}
		}
	}
	
	/**
	 * 保存选中的资产信息和表头信息至表体（借用领用用）
	 * @return
	 */
	public void saveZcToBody(String[] ids, String sheadId, String [] ngrInfo,int sl){
		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isNotEmpty(ids[i])){
				String [] flbmArr = ids[i].split("a");
				List<String> params = new ArrayList<String>();
				params.add(flbmArr[0]);
				params.add(flbmArr[1]);
				params.add(flbmArr[2]);
				String preparSQL = "select distinct yjflmc,ejflmc,sjflmc,jldw " +
								   "from zy_zc " +
								   "where yjflbm = ? and ejflbm = ? and sjflbm = ?";
				List<Map<String,Object>> zyzcList = publicDao.queryForList(preparSQL, params);
				ZySbody zySbody = null;
				if(zyzcList.size() == 0){
					String preparSQLForFL = "Select dic3.assettype3_id,dic3.MAINCODE,dic3.secondcode,dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " + 
											"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
											"where dic1.assettype1_id = ? and dic2.assettype2_id = ? and dic3.assettype3_id = ? ";
					List<Map<String,Object>> FLList = publicDao.queryForList(preparSQLForFL, params);
					Map<String,Object> map = FLList.get(0);
					zySbody = new ZySbody();
					zySbody.setSheadId(sheadId);
					zySbody.setSqrmc(ngrInfo[0]);
					zySbody.setSqrid(ngrInfo[1]);
					zySbody.setSqbmmc(ngrInfo[2]);
					zySbody.setSqbmid(ngrInfo[3]);
					zySbody.setYjflbm(flbmArr[0]);
					zySbody.setEjflbm(flbmArr[1]);
					zySbody.setSjflbm(flbmArr[2]);
					zySbody.setYjflmc((String)map.get("TYPENAME1"));
					zySbody.setEjflmc((String)map.get("TYPENAME2"));
					zySbody.setSjflmc((String)map.get("TYPENAME3"));
					zySbody.setSl(Double.valueOf(sl));
					zySbody.setWrksl(1L);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					try {
						zySbody.setJylyrq(sdf.parse(ngrInfo[4]));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}else{
					for(int j = 0; j < zyzcList.size(); j++){
						Map<String,Object> map = zyzcList.get(j);
						if(StringUtils.isNotEmpty((String)map.get("JLDW"))){
							zySbody = new ZySbody();
							zySbody.setSheadId(sheadId);
							zySbody.setSqrmc(ngrInfo[0]);
							zySbody.setSqrid(ngrInfo[1]);
							zySbody.setSqbmmc(ngrInfo[2]);
							zySbody.setSqbmid(ngrInfo[3]);
							zySbody.setYjflbm(flbmArr[0]);
							zySbody.setEjflbm(flbmArr[1]);
							zySbody.setSjflbm(flbmArr[2]);
							zySbody.setYjflmc((String)map.get("YJFLMC"));
							zySbody.setEjflmc((String)map.get("EJFLMC"));
							zySbody.setSjflmc((String)map.get("SJFLMC"));
							zySbody.setJldw((String)map.get("JLDW"));
							zySbody.setSl(1.0);
							zySbody.setWrksl(1L);
							zySbody.setZcbh("");
							zySbody.setTxmbh("");
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							try {
								zySbody.setJylyrq(sdf.parse(ngrInfo[4]));
							} catch (ParseException e) {
								e.printStackTrace();
							}
							break;
						}else{
							zySbody = new ZySbody();
							zySbody.setSheadId(sheadId);
							zySbody.setSqrmc(ngrInfo[0]);
							zySbody.setSqrid(ngrInfo[1]);
							zySbody.setSqbmmc(ngrInfo[2]);
							zySbody.setSqbmid(ngrInfo[3]);
							zySbody.setYjflbm(flbmArr[0]);
							zySbody.setEjflbm(flbmArr[1]);
							zySbody.setSjflbm(flbmArr[2]);
							zySbody.setYjflmc((String)map.get("YJFLMC"));
							zySbody.setEjflmc((String)map.get("EJFLMC"));
							zySbody.setSjflmc((String)map.get("SJFLMC"));
							zySbody.setSl(1.0);
							zySbody.setWrksl(1L);
							zySbody.setZcbh("");
							zySbody.setTxmbh("");
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							try {
								zySbody.setJylyrq(sdf.parse(ngrInfo[4]));
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}
					}
				}
				publicDao.save(zySbody);
			}
		}
	}
	
	/**
	 * 保存选中的资产信息和表头信息至表体（借用领用用）
	 * @return
	 */
	public void saveDicInfoToBody(String dic3_id, String sheadId, String [] ngrInfo){
		String []IdArr = dic3_id.split(",");
		for(String id : IdArr){
			if(StringUtils.isNotEmpty(id)){
				ZySbody body = new ZySbody();
				List<String> params = new ArrayList<String>();
				String preparSQL = "Select dic3.assettype3_id,dic3.maincode,dic3.secondcode, dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " +
				"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
				"where dic3.secondcode = dic2.assettype2_id and dic3.maincode = dic1.assettype1_id "+
				" and dic3.assettype3_id = ?";
				params.add(id);
				List<Map<String,Object>> dicList = (List<Map<String,Object>>)publicDao.queryForList(preparSQL, params);
				Map<String,Object> map = dicList.get(0);
				body.setSheadId(sheadId);
				body.setYjflbm((String)map.get("MAINCODE"));
				body.setEjflbm((String)map.get("SECONDCODE"));
				body.setSjflbm((String)map.get("ASSETTYPE3_ID"));
				body.setYjflmc((String)map.get("TYPENAME1"));
				body.setEjflmc((String)map.get("TYPENAME2"));
				body.setSjflmc((String)map.get("TYPENAME3"));
				body.setZcmc((String)map.get("TYPENAME3"));
				body.setSqrmc(ngrInfo[0]);
				body.setSqrid(ngrInfo[1]);
				body.setSqbmmc(ngrInfo[2]);
				body.setSqbmid(ngrInfo[3]);
				body.setZcbh("");
				body.setTxmbh("");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					body.setJylyrq(sdf.parse(ngrInfo[4]));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				publicDao.save(body);
			}
		}
	}
	
	/**
	 * 借用领用
	 * @param sl
	 * @return
	 */
	public List<ZySbody> splitZc4ConAndBor(String bodyId,String sl,String jydqrq,String jyts){
		int zcSl = Double.valueOf(sl).intValue();
		ZySbody body = this.findBody(bodyId);
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		for(int i = 0; i < zcSl; i++){
			ZySbody tempBody = new ZySbody();
			BeanUtils.copyProperties(body, tempBody);
			tempBody.setSl(1.0);
			tempBody.setBz3(0+"");
			if(jyts != null){
				tempBody.setJyts(Long.parseLong(jyts));
			}
			if(jydqrq != null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					tempBody.setJydqrq(sdf.parse(jydqrq));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			this.saveBody(tempBody);
			bodyList.add(tempBody);
		}
		publicDao.delete(body);
		return bodyList;
	}
	
	/**
	 * 根据页面传过来的资产编号到资产表中查询出该资产的zcId
	 * @param bodyId
	 * @param zcbh
	 */
	public void gernerZcIdByZcbh(String bodyId,String zcbh){
		try{
			List<String> params = new ArrayList<String>();
			ZySbody body = this.obtainZySbodyBySbodyId(bodyId);
			String preparSQL = "select zc_id from Zy_Zc where zcbh = ?";
			params.add(zcbh);
			List<Map<String,Object>> zcIdList = publicDao.queryForList(preparSQL, params);
			Map<String,Object> zcIdMap = zcIdList.get(0);
			body.setZcId((String)zcIdMap.get("ZC_ID"));
			body.setZcbh(zcbh);
			this.updateBody(body);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public TreeMap<String,String> getZcbhInStock(String [] flbm,String zcbhExitThisPage){
		List<String> params = new ArrayList<String>();
		String preparSQL = "select zcbh from zy_zc zc where zc.yjflbm = ? and zc.ejflbm = ? and zc.sjflbm = ? "+
						   "and (zc.zczt = '在库' or zc.zczt = '01' or zc.zczt = '1')";
		params.add(flbm[0]);
		params.add(flbm[1]);
		params.add(flbm[2]);
		List<Map<String,Object>> ZcbhList = publicDao.queryForList(preparSQL, params);
		TreeMap<String,String> returnMap = new TreeMap<String,String>();
		Map<String,Object> tempMap = null;
		String zcbh = "";
		for(int i = 0; i < ZcbhList.size(); i++){
			tempMap = ZcbhList.get(i);
			zcbh = (String)tempMap.get("ZCBH");
			if(zcbh != null && !zcbhExitThisPage.contains(zcbh)){
				returnMap.put(zcbh, zcbh);
			}
		}
		return returnMap;
	}
	
	/**
	 * 保存资产表中的一些字段的值到body表中，供采购单使用
	 * @param zcIds
	 * @param sheadId
	 */
	public void saveZcFieldToBody(String[] zcIds, String sheadId){
		for (int i = 0; i < zcIds.length; i++) {
			if(StringUtils.isNotEmpty(zcIds[i])){
				boolean isZySbodyExist = obtainZySbodyByHeadIdAndZcId(sheadId,zcIds[i])==null?true:false;
				if(isZySbodyExist){
					List<String> params = new ArrayList<String>();
					params.add(zcIds[i]);
					ZyZc zyzc = (ZyZc) publicDao.findSingleResult(
							"from ZyZc o where  o.zcId =? ", params);
					ZySbody zySbody = new ZySbody();
					copyPropertiesFormZyZcToBody(zyzc, zySbody);
					zySbody.setSheadId(sheadId);
					zySbody.setSl(1.0);
					publicDao.save(zySbody);
				}
			}
		}
	}
	
	public void saveZcInfoFromDicTableToBody(String dic3_id,String headId){
		String []IdArr = dic3_id.split(",");
		for(String id : IdArr){
			if(StringUtils.isNotEmpty(id)){
				ZySbody body = new ZySbody();
				List<String> params = new ArrayList<String>();
				String preparSQL = "Select dic3.assettype3_id,dic3.maincode,dic3.secondcode, dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " +
				"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
				"where dic3.secondcode = dic2.assettype2_id and dic3.maincode = dic1.assettype1_id "+
				" and dic3.assettype3_id = ?";
				params.add(id);
				List<Map<String,Object>> dicList = (List<Map<String,Object>>)publicDao.queryForList(preparSQL, params);
				Map<String,Object> map = dicList.get(0);
				body.setSheadId(headId);
				body.setYjflbm((String)map.get("MAINCODE"));
				body.setEjflbm((String)map.get("SECONDCODE"));
				body.setSjflbm((String)map.get("ASSETTYPE3_ID"));
				body.setYjflmc((String)map.get("TYPENAME1"));
				body.setEjflmc((String)map.get("TYPENAME2"));
				body.setSjflmc((String)map.get("TYPENAME3"));
				body.setZcmc((String)map.get("TYPENAME3"));
				body.setSl(1.0);
				this.saveBody(body);
			}
		}
	}
	
	public void saveZcInfoFromDicTableToPdxx(String dic3_id,String headId,String pdpc){
		String [] IdArr = dic3_id.split(",");
		for(String id : IdArr){
			if(StringUtils.isNotEmpty(id)){
				ZyPdxx pdxx = new ZyPdxx();
				List<String> params = new ArrayList<String>();
				String preparSQL = "Select dic3.assettype3_id,dic3.maincode,dic3.secondcode, dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " +
				"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
				"where dic3.secondcode = dic2.assettype2_id and dic3.maincode = dic1.assettype1_id "+
				" and dic3.assettype3_id = ?";
				params.add(id);
				List<Map<String,Object>> dicList = (List<Map<String,Object>>)publicDao.queryForList(preparSQL, params);
				Map<String,Object> map = dicList.get(0);
				pdxx.setSheadId(headId);
				pdxx.setPdpc(pdpc);
				pdxx.setYjflbm((String)map.get("MAINCODE"));
				pdxx.setEjflbm((String)map.get("SECONDCODE"));
				pdxx.setSjflbm((String)map.get("ASSETTYPE3_ID"));
				pdxx.setYjflmc((String)map.get("TYPENAME1"));
				pdxx.setEjflmc((String)map.get("TYPENAME2"));
				pdxx.setSjflmc((String)map.get("TYPENAME3"));
				pdxx.setZcmc((String)map.get("TYPENAME3"));
				pdxx.setSl(0.0);
				pdxx.setPdsl(1.0);
				pdxx.setPdjg("盘盈");
				publicDao.save(pdxx);
			}
		}
	}
	

	/**
	 * 根据表头信息查找表体信息
	 * @param sheadID ZyShead表中的主键，ZySbody的外键
	 * @return list<ZySbody> 得到的ZySbody集合
	 */
	public List<ZySbody> readBodyByHeadID(String sheadID) {
		if (sheadID == null || sheadID.length() <= 1) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();
			params.add(sheadID);
			List<ZySbody> resulList = (List<ZySbody>) publicDao.find(
					"from ZySbody where sheadId = ? and zcId is null order by yjflmc,ejflmc,sjflmc ", params);
			//对查询的结果进行汇总
			if(resulList != null && resulList.size() > 0){
				Map<String, ZySbody> map = new HashMap<String, ZySbody>();
				for(ZySbody body : resulList){
					String key = body.getJldw() + body.getSjflmc();
					//如果key存在，数量进行累加，金额进行合计
					if(map.containsKey(key)){
						double count = map.get(key).getSl() + body.getSl();
						if(map.get(key).getJe() != null && body.getJe() != null){
							double totalMon = map.get(key).getJe() + body.getJe();
							body.setTotalJe(totalMon);
						}
						body.setTotalSl(count);
						map.put(key, body);
					} else {//如果key不存在，放进初始值
						//设置汇总数量和汇总金额
						body.setTotalSl(body.getSl());
						body.setTotalJe(body.getJe());					
						map.put(key, body);
					}
				}
				Iterator<ZySbody> ite = ((Collection<ZySbody>)map.values()).iterator();
				List<ZySbody> tempList = new ArrayList<ZySbody>();
				while(ite.hasNext()){
					tempList.add(ite.next());
				}
				return tempList;
			}else {
				return null;
			}
		}
	}

	/**
	 * 采购单打印需要，采购单打印报错，新增方法。
	 */
	public List<ZySbody> readLyBodyByHeadID(String sheadID) {
		if (sheadID == null || sheadID.length() <= 1) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();
			params.add(sheadID);
			List<ZySbody> resulList = (List<ZySbody>) publicDao.find(
					"from ZySbody where sheadId = ? order by yjflmc,ejflmc,sjflmc ", params);
			//对查询的结果进行汇总
			if(resulList != null && resulList.size() > 0){
				Map<String, ZySbody> map = new HashMap<String, ZySbody>();
				for(ZySbody body : resulList){
					String key = body.getJldw() + body.getSjflmc();
					//如果key存在，数量进行累加，金额进行合计
					if(map.containsKey(key)){
						double count = map.get(key).getSl() + body.getSl();
						if(map.get(key).getJe() != null && body.getJe() != null){
							double totalMon = map.get(key).getJe() + body.getJe();
							body.setTotalJe(totalMon);
						}
						body.setTotalSl(count);
						map.put(key, body);
					} else {//如果key不存在，放进初始值
						//设置汇总数量和汇总金额
						body.setTotalSl(body.getSl());
						body.setTotalJe(body.getJe());					
						map.put(key, body);
					}
				}
				Iterator<ZySbody> ite = ((Collection<ZySbody>)map.values()).iterator();
				List<ZySbody> tempList = new ArrayList<ZySbody>();
				while(ite.hasNext()){
					tempList.add(ite.next());
				}
				return tempList;
			}else {
				return null;
			}
		}
	}
	
	public List<ZySbody> readBodiesByHeadID(String sheadID) {
		if (sheadID == null || sheadID.length() <= 1) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();
			params.add(sheadID);
			List<ZySbody> resulList = (List<ZySbody>) publicDao.find(
					"from ZySbody where sheadId = ? ", params);
			//  修改 领用 模块  开启采购单的时候 采购单前和采购单后 物品顺序不一致。去掉了 order by yjflmc,ejflmc,sjflmc 
			return resulList;
		}
	}
	/**
	 * 在资产表和台账表中根据资产Id查询出数据然后存到ViewVO对象中,供查看使用
	 */
	@SuppressWarnings("unchecked")
	public ViewVO createViewVOZcId(String zcId) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		params.add(zcId);
		String preparSQL = "select * from zy_zc a, zy_kctz b where a.zc_id = b.zc_id and b.sfzxjl = 1 and a.zc_id = ? ";
		strWhere.append(" order by a.zc_id asc");
		preparSQL = preparSQL + strWhere.toString();
		tempList = publicDao.queryForList(preparSQL, params);
		if(tempList.size()>0){
			Map map = (Map)tempList.get(0);
			return CoverMapToViewVO.obtainViewVOFromMap(map);
		}else if(tempList.size()==0){
			String preparSQLOnlyForZyZc = "select * from zy_zc a where a.zc_id = ?";
			preparSQLOnlyForZyZc = preparSQLOnlyForZyZc + strWhere.toString();
			List tempListOnlyForZyZc= publicDao.queryForList(preparSQLOnlyForZyZc, params);
			if(tempListOnlyForZyZc.size()>0){
				Map map = (Map)tempListOnlyForZyZc.get(0);
				return CoverMapToViewVO.obtainViewVOFromMap(map);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
	/**
	 * 在资产表和台账表中根据查询条件和分页器查询出物品的所有维修记录，包括一个物品的多次维修
	 * @param qpv QueryPurchaseVo 查询条件VO
	 * @param paginator 分页器
	 * @return
	 */
	public List<ViewVO> createViewVOByQueryconditionAndPager(QueryPurchaseVo qpv, Paginator paginator) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ViewVO> vvList = new ArrayList<ViewVO>();
		strWhere.append("select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.gg,zc.zcbh,zc.sl,zc.jldw,");
		strWhere.append("zc.dzyhdj,zc.dzyhjg,zc.cbrq,tz.wxfy,tz.rq");
//		String preparSQL = "select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.gg,zc.zcbh,zc.sl,zc.jldw" +
		strWhere.append(" from zy_zc zc, zy_kctz tz where zc.zc_id = tz.zc_id and (tz.tzzt = '03' or tz.tzzt = '3' or tz.tzzt = '维修')");	
		if(StringUtils.isNotEmpty(qpv.getYjflbm()) && !"0".equals(qpv.getYjflbm())){
			strWhere.append(" and zc.yjflbm = ?");
			params.add(qpv.getYjflbm());
		}
		if(StringUtils.isNotEmpty(qpv.getEjflbm()) && !"0".equals(qpv.getEjflbm())){
			strWhere.append(" and zc.ejflbm = ?");
			params.add(qpv.getEjflbm());
		}
		if(StringUtils.isNotEmpty(qpv.getSjflbm()) && !"0".equals(qpv.getSjflbm())){
			strWhere.append(" and zc.sjflbm = ?");
			params.add(qpv.getSjflbm());
		}
		if(StringUtils.isNotEmpty(qpv.getZcmc())){
			strWhere.append(" and zc.zcmc = ?");
			params.add(qpv.getZcmc());
		}
		if(StringUtils.isNotEmpty(qpv.getGg())){
			strWhere.append(" and zc.gg = ?");
			params.add(qpv.getGg());
		}
		strWhere.append(" order by zc.zc_id asc");
		String preparSQL = strWhere.toString();
		PageableList pList = publicDao.queryForList(preparSQL, params,paginator);
		tempList = pList.getResults();
		try{
			if(tempList.size()>0){
				for(int i = 0; i < tempList.size(); i++){
					vvList.add(CoverMapToViewVO.obtainViewVOFromMap((Map)tempList.get(i)));
				}
				return vvList;
			}else{
				return null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据表头信息查找表体信息,
	 * @param sheadId
	 * @param paginator 分页器
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PageableList readBodyByHeadIDAndPager(String sheadId,Paginator paginator) {
		if (sheadId == null || sheadId.length() <= 1) {
			return null;
		} else {
			String preparHQL = "from ZySbody where sheadId = ? order by sbodyId asc";
			List params = new ArrayList();
			params.add(sheadId);
			return (PageableList)publicDao.queryByHQLWithPaginator(preparHQL, params, 
					paginator);
		}
	}
	
	public PageableList readWithoutZcIdBodyByHeadIDAndPager(String sheadId,Paginator paginator){
		if (sheadId == null || sheadId.length() <= 1) {
			return null;
		} else {
			String preparHQL = "from ZySbody where sheadId = ? and zcId is null order by yjflmc,ejflmc,sjflmc ";
			List params = new ArrayList();
			params.add(sheadId);
			return (PageableList)publicDao.queryByHQLWithPaginator(preparHQL, params, 
					paginator);
		}
	}

	/**
	 * 根据表头信息查找表体信息(更换用),
	 * @param sheadId
	 * @param paginator 分页器
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PageableList readBodyByHeadIDAndPager(String sheadId, Paginator paginator, String syzt) {
		if (sheadId == null || sheadId.length() <= 1) {
			return null;
		} else {
			String preparHQL = "from ZySbody where sheadId = ? and syzt = ? order by sbodyId asc";
			List params = new ArrayList();
			params.add(sheadId);
			params.add(syzt);
			return (PageableList)publicDao.queryByHQLWithPaginator(preparHQL, params, 
					paginator);
		}
	}
	
	/**
	 * 根据表头Id和zcId查找表体中是否存在该记录，防止在一个表单中存在两个相同的资产
	 * @param sheadID ZyShead表中的主键，ZySbody的外键
	 * @return ZySbody 得到的ZySbody集合
	 */
	public ZySbody obtainZySbodyByHeadIdAndZcId(String sheadId,String zcId) {
			List<String> params = new ArrayList<String>();
			params.add(sheadId);
			params.add(zcId);
			String preparedHQL = "from ZySbody z where z.sheadId=? and z.zcId = ?";
			return (ZySbody) publicDao.findSingleResult(preparedHQL, params);
	}
	
	/**
	 * 根据表头Id和zcId查找表体中是否存在该记录，防止在一个表单中存在两个相同的资产
	 * @param sheadID ZyShead表中的主键，ZySbody的外键
	 * @return ZySbody 得到的ZySbody集合
	 */
	public ZySbody obtainZySbodyBySbodyId(String bodyId) {
		List<String> params = new ArrayList<String>();
		params.add(bodyId);
		String preparedHQL = "from ZySbody z where z.sbodyId=?";
		return (ZySbody) publicDao.findSingleResult(preparedHQL, params);
	}

	/**
	 * 根据查询条件得到相应的表体信息
	 * 若对象为空，则返回一个null（修正） 查询采购物品,参数：QueryPurchaseVo
	 * 一级分类编码：yjflbm，二级分类编码：ejflbm，三级分类编码：sjflbm（精确查询）
	 * 一级，二级，三级分类编码的数值需要大于0，否则以空值处置（修正） 资产名称：zcmc，规格型号：， gg（模糊查询）
	 * 采购日期：起始日期：qscgrq，结束日期：jscgrq。
	 * （对应字段：cgrq） （起始日期< cgrq <结束日期） 出保日期：起始日期：qscbrq，结束日期：jscbrq。（对应字段：cbrq）
	 * （起始日期< cbrq <结束日期） 所有字段都是与关系
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZySbody> queryBodyByVo(QueryPurchaseVo queryPurVo, String sheettype) {
		if (queryPurVo != null) {
			StringBuffer stringbuffer = new StringBuffer();
			stringbuffer.append("from ZySbody zybody where 1=1 ");
			List params = new ArrayList();
			List<ZySbody> resultList = new ArrayList();
			// 一级分类编码：yjflbm
			if (queryPurVo.getYjflbm() != null
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zybody.yjflbm =?  ");
			}
			// 二级分类编码：ejflbm，
			if (queryPurVo.getEjflbm() != null
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zybody.ejflbm =? ");
			}
			// 三级分类编码：sjflbm（精确查询）
			if (queryPurVo.getSjflbm() != null
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zybody.sjflbm =? ");
			}
			// 资产名称：zcmc，规格型号：gg
			if (queryPurVo.getZcmc() != null
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("'%" + queryPurVo.getZcmc() + " %'");
				stringbuffer.append(" and zybody.zcmc like ? ");
			}

			if (queryPurVo.getGg() != null
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("'%" + queryPurVo.getGg() + "%'");
				stringbuffer.append(" and zybody.gg like ? ");
			}

			// 起始日期：qscgrq
			if (queryPurVo.getQscgrq() != null
					&& queryPurVo.getQscgrq().trim().length() > 0) {
				params.add(queryPurVo.getQscgrq());
				stringbuffer.append(" and zybody.cgrq > ? ");
			}
			// 结束日期：jscgrq。
			if (queryPurVo.getJscgrq() != null
					&& queryPurVo.getJscgrq().trim().length() > 0) {
				params.add(queryPurVo.getJscgrq());
				stringbuffer.append(" and zybody.cgrq < ? ");
			}
			// 出保日期：起始日期：qscbrq，
			if (queryPurVo.getQscbrq() != null
					&& queryPurVo.getQscbrq().trim().length() > 0) {
				params.add(queryPurVo.getQscbrq());
				stringbuffer.append(" and zybody.cbrq > ? ");
			}
			// 结束日期：jscbrq
			if (queryPurVo.getJscbrq() != null
					&& queryPurVo.getJscbrq().trim().length() > 0) {
				params.add(queryPurVo.getJscbrq());
				stringbuffer.append(" and zybody.cbrq < ? ");
			}
			resultList = (List<ZySbody>) publicDao.find(
					stringbuffer.toString(), params);
			return resultList;
		} else {
			return null;
		}
	}

	/**
	 * 从采购表中查出相应的记录放入入库表中(ZySbody)， 其中sbodyIds 是采购表的主键数组， 
	 * sheadId 是入库表单主键，
	 * sheettype 是入库类型
	 * @param sbodyIds
	 * @param sheadId
	 */
	public void saveBodyToBody(String[] sbodyIds, String sheadId) {
		for (int i = 0; i < sbodyIds.length; i++) {
			List params = new ArrayList();
			params.add(sbodyIds[i]);
			ZySbody zySbodynew = new ZySbody();
			ZySbody zySbody = (ZySbody) publicDao.findSingleResult(
					"from ZySbody where sbodyId=?", params);
			BeanUtils.copyProperties(zySbody, zySbodynew);
			zySbodynew.setSheadId(sheadId);
			publicDao.save(zySbodynew);
		}
	}
	
	/**
	 * 根据选择的采购单Id到body表中查询出未入库的物品，复制一份到body表中，同时复制的记录的
	 * shead_Id字段设置为stockId
	 * @param stockId
	 * @param headIdArray
	 * @param cgBodyId
	 */
	public void copyBodyListToBody(String stockId, String [] headIdArray, String cgBodyId){
		List<ZySbody> List4CopyToBody = new ArrayList<ZySbody>();
		String [] ignoreProperties = {"sbodyId"};
		try{
			for(String headId : headIdArray){
				if(StringUtils.isNotEmpty(headId)){
					List4CopyToBody.addAll(obtainBodyListBySheadId(headId));
				}
			}
			for(ZySbody body : List4CopyToBody){
				//针对从入库单增加的物品
				if(StringUtils.isEmpty(cgBodyId)){
					ZySbody tempBody = new ZySbody();
					BeanUtils.copyProperties(body, tempBody, ignoreProperties);
					tempBody.setSheadId(stockId);
					tempBody.setCgdbodyid(body.getSbodyId());
					saveBody(tempBody);
				}else if(!cgBodyId.contains(body.getSbodyId())){
					//针对从采购单多次增加物品会有重复物品的情况
					ZySbody tempBody = new ZySbody();
					BeanUtils.copyProperties(body, tempBody, ignoreProperties);
					tempBody.setSheadId(stockId);
					tempBody.setCgdbodyid(body.getSbodyId());
					saveBody(tempBody);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
//	public void copyBodyListToBody(String stockId, String [] headIdArray, String cgBodyId){
//		List<ZySbody> List4CopyToBody = new ArrayList<ZySbody>();
//		String [] ignoreProperties = {"sbodyId"};
//		try{
//			for(String headId : headIdArray){
//				if(StringUtils.isNotEmpty(headId)){
//					List4CopyToBody.addAll(obtainBodyListBySheadId(headId));
//				}
//			}
//			for(ZySbody body : List4CopyToBody){
//				//当为固定资产时，根据wrksl的值分成多条记录
//				if("1".equals(body.getYjflbm()) || "5".equals(body.getYjflbm())||
//						"2".equals(body.getYjflbm()) || "9".equals(body.getYjflbm())){
//					int wrksl = (body.getWrksl()).intValue();
//					while(wrksl > 0){
//						//针对从入库单增加的物品
//						if(StringUtils.isEmpty(cgBodyId)){
//							ZySbody tempBody = new ZySbody();
//							BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//							tempBody.setSheadId(stockId);
//							tempBody.setCgdbodyid(body.getSbodyId());
//							tempBody.setWrksl(1L);
//							tempBody.setSl(1D);
//							tempBody.setJe(body.getDj());
//							saveBody(tempBody);
//						}else if(!cgBodyId.contains(body.getSbodyId())){
//							//针对从采购单多次增加物品会有重复物品的情况
//							ZySbody tempBody = new ZySbody();
//							BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//							tempBody.setSheadId(stockId);
//							tempBody.setCgdbodyid(body.getSbodyId());
//							tempBody.setWrksl(1L);
//							tempBody.setSl(1D);
//							tempBody.setJe(body.getDj());
//							saveBody(tempBody);
//						}
//						wrksl--;
//					}
//				}else if("3".equals(body.getYjflbm()) || "7".equals(body.getYjflbm())){
//					ZySbody tempBody = new ZySbody();
//					BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//					tempBody.setSheadId(stockId);
//					tempBody.setCgdbodyid(body.getSbodyId());
//					saveBody(tempBody);
//				}
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//	}
	
	/**
	 * 通过三级分类来获得当前资产的在库数量
	 */
	public Double getKcsl(String sjflbm){
		return null;
	}
	
	public ZyZc obtainZyZcByZcId(String zcId){
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from ZyZc z where z.zcId = ?";
		return (ZyZc)publicDao.findSingleResult(preparedHQL, params);
	}
	
	public List<ZyZc> obtainZyZCListByZCIds(String [] zcIds){
		List<ZyZc> zyZcList = new ArrayList<ZyZc>();
		for(String zcId : zcIds){
			if(StringUtils.isNotEmpty(zcId)){
				zyZcList.add(obtainZyZcByZcId(zcId));
			}
		}
		return zyZcList;
	}
	
	/**
	 * 根据SboydId到Zy_Sbody表中查找（领用，借用）所有被拷贝的记录数量
	 * @param bodyId
	 * @return
	 */
	public Integer obtainCopyRecordNum(String bodyId){
		List params = new ArrayList();
		String preparedHQL = "from ZySbody where grsqdbodyid = ? ";
		params.add(bodyId);
		List<ZySbody> bodyList = (List<ZySbody>)publicDao.find(preparedHQL, params);
		return bodyList.size();
	}
	
	/**
	 * 根据bodyIds中的非空Id值到body表中查找记录
	 * @param bodyIds
	 * @return
	 */
	public List<ZySbody> obtainBodyListByBodyIds(String [] bodyIds){
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		for(String bodyId : bodyIds){
			if(StringUtils.isNotEmpty(bodyId)){
				bodyList.add(findBody(bodyId));
			}
		}
		return bodyList;
	}
	
	/**
	 * 根据bodyIds中的非空Id值到body表中查找记录
	 * @param bodyIds
	 * @return
	 */
	public List<ZySbody> obtainBodyListByBodyIds(String [] bodyIds,String syzt){
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		for(String bodyId : bodyIds){
			if(StringUtils.isNotEmpty(bodyId)){
				//物品更换时到body表中查找所有使用状态为1的记录，然后在查找所使用状态为0的记录，放到List
				//中，这样物品更换时就会先办结更换后的物品，后办结更换前的物品，因为更换前的物品有些信息需要使用
				String preparedHQL1 = "from ZySbody where sbodyId = ? and syzt = '1'";
				List<String> params1 = new ArrayList<String>();
				params1.add(bodyId);
				ZySbody body1 = (ZySbody)publicDao.findSingleResult(preparedHQL1, params1);
				if(body1 != null){
					bodyList.add(body1);
				}
				
			}
		}
		
		for(String bodyId : bodyIds){
			if(StringUtils.isNotEmpty(bodyId)){
				String preparedHQL0 = "from ZySbody where sbodyId = ? and syzt = '0'";
				List<String> params0 = new ArrayList<String>();
				params0.add(bodyId);
				ZySbody body0 = (ZySbody)publicDao.findSingleResult(preparedHQL0, params0);
				if(body0 != null){
					bodyList.add(body0);
				}
				
			}
		}
		
//		for(String bodyId : bodyIds){
//			if(StringUtils.isNotEmpty(bodyId)){
//				String hql = "from ZySbody where sbodyId = '"+ bodyId +"' order by syzt desc";
//				bodyList = null;
//				bodyList = (List<ZySbody>)publicDao.find(hql);
//			}
//		}
		
		return bodyList;
	}
	
	
	/**
	 * 根据sheadId和资产Id到body和head表中查询出一条记录，然后存到一个List对象中并返回
	 * @param sheadId
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List obtainKctzAndZyZcListByZcIdAndSheadId(String bodyId,String zcId){
		List params = new ArrayList();
		List kctzAndZyzcList = null;
		Map resultMap = null;
		Date date = new Date();
		ZyKctz kctz = new ZyKctz();
		ZyZc zyzc= new ZyZc();
		
//		String preparedHQL = "SELECT * FROM zy_shead h, zy_sbody b where" + 
//							" h.shead_id = b.shead_id  and b.shead_id = ? and zc_id = ?";
		String preparedHQL = "SELECT * FROM zy_shead h, zy_sbody b where" + 
		" h.shead_id = b.shead_id  and b.sbody_id = ? ";
		params.add(bodyId);
//		params.add(zcId);
		resultMap = publicDao.queryForList(preparedHQL, params).get(0);
		
		zyzc.setZjxgsj(date);
		kctz = commonData(resultMap,kctz,date);
		kctzAndZyzcList = setZyKctzAndZyZcBySheetType(resultMap,kctz,zyzc,date);
		return kctzAndZyzcList;
	}
	
	@SuppressWarnings("unchecked")
	public List obtainKctzAndZyZcListByBodyId(String sbodyId){
		List params = new ArrayList();
		List kctzAndZyzcList = null;
		Map resultMap = null;
		Date date = new Date();
		ZyKctz kctz = new ZyKctz();
		ZyZc zyzc= new ZyZc();
		
		String preparedHQL = "SELECT * FROM zy_shead h, zy_sbody b where" + 
		" h.shead_id = b.shead_id  and b.sbody_id = ? ";
		params.add(sbodyId);
		resultMap = publicDao.queryForList(preparedHQL, params).get(0);
		
		zyzc.setZjxgsj(date);
		kctz = commonData(resultMap,kctz,date);
		kctzAndZyzcList = setZyKctzAndZyZcBySheetType(resultMap,kctz,zyzc,date);
		return kctzAndZyzcList;
	}
	
	public ZyKctz commonData(Map resultMap,ZyKctz kctz,Date date){
		String headId = resultMap.get("SHEAD_ID") != null?(String)resultMap.get("SHEAD_ID"):null;
		ZyShead zyShead = obtainheadByheadId(headId);
//		zyShead.setBdzt("审批完成");
		this.updateHead(zyShead);
		kctz.setZcId((String)resultMap.get("ZC_ID"));
		kctz.setRq(date);								//插入本条记录时间
		kctz.setBz((String)resultMap.get("BZ1"));
		kctz.setDjlx((String)resultMap.get("SHEET_TYPE"));
		kctz.setDjh((String)resultMap.get("SHEET_ID"));
		kctz.setBdyy((String)resultMap.get("YTXQ"));//用途需求
		kctz.setSfzxjl(1L);
		sfzxjl(kctz.getZcId());
		return kctz;
	}
	
	/**
	 * 根据不同的sheettype类型对台账表和资产表做相应的修改，在修改时先判断物品是否时易耗品，如果是易耗品
	 * 则在台账表中插入的记录的入库数量、出库数量、库存数量不是1；在资产表中找到该资产，并更新其数量字段
	 * @param resultMap
	 * @param kctz
	 * @param zyzc
	 * @return
	 */
	public List setZyKctzAndZyZcBySheetType(Map resultMap,ZyKctz kctz,ZyZc zyzc,Date date){
		//是否是易耗品
		boolean isConsuming = false;
		boolean isLowValue = false;
		if("3".equals(resultMap.get("YJFLBM")) || 
				"7".equals(resultMap.get("YJFLBM"))){
			isConsuming = true;
		}
		if("2".equals(resultMap.get("YJFLBM")) || 
				"9".equals(resultMap.get("YJFLBM"))){
			isLowValue = true;
		}
		String sheetType = (String)resultMap.get("SHEET_TYPE");
		List kctzAndZyzcList = new ArrayList();
		if("tostock".equals(sheetType)){
				kctz.setRksl(1D);
				kctz.setKcsl(1D);
				kctz.setCksl(0D);
				zyzc.setSl(1D);
				kctz.setTzzt("在库");
				zyzc.setCbrq(((Date)resultMap.get("CBRQ")));
				zyzc.setZczt("在库");
				zyzc.setRkrq(date);
		}
		
		if("dept_comsuming".equals(sheetType) || "personal_comsuming".equals(sheetType)){
			String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
			//设置个人申请单的表单状态
			if(StringUtils.isNotEmpty(grsqdbodyid)){
				ZySbody body = this.findBody(grsqdbodyid);
				String headId = body.getSheadId();
				String [] bodyIdArr = {body.getSbodyId()};
				this.deleteBody(bodyIdArr);
				changeZySheadBdzt(headId);
			}
			if(isConsuming||isLowValue){
				int dzyhpsl = ((BigDecimal)resultMap.get("SL")).intValue();
				String yjflbm = (String)resultMap.get("YJFLBM");
				String ejflbm = (String)resultMap.get("EJFLBM");
				String sjflbm = (String)resultMap.get("SJFLBM");
				changeDZYhpZczt(yjflbm,ejflbm,sjflbm,dzyhpsl,"领用");
				kctz.setRksl(0D);
				kctz.setCksl(1D);
				kctz.setKcsl(0D);
				kctz.setTzzt("领用");
				kctz.setDjlx("dept_comsuming");
				kctz.setLybmbm((String)resultMap.get("SQBMID"));
				kctz.setLybmmc((String)resultMap.get("SQBMMC"));
				kctz.setLyrbh((String)resultMap.get("SQRID"));
				kctz.setLyrmc((String)resultMap.get("SQRMC"));
			}else{
				kctz.setRksl(0D);
				kctz.setCksl(1D);
				kctz.setKcsl(0D);
				kctz.setGhsj((Date)resultMap.get("JYDQRQ"));
				kctz.setTzzt("领用");
				zyzc.setZczt("领用");
				kctz.setDjlx("dept_comsuming");
				kctz.setLyrq((Date)resultMap.get("LJYRQ"));
				kctz.setLybmbm((String)resultMap.get("SQBMID"));
				kctz.setLybmmc((String)resultMap.get("SQBMMC"));
				kctz.setLyrbh((String)resultMap.get("SQRID"));
				kctz.setLyrmc((String)resultMap.get("SQRMC"));
			}
		}
		
		if("dept_borrow".equals(sheetType) || "personal_borrow".equals(sheetType)){
			String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
			if(StringUtils.isNotEmpty(grsqdbodyid)){
				ZySbody body = this.findBody(grsqdbodyid);
				String headId = body.getSheadId();
				String [] bodyIdArr = {body.getSbodyId()};
				this.deleteBody(bodyIdArr);
				changeZySheadBdzt(headId);
			}
			kctz.setRksl(0D);
			kctz.setCksl(1D);
			kctz.setKcsl(0D);
			kctz.setJyts(((BigDecimal)resultMap.get("JYTS")).doubleValue());
//			zyzc.setSl(0D);
			kctz.setTzzt("借用");
			kctz.setSfxj("否");
			zyzc.setZczt("借用");
			kctz.setJydqrq((Date)resultMap.get("JYDQRQ"));
			kctz.setDjlx("dept_borrow");
			kctz.setJybmbm((String)resultMap.get("NGBMBH"));
			kctz.setJybmmc((String)resultMap.get("NGBMMC"));
			kctz.setLyrbh((String)resultMap.get("NGRBH"));
			kctz.setLyrmc((String)resultMap.get("NGRMC"));
			kctz.setLyrq((Date)resultMap.get("LJYRQ"));	//领借用日期，只对部门领借用单有效
		}
		
		if("reborrow".equals(sheetType)){
			String zcId = (String)resultMap.get("ZC_ID");
			if(!isZCSfxj(zcId)){
				kctz.setSfxj("是");
				kctz.setTzzt("借用");
				zyzc.setZczt("借用");
				kctz.setJyts(((BigDecimal)resultMap.get("JYTS")).doubleValue());
				kctz.setJydqrq((Date)resultMap.get("JYDQRQ"));
				kctz.setJybmbm((String)resultMap.get("SQBMID"));
				kctz.setJybmmc((String)resultMap.get("SQBMMC"));
			}else{
				kctz.setSfxj("是");
				kctz.setTzzt("领用");
				zyzc.setZczt("领用");
				kctz.setLybmbm((String)resultMap.get("SQBMID"));
				kctz.setLybmmc((String)resultMap.get("SQBMMC"));
			}
			kctz.setRksl(0D);
			kctz.setCksl(1D);
			kctz.setKcsl(0D);
			kctz.setDjlx("reborrow");
			kctz.setLyrq((Date)resultMap.get("JYLYRQ"));
			kctz.setLyrbh((String)resultMap.get("SQRID"));
			kctz.setLyrmc((String)resultMap.get("SQRMC"));
		}
		
		if("goodreturn".equals(sheetType)){
			kctz.setRksl(1D);
			kctz.setCksl(0D);
			kctz.setKcsl(1D);
			kctz.setJybmbm((String)resultMap.get("NGBMBH"));
			kctz.setJybmmc((String)resultMap.get("NGBMMC"));
			kctz.setLyrbh((String)resultMap.get("NGRBH"));
			kctz.setLyrmc((String)resultMap.get("NGRMC"));
			kctz.setLyrq((Date)resultMap.get("LJYRQ"));			//领借用日期，只对部门领借用单有效
			kctz.setGhsj((Date)resultMap.get("GHSJ"));			//归还日期
			kctz.setGhbh((String)resultMap.get("SHEET_ID"));
			kctz.setTzzt("在库");
			zyzc.setZczt("在库");
			kctz.setDjlx("goodreturn");
		}
		
		if("goodchange".equals(sheetType)){
			kctz.setDjlx("goodchange");
			if(resultMap.get("SYZT") != null && "1".equals((String)resultMap.get("SYZT"))){
				String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
				ZySbody body = this.findBody(grsqdbodyid);
				String hql = "from ZyKctz where zcId = '"+body.getZcId()+"'"+"and sfzxjl='1'";
				List<ZyKctz> beforekctzList = (List<ZyKctz>)publicDao.find(hql);
				ZyKctz beforekctz = null;
				kctz.setRksl(0D);
				kctz.setCksl(1D);
				kctz.setKcsl(0D);
				if(beforekctzList.size() > 0){
					beforekctz = beforekctzList.get(0);
					if(beforekctz != null){
						if(StringUtils.isNotEmpty(beforekctz.getJybmbm())){
							kctz.setJybmbm(beforekctz.getJybmbm());
							kctz.setTzzt("借用");
							zyzc.setZczt("借用");
						}else{
							kctz.setLybmbm(beforekctz.getLybmbm());
							kctz.setTzzt("领用");
							zyzc.setZczt("领用");
						}
						
						if(StringUtils.isNotEmpty(beforekctz.getJybmmc())){
							kctz.setJybmmc(beforekctz.getJybmmc());
							kctz.setTzzt("借用");
							zyzc.setZczt("借用");
						}else{
							kctz.setLybmmc(beforekctz.getLybmmc());
							kctz.setTzzt("领用");
							zyzc.setZczt("领用");
						}
					}
				}
				kctz.setLyrq((Date)resultMap.get("JYLYRQ"));
				kctz.setLyrbh((String)resultMap.get("SQRID"));
				kctz.setLyrmc((String)resultMap.get("SQRMC"));
			}else if(resultMap.get("SYZT") != null && "0".equals((String)resultMap.get("SYZT"))){
				kctz.setRksl(1D);
				kctz.setCksl(0D);
				kctz.setKcsl(1D);
				kctz.setTzzt("在库");
				zyzc.setZczt("在库");
			}
		}
		
		if("gooddeploy".equals(sheetType)){
			kctz.setTzzt("维修");		//台账状态
			if(resultMap.get("WXFY") != null){
				kctz.setWxfy(((BigDecimal)resultMap.get("WXFY")).doubleValue());
			}else{
				kctz.setWxfy(0.0);
				
			}
			zyzc.setZczt("维修");
			zyzc.setCbrq((Date)resultMap.get("CBRQ"));
			kctz.setDjlx("gooddeploy");
		}
		
		if("discard".equals(sheetType)){
			kctz.setRksl(0D);
			kctz.setCksl(1D);
			kctz.setKcsl(0D);
			kctz.setTzzt("报废");
			zyzc.setZczt("报废");
			zyzc.setSl(0D);
			kctz.setDjlx("discard");
			kctz.setBdyy((String)resultMap.get("YTXQ"));
		}
		
		if("goodrenewal".equals(sheetType)){
			zyzc.setCbrq((Date)resultMap.get("CBRQ"));
			kctz.setDjlx("goodrenewal");
		}
		kctzAndZyzcList.add(kctz);
		kctzAndZyzcList.add(zyzc);
		return kctzAndZyzcList;
	}
	
//	/**
//	 * 根据不同的sheettype类型对台账表和资产表做相应的修改，在修改时先判断物品是否时易耗品，如果是易耗品
//	 * 则在台账表中插入的记录的入库数量、出库数量、库存数量不是1；在资产表中找到该资产，并更新其数量字段
//	 * @param resultMap
//	 * @param kctz
//	 * @param zyzc
//	 * @return
//	 */
//	public List setZyKctzAndZyZcBySheetType(Map resultMap,ZyKctz kctz,ZyZc zyzc,Date date){
//		String sheetType = (String)resultMap.get("SHEET_TYPE");
//		//是否是易耗品
//		boolean isConsuming = false;
//		if("3".equals(resultMap.get("YJFLBM")) || 
//				"7".equals(resultMap.get("YJFLBM"))){
//			isConsuming = true;
//		}
//		List kctzAndZyzcList = new ArrayList();
//		if("tostock".equals(sheetType)){
//			
//			String bodyId = (String)resultMap.get("CGDBODYID");
//			if(bodyId == null){
//				bodyId = (String)resultMap.get("SBODY_ID");
//			}
//			ZySbody body = this.obtainZySbodyBySbodyId(bodyId);
//			if(body != null && "0".equals(body.getWrksl())){
//				try{
//					throw new Exception();
//				}catch(Exception e){
//					System.out.println((String)resultMap.get("ZCMC")+"未入库物品数量为零，不能再入库！");
//				}
//			}else{
//				if(isConsuming){
//					kctz.setRksl(((BigDecimal)resultMap.get("SL")).doubleValue());
//					kctz.setKcsl(zaiKuYHPSL(resultMap) + ((BigDecimal)resultMap.get("SL")).doubleValue());
//					zyzc.setSl(zaiKuYHPSL(resultMap) + ((BigDecimal)resultMap.get("SL")).doubleValue());
//					body.setWrksl(0L);
//				}else{
//					kctz.setRksl(1D);
//					kctz.setKcsl(1D);
//					zyzc.setSl(1D);
//					kctz.setTzzt("在库");
//					zyzc.setCbrq(((Date)resultMap.get("CBRQ")));
//					zyzc.setZczt("在库");
//					if((String)resultMap.get("CGDBODYID") == null){
//						body.setWrksl((body.getSl().longValue() - 1));
//					}else{
//						body.setWrksl(body.getWrksl()-1);
//					}
//				}
//				zyzc.setRkrq(date);
//				kctz.setCksl(0D);
//				this.updateBody(body);
//			}
//		}
//		
//		if("dept_comsuming".equals(sheetType) || "personal_comsuming".equals(sheetType)){
//			String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
//			ZySbody body = this.findBody(grsqdbodyid);
//			String headId = body.getSheadId();
//			String [] bodyIdArr = {body.getSbodyId()};
//			this.deleteBody(bodyIdArr);
//			changeZySheadBdzt(headId);
//			if(isConsuming){
//				kctz.setRksl(0D);
//				kctz.setCksl(((BigDecimal)resultMap.get("SL")).doubleValue());
//				kctz.setKcsl(zaiKuYHPSL(resultMap) - ((BigDecimal)resultMap.get("SL")).doubleValue());
//				zyzc.setSl(zaiKuYHPSL(resultMap) - ((BigDecimal)resultMap.get("SL")).doubleValue());
//			}else{
//				kctz.setRksl(0D);
//				kctz.setCksl(1D);
//				kctz.setKcsl(0D);
//				zyzc.setSl(0D);
//				kctz.setGhsj((Date)resultMap.get("JYDQRQ"));
//				kctz.setTzzt("领用");
//				zyzc.setZczt("领用");
//			}
//			kctz.setDjlx("dept_comsuming");
//			kctz.setLyrq((Date)resultMap.get("LJYRQ"));
//			kctz.setLybmbm((String)resultMap.get("NGBMBH"));
//			kctz.setLybmmc((String)resultMap.get("NGBMMC"));
//			kctz.setLyrbh((String)resultMap.get("NGRBH"));
//			kctz.setLyrmc((String)resultMap.get("NGRMC"));
//		}
//		
//		if("dept_borrow".equals(sheetType) || "personal_borrow".equals(sheetType)){
//			String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
//			ZySbody body = this.findBody(grsqdbodyid);
//			String headId = body.getSheadId();
//			String [] bodyIdArr = {body.getSbodyId()};
//			this.deleteBody(bodyIdArr);
//			changeZySheadBdzt(headId);
//			if(isConsuming){
//				kctz.setRksl(0D);
//				kctz.setCksl(((BigDecimal)resultMap.get("SL")).doubleValue());
//				kctz.setKcsl(zaiKuYHPSL(resultMap) - ((BigDecimal)resultMap.get("SL")).doubleValue());
//				zyzc.setSl(zaiKuYHPSL(resultMap) - ((BigDecimal)resultMap.get("SL")).doubleValue());
//			}else{
//				kctz.setRksl(0D);
//				kctz.setCksl(1D);
//				kctz.setKcsl(0D);
//				kctz.setJyts(((BigDecimal)resultMap.get("JYTS")).doubleValue());
//				zyzc.setSl(0D);
//				kctz.setTzzt("借用");
//				kctz.setSfxj("否");
//				zyzc.setZczt("借用");
//				kctz.setJydqrq((Date)resultMap.get("JYDQRQ"));
//			}
//			kctz.setDjlx("dept_borrow");
//			kctz.setJybmbm((String)resultMap.get("NGBMBH"));
//			kctz.setJybmmc((String)resultMap.get("NGBMMC"));
//			kctz.setLyrbh((String)resultMap.get("NGRBH"));
//			kctz.setLyrmc((String)resultMap.get("NGRMC"));
//			kctz.setLyrq((Date)resultMap.get("LJYRQ"));	//领借用日期，只对部门领借用单有效
//		}
//		
//		if("reborrow".equals(sheetType)){
//			if(isConsuming){
//				kctz.setRksl(0D);
//				kctz.setCksl(0D);
//				kctz.setKcsl(((BigDecimal)resultMap.get("SL")).doubleValue());
//			}else{
//				String zcId = (String)resultMap.get("ZC_ID");
//				if(!isZCSfxj(zcId)){
//					kctz.setSfxj("是");
//					kctz.setTzzt("借用");
//					zyzc.setZczt("借用");
//				}else{
//					kctz.setSfxj("是");
//					kctz.setTzzt("领用");
//					zyzc.setZczt("领用");
//				}
//				kctz.setRksl(0D);
//				kctz.setCksl(1D);
//				kctz.setKcsl(0D);
//				kctz.setJyts(((BigDecimal)resultMap.get("JYTS")).doubleValue());
//				kctz.setJydqrq((Date)resultMap.get("JYDQRQ"));
//			}
//			kctz.setDjlx("reborrow");
//			kctz.setLyrq((Date)resultMap.get("JYLYRQ"));
//			kctz.setJybmbm((String)resultMap.get("SQBMID"));
//			kctz.setJybmmc((String)resultMap.get("SQBMMC"));
//			kctz.setLyrbh((String)resultMap.get("SQRID"));
//			kctz.setLyrmc((String)resultMap.get("SQRMC"));
//		}
//		
//		if("goodreturn".equals(sheetType)){
//			kctz.setRksl(1D);
//			kctz.setCksl(0D);
//			kctz.setKcsl(1D);
//			kctz.setJybmbm((String)resultMap.get("NGBMBH"));
//			kctz.setJybmmc((String)resultMap.get("NGBMMC"));
//			kctz.setLyrbh((String)resultMap.get("NGRBH"));
//			kctz.setLyrmc((String)resultMap.get("NGRMC"));
//			kctz.setLyrq((Date)resultMap.get("LJYRQ"));			//领借用日期，只对部门领借用单有效
//			kctz.setGhsj((Date)resultMap.get("GHSJ"));			//归还日期
//			kctz.setGhbh((String)resultMap.get("SHEET_ID"));
//			kctz.setTzzt("在库");
//			zyzc.setZczt("在库");
//			kctz.setDjlx("goodreturn");
//		}
//		
//		if("goodchange".equals(sheetType)){
//			kctz.setDjlx("goodchange");
//			if(resultMap.get("SYZT") != null && "1".equals((String)resultMap.get("SYZT"))){
//				String grsqdbodyid = (String)resultMap.get("GRSQDBODYID");
//				ZySbody body = this.findBody(grsqdbodyid);
//				String hql = "from ZyKctz where zcId = '"+body.getZcId()+"'"+"and sfzxjl='1'";
//				List<ZyKctz> beforekctzList = (List<ZyKctz>)publicDao.find(hql);
//				ZyKctz beforekctz = null;
//				kctz.setRksl(0D);
//				kctz.setCksl(1D);
//				kctz.setKcsl(0D);
//				if(beforekctzList.size() > 0){
//					beforekctz = beforekctzList.get(0);
//					if(beforekctz != null){
//						if(StringUtils.isNotEmpty(beforekctz.getJybmbm())){
//							kctz.setJybmbm(beforekctz.getJybmbm());
//							kctz.setTzzt("借用");
//							zyzc.setZczt("借用");
//						}else{
//							kctz.setLybmbm(beforekctz.getLybmbm());
//							kctz.setTzzt("领用");
//							zyzc.setZczt("领用");
//						}
//						
//						if(StringUtils.isNotEmpty(beforekctz.getJybmmc())){
//							kctz.setJybmmc(beforekctz.getJybmmc());
//							kctz.setTzzt("借用");
//							zyzc.setZczt("借用");
//						}else{
//							kctz.setLybmmc(beforekctz.getLybmmc());
//							kctz.setTzzt("领用");
//							zyzc.setZczt("领用");
//						}
//					}
//				}
//				kctz.setLyrq((Date)resultMap.get("JYLYRQ"));
//				kctz.setLyrbh((String)resultMap.get("SQRID"));
//				kctz.setLyrmc((String)resultMap.get("SQRMC"));
//			}else if(resultMap.get("SYZT") != null && "0".equals((String)resultMap.get("SYZT"))){
//				kctz.setRksl(1D);
//				kctz.setCksl(0D);
//				kctz.setKcsl(1D);
//				kctz.setTzzt("在库");
//				zyzc.setZczt("在库");
//			}
//		}
//		
//		if("gooddeploy".equals(sheetType)){
//			kctz.setTzzt("维修");		//台账状态
//			kctz.setWxfy(((BigDecimal)resultMap.get("WXFY")).doubleValue());
//			zyzc.setZczt("维修");
//			zyzc.setCbrq((Date)resultMap.get("CBRQ"));
//			kctz.setDjlx("gooddeploy");
//		}
//		
//		if("discard".equals(sheetType)){
//			if(isConsuming){
//				double sl = ((BigDecimal)resultMap.get("SL")).doubleValue();
//				kctz.setRksl(0D);
//				kctz.setCksl(sl);
//				kctz.setKcsl(zaiKuYHPSL(resultMap) - sl);
//				zyzc.setSl(zaiKuYHPSL(resultMap) - sl);
//			}else{
//				kctz.setRksl(0D);
//				kctz.setCksl(1D);
//				kctz.setKcsl(0D);
//				kctz.setTzzt("报废");
//				zyzc.setZczt("报废");
//				zyzc.setSl(0D);
//			}
//			kctz.setDjlx("discard");
//			kctz.setBdyy((String)resultMap.get("YTXQ"));
//		}
//		
//		if("goodrenewal".equals(sheetType)){
//			zyzc.setCbrq((Date)resultMap.get("CBRQ"));
//			kctz.setDjlx("goodrenewal");
//		}
//		kctzAndZyzcList.add(kctz);
//		kctzAndZyzcList.add(zyzc);
//		return kctzAndZyzcList;
//	}
	
	/**
	 * 根据headId在body表中查找本表单下的所有bodyId
	 * @param headId
	 * @return
	 */
	public String[] obtainBodyIdBySheadId(String headId){
		int bodyIdAyyayIndex = 0;
		String hql = "from ZySbody zyb where zyb.sheadId = '" + headId +"'";
		List bodyList = new ArrayList();
		bodyList = publicDao.find(hql);
		String [] bodyIdAyyay = new String[bodyList.size()];
		for(Iterator<ZySbody> i = bodyList.iterator(); i.hasNext();){
			bodyIdAyyay[bodyIdAyyayIndex] = i.next().getSbodyId();
			bodyIdAyyayIndex++;
		}
		return bodyIdAyyay;
	}
	
	public String[] obtainBodyIdBySheadIdWithoutCGDBodyId(String headId){
		int bodyIdAyyayIndex = 0;
		String hql = "from ZySbody zyb where zyb.sheadId = '" + headId +
					 "' and zyb.cgdbodyid is null " +
					 " and zyb.sl = 1";
		List bodyList = new ArrayList();
		bodyList = publicDao.find(hql);
		String [] bodyIdAyyay = new String[bodyList.size()];
		for(Iterator<ZySbody> i = bodyList.iterator(); i.hasNext();){
			bodyIdAyyay[bodyIdAyyayIndex] = i.next().getSbodyId();
			bodyIdAyyayIndex++;
		}
		return bodyIdAyyay;
	}
//	/**
//	 * 供续借调用，判断根据该zc_id看该资产是否续借过，如果续借过，返回true，否则，返回false
//	 * @param zcId
//	 * @return
//	 */
//	public boolean isZCSfxj(String zcId){
//		List params = new ArrayList();
//		params.add(zcId);
//		String preparedHQL = "from ZyKctz tz where tz.zcId = ? and tz.sfzxjl = '1'";
//		ZyKctz kctz = (ZyKctz)publicDao.findSingleResult(preparedHQL, params);
//		if(kctz == null){
//			return false;
//		}else {
//			if("是".equals(kctz.getSfxj())){
//				return true;
//			}else {
//				return false;
//			}
//		}
//	}
	
	/**
	 * 供续借调用，判断根据该zc_id看该资产是否续借过，如果续借过，返回true，否则，返回false
	 * @param zcId
	 * @return
	 */
	public boolean isZCSfxj(String zcId){
		List params = new ArrayList();
//		params.add(zcId);
		String preparSQL = "select * from Zy_Kctz tz where tz.zc_id = '"+ zcId +"' and tz.sfzxjl = '1'";
		List<Map<String,Object>> kctzList = (List<Map<String,Object>>)publicDao.queryForList(preparSQL, params);
		if(kctzList.size() > 0){
			if("是".equals((String)kctzList.get(0).get("SFXJ"))){
				return true;
			}else {
				return false;
			}
		}else{
			return false;
		}
	}
	
	/**
	 * 部门领用和部门借用时调用本方法，将其表单状态置为数据已办结
	 * @param sheadId
	 */
	public void changeZySheadBdzt(String sheadId){
		List<ZySbody> bodyList = this.obtainBodyListBySheadId(sheadId);
		if(bodyList.size() == 0){
			String preparedHQL = "from ZyShead where sheadId = ?";
			List params = new ArrayList();
			params.add(sheadId);
			ZyShead headList = (ZyShead)publicDao.findSingleResult(preparedHQL, params);
			headList.setBdzt("数据已办结");
			publicDao.update(headList);
		}
	}
	
	public String[] changeDZYhpZczt(String yjflbm,String ejflbm,String sjflbm,int dzyhpsl,String zczt){
		String hql = "from ZyZc where yjflbm = '"+ yjflbm +"' and ejflbm = '"+ ejflbm +"' and sjflbm = '"+ sjflbm +"' and zczt in ('在库','01','1')";
		List<ZyZc> zcList = (List<ZyZc>)publicDao.find(hql);
		String [] dzyhZcidArr = new String[dzyhpsl];
		for(int i = 0; i < dzyhpsl; i++){
			ZyZc zc = zcList.get(i);
			zc.setZczt(zczt);
			zc.setZjxgsj(new Date());
			publicDao.update(zc);
			dzyhZcidArr[i] = zcList.get(i).getZcId();
		}
		return dzyhZcidArr;
	}
	
	public List<ZyZc> ObtainDZYhpZcList(String yjflbm,String ejflbm,String sjflbm){
		String hql = "from ZyZc where yjflbm = '"+ yjflbm +"' and ejflbm = '"+ ejflbm +"' and sjflbm = '"+ sjflbm +"' and zczt in ('在库','01','1')";
		List<ZyZc> zcList = (List<ZyZc>)publicDao.find(hql);
		return zcList;
	}
	/**
	 * 根据headId在body表中查找本headId下的所有未入库物品值大于零的物品
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZySbody> obtainBodyListBySheadId(String headId){
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		String preparedHQL = "from ZySbody zyb where zyb.sheadId = ?";
		params.add(headId);
		strWhere.append(" and zyb.wrksl > 0");
		preparedHQL = preparedHQL + strWhere.toString();
		return (List<ZySbody>)publicDao.find(preparedHQL, params);
	}
	
	/**
	 * 根据资产Id到台账表中查找该最新一条记录(SFZXJL)的sfxj字段的值
	 * @param zcId
	 * @return
	 */
	public String sfxj(String zcId){
		List<ZyKctz> kctzList = new ArrayList<ZyKctz>();
		ZyKctz kctz = null;
		String hql = "from ZyKctz k where k.zcId = '" + zcId + "'";
		kctzList = (List<ZyKctz>)publicDao.find(hql);
		for(Iterator<ZyKctz> i = kctzList.iterator(); i.hasNext();){
			kctz = i.next();
			if(1 == kctz.getSfzxjl()){
				return kctz.getSfxj();
			}
		}
		return null;
	}
	
	/**
	 * 根据资产Id到台账表中查找该最新一条记录的SFZXJL字段的值，将其值设为数字0
	 * @param zcId
	 * @return
	 */
	public void sfzxjl(String zcId){
		List<ZyKctz> kctzList = new ArrayList<ZyKctz>();
		ZyKctz kctz = null;
		String hql = "from ZyKctz k where k.zcId = '" + zcId + "'";
		kctzList = (List<ZyKctz>)publicDao.find(hql);
		for(Iterator<ZyKctz> i = kctzList.iterator(); i.hasNext();){
			kctz = i.next();
			if(1 == kctz.getSfzxjl()){
				kctz.setSfzxjl(0L);
			}
		}
	}
	
	/**
	 * 把body表中的一些字段拷贝到资产表中
	 */
	public ZyZc copyProperties(ZySbody body,ZyZc zyzc){
		zyzc.setYjflbm(StringUtils.isNotEmpty(body.getYjflbm())?body.getYjflbm():null); 
		zyzc.setEjflbm(StringUtils.isNotEmpty(body.getEjflbm())?body.getEjflbm():null);
		zyzc.setSjflbm(StringUtils.isNotEmpty(body.getSjflbm())?body.getSjflbm():null);
		zyzc.setYjflmc(StringUtils.isNotEmpty(body.getYjflmc())?body.getYjflmc():null);
		zyzc.setEjflmc(StringUtils.isNotEmpty(body.getEjflmc())?body.getEjflmc():null);
		zyzc.setSjflmc(StringUtils.isNotEmpty(body.getSjflmc())?body.getSjflmc():null);
		zyzc.setJldw(StringUtils.isNotEmpty(body.getJldw())?body.getJldw():null);
		zyzc.setZcmc(StringUtils.isNotEmpty(body.getZcmc())?body.getZcmc():null);
		zyzc.setGg(StringUtils.isNotEmpty(body.getGg())?body.getGg():null);
//		zyzc.setZcbh(body.getZcbh());
//		zyzc.setTxmbh(body.getTxmbh());
//		zyzc.setXlh(body.getXlh());
//		zyzc.setSl(body.getSl());
//		zyzc.setJldw(body.getJldw());
//		zyzc.set
		return zyzc;
	}
	
	/**
	 * 把body表中的和资产表中对应的字段拷贝到资产表中
	 */
	public ZyZc copyPropertiesForStock(ZySbody body,ZyZc zyzc){
		zyzc.setYjflbm(StringUtils.isNotEmpty(body.getYjflbm())?body.getYjflbm():null); 
		zyzc.setEjflbm(StringUtils.isNotEmpty(body.getEjflbm())?body.getEjflbm():null);
		zyzc.setSjflbm(StringUtils.isNotEmpty(body.getSjflbm())?body.getSjflbm():null);
		zyzc.setYjflmc(StringUtils.isNotEmpty(body.getYjflmc())?body.getYjflmc():null);
		zyzc.setEjflmc(StringUtils.isNotEmpty(body.getEjflmc())?body.getEjflmc():null);
		zyzc.setSjflmc(StringUtils.isNotEmpty(body.getSjflmc())?body.getSjflmc():null);
		zyzc.setJldw(StringUtils.isNotEmpty(body.getJldw())?body.getJldw():null);
		zyzc.setZcmc(StringUtils.isNotEmpty(body.getZcmc())?body.getZcmc():null);
		zyzc.setGg(StringUtils.isNotEmpty(body.getGg())?body.getGg():null);
		zyzc.setZcbh(body.getZcbh());
		zyzc.setTxmbh(body.getTxmbh());
		zyzc.setXlh(body.getXlh());
		zyzc.setSl(body.getSl());
		zyzc.setZczt(body.getZczt());
		zyzc.setBxfws(body.getBxfws());
		zyzc.setBxfws(body.getBxjg());
		zyzc.setBz(body.getBz1());
		zyzc.setCbrq(body.getCbrq());
		zyzc.setCgrq(body.getCgrq());
		zyzc.setCpuxh(body.getCpuxh());
		zyzc.setDisk(body.getDisk());
		zyzc.setDzyhdj(body.getDj());
		zyzc.setDzyhjg(body.getJe());
		zyzc.setFdjbh(body.getFdjbh());
		zyzc.setGys(body.getGys());
		zyzc.setMemory(body.getMemory());
		zyzc.setLpdlm(body.getLpdlm());
		zyzc.setLph(body.getLph());
		zyzc.setLpqx(body.getLpqx());
		zyzc.setLpsx(body.getLpsx());
		zyzc.setNzdisk(body.getNzdisk());
		zyzc.setXtxsq(body.getXtxsq());
		return zyzc;
	}
	
	/**
	 * 把自用资产表中的一些字段的值拷贝到body表中
	 * @param zyzc
	 * @param body
	 * @return
	 */
	public ZySbody copyPropertiesFormZyZcToBody(ZyZc zyzc,ZySbody body){
		body.setYjflbm(StringUtils.isNotEmpty(zyzc.getYjflbm())?zyzc.getYjflbm():null); 
		body.setEjflbm(StringUtils.isNotEmpty(zyzc.getEjflbm())?zyzc.getEjflbm():null);
		body.setSjflbm(StringUtils.isNotEmpty(zyzc.getSjflbm())?zyzc.getSjflbm():null);
		body.setYjflmc(StringUtils.isNotEmpty(zyzc.getYjflmc())?zyzc.getYjflmc():null);
		body.setEjflmc(StringUtils.isNotEmpty(zyzc.getEjflmc())?zyzc.getEjflmc():null);
		body.setSjflmc(StringUtils.isNotEmpty(zyzc.getSjflmc())?zyzc.getSjflmc():null);
		body.setJldw(StringUtils.isNotEmpty(zyzc.getJldw())?zyzc.getJldw():null);
		body.setZcmc(StringUtils.isNotEmpty(zyzc.getZcmc())?zyzc.getZcmc():null);
		body.setGg(StringUtils.isNotEmpty(zyzc.getGg())?zyzc.getGg():null);
//		body.setDj((zyzc.getDzyhdj()==null)?null:null);
//		body.setSl((zyzc.getSl()==null)?null:zyzc.getSl());
//		body.setJe((zyzc.getDzyhjg()==null)?null:zyzc.getDzyhjg());
//		body.setWrksl((zyzc.getSl()==null)?null:zyzc.getSl().longValue());
		return body;
	}
	
	/**
	 * 在body表中查找在一个headId下的所有记录中含有未入库物品list
	 * @param pgqv PurchaseGoodsQueryVO
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZySbody> obatainBodyListByVoAndHeadId(QueryPurchaseVo queryPurVo,String headId){
		List paramList = new ArrayList();
		StringBuffer sb = new StringBuffer();
		if(isheadRK(headId)){
			sb.append("from ZySbody zb where zb.sheadId = '" + headId +"'");
			if(StringUtils.isNotEmpty(queryPurVo.getYjflbm()) && 
				!"0".equals(queryPurVo.getYjflbm()) &&
				!"null".equals(queryPurVo.getYjflbm())){
				
				paramList.add(queryPurVo.getYjflbm());
				sb.append(" and zb.yjflbm = ?");
			}
			if(StringUtils.isNotEmpty(queryPurVo.getEjflbm()) && 
				!"0".equals(queryPurVo.getEjflbm()) &&
				!"null".equals(queryPurVo.getEjflbm())){
				paramList.add(queryPurVo.getEjflbm());
				sb.append(" and zb.ejflbm = ?");
			}
			if(StringUtils.isNotEmpty(queryPurVo.getSjflbm()) && 
				!"0".equals(queryPurVo.getSjflbm()) &&
				!"null".equals(queryPurVo.getSjflbm())){
				paramList.add(queryPurVo.getSjflbm());
				sb.append(" and zb.sjflbm = ?");
			}
			if(StringUtils.isNotEmpty(queryPurVo.getZcmc()) && 
					!"null".equals(queryPurVo.getZcmc())){
				paramList.add("%"+ queryPurVo.getZcmc() +"%");
				sb.append(" and zb.zcmc like ?");
			}
			if(StringUtils.isNotEmpty(queryPurVo.getGg()) && 
					!"null".equals(queryPurVo.getGg())){
				paramList.add("%"+ queryPurVo.getGg() +"%");
				sb.append(" and zb.gg like ?");
			}
			if(queryPurVo.getZzcgrq()!=null){
				paramList.add(queryPurVo.getZzcgrq());
				sb.append(" and zb.cgrq > ?");
			}
			if(queryPurVo.getZwcgrq()!=null){
				paramList.add(queryPurVo.getZwcgrq());
				sb.append(" and zb.cgrq < ?");
			}
			sb.append(" order by zb.sbodyId");
			return (List<ZySbody>)publicDao.find(sb.toString(), paramList);
		}
		return null;
	}
	
	/**
	 * 在body表中查找该headId下的所有记录是否有未入库物品，有：true，没有：false
	 * @return
	 */
	public boolean isheadRK(String headId){
		List<ZySbody> bodyList = readBodyByHeadID(headId);
		for(ZySbody body: bodyList){
			if(body.getWrksl() > 0){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 在body表中查询所有未入库物品的headId，组成以逗号分割的字符串返回
	 * @return
	 */
	public String obtainHeadIdStrWithWRKGoods(){
		StringBuffer HeadIdStrWithWRKGoodsSB = new StringBuffer();
		List params= new ArrayList();
		String preparSQL = "select distinct shead_Id from zy_sbody zb where zb.wrksl > ?";
		params.add(0);
		List<Map<String,Object>> HeadIdList = publicDao.queryForList(preparSQL, params);
		if(HeadIdList != null){
			for(Map<String,Object> headMap : HeadIdList){
				HeadIdStrWithWRKGoodsSB.append(headMap.get("SHEAD_ID") != null ? headMap.get("SHEAD_ID") : "" + ",");
			}
		}
		return HeadIdStrWithWRKGoodsSB.toString();
	}
	
	/**
	 * 在body表中查找该headId下的所有记录中还有未入库的物品的List
	 * @return
	 */
	public List<ZySbody> obationWRKGoods(String headId){
		List<ZySbody> bodyList = readBodyByHeadID(headId);
		List<ZySbody> WRKBodyList = new ArrayList<ZySbody>();
		for(ZySbody body: bodyList){
			if(body.getWrksl() > 0){
				WRKBodyList.add(body);
			}
		}
		return WRKBodyList;
	}
	
	/**
	 * 根据tokenQueryCondit中的查询条件到资产表和台账表中查询数据
	 * 组成TokenVO后返回
	 */
	public List<TokenVO> obatainTokenInfo(String [] tokenQueryCondit){
		List params = new ArrayList();
		List<TokenVO> tokenVOList = new ArrayList<TokenVO>();
		StringBuffer strWhere = new StringBuffer();
		String preparSQL="select * from Zy_Zc zc ,Zy_Kctz tz where zc.zc_id = tz.zc_id";
		
		strWhere.append(" and zc.ejflmc = '令牌'");
		strWhere.append(" and zc.sjflmc = '令牌'");
		if(StringUtils.isNotEmpty(tokenQueryCondit[0])){
			strWhere.append(" and zc.lph like ?");
			params.add("%" + tokenQueryCondit[0] + "%");
		}
		if(StringUtils.isNotEmpty(tokenQueryCondit[1])){
			params.add("%" + tokenQueryCondit[1] + "%");
			strWhere.append(" and zc.lpdlm like ?");
		}
		preparSQL = preparSQL + strWhere.toString();
		List tempList = publicDao.queryForList(preparSQL, params);
		if(tempList!=null&&tempList.size() > 0){
			for(int i = 0; i < tempList.size(); i++){
				Map map = (Map)tempList.get(i);
				TokenVO tvo = new TokenVO();
				tvo.setLyrmc(map.get("LYRMC") != null ? (String)map.get("LYRMC") : null);
				tvo.setLpdlm(map.get("LPDLM") != null ? (String)map.get("LPDLM") : null);
				tvo.setLph	(map.get("LPH")   != null ? (String)map.get("LPH")   : null);
				tvo.setLpqx	(map.get("LPQX")  != null ? (String)map.get("LPQX")  : null);
				tvo.setZczt	(map.get("ZCZT")  != null ? (String)map.get("ZCZT")  : null);
				tvo.setLpsx	(map.get("LPSX")  != null ? (Date)map.get("LPSX")  	 : null);
				tokenVOList.add(tvo);
			}
			
			return tokenVOList;
		}else{
			return null;
		}
	}
	
	/**
	 * 得到所有在库易耗品数量,不管易耗品记录在资产表中有多少条
	 */
	public Double zaiKuYHPSL(Map resultMap){
		String yjflbm = (String)resultMap.get("YJFLBM");
		String ejflbm = (String)resultMap.get("EJFLBM");
		String sjflbm = (String)resultMap.get("SJFLBM");
		List params = new ArrayList();
		String preparedHQL = "from ZyZc where yjflbm = ? and ejflbm = ? and sjflbm = ?";
		params.add(yjflbm);
		params.add(ejflbm);
		params.add(sjflbm);
		//数据更改时要更改此处物品查询方法,易耗品只能有一条记录
		List<ZyZc> zyZcList = (List<ZyZc>)publicDao.find(preparedHQL, params);
		//易耗品数量
		double yhpsl = 0D;
		for(ZyZc zyZc : zyZcList){
			if(zyZc.getSl() != null){
				yhpsl = yhpsl + zyZc.getSl();
			}
		}
		return yhpsl;
	}
	
	/**
	 * 根据一级分类名称，二级分类名称，三级分类名称到资产表中查询出zcId
	 * @param yjflbm
	 * @param ejflbm
	 * @param sjflbm
	 * @return
	 */
	public String obtainZyZcByFLBM(String yjflbm,String ejflbm,String sjflbm){
		List params = new ArrayList();
		String preparedHQL = "from ZyZc where yjflbm = ? and ejflbm = ? and sjflbm = ?";
		params.add(yjflbm);
		params.add(ejflbm);
		params.add(sjflbm);
		//数据更改时要更改此处物品查询方法,易耗品只能有一条记录
		List<ZyZc> zyZcList = (List<ZyZc>)publicDao.find(preparedHQL, params);
		return zyZcList.get(0).getZcId();
	}
	
	/**
	 * 根据资产Id和caSheadId到LcCardtemp表中查询出id（主键）
	 * @param zcId
	 * @param caSheadId
	 * @return
	 */
	public String obtainIdWithZcIdAndHeadId(String zcId, String caSheadId){
		List params = new ArrayList();
		StringBuffer idStr = new StringBuffer();
		String preparSQL = "select id from Lc_Cardtemp where zcid = ? and kpxzid = ?";
		params.add(zcId);
		params.add(caSheadId);
		List cardTempList = publicDao.queryForList(preparSQL, params);
		Map map = new HashMap();
		if(cardTempList.size() > 0){
			for(int i = 0; i < cardTempList.size(); i++){
				map = (Map)cardTempList.get(i);
				idStr.append(map.get("ID") != null ? map.get("ID"):"" +",");
			}
		}
		return idStr.toString();
	}
	
	public ZyShead obtainheadByheadId(String headId){
		String preparedHQL = "from ZyShead where sheadId = ?";
		List params = new ArrayList();
		params.add(headId);
		return (ZyShead)publicDao.findSingleResult(preparedHQL, params);
	}
	
	public void updateHead(ZyShead head){
		publicDao.update(head);
	}
	
	/**
	 * 根据headId到盘点信息表中查找该Id下的所有记录
	 * @param headId
	 * @return
	 */
	public String obtainPdxxListWithHeadId(String headId,Paginator paginator){
		String preparedHQL = "from ZyPdxx zp where zp.sheadId = ? order by zp.id desc";
		List params = new ArrayList();
		params.add(headId);
		PageableList list = publicDao.queryByHQLWithPaginator(preparedHQL, params, paginator);
		List list1 = list.getResults();
		String josnStr = BodyListToJSON.getJSON(list1, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		return josnStr;
	}
	
	/**
	 * 根据传输过来的个人申请单Id到body表中找到该数据复制一份保存到body表中，并设置复制后的资产的headId
	 * 为部门领用申请单的Id
	 * @param bodyIds 
	 * @param headId
	 */
	public void copyPersonalBodyToDeptBody(String bodyIds,String headId){
		String [] bodyIdArr = bodyIds.split(",");
		for(String bodyId : bodyIdArr){
			if(StringUtils.isNotEmpty(bodyId)){
				String [] ignoreProperties = {"sbodyId"};
				ZySbody tempBody = new ZySbody();
				BeanUtils.copyProperties(this.findBody(bodyId), tempBody, ignoreProperties);
				tempBody.setSheadId(headId);
				tempBody.setGrsqdbodyid(bodyId);
				saveBody(tempBody);
				}
			}
		}
	
	/**
	 * 通过headId查找body信息
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId){
		String sql = "select SBODY_ID from ZY_SBODY where SHEAD_ID = '"+headId+"'";
		String bodyIds = "";
		List list = publicDao.queryForList(sql, new ArrayList());
		for(int i = 0 ; i < list.size();i++){
			Map map = (Map)list.get(i);
			bodyIds = bodyIds + String.valueOf(map.get("SBODY_ID")) + ",";
		}
		return bodyIds;
	}
	
	/**
	 * 到Zy_sbody表中查询所有的wrksl字段的值不为0的记录，组成list返回到前台
	 * @return
	 */
	public List<ZySbody> query4StockBodyListAndPager(Paginator paginator,String SheetHeadId,String existBodyIdStr){
		String headIdArr[] = obtainPurchaseSheetIds();
		String flAleradyAddStr = this.obtainFlMCById(existBodyIdStr);
		if(headIdArr == null){
			return null;
		}
		List<ZySbody> AllbodyList = new ArrayList<ZySbody>();
		List<ZySbody> TempbodyList = null;
		List<ZySbody> finalBodyList = new ArrayList<ZySbody>();
		//找到所有未入库物品bodyList
		for(String headId : headIdArr){
			String hql = "from ZySbody where wrksl > 0 and sheadId = '"+headId+"'";
			TempbodyList = (List<ZySbody>)publicDao.find(hql);
		}
		AllbodyList.addAll(TempbodyList);
		
		//在bodyList找到未入库物品的所有分类
		String flArr = ""; 
		String tempflArr = "";
		for(ZySbody body : AllbodyList){
			tempflArr = body.getYjflmc()+","+ body.getEjflmc()+","+ body.getSjflmc()+";";
			if(!flAleradyAddStr.contains(tempflArr) && !flArr.contains(tempflArr)){
				flArr = flArr + tempflArr;
			}
			tempflArr = "";
		}
		
		//在bodyList中根据分类找到各个分类的物品数量,
		String [] firstArr = flArr.split(";");
		int sl = 0;
		String [] ignoreProperties = {"sheadId","sbodyId"};
		for(String everyElement : firstArr){
			ZySbody tempBody = null;
			for(ZySbody body : AllbodyList){
				if(everyElement.
						equals(body.getYjflmc()+","+body.getEjflmc()+","+body.getSjflmc())){
					sl= sl + body.getWrksl().intValue();
					tempBody = body;
				}
			}
			ZySbody body = new ZySbody();
			BeanUtils.copyProperties(tempBody, body, ignoreProperties);
			body.setGrsqdbodyid(SheetHeadId);
			body.setSl(sl+ 0.0);
			this.saveBody(body);
			finalBodyList.add(body);
			sl = 0;
		}
		return finalBodyList;
	}
	
	/**
	 * 到zy_shead表中查询所有未办结、且sheettype为purchase的shead_id
	 * @return
	 */
	public String [] obtainPurchaseSheetIds(){
		String headIdArr[] = null;
		StringBuffer sb = new StringBuffer();
		String hql ="from ZyShead where sheetType = 'purchase' and bdzt = '进行中'";
		List<ZyShead> headList = (List<ZyShead>)publicDao.find(hql);
		for(int i = 0; i < headList.size(); i++){
			sb.append(headList.get(i).getSheadId()+";");
		}
		headIdArr = sb.toString().split(";");
		return headIdArr;
	} 
	
	public String obtainFlMCById(String existBodyIdStr){
		StringBuffer sb = new StringBuffer();
		String [] existBodyIdArr = existBodyIdStr.split(",");
		for(String bodyId : existBodyIdArr){
			if(StringUtils.isNotEmpty(bodyId)){
				ZySbody body = (ZySbody)this.findBody(bodyId);
				sb.append(body.getYjflmc()+",");
				sb.append(body.getEjflmc()+",");
				sb.append(body.getSjflmc()+";");
			}
		}
		return sb.toString();
	}
	
	/**
	 * 生成卡片编号
	 * @param yjflbm
	 * @param ejflbm
	 * @return
	 * @throws Exception
	 */
	public String generalKpbh(String yjflbm,String ejflbm){
		StringBuffer sb = new StringBuffer();
		if(yjflbm.length() == 1){
			sb.append("0");
			sb.append(yjflbm);
			sb.append("_");
		}else if(yjflbm.length() == 2){
			sb.append(yjflbm);
			sb.append("_");
		}
		
		if(ejflbm.length() == 1){
			sb.append("000");
			sb.append(ejflbm);
			sb.append("_");
		}else if(ejflbm.length() == 2){
			sb.append("00");
			sb.append(ejflbm);
			sb.append("_");
		}else if(ejflbm.length() == 3){
			sb.append("0");
			sb.append(ejflbm);
			sb.append("_");
		}else if(ejflbm.length() == 4){
			sb.append(ejflbm);
			sb.append("_");
		}
		
		String preparSQL = "select seq_asset_code.nextval seq from dual";
		List<Map<String,Object>> seqMapList = publicDao.queryForList(preparSQL, new ArrayList());
		Map<String,Object> seqMap = seqMapList.get(0);
		int zcbhSuffix = ((BigDecimal)seqMap.get("SEQ")).intValue();
		if(zcbhSuffix < 10){
			sb.append("0000");
			sb.append(zcbhSuffix);
		}else if(zcbhSuffix < 100){
			sb.append("000");
			sb.append(zcbhSuffix);
		}else if(zcbhSuffix < 1000){
			sb.append("00");
			sb.append(zcbhSuffix);
		}else if(zcbhSuffix < 10000){
			sb.append("0");
			sb.append(zcbhSuffix);
		}else if(zcbhSuffix < 100000){
			sb.append(zcbhSuffix);
		}else if(zcbhSuffix >= 100000){
			sb.append(zcbhSuffix%10000);
		}
		return sb.toString();
	}
	
	public String getBodyIdAndSL(ZySbody body) {
			String returnStr = "";
			StringBuffer stringbuffer = new StringBuffer();
			stringbuffer.append(" and yjflbm = '"+ body.getYjflbm() +"'");
			stringbuffer.append(" and ejflbm = '"+ body.getEjflbm() +"'");
			stringbuffer.append(" and sjflbm = '"+ body.getSjflbm() +"'");
			stringbuffer.append(" and (zczt = '在库' or zczt = '01' or zczt = '1')");
			String where = stringbuffer.toString();
			String preparSQL = "Select Yjflbm,Ejflbm,Sjflbm,Yjflmc,Ejflmc,Sjflmc,nvl(Sum(Sl),0) sl From Zy_Zc"+ 
					  " Where 1 = 1"+ where +
					  " Group By Yjflbm, Ejflbm, Sjflbm, Yjflmc, Ejflmc, Sjflmc"+ 
					  " order by yjflbm asc";
			List<Map<String,Object>> mapList = publicDao.queryForList(preparSQL, new ArrayList());
			Map<String,Object> map = null;
			if(mapList.size() > 0){
				map = mapList.get(0);
				returnStr = body.getSbodyId()+">##<"+((BigDecimal)map.get("SL")).intValue()+">#[]#<";
			}else{
				returnStr = body.getSbodyId()+">##<"+0+">#[]#<";
			}
			return returnStr;
		}
	
	/**
	 * 借用领用开启采购,不再使用，这个方法导致数据带到采购单信息不全，采用本方法下面的方法newPurchaseBodyGetMoreInfo
	 * @param headId
	 * @deprecated
	 */
	public void newPurchaseBody(String headId,String str){
		String []str1 = str.split("=");
		for(int i=0;i<str1.length;i++){
			ZyZc zc = new ZyZc();
			String str2 = str1[i];
			String []str3 = str2.split(",");
			String yjflmc = str3[0];
			String ejflmc = str3[1];
			String sjflmc = str3[2];
			String sl = str3[3];
			String hql = "from ZyZc z where z.yjflmc='"+yjflmc+"' and z.ejflmc='"+ejflmc+"' and z.sjflmc='"+sjflmc+"'";
			List list = publicDao.find(hql);
			ZySbody body = new ZySbody();
			if(list.size()>0){
				zc = (ZyZc) list.get(0);
				body.setSheadId(headId);
				body.setYjflmc(yjflmc);
				body.setYjflbm(zc.getYjflbm());
				body.setEjflmc(ejflmc);
				body.setEjflbm(zc.getEjflbm());
				body.setSjflmc(sjflmc);
				body.setSjflbm(zc.getSjflbm());
				body.setZcmc(zc.getZcmc());
				body.setSl(Double.valueOf(sl));
				body.setGg(zc.getGg());
				body.setJldw(zc.getJldw());
				body.setDj(zc.getDzyhdj());
				if(zc.getDzyhdj()!=null){
					body.setJe(zc.getDzyhdj()*Double.valueOf(sl));
				}
			}else if(list.size() == 0){
				String hql4Body = "from ZySbody z where z.yjflmc='"+yjflmc+"' and z.ejflmc='"+ejflmc+"' and z.sjflmc='"+sjflmc+"'";
				List<ZySbody> bodyList = (List<ZySbody>)publicDao.find(hql4Body);
				ZySbody bodyFromZySbody = null;
				if(bodyList.size() > 0){
					for(ZySbody body1 : bodyList){
						if(StringUtils.isNotEmpty(body1.getYjflbm())){
							bodyFromZySbody = body1;
							break;
						}
					}
					body.setSheadId(headId);
					body.setYjflmc(yjflmc);
					body.setYjflbm(bodyFromZySbody.getYjflbm());
					body.setEjflmc(ejflmc);
					body.setEjflbm(bodyFromZySbody.getEjflbm());
					body.setSjflmc(sjflmc);
					body.setSjflbm(bodyFromZySbody.getSjflbm());
					body.setZcmc(bodyFromZySbody.getZcmc());
					body.setSl(Double.valueOf(sl));
					body.setGg(bodyFromZySbody.getGg());
					body.setJldw(bodyFromZySbody.getJldw());
					body.setDj(bodyFromZySbody.getDj());
					if(zc.getDzyhdj()!=null){
						body.setJe(bodyFromZySbody.getDj()*Double.valueOf(sl));
					}
				}
			}
			publicDao.save(body);
		}
	}
	
	/**
	 * 借用领用开启采购,到body表中查询数据，在开启的采购单中得到的数据跟领用借用单是一样的
	 * @param headId
	 * @param bodyId 领用借用单在body表中的headId
	 */
	public void newPurchaseBodyGetMoreInfo(String headId,String borOrConHeadId,String str){
		//--------------------star-------------------------------------------------//
//		String []str1 = str.split("=");
//		for(int i=0;i<str1.length;i++){
//			ZyZc zc = new ZyZc();
//			String str2 = str1[i];
//			String []str3 = str2.split(",");
//			String yjflmc = str3[0];
//			String ejflmc = str3[1];
//			String sjflmc = str3[2];
//			String sl = str3[3];
//			String hql = "from ZySbody b where b.sheadId = '"+ borOrConHeadId +"' and b.yjflmc='"+yjflmc+"' and b.ejflmc='"+ejflmc+"' and b.sjflmc='"+sjflmc+"'";
//			List<ZySbody> list = (List<ZySbody>)publicDao.find(hql);
//			ZySbody body = new ZySbody();
//			BeanUtils.copyProperties(list.get(0), body);
//			body.setSheadId(headId);
//			publicDao.save(body);
//		}
		//--------------------end-------------------------------------------//
		String hql = "from ZySbody b where b.sheadId = '"+ borOrConHeadId +"'";
		List<ZySbody> list = (List<ZySbody>)publicDao.find(hql);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				ZySbody body = new ZySbody();
				BeanUtils.copyProperties(list.get(i), body);
				body.setSheadId(headId);
				publicDao.save(body);
			}
		}
	}
	
	/**
	 * 物品变更开启采购
	 * @param headId
	 * @param bodyIds
	 */
	public void newPurchaseBody4exchange(String headId,String bodyIds){
		String ids[] = bodyIds.split(",");
		for(int i=0;i<ids.length;i++){
			ZySbody body = this.findBody(ids[i]);
			ZySbody bodynew = new ZySbody();
			bodynew.setSheadId(headId);
			bodynew.setYjflmc(body.getYjflmc());
			bodynew.setYjflbm(body.getYjflbm());
			bodynew.setEjflmc(body.getEjflmc());
			bodynew.setEjflbm(body.getEjflbm());
			bodynew.setSjflmc(body.getSjflmc());
			bodynew.setSjflbm(body.getSjflbm());
			bodynew.setZcmc(body.getZcmc());
			bodynew.setSl(body.getSl());
			bodynew.setGg(body.getGg());
			bodynew.setJldw(body.getJldw());
			bodynew.setDj(body.getDj());
			publicDao.save(bodynew);
		}
	}

	public List<ZcPgXx> getPgxxByZcId(String zyzcId) {
		String hql = "from ZcPgXx c where c.zyzcid = '" + zyzcId + "'";
		List<ZcPgXx> list = (List<ZcPgXx>)publicDao.find(hql);
		return list;
	}

	public void updatBZ3(String sbodyId) {
		List<String> param = new ArrayList<String>();
		param.add(sbodyId);
		ZySbody zysbody = (ZySbody) publicDao.findSingleResult("from ZySbody where sbodyId =? ", param);
			double sl = zysbody.getSl();
			String bz3 = zysbody.getBz3();
			int sl2 = (int)sl;
			String sl1 = String.valueOf(sl2);
			bz3 = sl1;
			zysbody.setBz3(bz3);
			publicDao.save(zysbody);
	}
	//部门领用 库管处理环节 打印单据 
	public List<ZySbody> print(String sheadID) {
		if (sheadID == null || sheadID.length() <= 1) {
			return null;
		} else {
			List<String> params = new ArrayList<String>();
			params.add(sheadID);
			List<ZySbody> resulList = (List<ZySbody>) publicDao.find(
					"from ZySbody where sheadId = ? order by yjflmc,ejflmc,sjflmc ", params);
			if(resulList != null && resulList.size() > 0){
				List<ZySbody> tempList = new ArrayList<ZySbody>();
				for(ZySbody body : resulList){
					tempList.add(body);
				}
				
				return tempList;
			}else {
				return null;
			}
		}
	}
}
