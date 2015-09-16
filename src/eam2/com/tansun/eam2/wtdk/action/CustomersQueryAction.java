package com.tansun.eam2.wtdk.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.wtdk.ucc.ICustomersQueryUCC;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 
 * @author 陈煜霄
 * @data 2010-12-02
 */
public class CustomersQueryAction extends CommonAction {

	private CustomersQueryVO queryVO;
	private Paginator paginator;
	private CrtDccCicifci1 cust;
	@Autowired
	private ICustomersQueryUCC cusomersQueryUCC;

	/**
	 * 进入客户查询页面
	 * 
	 * @return
	 */
	public String init() {
		return "init";
	}

	/**
	 * 客户查询功能
	 * 
	 * @return
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new CustomersQueryVO();
		} else {
			String start = queryVO.getStartCiFlstDt().replace("-", "");
			String end = queryVO.getEndCiFlstDt().replace("-", "");
			queryVO.setStartCiFlstDt(start);
			queryVO.setEndCiFlstDt(end);
		}
		String cusomersJSON = cusomersQueryUCC.query(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cusomersJSON);
		return null;
	}

	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @return
	 */
	public String customerInfo() {
		String ciCustNo = request.getParameter("ciCustNo");
		ciCustNo = ciCustNo.replace("DGL", "#");
		cust = cusomersQueryUCC.findCiCustByCustNo(ciCustNo);// 客户信息
		String fundJSON = cusomersQueryUCC.findFundByCustNo(ciCustNo);// 基金信息表
		String lnJSON = cusomersQueryUCC.findLnByCustNo(ciCustNo);// 贷款信息表
		request.setAttribute("fundJSON", fundJSON);
		request.setAttribute("lnJSON", lnJSON);
		return "custInfo";
	}

	/**
	 * 以下为用到的getter setter
	 */
	public CustomersQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(CustomersQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public CrtDccCicifci1 getCust() {
		return cust;
	}

	public void setCust(CrtDccCicifci1 cust) {
		this.cust = cust;
	}

}

//[fa_cardhistory, fa_card, arap_djfb, arap_djlx, arap_djzb, arap_item, arap_item_b,
// bd_accid, bd_balatype, bd_busitype, bd_corp, bd_costsubj, bd_cubasdoc, bd_currtype,
// bd_deptdoc, bd_invbasdoc, bd_jobbasfil, bd_jobphase, bd_payterm, bd_psndoc, bd_subjtype,
// fa_addreducestyle, fa_alterreason, fa_altersheet, fa_assetreduce, fa_bill, fa_bill_b, fa_carditem,
// fa_cardsub, fa_category, fa_deptscale, fa_evaluate, fa_evaluatebody, fa_predevaluate, sm_user, null,
// null, null]
//
//[arap_djfb, arap_djlx, arap_djzb, arap_item, arap_item_b, bd_accid, bd_balatype, bd_busitype,
// bd_corp, bd_costsubj, bd_cubasdoc, bd_currtype, bd_deptdoc, bd_invbasdoc, bd_jobbasfil, bd_jobphase, 
// bd_payterm, bd_psndoc, bd_subjtype, fa_addreducestyle, fa_alterreason, fa_altersheet, fa_assetreduce, 
// fa_bill, fa_bill_b, fa_card, fa_cardhistory, fa_carditem, fa_category, fa_deptscale, fa_evaluate, 
// fa_evaluatebody, fa_predevaluate, sm_user, null, null, null, null]




