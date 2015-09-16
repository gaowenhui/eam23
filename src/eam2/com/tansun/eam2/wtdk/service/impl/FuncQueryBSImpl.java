package com.tansun.eam2.wtdk.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.wtdk.WtdkCommon;
import com.tansun.eam2.wtdk.service.IFuncQueryBS;
import com.tansun.eam2.wtdk.vo.CustFundQueryVO;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.FuncSaacVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 基金查询bs
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
@Service
public class FuncQueryBSImpl extends WtdkCommon implements IFuncQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 基金查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncQueryVO queryVO, Paginator paginator) {
		// 拼接查询语句
		String sql = "select t.SA_ACCT_NO,n.SA_CUST_NO,n.sa_dep_typ,n.SA_CUST_Name,t.SA_CURR_COD,t.SA_ACLG,"
				+ "t.SA_AVL_BAL,t.SA_ACCT_BAL,n.SA_OPAC_INSTN_NO from crt_dcc_SAACNACN n,crt_dcc_SAACNAMT t, "
				+ "crt_dcc_SA_SAVE_TYPE s where n.SA_ACCT_NO = t.SA_ACCT_NO and n.sa_dep_typ = s.save_type ";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<FuncQueryVO> resultList = new ArrayList<FuncQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			FuncQueryVO tempVO = new FuncQueryVO();
			tempVO.setSaAcctNo(checkString(tempBO.get("SA_ACCT_NO")).trim());// 系统基金号
			tempVO.setSaCustAcctNo(findsaCAcctNo(checkString(tempBO.get("SA_ACCT_NO")),
					checkString(tempBO.get("SA_CURR_COD"))).trim());//基金客户账号
			tempVO.setSaCustNo(checkString(tempBO.get("SA_CUST_NO")).trim());// 客户编号
			tempVO.setSaCustName(checkString(tempBO.get("SA_CUST_Name")).trim());// 客户名称
			tempVO.setSaCurrCod(findsaCurrName(checkString(tempBO.get("SA_CURR_COD"))).trim()); // 币种
			tempVO.setSaAvlBal(new BigDecimal(checkString(tempBO.get("SA_AVL_BAL")))); // 可用余额
			tempVO.setSaAcctBal(new BigDecimal(checkString(tempBO.get("SA_ACCT_BAL"))));// 账户余额
			tempVO.setFirstBranch(findFristBranch(checkString(tempBO.get("SA_OPAC_INSTN_NO")).substring(0,3)).trim());// 一级分行
			tempVO.setSubCod(findSubCod(checkString(tempBO.get("sa_dep_typ"))).trim()); // 科目号
			tempVO.setSubName(findSubName(checkString(tempBO.get("sa_dep_typ"))).trim()); // 科目名
			tempVO.setSaOpacInstnName(findSaOpacInstnName(checkString(tempBO.get("SA_OPAC_INSTN_NO"))).trim());//经办行
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
	private String prepareHql(FuncQueryVO queryVO) {
		String hql = "";
		// 机构编号
		if (queryVO.getSaOpacInstnNo() != null
				&& queryVO.getSaOpacInstnNo().trim().length() > 0) {
			hql += " and n.sa_opac_instn_no like ? ";
		}
		// 客户名称
		if (queryVO.getSaCustName() != null
				&& queryVO.getSaCustName().trim().length() > 0) {
			hql += " and n.SA_CUST_NAME like ? ";
		}
		// 客户编号
		if (queryVO.getSaCustNo() != null
				&& queryVO.getSaCustNo().trim().length() > 0) {
			hql += " and n.SA_CUST_NO like ? ";
		}
		// 币种
		if (queryVO.getSaCurrCod() != null
				&& queryVO.getSaCurrCod().trim().length() > 0) {
			hql += " and t.SA_CURR_COD = ? ";
		}
		// 系统基金号
		if (queryVO.getSaAcctNo() != null
				&& queryVO.getSaAcctNo().trim().length() > 0) {
			hql += " and n.SA_ACCT_NO like ? ";
		}
		// 一级机构
		if (queryVO.getFirstBranch() != null
				&& queryVO.getFirstBranch().trim().length() > 0) {
			hql += " and n.SA_OPAC_INSTN_NO like ? ";
		}
		// 科目名称
		if (queryVO.getSubName() != null
				&& queryVO.getSubName().trim().length() > 0) {
			hql += " and s.sub_name like ? ";
		}
		// 科目号
		if (queryVO.getSubCod() != null
				&& queryVO.getSubCod().trim().length() > 0) {
			hql += " and s.sub_cod like ? ";
		}
		hql += " order by n.SA_ACCT_NO asc";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(FuncQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 机构编号
		if (queryVO.getSaOpacInstnNo() != null
				&& queryVO.getSaOpacInstnNo().trim().length() > 0) {
			list.add("%" + queryVO.getSaOpacInstnNo() + "%");
		}
		// 客户名称
		if (queryVO.getSaCustName() != null
				&& queryVO.getSaCustName().trim().length() > 0) {
			list.add("%" + queryVO.getSaCustName() + "%");
		}
		// 客户编号
		if (queryVO.getSaCustNo() != null
				&& queryVO.getSaCustNo().trim().length() > 0) {
			list.add("%" + queryVO.getSaCustNo() + "%");
		}
		// 币种
		if (queryVO.getSaCurrCod() != null
				&& queryVO.getSaCurrCod().trim().length() > 0) {
			list.add(queryVO.getSaCurrCod());
		}
		// 系统基金号
		if (queryVO.getSaAcctNo() != null
				&& queryVO.getSaAcctNo().trim().length() > 0) {
			list.add("%" + queryVO.getSaAcctNo() + "%");
		}
		// 一级机构
		if (queryVO.getFirstBranch() != null
				&& queryVO.getFirstBranch().trim().length() > 0) {
			list.add(queryVO.getFirstBranch() + "%");
		}
		// 科目名
		if (queryVO.getSubName() != null
				&& queryVO.getSubName().trim().length() > 0) {
			list.add("%" + queryVO.getSubName() + "%");
		}
		// 科目号
		if (queryVO.getSubCod() != null
				&& queryVO.getSubCod().trim().length() > 0) {
			list.add("%" + queryVO.getSubCod() + "%");
		}
		return list;
	}

	/**
	 * 根据基金系统账号查找基金信息
	 * @param ciCustNo
	 * @return
	 */
	public FuncQueryVO findFuncInfoByFuncNo(String funcNo){
		FuncQueryVO func = new FuncQueryVO();
		String sql = "select t.SA_ACCT_NO,n.SA_CUST_NO,n.SA_CUST_Name,t.SA_ACLG,t.SA_CURR_COD,n.SA_CACCT_DT,"
			+ "t.SA_AVL_BAL,t.SA_ACCT_BAL,n.SA_OPAC_INSTN_NO,n.sa_dep_typ from crt_dcc_SAACNACN n,crt_dcc_SAACNAMT t "
			+ "where n.SA_ACCT_NO = t.SA_ACCT_NO and n.SA_ACCT_NO = '"+funcNo +"'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map tempBO = (Map) list.get(0);
			func.setSaAcctNo(checkString(tempBO.get("SA_ACCT_NO")).trim());// 系统基金号
			func.setSaCustNo(checkString(tempBO.get("SA_CUST_NO")).trim());// 客户编号
			func.setSaCustName(checkString(tempBO.get("SA_CUST_Name")).trim());// 客户名称
			func.setSaCurrCod(findsaCurrName(checkString(tempBO.get("SA_CURR_COD"))).trim()); // 币种
			func.setSaAvlBal(new BigDecimal(checkString(tempBO.get("SA_AVL_BAL")))); // 可用余额
			func.setSaAcctBal(new BigDecimal(checkString(tempBO.get("SA_ACCT_BAL"))));// 账户余额
			func.setSaOpacInstnNo(checkString(tempBO.get("SA_OPAC_INSTN_NO")).trim());//开户机构编号
			func.setFirstBranch(findFristBranch(checkString(tempBO.get("SA_OPAC_INSTN_NO"))).trim());// 一级分行
			func.setSaCacctDt(changeDate(checkString(tempBO.get("SA_CACCT_DT")).trim()));//销户日期
			func.setSubCod(findSubCod(checkString(tempBO.get("sa_dep_typ"))).trim()); // 科目号
			func.setSubName(findSubName(checkString(tempBO.get("sa_dep_typ"))).trim()); // 科目名
			func.setSaOpacInstnName(findSaOpacInstnName(checkString(tempBO.get("SA_OPAC_INSTN_NO"))).trim());//开户机构名称
			func.setSaCustAcctNo(findsaCAcctNo(checkString(tempBO.get("SA_ACCT_NO")),
					checkString(tempBO.get("SA_CURR_COD"))).trim()); // 客户基金账户
		}
		return func;
	}

	/**
	 * 通过账号查找交易明细
	 * @return
	 */
	public String findSaacByFuncNo(String funcNo){
		String sql = " select * from CRT_DCC_SAACNTXN where SA_ACCT_NO = '" + funcNo + "'";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<FuncSaacVO> resultList = new ArrayList<FuncSaacVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map fund = (Map) queryList.get(i);
			FuncSaacVO saacVO = new FuncSaacVO();
			saacVO.setSaTxAmt(new BigDecimal(checkString(fund.get("SA_TX_AMT")).trim())); // 交易金额
			saacVO.setSaDdpAcctBal(new BigDecimal(checkString(fund.get("SA_DDP_ACCT_BAL")).trim())); // 账户余额
			saacVO.setSaSvc(new BigDecimal(checkString(fund.get("SA_SVC")).trim()));// 手续费
			saacVO.setSaOpunCod(findSaOpacInstnName(checkString(fund.get("SA_OPUN_COD"))).trim());// 交易机构
			saacVO.setSaTxTm(changeTime(checkString(fund.get("SA_TX_TM")).trim()));// 交易时间
			saacVO.setSaTxDt(changeDate(checkString(fund.get("SA_TX_DT")).trim()));// 交易日期
			saacVO.setSaOpunName(findSaOpacInstnName(checkString(fund.get("SA_OPUN_COD"))).trim());//交易机构名称
			saacVO.setSaAcctNo(funcNo);
			resultList.add(saacVO);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}
	
	/**
	 * 查找基金关联的贷款信息
	 * @param funcNo
	 * @return
	 */
	public String findLnByFuncNo(String funcNo){
		String sql = " select l.* from wd_ln_more_infor t,crt_dcc_LNLNSLNS l " +
				"where t.ln_acct_no = l.ln_ln_acct_no and t.sa_sys_acct_no = '"+funcNo+"'";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<CustFundQueryVO> resultList = new ArrayList<CustFundQueryVO>();
		for (int i = 0; i < queryList.size(); i++) {
			Map ln = (Map) queryList.get(i);
			CustFundQueryVO fundVO = new CustFundQueryVO();
			fundVO.setLnLnAcctNo(checkString(ln.get("LN_LN_ACCT_NO")).trim());// 系统贷款账号
			fundVO.setLnCustNo(checkString(ln.get("LN_CUST_NO")).trim()); // 客户编号
			fundVO.setLnCurrCod(findsaCurrName(checkString(ln.get("LN_CURR_COD"))).trim());// 币种
			fundVO.setLnTotlLnAmtHypoAmt(checkString(ln.get("LN_TOTL_LN_AMT_HYPO_AMT")).trim());// 贷款总额
			fundVO.setLnLnBal(checkString(ln.get("LN_LN_BAL")).trim());// 贷款余额
			fundVO.setSaCustName(findCustNameByCustNo(checkString(ln.get("LN_CUST_NO"))).trim());//客户名称
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
		String sql = "select t.SA_ACCT_NO,n.SA_CUST_NO,n.SA_CUST_Name,t.SA_ACLG,t.SA_CURR_COD,n.sa_dep_typ"
				+ "t.SA_AVL_BAL,t.SA_ACCT_BAL,n.SA_OPAC_INSTN_NO from crt_dcc_SAACNACN n,crt_dcc_SAACNAMT t "
				+ "where n.SA_ACCT_NO = t.SA_ACCT_NO and n.SA_ACCT_NO in (" + IdStrFormat.formatIds(ids) + ")";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		List<FuncQueryVO> resultList = new ArrayList<FuncQueryVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			FuncQueryVO tempVO = new FuncQueryVO();
			tempVO.setSaAcctNo(checkString(tempBO.get("SA_ACCT_NO")).trim());// 系统基金号
			tempVO.setSaCustAcctNo(findsaCAcctNo(checkString(tempBO.get("SA_ACCT_NO")),
					checkString(tempBO.get("SA_CURR_COD"))).trim());//基金客户账号
			tempVO.setSaCustNo(checkString(tempBO.get("SA_CUST_NO")).trim());// 客户编号
			tempVO.setSaCustName(checkString(tempBO.get("SA_CUST_Name")).trim());// 客户名称
			tempVO.setSubName(findSubName(checkString(tempBO.get("sa_dep_typ"))).trim()); // 科目名
			tempVO.setSaCurrCod(findsaCurrName(checkString(tempBO.get("SA_CURR_COD"))).trim()); // 币种
			tempVO.setSaAvlBal(new BigDecimal(checkString(tempBO.get("SA_AVL_BAL")))); // 可用余额
			tempVO.setSaAcctBal(new BigDecimal(checkString(tempBO.get("SA_ACCT_BAL"))));// 账户余额
			tempVO.setFirstBranch(findFristBranch(checkString(tempBO.get("SA_OPAC_INSTN_NO")).substring(0,3)).trim());// 一级分行
			resultList.add(tempVO);
		}
		String json = BodyListToJSON.getJSON(resultList,1,1,100000);
		return json;
	}
	
}
