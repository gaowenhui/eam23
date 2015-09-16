package com.tansun.eam2.common.web.interceptor;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

public class EncodingInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2873519370491778227L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub

		ActionContext actionContext = arg0.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		/**
		 * 此方法体对GET 和 POST方法均可
		 */
//		if (request.getMethod().compareToIgnoreCase("post") >= 0) {
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
//		} else {
//			Map map = request.getParameterMap();
//			Iterator iter = request.getParameterMap().keySet().iterator();
//			while (iter.hasNext()) {
//				String parames = (String) iter.next();
//				String value = (String) map.get(parames);
//				try {
//					value = new String(value.getBytes("iso8859-1"), "UTF-8");//此处UTF-8与页面编码一样
//					map.put(parames, value);
//				} catch (UnsupportedEncodingException e) {
//					e.printStackTrace();
//				}
//			}
//		}
		return arg0.invoke();
	}
}
