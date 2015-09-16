package com.tansun.eam2.common.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.ucc.IMenuTreeUcc;
import com.tansun.rdp4j.common.model.orm.bo.PTFunctionGroupBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.impl.UserImpl;

public class MenuTreeDataServlet  extends HttpServlet implements java.io.Serializable {

	private static final long serialVersionUID = -8574453837458204778L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserImpl user = (UserImpl) request.getSession().getAttribute("user");
 		if (user == null) {			
			response.sendRedirect("/index.jsp");
		}
 		String perid = user.getUserTidChar();
		String parid = (String)request.getParameter("parid");
		IMenuTreeUcc menuTree = (IMenuTreeUcc) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("menuTreeUccImpl");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		start(response.getWriter(), perid, parid, menuTree);
	}

	/**
	 * 组合并写入xml文件
	 * @param writer
	 * @param parid
	 * @param menuTree
	 */
	private void start(PrintWriter writer, String perid, String parid,
			IMenuTreeUcc menuTree) {
		
		String xml = getFuncXML(menuTree, perid, parid);
		if(xml != null && xml.length() > 0){
			writer.write(xml);
		}else{
			writer.write("无数据");
		}
	}

	/**
	 * 组合xml文件
	 * @param menus
	 * @return
	 */
	private String getFuncXML(IMenuTreeUcc menuTree, String perid, String parid) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"0\">").append("\n");
		getNestItem(sb, menuTree, perid, parid);
		sb.append("</tree>").append("\n");
		return sb.toString();
	}
	
	/**
	 * 拼合树节点的内容
	 * @param sb
	 * @param menus
	 */
	private void getNestItem(StringBuffer sb, IMenuTreeUcc menuTree, String perid, String parid){
		List menus = menuTree.getSonItem(perid, parid);
		Iterator iterator = menus.iterator();
		while(iterator.hasNext()) {
			Map map = new HashMap();
			map	= (Map)iterator.next();
			// 判断如果有链接地址的话就是叶子结点，如果没有链接地址的话就继续查询子节点
			if(map.get("PARAMETER") == null || map.get("PARAMETER").toString().length() == 0){
				sb.append("<item text=\"" + map.get("FUNC_GROUP_NAME") + "\"");
				if( map.get("TID") != null &&  map.get("TID").toString().length() > 0){
					sb.append(" id=\"" + map.get("TID") + "\"");
				}
				sb.append(" >").append("\n");
				getNestItem(sb, menuTree, perid, String.valueOf(map.get("TID")));
			} else {
				sb.append("<item text=\"" + map.get("FUNC_GROUP_NAME") + "\"");
				if( map.get("TID") != null &&  map.get("TID").toString().length() > 0){
					sb.append(" id=\"" + map.get("TID") + "\"");
				}
				sb.append(" >").append("\n");
				sb.append("<userdata name=\"link\">").append(map.get("PARAMETER")).append("</userdata>").append("\n");
			}
			sb.append("</item>").append("\n");
		}
	}
}
