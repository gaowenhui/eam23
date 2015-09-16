package com.tansun.eam2.wtdk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.ILoansCustQueryBS;
import com.tansun.eam2.wtdk.vo.CustFundQueryVO;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 贷款客户查询
 * 
 * @author 陈煜霄
 * @date 2010-12-27
 */
@Service
public class LoansCustQueryBSImpl extends WtdkCommon implements ILoansCustQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 查询基金客户
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(CustomersQueryVO queryVO, Paginator paginator) {
		// 拼接查询语句
		String sql = " select distinct o.CI_CHN_NAME,o.CI_CUST_NO,o.CI_FLST_DT,o.CI_UNIT_CHN_INIL," +
				"o.CI_GOVN_CERT_NO from crt_dcc_cicifci1 o , crt_dcc_LNLNSLNS l where "
				+ "o.CI_CUST_NO = l.ln_cust_no ";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<CrtDccCicifci1> resultList = new ArrayList<CrtDccCicifci1>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			CrtDccCicifci1 tempVO = new CrtDccCicifci1();
			tempVO.setCiChnName(checkString(tempBO.get("CI_CHN_NAME")).trim());
			tempVO.setCiCustNo(checkString(tempBO.get("CI_CUST_NO")).trim());
			tempVO.setCiFlstDt(changeDate(checkString(tempBO.get("CI_FLST_DT")).trim()));
			tempVO.setCiUnitChnInil(checkString(tempBO.get("CI_UNIT_CHN_INIL")).trim());
			tempVO.setCiGovnCertNo(checkString(tempBO.get("CI_GOVN_CERT_NO")).trim());
			resultList.add(tempVO);
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
	private String prepareHql(CustomersQueryVO queryVO) {
		String hql = "";
		// 客户名称
		if (queryVO.getCiChnName() != null
				&& queryVO.getCiChnName().trim().length() > 0) {
			hql += " and o.CI_CHN_NAME like ? ";
		}
		// 客户编号
		if (queryVO.getCiCustNo() != null
				&& queryVO.getCiCustNo().trim().length() > 0) {
			hql += " and o.CI_CUST_NO like ? ";
		}
		// 单位中文名称
		if (queryVO.getCiUnitChnInil() != null
				&& queryVO.getCiUnitChnInil().trim().length() > 0) {
			hql += " and o.CI_UNIT_CHN_INIL like ? ";
		}
		// 开始
		if (queryVO.getStartCiFlstDt() != null
				&& queryVO.getStartCiFlstDt().trim().length() > 0) {
			hql += " and o.CI_FLST_DT >= ? ";
		}
		// 结束
		if (queryVO.getEndCiFlstDt() != null
				&& queryVO.getEndCiFlstDt().trim().length() > 0) {
			hql += " and o.CI_FLST_DT <= ? ";
		}
		hql += " order by o.CI_CUST_NO asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(CustomersQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 客户名称
		if (queryVO.getCiChnName() != null
				&& queryVO.getCiChnName().trim().length() > 0) {
			list.add("%" + queryVO.getCiChnName() + "%");
		}
		// 客户编号
		if (queryVO.getCiCustNo() != null
				&& queryVO.getCiCustNo().trim().length() > 0) {
			list.add("%" + queryVO.getCiCustNo() + "%");
		}
		// 单位中文名称
		if (queryVO.getCiUnitChnInil() != null
				&& queryVO.getCiUnitChnInil().trim().length() > 0) {
			list.add("%" + queryVO.getCiUnitChnInil() + "%");
		}
		// 开始
		if (queryVO.getStartCiFlstDt() != null
				&& queryVO.getStartCiFlstDt().trim().length() > 0) {
			String startTime = queryVO.getStartCiFlstDt().replace("-", "");
			list.add(startTime);
		}
		// 结束
		if (queryVO.getEndCiFlstDt() != null
				&& queryVO.getEndCiFlstDt().trim().length() > 0) {
			String endTime = queryVO.getEndCiFlstDt().replace("-", "");
			list.add(endTime);
		}
		return list;
	}
	
	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public CrtDccCicifci1 findCiCustByCustNo(String ciCustNo){
		CrtDccCicifci1 cust = new CrtDccCicifci1();
		String sql = "select c.* from CRT_DCC_CICIFCI1 c where c.CI_CUST_NO = '"
				+ ciCustNo + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			cust.setCiCustNo(checkString(map.get("CI_CUST_NO")).trim()); // 客户编号
			cust.setCiChnName(checkString(map.get("CI_CHN_NAME")).trim()); // 客户名称
			cust.setCiUnitChnInil(checkString(map.get("CI_UNIT_CHN_INIL")).trim());// 单位中文名称
			cust.setCiFlstDt(changeDate(checkString(map.get("CI_FLST_DT")).trim()));// 建档日期
			cust.setCiLgprRepCust(checkString(map.get("CI_LGPR_REP_CUST")).trim());// 法人客户编号
			cust.setCiGovnCertNo(checkString(map.get("CI_GOVN_CERT_NO")).trim());// 营业执照号
			cust.setCiTabsRegNo(checkString(map.get("CI_TAGS_REG_NO")).trim());// 税务登记编号
			cust.setCiRegCap(Double.parseDouble(checkString(map.get("CI_REG_CAP"))));// 注册资金
			cust.setCiBusntp(checkString(map.get("CI_BUSNTP")).trim());// 行业分类
			cust.setCiEntpScal(checkString(map.get("CI_ENTP_SCAL")).trim());// 企业规模
			cust.setCiAdmnTyp(checkString(map.get("CI_ADMN_TYP")).trim());// 经营种类
			cust.setCiEconChar(findJYXZ(checkString(map.get("CI_ECON_CHAR")).trim()));// 经营性质
			cust.setCiMangDept(checkString(map.get("CI_MANG_DEPT")).trim());// 上级主管部门
			cust.setCiFinConntr(checkString(map.get("CI_FIN_CONNTR")).trim());// 财务联系人
			cust.setCiLtstAwbk0(checkString(map.get("CI_LTST_AWBK0")).trim());// 最近来往银行1
			cust.setCiLtstAwbk1(checkString(map.get("CI_LTST_AWBK1")).trim());// 最近来往银行2
			cust.setCiLnCertNo(checkString(map.get("CI_LN_CERT_NO")).trim());// 贷款证号
			cust.setCiAprvLnCrlmt(Long.parseLong(checkString(map.get("CI_APRV_LN_CRLMT")).trim()));// 批准贷款额度
			cust.setCiAprvYr(checkString(map.get("CI_APRV_YR")).trim());// 批准年度
			cust.setCiAprvFileNo(checkString(map.get("CI_APRV_FILE_NO")).trim());// 批准文号
		}
		return cust;
	}

	/**
	 * 通过客户编号查找贷款信息
	 * 
	 * @param ciCustNo
	 * @return
	 */
	public String findLnByCustNo(String ciCustNo) {
		String sql = " select * from CRT_DCC_LNLNSLNS l where l.LN_CUST_NO  = '"
			+ ciCustNo + "'";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<CustFundQueryVO> resultList = new ArrayList<CustFundQueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map ln = (Map) queryList.get(i);
			CustFundQueryVO fundVO = new CustFundQueryVO();
			fundVO.setLnLnAcctNo(checkString(ln.get("LN_LN_ACCT_NO")).trim());// 系统贷款账号
			fundVO.setLnCustNo(checkString(ln.get("LN_CUST_NO")).trim()); // 客户编号
			fundVO.setLnCurrCod(findsaCurrName(checkString(ln.get("LN_CURR_COD")).trim()));// 币种
			fundVO.setLnTotlLnAmtHypoAmt(checkString(ln
					.get("LN_TOTL_LN_AMT_HYPO_AMT")).trim());// 贷款总额
			fundVO.setLnLnBal(checkString(ln.get("LN_LN_BAL")).trim());// 贷款余额
			resultList.add(fundVO);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}
	
	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids){
		// 拼接查询语句
		String sql = " select distinct o.CI_CHN_NAME,o.CI_CUST_NO,o.CI_FLST_DT,o.CI_UNIT_CHN_INIL," +
				"o.CI_GOVN_CERT_NO from crt_dcc_cicifci1 o , crt_dcc_LNLNSLNS l where "
				+ "o.CI_CUST_NO = l.ln_cust_no and o.CI_CUST_NO in("+IdStrFormat.formatIds(ids)+") ";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		// 获得查询结果
		List<CrtDccCicifci1> resultList = new ArrayList<CrtDccCicifci1>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			CrtDccCicifci1 tempVO = new CrtDccCicifci1();
			tempVO.setCiChnName(checkString(tempBO.get("CI_CHN_NAME")).trim());
			tempVO.setCiCustNo(checkString(tempBO.get("CI_CUST_NO")).trim());
			tempVO.setCiFlstDt(changeDate(checkString(tempBO.get("CI_FLST_DT")).trim()));
			tempVO.setCiUnitChnInil(checkString(tempBO.get("CI_UNIT_CHN_INIL")).trim());
			tempVO.setCiGovnCertNo(checkString(tempBO.get("CI_GOVN_CERT_NO")).trim());
			resultList.add(tempVO);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 100000);
		return json;
	}

}
