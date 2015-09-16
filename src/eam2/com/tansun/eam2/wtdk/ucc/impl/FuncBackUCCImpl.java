package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.wtdk.service.IFuncBackBS;
import com.tansun.eam2.wtdk.ucc.IFuncBackUCC;
import com.tansun.eam2.wtdk.vo.FuncBackVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 基金退回
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class FuncBackUCCImpl implements IFuncBackUCC {

	@Autowired
	private IFuncBackBS funcBackBSImpl;

	/**
	 * 保存基金退回表头
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head) {
		funcBackBSImpl.saveHead(head);
	}

	/**
	 * 修改基金退回表头
	 * 
	 * @param head
	 */
	public void updateHead(WtdkGlHead head) {
		funcBackBSImpl.updateHead(head);
	}

	/**
	 * 根据headId查找head信息
	 * 
	 * @param headId
	 * @return
	 */
	public WtdkGlHead findHeadByHeadId(String headId) {
		return funcBackBSImpl.findHeadByHeadId(headId);
	}

	/**
	 * 根据表头id查找表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId) {
		return funcBackBSImpl.findBodyByHeadId(headId);
	}

	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkFuncBackInfo findBodyByBodyId(String bodyId) {
		return funcBackBSImpl.findBodyByBodyId(bodyId);
	}

	/**
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids) {
		funcBackBSImpl.deleteBodyByBodyId(ids);
	}

	/**
	 * 保存表体
	 * 
	 * @param lnId
	 */
	public void saveBody(WtdkFuncBackInfo body) {
		funcBackBSImpl.saveBody(body);
	}

	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkFuncBackInfo body) {
		funcBackBSImpl.updateBody(body);
	}

	/**
	 * 查询贷款回款信息
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncBackVO backVO, Paginator paginator) {
		return funcBackBSImpl.query(backVO, paginator);
	}

	/**
	 * 将贷款回款信息转化为body
	 * 
	 * @return
	 */
	public WtdkFuncBackInfo lnToBody(String headId, String lnNo, String hkrq) {
		return funcBackBSImpl.lnToBody(headId, lnNo, hkrq);
	}

	/**
	 * 批量保存表体
	 * 
	 * @param headId
	 * @param lnNo
	 * @param hkrq
	 */
	public void batchLnToBody(String headId, String lnNo, String hkrq) {
		funcBackBSImpl.batchLnToBody(headId, lnNo, hkrq);
	}

	/**
	 * 批量修改表体
	 * 
	 * @param bodyIds
	 * @param nhfje
	 * @param spje
	 * @param spjg
	 * @param bz
	 */
	public void batchUpdateBody(String bodyIds, String nhfje, String spje,
			String spjg, String bz) {
		funcBackBSImpl.batchUpdateBody(bodyIds, nhfje, spje, spjg, bz);
	}
}
