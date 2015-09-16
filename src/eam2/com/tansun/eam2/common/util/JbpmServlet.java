package com.tansun.eam2.common.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.rdp4j.workflow.common.util.AbandonEventListener;
import com.tansun.rdp4j.workflow.common.util.EndEventListener;

public class JbpmServlet extends HttpServlet{
	/**
	 * Logger for this class
	 */
	private static final Log logger = LogFactory.getLog(JbpmServlet.class);

	/**
	 * 
	 */
	private static final long serialVersionUID = -9113808323995891617L;
	
	public static ApplicationContext ctx;

	public void destroy() {
		System.out.println("destroy");
		super.destroy();
	}

	public void init() throws ServletException {
		if (logger.isDebugEnabled()) {
			logger.debug("init() - start");
		}
		ctx = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		AbandonEventListener.ctx = ctx;
		EndEventListener.ctx = ctx;
		super.init();
		if (logger.isDebugEnabled()) {
			logger.debug("init() - end");
		}
	}
}
