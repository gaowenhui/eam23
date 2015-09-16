package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;

/**
 * 实体整体处置、实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义 
 *
 */
public class STLCZFEventListener implements EventListener{
	
	private CzStcztzWfBS wfBS;
	
	public static ApplicationContext ctx;

	public STLCZFEventListener(){
		System.out.println("========================STLCZFEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		wfBS.updateStatuForDropStztcz(cldId);
		wfBS.releaseStztczBianhao(cldId);
		System.out.println("===================STLCZFEventListener Finished_________");
	}
	
}
