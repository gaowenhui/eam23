package com.tansun.eam2.zccz.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.zccz.ucc.INoticeQueryUCC;
import com.tansun.eam2.zccz.vo.STZCqueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 处置公告查询
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */


public class NoticeQueryAction extends CommonAction {

	private STZCqueryVO queryVO;
	private Paginator paginator;
	@Autowired
	private INoticeQueryUCC noticeQueryUCCImpl;

	/**
	 * 进入实体查询页面
	 * 
	 * @return
	 */
	public String initST() {
		return "initST";
	}

	/**
	 * 查询处置实体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryST() throws IOException {
		if (queryVO == null) {
			queryVO = new STZCqueryVO();
		}
		String stJSON = noticeQueryUCCImpl.queryST(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(stJSON);
		return null;
	}

	/**
	 * 进入资产查询页面
	 * 
	 * @return
	 */
	public String initZC() {
		return "initZC";
	}

	/**
	 * 查询处置资产
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryZC() throws IOException {
		if (queryVO == null) {
			queryVO = new STZCqueryVO();
		}
		String zcJSON = noticeQueryUCCImpl.queryZC(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zcJSON);
		return null;
	}

	/**
	 * 进入债券查询页面
	 * 
	 * @return
	 */
	public String initZQ() {
		return "initZQ";
	}

	/**
	 * 查询债券资产
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryZQ() throws IOException {
		if (queryVO == null) {
			queryVO = new STZCqueryVO();
		}
		String zqJSON = noticeQueryUCCImpl.queryZQ(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zqJSON);
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */
	public STZCqueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(STZCqueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

}
