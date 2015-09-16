package com.tansun.eam2.wtdk.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.vo.CzxxVO;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.ILoansQueryBS;
import com.tansun.eam2.wtdk.vo.FuncBackVO;
import com.tansun.eam2.wtdk.vo.LoansBjVO;
import com.tansun.eam2.wtdk.vo.LoansQueryVO;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.eam2.wtdk.vo.RelateVO;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 贷款信息
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
@Service
public class LoansQueryBSImpl extends WtdkCommon implements ILoansQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 查找贷款信息列表
	 * 
	 * @return
	 */
	public String query(LoansQueryVO queryVO, Paginator paginator) {
		// 拼接查询语句
		String sql = "select c.CI_CHN_NAME, n.LN_LN_ACCT_NO,n.LN_CUST_NO,n.LN_CURR_COD,n.ln_busn_typ,"
				+ "n.LN_TOTL_LN_AMT_HYPO_AMT,n.LN_LN_BAL,n.LN_FLST_TLR_NO from CRT_DCC_LNLNSLNS n, "
				+ "CRT_DCC_CICIFCI1 c where n.LN_CUST_NO = c.CI_CUST_NO ";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<LoansQueryVO> resultList = new ArrayList<LoansQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			LoansQueryVO tempVO = new LoansQueryVO();
			tempVO.setLnLnAcctNo(checkString(tempBO.get("LN_LN_ACCT_NO"))
					.trim());// 系统贷款编号
			tempVO.setLnCustNo(checkString(tempBO.get("LN_CUST_NO")).trim());// 客户编号
			tempVO.setLnCAcctNo(findlnCAcctNo(
					checkString(tempBO.get("LN_LN_ACCT_NO")),
					checkString(tempBO.get("LN_CURR_COD"))).trim());// 客户贷款账号
			tempVO.setLnCustName(checkString(tempBO.get("CI_CHN_NAME")).trim());// 客户名称
			tempVO.setFirstBranch(findFristBranch(
					checkString(tempBO.get("LN_LN_ACCT_NO")).substring(0, 3))
					.trim());// 一级分行
			tempVO.setBranchNo(checkString(tempBO.get("LN_LN_ACCT_NO")).trim()
					.substring(0, 9));// 机构编号
			tempVO.setLnCurrName(findsaCurrName(
					checkString(tempBO.get("LN_CURR_COD"))).trim());// 币种
			tempVO.setLnTotlLnAmtHypoAmt(new BigDecimal(checkString(tempBO
					.get("LN_TOTL_LN_AMT_HYPO_AMT"))));// 贷款总额
			tempVO.setLnLnBal(new BigDecimal(checkString(tempBO
					.get("LN_LN_BAL"))));// 贷款余额
			tempVO.setKmbh(findKMBH(checkString(tempBO.get("ln_busn_typ"))).trim()); // 科目号
			tempVO.setBranchName(findSaOpacInstnName(checkString(
					tempBO.get("LN_LN_ACCT_NO")).trim().substring(0, 9)));//经办行
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
	private String prepareHql(LoansQueryVO queryVO) {
		String hql = "";
		// 机构编号
		if (queryVO.getBranchNo() != null
				&& queryVO.getBranchNo().trim().length() > 0) {
			hql += " and n.LN_FLST_TLR_NO like ? ";
		}
		// 一级机构
		if (queryVO.getFirstBranch() != null
				&& queryVO.getFirstBranch().trim().length() > 0) {
			hql += " and n.LN_FLST_TLR_NO like ? ";
		}
		// 客户编号
		if (queryVO.getLnCustNo() != null
				&& queryVO.getLnCustNo().trim().length() > 0) {
			hql += " and n.LN_CUST_NO like ? ";
		}
		// 币种
		if (queryVO.getLnCurrCod() != null
				&& queryVO.getLnCurrCod().trim().length() > 0) {
			hql += " and n.LN_CURR_COD = ? ";
		}
		// 系统贷款号
		if (queryVO.getLnLnAcctNo() != null
				&& queryVO.getLnLnAcctNo().trim().length() > 0) {
			hql += " and n.LN_LN_ACCT_NO like ? ";
		}
		// 客户名称
		if (queryVO.getLnCustName() != null
				&& queryVO.getLnCustName().trim().length() > 0) {
			hql += " and c.CI_CHN_NAME like ? ";
		}
		// 贷款总额 从
		if (queryVO.getBeforeAmt() != null
				&& queryVO.getBeforeAmt().trim().length() > 0) {
			hql += " and n.LN_TOTL_LN_AMT_HYPO_AMT >= ? ";
		}
		// 贷款总额 到
		if (queryVO.getEndAmt() != null
				&& queryVO.getEndAmt().trim().length() > 0) {
			hql += " and n.LN_TOTL_LN_AMT_HYPO_AMT <= ? ";
		}
		hql += " order by n.LN_LN_ACCT_NO asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(LoansQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 机构编号
		if (queryVO.getBranchNo() != null
				&& queryVO.getBranchNo().trim().length() > 0) {
			list.add("%" + queryVO.getBranchNo() + "%");
		}
		// 一级机构
		if (queryVO.getFirstBranch() != null
				&& queryVO.getFirstBranch().trim().length() > 0) {
			list.add(queryVO.getFirstBranch() + "%");
		}
		// 客户编号
		if (queryVO.getLnCustNo() != null
				&& queryVO.getLnCustNo().trim().length() > 0) {
			list.add("%" + queryVO.getLnCustNo() + "%");
		}
		// 币种
		if (queryVO.getLnCurrCod() != null
				&& queryVO.getLnCurrCod().trim().length() > 0) {
			list.add(queryVO.getLnCurrCod());
		}
		// 系统贷款号
		if (queryVO.getLnLnAcctNo() != null
				&& queryVO.getLnLnAcctNo().trim().length() > 0) {
			list.add("%" + queryVO.getLnLnAcctNo() + "%");
		}
		// 客户名称
		if (queryVO.getLnCustName() != null
				&& queryVO.getLnCustName().trim().length() > 0) {
			list.add("%" + queryVO.getLnCustName() + "%");
		}
		// 贷款总额 从
		if (queryVO.getBeforeAmt() != null
				&& queryVO.getBeforeAmt().trim().length() > 0) {
			list.add(queryVO.getBeforeAmt());
		}
		// 贷款总额 到
		if (queryVO.getEndAmt() != null
				&& queryVO.getEndAmt().trim().length() > 0) {
			list.add(queryVO.getEndAmt());
		}
		return list;
	}

	/**
	 * 根据贷款号查找贷款内容
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansQueryVO findLoansInfoByLnNo(String lnNo) {
		LoansQueryVO loans = new LoansQueryVO();
		String sql = "select n.LN_CURR_COD,n.ln_busn_typ,n.LN_LN_ACCT_NO,n.ln_auor_dep_acct_no,n.LN_TOTL_LN_AMT_HYPO_AMT,n.LN_LN_BAL, n.LN_CUST_NO,"
				+ "n.LN_ACCUM_RECV_SVC,n.LN_CRNT_YR_REV_ACCUM,n.LN_CRNT_YR_COLLED_INT,n.LN_LN_TYP,n.LN_ACCUM_COLI,n.LN_CRNT_YR_LN_ACCUM,"
				+ "n.LN_PPRD_RFN_AMT,n.LN_ACCT_STS,n.LN_OVDLN_INTRBL,n.LN_DUE_DT,n.LN_ARFN_SCHD_INT,n.LN_FLST_TLR_NO"
				+ " from CRT_DCC_LNLNSLNS n where n.LN_LN_ACCT_NO = '"
				+ lnNo
				+ "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			loans.setLnLnAcctNo(checkString(map.get("LN_LN_ACCT_NO")).trim());// 系统贷款账号
			loans.setLnTotlLnAmtHypoAmt(new BigDecimal(checkString(map
					.get("LN_TOTL_LN_AMT_HYPO_AMT"))));// 贷款总额
			loans.setLnLnBal(new BigDecimal(checkString(map.get("LN_LN_BAL"))));// 贷款余额
			loans.setLnCAcctNo(findlnCAcctNo(
					checkString(map.get("LN_LN_ACCT_NO")),
					checkString(map.get("LN_CURR_COD"))).trim());// 贷款客户账号
			loans.setLnCustNo(checkString(map.get("LN_CUST_NO")).trim());// 客户编号
			loans.setLnAccumRecvSvc(new BigDecimal(checkString(map
					.get("LN_ACCUM_RECV_SVC"))));// 累计收手续费
			loans.setLnCrntYrRevAccum(new BigDecimal(checkString(map
					.get("LN_CRNT_YR_REV_ACCUM"))));// 本年累计收回
			loans.setLnCrntYrColledInt(new BigDecimal(checkString(map
					.get("LN_CRNT_YR_COLLED_INT"))));// 本年已收贷款利息
			loans.setLnAccumColi(new BigDecimal(checkString(map
					.get("LN_ACCUM_COLI"))));// 累计收息
			loans.setLnCrntYrLnAccum(new BigDecimal(checkString(map
					.get("LN_CRNT_YR_LN_ACCUM"))));// 本年累计发放
			loans.setLn_pprd_rfn_amt(new BigDecimal(checkString(map
					.get("LN_PPRD_RFN_AMT"))));// 本期还款金额
			loans.setLnAcctSts(checkString(map.get("LN_ACCT_STS")).trim());// 账户状态
			loans.setLnOvdlnIntrbl(new BigDecimal(checkString(map
					.get("LN_OVDLN_INTRBL"))));// 催收应收利息
			loans.setLnDueDt(changeDate(checkString(map.get("LN_DUE_DT"))
					.trim()));// 清算日期
			loans.setLnArfnSchdInt(new BigDecimal(checkString(map
					.get("LN_ARFN_SCHD_INT"))));// 利息
			loans.setFirstBranch(findFristBranch(checkString(
					map.get("LN_LN_ACCT_NO")).trim().substring(0, 3)));// 一级机构
			loans.setBranchName(findSaOpacInstnName(checkString(
					map.get("LN_LN_ACCT_NO")).trim().substring(0, 9)));// 机构名称
			loans.setLnCustName(findCustNameByCustNo(
					checkString(map.get("LN_CUST_NO"))).trim());// 客户名称
			loans.setSaSysAcctNo(findWdMordInfoByLnNo(
					checkString(map.get("LN_LN_ACCT_NO"))).trim());// 查找存款账号
			loans.setRiskState(findRiskState(
					checkString(map.get("LN_LN_ACCT_NO"))).trim());// 担险状态
			loans
					.setRymc(findRYMCByDkjgbm(checkString(
							map.get("LN_LN_ACCT_NO")).trim().substring(0, 3)));// 省行管理人
			loans
					.setLxfs(findRYMCByDkjgbm(checkString(
							map.get("LN_LN_ACCT_NO")).trim().substring(0, 3)));// 管理人电话
			loans.setDAcctNo(findDAcctNoBysaNo(
					checkString(map.get("ln_auor_dep_acct_no"))).trim());// 委托方客户编号
			loans.setLnLnTyp(findDKZL(checkString(map.get("ln_busn_typ")))
					.trim());// 贷款种类
			loans.setKmmc(findKMMC(checkString(map.get("ln_busn_typ"))).trim());
			loans.setKmbh(findKMBH(checkString(map.get("ln_busn_typ"))).trim());
		}
		return loans;
	}

	/**
	 * 通过序列查找关联关系
	 * 
	 * @param xulie
	 * @return
	 */
	public LoansRiskVO findRelateInfoByXuLie(String xulie) {
		LoansRiskVO risk = new LoansRiskVO();
		String sql = "select C_CUST_ID,MAG_DPT,C_CUST_NAME,ASSET_TYPE,D_ACCT_NO,RISK_REASON,FUND_TYPE,LOST_RATE,"
				+ "LOST_JE,TO_CHAR(VERIFIED_DATE,'yyyy-mm-dd') VERIFIED_DATE,VER_RISK_LEVE,VER_LOST_RATE,VER_LOST_JE,"
				+ " VER_PERSON,VER_LEVEL,TO_CHAR(RISK_DATE,'yyyy-mm-dd') RISK_DATE,LN_ACCT_NO,C_ACCT_NO,SA_SYS_ACCT_NO,"
				+ " SAV_CUST_ACCT_NO,FUND_ACCOUNTS_TASTER,MEMO_INFO from WD_LN_MORE_INFOR where XULIE = '"
				+ xulie + "'" + " and XULIE != '0'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			risk.setCCustId(checkString(map.get("C_CUST_ID")).trim());// 贷款客户编号
			risk.setMagDpt(checkString(map.get("MAG_DPT")).trim());// 资产管理部门
			risk.setCCustName(checkString(map.get("C_CUST_NAME")).trim());// 贷款方名称
			risk.setAssetType(checkString(map.get("ASSET_TYPE")).trim());// 资产类型
			risk.setDAcctNo(checkString(map.get("D_ACCT_NO")).trim());// 委托方客户编号
			risk.setRiskReason(checkString(map.get("RISK_REASON")).trim());// 担险原因
			risk.setFundType(checkString(map.get("FUND_TYPE")).trim());// 基金情况
			risk.setLostRate(checkDouble(map.get("LOST_RATE")));// 预计损失率%
			risk.setLostJe(checkDouble(map.get("LOST_JE")));// 预计损失金额
			risk.setVerifiedDate(checkString(map.get("VERIFIED_DATE")).trim());// 审核日期
			risk.setVerRiskLeve(checkString(map.get("VER_RISK_LEVE")).trim());// 审核风险等级
			risk.setVerLostRate(checkDouble(map.get("VER_LOST_RATE")));// 审核预计损失率%
			risk.setVerLostJe(checkDouble(map.get("VER_LOST_JE")));// 审核预计损失金额
			risk.setVerPerson(checkString(map.get("VER_PERSON")).trim());// 审核人
			risk.setVerLevel(checkString(map.get("VER_LEVEL")).trim());// 审核级别
			risk.setRiskDate(checkString(map.get("RISK_DATE")).trim());// 分类日期
			risk.setLnAcctNo(checkString(map.get("LN_ACCT_NO")).trim());// 贷款系统账户
			risk.setCAcctNo(checkString(map.get("C_ACCT_NO")).trim());// 贷款客户账户
			risk.setSaSysAcctNo(checkString(map.get("SA_SYS_ACCT_NO")).trim());// 基金系统账户
			risk.setSavCustAcctNo(checkString(map.get("SAV_CUST_ACCT_NO"))
					.trim());// 基金客户账户
			risk.setFundAccountsTaster(checkString(
					map.get("FUND_ACCOUNTS_TASTER")).trim());// 基金账户审批人
			risk.setMemoInfo(checkString(map.get("MEMO_INFO")).trim());// 备注
		}
		return risk;
	}

	/**
	 * 根据贷款账号查找担险信息
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansRiskVO findRiskInfoByLnNo(String lnNo) {
		LoansRiskVO risk = new LoansRiskVO();
		String sql = "select C_CUST_ID,MAG_DPT,C_CUST_NAME,ASSET_TYPE,D_ACCT_NO,RISK_REASON,FUND_TYPE,LOST_RATE,"
				+ "LOST_JE,TO_CHAR(VERIFIED_DATE,'yyyy-mm-dd') VERIFIED_DATE,VER_RISK_LEVE,VER_LOST_RATE,VER_LOST_JE,"
				+ " VER_PERSON,VER_LEVEL,TO_CHAR(RISK_DATE,'yyyy-mm-dd') RISK_DATE,LN_ACCT_NO,C_ACCT_NO,SA_SYS_ACCT_NO,"
				+ " SAV_CUST_ACCT_NO,FUND_ACCOUNTS_TASTER,MEMO_INFO from WD_LN_MORE_INFOR where LN_ACCT_NO = '"
				+ lnNo + "'" + " and XULIE = '0'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			risk.setCCustId(checkString(map.get("C_CUST_ID")).trim());// 贷款客户编号
			risk.setMagDpt(checkString(map.get("MAG_DPT")).trim());// 资产管理部门
			risk.setCCustName(checkString(map.get("C_CUST_NAME")).trim());// 贷款方名称
			risk.setAssetType(checkString(map.get("ASSET_TYPE")).trim());// 资产类型
			risk.setDAcctNo(checkString(map.get("D_ACCT_NO")).trim());// 委托方客户编号
			risk.setRiskReason(checkString(map.get("RISK_REASON")).trim());// 担险原因
			risk.setFundType(checkString(map.get("FUND_TYPE")).trim());// 基金情况
			risk.setLostRate(checkDouble(map.get("LOST_RATE")));// 预计损失率%
			risk.setLostJe(checkDouble(map.get("LOST_JE")));// 预计损失金额
			risk.setVerifiedDate(checkString(map.get("VERIFIED_DATE")).trim());// 审核日期
			risk.setVerRiskLeve(checkString(map.get("VER_RISK_LEVE")).trim());// 审核风险等级
			risk.setVerLostRate(checkDouble(map.get("VER_LOST_RATE")));// 审核预计损失率%
			risk.setVerLostJe(checkDouble(map.get("VER_LOST_JE")));// 审核预计损失金额
			risk.setVerPerson(checkString(map.get("VER_PERSON")).trim());// 审核人
			risk.setVerLevel(checkString(map.get("VER_LEVEL")).trim());// 审核级别
			risk.setRiskDate(checkString(map.get("RISK_DATE")).trim());// 分类日期
			risk.setLnAcctNo(checkString(map.get("LN_ACCT_NO")).trim());// 贷款系统账户
			risk.setCAcctNo(checkString(map.get("C_ACCT_NO")).trim());// 贷款客户账户
			risk.setSaSysAcctNo(checkString(map.get("SA_SYS_ACCT_NO")).trim());// 基金系统账户
			risk.setSavCustAcctNo(checkString(map.get("SAV_CUST_ACCT_NO"))
					.trim());// 基金客户账户
			risk.setFundAccountsTaster(checkString(
					map.get("FUND_ACCOUNTS_TASTER")).trim());// 基金账户审批人
			risk.setMemoInfo(checkString(map.get("MEMO_INFO")).trim());// 备注
		}
		return risk;
	}

	/**
	 * 保存担险信息
	 * 
	 * @param wdInfo
	 */
	public void saveWdDXInfo(LoansRiskVO riskVO) {
		String sql = "insert into WD_LN_MORE_INFOR (C_CUST_ID, MAG_DPT,C_CUST_NAME, ASSET_TYPE,"
				+ " D_ACCT_NO,RISK_REASON, FUND_TYPE,LOST_RATE,LOST_JE, VERIFIED_DATE,VER_RISK_LEVE, "
				+ "VER_LOST_RATE,VER_LOST_JE,VER_PERSON,VER_LEVEL, RISK_DATE, LN_ACCT_NO,C_ACCT_NO,MEMO_INFO,XULIE) "
				+ " values ('"
				+ riskVO.getCCustId()
				+ "', "
				+ " '"
				+ riskVO.getMagDpt()
				+ "', '"
				+ riskVO.getCCustName()
				+ "', '"
				+ riskVO.getAssetType()
				+ "', '"
				+ riskVO.getDAcctNo()
				+ "',"
				+ " '"
				+ riskVO.getRiskReason()
				+ "', '"
				+ riskVO.getFundType()
				+ "', '"
				+ riskVO.getLostRate()
				+ "', '"
				+ riskVO.getLostJe()
				+ "',"
				+ " to_date('"
				+ riskVO.getVerifiedDate()
				+ "','yyyy-mm-dd'), '"
				+ riskVO.getVerRiskLeve()
				+ "', '"
				+ riskVO.getLostRate()
				+ "', '"
				+ riskVO.getVerLostJe()
				+ "',"
				+ " '"
				+ riskVO.getVerPerson()
				+ "', '"
				+ riskVO.getVerLevel()
				+ "', to_date('"
				+ riskVO.getRiskDate()
				+ "','yyyy-mm-dd'),"
				+ " '"
				+ riskVO.getLnAcctNo()
				+ "','"
				+ riskVO.getCAcctNo()
				+ "','" + riskVO.getMemoInfo() + "','0')";
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 修改担险信息
	 * 
	 * @param riskVO
	 */
	public void updateWdDXInfo(LoansRiskVO riskVO) {
		String sql = "update WD_LN_MORE_INFOR set C_CUST_ID='"
				+ riskVO.getCCustId() + "',MAG_DPT='" + riskVO.getMagDpt()
				+ "'," + "C_CUST_NAME='" + riskVO.getCCustName()
				+ "',ASSET_TYPE='" + riskVO.getAssetType() + "',D_ACCT_NO='"
				+ riskVO.getDAcctNo() + "'," + "RISK_REASON='"
				+ riskVO.getRiskReason() + "',FUND_TYPE='"
				+ riskVO.getFundType() + "',LOST_RATE='" + riskVO.getLostRate()
				+ "'," + "LOST_JE='" + riskVO.getLostJe()
				+ "',VERIFIED_DATE=to_date('" + riskVO.getVerifiedDate()
				+ "','yyyy-mm-dd'),VER_RISK_LEVE='" + riskVO.getVerRiskLeve()
				+ "'," + "VER_LOST_RATE='" + riskVO.getVerLostRate()
				+ "',VER_LOST_JE='" + riskVO.getVerLostJe() + "',VER_PERSON='"
				+ riskVO.getVerPerson() + "'," + "VER_LEVEL='"
				+ riskVO.getVerLevel() + "',RISK_DATE=to_date('"
				+ riskVO.getRiskDate() + "','yyyy-mm-dd'),LN_ACCT_NO='"
				+ riskVO.getLnAcctNo() + "'," + "C_ACCT_NO='"
				+ riskVO.getCAcctNo() + "',MEMO_INFO='" + riskVO.getMemoInfo()
				+ "' where LN_ACCT_NO = " + riskVO.getLnAcctNo();
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 保存关联信息
	 * 
	 * @param riskVO
	 */
	public void saveRenateInfo(LoansRiskVO riskVO) {
		String sql = "insert into WD_LN_MORE_INFOR (C_CUST_ID, MAG_DPT,C_CUST_NAME,LN_ACCT_NO,C_ACCT_NO,"
				+ "SA_SYS_ACCT_NO,SAV_CUST_ACCT_NO,FUND_ACCOUNTS_TASTER,XULIE) values ('"
				+ riskVO.getCCustId()
				+ "','"
				+ riskVO.getMagDpt()
				+ "', '"
				+ riskVO.getCCustName()
				+ "',"
				+ " '"
				+ riskVO.getLnAcctNo()
				+ "','"
				+ riskVO.getCAcctNo()
				+ "','"
				+ riskVO.getSaSysAcctNo()
				+ "','"
				+ riskVO.getSavCustAcctNo()
				+ "','"
				+ riskVO.getFundAccountsTaster()
				+ "','"
				+ riskVO.getXulie()
				+ "')";
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 修改关联信息
	 * 
	 * @param riskVO
	 */
	public void updateRenateInfo(LoansRiskVO riskVO) {
		String sql = "update WD_LN_MORE_INFOR set C_CUST_ID='"
				+ riskVO.getCCustId() + "',MAG_DPT='" + riskVO.getMagDpt()
				+ "'," + "C_CUST_NAME='" + riskVO.getCCustName()
				+ "',SA_SYS_ACCT_NO='" + riskVO.getSaSysAcctNo() + "',"
				+ "SAV_CUST_ACCT_NO='" + riskVO.getSavCustAcctNo()
				+ "',FUND_ACCOUNTS_TASTER='" + riskVO.getFundAccountsTaster()
				+ "'," + "LN_ACCT_NO='" + riskVO.getLnAcctNo() + "' "
				+ "where XULIE = '" + riskVO.getXulie() + "'";
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 通过序列删除关联关系
	 * 
	 * @param xulie
	 */
	public void deleteRelateInfoByXuLie(String xulie) {
		if (xulie.startsWith(",")) {
			xulie = xulie.substring(1);
		}
		String[] xulies = xulie.split(",");
		for (int i = 0; i < xulies.length; i++) {
			String sql = "delete WD_LN_MORE_INFOR where XULIE = '" + xulies[i]
					+ "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 查询贷款本金明细
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String bjMxQuery(String id) {
		String sql = "select z.ln_ln_acct_no, z.ln_cust_no, z.ln_busn_typ,z.ln_yhead_ln_bal,"
				+ "k.LN_ENTR_DT,k.LN_TX_AMT,z.ln_crnt_yr_rev_accum,k.LN_ATX_BAL from crt_dcc_LNLNSLNS z ,"
				+ " crt_dcc_flnjjr1 k where z.ln_ln_acct_no = k.ln_ln_acct_no and z.ln_ln_acct_no ='"
				+ id + "'";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<LoansBjVO> resultList = new ArrayList<LoansBjVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			LoansBjVO back = new LoansBjVO();
			back.setKhmc(findCustNameByCustNo(
					checkString(map.get("ln_cust_no"))).trim()); // 客户名称
			back.setKmmc(findKMMC(checkString(map.get("ln_busn_typ"))).trim());// 科目
			back.setKmbh(checkString(map.get("ln_busn_typ")).trim());// 科目编号
			back
					.setBchkrq(changeDate(checkString(map.get("LN_ENTR_DT"))
							.trim())); // 本次回款日期
			back.setBchkje(new BigDecimal(checkString(map.get("LN_TX_AMT")))); // 本次回款金额
			back.setHkhbjye(new BigDecimal(checkString(map.get("LN_ATX_BAL"))));// 还款后本金余额
			back.setWtdwmc(findWTDW(
					findWTJJ(checkString(map.get("ln_ln_acct_no")))).trim());// 对应委托单位
			resultList.add(back);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * 
	 * @return
	 */
	public String findCzXxList(String loansId) {
		StringBuffer sb = new StringBuffer("")
				.append(
						" select a.id,a.fenlei,a.cld_id,c.id as lsbid, a.czxmmc,a.zhuangtai,d.hycs  ")
				.append(" from CZ_XM_XX a ,CZ_XMXX_LSB c,CZ_HYXX d  ").append(
						" where a.xmlsb = c.id  ").append(
						" and c.hy_id = d.id ").append(" and a.cld_id in ")
				.append(" (select distinct b.cld_id ").append(
						" from  CZ_ZC_XX b where b.cdkzh = ? ").append(
						" and b.zhuangtai = '2') ");
		System.out.println(sb.toString());
		String jsonStr = "";
		List list = this.publicDao.queryForList(sb.toString(),
				new Object[] { loansId });
		List returnList = new ArrayList();
		if (list != null && list.size() > 0) {
			CzxxVO vo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				vo = new CzxxVO();
				vo.setId(String.valueOf(map.get("id")));
				vo.setFenlei(String.valueOf(map.get("fenlei")));
				vo.setLsbId(String.valueOf(map.get("lsbid")));
				vo.setCzxmmc(String.valueOf(map.get("czxmmc")));
				vo.setCldId(String.valueOf(map.get("cld_id")));
				String zt = String.valueOf(map.get("zhuangtai"));
				if (ZcczCommon.PROJECT_TYPE_WZX.equals(zt)) {
					zt = ZcczCommon.PROJECT_TYPE_WZX_ZH;
				} else if (ZcczCommon.PROJECT_TYPE_YJA.equals(zt)) {
					zt = ZcczCommon.PROJECT_TYPE_YJA_ZH;
				} else if (ZcczCommon.PROJECT_TYPE_ZXZ.equals(zt)) {
					zt = ZcczCommon.PROJECT_TYPE_ZXZ_ZH;
				} else {
					zt = "";
				}
				vo.setZhuangtai(zt);
				vo.setHycs(String.valueOf(map.get("hycs")));
				List spwyList = this.findSpwyByLsbId(vo.getLsbId(),
						ZcczCommon.DEALTODO_SPWY);// 查询审批委员
				StringBuffer name = new StringBuffer("");
				for (int j = 0; j < spwyList.size(); j++) {
					CzXmSpwYj spwy = (CzXmSpwYj) spwyList.get(j);
					name.append(spwy.getSpwyxm());
					if (j != spwyList.size() - 1) {
						name.append(",");
					}
				}
				List zcrList = this.findSpwyByLsbId(vo.getLsbId(),
						ZcczCommon.DEALTODO_ZCR);// 查询审批委员
				vo.setSpwy(name.toString());
				if (zcrList != null && zcrList.size() > 0) {
					CzXmSpwYj zcr = (CzXmSpwYj) zcrList.get(0);
					vo.setZcr(String.valueOf(zcr.getSpwyxm()));
				}
				returnList.add(vo);
			}
		}
		jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		return jsonStr;
	}

	/**
	 * 根据项目id查询主持人，或审批委员
	 * 
	 * @param id
	 * @return
	 */
	public List findSpwyByLsbId(String id, String isZcrOrSpwy) {

		String sql = "from CzXmSpwYj x where x.sfwzcr = ? and x.xmId = ?";
		List list = publicDao.find(sql, new Object[] { isZcrOrSpwy, id });
		return list;
	}

	/**
	 * 根据选择的项目得到项目下的资产列表
	 * 
	 * @return
	 */
	public String findAssetByCzXxList(String loansId, String cldId, String xmId) {
		String sql = "from CzZcXx x where x.cdkzh = ? and x.cldId = ?";
		List list = publicDao.find(sql, new Object[] { loansId, cldId });
		List returnList = new ArrayList();
		CzZcXx xx = null;
		CzxxVO vo = null;
		for (int i = 0; i < list.size(); i++) {
			xx = (CzZcXx) list.get(i);
			vo = new CzxxVO();
			try {
				BeanUtils.copyProperties(vo, xx);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			String zclx = xx.getBstzclx();
			if (StglCommon.ST_INFO_JINE.equals(zclx)) {
				zclx = "金额";
			} else if (StglCommon.ST_INFO_TUDI.equals(zclx)) {
				zclx = "土地";
			} else if (StglCommon.ST_INFO_FANGWU.equals(zclx)) {
				zclx = "房屋";
			} else if (StglCommon.ST_INFO_JIXIESHEBE.equals(zclx)) {
				zclx = "机械设备";
			} else if (StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(zclx)) {
				zclx = "交通运输";
			} else if (StglCommon.ST_INFO_DUIWAITOUZI.equals(zclx)) {
				zclx = "对外投资";
			} else if (StglCommon.ST_INFO_QITAZICHAN.equals(zclx)) {
				zclx = "其他资产";
			} else {
				zclx = "";
			}
			vo.setBstzclx(zclx);
			vo.setXmId(xmId);
			vo.setCzfs(findCodeByKey(xx.getCCzfs(), "ASSET_DISPOSE_METHOD"));
			returnList.add(vo);
		}
		String jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		return jsonStr;
	}

	/**
	 * 查询code表的value字段
	 * 
	 * @param codeKey
	 * @param codeType
	 * @return
	 */
	public String findCodeByKey(String codeKey, String codeType) {
		String sql = "from Code e where e.codeKey = ? and e.codeType = ? ";
		String value = "";
		Code code = (Code) publicDao.findSingleResult(sql, new Object[] {
				codeKey, codeType });
		if (code != null) {
			value = code.getCodeValue();
		}
		return value;
	}

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids) {
		// 拼接查询语句
		String sql = "select c.CI_CHN_NAME, n.LN_LN_ACCT_NO,n.LN_CUST_NO,n.LN_CURR_COD,"
				+ "n.LN_TOTL_LN_AMT_HYPO_AMT,n.LN_LN_BAL,n.LN_FLST_TLR_NO from CRT_DCC_LNLNSLNS n, "
				+ "CRT_DCC_CICIFCI1 c where n.LN_CUST_NO = c.CI_CUST_NO and n.LN_LN_ACCT_NO in "
				+ "(" + IdStrFormat.formatIds(ids) + ")";
		// 获得查询结果
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<LoansQueryVO> resultList = new ArrayList<LoansQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			LoansQueryVO tempVO = new LoansQueryVO();
			tempVO.setLnLnAcctNo(checkString(tempBO.get("LN_LN_ACCT_NO"))
					.trim());// 系统贷款编号
			tempVO.setLnCustNo(checkString(tempBO.get("LN_CUST_NO")).trim());// 客户编号
			tempVO.setLnCAcctNo(findlnCAcctNo(
					checkString(tempBO.get("LN_LN_ACCT_NO")),
					checkString(tempBO.get("LN_CURR_COD"))).trim());// 客户贷款账号
			tempVO.setLnCustName(checkString(tempBO.get("CI_CHN_NAME")).trim());// 客户名称
			tempVO.setFirstBranch(findFristBranch(
					checkString(tempBO.get("LN_LN_ACCT_NO")).substring(0, 3))
					.trim());// 一级分行
			tempVO.setBranchNo(checkString(tempBO.get("LN_LN_ACCT_NO")).trim()
					.substring(0, 9));// 机构编号
			tempVO.setLnCurrName(findsaCurrName(
					checkString(tempBO.get("LN_CURR_COD"))).trim());// 币种
			tempVO.setLnTotlLnAmtHypoAmt(new BigDecimal(checkString(tempBO
					.get("LN_TOTL_LN_AMT_HYPO_AMT"))));// 贷款总额
			tempVO.setLnLnBal(new BigDecimal(checkString(tempBO
					.get("LN_LN_BAL"))));// 贷款余额
			resultList.add(tempVO);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 100000);
		return json;
	}

	/**
	 * 通过贷款账号查找贷款基金关联关系
	 * 
	 * @param lnNo
	 * @return
	 */
	public String findRelate(String lnNo) {
		String sql = "select * from WD_LN_MORE_INFOR where LN_ACCT_NO = '"
				+ lnNo + "' and XULIE != '0'";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<RelateVO> relateList = new ArrayList<RelateVO>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			RelateVO vo = new RelateVO();
			vo.setXulie(checkString(map.get("XULIE")));
			vo.setFuncId(checkString(map.get("SA_SYS_ACCT_NO")));
			vo.setFuncCustId(checkString(map.get("SAV_CUST_ACCT_NO")));
			vo.setLoansId(checkString(map.get("LN_ACCT_NO")));
			vo.setLoansCustNo(checkString(map.get("C_CUST_ID")));
			vo.setFuncSP(checkString(map.get("FUND_ACCOUNTS_TASTER")));
			vo.setFuncQK(checkString(map.get("FUND_TYPE")));
			relateList.add(vo);
		}
		String json = BodyListToJSON.getJSON(relateList, 1, 1, 100000);
		return json;
	}

}
