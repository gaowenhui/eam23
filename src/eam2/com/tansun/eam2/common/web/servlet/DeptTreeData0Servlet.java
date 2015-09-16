package com.tansun.eam2.common.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.ucc.IDeptTreeUcc;

public class DeptTreeData0Servlet extends HttpServlet implements
		java.io.Serializable {

	private static final long serialVersionUID = -8574453837458204778L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String tid = (String) request.getParameter("tid");
		String parid = (String) request.getParameter("parid");
		String level = (String) request.getParameter("level");
		String option = (String) request.getParameter("option");
		level = level != null ? level : "9999";
		Integer integer = Integer.parseInt(level);
		IDeptTreeUcc depts = (IDeptTreeUcc) WebApplicationContextUtils
				.getRequiredWebApplicationContext(
						request.getSession().getServletContext()).getBean(
						"deptTreeUccImpl");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		start(response.getWriter(), tid, parid, depts, integer, option);
	}

	private void start(PrintWriter writer, String tid, String parid,
			IDeptTreeUcc depts, Integer level, String option) {
		String xml = getDeptXML(depts, tid, parid, level, option);
		if (xml != null && xml.length() > 0) {
			writer.write(xml);
		} else {
			writer.write("无数据");
		}
	}

	/**
	 * 组合xml文件
	 * 
	 * @param menus
	 * @return
	 */
	private String getDeptXML(IDeptTreeUcc depts, String tid, String parid, Integer level, String option) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"").append("0").append("\">").append("\n");
		getItem(sb, depts, tid, parid, level, 0, option);
		sb.append("</tree>").append("\n");
		return sb.toString();
	}

	/**
	 * 获得部门树的节点，当节点到第二层的时候停止向下查找
	 * @param sb
	 * @param depts
	 * @param tid
	 * @param parid
	 * @param level
	 * @param current
	 */
	private void getItem(StringBuffer sb, IDeptTreeUcc depts, String tid, String parid, 
			Integer level, int current, String option) {
		current++;
		List deptList = new ArrayList();
		if(StringUtils.equals("pgsc",option)){
			//评估审查默认情况下只能选风险管理部
			deptList = depts.getEAM2Dept(parid, option);
		}else{
			deptList = depts.getEAM2Dept(parid);
		}

		Iterator iterator = deptList.iterator();
		while (iterator.hasNext()) {
			Map map = new HashMap();
			map = (Map) iterator.next();
			if(tid.equals("10775")){
				if(String.valueOf(map.get("DEPTID")).equals("113")){
					continue;
				}
			} else if (tid.equals("113")){
				if(String.valueOf(map.get("DEPTID")).equals("10775")){
					continue;
				}
			}
			sb.append("<item text=\"" + map.get("DEPTNAME") + "\"");
			sb.append(" id=\"" + map.get("DEPTID") + "\"");
			sb.append(" >").append("\n");
			if(current < level){
				getItem(sb, depts, tid, String.valueOf(map.get("DEPTID")), level, current++, option);
				current--;
			}
			sb.append("</item>").append("\n");
		}
		
	}
}
