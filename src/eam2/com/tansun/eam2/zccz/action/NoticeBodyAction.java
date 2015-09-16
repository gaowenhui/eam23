package com.tansun.eam2.zccz.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.zccz.ucc.INoticeUCC;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;


public class NoticeBodyAction extends CommonAction {

	@Autowired
	private INoticeUCC noticeUCCImpl;

	/**
	 * 查找实体表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findSTBody() throws IOException {
		String headId = request.getParameter("headId");
		String stBodyJSON = noticeUCCImpl.findSTBodyByHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(stBodyJSON);
		return null;
	}

	/**
	 * 查找资产表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findZCBody() throws IOException {
		String headId = request.getParameter("headId");
		String zcBodyJSON = noticeUCCImpl.findZCBodyByHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zcBodyJSON);
		return null;
	}

	/**
	 * 查找债券表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findZQBody() throws IOException {
		String headId = request.getParameter("headId");
		String zcBodyJSON = noticeUCCImpl.findZQBodyByHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(zcBodyJSON);
		return null;
	}

	/**
	 * 添加处置实体表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveSTBody() throws IOException {
		String headId = request.getParameter("headId");
		String stIds = request.getParameter("stIds");
		if (stIds.startsWith(",")) {
			stIds = stIds.substring(1);
		}
		String[] ids = stIds.split(",");
		noticeUCCImpl.saveSTBody(headId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 添加处置资产表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveZCBody() throws IOException {
		String headId = request.getParameter("headId");
		String zcIds = request.getParameter("zcIds");
		if (zcIds.startsWith(",")) {
			zcIds = zcIds.substring(1);
		}
		String[] ids = zcIds.split(",");
		noticeUCCImpl.saveZCBody(headId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 添加处置债券表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveZQBody() throws IOException {
		String headId = request.getParameter("headId");
		String zqIds = request.getParameter("zqIds");
		if (zqIds.startsWith(",")) {
			zqIds = zqIds.substring(1);
		}
		String[] ids = zqIds.split(",");
		noticeUCCImpl.saveZQBody(headId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 删除处置实体表体
	 * 
	 * @return
	 */
	public String delBody() throws IOException {
		String bodyIds = request.getParameter("bodyIds");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		String[] ids = bodyIds.split(",");
		noticeUCCImpl.delBody(ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("删除成功！");
		return null;
	}

	/**
	 * 打开实体body修改页面
	 * 
	 * @return
	 */
	public String openBody() {
		String bodyIds = request.getParameter("bodyIds");
		String type = request.getParameter("type");
		request.setAttribute("type", type);
		request.setAttribute("bodyIds", bodyIds);
		return "openBody";
	}

	/**
	 * 修改处置公告表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updBody() throws IOException {
		String bodyIds = request.getParameter("bodyIds");
		String zcms = request.getParameter("zcms");
		String czysbs = request.getParameter("czysbs");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		String[] ids = bodyIds.split(",");
		noticeUCCImpl.updBody(ids, zcms, czysbs);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("修改成功！");
		return null;
	}
	
	/**
	 * 修改处置公告表体
	 * @return
	 */
	public String updateBody(){
		String id = request.getParameter("id");
		String[]bodyIds = new String[1];
		bodyIds[0] = id;
		String zcms = request.getParameter("zcms");
		String czysbs = request.getParameter("czysbs");
		noticeUCCImpl.updBody(bodyIds, zcms, czysbs);
		return null;
	}
	
//	/**
//	 * 债券的详细信息
//	 * @return
//	 */
//	public String bodyDetailZQ(){
//		
//	}
//	
//	/**
//	 * 资产的详细信息
//	 * @return
//	 */
//	public String bodyDetailZC(){
//		
//	}
//	
//	/**
//	 * 实体的详细信息
//	 * @return
//	 */
//	public String bodyDetailST(){
//		
//	}
	
}
