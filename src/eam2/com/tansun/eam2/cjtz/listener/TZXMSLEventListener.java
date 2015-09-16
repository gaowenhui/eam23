package com.tansun.eam2.cjtz.listener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;

/**
 * 实体整体处置、实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义 
 *
 */
public class TZXMSLEventListener implements EventListener{
	protected Log logger = LogFactory.getLog(this.getClass());
	private CzStcztzWfBS wfBS;
	private WorkflowUtil workflowutil;		//工作流工具类
	private IAssetDealWfBS assetDealWfBS;
	private PTMessageBS messageBS;
	
	public static ApplicationContext ctx;

	public TZXMSLEventListener(){
		if(logger.isDebugEnabled()){
			logger.debug("_____________________STNGTJEventListener Started_________");
		}		
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
		this.workflowutil = (WorkflowUtil) ctx.getBean("workflowUtil");
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
		messageBS = (PTMessageBS)ctx.getBean("PTMessageBS");		
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		wfBS.copyPropertieToXmxxLsb(cldId);
		//发送消息给审批委员
		IUser tuser = UserThreadLocal.get();
		long sender = tuser.getUserTid() ;
		String msg = "请查阅处置项目材料";
		String piId = arg0.getId();
		String taskId = this.workflowutil.findLastHisTask(piId).getId();
		assetDealWfBS.sendMsg(sender, msg,cldId,"/eam2/cjtzWorkflow/cjtzspWorkflow_did.do","taskId="+taskId+"&headId="+cldId,messageBS);		
		if(logger.isDebugEnabled()){
			logger.debug("_____________________STNGTJEventListener Started_________");
		}	
	}
	
}
