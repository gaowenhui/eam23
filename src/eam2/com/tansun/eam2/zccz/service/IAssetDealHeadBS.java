package com.tansun.eam2.zccz.service;

import java.util.Date;
import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;

public interface IAssetDealHeadBS extends ICommonBS{

	/**
	 * 根据拟稿日期、拟稿人和处理单状态，查询出处理单信息
	 * @param date 拟稿日期
	 * @param ngr 拟稿人
	 * @param state 处理单状态
	 * @return
	 */
	public CzCztzfaXx findHeadByDateAndPerson(Date date,String ngr,String state);
	
	/**
	 * 根据处理单id计算预计处置费用总额
	 * @param cldId
	 */
	public Double fillDisposeExpense(String cldId);
	
	/**
	 * 根据处理单id查询出该处理单的历次办理情况
	 * @param cldId 处理单id
	 */
	public List<CzCztzfaXx> findHistoryBlInfo(String cldId);
	
	/**
	 * 查找当前流程在项目受理中的部门和人员,返回到页面，在合规审查提交会议组织时用
	 * @param taskId
	 * @return
	 */
	public String findXmslDept(String taskId, String taskp);
	
	public String zcczDataProcess();
	
	public void processData();
	
	public void processData2();
	
	public String test();
}
