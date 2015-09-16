package com.tansun.eam2.common.web.servlet;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.ucc.IIndividualTree;

public class IndividualTreeDataServlet extends HttpServlet implements java.io.Serializable {
	
//	private static Map<String, Individualtree> iTree = new HashMap<String, Individualtree>();
	private static Map<String, String> xmlITree = new HashMap<String, String>();
	
	private static final long serialVersionUID = -2553909200176290956L;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String treetype =  (String)request.getParameter("treetype");
		String nodevalue =  (String)request.getParameter("notevalue");
		IIndividualTree iTreeUcc = (IIndividualTree) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("iTreeUcc");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		start(response.getWriter(), treetype, nodevalue, iTreeUcc);
	}

	public void start(Writer writer, String treetype, String nodevalue, IIndividualTree iTreeUcc) {
		String key =  nodevalue != null ? treetype + nodevalue : treetype;
		String xml = xmlITree.get(key);
		if(xml == null){
			Individualtree result = null;
			if(nodevalue != null){
				result = iTreeUcc.findByTreeType(treetype, nodevalue);
				xml = getDHTreeXML(result);
				xmlITree.put(treetype + nodevalue, xml);
			}else{
				result = iTreeUcc.findByTreeType(treetype);
				xml = getDHTreeXML(result);
				xmlITree.put(treetype, xml);
			}
			
		}
		try {
			if(xml != null && xml.length() > 0){
				writer.write(xml);
			}else{
				writer.write("无数据");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private String getDHTreeXML(Individualtree result) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"0\">").append("\n");
		getItem(sb, result);
//		iTree.put(result.getNodevalue(), result);
		sb.append("</tree>").append("\n");
		return sb.toString();
	}

	private void getItem(StringBuffer sb, Individualtree individual) {
		sb.append("<item text=\"" + individual.getCategoryname() + "\" id=\"" + individual.getNodevalue() +"\" >").append("\n");
		List<Individualtree> leaf = individual.getIndividualtrees();
		if(leaf != null && leaf.size() > 0){
			for (Individualtree ind : leaf) {
				getItem(sb, ind);
			}
		}
		sb.append("</item>").append("\n");
	}
}
