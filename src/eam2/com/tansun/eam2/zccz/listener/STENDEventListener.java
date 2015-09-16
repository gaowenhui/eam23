package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;

/**
 * 实体整体处置、实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义
 *
 */
public class STENDEventListener implements EventListener{
	
	private CzStcztzWfBS wfBS;
	
	public static ApplicationContext ctx;

	public STENDEventListener(){
		System.out.println("_____________________STNGTJEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String xmId = (String)arg0.getVariable("xmId");
		String cldId = (String)arg0.getVariable("headId");
		wfBS.cloneXmLsbToXm(xmId);//拷贝lsb的信息到项目信息表里面做跟踪
		wfBS.modifyStztczStateYsp(cldId);
		wfBS.updateDebtLsbCldZt(cldId, "2");
		System.out.println("_____________________STNGTJEventListener Finished_________");
	}
	
}
