package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;

/**
 * 资产处置流程中,项目受理事件的监听器
 * @author 刘峻松
 *
 */
public class ZCXMSLEventListener implements EventListener{

	private static final long serialVersionUID = -1936714051518948484L;

	public IAssetDealWfBS assetDealWfBS;
	private static ApplicationContext ctx;
	
	public ZCXMSLEventListener(){
		System.out.println("_____________________ZCXMSLEventListener Started_________");
		ctx = JbpmServlet.ctx;
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
		
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		String currentUserId = (String)arg0.getVariable("currentUserId");
		assetDealWfBS.addCheckCount(cldId);
		assetDealWfBS.zcczMessageToAllSpwy(cldId, Long.parseLong(currentUserId));
		System.out.println("_____________________ZCXMSLEventListener Finished_________");
	}
	
}
