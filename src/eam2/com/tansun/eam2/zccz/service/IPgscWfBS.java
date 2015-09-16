package com.tansun.eam2.zccz.service;

import java.lang.reflect.InvocationTargetException;

import com.tansun.eam2.common.commonService.ICommonBS;

public interface IPgscWfBS extends ICommonBS {

	/**
	 * 拷贝意见到知识库（其中序号生成规则为：pid下最大的序号加一）
	 * 1、查询所有的项目xm、对应的知识库意见yj并比较意见内容
	 * 		不一样：新建项目（注意序号生成）、要点、意见并更新xm,yd,yj的oldId为新生成知识库id
	 * 		一样：
	 * 			2、查询项目下的要点、对应的知识库并比较意见内容
	 * 				不一样：新建要点（pid为知识库意见对应的项目id）、新建意见并更新yd,yj的oldId为新生成知识库id
	 * 				一样  ：
	 * 					3、查询要点下的意见、对应的知识库并比较意见内容
	 * 						不一样：新建知识库意见（pid为原知识库对应的要点id）并更新yj的oldId为新生成知识库id
	 * 						一样：啥也不做！
	 * @param cldId
	 */
	public void copyYjToZSK(String cldId, String currentUserId);
	
	//更新某人的某项目的未提交的意见为过程意见
	public void updateScpgJlxzGc(String cldId, String userId);
	//更新某人的某项目的未提交的意见为退回意见
	public void updateScpgJlxzTh(String cldId, String userId);
	//更新某人的某项目的未提交的意见为最终意见
	public void updateScpgJlxzZz(String cldId, String userId);
	
	//评估审查次数加一
	public void pgscCsj1(String cldId);
	
	//设置评估审查意见为已提交
	public void setPgscjlYtj(String cldId, String currentUserId);
	
	public void cloneCld(String cldId) throws IllegalAccessException, InvocationTargetException;
	
	/*
	 * 根据评估审查的处理单Id，查询出上次的评估审查Id
	 */
	public String getPreHeadIdById(String cldId);
	
	/*
	 * 根据评估审查的处理单Id，查询出历次的评估审查Id
	 * @param cldId 为最后一次
	 */
	public String getAllHeadIdById(String cldId);
}
