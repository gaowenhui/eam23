package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.ZcczWfBS;

/**
 * 会议主持人审批提交监听器
 * @author 赵贤义
 *
 */
public class HYYJHZEventListener implements EventListener{
	
	private ZcczWfBS wfBS;
	
	public static ApplicationContext ctx;

	public HYYJHZEventListener(){
		System.out.println("==============================HYHYAPEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(ZcczWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String hyId = (String)arg0.getVariable("headId");
		wfBS.setHyzt_HYJYZLZ(hyId);
		System.out.println("================================HYHYAPEventListener Finished_________");
	}
	
}
