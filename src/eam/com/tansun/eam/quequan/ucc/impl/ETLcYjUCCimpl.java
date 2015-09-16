package com.tansun.eam.quequan.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.eam.quequan.service.IETLcYjBS;
import com.tansun.eam.quequan.ucc.IETLcYjUCC;
import com.tansun.rdp4j.workflow.common.model.PTBizData;

@Service
public class ETLcYjUCCimpl implements IETLcYjUCC {

	@Autowired
	public IETLcYjBS etlcyjBSimpl;

	public void create(ETLcYjBO etcld) {
		etlcyjBSimpl.create(etcld);
	}

	public void save(ETLcYjBO etcld) {
		etlcyjBSimpl.save(etcld);
	}

	public void list() {
	}

	public ETLcYjBO getETLcYjBObyId(Long tid) {

		return etlcyjBSimpl.getETLcYjBObyId(tid);
	}

	public void saveLcYjAndBiz(PTBizData bizData, ETLcYjBO etlcyj) {

		etlcyjBSimpl.save(etlcyj);
	}

	public List<ETLcYjBO> listLcYj(Long cldbh,String type) {
		// TODO Auto-generated method stub
		return etlcyjBSimpl.listLcYj(cldbh,type);
	}

}
