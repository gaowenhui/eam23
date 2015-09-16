package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;

/**
 * 资产处置流程中,汇总审批意见的事件监听
 * @author 刘峻松
 *
 */
public class ZCHZSPYJEventListener implements EventListener{
	
	private static final long serialVersionUID = -4017241669533459436L;

	public IAssetDealWfBS assetDealWfBS;
	private static ApplicationContext ctx;
	
	public ZCHZSPYJEventListener(){
		System.out.println("_____________________ZCHZSPYJEventListener Started_________");
		ctx = JbpmServlet.ctx;
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		assetDealWfBS.modifyBodyStateYsp(cldId);
		assetDealWfBS.cloneXmLsbToXm(cldId);
		System.out.println("_____________________ZCHZSPYJEventListener Finished_________");
	}
	
}
