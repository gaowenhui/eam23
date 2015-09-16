package com.tansun.eam.quequan.service;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.rdp4j.workflow.common.model.PTBizData;

public interface  IETCldBS {

	public void create(ETCldBO entity) ;

	public void save(ETCldBO entity);

	public ETCldBO getETCldBObyId(Long tid);

}
