package com.tansun.eam2.wtdk.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.wtdk.ucc.IFuncCustQueryUCC;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.FuncCustQueryUCCImpl;
import com.tansun.eam2.wtdk.ucc.impl.FuncQueryUCCImpl;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 基金查询Action
 * 
 * @author 陈煜霄
 * @data 2010-12-02
 */
public class FuncQueryAction extends CommonAction implements IExport {
	private FuncQueryVO queryVO;
	private Paginator paginator;
	@Autowired
	private IFuncQueryUCC funcQueryUCCImpl;

	/**
	 * 进入基金查询页面
	 * 
	 * @return
	 */
	public String init() {
		String isFuLn = request.getParameter("isFuLn");// 贷款账户关联基金账户
		String loansId = request.getParameter("loansId");// 贷款账号
		request.setAttribute("loansId", loansId);
		request.setAttribute("isFuLn", isFuLn);
		return "init";
	}

	/**
	 * 基金查询功能
	 * 
	 * @return
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new FuncQueryVO();
		} else {
			if (queryVO.getFirstBranch() != null
					&& !"".equals(queryVO.getFirstBranch())) {
				String first = queryVO.getFirstBranch();
				first = first.substring(1, 4);
				queryVO.setFirstBranch(first);
			}
		}
		String cusomersJSON = funcQueryUCCImpl.query(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cusomersJSON);
		return null;
	}
	
	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if (queryVO == null) {
			queryVO = new FuncQueryVO();
		} else {
			if (queryVO.getFirstBranch() != null
					&& !"".equals(queryVO.getFirstBranch())) {
				String first = queryVO.getFirstBranch();
				first = first.substring(1, 4);
				queryVO.setFirstBranch(first);
			}
		}
		if(funcQueryUCCImpl==null){
			funcQueryUCCImpl=(IFuncQueryUCC)SpringContextHelper.getBean(FuncQueryUCCImpl.class);
		}
		String json = funcQueryUCCImpl.query(queryVO, paginator);
		return json;
	}

	/**
	 * 基金详细信息
	 * 
	 * @return
	 */
	public String funcInfo() {
		String funcNo = request.getParameter("funcNo");
		queryVO = funcQueryUCCImpl.findFuncInfoByFuncNo(funcNo);
		String mingxiJSON = funcQueryUCCImpl.findSaacByFuncNo(funcNo);
		String lnJSON = funcQueryUCCImpl.findLnByFuncNo(funcNo);
		request.setAttribute("lnJSON", lnJSON);
		request.setAttribute("mingxiJSON", mingxiJSON);
		return "funcInfo";
	}

	/**
	 * excel勾选导出
	 * 
	 * @return
	 * @throws IOException
	 */
	public String excelCheck() throws IOException {
		String params = request.getParameter("idStr");
		String json = funcQueryUCCImpl.query4excel(params);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 以下为用到的getter setter
	 * 
	 * @return
	 */

	public FuncQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(FuncQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryVO = (FuncQueryVO)excelVO;
	}

}
