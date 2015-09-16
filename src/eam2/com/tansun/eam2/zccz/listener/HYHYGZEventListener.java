package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.ZcczWfBS;

/**
 * 会议跟踪提交监听器
 * @author 赵贤义
 *
 */
public class HYHYGZEventListener implements EventListener{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7243242695914860672L;

	private ZcczWfBS wfBS;
	
	public static ApplicationContext ctx;

	public HYHYGZEventListener(){
		System.out.println("==============================HYHYGZEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(ZcczWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String hyId = (String)arg0.getVariable("headId");
		wfBS.setHyzt_SHWB(hyId);
		wfBS.setXmzt_SHWB(hyId);
		wfBS.spwyDidToEnd(hyId);//审批委员已办变办结
		System.out.println("================================HYHYGZEventListener Finished_________");
	}
	
}
