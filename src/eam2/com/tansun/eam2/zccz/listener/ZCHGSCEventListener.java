package com.tansun.eam2.zccz.listener;

import org.apache.commons.lang.StringUtils;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTAbandonBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 * 资产处置流程中,项目受理事件的监听器
 * @author 刘峻松
 *
 */
public class ZCHGSCEventListener implements EventListener{
	
	private static final long serialVersionUID = 118584154289054120L;

	public IAssetDealWfBS assetDealWfBS;
	private ZcczWfBS zcczWfBS;	
	private static ApplicationContext ctx;
	private PTMessageBS messageBS;
	private ICommonOpinionUcc commonOpinionUcc;
	
	WorkflowUtil workflowutil;		//工作流工具类
	PTTodoBS todoBS;				//任务待办BS
	PTDidBS didBS;					//
	PTAbandonBS abandonBS;			//
	public ZCHGSCEventListener(){
		System.out.println("_____________________ZCHGSCEventListener Started_________");
		ctx = JbpmServlet.ctx;
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
		commonOpinionUcc = ctx.getBean(ICommonOpinionUcc.class);
		messageBS = (PTMessageBS)ctx.getBean("PTMessageBS");
		zcczWfBS = ctx.getBean(ZcczWfBS.class);
		this.workflowutil = (WorkflowUtil) ctx.getBean("workflowUtil");
		this.todoBS = (PTTodoBS)ctx.getBean("PTTodoBS");
		this.didBS = (PTDidBS)ctx.getBean("PTDidBS");
		this.abandonBS = (PTAbandonBS)ctx.getBean("PTAbandonBS");
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		assetDealWfBS.copyPropertieToXmxxLsb(cldId);
		IUser tuser = UserThreadLocal.get();
		long sender = tuser.getUserTid() ;
		String msg = "请查阅处置项目材料";
		String piId = arg0.getId();
		String taskId = this.workflowutil.findLastHisTask(piId).getId();
		assetDealWfBS.sendMsg(sender, msg,cldId,"/eam2/zcczassetWorkflow/zcczassetWorkflow_did.do","taskId="+taskId+"&headId="+cldId,messageBS);
		//合规审查设置最终附件
		String strsel = (String)arg0.getVariable("strsel");
		if(StringUtils.isNotEmpty(strsel)){
			if (strsel.startsWith(",")) {
				strsel = strsel.substring(1, strsel.length());
			}
			String strId[] = strsel.split(",");
			//设置合规审查最终附件
			for(String temp:strId){
				zcczWfBS.setZzfj(temp);
			}
		}	
		//办理单提交最终意见，最终意见+审查意见拷贝到处理单上的合规审查意见域中 Updated by liubeibei.2011/3/12.
		Integer[] oldTypes = new Integer[]{
				new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_ZZYJ),
				new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY)
			};
		commonOpinionUcc.cloneOpinionByBdId(cldId, cldId, oldTypes, new Integer(CommonGlobal.OPINION_YJYLX_CHECK));		
		
		
		System.out.println("_____________________ZCHGSCEventListener Finished_________");
	}
	
}
