package com.tansun.eam2.zccz.service;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public interface ZcczWfBS extends ICommonBS {

	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表
	 * 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * @param hyId
	 * @return Map<"处理单id",List<"审批委员Id">>
	 */
	public Map<String,List<String>> getAllShenpiWeiyuan(String hyId);
	
	//=====================判断会议中的所有项目的所有审批委员是否都提交意见===================================================
	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表
	 * 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 如果说有的审批委员都已经提交审批意见(字段SFTJSPYJ)return true;否则return false
	 * @param hyId
	 * @return Map<项目名称,List<委员名称>>
	 */
	public Map<String,List<String>> isAllXmSubmit(String hyId);
	
	/**
	 * 返回一个会议内的所有项目的处理单id和意见汇总人id
	 * 表CZ_XMXX_LSB
	 * @param hyId
	 * @return	Map<处理单id,意见汇总人id>
	 */
	public Map<String,String> getAllcldIdInHy(String hyId);
	
  	//============汇总审批意见流程结束，部门领导审核环节点击审核完毕按钮======================	
	//            或者业务运营组处理环节点击审核完毕按钮触发操作
	
	/**
	 * 如果处置项目审批通过
	 * 把处置投资项目信息临时表CZ_XMXX_LSB中的信息拷贝到处置项目信息表CZ_XM_XX表中
	 * 同时设置CZ_XM_XX表中的状态为0：处置方案未执行
	 * @param czXmxxLsb
	 */
	public void copyItemInfo(CzXmxxLsb czXmxxLsb);
	
	/**
	 * 向审批委员发送待办
	 * 根据会议id找到会议对象（表CZ_HYXX）
	 * 根据会议Id到表CZ_XMXX_LSB中找到所有项目
	 * 再通过项目中的项目id到表CZ_XM_SPW_YJ中找到所有的审批委员信息
	 * 会议－－－（多个）－－－项目－－－－（多个）－－－委员
	 * 每个委员在待办表（P_T_TODO）中新建一条记录，将以下信息拷贝到新建的待办中
	 * 待办所属用户ID------>委员id（CZ_XM_SPW_YJ.SPWY）
		待办发送人Id-------->currentUser.tid
		表单类型-------------"CZ_XM_SPW_YJ"
		标题-----------------会议次数（CZ_HYXX.HYCS）
		拟稿人Id-------->currentUser.tid
		拟稿日期-------->new Date()
		创建日期-------->new Date()
		访问URL--------->"zccz/dealToDo_czxm4Shyj.do?hyId=hyId&todoId=id"(CZ_HYXX.ID,待办id)
		所属子系统------>"zccz"
		待办状态——0:已删除，1:有效,---"1"
		0：未读，1：已读-------------"0"
		其它全部为空
	 * @param hyId
	 */
	public void sendSpwySpdb(String hyId, PTUserBO currentUser);
	
	/**
	 * 根据会议id给本次会议内所有未提交意见的审批委员发送消息
	 * 到表CZ_HYXX中找到CZ_HYXX.id=hyId 的记录
	 * 到表CZ_XMXX_LSB中找到所有CZ_XMXX_LSB.ID WHERE CZ_XMXX_LSB.HY_ID=hyId的记录
	 * 再通过CZ_XMXX_LSB.ID到表CZ_XM_SPW_YJ找到所有CZ_XM_SPW_YJ.XM_ID=CZ_XMXX_LSB.ID AND CZ_XM_SPW_YJ.SFTJSPYJ="0"的记录
	 * 对于每条记录在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					Long.parseLong(CZ_XM_SPW_YJ.SPWY)
	 * MESSAGE					"项目上会材料：请提交" + CZ_HYXX.HYCS + "项目审批意见"
	 * URL						"zccz/dealToDo_czxm4Shyj.do?hyId=hyId&todoId=id"(CZ_HYXX.ID,待办id)
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param hyId ：CZ_HYXX.id
	 */	
	public void sendSpwyMessage(String hyId, String currentUserId);
	
	/**
	 * 根据会议id取得会议里面所有的项目对应的流程Id	。
	 * 1个会议对应多个项目
	 * 根据会议Id到表CZ_XMXX_LSB中找到项目
	 * 再通过项目中的处理单id（字段：CLD_ID）到表CZ_STCZTZ中找到对应的流程id（字段LC_ID）
	 * @param hyId 会议id 
	 * return List<流程Id>
	 */
	public List<String> getStztczStayazLcIdInHy(String hyId);
	
	/**
	 * 根据会议id取得会议里面所有的项目对应的流程Id	。
	 * 1个会议对应多个项目
	 * 根据会议Id到表CZ_XMXX_LSB中找到项目
	 * 再通过项目中的处理单id（字段：CLD_ID）到表CZ_CZTZFA_XX中找到对应的流程id（字段LCID）
	 * @param hyId 会议id 
	 * return List<流程Id>
	 */
	public List<String> getZcczLcIdInHy(String hyId);	
	
	/**
	 * 将待办信息（表：P_T_TODO）的状态（字段：STATU）改为"0"
	 * 新建已办，根据待办信息设置已办信息表的数据
	 * ID
	 * USER_ID               todo.id
	 * TITLE                 todo.title
	 * DRAFT_USERID          todo.draft_userId
	 * DRAFT_DATE            todo.draftDate
	 * CREATE_DATE           newdate
	 * URL                   "zccz/dealToDo_czxm4Shyj.do"
	 * SUBSYSTEM			 "zccz"
	 * STATU                 "1"
	 * SEND_USERID			 todo.userId
	 * PARAM				 hyId=hyId&todoId=id"
	 * @param todoId
	 */
	public void submitToDo(String todoId);
	
	public void spwyDidToEnd(String hyId);
	
	/**
	 * 添加或修改审批委员信息
	 * @param czXmSpwYj
	 */
	public void saveOrUpdateSpwyYj(CzXmSpwYj czXmSpwYj);
	
	/**
	 * 会议提交的时候要将会议的流程Id保存到会议（表：CZ_HYXX，字段：LC_ID）信息中
	 * @param processInstanceId
	 * @param cldId
	 */
	public void hyDraftSubmit(String processInstanceId, String cldId);
	
	/**
	 * 取得会议里面的所有项目对应的处理单对象
	 * 根据hyId到表CZ_XM_XX找到所有的cldId(即CZ_STCZTZ.id),再到表CZ_STCZTZ中找到所有的对象
	 * @param hyId : CZ_XM_XX.HY_ID
	 * @return Map<意见汇总人,处理单对象>
	 */
	public Map<CzXmxxLsb,CzStcztz> getCzStcztzListInHy(String hyId);
	
	/**
	 * 取得会议里面的所有项目对应的处理单对象
	 * 根据hyId到表CZ_XM_XX找到所有的cldId(即CZ_STCZTZ.id),再到表CZ_CZTZFA_XX中找到所有的对象
	 * @param hyId : CZ_XM_XX.HY_ID
	 * @return
	 */
	public Map<CzXmxxLsb,CzCztzfaXx> getCzCztzfaXxListInHy(String hyId);
	
	/**
	 * 是否本项目(实体整体处置或实体人员安置)所属会议的所有项目都已经结束(CZ_STCZTZ表中的字段CLDZT为已审批)
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回
	 * 如果全部已经结束返回true,否则返回false
	 * @param cldId : CZ_STCZTZ.id
	 * @return
	 */
	public boolean isAllCzStcztzXmIsOver(String cldId);
	
	/**
	 * 是否本项目(资产处置)所属会议的所有项目都已经结束(CZ_CZTZFA_XX表中的字段CLDZT为已审批)
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回
	 * 如果全部已经结束返回true,否则返回false
	 * @param cldId : CZ_CZTZFA_XX.id
	 * @return
	 */
	public boolean isAllCzCztzfaXxXmIsOver(String cldId);
	
	/**
	 * 返回本项目(实体整体处置或实体人员安置)所属会议对象(CzHyxx)
	 * 根据cldId 到表 CZ_XMXX_LSB(字段:CLD_ID) 中找到 HY_ID
	 * 根据HY_ID 到表 CZ_HYXX(字段ID) 中找到会议对象CzHyxx 返回对象
	 * @param cldId : CZ_XMXX_LSB.CLD_ID
	 * @return
	 */
	public CzHyxx getHyxxByCldId(String cldId);
	
	/**
	 * 拟稿提交的时候跟新会议的审批状态和会议里面所有项目的上会状态
	 * 根据cldId 到表CZ_HYXX(字段ID)中找到会议,将字段CZ_HYXX.SPZT改为审批中
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回 4：作废
	 * 再根据cldId(即CZ_HYXX.ID)到表CZ_XMXX_LSB中根据CZ_XMXX_LSB.HY_ID找到所有项目CzHyxx
	 * 将字段CZ_XMXX_LSB.ZHUANGTAI 改为上会中。状态  0：未上会1：上会中2：上会完毕
	 * @param hyId : CZ_HYXX.ID
	 */
	public void updateHyStatuAtDraftSubmit(String hyId);
	
	/**
	 * 会议作废时跟新会议处理单状态，字段（CZ_HYXX.SPZT）改为作废
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回 4：作废
	 * 再将会议涉及的所有项目临时表字段（CZ_XMXX_LSB.ZHUANGTAI）改为未上会
	 * 状态  0：未上会1：上会中2：上会完毕
	 * @param cldId	CZ_HYXX.id
	 */
	public void abandonHy(String hyId);
	
	public CzHyxx getHyById(String hyId);
	
	//会议状态改为上会中
	public void setHyzt_SHZ(String hyId);
	//会议状态改为会议纪要整理中
	public void setHyzt_HYJYZLZ(String hyId);
	//会议状态改为上会完毕
	public void setHyzt_SHWB(String hyId);
	
	public void setXmzt_WSH(String hyId);				//0：未上会
	public void setXmzt_SHZ(String hyId);				//1：上会中
	public void setXmzt_SHWB(String hyId);				//2：上会完毕
	public void setXmzt_WYTJYJZ(String hyId);            	 		//3: 委员提交意见中（发送委员材料后）
	public void setXmzt_WYTJYJZWB(String xmId);    					//4: 委员提交意见完毕（所有的委员提交意见后）
	public void setXmzt_ZCRTJYJZ(String hyId);    		//5: 主持人提交意见中（待办发送到主持人审批环节）
	public void setXmzt_YJHZZ(String hyId); 			//6:意见汇总中	
	
	public boolean isAllYjSubmit(String xmId);	//判断所给项目的所有的审批委员是否全部提交意见
	
	//判断是否会议内所有的项目都已经结束
	public boolean isAllXmIsOverInHy(String hyId);
	
	/**
	 * 拷贝附件
	 * @param ids			附件的ids
	 * @param newbdId		新的表单ID
	 * @param newFileType	新的附件类型
	 */
	public void copyAttach(String[] ids, String newbdId, String newFileType);
	public void copyAttach2(String[] ids, String newbdId, String newFileType);
	/**
	 * 在合规审查退回的时候将合规审查意见拷贝到历史表中
	 * @param cldId
	 * @param newCldId
	 */
	public void updateFileToHistory(String cldId, String newCldId);

	
	public void copyDisposeReport(String cldId, String newCldId);
	
	/**
	 * 合规审查退回时，非最终附件处理
	 * @param cldId
	 * @param newCldId
	 */
	public void updateOtherFileToHistory(String cldId, String newCldId);
	
	/**
	 * 设置最终附件
	 * @param id
	 */
	public void setZzfj(String id);

	
	public void updateHgscDid(String cldId, String taskName, String newCldId);
	
	/**
	 * 保存会议后更新项目的状态为上会,并在项目委员意见表插入主持人信息
	 * @param id
	 */
	public void updateXmZt(String id);	

	public Map<?,?> getHyMapId(String hyId);
	public List findAttachment(String bdid);
}
