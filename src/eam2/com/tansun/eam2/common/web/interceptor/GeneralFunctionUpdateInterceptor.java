package com.tansun.eam2.common.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tansun.rdp4j.common.model.orm.PublicDao;

public class GeneralFunctionUpdateInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -2249775682048155748L;
	private static final String BLYJ_UPDATE_DEL = "BLYJ_UPDATE_DEL";
	private static final String FILE_UPDATE_DEL = "FILE_UPDATE_DEL";
	private static final String BIAODANID = "biaodanid";
	private static final String GENERAL_FUNCTION_HAS_UPDATE = "GENERAL_FUNCTION_HAS_UPDATE";
	
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		HttpServletRequest request = (HttpServletRequest) ai.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		String hasSave = "N";
		hasSave = (String)request.getAttribute(GENERAL_FUNCTION_HAS_UPDATE);
		if(hasSave != null && hasSave.length() > 0 && "N".equals(hasSave)){
			String blyj = request.getParameter(BLYJ_UPDATE_DEL);
			String file = request.getParameter(FILE_UPDATE_DEL);
			String biaodanid = request.getParameter(BIAODANID);
			if(biaodanid != null && biaodanid.length() > 0){
				if("Y".equals(blyj)){
					updateSql(request, "update CommonAccording set del=1 where bdid=? ", biaodanid);
				}else if("Y".equals(file)){
					updateSql(request, "update PTAttachment set del=1 where bdid=? ", biaodanid);
				}
				hasSave = "Y";
				request.setAttribute(GENERAL_FUNCTION_HAS_UPDATE, hasSave);
			}
		}
		return ai.invoke();
	}
	
	private void updateSql(HttpServletRequest request, String sql, String biaodanid){
		PublicDao publicDao = (PublicDao) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("publicDao");
		publicDao.updateBySql(sql, new String[]{biaodanid});
	}
}
