package com.tansun.eam.quequan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.service.IETCldBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;


@Service
public class ETCldBSimpl  implements IETCldBS {
	@Autowired
	PublicDao publicDao;
	@Autowired
	WorkflowUtil workflowutil;
	
	public void create(ETCldBO entity) {
		publicDao.save(entity);
	}
	public void save(ETCldBO entity) {
		publicDao.saveOrUpdate(entity);
	}
	public ETCldBO getETCldBObyId(Long tid) {
		List list =new  ArrayList();
		list.add(tid);
		return (ETCldBO) publicDao.find("from ETCldBO o where o.tid=?",list).get(0);
	}


}
