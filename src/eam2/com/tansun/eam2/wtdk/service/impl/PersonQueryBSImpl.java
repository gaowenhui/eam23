package com.tansun.eam2.wtdk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.WdLnDptInfo;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.IPersonQueryBS;
import com.tansun.eam2.wtdk.vo.OrgQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 人员机构信息
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class PersonQueryBSImpl extends WtdkCommon implements IPersonQueryBS {
	@Autowired
	private PublicDao publicDao;

	/**
	 * 查询机构信息
	 * 
	 * @return
	 */
	public String orgQuery(OrgQueryVO orgVO, Paginator paginator) {
		// 拼接查询语句
		String sql = " select * from crt_dcc_CMBCTBCT o where 1=1 ";
		String conditionHql = this.prepareHql(orgVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(orgVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<OrgQueryVO> resultList = new ArrayList<OrgQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			OrgQueryVO org = new OrgQueryVO();
			org.setCmOpunCod(checkString(map.get("CM_OPUN_COD")).trim());
			org.setCmOpunFlmnChn(checkString(map.get("CM_OPUN_FLNM_CHN")).trim());
			org.setCmOfcCtbrh(checkString(map.get("CM_OFC_CTBRH")).trim());
			org.setCmAreaInil(checkString(map.get("CM_AREA_INIL")).trim());
			resultList.add(org);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(OrgQueryVO orgVO) {
		String hql = "";
		if (orgVO.getCmOpunCod() != null// 机构编号
				&& orgVO.getCmOpunCod().trim().length() > 0) {
			hql += " and o.CM_OPUN_COD like ? ";
		}
		if (orgVO.getCmOpunFlmnChn() != null// 机构名称
				&& orgVO.getCmOpunFlmnChn().trim().length() > 0) {
			hql += " and o.CM_OPUN_FLNM_CHN like ? ";
		}
		hql += " order by o.CM_OPUN_COD asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(OrgQueryVO orgVO) {
		List<Object> list = new ArrayList<Object>();
		if (orgVO.getCmOpunCod() != null
				&& orgVO.getCmOpunCod().trim().length() > 0) {
			list.add("%" + orgVO.getCmOpunCod() + "%");
		}
		if (orgVO.getCmOpunFlmnChn() != null
				&& orgVO.getCmOpunFlmnChn().trim().length() > 0) {
			list.add("%" + orgVO.getCmOpunFlmnChn() + "%");
		}
		return list;
	}

	/**
	 * 查询人员信息
	 * 
	 * @return
	 */
	public String perQuery(WdLnDptInfo perVO, Paginator paginator) {
		// 拼接查询语句
		String sql = " select * from WD_LN_DPT_INFO o where 1=1 ";
		String conditionHql = this.prepareHqlPer(perVO);
		sql += conditionHql;
		List<Object> list = this.prepareParamPer(perVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<WdLnDptInfo> resultList = new ArrayList<WdLnDptInfo>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			WdLnDptInfo per = new WdLnDptInfo();
			per.setDkjgbm(checkString(map.get("DKJGBM")).trim());
			per.setDkjgmc(checkString(map.get("DKJGMC")).trim());
			per.setId(checkString(map.get("ID")).trim());
			per.setRymc(checkString(map.get("RYMC")).trim());
			per.setLxfs(checkString(map.get("LXFS")).trim());
			resultList.add(per);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHqlPer(WdLnDptInfo perVO) {
		String hql = "";
		if (perVO.getRymc() != null// 人员名称
				&& perVO.getRymc().trim().length() > 0) {
			hql += " and o.RYMC like ? ";
		}
		if (perVO.getDkjgbm() != null// 机构编号
				&& perVO.getDkjgbm().trim().length() > 0) {
			hql += " and o.DKJGBM like ? ";
		}
		if (perVO.getDkjgmc() != null// 机构名称
				&& perVO.getDkjgmc().trim().length() > 0) {
			hql += " and o.DKJGMC like ? ";
		}
		hql += " order by o.ID asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParamPer(WdLnDptInfo orgVO) {
		List<Object> list = new ArrayList<Object>();
		if (orgVO.getRymc() != null && orgVO.getRymc().trim().length() > 0) {
			list.add("%" + orgVO.getRymc() + "%");
		}
		if (orgVO.getDkjgbm() != null && orgVO.getDkjgbm().trim().length() > 0) {
			list.add("%" + orgVO.getDkjgbm() + "%");
		}
		if (orgVO.getDkjgmc() != null && orgVO.getDkjgmc().trim().length() > 0) {
			list.add("%" + orgVO.getDkjgmc() + "%");
		}
		return list;
	}

	/**
	 * 保存人员信息
	 * 
	 * @param perVO
	 */
	public void savePer(WdLnDptInfo perVO) {
		publicDao.save(perVO);
	}

	/**
	 * 根据Id查找人员信息
	 * 
	 * @return
	 */
	public WdLnDptInfo findPerInfoById(String id) {
		return (WdLnDptInfo) publicDao.findById(WdLnDptInfo.class, id);
	}

	/**
	 * 修改人员信息
	 * 
	 * @param perVO
	 */
	public void updatePer(WdLnDptInfo perVO) {
		publicDao.update(perVO);
	}

	/**
	 * 删除人员信息
	 * 
	 * @param ids
	 */
	public void deletePerson(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			String id = ids[i];
			String sql = "delete from wd_ln_dpt_info where id= '" + id + "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

}
