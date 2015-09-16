package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

public class ZcczshanghuiWorkflow extends CommonWorkflowAction {
	
	@Autowired
	public ZcczWfBS wfBS;
	@Autowired
	public PTTodoBS todoBS;
	
	public String renYuanOutCome = "";
	public String renYuanNextTodoUrl = "";
	public String renYuanDidUrl = "";
	public String ziChanOutCome = "";
	public String ziChanNextTodoUrl = "";
	public String ziChanDidUrl = "";
	public String shiTiOutCome = "";
	public String shiTiNextTodoUrl = "";
	public String shiTiDidUrl = "";
	public String cjtzOutCome = "";
	public String cjtzNextTodoUrl = "";
	public String cjtzDidUrl = "";
	public String zcrQrOutCome = "";
	public String zcrQrNextTodoUrl = "";
	public String zcrQrDidUrl = "";
	public String zcrSpOutCome = "";
	public String zcrSpNextTodoUrl = "";
	public String zcrSpDidUrl = "";	
	private CzHyxx hyxx;

	public CzHyxx getHyxx() {
		return hyxx;
	}

	public void setHyxx(CzHyxx hyxx) {
		this.hyxx = hyxx;
	}

	public String getCjtzOutCome() {
		return cjtzOutCome;
	}

	public void setCjtzOutCome(String cjtzOutCome) {
		this.cjtzOutCome = cjtzOutCome;
	}

	public String getCjtzNextTodoUrl() {
		return cjtzNextTodoUrl;
	}

	public void setCjtzNextTodoUrl(String cjtzNextTodoUrl) {
		this.cjtzNextTodoUrl = cjtzNextTodoUrl;
	}

	public String getCjtzDidUrl() {
		return cjtzDidUrl;
	}

	public void setCjtzDidUrl(String cjtzDidUrl) {
		this.cjtzDidUrl = cjtzDidUrl;
	}

	public String getZcrSpOutCome() {
		return zcrSpOutCome;
	}

	public void setZcrSpOutCome(String zcrSpOutCome) {
		this.zcrSpOutCome = zcrSpOutCome;
	}

	public String getZcrSpNextTodoUrl() {
		return zcrSpNextTodoUrl;
	}

	public void setZcrSpNextTodoUrl(String zcrSpNextTodoUrl) {
		this.zcrSpNextTodoUrl = zcrSpNextTodoUrl;
	}

	public String getZcrSpDidUrl() {
		return zcrSpDidUrl;
	}

	public void setZcrSpDidUrl(String zcrSpDidUrl) {
		this.zcrSpDidUrl = zcrSpDidUrl;
	}

	public String getZcrQrOutCome() {
		return zcrQrOutCome;
	}

	public void setZcrQrOutCome(String zcrQrOutCome) {
		this.zcrQrOutCome = zcrQrOutCome;
	}

	public String getZcrQrNextTodoUrl() {
		return zcrQrNextTodoUrl;
	}

	public void setZcrQrNextTodoUrl(String zcrQrNextTodoUrl) {
		this.zcrQrNextTodoUrl = zcrQrNextTodoUrl;
	}

	public String getZcrQrDidUrl() {
		return zcrQrDidUrl;
	}

	public void setZcrQrDidUrl(String zcrQrDidUrl) {
		this.zcrQrDidUrl = zcrQrDidUrl;
	}

	public String draftCommit(){
		String result = super.draftCommit();
		if(StringUtils.equals("会议组织",this.todo.getTaskName())){
			wfBS.updateHyStatuAtDraftSubmit(this.todo.getHeadId());//跟新会议状态，会议下项目状态
			wfBS.hyDraftSubmit(this.todo.getProcInstId(), this.todo.getHeadId());//跟新流程实例到会议处理单里面
			wfBS.setHyzt_SHZ(this.todo.getHeadId());
			wfBS.setXmzt_SHZ(this.todo.getHeadId());
		}
		return result;
	}
	
	/**
	 * 主持人确认
	 * @return
	 */
	public String commitTozcrqr(){
		PTTodo todo = this.todoBS.findPTTodoByTaskId(this.taskId);
		String hyId = todo.getHeadId();
		CzHyxx hy = wfBS.getHyById(hyId);
		this.workflowBS.completeTask(
				this.taskId,
				zcrQrOutCome,
				Long.parseLong(hy.getZcrbmid()),
				Long.parseLong(hy.getSpzcr()),
				zcrQrNextTodoUrl,
				zcrQrDidUrl
			);
		return "completeTaskResult";
	}
	
	/**
	 * 主持人审批
	 * @return
	 */
	public String commitTozcrsp(){
		PTTodo todo = this.todoBS.findPTTodoByTaskId(this.taskId);
		String hyId = todo.getHeadId();
		CzHyxx hy = wfBS.getHyById(hyId);
		this.workflowBS.completeTask(
				this.taskId,
				zcrSpOutCome,
				Long.parseLong(hy.getZcrbmid()),
				Long.parseLong(hy.getSpzcr()),
				zcrSpNextTodoUrl,
				zcrSpDidUrl
			);
		return "completeTaskResult";
	}
	
	public String commitHuiZongYiJian(){
		try{
		PTTodo todo = this.todoBS.findPTTodoByTaskId(this.taskId);
		String hyId = todo.getHeadId();
		Map<CzXmxxLsb,CzStcztz> map = this.wfBS.getCzStcztzListInHy(hyId);
		Map<CzXmxxLsb,CzCztzfaXx> map2 = this.wfBS.getCzCztzfaXxListInHy(hyId);
		for(CzXmxxLsb key:map.keySet()){
			if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY_PERSON, key.getFenlei())){
				CzStcztz value = map.get(key);
				String xmTaskId = this.workflowutil.getTodoTaskIdByPiId(value.getLcId());
				this.workflowBS.completeTask(
					xmTaskId,
					renYuanOutCome,
					Long.parseLong(key.getYjhzrbmid()),
					Long.parseLong(key.getYjhzr()),
					renYuanNextTodoUrl,
					renYuanDidUrl
				);
			}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_ENTITY, key.getFenlei())){
				CzStcztz value = map.get(key);
				String xmTaskId = this.workflowutil.getTodoTaskIdByPiId(value.getLcId());
				this.workflowBS.completeTask(
						xmTaskId,
						shiTiOutCome, 
						Long.parseLong(key.getYjhzrbmid()), 
						Long.parseLong(key.getYjhzr()), 
						shiTiNextTodoUrl, 
						shiTiDidUrl
				);
			}else if(StringUtils.equals(ZcczCommon.ITEM_FOR_INVESTMENT, key.getFenlei())){
				CzStcztz value = map.get(key);
				String xmTaskId = this.workflowutil.getTodoTaskIdByPiId(value.getLcId());
				this.workflowBS.completeTask(
						xmTaskId,
						cjtzOutCome, 
						Long.parseLong(key.getYjhzrbmid()), 
						Long.parseLong(key.getYjhzr()), 
						cjtzNextTodoUrl,
						cjtzDidUrl
				);
			}
		}
		for(CzXmxxLsb key : map2.keySet()){
			CzCztzfaXx value = map2.get(key);
			String xmTaskId = this.workflowutil.getTodoTaskIdByPiId(value.getLcid());
			this.workflowBS.completeTask(
					xmTaskId,
					ziChanOutCome,
					Long.parseLong(key.getYjhzrbmid()),
					Long.parseLong(key.getYjhzr()),
					ziChanNextTodoUrl,
					ziChanDidUrl
			);
		}
		this.assignId = hyxx.getHyjyzlrbmid() + "," + hyxx.getHyjyzlr();
		}catch(Exception e){
			e.printStackTrace();
		}
		return super.completeTask();
	}
	
	public String zcrspTodo(){
		this.todo();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "zcrspTodoResult";
	}
	
	public String zcrspDid(){
		this.did();
		String headId = (String)request.getAttribute("headId");
		request.setAttribute("headId", headId);
		return "zcrspDidResult";
	}

	public String getRenYuanOutCome() {
		return renYuanOutCome;
	}

	public void setRenYuanOutCome(String renYuanOutCome) {
		this.renYuanOutCome = renYuanOutCome;
	}

	public String getRenYuanNextTodoUrl() {
		return renYuanNextTodoUrl;
	}

	public void setRenYuanNextTodoUrl(String renYuanNextTodoUrl) {
		this.renYuanNextTodoUrl = renYuanNextTodoUrl;
	}

	public String getRenYuanDidUrl() {
		return renYuanDidUrl;
	}

	public void setRenYuanDidUrl(String renYuanDidUrl) {
		this.renYuanDidUrl = renYuanDidUrl;
	}

	public String getZiChanOutCome() {
		return ziChanOutCome;
	}

	public void setZiChanOutCome(String ziChanOutCome) {
		this.ziChanOutCome = ziChanOutCome;
	}

	public String getZiChanNextTodoUrl() {
		return ziChanNextTodoUrl;
	}

	public void setZiChanNextTodoUrl(String ziChanNextTodoUrl) {
		this.ziChanNextTodoUrl = ziChanNextTodoUrl;
	}

	public String getZiChanDidUrl() {
		return ziChanDidUrl;
	}

	public void setZiChanDidUrl(String ziChanDidUrl) {
		this.ziChanDidUrl = ziChanDidUrl;
	}

	public String getShiTiOutCome() {
		return shiTiOutCome;
	}

	public void setShiTiOutCome(String shiTiOutCome) {
		this.shiTiOutCome = shiTiOutCome;
	}

	public String getShiTiNextTodoUrl() {
		return shiTiNextTodoUrl;
	}

	public void setShiTiNextTodoUrl(String shiTiNextTodoUrl) {
		this.shiTiNextTodoUrl = shiTiNextTodoUrl;
	}

	public String getShiTiDidUrl() {
		return shiTiDidUrl;
	}

	public void setShiTiDidUrl(String shiTiDidUrl) {
		this.shiTiDidUrl = shiTiDidUrl;
	}
	
}
