package com.tansun.eam2.common.workflow.counterSign.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.opensymphony.xwork2.interceptor.*;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.tansun.eam2.common.workflow.counterSign.service.ETCounterSignBS;
import com.tansun.rdp4j.workflow.common.vo.WorkflowVO;
public class CounterSignInterceptor extends MethodFilterInterceptor{
	@Autowired
	ETCounterSignBS eTCounterSignBS;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String piId = (String)request.getAttribute("piId");
		List unfinishedList = eTCounterSignBS.findCounterSignUnfinished(piId);
		request.setAttribute("unfinishedList", unfinishedList);
		return arg0.invoke();
	}
}
