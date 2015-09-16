package com.tansun.eam.quequan.ucc;

import java.util.List;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.rdp4j.workflow.common.model.PTBizData;


public interface IETLcYjUCC {
	
	public void create(ETLcYjBO etlcyj);
	public void save(ETLcYjBO etlcyj);
	public ETLcYjBO getETLcYjBObyId(Long tid);
	public void list();
	public void saveLcYjAndBiz(PTBizData bizData, ETLcYjBO etlcyj);
	public List<ETLcYjBO> listLcYj(Long cldbh,String type);
}
