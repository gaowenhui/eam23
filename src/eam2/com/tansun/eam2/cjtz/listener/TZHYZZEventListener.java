package com.tansun.eam2.cjtz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;

/**
 * @author 赵贤义 
 *
 */
public class TZHYZZEventListener implements EventListener{
	
	private CzStcztzWfBS wfBS;
	
	public static ApplicationContext ctx;

	public TZHYZZEventListener(){
		System.out.println("=======================AYHYZZEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		wfBS.updateXmxxToWsh(cldId);
		System.out.println("========================AYHYZZEventListener Finished_________");
	}
	
}
