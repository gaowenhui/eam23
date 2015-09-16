package com.tansun.eam2.cjtz.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;

/**
 * 实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义 
 *
 */
public class TZENDEventListener implements EventListener{
	private Log loger = LogFactory.getLog(this.getClass());
	/**
	 * 
	 */
	private static final long serialVersionUID = -9118726937329326119L;

	private CzStcztzWfBS wfBS;
	
	public static ApplicationContext ctx;

	public TZENDEventListener(){
		if(loger.isDebugEnabled()){
			loger.debug("=======================AYENDEventListener Started_________");
		}
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String xmId = (String)arg0.getVariable("xmId");
		wfBS.cloneXmLsbToXm(xmId);//拷贝lsb的信息到项目信息表里面做跟踪
		if(loger.isDebugEnabled()){
			loger.debug("=======================AYENDEventListener Finished_________");
		}
	}
	
}
