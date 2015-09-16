package com.tansun.eam2.zqgl.service;

import java.util.ArrayList;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.DebtWorklog;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.zqgl.vo.CreditorQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

public interface ICreditorBS {

	public List<DebtInfo> getDebtListByStid(String stId);
	
	/**
	 *债权信息维护列表
	 * @param cqVO
	 * @return
	 */
	public List<DebtInfo> debtList(Paginator paginator,CreditorQueryVO cqVO);
	
	
	
	/**
	 * 插入一条实体信息
	 * @param st
	 */
	public void newDebtInfo(DebtInfo di);
	
	/**
	 * 保存一条实体信息
	 * @param st
	 */
	public void saveDebtInfo(DebtInfo di);
	
	/**
	 * 根据id查找实体基本信息
	 * @param id
	 * @return
	 */
	public DebtInfo getDebtInfo(String id);
	
	/**
	 * 删除外部实体
	 * @param id
	 */
	public void deleteDebtInfo(String[] id);
	
	
	
	/**
	 * 根据zqid 查找办理依据 列表
	 * @param id
	 * @return
	 */
	public List<DebtWorklog> getDebtWorklogList(String id);
	
	
	/**
	 * 插入一条DebtWorklog
	 * @param st
	 */
	public void newDebtWorklog(DebtWorklog dk);
	
	/**
	 * 保存一条DebtWorklog
	 * @param st
	 */
	public void saveDebtWorklog(DebtWorklog dk);
	
	/**
	 * 根据id查找DebtWorklog
	 * @param id
	 * @return
	 */
	public DebtWorklog getDebtWorklogInfo(String id);
	
	
	
//-------------------日志更新-----------------------
	
	
	public void saveSSchangePro(DebtInfo debtInfo_old, DebtInfo debtInfo_new,String opType, String subSys);
	
	public List<DebtInfo> selectDabtList(String ids);
}
