package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.zyzc.service.ZCBookQueryService;
import com.tansun.eam2.zyzc.utils.CoverMapToQueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * @author 薛崇杰 2010-11-23 下午10:47:39
 */
@Service
public class ZCBookQueryServiceImpl implements ZCBookQueryService {

	@Autowired
	PublicDao publicDao;

	/**
	 * 通过在VO中提供的查询条件查询资产台账信息 时间格式：String-（MM/DD/YYYY）
	 * 具体参数：分类，物品名称，规格，采购日期（起始日期qsrq，截止日期jzrq），单价范围（最大值zdz，最小值zxz）
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<QueryBody4View> queryKCTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator) {
		if (queryPurchaseVo == null) {
			return null;
		}
		List<QueryBody4View> resultList = new ArrayList();
		List param = new ArrayList();
		StringBuffer hqlwhere = new StringBuffer();
		
		// 物品名称
		if (StringUtils.isNotEmpty(queryPurchaseVo.getZcmc())) {
			hqlwhere.append(" and  zc.zcmc like ? ");
			param.add("%" + queryPurchaseVo.getZcmc() + "%");
		}
		 // 一级分类编码
		
		 if (StringUtils.isNotEmpty(queryPurchaseVo.getYjflbm())
				 && !"0".equals(queryPurchaseVo.getYjflbm())) {
			 hqlwhere.append("and zc.yjflbm = ? ");
			 param.add(queryPurchaseVo.getYjflbm());
		 }
		
		 // 2级分类编码
		
		 if (StringUtils.isNotEmpty(queryPurchaseVo.getEjflbm())
				 && !"0".equals(queryPurchaseVo.getEjflbm())) {
			 hqlwhere.append("and zc.ejflbm = ? ");
			 param.add(queryPurchaseVo.getEjflbm());
		 }
		
		 // 3级分类编码
		
		 if (StringUtils.isNotEmpty(queryPurchaseVo.getSjflbm()) && 
				 !"0".equals(queryPurchaseVo.getSjflbm())) {
			 hqlwhere.append("and zc.sjflbm = ? ");
			 param.add(queryPurchaseVo.getSjflbm());
		 }

		// 规格
		if (StringUtils.isNotEmpty(queryPurchaseVo.getGg())) {
			hqlwhere.append("and  zc.gg like ? ");
			param.add("%" + queryPurchaseVo.getGg() + "%");
		}

		// 起始金额
		if (queryPurchaseVo.getZdjg() != null &&
				 !"0".equals(queryPurchaseVo.getZdjg())
				 && queryPurchaseVo.getZdjg() != 0) {
			hqlwhere.append("and  zc.dzyhjg > ? ");
			param.add(queryPurchaseVo.getZdjg());
		}

		// 截止金额
		if (queryPurchaseVo.getZgjg() != null &&
				 !"0".equals(queryPurchaseVo.getZgjg())
				 && queryPurchaseVo.getZdjg() != 0) {
			hqlwhere.append("and  zc.dzyhjg <= ? ");
			param.add(queryPurchaseVo.getZgjg());
		}

		String preparSQL = "select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.zcbh,zc.gg,zc.yjkcsl,zc.sl,zc.jldw, zc.dzyhdj,zc.dzyhjg" +
				" from Zy_Zc zc where (zc.zczt = '1' or zc.zczt = '01' or zc.zczt = '在库') " 
				+ hqlwhere.toString() + " order by zc.zc_Id asc ";
		PageableList pageableList = publicDao.queryForList(preparSQL, param, paginator);
		List tempList = pageableList.getResults();
		
		if(tempList.size()>0){
			for(int i = 0; i < tempList.size(); i++){
				Map map = (Map)tempList.get(i);
				resultList.add(CoverMapToQueryBody4View.obatainQueryBody4ViewFromMap(map));
			}
			return resultList;
		}else{
			return null;
		}
	}
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是固定资产
	 * @return
	 */
	public List<QueryBody4View> querySWTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator){
		//增加固定资产的领用人  Zy_kctz.lyrmc
		String preparSQL = "select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.zcbh,zc.gg,zc.czyz,zz.lyrmc" +
			" from Zy_zc zc  ,Zy_kctz zz where zc.zc_id=zz.zc_id ";
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		if(StringUtils.isNotEmpty(queryPurchaseVo.getYjflbm()) &&
				!"0".equals(queryPurchaseVo.getYjflbm())){
			strWhere.append("and zc.yjflbm = ? ");
			params.add(queryPurchaseVo.getYjflbm());
		}else{
			strWhere.append("and (zc.yjflbm = '1' or zc.yjflbm = '5') ");
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getEjflbm()) &&
				!"0".equals(queryPurchaseVo.getEjflbm())){
			strWhere.append("and zc.ejflbm = ? ");
			params.add(queryPurchaseVo.getEjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getSjflbm()) &&
				!"0".equals(queryPurchaseVo.getSjflbm())){
			strWhere.append("and zc.sjflbm = ? ");
			params.add(queryPurchaseVo.getSjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getZcmc())){
			strWhere.append("and zc.zcmc like ? ");
			params.add("%"+queryPurchaseVo.getZcmc()+"%");
		}
		if (StringUtils.isNotEmpty(queryPurchaseVo.getGg())) {
			strWhere.append("and  zc.gg like ? ");
			params.add("%" + queryPurchaseVo.getGg() + "%");
		}
		if(queryPurchaseVo.getZdjg() != null&&
				!"0".equals(queryPurchaseVo.getZdjg()) &&
				queryPurchaseVo.getZdjg() != 0){
			strWhere.append("and zc.czyz > ? ");
			params.add(queryPurchaseVo.getZdjg());
		}
		if(queryPurchaseVo.getZgjg() != null &&
				!"0".equals(queryPurchaseVo.getZgjg()) &&
				queryPurchaseVo.getZgjg() != 0){
			strWhere.append("and zc.czyz <= ? ");
			params.add(queryPurchaseVo.getZgjg());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getSfsckp())){
			strWhere.append("and zc.sfsckp = ? ");
			params.add(queryPurchaseVo.getSfsckp());
		}
		strWhere.append("order by zc.zc_id asc");
		try{
			preparSQL = preparSQL + strWhere.toString();
			PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
			List tempList = pageableList.getResults();
			List<QueryBody4View> resultList = new ArrayList<QueryBody4View>();
			if(tempList.size() > 0){
				for(int i = 0; i < tempList.size(); i++){
					Map map = (Map)tempList.get(i);
					resultList.add(CoverMapToQueryBody4View.obatainQueryBody4ViewFromMap(map));
				}
				return resultList;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是低值品
	 * @return
	 */
	public List<QueryBody4View> queryDZPTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator){
		String preparSQL = "select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.zcbh,zc.gg,zc.czyz, " +
		"tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq "+
		"from Zy_zc zc,zy_kctz tz where zc.zc_id = tz.zc_id and tz.sfzxjl = '1' ";
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		
		if(StringUtils.isNotEmpty(queryPurchaseVo.getYjflbm()) &&
				!"0".equals(queryPurchaseVo.getYjflbm())){
			strWhere.append("and zc.yjflbm = ? ");
			params.add(queryPurchaseVo.getYjflbm());
		}else{
			strWhere.append("and (zc.yjflbm = '2' or zc.yjflbm = '9') ");
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getEjflbm()) &&
				!"0".equals(queryPurchaseVo.getEjflbm())){
			strWhere.append("and zc.ejflbm = ? ");
			params.add(queryPurchaseVo.getEjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getSjflbm()) &&
				!"0".equals(queryPurchaseVo.getSjflbm())){
			strWhere.append("and zc.sjflbm = ? ");
			params.add(queryPurchaseVo.getSjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getZcmc())){
			strWhere.append("and zc.zcmc like ? ");
			params.add("%"+queryPurchaseVo.getZcmc()+"%");
		}
		if (StringUtils.isNotEmpty(queryPurchaseVo.getGg())) {
			strWhere.append("and  zc.gg like ? ");
			params.add("%" + queryPurchaseVo.getGg() + "%");
		}
		if(queryPurchaseVo.getZdjg() != null&&
				!"0".equals(queryPurchaseVo.getZgjg()) &&
				queryPurchaseVo.getZgjg() != 0){
			strWhere.append("and zc.czyz > ? ");
			params.add(queryPurchaseVo.getZdjg());
		}
		if(queryPurchaseVo.getZgjg() != null&&
				!"0".equals(queryPurchaseVo.getZgjg()) &&
				queryPurchaseVo.getZgjg() != 0){
			strWhere.append("and zc.czyz <= ? ");
			params.add(queryPurchaseVo.getZgjg());
		}
		strWhere.append("order by zc.zc_id asc");
		preparSQL = preparSQL + strWhere.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
		List tempList = pageableList.getResults();
		List<QueryBody4View> resultList = new ArrayList<QueryBody4View>();
		if(tempList.size() > 0){
			for(int i = 0; i < tempList.size(); i++){
				Map map = (Map)tempList.get(i);
				resultList.add(CoverMapToQueryBody4View.obatainQueryBody4ViewFromMap(map));
			}
			return resultList;
		}
		return null;
	}
	
	/**
	 * 到资产表查询资产信息，到台账表中查询领用借用信息,都是易耗品
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<QueryBody4View> queryYHPTZ(QueryPurchaseVo queryPurchaseVo,Paginator paginator){
		String preparSQL = "select zc.zc_id,zc.yjflmc,zc.ejflmc,zc.sjflmc,zc.zcmc,zc.zcbh,zc.gg,zc.sl,zc.jldw,zc.dzyhjg, " +
				"tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq "+
				"from Zy_zc zc,zy_kctz tz where zc.zc_id = tz.zc_id and tz.sfzxjl = '1' ";
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		if(StringUtils.isNotEmpty(queryPurchaseVo.getYjflbm()) &&
				!"0".equals(queryPurchaseVo.getYjflbm())){
			strWhere.append("and zc.yjflbm = ? ");
			params.add(queryPurchaseVo.getYjflbm());
		}else{
			strWhere.append(" and (zc.yjflbm = '3' or zc.yjflbm = '7') ");
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getEjflbm()) &&
				!"0".equals(queryPurchaseVo.getEjflbm())){
			strWhere.append("and zc.ejflbm = ? ");
			params.add(queryPurchaseVo.getEjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getSjflbm()) &&
				!"0".equals(queryPurchaseVo.getSjflbm())){
			strWhere.append("and zc.sjflbm = ? ");
			params.add(queryPurchaseVo.getSjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurchaseVo.getZcmc())){
			strWhere.append("and zc.zcmc like ? ");
			params.add("%"+queryPurchaseVo.getZcmc()+"%");
		}
		if (StringUtils.isNotEmpty(queryPurchaseVo.getGg())) {
			strWhere.append("and  zc.gg like ? ");
			params.add("%" + queryPurchaseVo.getGg() + "%");
		}
		if(queryPurchaseVo.getZdjg() != null&&
				!"0".equals(queryPurchaseVo.getZgjg()) &&
				queryPurchaseVo.getZgjg() != 0){
			strWhere.append("and zc.czyz > ? ");
			params.add(queryPurchaseVo.getZdjg());
		}
		if(queryPurchaseVo.getZgjg() != null&&
				!"0".equals(queryPurchaseVo.getZgjg()) &&
				queryPurchaseVo.getZgjg() != 0){
			strWhere.append("and zc.czyz <= ? ");
			params.add(queryPurchaseVo.getZgjg());
		}
		strWhere.append("order by zc.zc_id asc");
		preparSQL = preparSQL + strWhere.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
		List tempList = pageableList.getResults();
		List<QueryBody4View> resultList = new ArrayList<QueryBody4View>();
		if(tempList.size() > 0){
			for(int i = 0; i < tempList.size(); i++){
				Map map = (Map)tempList.get(i);
				resultList.add(CoverMapToQueryBody4View.obatainQueryBody4ViewFromMap(map));
			}
			return resultList;
		}
		return null;
	}
	
	/**
	 * 根据资产ID获得最新的台账
	 * @return
	 */
	public ZyKctz findZyKctz(String zcId) {
		return null;
	}

	/**
	 * 保存台账信息
	 * @param zyKctz
	 */
	public void saveBook(ZyKctz zyKctz) {
		publicDao.save(zyKctz);
	}
}