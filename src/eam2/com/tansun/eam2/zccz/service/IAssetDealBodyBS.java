package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.util.Paginator;

public interface IAssetDealBodyBS extends ICommonBS{

	/**
	 * 根据资产ids保存选择的资产信息到处置资产信息表CZ_ZC_XX
	 * @param ids
	 */
	public void saveJyzcByIds(String[] ids,String cldId, String assetType);

	/**
	 * 根据自用资产ids保存选择的自用资产信息到处置资产信息表CZ_ZC_XX
	 * @param ids
	 */
	public void saveZyzcByIds(String[] ids,String cldId);

	/**
	 * 根据资产id，获取资产的评估价值
	 * @param zcId
	 * @return
	 */
	public Double getEstimateValueByZcId(String zcId);
	
	/**
	 * 查看表体记录入口(只读)
	 */
	public List<CzZcXx> viewBody(String cldId,String zclb);
	public List<CzZcXx> viewBodyFY(String cldId,String zclb,List list,Paginator paginator);
	/**
	 * 根据CZ_ZC_XX表中的id，删除信息
	 * @param ids
	 */
	public void deleteBody(String[] ids);
	
	/**
	 * 根据资产ids保存选择的实体内资产信息到处置资产信息表CZ_ZC_XX
	 * @param ids 实体附属信息id
	 * @param cldId 处理单id
	 * @param zclb 实体内资产类别
	 * @return
	 */
	public boolean saveEntityByIds(String[] ids,String cldId,String zclb,String stid);
	
	public boolean saveLoanByIds(String[] ids, String cldId, String zclb,String loanNo);
	
	//============拟稿环节环节以后，如果删除表体中选择的资产需要触发的操作=====================	
	/**
	 * 需要修改处置资产信息CZ_ZC_XX表中状态为流程作废
	 * 根据处置资产类别，修改相应资产状态为未处置
	 * @param cldId
	 */
	public void modifyBodyStateDel(String cldId);	
	
	/**
	 * 检查选择要添加的资产id是否已经选择过
	 * @param ids  选择要添加的资产id
	 * @return 返回可添加的资产
	 */
	public String[] checkAssetIdsForAdd(String cldId,String zclb,String[] ids);
	
	/**
	 * 检查选择要添加的资产id是否已经选择过
	 * @param ids  选择要添加的资产id
	 * @return 返回不可添加的资产
	 */
	public List<CzZcXx> checkAddAssetIdsForTip(String cldId,String zclb,String[] ids);
	
	/**
	 * 添加债券到zcczxx表中
	 * @param ids
	 * @param cldId
	 * @param assetType
	 */
	public void saveZqByIds(String[] ids, String cldId, String assetType);
	
	public void updateBodyCzfs(String id, String czfs);
}
