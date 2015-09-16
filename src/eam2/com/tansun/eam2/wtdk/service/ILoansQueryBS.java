package com.tansun.eam2.wtdk.service;

import com.tansun.eam2.wtdk.vo.LoansQueryVO;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 贷款信息
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
public interface ILoansQueryBS {

	/**
	 * 查找贷款信息列表
	 * 
	 * @return
	 */
	public String query(LoansQueryVO queryVO, Paginator paginator);

	/**
	 * 根据贷款号查找贷款内容
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansQueryVO findLoansInfoByLnNo(String lnNo);

	/**
	 * 查询贷款本金明细
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String bjMxQuery(String id);

	/**
	 * 保存担险信息
	 * 
	 * @param wdInfo
	 */
	public void saveWdDXInfo(LoansRiskVO riskVO);

	/**
	 * 修改担险信息
	 * 
	 * @param riskVO
	 */
	public void updateWdDXInfo(LoansRiskVO riskVO);

	/**
	 * 根据贷款账号查找担险信息
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansRiskVO findRiskInfoByLnNo(String lnNo);

	/**
	 * 通过序列查找关联关系
	 * 
	 * @param xulie
	 * @return
	 */
	public LoansRiskVO findRelateInfoByXuLie(String xulie);

	/**
	 * 保存关联信息
	 * 
	 * @param riskVO
	 */
	public void saveRenateInfo(LoansRiskVO riskVO);

	/**
	 * 修改关联信息
	 * 
	 * @param riskVO
	 */
	public void updateRenateInfo(LoansRiskVO riskVO);

	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * 
	 * @return
	 */
	public String findCzXxList(String loansId);

	/**
	 * 根据选择的项目得到项目下的资产列表
	 * 
	 * @return
	 */
	public String findAssetByCzXxList(String loansId, String cldId, String xmId);

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids);

	/**
	 * 通过贷款账号查找贷款基金关联关系
	 * 
	 * @param lnNo
	 * @return
	 */
	public String findRelate(String lnNo);

	/**
	 * 通过序列删除关联关系
	 * 
	 * @param xulie
	 */
	public void deleteRelateInfoByXuLie(String xulie);
}
