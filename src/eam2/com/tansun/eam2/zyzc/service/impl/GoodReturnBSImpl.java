package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.GoodReturnBS;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class GoodReturnBSImpl implements GoodReturnBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 归还物品查询
	 */
	public String queryReturn(QueryPurchaseVo queryVO, Paginator paginator) {
		String sql = "";
		if ("0".equals(queryVO.getGhlx())) {
			sql = "select distinct z.ZC_ID,z.YJFLMC,z.ZCBH,z.ZCMC,z.GG,z.JLDW,k.LYBMMC,"
					+ "k.JYBMMC,k.LYRMC,k.LYRQ,k.JYTS from ZY_ZC z,ZY_KCTZ k where z.ZC_ID = k.ZC_ID"
					+ " and k.SFZXJL = '1' and (z.zczt = '03' or z.zczt = '3' or z.zczt = '领用') and "
					+ " z.YJFLBM != '7' and z.YJFLBM != '3' ";
		} else if ("1".equals(queryVO.getGhlx())) {
			sql = "select distinct z.ZC_ID,z.YJFLMC,z.ZCBH,z.ZCMC,z.GG,z.JLDW,k.LYBMMC,"
					+ "k.JYBMMC,k.LYRMC,k.LYRQ,k.JYTS from ZY_ZC z,ZY_KCTZ k where z.ZC_ID = k.ZC_ID"
					+ " and k.SFZXJL = '1' and (z.zczt = '02' or z.zczt = '2' or z.zczt = '借用') and "
					+ " z.YJFLBM != '7' and z.YJFLBM != '3' ";
		}
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		try {
			PageableList pageableList = this.publicDao.queryForList(sql, list,
					paginator);
			List queryList = pageableList.getResults();
			List<QueryPurchaseVo> resultList = new ArrayList<QueryPurchaseVo>();
			// 进行属性拷贝
			for (int i = 0; i < queryList.size(); i++) {
				Map map = (Map) queryList.get(i);
				QueryPurchaseVo vo = new QueryPurchaseVo();
				vo.setZcid(checkString(map.get("ZC_ID")));
				vo.setYjflmc(checkString(map.get("YJFLMC")));
				vo.setZcbh(checkString(map.get("ZCBH")));
				vo.setZcmc(checkString(map.get("ZCMC")));
				vo.setGg(checkString(map.get("GG")));
				vo.setJldw(checkString(map.get("JLDW")));
				if ("0".equals(queryVO.getGhlx())) {
					vo.setSybmmc(checkString(map.get("LYBMMC")));
				} else if ("1".equals(queryVO.getGhlx())) {
					vo.setSybmmc(checkString(map.get("JYBMMC")));
				}
				vo.setSyrmc(checkString(map.get("LYRMC")));
				vo.setSyrq(checkString(map.get("LYRQ")));
				vo.setSyts(checkString(map.get("JYTS")));
				resultList.add(vo);
			}
			String json = BodyListToJSON.getJSON(resultList, paginator
					.getPageCount(), paginator.getCurrentPage(), paginator
					.getCount());
			return json;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * 拼接查询语句
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(QueryPurchaseVo queryPurVo) {
		String hql = "";
		if (queryPurVo.getYjflbm() != null
				&& !"null".equals(queryPurVo.getYjflbm())
				&& queryPurVo.getYjflbm().trim().length() > 0
				&& queryPurVo.getYjflbm().compareTo("0") > 0) {
			hql += " and z.YJFLBM = ? ";
		}
		if (queryPurVo.getEjflbm() != null
				&& !"null".equals(queryPurVo.getEjflbm())
				&& queryPurVo.getEjflbm().trim().length() > 0
				&& queryPurVo.getEjflbm().compareTo("0") > 0) {
			hql += " and z.EJFLBM = ? ";
		}
		if (queryPurVo.getSjflbm() != null
				&& !"null".equals(queryPurVo.getSjflbm())
				&& queryPurVo.getSjflbm().trim().length() > 0
				&& queryPurVo.getSjflbm().compareTo("0") > 0) {
			hql += " and z.SJFLBM = ? ";
		}
		if (queryPurVo.getGg() != null && !"null".equals(queryPurVo.getGg())
				&& queryPurVo.getGg().trim().length() > 0) {
			hql += " and z.GG like ? ";
		}
		if (queryPurVo.getZcmc() != null
				&& !"null".equals(queryPurVo.getZcmc())
				&& queryPurVo.getZcmc().trim().length() > 0) {
			hql += " and z.ZCMC like ? ";
		}
		if (queryPurVo.getSybmmc() != null
				&& !"null".equals(queryPurVo.getSybmmc())
				&& queryPurVo.getSybmmc().trim().length() > 0) {
			if ("0".equals(queryPurVo.getGhlx())) {
				hql += " and k.LYBMMC like ? ";
			} else if ("1".equals(queryPurVo.getGhlx())) {
				hql += " and k.SYBMMC like ? ";
			}
		}
		if (queryPurVo.getSyrmc() != null
				&& !"null".equals(queryPurVo.getSyrmc())
				&& queryPurVo.getSyrmc().trim().length() > 0) {
			hql += " and k.LYRMC like ? ";
		}
		if (queryPurVo.getSyrqc() != null
				&& !"null".equals(queryPurVo.getSyrqc())
				&& queryPurVo.getSyrqc().trim().length() > 0) {
			hql += " and k.LYRQ >= to_date('" + queryPurVo.getSyrqc()
					+ "','yyyy-mm-dd') ";
		}
		if (queryPurVo.getSyrqz() != null
				&& !"null".equals(queryPurVo.getSyrqz())
				&& queryPurVo.getSyrqz().trim().length() > 0) {
			hql += " and k.LYRQ <= to_date('" + queryPurVo.getSyrqz()
					+ "','yyyy-mm-dd') ";
		}

		if (queryPurVo.getSytsc() != null
				&& !"null".equals(queryPurVo.getSytsc())
				&& queryPurVo.getSytsc().trim().length() > 0) {
			hql += " and k.JYTS >= ? ";
		}
		if (queryPurVo.getSytsz() != null
				&& !"null".equals(queryPurVo.getSytsz())
				&& queryPurVo.getSytsz().trim().length() > 0) {
			hql += " and k.JYTS <= ? ";
		}
		hql += "order by z.ZC_ID asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(QueryPurchaseVo queryPurVo) {
		List<Object> list = new ArrayList<Object>();
		if (queryPurVo.getYjflbm() != null
				&& !"null".equals(queryPurVo.getYjflbm())
				&& queryPurVo.getYjflbm().trim().length() > 0
				&& queryPurVo.getYjflbm().compareTo("0") > 0) {
			list.add(queryPurVo.getYjflbm());
		}
		if (queryPurVo.getEjflbm() != null
				&& !"null".equals(queryPurVo.getEjflbm())
				&& queryPurVo.getEjflbm().trim().length() > 0
				&& queryPurVo.getEjflbm().compareTo("0") > 0) {
			list.add(queryPurVo.getEjflbm());
		}
		if (queryPurVo.getSjflbm() != null
				&& !"null".equals(queryPurVo.getSjflbm())
				&& queryPurVo.getSjflbm().trim().length() > 0
				&& queryPurVo.getSjflbm().compareTo("0") > 0) {
			list.add(queryPurVo.getSjflbm());
		}
		if (queryPurVo.getGg() != null && !"null".equals(queryPurVo.getGg())
				&& queryPurVo.getGg().trim().length() > 0) {
			list.add("%" + queryPurVo.getGg() + "%");
		}
		if (queryPurVo.getZcmc() != null
				&& !"null".equals(queryPurVo.getZcmc())
				&& queryPurVo.getZcmc().trim().length() > 0) {
			list.add("%" + queryPurVo.getZcmc() + "%");
		}
		if (queryPurVo.getSybmmc() != null
				&& !"null".equals(queryPurVo.getSybmmc())
				&& queryPurVo.getSybmmc().trim().length() > 0) {
			list.add("%" + queryPurVo.getSybmmc() + "%");
		}
		if (queryPurVo.getSyrmc() != null
				&& !"null".equals(queryPurVo.getSyrmc())
				&& queryPurVo.getSyrmc().trim().length() > 0) {
			list.add("%" + queryPurVo.getSyrmc() + "%");
		}
		if (queryPurVo.getSytsc() != null
				&& !"null".equals(queryPurVo.getSytsc())
				&& queryPurVo.getSytsc().trim().length() > 0) {
			list.add(queryPurVo.getSytsc());
		}
		if (queryPurVo.getSytsz() != null
				&& !"null".equals(queryPurVo.getSytsz())
				&& queryPurVo.getSytsz().trim().length() > 0) {
			list.add(queryPurVo.getSytsz());
		}
		return list;
	}

	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl() {
		Map<String, String> map = new HashMap<String, String>();
		List flList = publicDao
				.find("from DicAppAssettype1 t where t.assettype1Id != '7'"
						+ " and t.assettype1Id != '3' ");
		Iterator iterator = flList.iterator();
		while (iterator.hasNext()) {
			DicAppAssettype1 dicAppAssettype1 = (DicAppAssettype1) iterator
					.next();
			map.put(dicAppAssettype1.getAssettype1Id(), dicAppAssettype1
					.getTypename());
		}
		// String sql = "select t.assettype1_id, t.typename from
		// dic_app_assettype1 t "
		// + "where t.assettype1_id != '7' and t.assettype1_id != '3'";
		return map;
	}

	/**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}

	/**
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Double checkDouble(Object obj) {
		Double dou = 0D;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0D;
		} else {
			dou = Double.valueOf(String.valueOf(obj));
		}
		return dou;
	}

}
