package com.tansun.eam2.zyzc.workflow.buy.action;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.zccz.service.CzStcztzWfBS;


public class CjtzWorkflowAction extends CommonWorkflowAction{
	
	@Autowired
	public CzStcztzWfBS stwfBS;

	public String draftCommit(){
		String result = super.draftCommit();
		if(StringUtils.equals("拟稿",this.todo.getTaskName())){
			stwfBS.modifyStztczStateSpz(this.todo.getProcInstId(), this.todo.getHeadId());  //更新表头
//			stwfBS.uadateStJbxxStatuInCld(this.todo.getHeadId());  //更新表体
		}
		return result;
	}
	
	/**
	 * 秘书处综合处理的下一环节，转到办理部门综合处理
	 * @return
	 */
	public String msczhclTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "msczhclTodoResult";
	}

	/**
	 * 办理部门综合处理的下一环节，转到秘书处综合处理
	 * @return
	 */
	public String blbmzhclTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "blbmzhclTodoResult";
	}

	/**
	 * 秘书处综合处理的已办
	 * @return
	 */
	public String msczhclDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "msczhclDidResult";
	}

	/**
	 * 办理部门综合处理的已办
	 * @return
	 */
	public String blbmzhclDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "blbmzhclDidResult";
	}
	
	/**
	 * 秘书处综合处理的提交
	 * @return
	 */
	public String msczhclCommit(){
		this.saveTodo();
		this.workflowBS.completeTask(
			this.taskId,
			this.outCome,
			this.nextTodoUrl,this.didUrl
		);
		this.request.setAttribute("subSystem", "");
		return "completeTaskResult";
	}

	/**
	 * 项目受理的下一环节，转到会议组织
	 * @return
	 */
	public String xmslTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "xmslTodoResult";
	}

	/**
	 * 项目受理的已办
	 * @return
	 */
	public String xmslDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "xmslDidResult";
	}

	/**
	 * 会议组织的已办
	 * @return
	 */
	public String hyzzDidResult(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzDidResult";
	}

	/**
	 * 会议组织的下一环节，转到上会
	 * @return
	 */
	public String hyzzTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hyzzTodoResult";
	}
	
	public String hzspyjTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hzspyjTodoResult";
	}
	
	public String hzspyjDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "hzspyjDidResult";
	}
}
