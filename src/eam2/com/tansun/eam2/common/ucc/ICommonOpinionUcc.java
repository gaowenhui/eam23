package com.tansun.eam2.common.ucc;

import java.util.List;
import java.util.Map;

import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * 通用意见域
 * @author <a href="mailto:fangbaling@tansun.com.cn">Baitin.Fong</a>
 *
 */
public interface ICommonOpinionUcc {
	
	/**
	 * 每个人填写意见，都是新增。因为每个人填写的意见是不允许修改的。
	 * 有一些功能可能需要自己定义，如评估审查。
	 * opinion中必须包括表单ID，即headid。用户与部门信息，也需要提供。
	 * @param opinion
	 */
	void saveOrUpdateOpinion(PTCommonOpinionBO opinion);
	
	void updateOpinionByTaskId(String taskid);
	
	void deleteOpinionById(String ids);

    List<PTCommonOpinionBO> query4View(String bdid);
    
    PTCommonOpinionBO getOpinionByTaskId(String taskid, Integer newType);
    
    void cloneOpinionByBdId(String oldBdid, String newBdid);

    void cloneOpinionByBdId(String oldBdid, String newBdid, Integer oldType, Integer newType);

	/**
	 * 根据表单ID与意见域类型查询出意见列表，用可以用于各种情况。
	 * 当然也可以用于jqQuery。
	byte OPINION_YJYLX_DRAFT_DEPT = 0; //拟稿部门意见
    byte OPINION_YJYLX_MEETING_DEPT = 1; //返回到主表单上的会签部门意见
    byte OPINION_YJYLX_MEETING = 2; //会签过程中的意见
    byte OPINION_YJYLX_OPERATION_GROUP = 3;// 业务运营组意见
    byte OPINION_YJYLX_ERP_RESULT = 4;// ERP处理结果
    byte OPINION_YJYLX_LEADER = 5;// 公司领导意见
    byte OPINION_YJYLX_HANDLE_DEPT = 6;//办理部门意见
    byte OPINION_YJYLX_FINAL = 9; //批示意见
    byte OPINION_YJYLX_HQZZ = 7; //会签最终意见域
    byte OPINION_YJYLX_HQTH = 8; //会签退回意见域
    byte OPINION_ZZYJ_NORMAL = 0; //一般意见
    byte OPINION_ZZYJ_FINAL = 1; //最终意见
    
    byte OPINION_YJLX_DISAGREE = 0; //不同意
    byte OPINION_YJLX_AGREE = 1; // 同意
    byte OPINION_YJLX_BACK = 2; // 退回
    byte OPINION_YJLX_NOIDEAR = 3; //最终意见
    
	 * @param bdid 表单ID，有些同事叫headid。
	 * @param type  意见类型见上面，调用的时候用@see com.tansun.rdp4j.common.util.ucc.CommonGlobal.java
	 * type严禁自己写0,1,……这种方式。
	 * @return
	 */
	List<PTCommonOpinionBO> query4View(String bdid, Integer type);
	
	/**
	 * 根据表单ID，查询这个表单上所有的意见信息。
	 * 方法很强大，现在不实现。：）
	 * @param bdid 表单id,即headid。
	 * @param param 这个参数备用，很无敌，N多都行。
	 * @return
	 */
	Map<String, List<PTCommonOpinionBO>> queryBybdid(String bdid, String...param);
	
	/**
	 * 把某些类型的意见域拷贝到某个意见域中
	 * Added by liubeibei.2011/3/12.
	 * @param oldBdid
	 * @param newBdid
	 * @param oldTypes 
	 * @param newType
	 */
	public void cloneOpinionByBdId(String oldBdid, String newBdid,  Integer[] oldTypes, Integer newType);
}

