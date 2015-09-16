package com.tansun.eam2.zyzc.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zyzc.service.ToCheckBS;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class ToCheckBSimpl implements ToCheckBS {
	@Autowired
	PublicDao publicDao;
	
	
	/**
	 * 得到zy_pdxx表中盘点信息表中的最大盘点批次号
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getMaxPdpc(String pclx){
		String preparSQL = "";
		List<ZyPdxx> pdxx = (List<ZyPdxx>)publicDao.find("from ZyPdxx");
		if(pdxx.size() == 0){
			return pclx +"-"+ 1;
		}else{
			if("盘库".equals(pclx)){
				preparSQL = "select max(cast(substr(pdpc,4) as int)) maxPkpc from zy_pdxx where pdpc like '%盘库%'";
				List<Map<String,Object>> maxPdpcMapList = publicDao.queryForList(preparSQL, new ArrayList());
				Map<String,Object> maxPdpcMap = maxPdpcMapList.get(0);
				if(maxPdpcMap.get("MAXPKPC") != null){
					return pclx +"-"+ (((BigDecimal)maxPdpcMap.get("MAXPKPC")).intValue() + 1);
				}else{
					return pclx +"-"+ 1;
				}
			}else if("盘点".equals(pclx)){
				preparSQL = "select max(cast(substr(pdpc,4) as int)) maxPdpc from zy_pdxx where pdpc like '%盘点%'";
				List<Map<String,Object>> maxPdpcMapList = publicDao.queryForList(preparSQL, new ArrayList());
				Map<String,Object> maxPdpcMap = maxPdpcMapList.get(0);
				if(maxPdpcMap.get("MAXPDPC") != null){
					return pclx +"-"+ (((BigDecimal)maxPdpcMap.get("MAXPDPC")).intValue() + 1);
				}else{
					return pclx +"-"+ 1;
				}
			}else{
				return "";
			}
		} 
	}
	
	/**
	 * 根据Pdxx中的查询条件(盘点批次，盘点日期)到台账表中查询数据，供批次查询使用
	 */
	@SuppressWarnings("unchecked")
	public String queryWithCondition(PdxxVO pdxxVo) {
		List params = new ArrayList();
		List list = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String strHQL = "from ZyPdxx o where 1=1 ";
		if (pdxxVo.getPdpc() != null && pdxxVo.getPdpc().trim().length() > 0) {
			strWhere.append(" and o.pdpc = ? ");
			params.add(pdxxVo.getPdpc());
		}
		if (pdxxVo.getZzpdrq() != null) {
			strWhere.append(" and o.pdrq >= ? ");
			params.add(pdxxVo.getZzpdrq());
		}
		if (pdxxVo.getZwpdrq() != null) {
			strWhere.append(" and o.pdrq < ? ");
			params.add(pdxxVo.getZwpdrq());
		}
		strWhere.append(" order by o.id asc ");
		strHQL = strHQL + strWhere.toString();
		
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find(strHQL, params);
		String json = BodyListToJSON.getJSON(pdxxList, 1, 1, 100000);
		return json;
	}
	
	/**
	 * 根据Pdxx中的查询条件(盘点批次，盘点日期)到台账表中查询数据，供批次查询使用
	 */
	@SuppressWarnings("unchecked")
	public String query4PanYingPanKui(PdxxVO pdxxVo,Paginator paginator) {
		List params = new ArrayList();
		List list = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String strHQL = "from ZyPdxx o where 1=1 ";
		if (pdxxVo.getPdpc() != null && pdxxVo.getPdpc().trim().length() > 0) {
			strWhere.append(" and o.pdpc = ? ");
			params.add(pdxxVo.getPdpc());
		}
		if (pdxxVo.getZzpdrq() != null) {
			strWhere.append(" and o.pdrq >= ? ");
			params.add(pdxxVo.getZzpdrq());
		}
		if (pdxxVo.getZwpdrq() != null) {
			strWhere.append(" and o.pdrq < ? ");
			params.add(pdxxVo.getZwpdrq());
		}
		if("panYingPanKui".equals(pdxxVo.getType())){
			strWhere.append(" and o.sheadId = '"+ getBJSheetIDStr(pdxxVo.getPdpc()) +"'");
		}else if("batchQuery".equals(pdxxVo.getType())){
			strWhere.append(" and o.sheadId is null");
		}
		strWhere.append(" order by o.id asc ");
		strHQL = strHQL + strWhere.toString();
		
		PageableList PageableList = publicDao.queryByHQLWithPaginator(strHQL, params, paginator);
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)PageableList.getResults();
		String json = BodyListToJSON.getJSON(pdxxList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		return json;
	}
	
	public String getBJSheetIDStr(String pdpc){
		String bJSheetIDStr = "";
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find("from ZyPdxx where pdpc = '"+ pdpc +"' and sheadId is not null");
		for(ZyPdxx pdxx : pdxxList){
			List<ZyShead> headList = (List<ZyShead>)publicDao.find("from ZyShead where sheadId = '"+ pdxx.getSheadId() +"' and bdzt = '数据已办结'" );
			if(headList.size() > 0){
				return pdxx.getSheadId();
			}
		}
		return null;
	}
	
	/**
	 * 弹出页面中根据传过来的ZyPdxx(bo)中存储的查询条件查询出资产表和台账表中的数据
	 * 存到List<ZyPdxx>并返回
	 * 盘点调用本方法
	 */
	@SuppressWarnings("unchecked")
	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,Paginator paginator) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyPdxx> resultList=new ArrayList();

		String preparSQL = "select b.lyrmc,b.lybmmc,b.jybmmc,b.kcsl,a.* from zy_zc a, zy_kctz b  where a.zc_id = b.zc_id and b.sfzxjl = '1'";
		
		strWhere.append(" and a.yjflbm in ('1','5')");
		
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and a.ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());

		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and a.sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());

		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (b.lybmmc like ? or b.jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");

		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and a.bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		
		strWhere.append(" order by a.zc_id");
		preparSQL = preparSQL + strWhere.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params ,paginator);
		tempList = pageableList.getResults();
		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyPdxx pdxx = new ZyPdxx();
			pdxx.setZcId(StringUtils.isNotEmpty((String)map.get("ZC_ID"))==true?(String)map.get("ZC_ID"):null);
			pdxx.setYjflmc(StringUtils.isNotEmpty((String)map.get("YJFLMC"))==true?(String)map.get("YJFLMC"):null);
			pdxx.setEjflmc(StringUtils.isNotEmpty((String)map.get("EJFLMC"))==true?(String)map.get("EJFLMC"):null);
			pdxx.setSjflmc(StringUtils.isNotEmpty((String)map.get("SJFLMC"))==true?(String)map.get("SJFLMC"):null);
			pdxx.setZcmc(StringUtils.isNotEmpty((String)map.get("ZCMC"))==true?(String)map.get("ZCMC"):null);
			pdxx.setZcbh(StringUtils.isNotEmpty((String)map.get("ZCBH"))==true?(String)map.get("ZCBH"):null);
			pdxx.setGg(StringUtils.isNotEmpty((String)map.get("GG"))==true?(String)map.get("GG"):null);
			pdxx.setJldw(StringUtils.isNotEmpty((String)map.get("JLDW"))==true?(String)map.get("JLDW"):null);
			pdxx.setSyrmc(StringUtils.isNotEmpty((String)map.get("LYRMC"))==true?(String)map.get("LYRMC"):null);
			pdxx.setSybmbmc(StringUtils.isNotEmpty((String)map.get("LYBMMC"))==true?(String)map.get("LYBMMC"):null);
			pdxx.setSybmbmc(StringUtils.isNotEmpty((String)map.get("JYBMMC"))==true?(String)map.get("JYBMMC"):null);
			pdxx.setCfdd(StringUtils.isNotEmpty((String)map.get("BGDD"))==true?(String)map.get("BGDD"):null);
			pdxx.setSl(map.get("SL") != null?new Double(map.get("SL").toString()):null);
			resultList.add(pdxx);
		}
		return resultList;
	}
	
	/**
	 *盘库易耗品调用本方法
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,Paginator paginator) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyZc> resultList = new ArrayList();
		
		String preparSQL = "select Yjflbm,Yjflmc,Ejflbm,Ejflmc,Sjflbm,Sjflmc,gg,jldw,bgdd,DZYHDJ, Nvl(Sum(Sl),0) sl from zy_zc where 1=1 ";
		
		strWhere.append(" and zczt in ('在库','01','1')");
		strWhere.append(" and yjflbm in ('3','7')");
		
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());
			
		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());
			
		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (lybmmc like ? or jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			
		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		strWhere.append(" GROUP BY Yjflbm, Yjflmc, Ejflbm, Ejflmc, Sjflbm, Sjflmc, gg, jldw, bgdd, DZYHDJ");
		strWhere.append(" order by Yjflbm");
		preparSQL = preparSQL + strWhere.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params ,paginator);
		tempList = pageableList.getResults();
		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyZc zc = new ZyZc();
			zc.setZcId((String)map.get("SJFLBM")+"babauuuuu");
			zc.setYjflmc(StringUtils.isNotEmpty((String)map.get("YJFLMC"))==true?(String)map.get("YJFLMC"):null);
			zc.setEjflmc(StringUtils.isNotEmpty((String)map.get("EJFLMC"))==true?(String)map.get("EJFLMC"):null);
			zc.setSjflmc(StringUtils.isNotEmpty((String)map.get("SJFLMC"))==true?(String)map.get("SJFLMC"):null);
			zc.setGg(StringUtils.isNotEmpty((String)map.get("GG"))==true?(String)map.get("GG"):null);
			zc.setJldw(StringUtils.isNotEmpty((String)map.get("JLDW"))==true?(String)map.get("JLDW"):null);
			zc.setBgdd(StringUtils.isNotEmpty((String)map.get("BGDD"))==true?(String)map.get("BGDD"):null);
			zc.setDzyhdj(map.get("DZYHDJ") != null?((BigDecimal)map.get("DZYHDJ")).doubleValue():null);
			zc.setSl(map.get("SL") != null?((BigDecimal)map.get("SL")).doubleValue():null);
			resultList.add(zc);
		}
		return resultList;
	}
	
	/**
	 * 盘库非易耗品调用本方法
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> subPageQueryWithCondition(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator) {
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyZc> resultList=new ArrayList();
		
		String preparSQL = "Select zc_id,Yjflbm,Yjflmc,Ejflbm,Ejflmc,Sjflbm,gg,jldw,Sjflmc,bgdd,DZYHDJ,sl from zy_zc a where 1=1 ";
		
		strWhere.append(" and a.zczt in ('在库','01','1')");
		strWhere.append(" and a.yjflbm in ('1','5','2','9')");
		
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and a.ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());
			
		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and a.sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());
			
		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (b.lybmmc like ? or b.jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			
		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and a.bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		
		strWhere.append(" order by a.zc_id");
		preparSQL = preparSQL + strWhere.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params ,paginator);
		tempList = pageableList.getResults();
		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyZc zc = new ZyZc();
			zc.setZcId(StringUtils.isNotEmpty((String)map.get("ZC_ID"))==true?(String)map.get("ZC_ID"):null);
			zc.setYjflmc(StringUtils.isNotEmpty((String)map.get("YJFLMC"))==true?(String)map.get("YJFLMC"):null);
			zc.setEjflmc(StringUtils.isNotEmpty((String)map.get("EJFLMC"))==true?(String)map.get("EJFLMC"):null);
			zc.setSjflmc(StringUtils.isNotEmpty((String)map.get("SJFLMC"))==true?(String)map.get("SJFLMC"):null);
			zc.setGg(StringUtils.isNotEmpty((String)map.get("GG"))==true?(String)map.get("GG"):null);
			zc.setJldw(StringUtils.isNotEmpty((String)map.get("JLDW"))==true?(String)map.get("JLDW"):null);
			zc.setBgdd(StringUtils.isNotEmpty((String)map.get("BGDD"))==true?(String)map.get("BGDD"):null);
			zc.setDzyhdj(map.get("DZYHDJ") != null?((BigDecimal)map.get("DZYHDJ")).doubleValue():null);
			zc.setSl(map.get("SL") != null?((BigDecimal)map.get("SL")).doubleValue():null);
			resultList.add(zc);
		}
		return resultList;
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,Paginator paginator){
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyZc> resultList = new ArrayList();
		String preparSQL = "select SJFLBM from zy_zc where 1=1 ";
		strWhere.append(" and zczt in ('在库','01','1')");
		strWhere.append(" and yjflbm in ('3','7')");
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());
			
		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());
			
		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (lybmmc like ? or jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			
		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		strWhere.append(" GROUP BY Yjflbm, Yjflmc, Ejflbm, Ejflmc, Sjflbm, Sjflmc, gg, jldw, bgdd, DZYHDJ");
		strWhere.append(" order by Yjflbm");
		preparSQL = preparSQL + strWhere.toString();
		tempList = publicDao.queryForList(preparSQL, params);
		String zcIds = "";
		for (int i = 0; i < tempList.size(); i++) {
			Map map = (Map) tempList.get(i);
			String id = (String)map.get("SJFLBM")+"babauuuuu";
			zcIds = zcIds + id + ",";
		}
		return zcIds;
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,Paginator paginator){
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyPdxx> resultList=new ArrayList();
		String preparSQL = "select a.zc_id from zy_zc a, zy_kctz b  where a.zc_id = b.zc_id and b.sfzxjl = '1'";
		strWhere.append(" and a.yjflbm in ('1','5')");
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and a.ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());

		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and a.sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());

		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (b.lybmmc like ? or b.jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");

		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and a.bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		strWhere.append(" order by a.zc_id");
		preparSQL = preparSQL + strWhere.toString();
		tempList = publicDao.queryForList(preparSQL, params);
		String zcIds = "";
		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyPdxx pdxx = new ZyPdxx();
			String id = StringUtils.isNotEmpty((String)map.get("ZC_ID"))==true?(String)map.get("ZC_ID"):null;
			zcIds = zcIds + id + ",";
		}
		return zcIds;
	}
	
	public String subPageQueryWithConditionId(ZyPdxx zyPdxx,String pclx,String isConsuming,Paginator paginator){
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		List tempList = new ArrayList();
		List<ZyZc> resultList=new ArrayList();
		String preparSQL = "Select zc_id from zy_zc a where 1=1 ";
		strWhere.append(" and a.zczt in ('在库','01','1')");
		strWhere.append(" and a.yjflbm in ('1','5','2','9')");
		if (zyPdxx.getYjflbm() != null
				&& !"0".equals(zyPdxx.getYjflbm())
				&& zyPdxx.getYjflbm().trim().length() > 0) {
			strWhere.append(" and a.yjflbm = ?   ");
			params.add(zyPdxx.getYjflbm());
		}
		if (zyPdxx.getEjflbm() != null
				&& !"0".equals(zyPdxx.getEjflbm())
				&& zyPdxx.getEjflbm().trim().length() > 0) {
			strWhere.append(" and a.ejflbm = ?  ");
			params.add(zyPdxx.getEjflbm());
			
		}
		if (zyPdxx.getSjflbm() != null
				&& !"0".equals(zyPdxx.getSjflbm())
				&& zyPdxx.getSjflbm().trim().length() > 0) {
			strWhere.append(" and a.sjflbm = ?  ");
			params.add(zyPdxx.getSjflbm());
			
		}
		if (zyPdxx.getSybmbmc() != null
				&& zyPdxx.getSybmbmc().trim().length() > 0) {
			strWhere.append(" and (b.lybmmc like ? or b.jybmmc like ?) ");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			params.add("%"+zyPdxx.getSybmbmc()+"%");
			
		}
		if (zyPdxx.getCfdd() != null && zyPdxx.getCfdd().trim().length() > 0) {
			strWhere.append(" and a.bgdd like ? ");
			params.add("%"+zyPdxx.getCfdd()+"%");
		}
		
		strWhere.append(" order by a.zc_id");
		preparSQL = preparSQL + strWhere.toString();
		tempList = publicDao.queryForList(preparSQL, params);
		String zcIds = "";
		for (int i = 0; i < tempList.size(); i++) {
			Map map = new HashMap();
			map = (Map) tempList.get(i);
			ZyZc zc = new ZyZc();
			String id = StringUtils.isNotEmpty((String)map.get("ZC_ID"))==true?(String)map.get("ZC_ID"):null;
			zcIds = zcIds + id + ",";
		}
		return zcIds;
	}
	
	/**
	 * 在资产表和台账表中根据资产ID查询出数据然后存到ZyPdxx对象中，为保存到盘点信息表做对象准备
	 * 真正要保存到盘点信息表中的pdxx对象
	 */
	@SuppressWarnings("unchecked")
	public ZyPdxx createZyPdxxByZcId(String zcId) {
		List<ZyZc> zyzcList = null;
		ZyPdxx zyPdxxBO = null;
		if(zcId.contains("babauuuuu")){
			zyPdxxBO = new ZyPdxx();
			double sl = 0;
			ZyZc displayZyzc = new ZyZc();
			String zcInfoStr = ""; 
			String sjflbm = zcId.replace("babauuuuu", "");
			zyzcList = (List<ZyZc>)publicDao.find("from ZyZc where sjflbm = '"+ sjflbm+ "'");
			for(ZyZc zyzc : zyzcList){
				String tempZcInfoStr = zyzc.getZcmc()+zyzc.getZcbh()+zyzc.getGg()+zyzc.getJldw()+zyzc.getBgdd();
				if(tempZcInfoStr.length() > zcInfoStr.length()){
					displayZyzc = zyzc;
				}
				sl = sl + zyzc.getSl();
			}
			zyPdxxBO.setYjflbm(displayZyzc.getYjflbm());
			zyPdxxBO.setEjflbm(displayZyzc.getEjflbm());
			zyPdxxBO.setSjflbm(displayZyzc.getSjflbm());
			zyPdxxBO.setYjflmc(displayZyzc.getYjflmc());
			zyPdxxBO.setEjflmc(displayZyzc.getEjflmc());
			zyPdxxBO.setSjflmc(displayZyzc.getSjflmc());
			zyPdxxBO.setZcmc(displayZyzc.getZcmc());
//			zyPdxxBO.setZcbh(displayZyzc.getZcbh());
			zyPdxxBO.setGg(displayZyzc.getGg());
			zyPdxxBO.setJldw(displayZyzc.getJldw());
			zyPdxxBO.setCfdd(displayZyzc.getBgdd());
			zyPdxxBO.setSl(sl);
		}else{
			StringBuffer strWhere = new StringBuffer();
			List params = new ArrayList();
			List<ZyPdxx> resultList = new ArrayList();
			params.add(zcId);
			String preparSQL = "select * from zy_zc a, zy_kctz b  where a.zc_id = b.zc_id  and  a.zc_id =? ";
			Map map = new HashMap();
			preparSQL = preparSQL + strWhere.toString();
			map = publicDao.queryForList(preparSQL, params).get(0);
			zyPdxxBO = new ZyPdxx();
			zyPdxxBO.setZcId(StringUtils.isNotEmpty((String)map.get("ZC_ID"))==true?(String)map.get("ZC_ID"):null);
			zyPdxxBO.setYjflbm(StringUtils.isNotEmpty((String)map.get("YJFLBM"))==true?(String)map.get("YJFLBM"):null);
			zyPdxxBO.setEjflbm(StringUtils.isNotEmpty((String)map.get("EJFLBM"))==true?(String)map.get("EJFLBM"):null);
			zyPdxxBO.setSjflbm(StringUtils.isNotEmpty((String)map.get("SJFLBM"))==true?(String)map.get("SJFLBM"):null);
			zyPdxxBO.setYjflmc(StringUtils.isNotEmpty((String)map.get("YJFLMC"))==true?(String)map.get("YJFLMC"):null);
			zyPdxxBO.setEjflmc(StringUtils.isNotEmpty((String)map.get("EJFLMC"))==true?(String)map.get("EJFLMC"):null);
			zyPdxxBO.setSjflmc(StringUtils.isNotEmpty((String)map.get("SJFLMC"))==true?(String)map.get("SJFLMC"):null);
			zyPdxxBO.setZcmc(StringUtils.isNotEmpty((String)map.get("ZCMC"))==true?(String)map.get("ZCMC"):null);
			zyPdxxBO.setZcbh(StringUtils.isNotEmpty((String)map.get("ZCBH"))==true?(String)map.get("ZCBH"):null);
			zyPdxxBO.setGg(StringUtils.isNotEmpty((String)map.get("GG"))==true?(String)map.get("GG"):null);
			zyPdxxBO.setJldw(StringUtils.isNotEmpty((String)map.get("JLDW"))==true?(String)map.get("JLDW"):null);
			zyPdxxBO.setSyrmc(StringUtils.isNotEmpty((String)map.get("LYRMC"))==true?(String)map.get("LYRMC"):null);
			zyPdxxBO.setSyrbh(StringUtils.isNotEmpty((String)map.get("LYRBH"))==true?(String)map.get("LYRBH"):null);
			zyPdxxBO.setSybmbmc(StringUtils.isNotEmpty((String)map.get("JYBMMC"))==true?(String)map.get("JYBMMC"):null);
			zyPdxxBO.setSybmbmc(StringUtils.isNotEmpty((String)map.get("LYBMMC"))==true?(String)map.get("LYBMMC"):null);
			zyPdxxBO.setSybmbh(StringUtils.isNotEmpty((String)map.get("LYBMBM"))==true?(String)map.get("LYBMBM"):null);
			zyPdxxBO.setSybmbh(StringUtils.isNotEmpty((String)map.get("JYBMBM"))==true?(String)map.get("JYBMBM"):null);
			zyPdxxBO.setCfdd(StringUtils.isNotEmpty((String)map.get("BGDD"))==true?(String)map.get("BGDD"):null);
			zyPdxxBO.setSl(map.get("SL") != null?new Double(map.get("SL").toString()):null);
			resultList.add(zyPdxxBO);
		}
		return zyPdxxBO;
	}
	
	/**
	 * 根据ZcId到资产表中查询所有盘点批次为空的记录列表，这些列表是本次批次新增添加到盘点信息表中的信息
	 */
	@SuppressWarnings("unchecked")
	public List findZyPdxxWithzcIdAndNullPdpc(String zcId) {
		//提供一个更好的方法，最后点击增加后再把这些记录保存进去
		List params = new ArrayList();
		List tempList = new ArrayList();
		params.add(zcId);
		String preparSQL = "select * from zy_pdxx z where z.pdpc is null and z.zc_id = ?";
		tempList = publicDao.queryForList(preparSQL, params);
		return tempList;
	}
	
	/**
	 * 根据资产ID在pdxx表中查询List<ZyPdxx>
	 */
//	public List<ZyPdxx> findZyPdxxWithzcIdAndNullPdpc(ZyPdxx pdxx) {
//		String preparedHQL = "select pdpc from zy_pdxx z where z.zc_id = " + pdxx.getZcId() + " and z.pdpc is null";
//		List list = publicDao.queryForList(preparSQL, params).find(preparedHQL);
//		Map map = new HashMap();
//		map = list.get(0);
//		if(list != null){
//			return (List<ZyPdxx>)publicDao.find(preparedHQL);
//		}else{
//			return null;
//		}
//	}
	
	/**
	 * 根据盘点批次在pdxx表中查询ZyPdxx记录，供盘点和盘库使用
	 */
	public List<ZyPdxx> findZyPdxxWithPdpc(String pdpc) {
		String preparedHQL = "from ZyPdxx z where z.pdpc = '" + pdpc+"'";
		return (List<ZyPdxx>)publicDao.find(preparedHQL);
	}
	
	public List<ZyPdxx> findZyPdxxWithPdpcAndPager(String pdpc,Paginator paginator) {
		String preparHQL = "from ZyPdxx z where z.pdpc = '" + pdpc+"' or z.pdpc is null order by id";
		PageableList pageableList = publicDao.queryByHQLWithPaginator(preparHQL, new ArrayList(), paginator);
		return (List<ZyPdxx>)pageableList.getResults();
	}
	/**
	 * 根据表UUID在pdxx表中查询单条ZyPdxx记录
	 */
	public ZyPdxx findZyPdxxWithID(String id) {
		List params = new ArrayList();
		params.add(id);
		String preparedHQL = "from ZyPdxx z where z.id = ?";
		return (ZyPdxx)publicDao.findSingleResult(preparedHQL, params);
	}
	
	/**
	 * 根据资产ID在pdxx表中查询单条ZyPdxx记录
	 */
//	public ZyPdxx findZyPdxxWithzcId(String zcId) {
//		List params = new ArrayList();
//		params.add(zcId);
//		String preparedHQL = "from ZyPdxx z where z.zcId = ?";
//		return (ZyPdxx)publicDao.findSingleResult(preparedHQL, params);
//	}
	
	/**
	 * 根据资产ID在pdxx表中查询List<ZyPdxx>
	 */
	public List<ZyPdxx> findZyPdxxListWithzcId(String zcId) {
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from ZyPdxx z where z.zcId = " + zcId;
		return (List<ZyPdxx>)publicDao.find(preparedHQL);
	}
	
	/**
	 * 查询出盘点信息表中所有的数据
	 */
	@SuppressWarnings("unchecked")
	public List<ZyPdxx> queryAllPdxx(){
		String str = "from ZyPdxx o";
		return (List<ZyPdxx>)publicDao.find(str);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZyPdxx> queryPdxxWithPclx(String pclx){
		List<ZyPdxx> list = (List<ZyPdxx>)publicDao.find("from ZyPdxx o where pdpc like '%"+ pclx +"%' and sheadId is not null");
		List<ZyPdxx> pdxxList = null;
		List<ZyPdxx> finalList = new ArrayList<ZyPdxx>();
		if(list.size() < 1){
			String str = "from ZyPdxx o where sheadId is null and pdpc like '%"+ pclx +"%'";
			pdxxList = (List<ZyPdxx>)publicDao.find(str);
			finalList.addAll(pdxxList);
		}else{
			StringBuffer sb = new StringBuffer(">##<");
			for(ZyPdxx pdxx : list){
				if(sb.indexOf(pdxx.getSheadId()) == -1){
					sb.append(pdxx.getSheadId()+",");
				}
			}
			String headIdStr = sb.substring(4);
			StringBuilder headIdSB = new StringBuilder();
			String [] headIdArr = headIdStr.split(",");
			for(String headId : headIdArr){
				ZyShead head = (ZyShead)publicDao.findSingleResult("from ZyShead where sheadId = '"+ headId +"'", new ArrayList());
				if(head.getBdzt() == null){
					headIdSB.append("'"+headId+"',");
				}else if(!"数据已办结".equals(head.getBdzt())){
					headIdSB.append("'"+headId+"',");
				}
			}
			String str = "from ZyPdxx o where sheadId is null and pdpc like '%"+ pclx +"%'";
			pdxxList = (List<ZyPdxx>)publicDao.find(str);
			finalList.addAll(pdxxList);
			String [] notComplateHeadId = headIdSB.toString().split(",");
			for(String headId : notComplateHeadId){
				if(StringUtils.isNotEmpty(headId)){
					String str1 = "from ZyPdxx o where sheadId = "+ headId;
					pdxxList = (List<ZyPdxx>)publicDao.find(str1);
				}
				finalList.addAll(pdxxList);
			}
		}
		return finalList;
	}
	
	/**
	 * 查询出已经办结了个盘点信息 
	 */
	public List<ZyPdxx> queryPdxxEnd(){
		String str = "select o from ZyPdxx o,ZyShead z where o.sheadId = z.sheadId and z.bdzt = '数据已办结'";
		return (List<ZyPdxx>)publicDao.find(str);
	}
	
	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc(Paginator paginator){
		String preparHQL = "from ZyPdxx where pdpc is null order by id";
		List params = new ArrayList();
		PageableList pageableList = null;
		try{
			pageableList = publicDao.queryByHQLWithPaginator(preparHQL, params, paginator);
		}catch(Exception e){
			e.printStackTrace();
		}
		return (List<ZyPdxx>)pageableList.getResults();
	}
	
	public List<ZyPdxx> queryAllPdxxWithoutPdpc(){
		String preparHQL = "from ZyPdxx where pdpc is null";
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find(preparHQL);
		return pdxxList;
	}
	
	/**
	 * 到盘点信息表中查询出所有盘点批次为空的记录（没有分页器）
	 * @return
	 */
	public List<ZyPdxx> queryPdxxWithoutPdpc(){
		String preparHQL = "from ZyPdxx where pdpc is null";
		return (List<ZyPdxx>)publicDao.find(preparHQL);
	}

	/**
	 * 保存ZyPdxx对象到盘点信息表中
	 */
	@SuppressWarnings("unchecked")
	public void saveZyPdxx(ZyPdxx zyPdxx){
		List list = findZyPdxxWithzcIdAndNullPdpc(zyPdxx.getZcId());
		if(list.size() == 0){
			publicDao.save(zyPdxx);
		}
	}
	
	/**
	 * 更新盘点信息表
	 */
	public void update(ZyPdxx zyPdxx) {
		publicDao.update(zyPdxx);
	}
	
	/**
	 * 根据表体Id到盘点信息表中删除相应的记录，批次新增、盘点、盘库
	 */
	public void deleteBody(String[] delIds) {
		for (int i = 0; i < delIds.length; i++){
			if(StringUtils.isNotEmpty(delIds[i])){
				List list = new ArrayList();
				list.add(delIds[i]);
				String hql = "from ZyPdxx o where o.id = ?";
				ZyPdxx pdxx = (ZyPdxx) publicDao.findSingleResult(hql, list);
				publicDao.delete(pdxx);
			}
		}
	}
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID){
		List param =new ArrayList();
		param.add(zyPdID);
		return (ZyPdxx)publicDao.findSingleResult("from ZyPdxx o where o.id=? ",param);
	}
	
	/**
	 * 根据headId到pdxx表中查找pdpc
	 * @param headId
	 * @return
	 */
	public String getPdpcWithHeadId(String headId){
		String hql = "from ZyPdxx zp where zp.sheadId = '"+ headId +"'";
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find(hql);
		if(pdxxList.size() > 0){
			return pdxxList.get(0).getPdpc();
		}else{
			return null;
		}
	}
	
	public void deleteRedundancyDataFromPdxx(String headId,String pc){
		List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find("from ZyPdxx where sheadId != '"+ headId +"' and pdpc = '"+ pc +"'");
		for(ZyPdxx pdxx : pdxxList){
			publicDao.delete(pdxx);
		}
	}
	
}
