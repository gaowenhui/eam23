package com.tansun.eam2.jiekou.erp.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.ucc.IDeptTreeUcc;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 卡片增加（审批增加）ERP获取EAM卡片信息
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Inter_CardAdd  extends HttpServlet {
	
	public Inter_CardAdd() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		StringBuffer erpxml = new StringBuffer();
		char[] readerBuffer = new char[request.getContentLength()];
		BufferedReader bufferedReader = request.getReader();
		int portion = bufferedReader.read(readerBuffer);
		int amount = portion;
		while (amount < readerBuffer.length) {
			portion = bufferedReader.read(readerBuffer, amount, readerBuffer.length - amount);
			amount = amount + portion;
		}
		StringBuffer stringBuffer = new StringBuffer((int) (readerBuffer.length * 1.5));
		for (int index = 0; index < readerBuffer.length; index++) {
			char c = readerBuffer[index];
			stringBuffer.append(c);
		}
		System.out.println("********Inter_CardAdd*****"+ stringBuffer.toString());
		if (stringBuffer.toString().indexOf("<eampk>") > 0 && stringBuffer.toString().indexOf("</eampk>") > 0) {
			String documentstr = Comment_AddSpd.getEamPk(stringBuffer.toString(), "<eampk>", "</eampk>");
			System.out.println("********Inter_CardAdd**lc_cardtempId***"+ documentstr);
			try {
				String sql = "select * from  lc_cardtemp  t where t.id='"+ documentstr + "'";
				
				PublicDao dao = (PublicDao) WebApplicationContextUtils
				.getRequiredWebApplicationContext(
						request.getSession().getServletContext()).getBean(
						"publicDao");
				
				erpxml = new OA_Database().selectdate(sql,dao);
				System.out.println("********Inter_CardAdd**erpxml***"+ erpxml.toString());
				response.setContentType("text/xml;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println(erpxml.toString());
				out.flush();
				out.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} 
	}

	public void init() throws ServletException {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print  ("    This is ");
		out.print  (this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
