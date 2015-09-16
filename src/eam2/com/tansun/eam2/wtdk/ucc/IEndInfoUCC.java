package com.tansun.eam2.wtdk.ucc;

import com.tansun.eam2.common.model.orm.bo.CommonEam2Oa;
import com.tansun.eam2.common.model.orm.bo.WtdkEndInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkFuncBackInfo;
import com.tansun.eam2.common.model.orm.bo.WtdkGlHead;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.RelateQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 终止委托贷款管理
 * 
 * @author 陈煜霄
 * @date 2010-12-07
 */
public interface IEndInfoUCC {

	/**
	 * 进入表单保存一条记录
	 * 
	 * @param head
	 */
	public void saveHead(WtdkGlHead head);

	/**
	 * 修改表头
	 * 
	 * @param body
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
	 * 根据bodyid删除表体信息
	 * 
	 * @param ids
	 */
	public void deleteBodyByBodyId(String[] ids);

	/**
	 * 保存表体
	 * 
	 * @param funcIds
	 */
	public void saveBody(WtdkEndInfo body);

	/**
	 * 修改表体
	 * 
	 * @param body
	 */
	public void updateBody(WtdkEndInfo body);

	/**
	 * 将基金信息转化为body
	 * 
	 * @return
	 */
	public WtdkEndInfo fuToBody(String headId, String fuNo);

	/**
	 * 根据bodyId查找body信息
	 * 
	 * @param bodyId
	 * @return
	 */
	public WtdkEndInfo findBodyByBodyId(String bodyId);

	/**
	 * 批量保存表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchFuToBody(String headId, String funcNo);

	/**
	 * 批量修改表体
	 * 
	 * @param headId
	 * @param funcNo
	 */
	public void batchUpdateBody(String bodyIds, String spjg, String bz);

	/**
	 * 查找关联关系
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String findRelate(RelateQueryVO queryVO, Paginator paginator);

	/**
	 * 通过序列保存表体
	 * 
	 * @param xulies
	 */
	public void saveBodysByXulie(String xulies, String headId);
	
	/**
	 * 保存eam2oa
	 * 
	 * @param eamoa
	 */
	public void saveEAM2OA(CommonEam2Oa eamoa);

}
