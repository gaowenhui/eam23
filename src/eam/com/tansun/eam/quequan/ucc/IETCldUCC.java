package com.tansun.eam.quequan.ucc;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.rdp4j.workflow.common.model.PTBizData;


public interface IETCldUCC {
	
	public void create(ETCldBO etcld);
	public void save(ETCldBO etcld);
	public ETCldBO getETCldBObyId(Long tid);
	public void list();
	
	public void draftsub(ETCldBO etcld,PTBizData  bizData ,ETLcYjBO etlcyj);
	public void editsub(ETCldBO etcld,PTBizData  bizData ,ETLcYjBO etlcyj);
	
	public void completeTask(ETCldBO etcld,ETLcYjBO etlcyj,String taskId, String outCome, String userid, String content);
}
