package com.tansun.eam2.hkgl.service;

import java.io.IOException;

import com.tansun.eam2.common.model.orm.bo.BizBackCashInfo;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmBody;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmHead;

/**
 * 回款管理
 * 
 * @author 陈煜霄
 * @date 2011-03-04
 */
public interface IHkglBS {

	/**
	 * 保存回款表头
	 * 
	 * @param head
	 */
	public void saveHead(BizBackCashInfo head);

	/**
	 * 修改回款表头
	 * 
	 * @param head
	 */
	public void updateHead(BizBackCashInfo head);

	/**
	 * 保存确认单表头
	 * 
	 * @param confirmHead
	 */
	public void saveConfirmHead(BizBackConfirmHead confirmHead);

	/**
	 * 通过回款表单id查找回款表单信息
	 * 
	 * @param headId
	 * @return
	 */
	public BizBackCashInfo findHeadByHeadId(String headId);

	/**
	 * 通过回款表头id和确认人编号查找确认表头信息
	 * 
	 * @param headId
	 * @param qrrbh
	 * @return
	 */
	public BizBackConfirmHead findConfirmHeadByHeadIdandUserCode(String headId,
			String qrrbh);

	/**
	 * 通过confirmHeadId查找confirmBody信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmBodyByConfirmHeadId(String confirmHeadId,
			String type, String qrrbh);

	/**
	 * 将处置项目保存到confirmBody里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveCZtoConfirmBody(String headId, String ids);

	/**
	 * 将清算信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveQStoConfirmBody(String headId, String ids);

	/**
	 * 将债券信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveZQtoConfirmBody(String headId, String ids);

	/**
	 * 将实体信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 * @param stlx
	 */
	public void saveSTtoConfirmBody(String headId, String ids, String stlx);

	/**
	 * 将其他信息保存到body里面
	 * 
	 * @param confirmBody
	 */
	public void saveQTtoConfirmBody(BizBackConfirmBody confirmBody);

	/**
	 * 根据确认表体id删除确认信息
	 * 
	 * @param ids
	 */
	public void deleteConfirmBody(String ids, String confirmHeadId);

	/**
	 * 修改处置项目表体信息
	 * 
	 * @param czSfwb
	 * @param czCzsr
	 * @param czYkczfy
	 * @param czFycpje
	 * @param czCpqr
	 * @param czSfjs
	 * @param id
	 */
	public void updateCZtoConfirmBody(String czSfwb, String czCzsr,
			String czYkczfy, String czFycpje, String czCpqr, String czSfjs,
			String id);

	/**
	 * 修改债券表体信息
	 * 
	 * @param zqHszjxz
	 * @param zqDyyz
	 * @param zqHxsr
	 * @param zqHxfy
	 * @param zqHswb
	 * @param zaLxhsje
	 * @param zqLxqj
	 * @param id
	 */
	public void updateZQtoConfirmBody(String zqHszjxz, String zqDyyz,
			String zqHxsr, String zqHxfy, String zqHswb, String zaLxhsje,
			String zqLxqj, String id);

	/**
	 * 修改实体表体信息
	 * 
	 * @param gqHkxz
	 * @param gqQlzt
	 * @param gqHsxjje
	 * @param id
	 */
	public void updateSTtoConfirmBody(String gqHkxz, String gqQlzt,
			String gqHsxjje, String id);

	/**
	 * 修改其他表体信息
	 * 
	 * @param confirmBody
	 */
	public void updateQTtoConfirmBody(BizBackConfirmBody confirmBody);

	/**
	 * 确认表体
	 * 
	 * @param ids
	 */
	public void confirmThisBody(String ids);

	/**
	 * 查找部门内的确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmInfoInDept(String headId, String qrbmbh);

	/**
	 * 查找出了部门以后的确认信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmInfoOutDept(String headId);

	/**
	 * 查看该回款在该部门是否已经有最终确认的回款
	 * 
	 * @param headId
	 * @param qrbmbh
	 * @return
	 */
	public String checkDeptEnd(String headId, String qrbmbh,
			String confirmHeadId, String fzrbh, String fzrmc);

	/**
	 * 办结时候的处理
	 * 
	 * @param id
	 * @param lx
	 * @return
	 */
	public void doOver(String id, String lx, String headId);

	/**
	 * 取消部门确认
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmDept(String confirmHeadId);

	/**
	 * 确定为最终回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String checkOutDeptEnd(String confirmHeadId, String headId);

	/**
	 * 取消确认为最终回款
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmOutDept(String confirmHeadId);

	/**
	 * 查找其他的表体
	 * 
	 * @return
	 */
	public BizBackConfirmBody findConfirmBodyByConfirmHeadIdQT(
			String confirmHeadId);

	/**
	 * 填写确认单时候的验证
	 * 
	 * @param confirmHeadId
	 * @param qrdlx
	 * @return
	 */
	public String checkBodyByLx(String confirmHeadId, String qrdlx);

}
