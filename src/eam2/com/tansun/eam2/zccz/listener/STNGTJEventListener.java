package com.tansun.eam2.zccz.listener;

import java.util.List;

import org.jbpm.api.ExecutionService;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.jiekou.erp.action.EERCardAddAction;
import com.tansun.eam2.zccz.service.*;

/**
 * 实体整体处置、实体人员安置流程中,拟稿提交事件的监听器
 * @author 刘峻松 
 *
 */
public class STNGTJEventListener implements EventListener{
	
	private CzStcztzWfBS wfBS;
	
	public static ApplicationContext ctx;

	public STNGTJEventListener(){
		System.out.println("_____________________STNGTJEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		wfBS.modifyStztczStateSpz(cldId);  //更新表头
		wfBS.uadateStJbxxStatuInCld(cldId);  //更新表体
		System.out.println("_____________________STNGTJEventListener Finished_________");
	}
	
}
