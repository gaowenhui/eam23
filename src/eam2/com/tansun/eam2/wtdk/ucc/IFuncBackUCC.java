package com.tansun.eam2.wtdk.ucc;

import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.wtdk.vo.FuncBackVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 基金退回
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public interface IFuncBackUCC {

	/**
	 * 保存基金退回表头
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head);

	/**
	 * 修改基金退回表头
	 * 
	 * @param head
	 */
	public void updateHead(WtdkGlHead head);

	/**
	 * 根据headId查找head信息
	 * 
	 * @param headId
	 * @return
	 */
	public WtdkGlHead findHeadByHeadId(String headId);

	/**
	 * 根据表头id查找表体信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findBodyByHeadId(String headId);

	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkFuncBackInfo findBodyByBodyId(String bodyId);

	/**
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids);

	/**
	 * 保存表体
	 * 
	 * @param lnId
	 */
	public void saveBody(WtdkFuncBackInfo body);

	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkFuncBackInfo body);

	/**
	 * 查询贷款回款信息
	 * 
	 * @param backVO
	 * @param paginator
	 * @return
	 */
	public String query(FuncBackVO backVO, Paginator paginator);

	/**
	 * 将贷款回款信息转化为body
	 * 
	 * @return
	 */
	public WtdkFuncBackInfo lnToBody(String headId, String lnNo, String hkrq);

	/**
	 * 批量保存表体
	 * 
	 * @param headId
	 * @param lnNo
	 * @param hkrq
	 */
	public void batchLnToBody(String headId, String lnNo, String hkrq);

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
			String spjg, String bz);

}
