package com.tansun.eam2.zccz.listener;

import org.apache.commons.lang.StringUtils;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;

/**
 * 实体人员安置流程中,拟稿提交事件的监听器
 * @author 赵贤义 
 *
 */
public class AYHGSCEventListener implements EventListener{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6784388426040852345L;
	private CzStcztzWfBS wfBS;
	private ICommonOpinionUcc opinionUcc;
	private WorkflowUtil workflowutil;		//工作流工具类
	private IAssetDealWfBS assetDealWfBS;
	private PTMessageBS messageBS;	
	private ZcczWfBS zcczWfBS;
	
	public static ApplicationContext ctx;

	public AYHGSCEventListener(){
		System.out.println("===============AYHGSCEventListener Started_________");
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
		opinionUcc = ctx.getBean(ICommonOpinionUcc.class);
		this.workflowutil = (WorkflowUtil) ctx.getBean("workflowUtil");
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
		messageBS = (PTMessageBS)ctx.getBean("PTMessageBS");
		zcczWfBS = ctx.getBean(ZcczWfBS.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		wfBS.copyPropertieToXmxxLsb(cldId);
		//发送消息给审批委员
		//发送消息给审批委员
		IUser tuser = UserThreadLocal.get();
		long sender = tuser.getUserTid() ;
		String msg = "请查阅处置项目材料";
		String piId = arg0.getId();
		String taskId = this.workflowutil.findLastHisTask(piId).getId();
		assetDealWfBS.sendMsg(sender, msg,cldId,"/eam2/zcczperWorkflow/zcczperWorkflow_did.do","taskId="+taskId+"&headId="+cldId,messageBS);		
		System.out.println("=================AYHGSCEventListener Finished_________");
		
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
		opinionUcc.cloneOpinionByBdId(cldId, cldId, oldTypes, new Integer(CommonGlobal.OPINION_YJYLX_CHECK));		
	}
	
}
