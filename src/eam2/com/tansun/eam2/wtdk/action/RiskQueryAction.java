package com.tansun.eam2.wtdk.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.wtdk.ucc.ILoansQueryUCC;
import com.tansun.eam2.wtdk.ucc.IRiskQueryUCC;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.eam2.wtdk.vo.RiskQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 风险查询Action
 * 
 * @author 陈煜霄
 * @data 2010-12-06
 */
public class RiskQueryAction extends CommonAction {

	private RiskQueryVO queryVO;
	private Paginator paginator;
	private LoansRiskVO riskVO;
	@Autowired
	private IRiskQueryUCC riskQueryUCCImpl;
	@Autowired
	private ILoansQueryUCC loansQueryUCCImpl;

	/**
	 * 进入风险查询页面
	 * 
	 * @return
	 */
	public String init() {
		return "init";
	}

	/**
	 * 查询风险
	 * 
	 * @return
	 * @throws IOException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new RiskQueryVO();
		}
		String riskJSON = riskQueryUCCImpl.query(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(riskJSON);
		return null;
	}

	/**
	 * 进入风险详细页面并进行修改
	 * 
	 * @return
	 */
	public String riskInfo() {
		String lnNo = request.getParameter("lnNo");
		String flush = request.getParameter("flush");
		riskVO = loansQueryUCCImpl.findRiskInfoByLnNo(lnNo);
		request.setAttribute("saveORupdate", "update");
		request.setAttribute("flush", flush);
		return "riskInfo";
	}

	/**
	 * 风险信息删除
	 * 
	 * @return
	 */
	public String deleteRisk() {
		String lnNo = request.getParameter("lnNo");
		if (lnNo.startsWith(",")) {
			lnNo = lnNo.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] lnIds = lnNo.split(",");
		riskQueryUCCImpl.delete(lnIds);
		return null;
	}

	/**
	 * 以下为所用到的getter setter
	 * 
	 * @return
	 */
	public RiskQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(RiskQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public LoansRiskVO getRiskVO() {
		return riskVO;
	}

	public void setRiskVO(LoansRiskVO riskVO) {
		this.riskVO = riskVO;
	}

}
