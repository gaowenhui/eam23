package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zccz.NoticeCommon;
import com.tansun.eam2.zccz.service.INoticeQueryBS;
import com.tansun.eam2.zccz.vo.STZCqueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 处置公告查询
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
@Service
public class NoticeQueryBSImpl extends NoticeCommon implements INoticeQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 查询处置实体
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryST(STZCqueryVO queryVO, Paginator paginator) {
		String sql = "select * from cz_stcztz o where LCMC = '实体整体处置' ";
		String conditionHql = this.stHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.stParam(queryVO);
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			STZCqueryVO vo = new STZCqueryVO();
			vo.setId(checkString(map.get("ID")).trim()); // id
			vo.setStbh(checkString(map.get("ZCBH")).trim()); // 资产编号
			vo.setStmc(checkString(map.get("STMC")).trim()); // 实体名称
			vo.setStlx(findSTLX(checkString(map.get("STLX")).trim())); // 实体类型
			vo.setStxz(findCoteNameByCoteKey("ENTITY_CURRENT_STATUS", // 实体现状
					checkString(map.get("STXZ")).trim()));
			vo.setStscsf(findCoteNameByCoteKey("PROVIENCE", checkString( // 实体所处省份
					map.get("STSCSF")).trim()));
			resultList.add(vo);
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
	private String stHql(STZCqueryVO queryVO) {
		String hql = "";
		if (queryVO.getStmc() != null && queryVO.getStmc().trim().length() > 0) {
			hql += " and o.stmc like ? "; // 实体名称
		}
		if (queryVO.getStbh() != null && queryVO.getStbh().trim().length() > 0) {
			hql += " and o.zcbh like ? "; // 资产编号
		}
		if (queryVO.getStlx() != null && queryVO.getStlx().trim().length() > 0) {
			hql += " and o.stlx = ? "; // 实体类型
		}
		hql += " order by o.id asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> stParam(STZCqueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		if (queryVO.getStmc() != null && queryVO.getStmc().trim().length() > 0) {
			list.add("%" + queryVO.getStmc() + "%"); // 实体名称
		}
		if (queryVO.getStbh() != null && queryVO.getStbh().trim().length() > 0) {
			list.add("%" + queryVO.getStbh() + "%"); // 资产编号
		}
		if (queryVO.getStlx() != null && queryVO.getStlx().trim().length() > 0) {
			list.add("" + queryVO.getStlx() + ""); // 实体类型
		}
		return list;
	}

	/**
	 * 查询处置资产
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZC(STZCqueryVO queryVO, Paginator paginator) {
		String sql = "";
		if ("0".equals(queryVO.getZcfl()) || "5".equals(queryVO.getZcfl())
				|| "6".equals(queryVO.getZcfl())) {
			sql = "select ID as id,AZCBH as zcbh,AZCMC as zcmc,ZCLB as zclb,C_CZFS as czfs,APGJZ as pgz"
					+ " from cz_zc_xx where 1=1 ";
		} else if ("1".equals(queryVO.getZcfl())) {
			sql = "select ID as id,BZCBH as zcbh,BZCMC as zcmc,ZCLB as zclb,C_CZFS as czfs,BPGZ as pgz"
					+ " from cz_zc_xx where 1=1 ";
		} else if ("2".equals(queryVO.getZcfl())) {
			sql = "select ID as id,CZCBH as zcbh,CZCMC as zcmc,ZCLB as zclb,C_CZFS as czfs,CPGZ as pgz"
					+ " from cz_zc_xx where 1=1 ";
		} else if ("4".equals(queryVO.getZcfl())) {
			sql = "select ID as id,ZYZCBH as zcbh,ZYZCMC as zcmc,ZCLB as zclb,C_CZFS as czfs"
					+ " from cz_zc_xx where 1=1 ";
		}
		String conditionHql = this.zcHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.zcParam(queryVO);
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			STZCqueryVO vo = new STZCqueryVO();
			vo.setId(checkString(map.get("ID")).trim()); // id
			vo.setZcbh(checkString(map.get("zcbh")).trim()); // 资产编号
			vo.setZcmc(checkString(map.get("zcmc")).trim()); // 资产名称
			vo.setZcfl(findZCLBbyNo(checkString(map.get("zclb")).trim())); // 资产分类
			vo.setPgz(checkDouble(map.get("pgz"))); // 评估值
			vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
					checkString(map.get("czfs")).trim())); // 处置方式
			resultList.add(vo);
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
	private String zcHql(STZCqueryVO queryVO) {
		String hql = "";
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			if ("0".equals(queryVO.getZcfl()) || "5".equals(queryVO.getZcfl())
					|| "6".equals(queryVO.getZcfl())) {
				hql += " and AZCMC like ? ";
			} else if ("1".equals(queryVO.getZcfl())) {
				hql += " and BZCMC like ? ";
			} else if ("2".equals(queryVO.getZcfl())) {
				hql += " and CZCMC like ? ";
			} else if ("4".equals(queryVO.getZcfl())) {
				hql += " and ZYZCMC like ? ";
			}
		}
		// 资产编号
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			if ("0".equals(queryVO.getZcfl()) || "5".equals(queryVO.getZcfl())
					|| "6".equals(queryVO.getZcfl())) {
				hql += " and AZCBH like ? ";
			} else if ("1".equals(queryVO.getZcfl())) {
				hql += " and BZCBH like ? ";
			} else if ("2".equals(queryVO.getZcfl())) {
				hql += " and CZCBH like ? ";
			} else if ("4".equals(queryVO.getZcfl())) {
				hql += " and ZYZCBH like ? ";
			}
		}
		// 资产分类
		if (queryVO.getZcfl() != null && queryVO.getZcfl().trim().length() > 0) {
			hql += " and ZCLB = ? ";
		}
		hql += " order by id asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> zcParam(STZCqueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			list.add("%" + queryVO.getZcmc() + "%");
		}
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			list.add("%" + queryVO.getZcbh() + "%");
		}
		if (queryVO.getZcfl() != null && queryVO.getZcfl().trim().length() > 0) {
			list.add("" + queryVO.getZcfl() + "");
		}
		return list;
	}

	/**
	 * 查询处置债券
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZQ(STZCqueryVO queryVO, Paginator paginator) {
		String sql = "select ID,FZQXMMC,ZQZLMC,ZQMC,c_czfs,JHFHMC,TO_CHAR(DQR,'yyyy-mm-dd') as DQRQ"
				+ " from cz_zc_xx o where ZCLB = '7' ";
		String conditionHql = this.zqHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.zqParam(queryVO);
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			STZCqueryVO vo = new STZCqueryVO();
			vo.setId(checkString(map.get("ID")).trim()); // id
			vo.setXmmc(checkString(map.get("FZQXMMC")).trim()); // 项目名称
			vo.setZqzlmc(checkString(map.get("ZQZLMC")).trim()); // 债券种类名称
			vo.setZqmc(checkString(map.get("ZQMC")).trim()); // 债券名称
			vo.setHm(checkString(map.get("JHFHMC")).trim()); // 行名
			vo.setDqr(checkString(map.get("DQRQ")).trim()); // 到期日
			vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
					checkString(map.get("c_czfs")).trim())); // 处置方式
			resultList.add(vo);
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
	private String zqHql(STZCqueryVO queryVO) {
		String hql = "";
		if (queryVO.getXmmc() != null && queryVO.getXmmc().trim().length() > 0) {
			hql += " and o.FZQXMMC like ? "; // 项目名称
		}
		if (queryVO.getHm() != null && queryVO.getHm().trim().length() > 0) {
			hql += " and o.JHFHMC like ? "; // 行名
		}
		if (queryVO.getZqzlmc() != null
				&& queryVO.getZqzlmc().trim().length() > 0) {
			hql += " and o.ZQZLMC like ? "; // 债券种类名称
		}
		if (queryVO.getZqmc() != null && queryVO.getZqmc().trim().length() > 0) {
			hql += " and o.ZQMC like ? "; // 债券名称
		}
		hql += " order by o.id asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> zqParam(STZCqueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		if (queryVO.getXmmc() != null && queryVO.getXmmc().trim().length() > 0) {
			list.add("%" + queryVO.getXmmc() + "%"); // 项目名称
		}
		if (queryVO.getHm() != null && queryVO.getHm().trim().length() > 0) {
			list.add("%" + queryVO.getHm() + "%"); // 行名
		}
		if (queryVO.getZqzlmc() != null
				&& queryVO.getZqzlmc().trim().length() > 0) {
			list.add("%" + queryVO.getZqzlmc() + "%"); // 债券种类名称
		}
		if (queryVO.getZqmc() != null && queryVO.getZqmc().trim().length() > 0) {
			list.add("%" + queryVO.getZqmc() + "%"); // 债券名称
		}
		return list;
	}

}
