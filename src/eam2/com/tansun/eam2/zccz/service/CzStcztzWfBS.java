package com.tansun.eam2.zccz.service;

import java.lang.reflect.InvocationTargetException;

import com.tansun.eam2.common.commonService.ICommonBS;

public interface CzStcztzWfBS extends ICommonBS {

	/**
	 * 点击提交时，根据处理单id修改处理单状态为处置审批中,将流程Id保存到CZ_STCZTZ对象中
	 * 0：未处置1：处置审批中2：处置执行中 3:已处置
	 * @param cldId 处理单id
	 * 资产处置投资方案信息表CZ_STCZTZ
	 */
	public void modifyStztczStateSpz(String processInstanceId, String cldId);
	
	/**
	 * 点击提交时，根据处理单id修改处理单状态为审批中
	 * 
	 * @param cldId 处理单id
	 * 资产处置投资方案信息表CZ_STCZTZ
	 */
	public void modifyStztczStateSpz(String cldId);
	
	/**
	 * 更新一个项目中安置的人员的状态为安置审批中
	 * 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuInCld(String cldId);
	
	/**
	 * 根据处理单id，修改ST_JBXX表中的实体状态为处置审批中中
	 * @param cldId
	 */
	public void uadateStJbxxStatuInCld(String cldId);
	
	/**
	 * 更新一个项目中安置的人员的状态为已安置 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuToYazInCld(String cldId);	
	
	//============拟稿环节，作废流程需要触发的操作=====================	
	/**
	 * 流程作废，需要修改安置人员信息为未安置
	 * 0：未安置1：安置审批中2：安置执行中 3:已安置
	 * 修改CZ_STCZTZ状态为流程作废4
	 * @param cldId
	 */
	public void updateStatuForDropStayaz(String cldId);
	
	//============拟稿环节，作废流程需要触发的操作=====================	
	/**
	 * 流程作废，需要修改处置实体信息为未处置
	 * 0：未处置1：处置审批中2：处置执行中 3:已处置
	 * 修改CZ_STCZTZ状态为流程作废4
	 * @param cldId
	 */	
	public void updateStatuForDropStztcz(String cldId);
	
	//============项目受理环节，点击提交－》合规审查办理需要触发的操作======================	
	/**
	 * 根据处理单id，在实体整体处置人员安置及实体承继投资信息表CZ_STCZTZ中把合规审查次数HGSCCS加1后进行保存
	 * @param cldId
	 */
	public void addCheckCount(String cldId);	
	
	//============合规审查环节，提交最终意见流转到会议组织环节需要触发的操作======================	
	/**
	 * 在处置投资项目信息临时表CZ_XMXX_LSB中插入一条新的记录
	 * 拷贝CZ_STCZTZ表中的信息到CZ_XMXX_LSB表中新插入的那条记录里面
	 * @param cldId 处理单id
	 * copy属性有：编号、处置项目名称、汇报人（拟稿人）、汇报人姓名（拟稿人姓名）、状态（null）、
	 * 分类（ZcczCommon中定义有经营性固产处置）、受理序号、申报日期、处理单Id
	 */
	public void copyPropertieToXmxxLsb(String cldId);
	//=====================项目结束的时候==============================
	/**
	 * 根据处理单id，修改安置人员信息CZ_AZRY_XX表中状态为已审批
	 * 如果项目审批通过，修改相应的ST_FSXX表中FAZFY状态安置执行中
	 * 修改CZ_STCZTZ状态为
	 * 如果项目未通过，修改人员状态为未安置
	 * @param cldId
	 */
	public void modifyStayazStateYsp(String cldId);
	
	/**
	 * 如果项目审批通过，修改相应的ST_JBXX表中状态C_STZT为处置执行中
	 * 如果项目未通过，修改实体状态为未处置
	 * @param cldId
	 */
	public void modifyStztczStateYsp(String cldId);
	
	/**
	 * 返回但前处理单所在会议的流程Id
	 * 根据处理单id(CZ_STCZTZ.id)到表CZ_XMXX_LSB中查询会议id（HY_ID），再到表CZ_HYXX查询流程Id（LC_ID）
	 * @param cldId
	 * @return	会议流程Id
	 */
	public String getHyLcId(String cldId);
	
	/**
	 * 会议组织结束后将CZ_XMXX_LSB表中的状态改为，未上会
	 * 通过cldId到表CZ_XMXX_LSB中找到相应的记录,将字段ZHUANGTAI改为未上会
	 * "状态  0：未上会1：上会中2：上会完毕"
	 * @param cldId
	 */
	public void updateXmxxToWsh(String cldId);
	
	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/entityDealHead_viewDraft.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param cldId ：CZ_STCZTZ.id
	 */
	public void stztczMessageToAllSpwy(String cldId,Long currentUserId);

	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/personDealHead_toModify.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param cldId ：CZ_STCZTZ.id
	 */
	public void stayazMessageToAllSpwy(String cldId,Long currentUserId);
	
	//=================发办理时跟新办理时间==================================
	public void updateBlDate(String cldId);
	
	public void endLc(String cldId);
	
	public boolean isAllXmIsOverByCldId(String cldId);
	
	//============合规审查环节如果退回处理单，发到项目受理环节需要触发的操作======================	
	/**
	 * 1、oldHead查出来
	 * 2、新建newHead
	 * 3、将oldHead拷贝到newHead中
	 * 4、将newHead的id设置为null
	 * 5、将newHead的处理单状态设置为状态为被退回ZcczCommon.FORM_BE_RETURN 3
	 * 6、newHeadId = save(newHead)
	 * 7、设置oldHead的上次合规审查id为newHead.id
	 * 8、设置oldHead的发办理时间为null
	 * 9、update(oldHead)
	 * 设置旧处理单的，进行数据更新
	 * @param cldId 处理单id
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public String returnCzStcztzBackToXmsl(String cldId) throws IllegalAccessException, InvocationTargetException;	

	/**
	 * 拟稿提交的时候跟新处理单状态为审批
	 * @param cldId
	 */
	public void setCzStcztzStatuAsWtj(String cldId);
	
	public void cloneBodyToHistory(String cld, String historyCld) throws IllegalAccessException, InvocationTargetException;
	
	public void cloneHgxscToHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException;
	
	//拷贝临时表里面的数据到项目信息表了面去做跟踪
	public void cloneXmLsbToXm(String cldId) throws IllegalAccessException, InvocationTargetException; //如果项目通过，拷贝项目临时表信息到项目信息表中
	
	//实体人员安置作废时释放编号
	public void releaseStayazBianhao(String cldId);
	
	//实体整体处置作废时释放编号
	public void releaseStztczBianhao(String cldId);
	
	//更新处理单下债权和债权临时表的处置状态
	public void updateDebtAndLsbStatu(String cldId, String statu);
	
	//跟新处理单下的债权临时表的处理单状态
	public void updateDebtLsbCldZt(String cdlId, String statu);
	
	//承继投资作废时释放编号
	public void releaseCjtzBianhao(String cldId);
	
	//承继投资作废时修改处理单状态为作废
	public void updateStatuForDropCjtz(String cldId);
	
	//根据处理单id清除合规审查意见
	public void deleteHgscByCldId(String cldId);
}
