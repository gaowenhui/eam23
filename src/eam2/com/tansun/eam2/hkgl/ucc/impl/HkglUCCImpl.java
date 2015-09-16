package com.tansun.eam2.hkgl.ucc.impl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.BizBackCashInfo;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmBody;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmHead;
import com.tansun.eam2.hkgl.service.IHkglBS;
import com.tansun.eam2.hkgl.ucc.IHkglUCC;

/**
 * 回款管理
 * 
 * @author 陈煜霄
 * @date 2011-03-04
 */
@Service
public class HkglUCCImpl implements IHkglUCC {

	@Autowired
	private IHkglBS hkglBSImpl;

	/**
	 * 保存回款表头
	 * 
	 * @param head
	 */
	public void saveHead(BizBackCashInfo head) {
		hkglBSImpl.saveHead(head);
	}

	/**
	 * 修改回款表头
	 * 
	 * @param head
	 */
	public void updateHead(BizBackCashInfo head) {
		hkglBSImpl.updateHead(head);
	}

	/**
	 * 保存确认单表头
	 * 
	 * @param confirmHead
	 */
	public void saveConfirmHead(BizBackConfirmHead confirmHead) {
		hkglBSImpl.saveConfirmHead(confirmHead);
	}

	/**
	 * 通过回款表单id查找回款表单信息
	 * 
	 * @param headId
	 * @return
	 */
	public BizBackCashInfo findHeadByHeadId(String headId) {
		return hkglBSImpl.findHeadByHeadId(headId);
	}

	/**
	 * 通过回款表头id和确认人编号查找确认表头信息
	 * 
	 * @param headId
	 * @param qrrbh
	 * @return
	 */
	public BizBackConfirmHead findConfirmHeadByHeadIdandUserCode(String headId,
			String qrrbh) {
		return hkglBSImpl.findConfirmHeadByHeadIdandUserCode(headId, qrrbh);
	}

	/**
	 * 通过confirmHeadId查找confirmBody信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmBodyByConfirmHeadId(String confirmHeadId,
			String type, String qrrbh) {
		return hkglBSImpl.findConfirmBodyByConfirmHeadId(confirmHeadId, type,
				qrrbh);
	}

	/**
	 * 将处置项目保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveCZtoConfirmBody(String headId, String ids) {
		hkglBSImpl.saveCZtoConfirmBody(headId, ids);
	}

	/**
	 * 将清算信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveQStoConfirmBody(String headId, String ids) {
		hkglBSImpl.saveQStoConfirmBody(headId, ids);
	}

	/**
	 * 将债券信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveZQtoConfirmBody(String headId, String ids) {
		hkglBSImpl.saveZQtoConfirmBody(headId, ids);
	}

	/**
	 * 将实体信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 * @param stlx
	 */
	public void saveSTtoConfirmBody(String headId, String ids, String stlx) {
		hkglBSImpl.saveSTtoConfirmBody(headId, ids, stlx);
	}

	/**
	 * 将其他信息保存到body里面
	 * 
	 * @param confirmBody
	 */
	public void saveQTtoConfirmBody(BizBackConfirmBody confirmBody) {
		hkglBSImpl.saveQTtoConfirmBody(confirmBody);
	}

	/**
	 * 根据确认表体id删除确认信息
	 * 
	 * @param ids
	 */
	public void deleteConfirmBody(String ids, String confirmHeadId) {
		hkglBSImpl.deleteConfirmBody(ids, confirmHeadId);
	}

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
			String id) {
		hkglBSImpl.updateCZtoConfirmBody(czSfwb, czCzsr, czYkczfy, czFycpje,
				czCpqr, czSfjs, id);
	}

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
			String zqLxqj, String id) {
		hkglBSImpl.updateZQtoConfirmBody(zqHszjxz, zqDyyz, zqHxsr, zqHxfy,
				zqHswb, zaLxhsje, zqLxqj, id);
	}

	/**
	 * 修改实体表体信息
	 * 
	 * @param gqHkxz
	 * @param gqQlzt
	 * @param gqHsxjje
	 * @param id
	 */
	public void updateSTtoConfirmBody(String gqHkxz, String gqQlzt,
			String gqHsxjje, String id) {
		hkglBSImpl.updateSTtoConfirmBody(gqHkxz, gqQlzt, gqHsxjje, id);
	}

	/**
	 * 修改其他表体信息
	 * 
	 * @param confirmBody
	 */
	public void updateQTtoConfirmBody(BizBackConfirmBody confirmBody) {
		hkglBSImpl.updateQTtoConfirmBody(confirmBody);
	}

	/**
	 * 确认表体
	 * 
	 * @param ids
	 */
	public void confirmThisBody(String ids) {
		hkglBSImpl.confirmThisBody(ids);
	}

	/**
	 * 查找部门内的确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmInfoInDept(String headId, String qrbmbh) {
		return hkglBSImpl.findConfirmInfoInDept(headId, qrbmbh);
	}

	/**
	 * 查找出了部门以后的确认信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmInfoOutDept(String headId) {
		return hkglBSImpl.findConfirmInfoOutDept(headId);
	}

	/**
	 * 查看该回款在该部门是否已经有最终确认的回款
	 * 
	 * @param headId
	 * @param qrbmbh
	 * @return
	 */
	public String checkDeptEnd(String headId, String qrbmbh,
			String confirmHeadId, String fzrbh, String fzrmc) {
		return hkglBSImpl.checkDeptEnd(headId, qrbmbh, confirmHeadId, fzrbh,
				fzrmc);
	}

	/**
	 * 办结时候的处理
	 * 
	 * @param id
	 * @param lx
	 * @return
	 */
	public void doOver(String id, String lx, String headId) {
		hkglBSImpl.doOver(id, lx, headId);
	}

	/**
	 * 取消部门确认
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmDept(String confirmHeadId) {
		return hkglBSImpl.cancleConfirmDept(confirmHeadId);
	}

	/**
	 * 确定为最终回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String checkOutDeptEnd(String confirmHeadId, String headId) {
		return hkglBSImpl.checkOutDeptEnd(confirmHeadId, headId);
	}

	/**
	 * 取消确认为最终回款
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmOutDept(String confirmHeadId) {
		return hkglBSImpl.cancleConfirmOutDept(confirmHeadId);
	}

	/**
	 * 查找其他的表体
	 * 
	 * @return
	 */
	public BizBackConfirmBody findConfirmBodyByConfirmHeadIdQT(
			String confirmHeadId) {
		return hkglBSImpl.findConfirmBodyByConfirmHeadIdQT(confirmHeadId);
	}

	/**
	 * 填写确认单时候的验证
	 * 
	 * @param confirmHeadId
	 * @param qrdlx
	 * @return
	 */
	public String checkBodyByLx(String confirmHeadId, String qrdlx) {
		return hkglBSImpl.checkBodyByLx(confirmHeadId, qrdlx);
	}

}
