package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.zccz.ucc.IDisposeItemStaticUCC;
import com.tansun.eam2.zccz.ucc.impl.DisposeItemStaticUCCImpl;
import com.tansun.eam2.zccz.vo.DisposeItemStaticVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 统计查询
 * 
 * @author 陈煜霄
 * @data 2010-12-31
 */

public class DisposeItemStaticAction extends CommonAction implements IExport{

	private Paginator paginator;
	private DisposeItemStaticVO queryVO;
	@Autowired
	private IDisposeItemStaticUCC disposeItemStaticUCCImpl;

	/**
	 * 进入查询页面
	 * 
	 * @return
	 */
	public String init() {
		return "init";
	}

	/**
	 * 查询
	 * 
	 * @return
	 * @throws IOException
	 */
	public String query() throws IOException {
		String json = disposeItemStaticUCCImpl.query(paginator, queryVO);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}
	/**
	 * 查询总卡片数
	 * @throws IOException 
	 * 
	 */
	public String querykp() throws IOException{
		String kp = disposeItemStaticUCCImpl.querykp(queryVO);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(kp);
		return null;
	}

	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if (disposeItemStaticUCCImpl == null) {
			disposeItemStaticUCCImpl = (IDisposeItemStaticUCC) SpringContextHelper
					.getBean(DisposeItemStaticUCCImpl.class);
		}
		String json = disposeItemStaticUCCImpl.query(paginator, queryVO);
		return json;
	}
	
	public String findCZFS() throws IOException {
		String leibie = request.getParameter("leibie");
		if ("0".equals(leibie)) {
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'yds':[");
			Map<String, String> ydMap = disposeItemStaticUCCImpl.findSTczfs();
			for (Map.Entry<String, String> entry : ydMap.entrySet()) {
				returnStr.append("{'ydid':'" + entry.getKey() + "','ydtext':'"
						+ entry.getValue() + "'},");
			}
			if (ydMap.size() != 0) {
				returnStr.deleteCharAt(returnStr.length() - 1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		} else if ("1".equals(leibie)) {
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'yds':[");
			Map<String, String> ydMap = disposeItemStaticUCCImpl.findZCczfs();
			for (Map.Entry<String, String> entry : ydMap.entrySet()) {
				returnStr.append("{'ydid':'" + entry.getKey() + "','ydtext':'"
						+ entry.getValue() + "'},");
			}
			if (ydMap.size() != 0) {
				returnStr.deleteCharAt(returnStr.length() - 1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}
		return null;
	}

	/*
	 * 以下为getter setter方法
	 */
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public DisposeItemStaticVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(DisposeItemStaticVO queryVO) {
		this.queryVO = queryVO;
	}

	public IDisposeItemStaticUCC getDisposeItemStaticUCCImpl() {
		return disposeItemStaticUCCImpl;
	}

	public void setDisposeItemStaticUCCImpl(
			IDisposeItemStaticUCC disposeItemStaticUCCImpl) {
		this.disposeItemStaticUCCImpl = disposeItemStaticUCCImpl;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryVO = (DisposeItemStaticVO)excelVO;
	}

}
