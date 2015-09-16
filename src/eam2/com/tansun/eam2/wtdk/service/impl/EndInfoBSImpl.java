package com.tansun.eam2.wtdk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.common.model.orm.bo.WtdkEndInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.IEndInfoBS;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.RelateQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 终止委托贷款管理
 * 
 * @author 陈煜霄
 * @date 2010-12-07
 */
@Service
public class EndInfoBSImpl extends WtdkCommon implements IEndInfoBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 进入表单保存一条记录
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head) {
		publicDao.save(head);
	}

	/**
	 * 修改表头
	 * 
	 * @param body
	 */
	public void updateHead(WtdkGlHead head) {
		publicDao.update(head);
	}

	/**
	 * 根据headId查找head信息
	 * 
	 * @param headId
	 * @return
	 */
	public WtdkGlHead findHeadByHeadId(String headId) {
		String hql = "from WtdkGlHead o where o.sheadId=?";
		List<String> list = new ArrayList<String>();
		list.add(headId);
		return (WtdkGlHead) publicDao.findSingleResult(hql, list);
	}

	/**
	 * 根据表头id查找表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId) {
		String hql = "from WtdkEndInfo o where o.headId = '" + headId
				+ "' order by o.id asc ";
		List queryList = this.publicDao.find(hql, new ArrayList());
		String json = BodyListToJSON.getJSON(queryList, 1, 1, 10000);
		return json;
	}

	/**
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			String id = ids[i];
			String sql = "delete from wtdk_end_info w where w.id = '" + id
					+ "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 保存表体
	 * 
	 * @param funcIds
	 */
	public void saveBody(WtdkEndInfo body) {
		publicDao.save(body);
	}

	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkEndInfo body) {
		publicDao.update(body);
	}

	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkEndInfo findBodyByBodyId(String bodyId) {
		String hql = "from WtdkEndInfo o where o.id = ?";
		String[] str = new String[1];
		str[0] = bodyId;
		WtdkEndInfo body = new WtdkEndInfo();
		body = (WtdkEndInfo) publicDao.findSingleResult(hql, str);
		return body;
	}

	/**
	 * 将基金信息转化为body
	 * 
	 * @return
	 */
	public WtdkEndInfo fuToBody(String headId, String fuNo) {
		WtdkEndInfo body = new WtdkEndInfo();
		String sql = "select t.SA_ACCT_NO,n.SA_CUST_NO,n.SA_CUST_Name,t.SA_ACLG,t.SA_CURR_COD,n.SA_CACCT_DT,"
				+ "t.SA_AVL_BAL,t.SA_ACCT_BAL,n.SA_OPAC_INSTN_NO from crt_dcc_SAACNACN n,crt_dcc_SAACNAMT t "
				+ "where n.SA_ACCT_NO = t.SA_ACCT_NO and n.SA_ACCT_NO = '"
				+ fuNo + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map tempBO = (Map) list.get(0);
			body.setHeadId(headId);
			body.setFundAccount(checkString(tempBO.get("SA_ACCT_NO")).trim());// 系统基金号
			body.setKhbh(checkString(tempBO.get("SA_CUST_NO")).trim());// 客户编号
			body.setKhmc(checkString(tempBO.get("SA_CUST_Name")).trim());// 客户名称
		}
		return body;
	}

	/**
	 * 批量保存表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchFuToBody(String headId, String funcNo) {
		String[] nos = funcNo.split(",");
		for (int i = 0; i < nos.length; i++) {
			WtdkEndInfo body = new WtdkEndInfo();
			String sql = "select t.SA_ACCT_NO,n.SA_CUST_NO,n.SA_CUST_Name,t.SA_ACLG,t.SA_CURR_COD,n.SA_CACCT_DT,"
					+ "t.SA_AVL_BAL,t.SA_ACCT_BAL,n.SA_OPAC_INSTN_NO from crt_dcc_SAACNACN n,crt_dcc_SAACNAMT t "
					+ "where n.SA_ACCT_NO = t.SA_ACCT_NO and n.SA_ACCT_NO = '"
					+ nos[i] + "'";
			List list = publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				body.setHeadId(headId);
				body.setFundAccount(checkString(tempBO.get("SA_ACCT_NO"))
						.trim());// 系统基金号
				body.setKhbh(checkString(tempBO.get("SA_CUST_NO")).trim());// 客户编号
				body.setKhmc(checkString(tempBO.get("SA_CUST_Name")).trim());// 客户名称
				body.setKyye(checkDouble(tempBO.get("SA_AVL_BAL"))); // 可用余额
				body.setZhye(checkDouble(tempBO.get("SA_ACCT_BAL")));// 账户余额
			}
			publicDao.save(body);
		}
	}

	/**
	 * 批量修改表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchUpdateBody(String bodyIds, String spjg, String bz) {
		String[] ids = bodyIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			WtdkEndInfo info = this.findBodyByBodyId(ids[i]);
			publicDao.update(info);
		}
	}

	/**
	 * 查找关联关系
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String findRelate(RelateQueryVO queryVO, Paginator paginator) {
		String sql = "select w.xulie,w.ln_acct_no,w.sa_sys_acct_no,l.ln_ln_bal,s.sa_cust_name,"
				+ "m.sa_avl_bal,m.sa_acct_bal,s.sa_cust_no from wd_ln_more_infor w,crt_dcc_LNLNSLNS l,"
				+ "crt_dcc_SAACNACN s,crt_dcc_SAACNAMT m where w.sa_sys_acct_no = s.sa_acct_no"
				+ " and w.ln_acct_no = l.ln_ln_acct_no and s.sa_acct_no = m.sa_acct_no and w.xulie != '0'";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<RelateQueryVO> resultList = new ArrayList<RelateQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			RelateQueryVO vo = new RelateQueryVO();
			vo.setId(checkString(map.get("xulie")));
			vo.setSaCustName(checkString(map.get("sa_cust_name")));
			vo.setSaAcctNo(checkString(map.get("sa_sys_acct_no")));
			vo.setSaCustNo(checkString(map.get("sa_cust_no")));
			vo.setSazhye(checkDouble(map.get("sa_acct_bal")));
			vo.setSajy(checkDouble(map.get("sa_avl_bal")));
			vo.setLnzhye(checkDouble(map.get("ln_ln_bal")));
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
	private String prepareHql(RelateQueryVO queryVO) {
		String hql = "";
		// 客户编号
		if (queryVO.getSaCustNo() != null
				&& queryVO.getSaCustNo().trim().length() > 0) {
			hql += " and s.sa_cust_no like ? ";
		}
		// 客户名称
		if (queryVO.getSaCustName() != null
				&& queryVO.getSaCustName().trim().length() > 0) {
			hql += " and s.sa_cust_name like ? ";
		}
		// 基金账号
		if (queryVO.getSaAcctNo() != null
				&& queryVO.getSaAcctNo().trim().length() > 0) {
			hql += " and s.sa_acct_no like ? ";
		}
		// 贷款账号
		if (queryVO.getLnAcctNo() != null
				&& queryVO.getLnAcctNo().trim().length() > 0) {
			hql += " and l.ln_ln_acct_no like ? ";
		}
		hql += " order by w.xulie asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(RelateQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		if (queryVO.getSaCustNo() != null
				&& queryVO.getSaCustNo().trim().length() > 0) {
			list.add("%" + queryVO.getSaCustNo() + "%");
		}
		// 客户名称
		if (queryVO.getSaCustName() != null
				&& queryVO.getSaCustName().trim().length() > 0) {
			list.add("%" + queryVO.getSaCustName() + "%");
		}
		// 基金账号
		if (queryVO.getSaAcctNo() != null
				&& queryVO.getSaAcctNo().trim().length() > 0) {
			list.add("%" + queryVO.getSaAcctNo() + "%");
		}
		// 贷款账号
		if (queryVO.getLnAcctNo() != null
				&& queryVO.getLnAcctNo().trim().length() > 0) {
			list.add("%" + queryVO.getLnAcctNo() + "%");
		}
		return list;
	}

	/**
	 * 通过序列保存表体
	 * 
	 * @param xulies
	 */
	public void saveBodysByXulie(String xulies, String headId) {
		if (xulies.startsWith(",")) {
			xulies = xulies.substring(1);
		}
		String[] ids = xulies.split(",");
		for (int i = 0; i < ids.length; i++) {
			String sql = "select w.xulie,w.ln_acct_no,w.sa_sys_acct_no,l.ln_ln_bal,s.sa_cust_name,"
					+ "m.sa_avl_bal,m.sa_acct_bal,s.sa_cust_no from wd_ln_more_infor w,crt_dcc_LNLNSLNS l,"
					+ "crt_dcc_SAACNACN s,crt_dcc_SAACNAMT m where w.sa_sys_acct_no = s.sa_acct_no"
					+ " and w.ln_acct_no = l.ln_ln_acct_no and s.sa_acct_no = m.sa_acct_no and "
					+ "w.xulie != '" + ids[i] + "'";
			List list = publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map map = (Map) list.get(0);
				WtdkEndInfo wd = new WtdkEndInfo();
				wd.setDkzhye(checkDouble(map.get("ln_ln_bal")));
				wd.setFundAccount(checkString(map.get("sa_sys_acct_no")));
				wd.setKhbh(checkString(map.get("sa_cust_no")));
				wd.setKhmc(checkString(map.get("sa_cust_name")));
				wd.setKyye(checkDouble(map.get("sa_avl_bal")));
				wd.setZhye(checkDouble(map.get("sa_acct_bal")));
				wd.setHeadId(headId);
				publicDao.save(wd);
			}
		}
	}
	
	/**
	 * 保存eam2oa
	 * 
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa){
		publicDao.save(eamoa);
	}
}
