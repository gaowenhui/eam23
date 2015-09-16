package com.tansun.eam2.jygdzc.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtBxzcgx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzj;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzjLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqxBody;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlHead;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.jygdzc.JygdzcCommon;
import com.tansun.eam2.jygdzc.action.LiquidateContract;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.service.IContractBS;
import com.tansun.eam2.jygdzc.service.ILiquidateBS;
import com.tansun.eam2.jygdzc.vo.ClearQueryVO;
import com.tansun.eam2.jygdzc.vo.HtViewVOZC;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxHtView;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzcHtqxBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO2;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.file.service.IAttachHandleService;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

@Service
public class ContractBSImpl implements IContractBS {
	@Autowired
	public PublicDao publicDao;
	@Autowired
	private LiquidateContract liquidate;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	IAttachHandleService attachHandleServiceImpl;
	@Autowired
	private ILiquidateBS liquidateBS;
	@Autowired
	private IAssetBS assetBS;
	@Autowired 
	public ICodeGenerator iCodeGenerator;
	/**
	 * 保存新增卡片表头
	 * 
	 * @param caShead
	 */
	public void save(JyzcHead jyzcHead) {
		publicDao.save(jyzcHead);
	}

	/**
	 * 更新新增卡片表头
	 * 
	 * @param caShead
	 */
	public void update(JyzcHead jyzcHead) {
		publicDao.update(jyzcHead);
	}

	/**
	 * 更新新增卡片表头
	 * 
	 * @param caShead
	 */
	public void delete(JyzcHead jyzcHead) {
		publicDao.delete(jyzcHead);
	}

	/**
	 * 保存临时表体
	 * 
	 * @param caShead
	 */
	public void save(JyzcXxLsb jyzcXxLsb) {
		publicDao.save(jyzcXxLsb);
	}

	/**
	 * 更新表头表头
	 * 
	 * @param caShead
	 */
	public void update(JyzcXxLsb jyzcXxLsb) {
		publicDao.update(jyzcXxLsb);
	}

	/**
	 * 删除表体
	 * 
	 * @param caShead
	 */
	public void delete(JyzcXxLsb jyzcXxLsb) {
		publicDao.delete(jyzcXxLsb);
	}

	/**
	 * 根据HeadId 查找到所有的值
	 * 
	 * @param caShead
	 */
	public List<JyzcXxLsb> getJyzcXxLsbsByHeadId(String headId) {
		String hql = "from JyzcXxLsb o where o.cldId=?";
		List<JyzcXxLsb> ret = (List<JyzcXxLsb>) publicDao.find(hql,
				new String[] { headId });
		return ret;
	}

	/**
	 * 根据封装好的查询bo返回符合条件的list（目前需要实现资产编号和资产名称）
	 * 
	 * @param jyXx
	 * @return
	 */
	public List<JyzcXx> queryByBO(JyzcXx jyXx) {
		List<JyzcXx> resultList = new ArrayList();
		List params = new ArrayList();
		StringBuffer strHQL = new StringBuffer();
		strHQL.append("from JyzcXx o where 1=1 ");
		if (jyXx.getZcbh() != null && jyXx.getZcbh().trim().length() > 0) {
			strHQL.append(" and o.zxbh = ? ");
			params.add(jyXx.getZcbh());
		}
		if (jyXx.getZcmc() != null && jyXx.getZcmc().trim().length() > 0) {
			strHQL.append(" and o.zcmc = ?  ");
			params.add(jyXx.getZcmc());
		}
		resultList = (List<JyzcXx>) publicDao.find(strHQL.toString(), params);

		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

	/**
	 * 删除JjzcHtZlwgLsb的信息 同时删除挂接的JjzcHtJdzj的数据
	 * 
	 * @param wgIds
	 */
	public void deleteJjzcHtZlwgLsb(String[] wgIds) {
		for (int i = 0; i < wgIds.length; i++) {
			String preparedHQL1 = "from JjzcHtZlwgLsb o where o.id =?";
			String preparedHQL2 = "from JjzcHtJdzj o where  o.htId = ?";
			List params = new ArrayList();
			params.add(wgIds[i]);
			JjzcHtZlwgLsb jjzcHtZlwgLsb = (JjzcHtZlwgLsb) publicDao .findSingleResult(preparedHQL1, params);
			JjzcHtJdzj jjzcHtJdzj = (JjzcHtJdzj) publicDao.findSingleResult( preparedHQL2, params);
			publicDao.delete(jjzcHtZlwgLsb);
			publicDao.delete(jjzcHtJdzj);
		}
	}

	/**
	 * 
	 * 根据合同保险的查询条件查询 需要根据合同的类型来作区分
	 * 
	 * 如果合同类型类型没有值的话 要查出来委管合同和保险的信息项
	 * 
	 * 如果是委管合同 委管合同的情况 需要查出来 JJZC_HT_ZLWG ×
	 * 
	 * 如果是车险合同 非车险合同的情况 需要查出来 JJZC_HT_BX
	 * 
	 * @param queryvo
	 *            查询条件组成的bo对象
	 * @return 展示查询出来的view对象
	 */

	public String getJjzcHtBxHtViewByCondition(
			JjzcHtBxQueryVO queryBO, Paginator paginator) {
		
		if (paginator == null || queryBO == null) {
			return null;
		}
		List params = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String preparSQLALL = "select a.ID, a.HTBH,a.ZCBH,a.ZCMC,a.HTQSRQ,a.HTDQRQ ,a.C_HTZT,a.C_HTLX from (select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ ,C_HTZT,HTLX as C_HTLX from jjzc_ht_bx union select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ  ,C_HTZT,C_HTLX from  JJZC_HT_ZLWG ) a,jyzc_xx b where 1=1 and  a.zcmc is not null and a.zcbh = b.zcbh ";
		String preparSQLBX = "select a.ID, a.HTBH,a.ZCBH,a.ZCMC,a.HTQSRQ,a.HTDQRQ ,a.C_HTZT,a.HTLX  as a.C_HTLX from jjzc_ht_bx a,jyzc_xx b where 1=1   and a.zcmc is not null and a.zcbh = b.zcbh    ";
		String preparSQLZL = "select a.ID, a.HTBH,a.ZCBH,a.ZCMC,a.HTQSRQ,a.HTDQRQ ,a.C_HTZT,a.C_HTLX   from JJZC_HT_ZLWG a,jyzc_xx b where 1=1   and a.zcmc is not null and a.zcbh = b.zcbh  ";
		String sql = "";
		String strHTLX = queryBO.getHtlx();
		// 如果合同类型类型没有值的话 要查出来委管合同和保险的信息项 JJZC_HT_ZLWG + JJZC_HT_BX
		if (strHTLX == null || "0".equals(strHTLX) || " ".equals(strHTLX)) {
			sql = preparSQLALL;
		} else if ("1".equals(strHTLX) || "2".equals(strHTLX)) {// 委管合同 委管合同
			sql = preparSQLZL;
		} else {
			// 如果是车险合同 非车险合同
			sql = preparSQLBX;
		}
		
		//二级委托代理机构
		if(queryBO.getCerwtjg()!=null){
			params.add(queryBO.getCerwtjg());
			strWhere.append(" and b.c_erwtjg = ? ");
		}
		//一级委托代理机构
		if(queryBO.getCyjwtjg()!=null){
			params.add(queryBO.getCyjwtjg());
			strWhere.append(" and b.c_yjwtjg = ? ");
		}		
		// 合同编码
		if (queryBO.getHtbm() != null && queryBO.getHtbm().trim().length() > 0) {
			params.add("%"+queryBO.getHtbm()+"%");
			strWhere.append(" and a.HTBH  like ? ");
		}
		// 合同状态
		if (queryBO.getHtzt() != null && queryBO.getHtzt().trim().length() > 0
				&& !"0".equals(queryBO.getHtzt())) {
			params.add(queryBO.getHtzt());
			if (strHTLX == null || "0".equals(strHTLX) || " ".equals(strHTLX)) {
				strWhere.append(" and a.C_HTZT  = ? ");
			} else if ("1".equals(strHTLX) || "2".equals(strHTLX)) {
				strWhere.append(" and a.C_HTLX  = ? ");
			} else {
				// 车险合同 非车险合同
				strWhere.append(" and a.C_HTZT  = ? ");
			}
		}
		// 合同类型
		if (queryBO.getHtlx() != null && queryBO.getHtlx().trim().length() > 0) {
			params.add(queryBO.getHtlx());
			if (strHTLX == null || "0".equals(strHTLX) || " ".equals(strHTLX)) {
				strWhere.append(" and a.c_htlx  = ? ");
			} else if ("1".equals(strHTLX) || "2".equals(strHTLX)) {
				strWhere.append(" and a.c_htlx  = ? ");
			} else {
				// 车险合同 非车险合同
				strWhere.append(" and a.htlx  = ? ");
			}
		}
		// 资产编码
		if (queryBO.getZcbm() != null && queryBO.getZcbm().trim().length() > 0) {
			params.add("%"+queryBO.getZcbm()+"%");
			strWhere.append(" and a.zcbh  like ? ");
		}
		// 资产名称
		if (queryBO.getZcmc() != null && queryBO.getZcmc().trim().length() > 0) {
			params.add("%"+queryBO.getZcmc()+"%");
			strWhere.append(" and a.zcmc  like ? ");
		}
		// 合同起始日期
		if (queryBO.getBeginTime1() != null) {
			params.add(queryBO.getBeginTime1());
			strWhere.append(" and a.HTQSRQ  >= ? ");
		}
		if (queryBO.getBeginTime2() != null) {
			params.add(queryBO.getBeginTime2());
			strWhere.append(" and a.HTQSRQ  < ? ");
		}
		// 合同结束日期
		if (queryBO.getEndTime1() != null) {
			params.add(queryBO.getEndTime1());
			strWhere.append(" and a.HTDQRQ  >= ? ");
		}
		if (queryBO.getEndTime2() != null) {
			params.add(queryBO.getEndTime2());
			strWhere.append(" and a.HTDQRQ  < ? ");
		}
		// 交易对象
		if (queryBO.getJydx() != null && queryBO.getJydx().trim().length() > 0) {
			params.add(queryBO.getJydx());
			strWhere.append(" and a.jydx  = ? ");
		}
		sql = sql + strWhere.toString() + " order by HTBH desc ";
		PageableList pageableList = this.publicDao.queryForList(sql, params,
				paginator);

		List listTemp = pageableList.getResults();
		List<JjzcHtBxHtView> resultList = new ArrayList<JjzcHtBxHtView>();
		for (int i = 0; i < listTemp.size(); i++) {
			Map map = (Map) listTemp.get(i);
			JjzcHtBxHtView jjzcHtBxHtView = new JjzcHtBxHtView();
			jjzcHtBxHtView.setId(String.valueOf(map.get("ID")));
			jjzcHtBxHtView.setZcmc(String.valueOf(map.get("ZCMC")));
			jjzcHtBxHtView.setHtbm(String.valueOf(map.get("HTBH")));
			jjzcHtBxHtView.setZcbm(String.valueOf(map.get("ZCBH")));
			jjzcHtBxHtView.setBeginTime(DateUtils.parseDate(String.valueOf(map
					.get("HTQSRQ"))));
			jjzcHtBxHtView.setEndTime(DateUtils.parseDate(String.valueOf(map
					.get("HTDQRQ"))));
			jjzcHtBxHtView.setHtzt(String.valueOf(map.get("C_HTZT")));
			jjzcHtBxHtView.setHtlx(String.valueOf(map.get("C_HTLX")));
			resultList.add(jjzcHtBxHtView);
		}
		String json = "";
		if(resultList.size()==0){
			json = BodyListToJSON.getJSON(resultList, 0, 0, 0);
		}else {
			json = BodyListToJSON.getJSON(resultList, paginator.getPageCount(),
  		paginator.getCurrentPage(), paginator.getCount());
		}
		return json;
	}

	
	//根据合同Id得到该合同的所有信息
	public List<JjzcHtBxHtView> getJjzcHtBxHtViewByCondition(JjzcHtBxQueryVO queryVo,String ids) {
		List<JjzcHtBxHtView> resultList = new ArrayList<JjzcHtBxHtView>();
		String preparSQLALL = "select * from (select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ ,C_HTZT,HTLX as C_HTLX   from  jjzc_ht_bx  where ID in ("+IdStrFormat.formatIds(ids)+")  union  select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ  ,C_HTZT,C_HTLX from  JJZC_HT_ZLWG  where ID in ("+IdStrFormat.formatIds(ids)+")) where 1=1 and  zcmc is not null order by zcbh asc ";
		String preparSQLBX = "select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ ,C_HTZT,HTLX  as C_HTLX from jjzc_ht_bx where 1=1   and zcmc is not null  where ID in ("+IdStrFormat.formatIds(ids)+") order by o.zcbh asc";
		String preparSQLZL = "select ID, HTBH,ZCBH,ZCMC,HTQSRQ,HTDQRQ ,C_HTZT,C_HTLX   from JJZC_HT_ZLWG where 1=1   and zcmc is not null  where ID in ("+IdStrFormat.formatIds(ids)+") order by o.zcbh asc";
		String sql = "";
		String strHTLX = queryVo.getHtlx();
		// 如果合同类型类型没有值的话 要查出来委管合同和保险的信息项 JJZC_HT_ZLWG + JJZC_HT_BX
		if (strHTLX == null || "0".equals(strHTLX) || " ".equals(strHTLX)) {
			sql = preparSQLALL;
		} else if ("1".equals(strHTLX) || "2".equals(strHTLX)) {// 委管合同 委管合同
			sql = preparSQLZL;
		} else {
			// 如果是车险合同 非车险合同
			sql = preparSQLBX;
		}
		
		List params = new ArrayList();
		List list=publicDao.queryForList(sql.toString(),params);

	for (int i = 0; i < list.size(); i++) {
		Map map = (Map) list.get(i);
		JjzcHtBxHtView jjzcHtBxHtView = new JjzcHtBxHtView();
		jjzcHtBxHtView.setId(String.valueOf(map.get("ID")));
		jjzcHtBxHtView.setZcmc(String.valueOf(map.get("ZCMC")));
		jjzcHtBxHtView.setHtbm(String.valueOf(map.get("HTBH")));
		jjzcHtBxHtView.setZcbm(String.valueOf(map.get("ZCBH")));
		jjzcHtBxHtView.setBeginTime(DateUtils.parseDate(String.valueOf(map
				.get("HTQSRQ"))));
		jjzcHtBxHtView.setEndTime(DateUtils.parseDate(String.valueOf(map
				.get("HTDQRQ"))));
		jjzcHtBxHtView.setHtzt(String.valueOf(map.get("C_HTZT")));
		jjzcHtBxHtView.setHtlx(String.valueOf(map.get("C_HTLX")));
		resultList.add(jjzcHtBxHtView);
	}
		return resultList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * JJZC_HT_JDZJ 保存JjzcHtZlwgLsb的数据 && 保存JjzcHtJdzj的数据
	 * 
	 * @param
	 */

	public List<JyzcHtqxBodyVO> getBodyByCldId(String cldId) {
		List<JyzcHtqxBody> tempList = new ArrayList();
		List<JyzcHtqxBodyVO> resultList = new ArrayList();
		tempList = (List<JyzcHtqxBody>) publicDao
				.find("from JyzcHtqxBody o  where o.cldId =? ");
		if (tempList.size() == 0) {
			return null;
		} else {
			for (int i = 0; i < tempList.size(); i++) {
				JyzcHtqxBodyVO jyzcHtqxBodyVO = new JyzcHtqxBodyVO();
				JyzcHtqxBody jyzcHtqxBody = tempList.get(i);
				try {
					BeanUtils.copyProperties(jyzcHtqxBodyVO,jyzcHtqxBody );
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				resultList.add(jyzcHtqxBodyVO);
			}
		}
		return resultList;
	}

	public List<JyzcHtqxBody> getByCldId(String cldId) {

		List<JyzcHtqxBody> resultList = new ArrayList<JyzcHtqxBody>();
		resultList = (List<JyzcHtqxBody>) publicDao
				.find("from JyzcHtqxBody o  where o.cldId =? ");
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

	/**
	 * 
	 * 得到资产的变动信息
	 * 
	 * @param JjzcHtZlwglsb
	 * @param jjzcHtZlwg
	 * @return
	 */

	public JjzcHtBx getChangeInfo(JjzcHtZlwgLsb jjzcHtZlwglsb,
			JjzcHtZlwg jjzcHtZlwg) {
		JjzcHtBx jjzcHtBx = new JjzcHtBx();
		return jjzcHtBx;
	}

	public JjzcHtZlwgLsb getJjzcHtZlwgLsbById(String id) {
		return publicDao.findById(JjzcHtZlwgLsb.class, id);
	}

	public List<JjzcHtBx> getJjzcHtBxsByWgId(String wgId) {
		List<JjzcHtBx> resultList = new ArrayList();
		List params = new ArrayList();
		params.add(wgId);
		resultList = (List<JjzcHtBx>) publicDao.find(
				"from JjzcHtBx where wgId=? ", params);
		if (resultList.size() == 0) {
			resultList = null;
		}
		return resultList;
	}

	/**
	 * 清算查询 
	 * @author modify by lantianbo 12-26
	 */
	public String getJjzcHtViewByCondition(ClearQueryVO queryvo,Paginator paginator) {
		String sql = new StringBuffer("")
		.append(" SELECT H.ID, H.QSPC,  H.QSLX, H.YWLX, H.SSTZZJE,H.THSSZJE, ")
		.append(" TO_CHAR(H.NGRQ,'yyyy-MM-dd') NGRQ, H.YSYFZJE, H.TZZJE, H.THYSYFZJE, T.COUNTS ")
		.append(" FROM JJZC_HTQS_HEAD H, ")
		.append(" ( SELECT T.CLD_ID, COUNT(T.ID) AS COUNTS ")
		.append(" FROM JYZC_HTQS_BODY T GROUP BY T.CLD_ID ) T  ")
		.append(" WHERE H.ID = T.CLD_ID ")
		.append(" AND H.ZHUANGTAI = '2'").toString();
		
		String conditionHql = this.prepareHql(queryvo);
		sql += conditionHql;
		//List<Object> list = this.prepareParam(queryvo);
		PageableList pageableList = this.publicDao.queryForList(sql, new ArrayList(), paginator);
		List queryList = pageableList.getResults();
		List<ClearQueryVO> resultList = new ArrayList<ClearQueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			ClearQueryVO cvo = new ClearQueryVO();
			cvo.setId(checkString(map.get("ID")));
			cvo.setQslx(
					JygdzcCommon.CONTRACT_WGHT.equals(checkString(map.get("QSLX")))?
					"委管合同":JygdzcCommon.CONTRACT_ZLHT.equals(checkString(map.get("QSLX")))?
					"租赁合同":""
			);
			cvo.setJydx(
					JygdzcCommon.LIQUIDATE_JIANHANG.equals(checkString(map.get("YWLX")))?
					"建行":JygdzcCommon.CONTRACT_ZLHT.equals(checkString(map.get("YWLX")))?
					"非建行":""
			);
			cvo.setQspc(checkString(map.get("QSPC")));
			cvo.setNgrq(checkString(map.get("NGRQ")));
			cvo.setYszj(checkString(map.get("YSYFZJE")));
			cvo.setTzzj(checkString(map.get("TZZJE")));
			cvo.setXghyszj(checkString(map.get("THYSYFZJE")));
			cvo.setCounts(checkString(map.get("COUNTS")));
			cvo.setSszj(checkString(map.get("THSSZJE")));
			cvo.setBcbdje(checkString(map.get("SSTZZJE")));
			resultList.add(cvo);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator.getPageCount(),
				paginator.getCurrentPage(), paginator.getCount());
		return json;
	}
	//  找到id下的信息
	public List<ClearQueryVO> getJjzcHtViewByCondition(String ids) {
		List<ClearQueryVO> resultList = new ArrayList<ClearQueryVO>();
		String sql = new StringBuffer("")
		.append(" SELECT H.ID, H.QSPC, H.QSLX, H.YWLX, ")
		.append(" TO_CHAR(H.NGRQ,'yyyy-MM-dd') NGRQ, H.YSYFZJE, H.TZZJE, H.THYSYFZJE, T.COUNTS ")
		.append(" FROM JJZC_HTQS_HEAD H  ,  ")
		.append(" ( SELECT T.CLD_ID, COUNT(T.ID) AS COUNTS ")
		.append(" FROM JYZC_HTQS_BODY T GROUP BY T.CLD_ID ) T  ")
		.append(" WHERE H.ID = T.CLD_ID and H.ID IN ("+IdStrFormat.formatIds(ids)+") ")
		.append(" AND H.ZHUANGTAI = '2' ").toString();
		
		List params = new ArrayList();
		List list=publicDao.queryForList(sql.toString(),params);
		
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			ClearQueryVO cvo = new ClearQueryVO();
			cvo.setId(checkString(map.get("ID")));
			cvo.setQslx(
					JygdzcCommon.CONTRACT_WGHT.equals(checkString(map.get("QSLX")))?
					"委管合同":JygdzcCommon.CONTRACT_ZLHT.equals(checkString(map.get("QSLX")))?
					"租赁合同":""
			);
			cvo.setJydx(
					JygdzcCommon.LIQUIDATE_JIANHANG.equals(checkString(map.get("YWLX")))?
					"建行":JygdzcCommon.CONTRACT_ZLHT.equals(checkString(map.get("YWLX")))?
					"非建行":""
			);
			cvo.setQspc(checkString(map.get("QSPC")));
			cvo.setNgrq(checkString(map.get("NGRQ")));
			cvo.setYszj(checkString(map.get("YSYFZJE")));
			cvo.setTzzj(checkString(map.get("TZZJE")));
			cvo.setXghyszj(checkString(map.get("THYSYFZJE")));
			cvo.setCounts(checkString(map.get("COUNTS")));
			resultList.add(cvo);
		}
		return resultList;

	}
	public String  getHtlxName(String strID){
		HashMap<String,String> hashMap=new HashMap<String,String>();
		hashMap.put("2", "租赁合同");
		hashMap.put("1", "委管合同");
		hashMap.put("3", "车险合同");
		hashMap.put("4", "非车险合同");
		return (String) hashMap.get(strID); 
		
	}
	
	
	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(ClearQueryVO queryVO) {
		String hql = "";
		//清算批次
		if (queryVO.getQspc() != null
				&& queryVO.getQspc().trim().length() > 0) {
			hql += " and h.QSPC like '%"+queryVO.getQspc().trim()+"%' ";
		}
		//清算类型
		if (queryVO.getHtlx() != null
				&& queryVO.getHtlx().trim().length() > 0) {
				hql += " and h.QSLX like '%"+queryVO.getHtlx().trim()+"%' ";	
		}
		//交易对象
		if (queryVO.getJydx() != null
				&& queryVO.getJydx().trim().length() > 0) {
			hql += " and h.YWLX = '"+queryVO.getJydx().trim()+"' ";
		}
		if (queryVO.getQsrq1() != null
				&& queryVO.getQsrq1().trim().length() > 0) {
			hql += " and h.NGRQ >=  to_date('"+queryVO.getQsrq1()+"','yyyy-mm-dd') ";
		}
		if (queryVO.getQsrq2() != null
				&& queryVO.getQsrq2().trim().length() > 0) {
			hql += " and h.NGRQ <= to_date('"+queryVO.getQsrq2()+"','yyyy-mm-dd') ";
		}
		hql += " order by h.QSPC asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(ClearQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		if (queryVO.getQspc() != null
				&& queryVO.getQspc().trim().length() > 0) {
			list.add("%" + queryVO.getQspc() + "%");
		}
		if (queryVO.getHtlx() != null
				&& queryVO.getHtlx().trim().length() > 0) {
			list.add("" + queryVO.getHtlx() + "");
		}
		if (queryVO.getJydx() != null
				&& queryVO.getJydx().trim().length() > 0) {
			list.add("" + queryVO.getJydx() + "");
		}
		if(queryVO.getHtbh() != null
				&& queryVO.getHtbh().trim().length() > 0) {
			list.add("%" + queryVO.getHtbh() + "%");
		}
		if (queryVO.getNgbm() != null
				&& queryVO.getNgbm().trim().length() > 0) {
			list.add("" + queryVO.getNgbm() + "");
		}
		if (queryVO.getZcbh() != null
				&& queryVO.getZcbh().trim().length() > 0) {
			list.add("%" + queryVO.getZcbh() + "%");
		}
		if(queryVO.getZcmc() != null
				&& queryVO.getZcmc().trim().length() > 0) {
			list.add("%" + queryVO.getZcmc() + "%");
		}
		return list;
	}

	/**
	 * 根据委管合同Id得到经营资产信息
	 * 
	 * @param wgId
	 * @return
	 */

	public List<JyzcXx> getJyzcQsByWgId(String wgId) {
		List<JyzcXx> list = new ArrayList();
		List params = new ArrayList();
		params.add(wgId);
		list = (List<JyzcXx>) publicDao
				.find(
						"select  a  from JyzcXx a ,JjzcHtZlwg b  where a.id = b.zcid and  b.id = ? ",
						params);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	/**
	 * 根据委管合同Id得到经营资产信息
	 * 
	 * @param wgId
	 * @return
	 */

	public List<JyzcXx> getJyzcXxByWgId(String wgId) {
		List<JyzcXx> list = new ArrayList();
		List params = new ArrayList();
		params.add(wgId);
		list = (List<JyzcXx>) publicDao
				.find(
						"select  a  from JyzcXx a ,JjzcHtZlwg b  where a.id = b.zcid and  b.id = ? ",
						params);
		if (list.size() == 0) {
			return null;
		}
		return list;
	}

	public JjzcHtZlwgLsb jjzcHtBx2Body(JjzcHtZlwg jjzcHtBx) {
		JjzcHtZlwgLsb jjzcHtZlwgLsb = new JjzcHtZlwgLsb();
		try {
			BeanUtils.copyProperties(jjzcHtZlwgLsb,jjzcHtBx);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		jjzcHtZlwgLsb.setId(jjzcHtBx.getId());
		return jjzcHtZlwgLsb;
	}

	/**
	 * 保存车险的数据 JJZC_HT_JDZJ 保存JJZC_HT_BX的数据
	 * 
	 * @param caShead
	 */

	public void saveJjzcHtBBxC(JjzcHtBx jjzcHtBx) {
		publicDao.saveOrUpdate(jjzcHtBx);
	}

	public void saveJjzcHtBBxFc(JjzcHtBxzcgx jjzcHtBxzcgx) {
		publicDao.save(jjzcHtBxzcgx);

	}

	public void saveJjzcHtZlwg(JjzcHtZlwg jjzcHtZlwg) {
		publicDao.saveOrUpdate(jjzcHtZlwg);

	}

	public void saveJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb) {
		publicDao.save(jjzcHtZlwgLsb);

	}

	public void updateJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb) {
		publicDao.update(jjzcHtZlwgLsb);
	}

	public void saveJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead) {
		publicDao.save(jjzcHtqsHead);

	}

	public void updateJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead) {
		String code = codeGenerator.generateCurrentCode("qspcbh", "", "");
		jjzcHtqsHead.setQspc(code);
		publicDao.update(jjzcHtqsHead);
	}

	/**
	 * 更新JjzcHtqsHead
	 * 
	 */
	public JjzcHtqsHead updateJjzcHtqsHead(String id) {
		JjzcHtqsHead jjzcHtqsHead = new JjzcHtqsHead();
		jjzcHtqsHead.setId(id);
		return jjzcHtqsHead;
	}

	public JjzcHtZlwgLsb getById(String id) {
		return publicDao.findById(JjzcHtZlwgLsb.class, id);
	}

	public JjzcHtqsHead getJjzcHtqsHeadById(String id) {
		return publicDao.findById(JjzcHtqsHead.class, id);
	}

	/**
	 * 保存jdzj
	 * 
	 * @param list
	 */
	public void saveJyzchtJdzj(List<JjzcHtJdzjLsb> list) {
		for (JjzcHtJdzjLsb temp : list) {
			publicDao.save(temp);
		}

	}

	/**
	 * 从JyzcJyzlLsb得到headId下的JyzlBodyVO
	 * 
	 * @param cldId
	 * @return
	 */

	public List<JyzlBodyVO> getJyzlBodyVOByCldId(String cldId) {
		
		List<JjzcHtBx> list = new ArrayList<JjzcHtBx>();
		List<JyzlBodyVO> resultList = new ArrayList<JyzlBodyVO>();
		List params = new ArrayList();
		params.add(cldId);
		list = (List<JjzcHtBx>) publicDao.find(
				"from JjzcHtBx o where o.cldId = ? ", params);
		for (int i = 0; i < list.size(); i++) {
			JyzlBodyVO jyzlBodyVO = new JyzlBodyVO();
			JjzcHtBx jjzcHtBx = list.get(i);
			try {
				BeanUtils.copyProperties(jyzlBodyVO,jjzcHtBx);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jyzlBodyVO.setId(jjzcHtBx.getId());
			List param = new ArrayList();
			String zcId = jjzcHtBx.getZcid();
			
			List<JyzcXx> zcxx = new ArrayList();
			param.add(zcId);
			zcxx = (List<JyzcXx>) publicDao.find(
					"from JyzcXx j where j.id = ? ", param);
			if (zcxx.size() != 0) {
				jyzlBodyVO.setZcbh(zcxx.get(0).getZcbh());
				jyzlBodyVO.setZcmc(zcxx.get(0).getZcmc());
				jyzlBodyVO.setCZclx(zcxx.get(0).getCZclx());
			}
			resultList.add(jyzlBodyVO);
		}
		if (resultList.size() == 0) {
			return null;
		}
        return resultList;
	}

	/**
	 * JyzcHtBX表得到headId下的JyzlBodyVO2
	 * 
	 * @param cldId
	 * @return
	 */

	public List<JyzlBodyVO2> getJyzlBodyVO2ByCldId(String cldId) {

		List<JjzcHtZlwgLsb> list = new ArrayList();
		List<JyzlBodyVO2> resultList = new ArrayList<JyzlBodyVO2>();
		List params = new ArrayList();
		params.add(cldId);
		list = (List<JjzcHtZlwgLsb>) publicDao.find(
				"from JjzcHtZlwgLsb o where o.cldId = ? ", params);
		for (int i = 0; i < list.size(); i++) {
			JyzlBodyVO2 jyzlBodyVO2 = new JyzlBodyVO2();
			JjzcHtZlwgLsb jjzcHtBx = list.get(i);
			try {
				BeanUtils.copyProperties(jyzlBodyVO2,jjzcHtBx);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			jyzlBodyVO2.setId(jjzcHtBx.getId());
			List<Object> param = new ArrayList<Object>();
			String zcId = jjzcHtBx.getZcid();
			
			List<JyzcXx> zcxx = new ArrayList<JyzcXx>();
			param.add(zcId);
			zcxx = (List<JyzcXx>) publicDao.find(
					"from JyzcXx j where j.id = ? ", param);
			if (zcxx.size() != 0) {
				jyzlBodyVO2.setZcbh(zcxx.get(0).getZcbh());
				jyzlBodyVO2.setZcmc(zcxx.get(0).getZcmc());
				jyzlBodyVO2.setCZclx(zcxx.get(0).getCZclx());
			}
			resultList.add(jyzlBodyVO2);
		}
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

	public void updateJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb,
			List<JjzcHtJdzjLsb> jjzcHtJdzj) {
		publicDao.update(jjzcHtZlwgLsb);
		for (JjzcHtJdzjLsb temp : jjzcHtJdzj) {
			publicDao.update(jjzcHtJdzj);
		}
	}

	public JjzcHtZlwg getJjzcHtZlwgById(String id) {
		return publicDao.findById(JjzcHtZlwg.class, id);
	}

	public void deleteJjzcHtZlwgLsb(String id) {
		
		JjzcHtZlwgLsb lsb=publicDao.findById(JjzcHtZlwgLsb.class, id);
		if(lsb!=null)
		publicDao.delete(lsb);
		
	}

	public List<JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLx(String zcId, String zcLx) {
		List<JjzcHtZlwg> list = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		params.add(zcLx);
		list = (List<JjzcHtZlwg>) publicDao.find(
				"from JjzcHtZlwg o where o.zcid = ?  and o.CHtlx =? ", params);
		return list;
	}
	public List<JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLxforAsset(String zcId, String zcLx){
		List<JjzcHtZlwg> list = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		params.add(zcLx);
		list = (List<JjzcHtZlwg>) publicDao.find("select distinct o  from JjzcHtZlwg o where o.zcid = ?  and o.CHtlx =? ", params);
		List resultList= new ArrayList();
		for(int i=0;i<list.size();i++){
			JjzcHtZlwg jjzcHtZlwg= new JjzcHtZlwg();
			jjzcHtZlwg = list.get(i);
			jjzcHtZlwg.setCHtzt(switchCHtzt(checkNull(jjzcHtZlwg.getCHtzt().toString())));
			resultList.add(jjzcHtZlwg);
		}
		return resultList;
	}
	public List<JjzcHtBx> getJjzcHtBxByzcId(String zcId) {
		List<JjzcHtBx> list = new ArrayList<JjzcHtBx>();
		List<String> params = new ArrayList<String>();
		params.add(zcId);
		list = (List<JjzcHtBx>) publicDao.find(
				"from JjzcHtBx o where o.zcid = ? ", params);
		return list;
	}
	
	/**
	 * 根据id查询保险合同信息
	 * @param Id
	 * @return
	 */
	public JjzcHtBx getJjzcHtBxById(String id) {
		List<String> params = new ArrayList<String>();
		params.add(id);
		JjzcHtBx ht = (JjzcHtBx) publicDao.findSingleResult(
				"from JjzcHtBx o where o.id = ? ", params);
		return ht;
	}
	//add by lantianbo 查询委管合同
	public String getJjzcHtBxHtViewByCondition(String sheettype, JjzcHtBxQueryVO queryVO, Paginator paginator){
		if (paginator == null || queryVO == null) {
			return null;
		}
		List params = new ArrayList();
		StringBuffer strWhere = new StringBuffer();
		String sql = "select * from JJZC_HT_ZLWG where BODYIDLOCK is null ";
		String strHTLX = queryVO.getHtlx();
		// 合同编码
		if (queryVO.getHtbm() != null && queryVO.getHtbm().trim().length() > 0) {
			params.add("%"+queryVO.getHtbm()+"%");
			strWhere.append(" and HTBH  like ? ");
		}
		// 合同状态
		if (queryVO.getHtzt() != null && queryVO.getHtzt().trim().length() > 0
				&& !"0".equals(queryVO.getHtzt())) {
			params.add(queryVO.getHtzt());
			strWhere.append(" and C_HTZT  = ? ");
		}
		// 合同类型
		if (queryVO.getHtlx() != null && queryVO.getHtlx().trim().length() > 0) {
			params.add(queryVO.getHtlx());
			strWhere.append(" and c_htlx  = ? ");
		}
		// 资产编码
		if (queryVO.getZcbm() != null && queryVO.getZcbm().trim().length() > 0) {
			params.add("%"+queryVO.getZcbm()+"%");
			strWhere.append(" and zcbh  like ? ");
		}
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			params.add("%" + queryVO.getZcmc() + "%");
			strWhere.append(" and zcmc  like ? ");
		}
		// 合同起始日期
		if (queryVO.getBeginTime1() != null) {
			params.add(queryVO.getBeginTime1());
			strWhere.append(" and HTQSRQ  > ? ");
		}
		if (queryVO.getBeginTime2() != null) {
			params.add(queryVO.getBeginTime2());
			strWhere.append(" and HTQSRQ  < ? ");
		}
		// 合同结束日期
		if (queryVO.getEndTime1() != null) {
			params.add(queryVO.getEndTime1());
			strWhere.append(" and HTDQRQ  > ? ");
		}
		if (queryVO.getEndTime2() != null) {
			params.add(queryVO.getEndTime2());
			strWhere.append(" and HTDQRQ  < ? ");
		}
		// 交易对象
		if (queryVO.getJydx() != null && queryVO.getJydx().trim().length() > 0) {
			params.add(queryVO.getJydx());
			strWhere.append(" and jydx  = ? ");
		}
		sql = sql + strWhere.toString() + " order by HTBH desc ";
		PageableList pageableList = this.publicDao.queryForList(sql, params,
				paginator);
		List listTemp = pageableList.getResults();
		List<JjzcHtBxHtView> resultList = new ArrayList<JjzcHtBxHtView>();
		for (int i = 0; i < listTemp.size(); i++) {
			Map map = (Map) listTemp.get(i);
			if(map.get("BODYIDLOCK")==null){
				JjzcHtBxHtView jjzcHtBxHtView = new JjzcHtBxHtView();
				jjzcHtBxHtView.setId(String.valueOf(map.get("ID")));
				jjzcHtBxHtView.setZcmc(String.valueOf(map.get("ZCMC")));
				jjzcHtBxHtView.setHtbm(String.valueOf(map.get("HTBH")));
				jjzcHtBxHtView.setZcbm(String.valueOf(map.get("ZCBH")));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					jjzcHtBxHtView.setBeginTime(map
							.get("HTQSRQ")==null?null:sdf.parse(String.valueOf(map
									.get("HTQSRQ"))));
					jjzcHtBxHtView.setEndTime(map
							.get("HTDQRQ")==null?null:sdf.parse(String.valueOf(map
									.get("HTDQRQ"))));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				jjzcHtBxHtView.setHtzt(String.valueOf(map.get("C_HTZT")));
				jjzcHtBxHtView.setHtlx(String.valueOf(map.get("C_HTLX")));
				jjzcHtBxHtView.setJydx(String.valueOf(map.get("JYDX")));
				resultList.add(jjzcHtBxHtView);
			}
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}
	/**
	 * 展现选择的合同列表
	 * @return
	 */
	/**
	 * 展现选择的合同列表
	 * @return
	 */
	public List queryChooseHtListByIds(String[] htIds,String headId) {
		List returnList = new ArrayList();
		if(htIds!=null&&htIds.length>0){
			ClearQueryVO vo = null;
			JjzcHtZlwg ht = null;
			for (int i = 0; i < htIds.length; i++) {
				vo = new ClearQueryVO();
				ht = this.getJjzcHtZlwgById(htIds[i]);
				if(ht!=null){
					//vo.setId(checkNull(ht.getId()));			//id
					vo.setHtbh(checkNull(ht.getHtbh()));		//合同编号
					vo.setHtlx(checkNull(ht.getCHtlx()));		//合同类型
					vo.setZcbh(checkNull(ht.getZcbh()));		//资产编号
					vo.setZcmc(checkNull(ht.getZcmc()));		//资产名称
					
					Date D1 = liquidate.getD1(ht.getHtqsrq(), null, ht.getScqsrq());
					Date D2 = liquidate.getD2(D1, ht.getMzdqrq());
					vo.setQsksrq(changeDate2String(D1));		//	清算开始日期
					Date date = DateUtils.dateMonthAdd(this.getDateAdd1Day(D1), 3);
					Date date1 = DateUtils.dateDayAdd(date, -2);
					vo.setQsjzrq(changeDate2String(date1));		//清算截止日期
					boolean isAfter = date1.after(ht.getHtdqrq());
					if(isAfter){
						vo.setQsjzrq(changeDate2String(ht.getHtdqrq()));
					}
					vo.setCzr(checkNull(ht.getCzr()));			//承租人
					Double yzj = 0.0;
					if(JygdzcCommon.CONTRACT_WGHT.equals(ht.getCHtlx())){ //如果是委管合同，则月租金取租赁委管合同数据表里的月租金字段，
						yzj = ht.getYzj();
					}else{
						yzj = this.getYzj(ht.getId(),D2);//如果是租赁合同，则月租金取租赁合同的分段租金
					}
					vo.setYzj(checkNull(String.valueOf(yzj)));			//月租金
					vo.setHtzzrq(checkNull(changeDate2String(ht.getHtzzrq())));	//合同截至日期
					vo.setHtdqrq(checkNull(changeDate2String(ht.getHtdqrq())));//合同到期日期
					JyzcHtqsBody body = this.saveJyzcHtqsBody(headId,ht);    // modify by lantianbo 2010-12-25	
					vo.setYszj(String.valueOf(body.getYszj()));
					vo.setSszj(String.valueOf(body.getYszj()));
					vo.setBodyId(body.getId());							 // modify by lantianbo 2010-12-25	
					if(ht.getMzqsrq()!=null&&ht.getMzqsrq()!=null){
						String s = DateUtils.formatDate(ht.getMzqsrq(), "yyyy-MM-dd")+"至"+DateUtils.formatDate(ht.getMzdqrq(), "yyyy-MM-dd");
						vo.setMzq(s);
					}else{
						vo.setMzq("");
					}
					returnList.add(vo);
				}
			}
		}
		return returnList;
	}

	/**
	 * 根据租赁合同id 查询出该合同的分段租金数据，如果清算开始日期在某个分段期间内，则租金取这个分段租金
	 * @param id
	 * @param d2
	 * @return
	 */
	private Double getYzj(String id, Date d2) {
		String sql = "from JjzcHtJdzj a where a.htId = ?";
		List list = this.publicDao.find(sql, new Object[]{id});
		Double yzj = 0.0;
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				JjzcHtJdzj zj = (JjzcHtJdzj)list.get(i);
				Date ksrq = zj.getKsrq();
				Date jsrq = zj.getJsrq();
				//ksrq.setHours(1);
				Calendar gc = Calendar.getInstance();
				gc.setTime(ksrq);
		    	gc.add(Calendar.HOUR_OF_DAY, -1 );
		    	ksrq = gc.getTime();
				if(d2.after(ksrq)&&d2.before(jsrq)){
					return zj.getYzj();
				}
			}
			
		}
		return yzj;
	}

	/**
	 * 展现选择的合同列表
	 * @return
	 */
	public List queryChooseHtListByIds1(String[] htIds,String headId) {
		List returnList = new ArrayList();
		List list = liquidateBS.getBodyListByHeadId(headId, new Paginator());
		if(list!=null&&list.size()>0){
			htIds = new String[list.size()];
			for(int i=0;i<list.size();i++){
				JyzcHtqsBody jyzcHtqsBody = (JyzcHtqsBody) list.get(i);
				String htId = jyzcHtqsBody.getHtId();
				htIds[i]=htId;
			}
			if(htIds!=null&&htIds.length>0){
				ClearQueryVO vo = null;
				JjzcHtZlwg ht = null;
				for (int i = 0; i < htIds.length; i++) {
					vo = new ClearQueryVO();
					ht = this.getJjzcHtZlwgById(htIds[i]);
					if(ht!=null){
						//vo.setId(checkNull(ht.getId()));			//id
						vo.setHtbh(checkNull(ht.getHtbh()));		//合同编号
						vo.setHtlx(checkNull(ht.getCHtlx()));		//合同类型
						vo.setZcbh(checkNull(ht.getZcbh()));		//资产编号
						vo.setZcmc(checkNull(ht.getZcmc()));		//资产名称
						vo.setCzr(checkNull(ht.getCzr()));			//承租人
						JyzcHtqsBody body = (JyzcHtqsBody) list.get(i);  
						Double yzj = this.getYzj(ht.getId(),body.getQsksrq());
						vo.setYzj(checkNull(String.valueOf(yzj)));			//月租金
						vo.setHtzzrq(checkNull(changeDate2String(ht.getHtzzrq())));	//合同截至日期
						vo.setHtdqrq(checkNull(changeDate2String(ht.getHtdqrq())));//合同到期日期
						  
						vo.setYszj(String.valueOf(body.getYszj()));
						vo.setQstzje(String.valueOf(body.getQstzje()));
						vo.setBodyId(body.getId());		
						vo.setYsxgyy(checkNull(body.getYsxgyy()));
						vo.setXghyszj(checkNull(String.valueOf(body.getXghyszj())));
						vo.setQsksrq(changeDate2String(body.getQsksrq()));
						vo.setQsjzrq(changeDate2String(body.getQsjzrq()));
						vo.setScbdje(checkNull(String.valueOf(ht.getZlqstzje())));
						vo.setBcbdje(checkNull(String.valueOf(body.getBcbdje())));
						vo.setBdyy(body.getTzyy());
						vo.setSszj(checkNull(String.valueOf(body.getSszj())));
						if(ht.getMzqsrq()!=null&&ht.getMzqsrq()!=null){
							String s = DateUtils.formatDate(ht.getMzqsrq(), "yyyy-MM-dd")+"至"+DateUtils.formatDate(ht.getMzdqrq(), "yyyy-MM-dd");
							vo.setMzq(s);
						}else{
							vo.setMzq("");
						}
						returnList.add(vo);
					}
				}
			}
		}
		return returnList;
	}
	
	public JyzcHtqsBody saveJyzcHtqsBody(String headId, JjzcHtZlwg ht) {
		JyzcHtqsBody body = new JyzcHtqsBody();
		body.setHtbh(ht.getHtbh());
		body.setHtId(ht.getId());
		body.setCHtlx(ht.getCHtlx());
		body.setCldId(headId);
		body.setZcbh(ht.getZcbh());
		body.setZcId(ht.getZcid());
		body.setZcmc(ht.getZcmc());
		Date D1 = liquidate.getD1(ht.getHtqsrq(), null, ht.getScqsrq());
		Date D2 = liquidate.getD2(D1, ht.getMzdqrq());
		body.setQsksrq(D1);		//	清算开始日期
		Date date = DateUtils.dateMonthAdd(this.getDateAdd1Day(D1), 3);
		Date date1 = DateUtils.dateDayAdd(date, -2);
		body.setQsjzrq(date1);		//清算截止日期
		boolean isAfter = date1.after(ht.getHtdqrq());
		if(isAfter){
			body.setQsjzrq(ht.getHtdqrq());
		}
		//this.save(body);
		String s = liquidate.liquidateSingle(headId, "", ht.getHtbh(), body.getQsjzrq(),true); // modify by lantianbo 2010-12-25
		body.setYszj(Double.valueOf("".equals(checkString(s))?"0":s));
		if(ht.getMzqsrq()!=null&&ht.getMzqsrq()!=null){
			String s1 = DateUtils.formatDate(ht.getMzqsrq(), "yyyy-MM-dd")+"至"+DateUtils.formatDate(ht.getMzdqrq(), "yyyy-MM-dd");
			body.setMzq(s1);
		}else{
			body.setMzq("");
		}
		return body;
	}
	public String checkNull(String id) {
		if(id==null||"null".equals(id)){
			return "";
		}
		return id.trim();
	}

	public Date getDateAdd1Day(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar gc = Calendar.getInstance();
    	gc.setTime(date);
    	gc.add(Calendar.DAY_OF_MONTH, 1 );
      
    	return gc.getTime();
	}
	
	public String changeDate2String(Date date){
		String str = "";
		if(date==null){
			return str;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		str = sdf.format(date);
		return str;
		
	}
	
	public JjzcHtZlwg getJjzcHtZlwgByHtbh(String contractbh){
		
		String preparedHQL = "from JjzcHtZlwg g where g.htbh = ?";
		List params =  new ArrayList();
		params.add(contractbh);
		List<JjzcHtZlwg> jjzcHtZlwg =  (List<JjzcHtZlwg>) this.publicDao.find(preparedHQL,params);
		if(jjzcHtZlwg!=null&&jjzcHtZlwg.size()>0){
			return jjzcHtZlwg.get(0);
		}else{
			return null;
		}
	}

	public List getJjzcHtJdzjByHtId(String id) {
		String sql = "SELECT T.KSRQ AS FDBEGIN, T.JSRQ AS FDEND,T.YZJ AS FDMONEY FROM JJZC_HT_JDZJ T WHERE T.HT_ID = ?";
		List list = this.publicDao.queryForList(sql, new Object[]{id});
		return list;
	}
	
	public JyzcHtqsBody getJyzcHtqsBodyById(String id) {
		return publicDao.findById(JyzcHtqsBody.class, id);
	}
	public void update(CommonBO bo) {
		publicDao.update(bo);
	}
	
	public void update(JjzcHtqsHead head) {
		publicDao.update(head);
	}

	public List<Recordhistory> getBianDongByHtId(String htId) {
		List<Recordhistory> resultList = new ArrayList<Recordhistory>();
		List params = new ArrayList();
		params.add(htId);
		
		resultList = (List<Recordhistory>) publicDao.find(
				"from Recordhistory o where o.pkId =?", params);
		return resultList;
	}
	
	
	/**
	 * 添加变动记录信息
	 */
	public void saveRecord(Recordhistory record) {
		publicDao.save(record);
	}
	/**
	 * 根据JjzcHtZlwgLsb和JjzcHtZlwg对比出合同的变化信息，并存到变动表里，
	 * @param body
	 * @param card
	 * @return
	 * lihuan
	 */
	@SuppressWarnings("unchecked")
	public void compareHtVsBody(JjzcHtZlwgLsb body, JjzcHtZlwg htzl) {
		Map<String,Object> bodyMap = null;
		Map<String,Object> cardMap = null;
		try {
			bodyMap = BeanUtils.describe(body);
			cardMap = BeanUtils.describe(htzl);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		Recordhistory record = null;
		Set<String> keySet = cardMap.keySet();
		Iterator ite = keySet.iterator();
		while(ite.hasNext()){
			String property = (String)ite.next();
			record = new Recordhistory();
			if("id".equals(property)||"class".equals(property)|| "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)){
				continue;
			}
			Object valueAfter = bodyMap.get(property);
			Object valueBefore = cardMap.get(property);
			if(valueAfter == null && valueBefore == null){
				continue;
			}else if("null".equals(valueAfter) && "null".equals(valueBefore)){
				continue;
			}else if("".equals(valueAfter) && "".equals(valueBefore)){
				continue;
			}else if(valueAfter != null && valueAfter.equals(valueBefore)){
				continue;
			}else if((valueAfter == null && valueBefore != null) || (valueAfter != null && !valueAfter.equals(valueBefore))){
				//对比时间类型的数据 add by lantianbo 
				boolean d = false;
				if("htqsrq".equals(property)||"htdqrq".equals(property)||"mzqsrq".equals(property)
						||"mzdqrq".equals(property)||"scqsrq".equals(property)||"scqsjzrq".equals(property)
						||"lrrq".equals(property)||"htzzrq".equals(property)){
					d = true;
				}
				if(d){
					Object []dateCom = this.compareDate(body, htzl,valueAfter,valueBefore,property);
					boolean s1= Boolean.parseBoolean(String.valueOf(dateCom[0]));
					if(s1){
						continue;
					}
					valueAfter = dateCom[1];
					valueBefore = dateCom[2];
				}else{
					if(checkString2(String.valueOf(valueAfter)).equals(checkString2(String.valueOf(valueBefore)))){
						continue;
					}
				}
			    if("jsfs".equals(property)){
					record.setBefore(switchJsfs(String.valueOf(valueBefore)));
					record.setAfter(switchJsfs(String.valueOf(valueAfter)));	
				}else if("CHtzt".equals(property)){
					record.setBefore(switchCHtzt(String.valueOf(valueBefore)));
					record.setAfter(switchCHtzt(String.valueOf(valueAfter)));	
				}else if("jydx".equals(property)){
					record.setBefore(switchJydx(String.valueOf(valueBefore)));
					record.setAfter(switchJydx(String.valueOf(valueAfter)));	
				}else if("CCzrxz".equals(property)){
					record.setBefore(checkString(this.findCoteNameByCoteKey("RENTER_PROPERTY",String.valueOf(valueBefore))));
					record.setAfter(checkString(this.findCoteNameByCoteKey("RENTER_PROPERTY",String.valueOf(valueAfter))));		
				}else if("CZjjsfs".equals(property)){
					record.setBefore(switchCZjjsfs(String.valueOf(valueBefore)));
					record.setAfter(switchCZjjsfs(String.valueOf(valueAfter)));	
				}else if("zjsfhwyf".equals(property)||"zjsfhsdf".equals(property)){
					record.setBefore(switchYseorNo(String.valueOf(valueBefore)));
					record.setAfter(switchYseorNo(String.valueOf(valueAfter)));	
				}else if("dldw".equals(property)){
					record.setBefore(switchDldw(String.valueOf(valueBefore)));
					record.setAfter(switchDldw(String.valueOf(valueAfter)));	
				}else{
					record.setBefore(valueBefore==null?"":valueBefore.toString());
					record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
				}
				if(record.getAfter().equals(record.getBefore())){
					continue;
				}else{
					JjzcHtqsHead head = this.getJjzcHtqsHeadById(body.getCldId());
					record.setBiaoming("jjzc_ht_zlwg");//变动的表名
					record.setZcId(body.getId().toString());//变动记录的ID，临时表的主键
					record.setPkId(body.getCldId());//处理单Id
					record.setChangedate(head.getNgrq());//变动日期
					record.setChangeperson(head.getNgrmc());//变动人
					record.setName(switchString(property));//改变的列名
					//record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
					record.setZhuangTai("0");//设置审批状态为0：未审批
					if(valueAfter!=null){
						this.saveRecord(record);
					}
				}
			}
		}
	}
	//度量单位
	public String switchDldw(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "个";
		}else if("2".equals(key)){
			returnStr = "平方米";
		}
		return returnStr;
	}	
	//租金价格是否含物业费
	public String switchYseorNo(String key){
		String returnStr = "";
		if("0".equals(key)){
			returnStr = "否";
		}else if("1".equals(key)){
			returnStr = "是";
		}
		return returnStr;
	}	
	//转换租金支付方式
	public String switchCZjjsfs(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "期初支付";
		}else if("2".equals(key)){
			returnStr = "期末支付";
		}
		return returnStr;
	}		
	//转换合同状态
	public String switchCHtzt(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "执行中";
		}else if("2".equals(key)){
			returnStr = "待执行";
		}else if("3".equals(key)){
			returnStr = "执行完毕";
		}
		return returnStr;
	}
	//转换交易对象
	public String switchJydx(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "建行";
		}else if("2".equals(key)){
			returnStr = "非建行";
		}
		return returnStr;
	}
	//转换结算方式
	public String switchJsfs(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "月付";
		}else if("2".equals(key)){
			returnStr = "季付";
		}else if("3".equals(key)){
			returnStr = "年付";
		}else if("4".equals(key)){
			returnStr = "其他";
		}
		return returnStr;
	}
	@SuppressWarnings("unchecked")
	public String switchString(String orig){
		HashMap hashMap=new HashMap();
		hashMap.put( "zcid","资产ID");                            
		hashMap.put( "zcbh","资产编号");                         
		hashMap.put( "zcmc","资产名称");                       
		hashMap.put( "swhtbh","实物合同编号");                    
		hashMap.put( "CHtlx","合同类型");                        
		hashMap.put( "htbh","合同编号");                         
		hashMap.put( "CHtzt","合同状态");                          
		hashMap.put( "czr"," 承租人");                          
		hashMap.put( "CCzrxz","承租人性质");                         
		hashMap.put( "czlxr","承租联系人");                         
		hashMap.put( "czflxdh","承租方联系电话");                     
		hashMap.put( "jbrlxdh","经办人联系电话");                     
		hashMap.put( "jydx","交易对象");                       
		hashMap.put( "czsl","承租数量 ");                          
		hashMap.put( "yzj","月租金");                           
		hashMap.put( "zjsfhwyf","租金包含费用");                      
		hashMap.put( "zjsfhsdf","租金包含其他费用");                   
		hashMap.put( "zjjg","租金价格");                       
		hashMap.put( "jsfs","结算方式");                        
		hashMap.put( "CZjjsfs","租金支付方式");                     
		hashMap.put( "ddtlfwzjjg","当地同类房屋租金价格  ");             
		hashMap.put( "ljzj","累计租金");                        
		hashMap.put( "yajin","押金");                             
		hashMap.put( "ysyj","已收押金");                        
		hashMap.put( "wyj"," 违约金");                       
		hashMap.put( "yswyj"," 已收违约金");                      
		hashMap.put( "htqsrq","合同起始日期");                   
		hashMap.put( "htdqrq","合同到期日期");               
		hashMap.put( "mzqsrq","免租起始日期");                  
		hashMap.put( "mzdqrq","免租到期日期");                  
		hashMap.put( "scqsrq","上次清算日期");                  
		hashMap.put( "zlqstzje","清算调整金额 ");                      
		hashMap.put( "scqsjzrq","清算调整金额");                    
		hashMap.put( "czrdz","承租人地址");                     
		hashMap.put( "czrfddz","承租人法定地址");                   
		hashMap.put( "zlyt","租赁用途");                     
		hashMap.put( "zjsycbl","租金收益成本率");                  
		hashMap.put( "lrr","录入人");                    
		hashMap.put( "lrrq","录入日期");                    
		hashMap.put( "wghtbz","委管合同币种");                   
		hashMap.put( "CYjfh","一级分行");                     
		hashMap.put( "CWtgldw","委托管理单位");                    
		hashMap.put( "wtglyz","委托管理原值");                    
		hashMap.put( "wtfybi","委托费用比例");                  
		hashMap.put( "wtgljg","委托管理价格");                  
		hashMap.put( "wtglsl","委托管理数量");                  
		hashMap.put( "ywtglf","月委托管理费");                 
		hashMap.put( "ljsswgf","累计实收委管费");                 
		hashMap.put( "ljyswgf","累计应收委管费");                
		hashMap.put( "dldw","度量单位");                  
		hashMap.put( "kpbh","主卡片编号");                 
		hashMap.put( "htsftqzz","合同是否提前终止");        
		hashMap.put( "htzzrq","合同终止日期");                                 
		hashMap.put( "zzblsm","终止办理说明");                  
		hashMap.put( "CZzyy","终止原因");                  
		return (String) hashMap.get(orig);
	} 
	/**
	 * 将空串，null字符串，0，0.0，转换成空字符串 add by lantianbo
	 * @param str
	 * @return
	 */
	public String checkString2(String str){
		if(str==null){
			return "";
		}
		if(str.trim().equals("")||str.trim().equals("null")
				||str.trim().equals("0")||str.trim().equals("0.0")){
			return "";
		}else{
			return str.trim();
		}
	}
	/**
	 * 对比时间格式的数据
	 * @param body
	 * @param htzl
	 * @param valueAfter
	 * @param valueBefore
	 * @param property
	 */
	private Object[] compareDate(JjzcHtZlwgLsb body, JjzcHtZlwg htzl,
		Object valueAfter, Object valueBefore, String property) {
		Object []s = new Object[3];
		if("htqsrq".equals(property)){
			if(body.getHtqsrq()!= null){
				valueAfter = DateUtils.formatDate(body.getHtqsrq());
			}
			if(htzl.getHtqsrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getHtqsrq());
			}
		}
		if("htdqrq".equals(property)){
			if(body.getHtdqrq()!= null){
				valueAfter = DateUtils.formatDate(body.getHtdqrq());
			}
			if(htzl.getHtdqrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getHtdqrq());
			}
		}
		if("mzqsrq".equals(property)){
			if(body.getMzqsrq()!= null){
				valueAfter = DateUtils.formatDate(body.getMzqsrq());
			}
			if(htzl.getMzqsrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getMzqsrq());
			}
		}
		if("mzdqrq".equals(property)){
			if(body.getMzdqrq()!= null){
				valueAfter = DateUtils.formatDate(body.getMzdqrq());
			}
			if(htzl.getMzdqrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getMzdqrq());
			}
		}
		if("scqsrq".equals(property)){
			if(body.getScqsrq()!= null){
				valueAfter = DateUtils.formatDate(body.getScqsrq());
			}
			if(htzl.getScqsrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getScqsrq());
			}
		}
		if("scqsjzrq".equals(property)){
			if(body.getScqsjzrq()!= null){
				valueAfter = DateUtils.formatDate(body.getScqsjzrq());
			}
			if(htzl.getScqsjzrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getScqsjzrq());
			}
		}
		if("lrrq".equals(property)){
			if(body.getLrrq()!= null){
				valueAfter = DateUtils.formatDate(body.getLrrq());
			}
			if(htzl.getLrrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getLrrq());
			}
		}
		if("htzzrq".equals(property)){
			if(body.getHtzzrq()!= null){
				valueAfter = DateUtils.formatDate(body.getHtzzrq());
			}
			if(htzl.getHtzzrq() != null){
				valueBefore = DateUtils.formatDate(htzl.getHtzzrq());
			}
		}
		if(checkString2(String.valueOf(valueAfter)).equals(checkString2(String.valueOf(valueBefore)))){
			s[0]=true;
			return s;
		}else{
			s[0]=false;
			s[1]=String.valueOf(valueAfter);
			s[2]=String.valueOf(valueBefore);
			return s;
		}
	}

	public List<JjzcHtqsHead> getQingSuanByHtId(String htId) {
		List resultList = new ArrayList();
		List params = new ArrayList();
		params.add(htId);
		resultList = publicDao.find(
				"from JjzcHtqsHead o where o.id =?", params);
		return resultList;
	}

	public void saveLsb2Zsb_HtZlwg(JjzcHtZlwg jjzcHtZlwg,JjzcHtZlwgLsb  jjzcHtZlwgLsb) {
		jjzcHtZlwg=new JjzcHtZlwg();
		try {
			BeanUtils.copyProperties(jjzcHtZlwg,jjzcHtZlwgLsb);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		publicDao.save(jjzcHtZlwg);
	}
	public void save(CommonBO bo) {
		publicDao.save(bo);
	}
	public void delete(CommonBO bo) {
		publicDao.delete(bo);
	}
	public String getSszj(String headId, String htbh, String bodyId, String qsjzrq){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date =null;
		try {
			date = sdf.parse(qsjzrq);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String s = liquidate.liquidateSingle(headId, bodyId, htbh, date,false);
		
		return s;
	}
	public void saveSszj(String[] qsjzrqs, String[] yszjs, String[] sszjs,
			String[] bodyIds){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(bodyIds!=null&&bodyIds.length>0){
			for (int i = 0; i < bodyIds.length; i++) {
				String bodyId = bodyIds[i];
				JyzcHtqsBody body = this.getJyzcHtqsBodyById(bodyId);
				body.setYszj(Double.valueOf(yszjs[i]));
				body.setSszj(Double.valueOf(sszjs[i]));
				Date date = null;
				try {
					date = sdf.parse(qsjzrqs[i]);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				body.setQsjzrq(date);
				this.update(body);
			}
			
		}
	}
	
	public void deleteBody(String ids){
		if(ids.startsWith(",")){
			ids = ids.substring(1);
		}
		if(ids.length()>0){
			String [] bodyIds = ids.split(",");
			for(int i=0;i<bodyIds.length;i++){
				JyzcHtqsBody body = this.getJyzcHtqsBodyById(bodyIds[i]);
				if(body!=null){
					String htbh = body.getHtbh();
					JjzcHtZlwg wg = this.getJjzcHtZlwgByHtbh(htbh);
					wg.setBodyidlock("");
					this.update(wg);
					this.delete(body);
				}
			}
		}
	}
	
	public ClearQueryVO getClearQueryVOById(String id){
		ClearQueryVO vo = new ClearQueryVO();
		JyzcHtqsBody body = this.getJyzcHtqsBodyById(id);
		JjzcHtZlwg ht = this.getJjzcHtZlwgById(body.getHtId());
		vo.setId(checkNull(body.getId()));			//id
		vo.setHtbh(checkNull(body.getHtbh()));		//合同编号
		vo.setHtlx(checkNull(body.getCHtlx()));		//合同类型
		vo.setZcbh(checkNull(body.getZcbh()));		//资产编号
		vo.setZcmc(checkNull(body.getZcmc()));		//资产名称
		vo.setQsksrq(changeDate2String(body.getQsksrq()));		//	清算开始日期
		vo.setQsjzrq(changeDate2String(body.getQsjzrq()));		//清算截止日期
		vo.setCzr(checkNull(ht.getCzr()));			//承租人
		Double yzj = this.getYzj(ht.getId(),body.getQsksrq());
		vo.setYzj(checkNull(String.valueOf(ht.getYzj())));			//月租金
		vo.setHtzzrq(checkNull(changeDate2String(ht.getHtzzrq())));	//合同截至日期
		vo.setHtdqrq(checkNull(changeDate2String(ht.getHtdqrq())));//合同到期日期
		vo.setYszj(String.valueOf(body.getYszj()));
		vo.setSszj(String.valueOf(body.getSszj()));
		vo.setXghyszj(String.valueOf(body.getXghyszj()));
		vo.setBdyy(String.valueOf(body.getTzyy()));
		vo.setBodyId(body.getId());
		vo.setMzq(body.getMzq());
		vo.setQstzje(String.valueOf(body.getQstzje()));
		return vo;
	}

	/**
	 * 检测字符串是否为空
	 * add by 陈煜霄
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

	public List<JjzcHtZlwgLsb> getByHeadId(String cldId) {
		List<JjzcHtZlwgLsb> resultList = new ArrayList<JjzcHtZlwgLsb>();
		List params = new ArrayList();
		params.add(cldId);
		resultList = (List<JjzcHtZlwgLsb>) publicDao.find(
				"from JjzcHtZlwgLsb o where o.cldId = ? ", params);
		return resultList;
	}
	//查询时间 查找htzt是执行中的  如果合同结束时间是到期当晚 24:00  更改合同的状态

	public List<JjzcHtBx> getJjzcHtBx() {
		List<JjzcHtBx> resultList = new ArrayList<JjzcHtBx>();
		List params = new ArrayList();
		resultList = (List<JjzcHtBx>) publicDao.find(
				"from JjzcHtBx o where o.CHtzt= '1' where o.htdqrq =  ", params);
		return resultList;
	}

	public List<JjzcHtZlwgLsb> getJjzcHtZlwgLsb() {
		List<JjzcHtZlwgLsb> resultList = new ArrayList<JjzcHtZlwgLsb>();
		List params = new ArrayList();
		//得到当前时间  
		Date date = new Date();
		//当前时间与合同到期时间作比较
		resultList = (List<JjzcHtZlwgLsb>) publicDao.find(
				"from JjzcHtZlwgLsb o where o.CHtzt = 1 and o.htdqrq   ", params);
		return resultList;
	}

	public void deleteJjzcHtBx(String ids) {
		JjzcHtBx lsb = publicDao.findById(JjzcHtBx.class, ids);
		if(lsb != null)
			publicDao.delete(lsb);
	}

	/**
	 * 删除一条或多条合同临时表信息
	 * @param htIds
	 */
	public void deleteBodys(String[] htIds){
		if(htIds==null||htIds.length<1){
			return ;
		}
		StringBuffer sb = new StringBuffer("");
		sb.append(" in ( ");
		for(int i=0;i<htIds.length;i++){
			if(i==htIds.length-1){
				sb.append("'"+htIds[i]+"')");
			}else{
				sb.append("'"+htIds[i]+"',");
			}
		}
		StringBuffer sb1 = new StringBuffer("");
		sb1	.append(" SELECT A.HTBH ,A.C_HTLX AS HTLX ")
			.append(" FROM JJZC_HT_ZLWG_LSB A WHERE A.ID ")
			.append(sb.toString())
			.append(" UNION ")
			.append(" SELECT B.HTBH ,B.HTLX ")
			.append(" FROM JJZC_HT_BX B WHERE B.ID ")
			.append(sb.toString());
		List list = publicDao.queryForList(sb1.toString(), new ArrayList());
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map)list.get(i);
				String htlx = String.valueOf(map.get("htlx"));
				String htbh = String.valueOf(map.get("htbh"));
				String codeType = "";
				if(StringUtils.isNotEmpty(htbh)){  //此处的codeType 与4个页面的相同， zulin.jsp、weiguan.jsp、chexian.jsp、feichexian.jsp
					if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)){	//注销掉合同编号
						codeType = "wght";
					}else if(JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){
						codeType = "zlht";
					}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){
						codeType = "cxht";
					}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){
						codeType = "fcxht";
					}
					//iCodeGenerator.disableCurrentCode(codeType, htbh, "");
				}
			}	
		}
		String delSql1 = "DELETE FROM JJZC_HT_ZLWG_LSB A WHERE A.ID "+sb.toString();//删除租赁委管合同临时表里的相关数据
		String delSql2 = "DELETE FROM JJZC_HT_BX A WHERE A.ID "+sb.toString();		//删除保险合同临时表里的相关数据
		String delSql3 = "DELETE FROM JJZC_HT_JDZJ_LSB A WHERE A.HT_ID "+sb.toString();//删除租赁分段租金临时表里的相关数据
		String delSql4 = "DELETE FROM jjzc_ht_bxzcgx A WHERE A.BXHT_ID "+sb.toString();//删除保险资产关系表里的相关数据
		this.publicDao.getJdbcTemplate().execute(delSql1);
		this.publicDao.getJdbcTemplate().execute(delSql2);
		this.publicDao.getJdbcTemplate().execute(delSql3);
		this.publicDao.getJdbcTemplate().execute(delSql4);
	}
	
	public JjzcHtBx getByJjzcHtBxsId(String id){
		List<JjzcHtBx> resultList = new ArrayList<JjzcHtBx>();
		List params = new ArrayList();
		params.add(id);
		resultList = (List<JjzcHtBx>) publicDao.find(
				"from JjzcHtBx o where o.id= ? ", params);
		return resultList.get(0);
	}

	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public void updateInfoToBody(String headId,String[] qsjzrqs, String[] yszjs,String[] qstzje,
			String[] xghyszj,String[] tzyy,String[] htbh,String[] qsksrq,String[]bodyIds,String[]mzq
			){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(htbh!=null&&htbh.length>0){
			for (int i = 0; i < htbh.length; i++) {
				String htbh1 = htbh[i];
				//JyzcHtqsBody body = this.getJyzcHtqsBodyById(bodyId);  // modify by lantianbo 2010-12-25	
				JjzcHtZlwg ht = this.getJjzcHtZlwgByHtbh(htbh1);
				JyzcHtqsBody body = new JyzcHtqsBody();
				if(bodyIds[i]!=null&&checkString(bodyIds[i]).length()>0){
					body = this.getJyzcHtqsBodyById(bodyIds[i]);
				}else{
					if(ht!=null){
						body.setHtId(ht.getId());
						body.setHtbh(ht.getHtbh());
						body.setZcId(ht.getZcid());
						body.setZcbh(ht.getZcbh());
						body.setZcmc(ht.getZcmc());
						body.setCHtlx(JygdzcCommon.CONTRACT_WGHT.equals(ht.getCHtlx())?"委管合同":"租赁合同");
					}
					body.setSpzt("0");//审批状态为未审批
					body.setCldId(headId);
				}
				body.setYszj(Double.valueOf(yszjs[i]));
				Date date = null;
				Date date1 = null;
				try {
					date = sdf.parse(qsjzrqs[i]);
					date1 = sdf.parse(qsksrq[i]);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				body.setQsjzrq(date);
				body.setQsksrq(date1);
				body.setMzq(mzq[i]);
				body.setQstzje(Double.valueOf("".equals(qstzje[i])?"0":qstzje[i]));
				body.setXghyszj(Double.valueOf("".equals(xghyszj[i])?"0":xghyszj[i]));
				body.setYsxgyy(tzyy[i]);
				this.save(body);
				this.countTotal(headId);
			}
		}
	}
	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public void updateInfo(String headId,String[] qsjzrqs, String[] yszjs,String[] qstzje,
			String[] xghyszj,String[] tzyy,String[] htbh,String[] qsksrq,String[]bodyIds
			){
		if(htbh!=null&&htbh.length>0){
			for (int i = 0; i < htbh.length; i++) {
				String htbh1 = htbh[i];
				JyzcHtqsBody body = this.getJyzcHtqsBodyByHeadId(headId,htbh[i]);  
				this.save(body);
			}
		}
	}
	/**
	 * 
	 */
	public JyzcHtqsBody getJyzcHtqsBodyByHeadId(String headId ,String htbh) {
		List<JyzcHtqsBody> resultList = new ArrayList();
		List params = new ArrayList();
		params.add(headId);
		params.add(htbh);
		resultList = (List<JyzcHtqsBody>) publicDao.find(
				"from JyzcHtqsBody where  cldId = ? and htbh=? order by id ",params);
		if (resultList.size() == 0) {
			return null;
		}else{
			return resultList.get(0);
		}
	}
	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public String validateHt(String headId, String htIds){
		String sql = "select HT_ID,HTBH from jyzc_htqs_body t where t.cld_id = ?";
		String validateHtId = "";
		List list = this.publicDao.queryForList(sql, new Object[]{headId});
		if((list!=null && list.size()>0)&&(htIds!=null&&htIds.length()>0)){
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				String id = String.valueOf(map.get("HT_ID"));
				String bh = String.valueOf(map.get("HTBH"));
				if(htIds.startsWith(",")){
					htIds = htIds.substring(1);
				}
				if("".equals(htIds)){
					return "";
				}
				String[] htids = htIds.split(",");
				for (int j = 0; j < htids.length; j++) {
					if(htids[j].equals(id)){
						validateHtId += (bh+",");
					}
				}
			}
		}
		if(validateHtId.endsWith(",")){
			validateHtId = validateHtId.substring(0,validateHtId.length()-1);
		}
		return validateHtId;
	}
	/**
	 * 锁合同
	 * @param headId
	 */
	public void lockContrat4Liquidate(String headId){
		List list = this.getBodyListByHeadId(headId);
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				JyzcHtqsBody body = (JyzcHtqsBody) list.get(i);
				String bodyId= body.getId();
				String htId = body.getHtId();
				JjzcHtZlwg ht = this.getJjzcHtZlwgById(htId);
				ht.setBodyidlock(bodyId);
				this.update(ht);
			}
		}
	}
	
	/**
	 * 查询清算body列表
	 * @param headid
	 * @return
	 */
	public List<JyzcHtqsBody> getBodyListByHeadId(String headid) {
		List<JyzcHtqsBody> resultList = new ArrayList();
		resultList = (List<JyzcHtqsBody>) publicDao.find(
				"from JyzcHtqsBody where  cldId = ?  order by id ",new Object[]{headid});
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}
	
	/**
	 * 算总钱数
	 * @param headId
	 */
	public void countTotal(JjzcHtqsHead head){
		List list = this.getBodyListByHeadId(head.getId());
		double ysyfzje = 0.0;
		double tzzje = 0.0;
		double thysyfzje = 0.0;
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				JyzcHtqsBody body = (JyzcHtqsBody) list.get(i);
				ysyfzje += body.getYszj();
				tzzje += body.getQstzje();
				thysyfzje += body.getXghyszj();
			}
			head.setYsyfzje(ysyfzje);
			head.setTzzje(tzzje);
			head.setThysyfzje(thysyfzje);
			this.update(head);
		}
	}
	public void countTotal(String headId){
		List list = this.getBodyListByHeadId(headId);
		double ysyfzje = 0.0;
		double tzzje = 0.0;
		double thysyfzje = 0.0;
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				JyzcHtqsBody body = (JyzcHtqsBody) list.get(i);
				ysyfzje += body.getYszj();
				tzzje += body.getQstzje();
				thysyfzje += body.getXghyszj();
			}
			JjzcHtqsHead head = this.getJjzcHtqsHeadById(headId);
			head.setYsyfzje(ysyfzje);
			head.setTzzje(tzzje);
			head.setThysyfzje(thysyfzje);
			this.update(head);
		}
	}
	//public String getHtlxBy
	/**
	 * 根据合同类型，合同id 查出合同关联的资产
	 * @return
	 */
	public String getZc4Ht(String htId, String htlx){
		String str = "";
		List list = this.getZc4HtList(htId, htlx);
		str = BodyListToJSON.getJSON(list, 1, 1, 10000);
		return str;
	}
	/**
	 * 根据合同类型，合同id(zsb) 查出合同关联的资产
	 * @return
	 */
	public List getZc4HtInfo(String htId, String htlx){
		List resultList = new ArrayList();
		String zcId = "";
		if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)||JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){//委管合同，租赁合同
			JjzcHtZlwg ht = this.getJjzcHtZlwgById(htId);
			if(ht!=null){
				zcId = ht.getZcid();
				resultList.add(zcId);
			}
		}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){//车险合同
			JjzcHtBx ht = this.getJjzcHtBxById(htId);
			zcId = ht.getZcid();
			resultList.add(zcId);
		}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){//非车险合同 
			String sql = "from JjzcHtBxzcgx t where t.bxhtId = ? and spzt='2' ";
			List list = this.publicDao.find(sql, new Object[]{htId});
			if(list!=null&&list.size()>0){
				for(int j=0;j<list.size();j++){
					JjzcHtBxzcgx gx = (JjzcHtBxzcgx) list.get(j);
					if(gx!=null){
						zcId =gx.getZcId();
						resultList.add(zcId);
					}
				}
			}
		}
		return resultList;
	}
	/**
	 * 根据合同类型，合同id 查出合同关联的资产
	 * @return
	 */
	public List getZc4HtList(String htId, String htlx){
		List<HtViewVOZC> resultList = new ArrayList();
		String zcId = "";
		if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)||JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){//委管合同，租赁合同
			JjzcHtZlwgLsb ht = this.getJjzcHtZlwgLsbById(htId);
			if(ht!=null){
				zcId = ht.getZcid();	
			}
		}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){//车险合同
			JjzcHtBx ht = this.getJjzcHtBxById(htId);
			zcId = ht.getZcid();
		}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){//非车险合同 
			String sql = "from JjzcHtBxzcgx t where t.bxhtId = ? ";
			List list = this.publicDao.find(sql, new Object[]{htId});
			if(list!=null&&list.size()>0){
				for(int j=0;j<list.size();j++){
					JjzcHtBxzcgx gx = (JjzcHtBxzcgx) list.get(j);
					if(gx!=null){
						zcId =gx.getZcId();
						this.getHtViewVOZCByZcId(resultList, zcId);
					}
				}
			}
			return resultList;//因为委管合同，租赁合同，车险合同只关联一条资产信息，而非车险合同关联多条资产信息，所以此处操作不同
		}
		this.getHtViewVOZCByZcId(resultList, zcId);
		return resultList;
	}

	//根据资产id 得到显示的列表，新增合同时，关联资产的信息
	private void getHtViewVOZCByZcId(List<HtViewVOZC> resultList, String zcId) {
		JyzcXx jyzcxx = (JyzcXx) publicDao.findSingleResult("from JyzcXx x where x.id=? ",new Object[]{zcId});
		if(jyzcxx!=null){
			HtViewVOZC htViewVOZC = new HtViewVOZC();
			try {
				BeanUtils.copyProperties(htViewVOZC, jyzcxx);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			htViewVOZC.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(jyzcxx.getCZcdq()))));//地区
			htViewVOZC.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(jyzcxx.getCZclx()))));//资产类型
			htViewVOZC.setId(jyzcxx.getId());
			htViewVOZC.setYbyz(assetBS.getYbyz(jyzcxx.getId())); 
			htViewVOZC.setZkpbh(assetBS.getZkpbh(jyzcxx.getId()));
			htViewVOZC.setZkpmc(assetBS.getZkpmc(jyzcxx.getId()));
			resultList.add(htViewVOZC);
		}
	}
	/**
	 * 根据合同id，选择的资产id 删除资产与合同之间的关系
	 */
	public void deleteZc4Ht(String htId, String zcIds,String htlx){
		if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)||JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){//委管合同，租赁合同
			JjzcHtZlwgLsb ht = this.getJjzcHtZlwgLsbById(htId);
			ht.setZcbh(null);
			ht.setZcid(null);
			ht.setZcmc(null);
			this.update(ht);
		}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){//车险合同
			JjzcHtBx ht = this.getJjzcHtBxById(htId);
			ht.setZcbh(null);
			ht.setZcid(null);
			ht.setZcmc(null);
			this.update(ht);
		}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){//非车险合同
			if(zcIds.startsWith(",")){
				zcIds = zcIds.substring(1);
			}
			String []zcids = zcIds.split(",");
			if(zcids!=null&&zcids.length>0){
				StringBuffer sb = new StringBuffer("");
				sb.append(" in ( ");
				for(int i=0;i<zcids.length;i++){
					if(i==zcids.length-1){
						sb.append("'"+zcids[i]+"')");
					}else{
						sb.append("'"+zcids[i]+"',");
					}
				}
				String sql = "delete from jjzc_ht_bxzcgx t where t.zc_id "+sb.toString();
				this.publicDao.getJdbcTemplate().execute(sql);
			}
		}
	}
	
	/**
	 * 根据合同id，选择的资产id 合同类型 关联资产与合同之间的关系
	 * @param htId
	 * @param zcIds
	 * @param htlx
	 */
	public void getZcList(String htId, String zcIds, String htlx){
		if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)||JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){//委管合同，租赁合同
			JyzcXx xx = this.getJyZcXxById(zcIds);
			JjzcHtZlwgLsb ht = this.getJjzcHtZlwgLsbById(htId);
			ht.setZcbh(xx.getZcbh());
			ht.setZcid(xx.getId());
			ht.setZcmc(xx.getZcmc());
			this.update(ht);
		}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){//车险合同
			JyzcXx xx = this.getJyZcXxById(zcIds);
			JjzcHtBx ht = this.getJjzcHtBxById(htId);
			ht.setZcbh(xx.getZcbh());
			ht.setZcid(xx.getId());
			ht.setZcmc(xx.getZcmc());
			this.update(ht);
		}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){//非车险合同
			if(zcIds.startsWith(",")){
				zcIds.substring(1);
			}
			String []zcids = zcIds.split(",");
			JyzcXx xx = null;
			for (int i = 0; i < zcids.length; i++) {
				xx = this.getJyZcXxById(zcids[i]);
				if(xx!=null){
					JjzcHtBxzcgx gx = this.getJjzcHtBxzcgxByHtIdAndZcId(htId,zcids[i]);
					if(gx==null){
						gx = new JjzcHtBxzcgx();
						gx.setBxhtId(htId);
						gx.setZcId(zcids[i]);
						this.save(gx);
					}
				}
			}
		}
	}
	//根据合同id，资产id查询合同保险资产关系
	private JjzcHtBxzcgx getJjzcHtBxzcgxByHtIdAndZcId(String htId, String zcId) {
		String sql = "from JjzcHtBxzcgx gx where gx.bxhtId = ? and gx.zcId = ?";
		return (JjzcHtBxzcgx) this.publicDao.findSingleResult(sql, new Object[]{htId,zcId});
		
	}

	/**
	 * 根据id查询资产信息
	 * @param id
	 * @return
	 */
	public JyzcXx getJyZcXxById(String id){
		String sql = "from JyzcXx x where x.id=?";
		return (JyzcXx) this.publicDao.findSingleResult(sql, new Object[]{id});
	}
	
	/**
	 * 根据合同id，分段租金数据保存分段租金数据
	 * @param id
	 * @param ksrqs
	 * @param jsrqs
	 * @param yzjs
	 */
	public void updateJdzjByHtId(String id, String[] ksrqs, String[] jsrqs,
			String[] yzjs){
		this.deleteJdzjByHtId(id);//先删除合同下的阶段租金，再添加
		if(ksrqs!=null && ksrqs.length>0){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			JjzcHtJdzjLsb jdzj = null;
			for (int i = 0; i < yzjs.length; i++) {
				jdzj = new JjzcHtJdzjLsb();
				jdzj.setHtId(id);
				try {
					jdzj.setKsrq(sdf.parse(ksrqs[i]));
					jdzj.setJsrq(sdf.parse(jsrqs[i]));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jdzj.setYzj(Double.valueOf(yzjs[i]));
				this.publicDao.save(jdzj);
			}
		}
	}
	/**
	 * 根据合同id删除合同阶段租金表数据
	 * @param htId
	 */
	public void deleteJdzjByHtId(String htId){
		String sql = "delete from JJZC_HT_JDZJ_LSB t where t.HT_ID = '"+htId+"'";
		this.publicDao.getJdbcTemplate().execute(sql);
	}
	
	/**
	 * 根据合同id查询分段租金列表
	 * @param htId
	 * @return
	 */
	public List getJdzjList(String htId){
		String sql = "from JjzcHtJdzjLsb t where t.htId = ?";
		List list = this.publicDao.find(sql, new Object[]{htId});
		return list;
	}
	/**
	 * 根据合同正式表id查询分段租金列表
	 * @param htId
	 * @return
	 */
	public List getzsbJdzjList(String htId){
		String sql = "from JjzcHtJdzj t where t.htId = ?";
		List list = this.publicDao.find(sql, new Object[]{htId});
		return list;
	}
	/**
	 * 终止合同
	 * @param htId
	 * @param jjzcHtZlwgLsb
	 */
	public void zhongzhiContract(String htId, JjzcHtZlwgLsb jjzcHtZlwgLsb){
		if(htId!=null&&htId.length()>0){
			if(htId.startsWith(",")){
				htId=htId.substring(1);
			}
			String []htIds = htId.split(",");
			JjzcHtZlwgLsb ht=null;
			for (int i = 0; i < htIds.length; i++) {
				ht = this.getJjzcHtZlwgLsbById(htIds[i]);
				ht.setHtzzrq(jjzcHtZlwgLsb.getHtzzrq());
				ht.setCZzyy(jjzcHtZlwgLsb.getCZzyy());
				ht.setZzblsm(jjzcHtZlwgLsb.getZzblsm());
				this.update(ht);
			}
		}
	}
	
	/**
	 * //对合同的变动信息进行记录
	 * @param jjzcHtZlwgLsb
	 */
	public void saveRecordhistory(JjzcHtZlwgLsb lsb){
		JjzcHtZlwg ht = this.getJjzcHtZlwgByHtbh(lsb.getHtbh());
		this.deleteRecord(new String[]{lsb.getId()});
		this.compareHtVsBody(lsb, ht);
	}
	/**
	 * 删除多条变动记录
	 */
	public void deleteRecord(String[] bodyId) {
		for (int i = 0; i < bodyId.length; i++) {
			String sql = "delete from recordhistory where zc_id = '"+bodyId[i]+"'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}
	
	/**
	 * 流程办结并生成台账
	 * @param headId
	 * @return
	 */
	public String banjie(String headId){
		String result = "";
		
		JjzcHtJdzjLsb jjzcHtJdzjLsb = new JjzcHtJdzjLsb();
		List<JjzcHtJdzjLsb> jjzcHtJdzjLsbList = new ArrayList<JjzcHtJdzjLsb>();
		try{
			JjzcHtqsHead head = this.getJjzcHtqsHeadById(headId);
			String ywlx = head.getYwlx();
			List zwlist = this.getByHeadId(headId);
			List bxlist = null;
			if(JygdzcCommon.CONTRACT_CLD_XZ.equals(ywlx)){//是新增的合同
				bxlist = this.getJjzcHtBxByCldId(headId);
				if(zwlist!=null&&zwlist.size()>0){//租赁，委管合同
					JjzcHtZlwgLsb lsb = null;
					JjzcHtZlwg zwht = null; 
					//找到租赁合下的阶段月租金表 并把月租金的临时表改为正式表里
					for(int i=0;i<zwlist.size();i++){
						lsb = (JjzcHtZlwgLsb) zwlist.get(i);
						zwht = new JjzcHtZlwg();
						BeanUtils.copyProperties(zwht, lsb);
						zwht.setId(null);
						this.save(zwht);
						List JdzjLsbList =  this.getJdzjList(lsb.getId());
						if(JdzjLsbList!=null&&JdzjLsbList.size()>0){
							for(int j=0;j<JdzjLsbList.size();j++){
								JjzcHtJdzj Jdzj = new JjzcHtJdzj();
								JjzcHtJdzjLsb JdzjLsb = (JjzcHtJdzjLsb) JdzjLsbList.get(j);
								BeanUtils.copyProperties(Jdzj, JdzjLsb);
								Jdzj.setId(null);
								Jdzj.setHtId(zwht.getId());
								this.save(Jdzj);
							}
						}
					this.afterBanjieZW(headId);//办结后更新租赁委管临时表状态
					}
				}
				if(bxlist!=null&&bxlist.size()>0){//车险非车险合同
					this.afterBanjieBX(headId);//办结后更新保险合同表状态
				}
			}else if(JygdzcCommon.CONTRACT_CLD_BD.equals(ywlx)){//变动合同
				if(zwlist!=null&&zwlist.size()>0){//租赁，委管合同
					JjzcHtZlwgLsb lsb = null;
					JjzcHtZlwg zwht = null; 
					for(int i=0;i<zwlist.size();i++){
						lsb = (JjzcHtZlwgLsb) zwlist.get(i);
						zwht = this.getJjzcHtZlwgByHtbh(lsb.getHtbh());
						String zwhtId = zwht.getId();
						this .deteleJjzcHtJdzjByHtId(zwhtId);//先删除分段租金，正式表的数据，
						this.copyJdzjLsb2Zsb(zwhtId,lsb.getId());//然后将临时表的数据拷贝到正式表
						BeanUtils.copyProperties(zwht, lsb);
						zwht.setId(zwhtId);
						this.update(zwht);
						//拷贝 附件======================================
						String FileType = "1";
						attachHandleServiceImpl.copyAttach(lsb.getId(), FileType , zwht.getId(), FileType);
						this.afterBanjieZW(headId);//办结后更新租赁委管临时表状态
					}
				}
			}else if(JygdzcCommon.CONTRACT_CLD_ZZ.equals(ywlx)){//终止合同
				if(zwlist!=null&&zwlist.size()>0){//租赁，委管合同
					JjzcHtZlwgLsb lsb = null;
					JjzcHtZlwg zwht = null; 
					for(int i=0;i<zwlist.size();i++){
						lsb = (JjzcHtZlwgLsb) zwlist.get(i);
						zwht = this.getJjzcHtZlwgByHtbh(lsb.getHtbh());
						zwht.setHtzzrq(lsb.getHtzzrq());//合同终止日期
						zwht.setZzblsm(lsb.getZzblsm());//终止办理说明
						zwht.setCZzyy(lsb.getCZzyy());//终止原因
						zwht.setHtsftqzz(JygdzcCommon.CONTRACT_ZZ_YES);//合同是否提前终止
						zwht.setCHtzt(JygdzcCommon.CONTRACT_ZT_ZXWB);//合同状态
						this.update(zwht);
						String FileType = "1";
						attachHandleServiceImpl.copyAttach(lsb.getId(), FileType , zwht.getId(), FileType);
						this.afterBanjieZW(headId);//办结后更新租赁委管临时表状态
					}
				}
			}
			head.setZhuangtai(JygdzcCommon.CONTRACT_SPZT_YSP);
			this.update(head);
			result = "办结成功！";
		}catch (Exception e){
			result = "办结失败！";
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 办结后更新保险合同表状态
	 * @param headId
	 */
	private void afterBanjieBX(String headId) {
		String sql = "UPDATE JJZC_HT_BX T SET T.SPZT = '"+JygdzcCommon.CONTRACT_SPZT_YSP
					+"'  WHERE T.CLD_ID = '"+headId+"'";
		this.publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 办结后更新租赁委管临时表状态
	 * @param headId
	 */
	private void afterBanjieZW(String headId) {
		String sql = "UPDATE JJZC_HT_ZLWG_LSB T SET T.SPZT = '"+JygdzcCommon.CONTRACT_SPZT_YSP
					+"'  WHERE T.CLD_ID = '"+headId+"'";
		this.publicDao.getJdbcTemplate().execute(sql);
	}
	
	/**
	 * 将临时分段租金表数据拷贝到正式分段租金表
	 * @param zwhtId
	 * @param id
	 */
	private void copyJdzjLsb2Zsb(String zwhtId, String id) {
		String sql = "INSERT INTO JJZC_HT_JDZJ(ID,HT_ID,KSRQ,JSRQ,BIANDONG,YZJ) " +
					"SELECT SYS_GUID() ,'"+zwhtId+"',KSRQ,JSRQ,BIANDONG,YZJ " +
					"FROM JJZC_HT_JDZJ_LSB B WHERE B.HT_ID='"+id+"'";
		this.publicDao.getJdbcTemplate().execute(sql);
		
	}

	/**
	 * 
	 */
	public void deteleJjzcHtJdzjByHtId(String htId){
		String sql = "delete from jjzc_ht_jdzj t where t.HT_ID = '"+htId+"'";
		this.publicDao.getJdbcTemplate().execute(sql);
	}
	public List getJjzcHtBxByCldId(String headId){
		List params = new ArrayList();
		params.add(headId);
		List list =  publicDao.find("from JjzcHtBx o where o.cldId = ? ", params);
		return list;
	}
	/**
	 * 根据合同Id 处理单ID 找出变动信息
	 * @param zcId
	 * @param pkId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Recordhistory> getRecordhistoryByhtId(String htId ,String pkId) {
		if (htId == null || "".equals(htId)) {
			return null;
		} else {
			List params = new ArrayList();
			List<Recordhistory> resultList = new ArrayList();
			params.add(htId);
			params.add(pkId);
			String preparedHQL = "from Recordhistory o where o.zcId=? and o.pkId=? order by o.changedate desc";
			resultList = (List<Recordhistory>) this.publicDao.find(preparedHQL, params);
			return resultList;
		}
	}
	/**
	 * 根据合同编号查找出历史变动信息
	 * @param zcId
	 * @param pkId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Recordhistory> getRecordhistoryByhtbh(String htbh) {
		if (htbh == null || "".equals(htbh)) {
			return null;
		} else {
			List<String> htlsbIdList = this.gethtlsbIdByhtbh(htbh);
			List<Recordhistory> resultList = new ArrayList();
			List params = new ArrayList();
			StringBuilder sb = new StringBuilder();
			for(String id : htlsbIdList){
				sb.append("'").append(id).append("'").append(",");
			}
			if(htlsbIdList.size()>0){
				sb.deleteCharAt(sb.lastIndexOf(","));
				String preparedHQL = "from Recordhistory o where o.zhuangTai='2' and o.zcId in (" + sb.toString() + ") order by o.changedate desc";
				resultList = (List<Recordhistory>) this.publicDao.find(preparedHQL, params);
			}
			return resultList;
		}
	}
	public List<String> gethtlsbIdByhtbh(String htbh ) {
		if (htbh == null || "".equals(htbh)) {
			return null;
		} else {
			List params = new ArrayList();
			List<String> htlsbIdList = new ArrayList();
			params.add(htbh);
			String preparedHQL = "from JjzcHtZlwgLsb o where o.htbh=? and o.spzt='2'";
			List<JjzcHtZlwgLsb> jjzcHtZlwgLsbList =  (List<JjzcHtZlwgLsb>) this.publicDao.find(preparedHQL, params);
			if(jjzcHtZlwgLsbList!=null&&jjzcHtZlwgLsbList.size()>0){
				for(int i=0;i<jjzcHtZlwgLsbList.size();i++){
					JjzcHtZlwgLsb jjzcHtZlwgLsb =jjzcHtZlwgLsbList.get(i);
					htlsbIdList.add(jjzcHtZlwgLsb.getId());
				}
			}
			return htlsbIdList;
		}
	}
	/**
	 * 根据合同ID 查询相应清算信息
	 * @param htId
	 * @return
	 */
	public List<JyzcHtqsBody> getJyzcHtqsBodyByhtbh(String htbh ) {
		if (htbh == null || "".equals(htbh)) {
			return null;
		} else {
			List params = new ArrayList();
			params.add(htbh);
			String preparedHQL = "from JyzcHtqsBody o where o.htbh=? and o.spzt='2'";
			List<JyzcHtqsBody> jyzcHtqsBodyList =  (List<JyzcHtqsBody>) this.publicDao.find(preparedHQL, params);
			return jyzcHtqsBodyList;
		}
	}
	/**
	 * 通过codeKey查找codename
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String coteType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = coteType;
			str[1] = codeKey;
			com.tansun.eam2.common.model.orm.bo.Code tree = new com.tansun.eam2.common.model.orm.bo.Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if(tree!=null&&!"".equals(tree)){
				String codeValue = tree.getCodeValue();
				return codeValue;
			}else{
				return "";
			}
		} else {
			return "";
		}
	}
	/**
	 * 页面点击确定后，保存信息， add by lantianbo 2011-1-9
	 * @return
	 */
	public void updateInfoToBody1(String headId, String[] sszjs,
			String[] bcbdjes, String[] scbdjes, String[] bdyys, String[] bodyIds){
		if(bodyIds!=null&&bodyIds.length>0){
			double ssje = 0.0;
			double tzje = 0.0;
			for (int i = 0; i < bodyIds.length; i++) {
				JyzcHtqsBody body = this.getJyzcHtqsBodyById(bodyIds[i]);  	
				body.setSszj(Double.valueOf("".equals(sszjs[i])?"0":sszjs[i]));
				body.setBcbdje(Double.valueOf("".equals(bcbdjes[i])?"0":bcbdjes[i]));
				body.setScbdje(Double.valueOf("".equals(scbdjes[i])?"0":scbdjes[i]));
				body.setTzyy(bdyys[i]);
				tzje += Double.valueOf("".equals(bcbdjes[i])?"0":bcbdjes[i]);
				ssje += Double.valueOf("".equals(sszjs[i])?"0":sszjs[i]);
				this.update(body);
			}
			JjzcHtqsHead head = this.getJjzcHtqsHeadById(headId);
			head.setThsszje(ssje);
			head.setSstzzje(tzje);
			this.update(head);
		}
	}
	
	
	/**
	 * 从正式表里查出的数据到临时表里 但是不能重复添加
	 * @param id
	 * @return
	 */
	public String queryForSingle(String cldId,String zcIds){
		System.out.println("=========="+cldId+","+zcIds);
		//用来拼接临时表里存在的资产编号的值 用拼接字符串的格式
		StringBuffer buffer = new StringBuffer();
		if (zcIds.startsWith(",")) {
			zcIds = zcIds.substring(1);
		}
		String[] zcId = zcIds.split(",");
		System.out.println("--------"+zcId.length);
        //传过来 cldId 和 htId 
		
		for (int i = 0; i < zcId.length; i++) {
			System.out.println("===========================");
			String sql = "from JyzcXxLsb x where x.cldId = ? and x.zcbh = ? ";
			List list = publicDao.find(sql, new Object[]{cldId,zcId[i]});
			//如果>0的话就是说明存在
			if(list.size() > 0 ){
				System.out.println("zcId"+zcId[i]);
				buffer.append(zcId[i]+",");
			}
		}
		String returnValue = buffer+""; 
		System.out.println("---------"+returnValue);
		return returnValue;
	}
	
	public List<PTEnd> findMyPTEndList_nopage(String strZcId,String strTitle) {
		List<PTEnd> resultList = new ArrayList();
		List templist = new ArrayList();
		StringBuffer stringbuffer = new StringBuffer();
		String strSQL = "";
		stringbuffer.append("select id ");
		stringbuffer.append("  from p_t_end");
		stringbuffer.append(" where (head_id in (select cld_id from jyzc_htqs_body where spzt='2' and  HTBH = '"+strZcId+"') or ");
		stringbuffer.append("       head_id in (select cld_id from JJZC_HT_ZLWG_LSB where  spzt='2' and  HTBH =  '"+strZcId+"'))");
		if(strTitle !=null && strTitle.toString().trim().length()>0 ){
			stringbuffer.append(" and title like '%"+strTitle+"%' ");
		}
		stringbuffer.append(" order by id desc");
		templist = publicDao.queryForList(stringbuffer.toString(), new ArrayList());
		for (int i = 0; i < templist.size(); i++) {
			Map tempMap = (Map) templist.get(i);
			PTEnd ptend = publicDao.findById(PTEnd.class,new Long( tempMap
					.get("ID").toString()));
			resultList.add(ptend);
		}
		return resultList;
	}

	/**
	 * 根据租赁ID 合同ID 新增合同 租赁数据作为合同数据 租赁流程 作为合同的办理依据
	 * @param zlHeadId
	 * @param htHeadID
	 */
	public void tenancyTOcontract(String zlHeadId ,String htHeadID){
		try{
			JyzcJyzlHead zlHead = (JyzcJyzlHead) assetBS.findById(JyzcJyzlHead.class, zlHeadId);
			String ywlx = zlHead.getYwlx();
			String hql =  "select distinct t from JyzcJyzlLsb t where t.cldId =?";
			List params = new ArrayList();
			params.add(zlHeadId);
			List<JyzcJyzlLsb> JyzcJyzlLsbList = (List<JyzcJyzlLsb>) publicDao.find(hql ,params);
			if(JyzcJyzlLsbList!=null&&JyzcJyzlLsbList.size()>0&&zlHeadId!=null&&htHeadID!=null){
				for(int i=0; i<JyzcJyzlLsbList.size();i++){
					JyzcJyzlLsb jyzcJyzlLsb = JyzcJyzlLsbList.get(i);
					if("0".equals(ywlx)){
						JjzcHtZlwgLsb jjzcHtZlwgLsb = new JjzcHtZlwgLsb();
						String zcId = jyzcJyzlLsb.getZcId();
						jjzcHtZlwgLsb.setZcid(zcId);
						jjzcHtZlwgLsb.setJydx(jyzcJyzlLsb.getJydx());
						jjzcHtZlwgLsb.setCzr(jyzcJyzlLsb.getCzr());
						if(jyzcJyzlLsb.getCzyt()!=null&&jyzcJyzlLsb.getCzyt().trim()!=""){
							jjzcHtZlwgLsb.setZlyt(jyzcJyzlLsb.getCzyt());
						}
						JyzcXx jyzcXx = (JyzcXx) assetBS.findById(JyzcXx.class, zcId);
						JjzcHtqsHead jjzcHtqsHead =  (JjzcHtqsHead) assetBS.findById(JjzcHtqsHead.class, htHeadID);
						jjzcHtZlwgLsb.setLrr(jjzcHtqsHead.getNgrmc());
						jjzcHtZlwgLsb.setLrrq(jjzcHtqsHead.getNgrq());
						jjzcHtZlwgLsb.setCldId(htHeadID);
						jjzcHtZlwgLsb.setCzsl(jyzcJyzlLsb.getYxzlmj());
						jjzcHtZlwgLsb.setHtqsrq(jyzcJyzlLsb.getZlqsrq());
						jjzcHtZlwgLsb.setHtdqrq(jyzcJyzlLsb.getZldqrq());
						jjzcHtZlwgLsb.setHtzzrq(jyzcJyzlLsb.getZldqrq());
						if(jyzcXx!=null){
							jjzcHtZlwgLsb.setZcbh(jyzcXx.getZcbh());
							jjzcHtZlwgLsb.setZcmc(jyzcXx.getZcmc());
						}
						String bianhao = iCodeGenerator.generateCurrentCode("zlht", "", "");
						if(bianhao!=null){
							jjzcHtZlwgLsb.setHtbh(bianhao);
						}
						jjzcHtZlwgLsb.setCHtlx("2");
						this.save(jjzcHtZlwgLsb);
					}else if("1".equals(ywlx)){
						JjzcHtZlwgLsb jjzcHtZlwgLsb = new JjzcHtZlwgLsb();
						String htId = jyzcJyzlLsb.getHtId();
						JjzcHtZlwg jjzcHtZlwg = this.getJjzcHtZlwgById(htId);
						
						BeanUtils.copyProperties(jjzcHtZlwgLsb, jjzcHtZlwg);
						jjzcHtZlwgLsb.setId(null);
						
						jjzcHtZlwgLsb.setJydx(jyzcJyzlLsb.getJydx());
						jjzcHtZlwgLsb.setCzr(jyzcJyzlLsb.getCzr());
						if(jyzcJyzlLsb.getCzyt()!=null&&jyzcJyzlLsb.getCzyt().trim()!=""){
							jjzcHtZlwgLsb.setZlyt(jyzcJyzlLsb.getCzyt());
						}
						JjzcHtqsHead jjzcHtqsHead =  (JjzcHtqsHead) assetBS.findById(JjzcHtqsHead.class, htHeadID);
						jjzcHtZlwgLsb.setLrr(jjzcHtqsHead.getNgrmc());
						jjzcHtZlwgLsb.setLrrq(jjzcHtqsHead.getNgrq());
						jjzcHtZlwgLsb.setCldId(htHeadID);
						jjzcHtZlwgLsb.setHtqsrq(jyzcJyzlLsb.getZlqsrq());
						jjzcHtZlwgLsb.setHtdqrq(jyzcJyzlLsb.getZldqrq());
						jjzcHtZlwgLsb.setHtzzrq(jyzcJyzlLsb.getZldqrq());
						this.save(jjzcHtZlwgLsb);
						//拷贝阶段租金
						List JdzjList =  this.getzsbJdzjList(jjzcHtZlwg.getId());
						if(JdzjList!=null&&JdzjList.size()>0){
							for(int j=0;j<JdzjList.size();j++){
								JjzcHtJdzj Jdzj = (JjzcHtJdzj) JdzjList.get(j);
								JjzcHtJdzjLsb JdzjLsb = new JjzcHtJdzjLsb();
								BeanUtils.copyProperties(JdzjLsb,Jdzj);
								JdzjLsb.setId(null);
								JdzjLsb.setHtId(jjzcHtZlwgLsb.getId());
								this.save(Jdzj);
							}
						}
					}else if("2".equals(ywlx)){
						JjzcHtZlwgLsb jjzcHtZlwgLsb = new JjzcHtZlwgLsb();
						String htId = jyzcJyzlLsb.getHtId();
						JjzcHtZlwg jjzcHtZlwg = this.getJjzcHtZlwgById(htId);
						BeanUtils.copyProperties(jjzcHtZlwgLsb, jjzcHtZlwg);
						jjzcHtZlwgLsb.setId(null);
						jjzcHtZlwgLsb.setHtzzrq(jyzcJyzlLsb.getTzrq());
						JjzcHtqsHead jjzcHtqsHead =  (JjzcHtqsHead) assetBS.findById(JjzcHtqsHead.class, htHeadID);
						jjzcHtZlwgLsb.setLrr(jjzcHtqsHead.getNgrmc());
						jjzcHtZlwgLsb.setLrrq(jjzcHtqsHead.getNgrq());
						jjzcHtZlwgLsb.setCldId(htHeadID);
						this.save(jjzcHtZlwgLsb);
						//拷贝阶段租金
						List JdzjList =  this.getzsbJdzjList(jjzcHtZlwg.getId());
						if(JdzjList!=null&&JdzjList.size()>0){
							for(int j=0;j<JdzjList.size();j++){
								JjzcHtJdzj Jdzj = (JjzcHtJdzj) JdzjList.get(j);
								JjzcHtJdzjLsb JdzjLsb = new JjzcHtJdzjLsb();
								BeanUtils.copyProperties(JdzjLsb,Jdzj);
								JdzjLsb.setId(null);
								JdzjLsb.setHtId(jjzcHtZlwgLsb.getId());
								this.save(Jdzj);
							}
						}	
					}
					String pthql ="select  t from PTEnd t where t.headId =? ";
					List ptparams = new ArrayList();
					ptparams.add(zlHeadId);
					List pTEndList = publicDao.find(pthql, ptparams);
					if(pTEndList!=null&&pTEndList.size()==1){
						PTEnd  pTEnd =new PTEnd();
						pTEnd = (PTEnd) pTEndList.get(0);
						CommonAccording blyj = new CommonAccording();
						blyj.setBdid(htHeadID);
						blyj.setBh(pTEnd.getSheetId());
						blyj.setBt(pTEnd.getTitle());
						blyj.setLcid(pTEnd.getProcInstId());
						blyj.setLcmc(pTEnd.getProcInstName());
						blyj.setNgr(pTEnd.getDraftUserId().toString());
						blyj.setNgrq(pTEnd.getDraftDate());
						blyj.setUrl(pTEnd.getUrl()+"?"+"id="+pTEnd.getId());
						blyj.setUserCode(pTEnd.getUserId().toString());
						blyj.setDel(new Long(0));
						blyj.setTbdid(zlHeadId);
						blyj.setSource("EAM");
						this.save(blyj);
					}
				}
			}
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public List<JjzcHtBx> getJJjzcHtBxByfxbhAndzcId(String htbh, String headId) {
		String hql = "from JjzcHtBx bx where bx.htbh= ? and bx.cldId = ?";
		List params = new ArrayList();
		params.add(htbh);
		params.add(headId);
		List<JjzcHtBx> list = (List<JjzcHtBx>) publicDao.find(hql, params);
		return list;
	}

	public List<JjzcHtZlwgLsb> getJjzcHtZlwgLsbByfxbhAndzcId(String htbh,
			String headId) {
		
		String hql = "from JjzcHtZlwgLsb ht where ht.htbh= ? and ht.cldId = ?";
		List params = new ArrayList();
		params.add(htbh);
		params.add(headId);
		List<JjzcHtZlwgLsb> list = (List<JjzcHtZlwgLsb>) publicDao.find(hql, params);
		return list;
	}

}