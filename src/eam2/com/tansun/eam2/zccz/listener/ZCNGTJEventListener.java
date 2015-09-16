package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;

/**
 * 资产处置流程中,拟稿提交事件的监听器
 * @author 刘峻松 
 *
 */
public class ZCNGTJEventListener implements EventListener{
	
	private static final long serialVersionUID = 3764411107934861680L;

	public IAssetDealWfBS assetDealWfBS;
	private static ApplicationContext ctx;
	
	public ZCNGTJEventListener(){
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
		//assetDealWfBS.modifyHeadStateSpz(cldId);  //更新表头
		assetDealWfBS.modifyBodyStateSpz(cldId);  //更新表体
		System.out.println("_____________________ZCNGTJEventListner Finished_________");
	}
	
}
