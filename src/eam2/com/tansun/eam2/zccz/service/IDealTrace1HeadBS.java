package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.util.Paginator;

public interface IDealTrace1HeadBS extends ICommonBS{
	/**
	 * 查询列表json字符串
	 * @return
	 */
	public String getQueryJSONStr(DealQueryVo vo,Paginator paginator);

	/**
	 * 查询处置资产项目信息临时表
	 * @param xmId
	 * @return
	 */
	public CzXmxxLsb findCzXmXxLSBById(String xmId);
	
	public CzXmxxLsb findCzXmxxLsbByCldId(String cldId);
	/**
	 * 查询处置资产项目信息
	 * @param xmId
	 * @return
	 */
	public CzXmXx findCzXmXxById(String xmId);

	/**
	 * 处理单列表json字符串
	 * @return
	 */
	public String findCzXmByCldId(String headId);

	/**
	 * 删除处置项目，实际是取消项目与结案处理单的关联
	 * @param cldId
	 * @param xmIds
	 */
	public void deleteCzxm(String cldId, String[] xmIds);

	/**
	 * 关联处理单和项目
	 * @return
	 */
	public void saveXm2Cld(String headId, String[] xmIds);
	
	public List<CzZcXx> findAssetListByIdAndZclb(String cldId,String zclb);

	/**
	 * 根据id查询处置项目结案表头
	 * @param headId
	 * @return
	 */
	public CzXmjaHead getCzXmjaHeadById(String headId);
	
	/**
	 * 更新项目结案body表
	 * @param body
	 * @param type
	 */
	public void update(CzXmjaBody body, String type);
	
	/**
	 * 根据处理单id 和xmId查找body信息
	 * @param xmId
	 * @param cldId
	 * @return
	 */
	public CzXmjaBody findCzXmjaBodyByXmIdAndCldId(String xmId, String cldId);
	
	public List<CzFysrMx> getCzFysrMxListByXmId(String xmId);

	
	/**
	 * 流程办结
	 * @return
	 */
	public String banjie(String headId);
	/**
	 * 处理单列表list
	 * @return
	 */
	public List findCzXmListByCldId(String headId);
	/**
	 * 全部结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quanbujiean(String headId, String xmIds);
	/**
	 * 部分结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String bufenjiean(String headId, String xmIds,String zcIds,String zclb);
	/**
	 * 取消结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quxiaojiean(String headId, String xmIds,String zcIds,String zclb);

	public String look_oa(String itemId);

	public String findCzXmxxIdByLsbId(String cld);
}
