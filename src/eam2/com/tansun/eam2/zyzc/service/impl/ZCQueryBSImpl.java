package com.tansun.eam2.zyzc.service.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.zyzc.service.ZCQueryBS;
import com.tansun.eam2.zyzc.utils.CoverMapToViewVO;
import com.tansun.eam2.zyzc.vo.ExchangeVO;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * @author 薛崇杰 2010-11-23 下午10:48:05
 */
@Service
public class ZCQueryBSImpl implements ZCQueryBS {
	@Autowired
	PublicDao publicDao;
	
	public List<ZySbody> query4PurchaseAndPager(QueryPurchaseVo queryPurVo,Paginator paginator,String sheettype){
		String preparSQL = "Select dic3.assettype3_id,dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " +
					"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
					"where dic3.secondcode = dic2.assettype2_id and dic3.maincode = dic1.assettype1_id ";
		StringBuffer sb = new StringBuffer();
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(queryPurVo.getYjflbm())&&
				!"0".equals(queryPurVo.getYjflbm())){
			sb.append(" and dic3.maincode = ?");
			params.add(queryPurVo.getYjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurVo.getEjflbm())&&
				!"0".equals(queryPurVo.getEjflbm())){
			sb.append(" and dic3.secondcode = ?");
			params.add(queryPurVo.getEjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurVo.getSjflbm())&&
				!"0".equals(queryPurVo.getSjflbm())){
			sb.append(" and dic3.assettype3_id = ?");
			params.add(queryPurVo.getSjflbm());
		}
		sb.append(" order by dic3.assettype3_id");
		preparSQL = preparSQL + sb.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
		List<ZySbody> finalBodyList = new ArrayList<ZySbody>();
		List resultsList = pageableList.getResults();
		Map map = null;
		if(resultsList.size() > 0){
			for(int i = 0; i < resultsList.size(); i++){
				map = (Map)resultsList.get(i);
				ZySbody body = new ZySbody();
				body.setZcId((String)map.get("ASSETTYPE3_ID"));
				body.setYjflmc((String)map.get("TYPENAME1"));
				body.setEjflmc((String)map.get("TYPENAME2"));
				body.setSjflmc((String)map.get("TYPENAME3"));
				body.setZcmc((String)map.get("TYPENAME3"));
				finalBodyList.add(body);
			}
		}
		return finalBodyList;
	}

	public List<ZySbody> query4ConAndBor(QueryPurchaseVo queryPurVo,Paginator paginator,String sheettype){
		String preparSQL = "Select dic3.assettype3_id,dic3.MAINCODE,dic3.SECONDCODE,dic1.typename typename1,dic2.typename typename2,dic3.typename typename3 " +
		"From Dic_App_Assettype1 Dic1,Dic_App_Assettype2 Dic2,Dic_App_Assettype3 Dic3 " +
		"where dic3.secondcode = dic2.assettype2_id and dic3.maincode = dic1.assettype1_id ";
		StringBuffer sb = new StringBuffer();
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(queryPurVo.getYjflbm())&&
				!"0".equals(queryPurVo.getYjflbm())){
			sb.append(" and dic3.maincode = ?");
			params.add(queryPurVo.getYjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurVo.getEjflbm())&&
				!"0".equals(queryPurVo.getEjflbm())){
			sb.append(" and dic3.secondcode = ?");
			params.add(queryPurVo.getEjflbm());
		}
		if(StringUtils.isNotEmpty(queryPurVo.getSjflbm())&&
				!"0".equals(queryPurVo.getSjflbm())){
			sb.append(" and dic3.assettype3_id = ?");
			params.add(queryPurVo.getSjflbm());
		}
		sb.append(" order by dic3.assettype3_id");
		preparSQL = preparSQL + sb.toString();
		PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
		List<ZySbody> finalBodyList = new ArrayList<ZySbody>();
		List resultsList = pageableList.getResults();
		Map map = null;
		if(resultsList.size() > 0){
			for(int i = 0; i < resultsList.size(); i++){
				map = (Map)resultsList.get(i);
				ZySbody body = new ZySbody();
				body.setZcId((String)map.get("MAINCODE")+"a"+(String)map.get("SECONDCODE")+"a"+(String)map.get("ASSETTYPE3_ID")+"aa");
				body.setYjflmc((String)map.get("TYPENAME1"));
				body.setEjflmc((String)map.get("TYPENAME2"));
				body.setSjflmc((String)map.get("TYPENAME3"));
				body.setZcmc((String)map.get("TYPENAME3"));
				finalBodyList.add(body);
			}
		}
		return finalBodyList;
	}
	
//	List resultList = publicDao.queryForList(preparSQL, new ArrayList());
//	List vvList = new ArrayList();
//	if (resultList.size() > 0) {
//		for (int i = 0; i < resultList.size(); i++) {
//			vvList.add(CoverMapToViewVO
//					.obtainViewVOFromMap((Map) resultList.get(i)));
//		}
//	}
//	return vvList;
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询 map中存放相应的条件信息
	 * 
	 * @return
	 */
	public List<ZyZc> query(Map map) {
		StringBuffer hqlwhere = new StringBuffer();
		List params = new ArrayList();
		// 物品名称
		if (map.get("zcmc") != null
				&& map.get("zcmc").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.zcmc like  ?  ");
			params.add("%" + map.get("zcmc") + "%");
		}
		// 规格
		if (map.get("gg") != null
				&& map.get("gg").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.gg = ? ");
			params.add(map.get("gg"));
		}
		// 起始日期
		if (map.get("qsrq") != null
				&& map.get("qsrq").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.kssyrq > ? ");
			params.add(map.get("qsrq"));
		}
		// 截止日期
		if (map.get("jzrq") != null
				&& map.get("jzrq").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.kssyrq < ? ");
			params.add(map.get("jzrq"));
		}
		// 最大值zdz，
		if (map.get("zdz") != null
				&& map.get("zdz").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.czyz < ? ");
			params.add(map.get("zdz"));
		}
		// 最小值zxz
		if (map.get("zxz") != null
				&& map.get("zxz").toString().trim().length() > 0) {
			hqlwhere.append("and  zyzc.czyz > ? ");
			params.add(map.get("zxz"));
		}
		String where = hqlwhere.toString();
		String hql = "select zyzc from ZyZc zyzc  where 1=1  " + where + "   ";
		publicDao.find(hql);
		return (List<ZyZc>) publicDao.find(hql, params);
	}

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> queryZcByVoWithPager(QueryPurchaseVo queryPurVo,
			Paginator paginator, String sheettype) {
		if (queryPurVo == null) {
			return null;
		} else {
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}
			if (queryPurVo.getYjflmc() != null
					&& !"null".equals(queryPurVo.getYjflmc())
					&& queryPurVo.getYjflmc().trim().length() > 0) {
				params.add(queryPurVo.getYjflmc());
				stringbuffer.append(" and zyzc.yjflmc  =? ");
			}
			if (queryPurVo.getEjflmc() != null
					&& !"null".equals(queryPurVo.getEjflmc())
					&& queryPurVo.getEjflmc().trim().length() > 0) {
				params.add(queryPurVo.getEjflmc());
				stringbuffer.append(" and zyzc.ejflmc  =? ");
			}
			if (queryPurVo.getSjflmc() != null
					&& !"null".equals(queryPurVo.getSjflmc())
					&& queryPurVo.getSjflmc().trim().length() > 0) {
				params.add(queryPurVo.getSjflmc());
				stringbuffer.append(" and zyzc.sjflmc  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and zyzc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and zyzc.zcmc like ? ");
			}
			if (queryPurVo.getZcbh() != null
					&& !"null".equals(queryPurVo.getZcbh())
					&& queryPurVo.getZcbh().trim().length() > 0) {
				params.add(queryPurVo.getZcbh());
				stringbuffer.append(" and zyzc.zcbh = ? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				if("领用".equals(sheettype)){
					params.add(queryPurVo.getZczt());
					stringbuffer
						.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
				}else if ("借用".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("续借".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
							.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("更换".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
							.append(" or zyzc.zczt = '3' or zyzc.zczt = '03'");
					stringbuffer
							.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("gooddeploy".equals(sheettype)) {
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
					stringbuffer
							.append(" and zyzc.zczt != '在库' and zyzc.zczt != '1' and zyzc.zczt != '01' ");
					stringbuffer
							.append(" and zyzc.zczt != '维修' and zyzc.zczt != '4' and zyzc.zczt != '04' ");
					stringbuffer
							.append(" and zyzc.zczt != '报废' and zyzc.zczt != '5' and zyzc.zczt != '05' ");
				} else {
					params.add(queryPurVo.getZczt());
					stringbuffer.append(" and zyzc.zczt = ? ");
				}
			}
			if (queryPurVo.getSfsckp() != null
					&& !"null".equals(queryPurVo.getSfsckp())
					&& queryPurVo.getSfsckp().trim().length() > 0) {
				params.add(queryPurVo.getSfsckp());
				stringbuffer.append(" and zyzc.sfsckp = ? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())&&
					queryPurVo.getZdjg() != 0) {
				params.add(queryPurVo.getZdjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg > ? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())&&
					queryPurVo.getZgjg() != 0) {
				params.add(queryPurVo.getZgjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg <= ? ");
			}
			if (queryPurVo.getTzlx() != null
					&& !"null".equals(queryPurVo.getTzlx())
					&& queryPurVo.getTzlx().trim().length() > 0) {
				params.add(queryPurVo.getTzlx());
				stringbuffer.append(" and zyzc.tzlx = ? ");
			}
			if (queryPurVo.getZclx() != null
					&& !"null".equals(queryPurVo.getZclx())
					&& queryPurVo.getZclx().trim().length() > 0) {
				params.add(queryPurVo.getZclx());
				stringbuffer.append(" and zyzc.zclx = ? ");
			}
			if (queryPurVo.getZcid() != null
					&& !"null".equals(queryPurVo.getZcid())
					&& queryPurVo.getZcid().trim().length() > 0) {
				params.add(queryPurVo.getZcid());
				stringbuffer.append(" and zyzc.zcId = ? ");
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and zyzc.syr = ? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and zyzc.sybm = ? ");
			}
			if (queryPurVo.getGys() != null
					&& !"null".equals(queryPurVo.getGys())
					&& queryPurVo.getGys().trim().length() > 0) {
				params.add(queryPurVo.getGys());
				stringbuffer.append(" and zyzc.gys = ? ");
			}
			if (queryPurVo.getZdkcl() != null
					&& !"null".equals(queryPurVo.getZdkcl())
					&& queryPurVo.getZdkcl().trim().length() > 0) {
				params.add(queryPurVo.getZdkcl());
				stringbuffer.append(" and zyzc.zdkcl = ? ");
			}
			if (queryPurVo.getZgkcl() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getZgkcl().trim().length() > 0) {
				params.add(queryPurVo.getZgkcl());
				stringbuffer.append(" and zyzc.zgkcl = ? ");
			}
			if (queryPurVo.getQyzzrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzzrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzzrq());
				stringbuffer.append(" and zyzc.qyzzrq = ? ");
			}
			if (queryPurVo.getQyzwrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzwrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzwrq());
				stringbuffer.append(" and zyzc.qyzwrq = ? ");
			}
			if (queryPurVo.getKsrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getKsrq().trim().length() > 0) {
				params.add(queryPurVo.getKsrq());
				stringbuffer.append(" and zyzc.ksrq <= ? ");
			}
			if (queryPurVo.getJsrq() != null
					&& !"null".equals(queryPurVo.getZgkcl())
					&& queryPurVo.getJsrq().trim().length() > 0) {
				params.add(queryPurVo.getJsrq());
				stringbuffer.append(" and zyzc.jsrq > ? ");
			}
			if (queryPurVo.getQscbrq() != null
					&& !"null".equals(queryPurVo.getQscbrq())
					&& queryPurVo.getQscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getQscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  >= to_date('"
						+ queryPurVo.getQscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getJscbrq() != null
					&& !"null".equals(queryPurVo.getJscbrq())
					&& queryPurVo.getJscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getJscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  <= to_date('"
						+ queryPurVo.getJscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getBxfws() != null
					&& !"null".equals(queryPurVo.getBxfws())
					&& queryPurVo.getBxfws().trim().length() > 0) {
				params.add("%" + queryPurVo.getBxfws() + "%");
				stringbuffer.append(" and zyzc.bxfws = ? ");
			}
			if("zcQuery4Card".equals(sheettype)){
				stringbuffer.append(" and (zyzc.sfsckp = '否' or zyzc.sfsckp = '0')");
				stringbuffer.append(" and (zyzc.yjflmc = '计算机类固定资产' or zyzc.sfsckp = '非计算机类固定资产')");
			}
			if ("discard".equals(sheettype)) {
				stringbuffer.append(" and zyzc.zczt not in ('报废','5','05') ");
			}
			stringbuffer.append(" order by zcId asc");
			String where = stringbuffer.toString();
			String hql = "from ZyZc zyzc  where 1=1  " + where + "";
			PageableList pageableList = null;
			try {
				if (paginator.getPageSize() == 2147483647) {
					resultList = (List<ZyZc>) publicDao.find(hql, params);
				} else {
					pageableList = publicDao.queryByHQLWithPaginator(hql,
							params, paginator);
					resultList = pageableList.getResults();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return resultList;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<ViewVO> query4ReborrowAdd(QueryPurchaseVo queryPurVo,Paginator paginator, String sheettype) {
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				if ("续借".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
					.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
					.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
					stringbuffer
					.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				}
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and tz.lyrmc = ? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and tz.jybmmc = ? ");
			}
			stringbuffer.append(" and tz.zc_id = Zyzc.zc_id and tz.sfzxjl = '1'");
			stringbuffer.append(" order by zc_Id asc");
			String where = stringbuffer.toString();
			String preparSQL = "select zyzc.yjflmc,zyzc.ejflmc,zyzc.sjflmc,zyzc.sl,zyzc.jldw,zyzc.zc_id,zyzc.zcbh," +
						 "tz.lyrmc,tz.jybmmc " +
						 "from Zy_Zc zyzc, zy_kctz tz where 1=1  " + where + "";
			PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
			resultList = pageableList.getResults();
			Map<String,Object> map = null;
			ViewVO vv = null;
			List<ViewVO> vvList = new ArrayList<ViewVO>();
			for(int i = 0; i < resultList.size(); i++){
				map = (Map<String,Object>)resultList.get(i);
				vv = CoverMapToViewVO.obtainViewVOFromMap(map);
				vvList.add(vv);
			}
			return vvList;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<ZyZc> queryZcByVoWithPager4BorAndCon(QueryPurchaseVo queryPurVo,
			Paginator paginator, String sheettype) {
			List<ZyZc>  finalList = new ArrayList<ZyZc>();
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and sjflbm  =? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				if("领用".equals(sheettype)){
					params.add(queryPurVo.getZczt());
					stringbuffer
					.append(" and (zczt = ? or zczt = '01' or zczt = '1')");
				}
				if("借用".equals(sheettype)){
					params.add(queryPurVo.getZczt());
					stringbuffer
					.append(" and (zczt = ? or zczt = '01' or zczt = '1')");
					stringbuffer
					.append(" and yjflbm != '3' and yjflbm != '7'");
				}
			}
			String where = stringbuffer.toString();
			String preparSQL = "Select Yjflbm,Ejflbm,Sjflbm,Yjflmc,Ejflmc,Sjflmc,nvl(Sum(Sl),0) sl From Zy_Zc"+ 
					  " Where 1 = 1"+ where +
					  " Group By Yjflbm, Ejflbm, Sjflbm, Yjflmc, Ejflmc, Sjflmc"+ 
					  " order by yjflbm asc";
			PageableList  pageableList = publicDao.queryForList(preparSQL, params, paginator);
			resultList = pageableList.getResults();
			Map map = null;
			for(int i = 0; i < resultList.size(); i++){
				ZyZc zyzc = new ZyZc();
				map = (Map)resultList.get(i);
				zyzc.setYjflmc((String)map.get("YJFLMC"));
				zyzc.setEjflmc((String)map.get("EJFLMC"));
				zyzc.setSjflmc((String)map.get("SJFLMC"));
				zyzc.setZcId((String)map.get("YJFLBM")+ "a" + (String)map.get("EJFLBM")+"a"+(String)map.get("SJFLBM")+"aa");
				zyzc.setSl(((BigDecimal)map.get("SL")).doubleValue());
				finalList.add(zyzc);
			}
			return finalList;
		}
	
//	@SuppressWarnings("unchecked")
//	public List<ZyZc> queryZcByVoWithPager4BorAndConFix(QueryPurchaseVo queryPurVo,
//			Paginator paginator){
//		List<ZyZc> resultList = new ArrayList<ZyZc>();
//		List params = new ArrayList();
//		StringBuffer stringbuffer = new StringBuffer();
//		if (queryPurVo.getYjflbm() != null
//				&& !"null".equals(queryPurVo.getYjflbm())
//				&& queryPurVo.getYjflbm().trim().length() > 0
//				&& queryPurVo.getYjflbm().compareTo("0") > 0) {
//			params.add(queryPurVo.getYjflbm());
//			stringbuffer.append(" and zyzc.yjflbm  =? ");
//		}
//		if (queryPurVo.getEjflbm() != null
//				&& !"null".equals(queryPurVo.getEjflbm())
//				&& queryPurVo.getEjflbm().trim().length() > 0
//				&& queryPurVo.getEjflbm().compareTo("0") > 0) {
//			params.add(queryPurVo.getEjflbm());
//			stringbuffer.append(" and zyzc.ejflbm  =? ");
//		}
//		if (queryPurVo.getSjflbm() != null
//				&& !"null".equals(queryPurVo.getSjflbm())
//				&& queryPurVo.getSjflbm().trim().length() > 0
//				&& queryPurVo.getSjflbm().compareTo("0") > 0) {
//			params.add(queryPurVo.getSjflbm());
//			stringbuffer.append(" and zyzc.sjflbm  =? ");
//		}
//		if (queryPurVo.getGg() != null
//				&& !"null".equals(queryPurVo.getGg())
//				&& queryPurVo.getGg().trim().length() > 0) {
//			params.add("%" + queryPurVo.getGg() + "%");
//			stringbuffer.append(" and zyzc.gg like ? ");
//		}
//		if (queryPurVo.getZcmc() != null
//				&& !"null".equals(queryPurVo.getZcmc())
//				&& queryPurVo.getZcmc().trim().length() > 0) {
//			params.add("%" + queryPurVo.getZcmc() + "%");
//			stringbuffer.append(" and zyzc.zcmc like ? ");
//		}
//		if (queryPurVo.getZczt() != null
//				&& !"null".equals(queryPurVo.getZczt())
//				&& queryPurVo.getZczt().trim().length() > 0) {
//				params.add(queryPurVo.getZczt());
//				stringbuffer.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
//		}
//		stringbuffer.append(" and zyzc.yjflmc not like '%易耗品%'");
//		stringbuffer.append(" order by zyzc.zcId asc");
//		String where = stringbuffer.toString();
//		String hql = "from ZyZc zyzc  where 1=1  " + where + "";
//		PageableList pageableList = null;
//		pageableList = publicDao.queryByHQLWithPaginator(hql,params,paginator);
//		resultList = (List<ZyZc>)pageableList.getResults();
//		return resultList;
//	}

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> query4Reborrow(QueryPurchaseVo queryPurVo,
			Paginator paginator, String sheettype) {
		if (queryPurVo == null) {
			return null;
		} else {
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and zyzc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and zyzc.zcmc like ? ");
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and tz.lyrmc = ? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				if ("续借".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
							.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
				}
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and zyzc.syr = ? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and zyzc.sybm = ? ");
			}
			stringbuffer.append(" order by zc.zc_Id asc");
			String where = stringbuffer.toString();
			String hql = "Select tz.lyrbh,tz.lyrmc,tz.jybmbm,tz.jybmmc,tz.lyrq,tz.jydqrq,zc.* "
					+ "From Zy_Zc Zc, Zy_Kctz Tz "
					+ "Where Zc.Zc_Id = Tz.Zc_Id And Tz.Sfzxjl = '1' and (zc.zczt = '借用' or zc.zczt = '2' or zc.zczt = '02')"
					+ "order by zc.zc_Id asc; " + where + "";
			PageableList pageableList = null;
			try {
				if (paginator.getPageSize() == 2147483647) {
					resultList = (List<ZyZc>) publicDao.find(hql, params);
				} else {
					pageableList = publicDao.queryByHQLWithPaginator(hql,
							params, paginator);
					resultList = pageableList.getResults();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return resultList;
		}
	}

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询 本方法只用于查询在库的物品
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> queryZcInStockWithPager(QueryPurchaseVo queryPurVo,
			Paginator paginator, String sheettype) {
		if (queryPurVo == null) {
			return null;
		} else {
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}

			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and zyzc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and zyzc.zcmc like ? ");
			}
			if (queryPurVo.getZcbh() != null
					&& !"null".equals(queryPurVo.getZcbh())
					&& queryPurVo.getZcbh().trim().length() > 0) {
				params.add(queryPurVo.getZcbh());
				stringbuffer.append(" and zyzc.zcbh = ? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				params.add(queryPurVo.getZczt());
				if ("更换".equals(sheettype)) {
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else {
					stringbuffer.append(" and zyzc.zczt = ? ");
				}
			}
			if (queryPurVo.getSfsckp() != null
					&& !"null".equals(queryPurVo.getSfsckp())
					&& queryPurVo.getSfsckp().trim().length() > 0) {
				params.add(queryPurVo.getSfsckp());
				stringbuffer.append(" and zyzc.sfsckp = ? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())) {
				params.add(queryPurVo.getZdjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg > ? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())) {
				params.add(queryPurVo.getZgjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg <= ? ");
			}
			if (queryPurVo.getTzlx() != null
					&& !"null".equals(queryPurVo.getTzlx())
					&& queryPurVo.getTzlx().trim().length() > 0) {
				params.add(queryPurVo.getTzlx());
				stringbuffer.append(" and zyzc.tzlx = ? ");
			}
			if (queryPurVo.getZclx() != null
					&& !"null".equals(queryPurVo.getZclx())
					&& queryPurVo.getZclx().trim().length() > 0) {
				params.add(queryPurVo.getZclx());
				stringbuffer.append(" and zyzc.zclx = ? ");
			}
			if (queryPurVo.getZcid() != null
					&& !"null".equals(queryPurVo.getZcid())
					&& queryPurVo.getZcid().trim().length() > 0) {
				params.add(queryPurVo.getZcid());
				stringbuffer.append(" and zyzc.zcId = ? ");
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and zyzc.syr = ? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and zyzc.sybm = ? ");
			}
			if (queryPurVo.getGys() != null
					&& !"null".equals(queryPurVo.getGys())
					&& queryPurVo.getGys().trim().length() > 0) {
				params.add(queryPurVo.getGys());
				stringbuffer.append(" and zyzc.gys = ? ");
			}
			if (queryPurVo.getZdkcl() != null
					&& !"null".equals(queryPurVo.getZdkcl())
					&& queryPurVo.getZdkcl().trim().length() > 0) {
				params.add(queryPurVo.getZdkcl());
				stringbuffer.append(" and zyzc.zdkcl = ? ");
			}
			if (queryPurVo.getZgkcl() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getZgkcl().trim().length() > 0) {
				params.add(queryPurVo.getZgkcl());
				stringbuffer.append(" and zyzc.zgkcl = ? ");
			}
			if (queryPurVo.getQyzzrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzzrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzzrq());
				stringbuffer.append(" and zyzc.qyzzrq = ? ");
			}
			if (queryPurVo.getQyzwrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzwrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzwrq());
				stringbuffer.append(" and zyzc.qyzwrq = ? ");
			}
			if (queryPurVo.getKsrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getKsrq().trim().length() > 0) {
				params.add(queryPurVo.getKsrq());
				stringbuffer.append(" and zyzc.ksrq <= ? ");
			}
			if (queryPurVo.getJsrq() != null
					&& !"null".equals(queryPurVo.getZgkcl())
					&& queryPurVo.getJsrq().trim().length() > 0) {
				params.add(queryPurVo.getJsrq());
				stringbuffer.append(" and zyzc.jsrq > ? ");
			}
			if (queryPurVo.getQscbrq() != null
					&& !"null".equals(queryPurVo.getQscbrq())
					&& queryPurVo.getQscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getQscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  >= to_date('"
						+ queryPurVo.getQscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getJscbrq() != null
					&& !"null".equals(queryPurVo.getJscbrq())
					&& queryPurVo.getJscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getJscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  <= to_date('"
						+ queryPurVo.getJscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getBxfws() != null
					&& !"null".equals(queryPurVo.getBxfws())
					&& queryPurVo.getBxfws().trim().length() > 0) {
				params.add("%" + queryPurVo.getBxfws() + "%");
				stringbuffer.append(" and zyzc.bxfws = ? ");
			}
			stringbuffer.append(" order by zcId asc");
			String where = stringbuffer.toString();
			String hql = "from ZyZc zyzc  where 1=1  " + where + "";
			PageableList pageableList = null;
			try {
				if (paginator.getPageSize() == 2147483647) {
					resultList = (List<ZyZc>) publicDao.find(hql, params);
				} else {
					pageableList = publicDao.queryByHQLWithPaginator(hql,
							params, paginator);
					resultList = pageableList.getResults();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return resultList;
		}
	}

	/**
	 * 这个方法提供给报废查询使用
	 * 
	 * @param queryPurVo
	 * @param sheetType
	 * @param paginator
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ViewVO> discardQuery(QueryPurchaseVo queryPurVo,
			Paginator paginator) {
		if (queryPurVo == null) {
			return null;
		} else {
			List<ViewVO> vvList = new ArrayList<ViewVO>();
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and Zc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and Zc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and Zc.sjflbm  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and Zc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and Zc.zcmc like ? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())&&
					!"0".equals(queryPurVo.getZdjg())&&
					queryPurVo.getZdjg() != 0) {
				params.add(queryPurVo.getZdjg());
				stringbuffer.append(" and Zc.DZYHDJ > ? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())&&
					!"0".equals(queryPurVo.getZgjg())&&
					queryPurVo.getZgjg() != 0) {
				params.add(queryPurVo.getZgjg());
				stringbuffer.append(" and Zc.DZYHDJ <= ? ");
			}
			stringbuffer.append(" order by zc.zc_Id asc");
			String where = stringbuffer.toString();
			String preparSQL = "";
			// preparSQL = "Select tz.rq,tz.cksl,zc.* From Zy_Zc Zc,Zy_Kctz Tz "
			// +
			// "where zc.zc_id = tz.zc_id and tz.djlx = 'discard' " + where;
			preparSQL = "Select * From Zy_Zc Zc where (Zc.zczt = '报废' or Zc.zczt = '5' or Zc.zczt = '05')"
					+ where;
			if (paginator.getPageSize() == 2147483647) {
				resultList = publicDao.queryForList(preparSQL, params);
			} else {
				PageableList pageableList = null;
				pageableList = publicDao.queryForList(preparSQL, params,
						paginator);
				resultList = pageableList.getResults();
			}
			if (resultList.size() > 0) {
				for (int i = 0; i < resultList.size(); i++) {
					vvList.add(CoverMapToViewVO
							.obtainViewVOFromMap((Map) resultList.get(i)));
				}
			}
			return vvList;
		}
	}

	/**
	 * 这个方法提供给报废查询的勾选excel导出
	 * 
	 * @param queryPurVo
	 * @param sheetType
	 * @param paginator
	 * @return
	 */
	public List<ViewVO> discardQueryExcel(String ids) {
		String preparSQL = "";
		preparSQL = "Select * From Zy_Zc Zc where (Zc.zczt = '报废' or Zc.zczt = '5' or Zc.zczt = '05') "
				+ "and Zc.ZC_ID in (" + IdStrFormat.formatIds(ids) + ") ";
		List resultList = publicDao.queryForList(preparSQL, new ArrayList());
		List vvList = new ArrayList();
		if (resultList.size() > 0) {
			for (int i = 0; i < resultList.size(); i++) {
				vvList.add(CoverMapToViewVO
						.obtainViewVOFromMap((Map) resultList.get(i)));
			}
		}
		return vvList;
	}

	/**
	 * 领借用查询
	 * 
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ViewVO> borrowOrConsumQuery(QueryPurchaseVo queryPurVo,
			String sheetType, Paginator paginator) {
		if (queryPurVo == null) {
			return null;
		} else {
			List<ViewVO> vvList = new ArrayList<ViewVO>();
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and Zc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and Zc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and Zc.sjflbm  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and Zc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and Zc.zcmc like ? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())) {
				params.add(queryPurVo.getZdjg());
				stringbuffer.append(" and Zc.zdjg > ? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())) {
				params.add(queryPurVo.getZgjg());
				stringbuffer.append(" and Zc.zgjg <= ? ");
			}
			if (StringUtils.isNotEmpty(queryPurVo.getSyr())) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and tz.lyrmc = ? ");
			}
			if (StringUtils.isNotEmpty(queryPurVo.getSybm())) {
				if ("borrowQuery".equals(sheetType)) {
					params.add(queryPurVo.getSybm());
					stringbuffer.append(" and tz.jybmmc like ? ");
				} else if ("consumQuery".equals(sheetType)) {
					params.add(queryPurVo.getSybm());
					stringbuffer.append(" and tz.lybmmc like ? ");
				}
			}
			String preparSQL = "";
			if ("borrowQuery".equals(sheetType)) {
//				preparSQL = "Select tz.rq,tz.cksl,tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq,tz.sfxj,zc.* From Zy_Zc Zc,Zy_Kctz Tz "
//						+ "where zc.zc_id = tz.zc_id and Tz.Djlx like '%borrow%' And Tz.Sfzxjl = '1' "
//						+ where;
				stringbuffer.append(" and Zc.zczt in ('借用','2','02')");
				stringbuffer.append(" and Zc.yjflmc != '计算机类易耗品' and Zc.yjflmc != '非计算机类易耗品'");
				stringbuffer.append(" order by zc.zc_Id asc");
				String where = stringbuffer.toString();
				preparSQL = "Select tz.rq,tz.cksl,tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq,tz.sfxj,zc.* From Zy_Zc Zc,Zy_Kctz Tz "
					+ "where zc.zc_id = tz.zc_id And Tz.Sfzxjl = '1' "
					+ where;
			} else if ("consumQuery".equals(sheetType)) {
//				preparSQL = "Select tz.rq,tz.cksl,tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq,tz.sfxj,zc.* From Zy_Zc Zc,Zy_Kctz Tz "
//						+ "where zc.zc_id = tz.zc_id and tz.djlx = 'dept_comsuming' and Tz.Sfzxjl = '1'  "
//						+ where;
				stringbuffer.append(" and Zc.zczt in ('领用','3','03')");
				stringbuffer.append(" order by zc.zc_Id asc");
				String where = stringbuffer.toString();
				preparSQL = "Select tz.rq,tz.cksl,tz.lybmmc,tz.jybmmc,tz.lyrmc,tz.lyrq,tz.jydqrq,tz.sfxj,zc.* From Zy_Zc Zc,Zy_Kctz Tz "
					+ "where zc.zc_id = tz.zc_id and Tz.Sfzxjl = '1'  "
					+ where;
			}
			try {
				if (paginator.getPageSize() == 2147483647) {
					resultList = publicDao.queryForList(preparSQL, params);
				} else {
					PageableList pageableList = null;
					pageableList = publicDao.queryForList(preparSQL, params,
							paginator);
					resultList = pageableList.getResults();
				}
				if (resultList.size() > 0) {
					for (int i = 0; i < resultList.size(); i++) {
						vvList.add(CoverMapToViewVO
								.obtainViewVOFromMap((Map) resultList.get(i)));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vvList;
		}
	}

	/**
	 * 入库物品查询
	 * 
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyZc> query4Stock(QueryPurchaseVo queryPurVo,
			Paginator paginator) {
		String preparHQL = "from ZyZc Zc where 1 = 1";
		StringBuffer strWhere = new StringBuffer();
		List params = new ArrayList();
		if (queryPurVo.getYjflbm() != null
				&& !"null".equals(queryPurVo.getYjflbm())
				&& queryPurVo.getYjflbm().trim().length() > 0
				&& queryPurVo.getYjflbm().compareTo("0") > 0) {
			params.add(queryPurVo.getYjflbm());
			strWhere.append(" and Zc.yjflbm  =? ");
		}
		if (queryPurVo.getEjflbm() != null
				&& !"null".equals(queryPurVo.getEjflbm())
				&& queryPurVo.getEjflbm().trim().length() > 0
				&& queryPurVo.getEjflbm().compareTo("0") > 0) {
			params.add(queryPurVo.getEjflbm());
			strWhere.append(" and Zc.ejflbm  =? ");
		}
		if (queryPurVo.getSjflbm() != null
				&& !"null".equals(queryPurVo.getSjflbm())
				&& queryPurVo.getSjflbm().trim().length() > 0
				&& queryPurVo.getSjflbm().compareTo("0") > 0) {
			params.add(queryPurVo.getSjflbm());
			strWhere.append(" and Zc.sjflbm  =? ");
		}
		if (queryPurVo.getGg() != null && !"null".equals(queryPurVo.getGg())
				&& queryPurVo.getGg().trim().length() > 0) {
			params.add("%" + queryPurVo.getGg() + "%");
			strWhere.append(" and Zc.gg like ? ");
		}
		if (queryPurVo.getZcmc() != null
				&& !"null".equals(queryPurVo.getZcmc())
				&& queryPurVo.getZcmc().trim().length() > 0) {
			params.add("%" + queryPurVo.getZcmc() + "%");
			strWhere.append(" and Zc.zcmc like ? ");
		}
		if (queryPurVo.getZdjg() != null
				&& !"null".equals(queryPurVo.getZdjg())&&
				queryPurVo.getZdjg() != 0) {
			params.add(queryPurVo.getZdjg().doubleValue());
			strWhere.append(" and Zc.dzyhjg > ? ");
		}
		if (queryPurVo.getZgjg() != null
				&& !"null".equals(queryPurVo.getZgjg())&&
				queryPurVo.getZgjg() != 0) {
			params.add(queryPurVo.getZgjg().doubleValue());
			strWhere.append(" and Zc.dzyhjg <= ? ");
		}
		if (StringUtils.isNotEmpty(queryPurVo.getKsrq())) {
			params.add(Date.valueOf(queryPurVo.getKsrq()));
			strWhere.append(" and Zc.rkrq > ?");
		}
		if (StringUtils.isNotEmpty(queryPurVo.getJsrq())) {
			params.add(Date.valueOf(queryPurVo.getJsrq()));
			strWhere.append(" and Zc.rkrq <= ?");
		}
		strWhere.append(" order by Zc.zcId asc");
		preparHQL = preparHQL + strWhere.toString();
		PageableList pageableList = publicDao.queryByHQLWithPaginator(
				preparHQL, params, paginator);
		return (List<ZyZc>) pageableList.getResults();
	}

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 
	 * @return
	 */
	public List<ZyZc> queryZcByVo(QueryPurchaseVo queryPurVo) {
		if (queryPurVo == null) {
			return null;
		} else {
			List<ZyZc> list = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}
			if (queryPurVo.getYjflmc() != null
					&& !"null".equals(queryPurVo.getYjflmc())
					&& queryPurVo.getYjflmc().trim().length() > 0) {
				params.add(queryPurVo.getYjflmc());
				stringbuffer.append(" and zyzc.yjflmc  =? ");
			}
			if (queryPurVo.getEjflmc() != null
					&& !"null".equals(queryPurVo.getEjflmc())
					&& queryPurVo.getEjflmc().trim().length() > 0) {
				params.add(queryPurVo.getEjflmc());
				stringbuffer.append(" and zyzc.ejflmc  =? ");
			}
			if (queryPurVo.getSjflmc() != null
					&& !"null".equals(queryPurVo.getSjflmc())
					&& queryPurVo.getSjflmc().trim().length() > 0) {
				params.add(queryPurVo.getSjflmc());
				stringbuffer.append(" and zyzc.sjflmc  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add(queryPurVo.getGg());
				stringbuffer.append(" and zyzc.gg      =? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add(queryPurVo.getZcmc());
				stringbuffer.append(" and zyzc.zcmc    =? ");
			}
			if (queryPurVo.getZcbh() != null
					&& !"null".equals(queryPurVo.getZcbh())
					&& queryPurVo.getZcbh().trim().length() > 0) {
				params.add(queryPurVo.getZcbh());
				stringbuffer.append(" and zyzc.zcbh    =? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				params.add(queryPurVo.getZczt());
				stringbuffer.append(" and zyzc.zczt    =? ");
			}
			if (queryPurVo.getSfsckp() != null
					&& !"null".equals(queryPurVo.getSfsckp())
					&& queryPurVo.getSfsckp().trim().length() > 0) {
				params.add(queryPurVo.getSfsckp());
				stringbuffer.append(" and zyzc.sfsckp  =? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())) {
				params.add(queryPurVo.getZdjg());
				stringbuffer.append(" and zyzc.zdjg    =? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())) {
				params.add(queryPurVo.getZgjg());
				stringbuffer.append(" and zyzc.zgjg    =? ");
			}
			if (queryPurVo.getTzlx() != null
					&& !"null".equals(queryPurVo.getTzlx())
					&& queryPurVo.getTzlx().trim().length() > 0) {
				params.add(queryPurVo.getTzlx());
				stringbuffer.append(" and zyzc.tzlx    =? ");
			}
			if (queryPurVo.getZclx() != null
					&& !"null".equals(queryPurVo.getZclx())
					&& queryPurVo.getZclx().trim().length() > 0) {
				params.add(queryPurVo.getZclx());
				stringbuffer.append(" and zyzc.zclx    =? ");
			}
			if (queryPurVo.getZcid() != null
					&& !"null".equals(queryPurVo.getZcid())
					&& queryPurVo.getZcid().trim().length() > 0) {
				params.add(queryPurVo.getZcid());
				stringbuffer.append(" and zyzc.zcId    =? ");
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and zyzc.syr     =? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and zyzc.sybm    =? ");
			}
			if (queryPurVo.getGys() != null
					&& !"null".equals(queryPurVo.getGys())
					&& queryPurVo.getGys().trim().length() > 0) {
				params.add(queryPurVo.getGys());
				stringbuffer.append(" and zyzc.gys     =? ");
			}
			if (queryPurVo.getZdkcl() != null
					&& !"null".equals(queryPurVo.getZdkcl())
					&& queryPurVo.getZdkcl().trim().length() > 0) {
				params.add(queryPurVo.getZdkcl());
				stringbuffer.append(" and zyzc.zdkcl   =? ");
			}
			if (queryPurVo.getZgkcl() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getZgkcl().trim().length() > 0) {
				params.add(queryPurVo.getZgkcl());
				stringbuffer.append(" and zyzc.zgkcl   =? ");
			}
			if (queryPurVo.getQyzzrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzzrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzzrq());
				stringbuffer.append(" and zyzc.qyzzrq  =? ");
			}
			if (queryPurVo.getQyzwrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzwrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzwrq());
				stringbuffer.append(" and zyzc.qyzwrq  =? ");
			}
			if (queryPurVo.getKsrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getKsrq().trim().length() > 0) {
				params.add(queryPurVo.getKsrq());
				stringbuffer.append(" and zyzc.ksrq < ? ");
			}
			if (queryPurVo.getJsrq() != null
					&& !"null".equals(queryPurVo.getZgkcl())
					&& queryPurVo.getJsrq().trim().length() > 0) {
				params.add(queryPurVo.getJsrq());
				stringbuffer.append(" and zyzc.jsrq > ? ");
			}
			if (queryPurVo.getQscbrq() != null
					&& !"null".equals(queryPurVo.getQscbrq())
					&& queryPurVo.getQscbrq().trim().length() > 0) {
				params.add(queryPurVo.getQscbrq());
				stringbuffer.append(" and zyzc.qscbrq  < ");
			}
			if (queryPurVo.getJscbrq() != null
					&& !"null".equals(queryPurVo.getJscbrq())
					&& queryPurVo.getJscbrq().trim().length() > 0) {
				params.add(queryPurVo.getJscbrq());
				stringbuffer.append(" and zyzc.jscbrq  > ? ");
			}
			if (queryPurVo.getQscgrq() != null
					&& !"null".equals(queryPurVo.getQscgrq())
					&& queryPurVo.getQscgrq().trim().length() > 0) {
				params.add(queryPurVo.getQscgrq());
				stringbuffer.append(" and zyzc.qscgrq  =? ");
			}
			if (queryPurVo.getJscgrq() != null
					&& !"null".equals(queryPurVo.getJscgrq())
					&& queryPurVo.getJscgrq().trim().length() > 0) {
				params.add(queryPurVo.getJscgrq());
				stringbuffer.append(" and zyzc.jscgrq  =? ");
			}
			if (queryPurVo.getBxfws() != null
					&& !"null".equals(queryPurVo.getBxfws())
					&& queryPurVo.getBxfws().trim().length() > 0) {
				params.add(queryPurVo.getBxfws());
				stringbuffer.append(" and zyzc.bxfws    =? ");
			}

			String where = stringbuffer.toString();
			String hql = "select zyzc from ZyZc zyzc  where 1=1  " + where
					+ "   ";
			return (List<ZyZc>) publicDao.find(hql, params);
		}
	}
	
	/**
	 * 根据资产Id到资产表中查找该资产信息
	 * 
	 * @param zcId
	 * @return
	 */
	public ZyZc getZyzcByZcId(String zcId) {
		List params = new ArrayList();
		String preparedHQL = "from ZyZc z where z.zcId = ?";
		params.add(zcId);
		return (ZyZc) publicDao.findSingleResult(preparedHQL, params);
	}

	/**
	 * 更新资产
	 * 
	 * @param zyzc
	 */
	public void updateZyZc(ZyZc zyzc) {
		publicDao.update(zyzc);
	}

	/**
	 * 保存资产到资产表中
	 * 
	 * @param zyzc
	 */
	public void saveZyZc(ZyZc zyzc) {
		publicDao.save(zyzc);
	}

	/**
	 * 根据资产id查找为最新的库存台账信息
	 * 
	 * @param zcId
	 * @return
	 */
	public ZyKctz findTZById(String zcId) {
		String hql = "from ZyKctz c where c.zcId = '" + zcId
				+ "' and c.sfzxjl = '1'";
		List list = publicDao.find(hql);
		if (list.size() > 0) {
			ZyKctz tz = (ZyKctz) list.get(0);
			return tz;
		} else {
			return null;
		}
	}

	/**
	 * 更改台账为旧台账
	 * 
	 * @param tzId
	 */
	public void updateTZ(String tzId) {
		String sql = "update zy_kctz set sfzxjl = '0' where kctz_id = '" + tzId
				+ "'";
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 保存台账信息
	 * 
	 * @param tz
	 */
	public void saveTZ(ZyKctz tz) {
		publicDao.save(tz);
	}

	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 
	 * @return
	 */
	public List<ZyZc> query4xubao(QueryPurchaseVo queryPurVo,
			Paginator paginator, String sheettype) {
		if (queryPurVo == null) {
			return null;
		} else {
			List resultList = new ArrayList();
			List params = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			if (queryPurVo.getYjflbm() != null
					&& !"null".equals(queryPurVo.getYjflbm())
					&& queryPurVo.getYjflbm().trim().length() > 0
					&& queryPurVo.getYjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getYjflbm());
				stringbuffer.append(" and zyzc.yjflbm  =? ");
			}
			if (queryPurVo.getEjflbm() != null
					&& !"null".equals(queryPurVo.getEjflbm())
					&& queryPurVo.getEjflbm().trim().length() > 0
					&& queryPurVo.getEjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getEjflbm());
				stringbuffer.append(" and zyzc.ejflbm  =? ");
			}
			if (queryPurVo.getSjflbm() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getSjflbm().trim().length() > 0
					&& queryPurVo.getSjflbm().compareTo("0") > 0) {
				params.add(queryPurVo.getSjflbm());
				stringbuffer.append(" and zyzc.sjflbm  =? ");
			}
			if (queryPurVo.getYjflmc() != null
					&& !"null".equals(queryPurVo.getYjflmc())
					&& queryPurVo.getYjflmc().trim().length() > 0) {
				params.add(queryPurVo.getYjflmc());
				stringbuffer.append(" and zyzc.yjflmc  =? ");
			}
			if (queryPurVo.getEjflmc() != null
					&& !"null".equals(queryPurVo.getEjflmc())
					&& queryPurVo.getEjflmc().trim().length() > 0) {
				params.add(queryPurVo.getEjflmc());
				stringbuffer.append(" and zyzc.ejflmc  =? ");
			}
			if (queryPurVo.getSjflmc() != null
					&& !"null".equals(queryPurVo.getSjflmc())
					&& queryPurVo.getSjflmc().trim().length() > 0) {
				params.add(queryPurVo.getSjflmc());
				stringbuffer.append(" and zyzc.sjflmc  =? ");
			}
			if (queryPurVo.getGg() != null
					&& !"null".equals(queryPurVo.getGg())
					&& queryPurVo.getGg().trim().length() > 0) {
				params.add("%" + queryPurVo.getGg() + "%");
				stringbuffer.append(" and zyzc.gg like ? ");
			}
			if (queryPurVo.getZcmc() != null
					&& !"null".equals(queryPurVo.getZcmc())
					&& queryPurVo.getZcmc().trim().length() > 0) {
				params.add("%" + queryPurVo.getZcmc() + "%");
				stringbuffer.append(" and zyzc.zcmc like ? ");
			}
			if (queryPurVo.getZcbh() != null
					&& !"null".equals(queryPurVo.getZcbh())
					&& queryPurVo.getZcbh().trim().length() > 0) {
				params.add(queryPurVo.getZcbh());
				stringbuffer.append(" and zyzc.zcbh = ? ");
			}
			if (queryPurVo.getZczt() != null
					&& !"null".equals(queryPurVo.getZczt())
					&& queryPurVo.getZczt().trim().length() > 0) {
				if("领用".equals(sheettype)){
					params.add(queryPurVo.getZczt());
					stringbuffer
						.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
				}else if ("借用".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '01' or zyzc.zczt = '1')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("续借".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
							.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("更换".equals(sheettype)) {
					params.add(queryPurVo.getZczt());
					stringbuffer
							.append(" and (zyzc.zczt = ? or zyzc.zczt = '借用'");
					stringbuffer
							.append(" or zyzc.zczt = '3' or zyzc.zczt = '03'");
					stringbuffer
							.append(" or zyzc.zczt = '2' or zyzc.zczt = '02')");
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
				} else if ("gooddeploy".equals(sheettype)) {
					stringbuffer
							.append(" and zyzc.yjflmc != '计算机类易耗品' and zyzc.yjflmc != '非计算机类易耗品'");
					stringbuffer
							.append(" and zyzc.zczt != '维修' and zyzc.zczt != '4' and zyzc.zczt != '04' ");
					stringbuffer
							.append(" and zyzc.zczt != '报废' and zyzc.zczt != '5' and zyzc.zczt != '05' ");
				} else {
					params.add(queryPurVo.getZczt());
					stringbuffer.append(" and zyzc.zczt = ? ");
				}
			}
			if (queryPurVo.getSfsckp() != null
					&& !"null".equals(queryPurVo.getSfsckp())
					&& queryPurVo.getSfsckp().trim().length() > 0) {
				params.add(queryPurVo.getSfsckp());
				stringbuffer.append(" and zyzc.sfsckp = ? ");
			}
			if (queryPurVo.getZdjg() != null
					&& !"null".equals(queryPurVo.getZdjg())) {
				params.add(queryPurVo.getZdjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg > ? ");
			}
			if (queryPurVo.getZgjg() != null
					&& !"null".equals(queryPurVo.getZgjg())) {
				params.add(queryPurVo.getZgjg().doubleValue());
				stringbuffer.append(" and zyzc.dzyhjg <= ? ");
			}
			if (queryPurVo.getTzlx() != null
					&& !"null".equals(queryPurVo.getTzlx())
					&& queryPurVo.getTzlx().trim().length() > 0) {
				params.add(queryPurVo.getTzlx());
				stringbuffer.append(" and zyzc.tzlx = ? ");
			}
			if (queryPurVo.getZclx() != null
					&& !"null".equals(queryPurVo.getZclx())
					&& queryPurVo.getZclx().trim().length() > 0) {
				params.add(queryPurVo.getZclx());
				stringbuffer.append(" and zyzc.zclx = ? ");
			}
			if (queryPurVo.getZcid() != null
					&& !"null".equals(queryPurVo.getZcid())
					&& queryPurVo.getZcid().trim().length() > 0) {
				params.add(queryPurVo.getZcid());
				stringbuffer.append(" and zyzc.zcId = ? ");
			}
			if (queryPurVo.getSyr() != null
					&& !"null".equals(queryPurVo.getSyr())
					&& queryPurVo.getSyr().trim().length() > 0) {
				params.add(queryPurVo.getSyr());
				stringbuffer.append(" and zyzc.syr = ? ");
			}
			if (queryPurVo.getSybm() != null
					&& !"null".equals(queryPurVo.getSybm())
					&& queryPurVo.getSybm().trim().length() > 0) {
				params.add(queryPurVo.getSybm());
				stringbuffer.append(" and zyzc.sybm = ? ");
			}
			if (queryPurVo.getGys() != null
					&& !"null".equals(queryPurVo.getGys())
					&& queryPurVo.getGys().trim().length() > 0) {
				params.add(queryPurVo.getGys());
				stringbuffer.append(" and zyzc.gys = ? ");
			}
			if (queryPurVo.getZdkcl() != null
					&& !"null".equals(queryPurVo.getZdkcl())
					&& queryPurVo.getZdkcl().trim().length() > 0) {
				params.add(queryPurVo.getZdkcl());
				stringbuffer.append(" and zyzc.zdkcl = ? ");
			}
			if (queryPurVo.getZgkcl() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getZgkcl().trim().length() > 0) {
				params.add(queryPurVo.getZgkcl());
				stringbuffer.append(" and zyzc.zgkcl = ? ");
			}
			if (queryPurVo.getQyzzrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzzrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzzrq());
				stringbuffer.append(" and zyzc.qyzzrq = ? ");
			}
			if (queryPurVo.getQyzwrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getQyzwrq().trim().length() > 0) {
				params.add(queryPurVo.getQyzwrq());
				stringbuffer.append(" and zyzc.qyzwrq = ? ");
			}
			if (queryPurVo.getKsrq() != null
					&& !"null".equals(queryPurVo.getSjflbm())
					&& queryPurVo.getKsrq().trim().length() > 0) {
				params.add(queryPurVo.getKsrq());
				stringbuffer.append(" and zyzc.ksrq <= ? ");
			}
			if (queryPurVo.getJsrq() != null
					&& !"null".equals(queryPurVo.getZgkcl())
					&& queryPurVo.getJsrq().trim().length() > 0) {
				params.add(queryPurVo.getJsrq());
				stringbuffer.append(" and zyzc.jsrq > ? ");
			}
			if (queryPurVo.getQscbrq() != null
					&& !"null".equals(queryPurVo.getQscbrq())
					&& queryPurVo.getQscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getQscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  >= to_date('"
						+ queryPurVo.getQscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getJscbrq() != null
					&& !"null".equals(queryPurVo.getJscbrq())
					&& queryPurVo.getJscbrq().trim().length() > 0) {
				// params.add("to_date('"+queryPurVo.getJscbrq()+"','yyyy-mm-dd')");
				stringbuffer.append(" and zyzc.cbrq  <= to_date('"
						+ queryPurVo.getJscbrq() + "','yyyy-mm-dd') ");
			}
			if (queryPurVo.getBxfws() != null
					&& !"null".equals(queryPurVo.getBxfws())
					&& queryPurVo.getBxfws().trim().length() > 0) {
				params.add("%" + queryPurVo.getBxfws() + "%");
				stringbuffer.append(" and zyzc.bxfws = ? ");
			}
			stringbuffer.append(" and (zyzc.yjflbm = '1' or zyzc.yjflbm = '5' ) ");
			stringbuffer.append(" order by zcId asc");
			String where = stringbuffer.toString();
			String hql = "from ZyZc zyzc  where 1=1  " + where + "";
			PageableList pageableList = null;
			try {
				if (paginator.getPageSize() == 2147483647) {
					resultList = (List<ZyZc>) publicDao.find(hql, params);
				} else {
					pageableList = publicDao.queryByHQLWithPaginator(hql,
							params, paginator);
					resultList = pageableList.getResults();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return resultList;
		}
	}
	
	public String queryExchangeZyzc(ExchangeVO exvo,Paginator paginator){
		// 拼接查询语句
		String sql = "select z.zc_id,z.yjflmc,z.ejflmc,z.sjflmc,z.zcmc,z.zcbh,z.xlh,z.sl,z.jldw,t.jybmmc," +
				"t.lybmmc,t.lyrmc,z.dzyhdj from zy_zc z,zy_kctz t where z.zc_id = t.zc_id";
		List<Object> list = new ArrayList<Object>();
		// 一级分类编码
		if (exvo.getYjflbm() != null
				&& exvo.getYjflbm().trim().length() > 0 && !"0".equals(exvo.getYjflbm())) {
			sql += " and z.yjflbm = ? ";
			list.add(exvo.getYjflbm());
		}
		// 二级分类编码
		if (exvo.getEjflbm() != null
				&& exvo.getEjflbm().trim().length() > 0 && !"0".equals(exvo.getEjflbm())) {
			sql += " and z.ejflbm = ? ";
			list.add(exvo.getEjflbm());
		}
		// 三级分类编码
		if (exvo.getSjflbm() != null
				&& exvo.getSjflbm().trim().length() > 0 && !"0".equals(exvo.getSjflbm())) {
			sql += " and z.sjflbm = ? ";
			list.add(exvo.getSjflbm());
		}
		// 资产名称
		if (exvo.getZcmc() != null
				&& exvo.getZcmc().trim().length() > 0) {
			sql += " and z.zcmc like ? ";
			list.add("%"+exvo.getSjflbm()+"%");
		}
		// 使用人
		if (exvo.getSyr() != null
				&& exvo.getSyr().trim().length() > 0) {
			sql += " and t.lyrmc like ? ";
			list.add("%"+exvo.getSyr()+"%");
		}
		// 使用部门
		if (exvo.getSybm() != null
				&& exvo.getSybm().trim().length() > 0) {
			sql += " and ( t.lybmmc like '%"+exvo.getSybm()+"%'  or  t.jybmmc like '%"+exvo.getSybm()+"%' ) ";
		}
		sql += " and z.yjflbm not in ('3','7') and zczt not in ('在库','01','1') order by z.zc_id asc";
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<ExchangeVO> resultList = new ArrayList<ExchangeVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			ExchangeVO vo = new ExchangeVO();
			vo.setZcId(String.valueOf(map.get("zc_id")));
			vo.setYjflmc(String.valueOf(map.get("yjflmc")));
			vo.setEjflmc(String.valueOf(map.get("ejflmc")));
			vo.setSjflmc(String.valueOf(map.get("sjflmc")));
			vo.setZcbh(String.valueOf(map.get("zcbh")));
			vo.setXlh(String.valueOf(map.get("xlh")));
			vo.setSl(String.valueOf(map.get("sl")));
			vo.setSyr(String.valueOf(map.get("lyrmc")));
			String jybmmc = String.valueOf(map.get("jybmmc"));
			if(jybmmc==null || "".equals(jybmmc) || "null".equals(jybmmc)){
				vo.setSybm(String.valueOf(map.get("lybmmc")));
			}else{
				vo.setSybm(String.valueOf(map.get("jybmmc")));
			}
			if(map.get("dzyhdj") != null){
				vo.setDzyhdj(Double.valueOf(String.valueOf(map.get("dzyhdj"))));
			}
			vo.setZcmc(String.valueOf(map.get("zcmc")));
			resultList.add(vo);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}
	
	public List<ZyZc> obtainZcListBySjflbm(String sjflbm){
		List<ZyZc> zyzcList = (List<ZyZc>)publicDao.find("from ZyZc where sjflbm = '"+ sjflbm +"' and zczt in ('在库','01','1')");
		return zyzcList;
	}
	
	public ZyZc getZyzcByZcbh(String zcbh){
		List<ZyZc> zyzcList = (List<ZyZc>)publicDao.find("from ZyZc where zcbh = '"+ zcbh +"'");
		return zyzcList.get(0);
	}
}
