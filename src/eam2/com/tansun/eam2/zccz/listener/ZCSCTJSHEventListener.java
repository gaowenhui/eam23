package com.tansun.eam2.zccz.listener;

import org.apache.commons.lang.StringUtils;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;

/**
 * 资产处置流程中,合规审查提交上会中事件的监听器
 * @author 刘贝贝
 *
 */
public class ZCSCTJSHEventListener implements EventListener{
	
	private static final long serialVersionUID = 3764411107934861680L;
	public IAssetDealWfBS assetDealWfBS;
	private static ApplicationContext ctx;
	
	public ZCSCTJSHEventListener(){
		System.out.println("_____________________ZCNGTJEventListner Started_________");
		ctx = JbpmServlet.ctx;
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		assetDealWfBS.updateXmxxLsbState(cldId); 
		System.out.println("_____________________ZCNGTJEventListner Finished_________");
	}
	
}
