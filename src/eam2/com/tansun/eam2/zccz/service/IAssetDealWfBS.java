package com.tansun.eam2.zccz.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;

public interface IAssetDealWfBS extends ICommonBS{
	//===合规审查到会议组织 给所有的审批委员发  jf  add
	public void sendMsg(long sender,String msg,String headId,String url,String param,PTMessageBS messageBS);
	//============拟稿环节，提交需要触发的操作=====================
	/**
	 * 根据处理单id，修改处理单状态为审批中  ZcczCommon常量定义中有处理单状态
	 * 根据工作流程返回的流程id，设置处理单的流程id
	 * @param headId 处理单id
	 * @param lcid 流程id
	 * 资产处置投资方案信息表CZ_CZTZFA_XX
	 */
	public void updateHeadInfo(String headId,String lcid);
	
	/**
	 * 点击提交时，根据处理单id修改处理单状态为审批中
	 * @param cldId 处理单id
	 * 资产处置投资方案信息表CZ_CZTZFA_XX
	 */
	public void modifyHeadStateSpz(String cldId);
	
	/**
	 * 根据处理单id，修改处置资产信息CZ_ZC_XX表中状态为审批中，同时修改相应的资产状态处置中
	 * @param cldId
	 */
	public void modifyBodyStateSpz(String cldId);

	
	//============拟稿环节，作废流程需要触发的操作=====================	
	/**
	 * 流程作废，需要修改处置资产信息CZ_ZC_XX表中状态为流程作废
	 * 根据处置资产类别，修改相应资产状态为未处置
	 * @param cldId
	 */
	public void modifyBodyStateWcz(String cldId);	
	
	//============项目受理环节，点击合规审查办理需要触发的操作======================	
	/**
	 * 根据处理单id，在资产处置投资方案信息表CZ_CZTZFA_XX中把合规审查次数HGSCCS加1后进行保存
	 * @param cldId
	 */
	public void addCheckCount(String cldId);	
	
	//============合规审查环节，提交最终意见流转到会议组织环节需要触发的操作======================	
	/**
	 * 根据处理单id，查询出相关的处理单信息，根据处理单的信息在处置投资项目信息临时表CZ_XMXX_LSB中插入一条新的记录
	 * @param cldId 处理单id
	 * copy属性有：编号、处置项目名称、汇报人（拟稿人）、汇报人姓名（拟稿人姓名）、状态（null）、
	 * 分类（ZcczCommon中定义有经营性固产处置）、受理序号、申报日期、处理单Id
	 */
	public void copyPropertieToXmxxLsb(String cldId);
	
	
	//============合规审查环节如果退回处理单，发到项目受理环节需要触发的操作======================	
	/**
	 * 根据处理单id查询出数据库中的记录oldValue，新复制一份处理单信息newValue
	 * 设置newValue的id为null，处理单的状态为被退回ZcczCommon.FORM_BE_RETURN 3，初始处理单id为oldValue的id,进行数据保存
	 * 设置oldValue的发办理时间为空，上次资产处置方案信息ID为newValue的id，进行数据更新
	 * @param cldId 处理单id
	 */
	public String copyHeadHistory(String cldId);	
	
	//根据处理单id清除合规审查意见
	public void deleteHgscByCldId(String cldId);

	/**
	 * 拷贝一份body到history
	 * @param cldId
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void copyBodysHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException;
	
	//============合规审查环节如果退回处理单，发到会议组织环节需要触发的操作======================	
	/**
	 * 根据处置项目临时表的id，修改项目的状态为未上会
	 * @param cldId 处理单id
	 */
	
	public void updateXmxxLsbState(String cldId);
	
  	//============汇总审批意见流程结束，部门领导审核环节点击审核完毕按钮======================	
	//            或者业务运营组处理环节点击审核完毕按钮触发操作
	/**
	 * 根据处理单id，修改处置资产信息CZ_ZC_XX表中状态为已审批
	 * 如果项目审批通过，修改相应的资产状态处置执行中
	 * 如果项目未通过，修改资产状态为未处置
	 * @param cldId
	 */
	
	public void modifyBodyStateYsp(String cldId);
	
	/**
	 * 如果处置项目审批通过
	 * 把处置投资项目信息临时表CZ_XMXX_LSB中的信息拷贝到处置项目信息表CZ_XM_XX表中
	 * 同时设置CZ_XM_XX表中的状态为0：处置方案未执行
	 * @param czXmxxLsb
	 */
	public void copyItemInfo(CzXmxxLsb czXmxxLsb);

	/**
	 * 合规审查结束后给所有审批委员发消息（打开就是处理单页面）
	 * 先到表P_T_USER_L_ROLE中找出所有ROLE_ID＝142L的记录的USER_ID字段集合
	 * 对于每一个USER_ID在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					USER_ID
	 * MESSAGE					"项目上会材料"
	 * URL						"zccz/assetDealHead_modifyHead.do?head.id=" + CldId
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param cldId ：CZ_CZTZFA_XX.id
	 */	
	public void zcczMessageToAllSpwy(String cldId,Long currentUserId);
	
	//拷贝合规性审查意见
	public void cloneHgxscToHistory(String cldId, String historyCldId) throws IllegalAccessException, InvocationTargetException;
	
	//拷贝临时表里面的数据到项目信息表了面去做跟踪	
	public void cloneXmLsbToXm(String cldId) throws IllegalAccessException, InvocationTargetException ;
	
	//资产处置报废是释放编号
	public void realseZcczBianhao(String cldId);
	
	public void modifyTablesZCZT(String cldId, String status);
}
