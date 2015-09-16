package com.tansun.eam2.stgl.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;

import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.util.ucc.impl.CodeGenerator;
import com.tansun.eam2.common.util.SpringContextHelper;

/**
 * 处理单重作废环节编号回收的监听器
 * @author 
 *
 */
public class ReleaseZzjzNumEventListener implements EventListener{
	
	protected Log logger = LogFactory.getLog(this.getClass());
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7184704191418901683L;

	
	
	ICodeGenerator codeUCC;

	public ReleaseZzjzNumEventListener(){
		if(logger.isDebugEnabled()){
			logger.debug("ReleaseZzjzNumEventListener Started_________");
		}		
		
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		codeUCC = (ICodeGenerator)SpringContextHelper.getBean(ICodeGenerator.class);
		String codeType = (String)arg0.getVariable("codeType");
		String generatedCode = (String)arg0.getVariable("generatedCode");
		if(generatedCode != null && generatedCode.length() > 0){
			String deptid = (String)arg0.getVariable("deptid");
			codeUCC.disableCurrentCode(codeType, generatedCode, deptid);
		}
		if(logger.isDebugEnabled()){
			logger.debug("ReleaseZzjzNumEventListener Started_________");
		}
	}
	
}
