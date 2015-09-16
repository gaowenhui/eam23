package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;

/**
 * 实体整体处置、实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义
 *
 */
@Transactional
public class STXMSLEventListener implements EventListener{
	
	private CzStcztzWfBS wfBS;
	private ZcczWfBS zcczBS;
	
	public static ApplicationContext ctx;

	public STXMSLEventListener(){
		System.out.println("_____________________STNGTJEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
		zcczBS = ctx.getBean(ZcczWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		String currentUserId = (String)arg0.getVariable("currentUserId");
		wfBS.addCheckCount(cldId);
		wfBS.updateBlDate(cldId);
		wfBS.stztczMessageToAllSpwy(cldId, Long.parseLong(currentUserId));
		System.out.println("_____________________STNGTJEventListener Finished_________");
	}
	
}
