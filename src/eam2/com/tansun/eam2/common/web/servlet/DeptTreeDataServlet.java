package com.tansun.eam2.common.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.model.orm.bo.EAMDept;
import com.tansun.eam2.common.model.orm.bo.EAMUser;
import com.tansun.eam2.common.ucc.IDeptTreeUcc;

public class DeptTreeDataServlet  extends HttpServlet implements java.io.Serializable {

	private static final long serialVersionUID = -8574453837458204778L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id =  (String)request.getParameter("tid");
		String parid =  (String)request.getParameter("parid");
        String include = (String)request.getParameter("include");
        String level = (String)request.getParameter("level");
        include = include != null ? include : "true";
        level = level != null ? level : "-1";
		IDeptTreeUcc tree = (IDeptTreeUcc) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("deptTreeUccImpl");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		Long tid = id == null ? null : new Long(id);
		start(response.getWriter(), tid, new Long(parid), tree, include, level);
	}

	private void start(PrintWriter writer, Long tid, Long parid, IDeptTreeUcc tree, String include, String level) {
		List<EAMDept> depts = tree.getEAMDept(tid, parid);
		String xml = getDeptXML(depts,parid.toString(), include, level);
		if(xml != null && xml.length() > 0){
			writer.write(xml);
		}else{
			writer.write("无数据");
		}
	}

	private String getDeptXML(List<EAMDept> depts, String parid, String include, String level) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"").append("0").append("\">").append("\n");
		getItem(sb, depts, include, Integer.parseInt(level), 0);
		sb.append("</tree>").append("\n");
		return sb.toString();
	}

	private void getItem(StringBuffer sb, List<EAMDept> depts, String include, int level, int current) {
        current++;
		for (EAMDept dept : depts) {
			sb.append("<item text=\"" + dept.getDeptName() + "\" id=\"" + dept.getTid() +"\" >").append("\n");
            if(include.equals("true")){
                for (EAMUser user : dept.getUsers()) {
                    sb.append("<item text=\"" + user.getUsername() + "\" id=\"" + user.getTid() +"\" >");
                    sb.append("<userdata name=\"isUser\">1</userdata>").append("</item>").append("\n");
                }
            }
            if(level != current){
			    getItem(sb, dept.getDepts(), include, level,current);
            }
			sb.append("</item>").append("\n");
		}
	}
}
