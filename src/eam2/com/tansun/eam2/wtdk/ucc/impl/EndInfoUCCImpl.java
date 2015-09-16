package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.WtdkEndInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.wtdk.service.IEndInfoBS;
import com.tansun.eam2.wtdk.ucc.IEndInfoUCC;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.RelateQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 终止委托贷款管理
 * 
 * @author 陈煜霄
 * @date 2010-12-07
 */
@Service
public class EndInfoUCCImpl implements IEndInfoUCC {

	@Autowired
	private IEndInfoBS endInfoBSImpl;

	/**
	 * 进入表单保存一条记录
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head) {
		endInfoBSImpl.saveHead(head);
	}

	/**
	 * 修改表头
	 * 
	 * @param body
	 */
	public void updateHead(WtdkGlHead head) {
		endInfoBSImpl.updateHead(head);
	}

	/**
	 * 根据headId查找head信息
	 * 
	 * @param headId
	 * @return
	 */
	public WtdkGlHead findHeadByHeadId(String headId) {
		return endInfoBSImpl.findHeadByHeadId(headId);
	}

	/**
	 * 根据表头id查找表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId) {
		return endInfoBSImpl.findBodyByHeadId(headId);
	}

	/**
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids) {
		endInfoBSImpl.deleteBodyByBodyId(ids);
	}

	/**
	 * 保存表体
	 * 
	 * @param funcIds
	 */
	public void saveBody(WtdkEndInfo body) {
		endInfoBSImpl.saveBody(body);
	}

	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkEndInfo body) {
		endInfoBSImpl.updateBody(body);
	}

	/**
	 * 将基金信息转化为body
	 * 
	 * @return
	 */
	public WtdkEndInfo fuToBody(String headId, String fuNo) {
		return endInfoBSImpl.fuToBody(headId, fuNo);
	}

	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkEndInfo findBodyByBodyId(String bodyId) {
		return endInfoBSImpl.findBodyByBodyId(bodyId);
	}

	/**
	 * 批量保存表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchFuToBody(String headId, String funcNo) {
		endInfoBSImpl.batchFuToBody(headId, funcNo);
	}

	/**
	 * 批量修改表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchUpdateBody(String bodyIds, String spjg, String bz) {
		endInfoBSImpl.batchUpdateBody(bodyIds, spjg, bz);
	}

	/**
	 * 查找关联关系
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String findRelate(RelateQueryVO queryVO, Paginator paginator) {
		return endInfoBSImpl.findRelate(queryVO, paginator);
	}

	/**
	 * 通过序列保存表体
	 * 
	 * @param xulies
	 */
	public void saveBodysByXulie(String xulies, String headId) {
		endInfoBSImpl.saveBodysByXulie(xulies, headId);
	}

	/**
	 * 保存eam2oa
	 * 
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa){
		endInfoBSImpl.saveEAM2OA(eamoa);
	}
	
}
