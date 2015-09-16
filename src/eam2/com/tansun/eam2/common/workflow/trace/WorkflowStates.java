package com.tansun.eam2.common.workflow.trace;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.workflow.common.model.PTAbandon;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTAbandonBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

@Service
@SuppressWarnings("unchecked")
public class WorkflowStates {
	@Autowired
	private PublicDao publicDao;
	
	@Autowired
	private PTDidBS didbs;
	
	@Autowired
	private PTTodoBS todobs;
	
	@Autowired
	private PTAbandonBS abandonbs;
	
	@Autowired
	private PTEndBS endbs;
	
	public List<PTTodo> getTodo(String piId){
		List<PTTodo> list = (List<PTTodo>)todobs.findUnfinishedTodoListByPiId(piId);
		return list;
	}
	
	public List<PTDid> getDid(String piId){
		List<PTDid> list = didbs.findDidListByPiId(piId);
		return list;
	}
	
	public List<PTDid> getDidHistory(String piId){
		List<PTDid> list = didbs.findAllHisDidListByPiId(piId);
		return list;
	}
	
	public int getUnfinishCounterSign(String piId){
		return todobs.getUnfinishCounterSign(piId);
	}
	
	public int getfinishedCounterSign(String piId){
		return todobs.getfinishedCounterSign(piId);
	}
	
	public PTAbandon getAbandon(String piId){
		PTAbandon ptabandon = abandonbs.findPTAbandonByPiId(piId);
		return ptabandon;
	}
	
	public PTEnd getEnd(String piId){
		PTEnd ptend = endbs.findPTEndByPiId(piId);
		return ptend;
	}
	
	public String getDeptName(Long id){
		List<PTDeptBO> dept = (List<PTDeptBO>) publicDao.find(
				"from PTDeptBO o where o.tid=?", new Long[]{id});
		String deptName = "";
		deptName = (dept != null && dept.size() > 0) ? dept.get(0).getDeptName() : "未知部门";
		return deptName;
	}
	
	public PTDidBS getDidbs() {
		return didbs;
	}

	public void setDidbs(PTDidBS didbs) {
		this.didbs = didbs;
	}

	public PTTodoBS getTodobs() {
		return todobs;
	}

	public void setTodobs(PTTodoBS todobs) {
		this.todobs = todobs;
	}

	public PTAbandonBS getAbandonbs() {
		return abandonbs;
	}

	public void setAbandonbs(PTAbandonBS abandonbs) {
		this.abandonbs = abandonbs;
	}

	public PTEndBS getEndbs() {
		return endbs;
	}

	public void setEndbs(PTEndBS endbs) {
		this.endbs = endbs;
	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	
}
