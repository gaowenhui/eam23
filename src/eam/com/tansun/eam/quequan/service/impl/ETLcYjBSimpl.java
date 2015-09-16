package com.tansun.eam.quequan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.eam.quequan.service.IETLcYjBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTBizData;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;


@Service
public class ETLcYjBSimpl  implements IETLcYjBS {
	@Autowired
	PublicDao publicDao;
	@Autowired
	WorkflowUtil workflowutil;
	
	public void create(ETLcYjBO entity) {
		publicDao.save(entity);
	}

	public void save(ETLcYjBO entity) {
		publicDao.save(entity);
	}
	
	public ETLcYjBO getETLcYjBObyId(Long tid) {
		List list =new  ArrayList();
		list.add(tid);
		return (ETLcYjBO) publicDao.findSingleResult("from ETCldBO o where o.tid=?",list );
	}

	
	public void saveLcYjAndBiz(PTBizData bizData, ETLcYjBO etlcyj) {
		publicDao.save(etlcyj);
	}

	public List<ETLcYjBO> listLcYj(Long cldbh,String type) {
		String preparSQL="from ETLcYjBO o where o.cldbh=? and o.yjlx=?";
		List params=new ArrayList();
		params.add(cldbh);
		params.add(type);
		return  (List<ETLcYjBO>) publicDao.find(preparSQL, params);
	}


}