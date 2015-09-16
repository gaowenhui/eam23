package com.tansun.eam.utils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class InitServlet extends HttpServlet{
	public void init() throws ServletException {
		System.out.println("InitServlet");
		super.init();
//		HttpServletRequest request = ServletActionContext.getRequest (); 
//		Session.setSession(request.getSession());
	}
}
