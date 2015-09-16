package com.tansun.eam2.cjtz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface ICzCztzfaXxService extends ICommonBS {
	
	public CzCztzfaXx getCzCztzfaXxById(String id);
	
	public void save (CommonBO bo);
	
	public void update(CommonBO bo);
	
	public void delete(CommonBO bo);
	
	/**
	 * 保存表体,根据表头id 选择资产ids
	 * 
	 * @return
	 */
	public void saveBody(String zcIds, String headId);
	/**
	 * 得到固定资产的列表
	 * @return
	 */
	public String getGdzcList(String headId);
	
	/**
	 * 根据资产ID 找到相应的费用信息
	 * 
	 * @param zcId
	 * @return
	 */
	public List getJyzcSqsdfyXxByZcId(String zcId,String cldId);
	/**
	 * 选择资产后转换为处置资产信息
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxByZcId(String zcIds);
	
	/**
	 * 处置承继投资添加，及申请审定费用表添加
	 * 
	 * @return
	 */
	public void addFy(String headId, CzZcXx czZcXx, String[] xmmcs,
			String[] sqjes, String[] sdjes);

	/**
	 * 根据id删除body
	 * @param zcIds
	 */
	public void deleteBody(String zcIds,String headId);
	
	/**
	 * 修改body
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxById(String zcIds);
	
	/**
	 * 保存租赁表体
	 * @param czZcXx
	 * @param headId
	 */
	public void saveBody(CzZcXx czZcXx, String headId);
	
	/**
	 * 实体承继投资审批，即业务类型为实体的审批单
	 * @param czCztzfaXx
	 * @param czstcztz
	 */
	public void updateSt(CzCztzfaXx czCztzfaXx, CzStcztz czstcztz);
	
	/**
	 * 根据id查询实体信息
	 * @param headId
	 * @return
	 */
	public CzStcztz getCzStcztzById(String headId);
}
