package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.wtdk.service.ILoansQueryBS;
import com.tansun.eam2.wtdk.ucc.ILoansQueryUCC;
import com.tansun.eam2.wtdk.vo.LoansQueryVO;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 贷款信息
 * 
 * @author 陈煜霄
 * @date 2010-12-03
 */
@Service
public class LoansQueryUCCImpl implements ILoansQueryUCC {

	@Autowired
	private ILoansQueryBS loansQueryBSImpl;

	public String query(LoansQueryVO queryVO, Paginator paginator) {
		return loansQueryBSImpl.query(queryVO, paginator);
	}

	/**
	 * 根据贷款号查找贷款内容
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansQueryVO findLoansInfoByLnNo(String lnNo) {
		return loansQueryBSImpl.findLoansInfoByLnNo(lnNo);
	}

	/**
	 * 查询贷款本金明细
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String bjMxQuery(String id) {
		return loansQueryBSImpl.bjMxQuery(id);
	}

	/**
	 * 保存担险信息
	 * 
	 * @param wdInfo
	 */
	public void saveWdDXInfo(LoansRiskVO riskVO) {
		loansQueryBSImpl.saveWdDXInfo(riskVO);
	}

	/**
	 * 修改担险信息
	 * 
	 * @param riskVO
	 */
	public void updateWdDXInfo(LoansRiskVO riskVO) {
		loansQueryBSImpl.updateWdDXInfo(riskVO);
	}

	/**
	 * 根据贷款账号查找担险信息
	 * 
	 * @param lnNo
	 * @return
	 */
	public LoansRiskVO findRiskInfoByLnNo(String lnNo) {
		return loansQueryBSImpl.findRiskInfoByLnNo(lnNo);
	}

	/**
	 * 通过序列查找关联关系
	 * 
	 * @param xulie
	 * @return
	 */
	public LoansRiskVO findRelateInfoByXuLie(String xulie) {
		return loansQueryBSImpl.findRelateInfoByXuLie(xulie);
	}

	/**
	 * 保存关联信息
	 * 
	 * @param riskVO
	 */
	public void saveRenateInfo(LoansRiskVO riskVO) {
		loansQueryBSImpl.saveRenateInfo(riskVO);
	}

	/**
	 * 修改关联信息
	 * 
	 * @param riskVO
	 */
	public void updateRenateInfo(LoansRiskVO riskVO) {
		loansQueryBSImpl.updateRenateInfo(riskVO);
	}

	/**
	 * 通过序列删除关联关系
	 * 
	 * @param xulie
	 */
	public void deleteRelateInfoByXuLie(String xulie) {
		loansQueryBSImpl.deleteRelateInfoByXuLie(xulie);
	}

	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * 
	 * @return
	 */
	public String findCzXxList(String loansId) {
		return this.loansQueryBSImpl.findCzXxList(loansId);
	}

	/**
	 * 根据选择的项目得到项目下的资产列表
	 * 
	 * @return
	 */
	public String findAssetByCzXxList(String loansId, String cldId, String xmId) {
		return this.loansQueryBSImpl.findAssetByCzXxList(loansId, cldId, xmId);
	}

	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String query4excel(String ids) {
		return loansQueryBSImpl.query4excel(ids);
	}

	/**
	 * 通过贷款账号查找贷款基金关联关系
	 * 
	 * @param lnNo
	 * @return
	 */
	public String findRelate(String lnNo) {
		return loansQueryBSImpl.findRelate(lnNo);
	}
}
