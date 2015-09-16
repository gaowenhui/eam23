package com.tansun.eam2.zccz.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.IDealTrace1HeadBS;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

/**
 * 处置跟踪结案作废监听
 * @author 
 *
 */
public class ZcczCzgzyjaListener implements EventListener{
	private Log loger = LogFactory.getLog(this.getClass());
	/**
	 * 
	 */
	private static final long serialVersionUID = -9118726937329326119L;

	private ICodeGenerator bs;
	
	public static ApplicationContext ctx;

	public ZcczCzgzyjaListener(){
		if(loger.isDebugEnabled()){
			loger.debug("=======================AYENDEventListener Started_________");
		}
		ctx = JbpmServlet.ctx;
		bs = ctx.getBean(ICodeGenerator.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String codeType = (String)arg0.getVariable("codeType");
		String generatedCode = (String)arg0.getVariable("generatedCode");
		String deptid = (String)arg0.getVariable("deptid");
		if(!(generatedCode==null||"".equals(generatedCode)||"null".equals(generatedCode))){
			bs.disableCurrentCode(codeType, generatedCode, deptid);
		}
		if(loger.isDebugEnabled()){
			loger.debug("=======================AYENDEventListener Finished_________");
		}
	}
	
}
