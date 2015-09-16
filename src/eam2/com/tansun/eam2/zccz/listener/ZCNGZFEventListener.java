package com.tansun.eam2.zccz.listener;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;

/**
 * 资产处置流程中,拟稿作废事件的监听器
 * @author 刘峻松
 *
 */
public class ZCNGZFEventListener implements EventListener{
	
	private static final long serialVersionUID = -8739536617513075280L;

	public IAssetDealWfBS assetDealWfBS;
	
	private static ApplicationContext ctx;
	
	public ZCNGZFEventListener(){
		System.out.println("_____________________ZCNGZFEventListener Started_________");
		ctx = JbpmServlet.ctx;
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		assetDealWfBS.modifyBodyStateWcz(cldId);
		assetDealWfBS.realseZcczBianhao(cldId);
		System.out.println("_____________________ZCNGZFEventListener Finished_________");
	}
	
}
