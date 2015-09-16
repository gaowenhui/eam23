package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.ZcczWfBS;

/**
 * 会议拟稿提交监听器
 * @author 赵贤义
 *
 */
public class HYNGTJEventListener implements EventListener{
	
	private ZcczWfBS wfBS;
	
	public static ApplicationContext ctx;

	public HYNGTJEventListener(){
		System.out.println("==============================HYNGTJEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(ZcczWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String hyId = (String)arg0.getVariable("headId");
//		wfBS.setHyzt_SHZ(hyId);
//		wfBS.setXmzt_SHZ(hyId);
//		wfBS.updateXmZt(hyId);
		System.out.println("================================HYNGTJEventListener Finished_________");
	}
	
}
