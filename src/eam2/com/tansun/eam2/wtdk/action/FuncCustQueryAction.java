package com.tansun.eam2.wtdk.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.wtdk.ucc.IFuncCustQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.FuncCustQueryUCCImpl;
import com.tansun.eam2.wtdk.vo.CustomersQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 基金客户查询
 * 
 * @author 陈煜霄
 * @date 2010-12-27
 */
public class FuncCustQueryAction extends CommonAction implements IExport {

	private CustomersQueryVO queryVO;
	private Paginator paginator;
	private CrtDccCicifci1 cust;
	@Autowired
	private IFuncCustQueryUCC funcCustQueryUCCImpl;

	/**
	 * 进入基金客户查询页面
	 * 
	 * @return
	 */
	public String init() {
		return "init";
	}

	/**
	 * 查询基金客户
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 * @throws IOException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new CustomersQueryVO();
		}
		String json = funcCustQueryUCCImpl.query(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}
	
	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if(funcCustQueryUCCImpl==null){
			funcCustQueryUCCImpl=(IFuncCustQueryUCC)SpringContextHelper.getBean(FuncCustQueryUCCImpl.class);
		}
		String json = funcCustQueryUCCImpl.query(queryVO, paginator);
		return json;
	}
	
	/**
	 * 根据客户编号查询客户详细信息
	 * 
	 * @return
	 */
	public String customerInfo() {
		String ciCustNo = request.getParameter("ciCustNo");
		ciCustNo = ciCustNo.replace("DGL", "#");
		cust = funcCustQueryUCCImpl.findCiCustByCustNo(ciCustNo);// 客户信息
		String fundJSON = funcCustQueryUCCImpl.findFundByCustNo(ciCustNo);// 基金信息表
		request.setAttribute("fundJSON", fundJSON);
		return "custInfo";
	}

	/**
	 * excel勾选导出
	 * @return
	 * @throws IOException 
	 */
	public String excelCheck() throws IOException{
		String params = request.getParameter("idStr");
		String json = funcCustQueryUCCImpl.query4excel(params);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}
	
	/*
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

	public void setExcelVO(CommonBO excelVO) {
		this.queryVO =(CustomersQueryVO) excelVO;
	}

}
