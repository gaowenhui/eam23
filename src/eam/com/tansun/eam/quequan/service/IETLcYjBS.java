package com.tansun.eam.quequan.service;

import java.util.List;

import com.tansun.eam.quequan.model.ETCldBO;
import com.tansun.eam.quequan.model.ETLcYjBO;
import com.tansun.rdp4j.workflow.common.model.PTBizData;

public interface  IETLcYjBS {

	public void create(ETLcYjBO entity) ;

	public void save(ETLcYjBO entity);

	public ETLcYjBO getETLcYjBObyId(Long tid);

	public void saveLcYjAndBiz(PTBizData bizData, ETLcYjBO etcld);

	public List<ETLcYjBO> listLcYj(Long cldbh,String type);
}
