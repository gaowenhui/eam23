package com.tansun.eam2.zqgl.ucc.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.DebtWorklog;
import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.zqgl.service.ICreditorBS;
import com.tansun.eam2.zqgl.ucc.ICreditorService;
import com.tansun.eam2.zqgl.vo.CreditorQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class CreditorServiceImpl implements ICreditorService {
	@Autowired
	private ICreditorBS creditorBS;

	public ICreditorBS getCreditorBS() {
		return creditorBS;
	}

	public void setCreditorBS(ICreditorBS creditorBS) {
		this.creditorBS = creditorBS;
	}
	
	
	/**
	 *债权信息维护列表
	 * @param cqVO
	 * @return
	 */
	public List<DebtInfo> debtList(Paginator paginator,CreditorQueryVO cqVO){
		return creditorBS.debtList(paginator,cqVO);
	}

	
	
	/**
	 * 插入一条实体信息
	 * @param st
	 */
	public void newDebtInfo(DebtInfo di){
		creditorBS.newDebtInfo(di);
	}
	
	/**
	 * 保存一条实体信息
	 * @param st
	 */
	public void saveDebtInfo(DebtInfo di){
		creditorBS.saveDebtInfo(di);
	}
	
	/**
	 * 根据id查找实体基本信息
	 * @param id
	 * @return
	 */
	public DebtInfo getDebtInfo(String id){
		return creditorBS.getDebtInfo(id);
	}
	
	/**
	 * 删除外部实体
	 * @param id
	 */
	public void deleteDebtInfo(String[] id){
		creditorBS.deleteDebtInfo(id);
	}
	
	
	
	
	/**
	 * 根据zqid 查找办理依据 列表
	 * @param id
	 * @return
	 */
	public List<DebtWorklog> getDebtWorklogList(String id) {
		return creditorBS.getDebtWorklogList(id);
	}
	
	
	/**
	 * 插入一条DebtWorklog
	 * @param st
	 */
	public void newDebtWorklog(DebtWorklog dk){
		creditorBS.newDebtWorklog(dk);
	}
	
	
	/**
	 * 保存一条DebtWorklog
	 * @param st
	 */
	public void saveDebtWorklog(DebtWorklog dk){
		creditorBS.saveDebtWorklog(dk);
	}
	
	
	/**
	 * 根据id查找DebtWorklog
	 * @param id
	 * @return
	 */
	public DebtWorklog getDebtWorklogInfo(String id){
		return creditorBS.getDebtWorklogInfo(id);
	}
	
	
	
	
//-------------------日志更新-----------------------
	
	
	public void saveSSchangePro(DebtInfo debtInfo_old, DebtInfo debtInfo_new,String opType,String subSys){
		creditorBS.saveSSchangePro(debtInfo_old, debtInfo_new, opType,subSys);
	}
}
