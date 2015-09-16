package com.tansun.eam2.common.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.EAMDept;

public interface IDeptTreeUcc {
	List<EAMDept> getEAMDept(Long id, Long parid);
	
	/**
	 * 查找当前部门的子部门
	 */
	public List getEAM2Dept(String parid);
	
	/**
	 * 查找相关模块需要的部门
	 * 评估审查－－风险管理部门（只有一个）
	 * @param parid
	 * @param option 模块名称字母首写
	 * @return
	 */
	public List getEAM2Dept(String parid, String option);
}
