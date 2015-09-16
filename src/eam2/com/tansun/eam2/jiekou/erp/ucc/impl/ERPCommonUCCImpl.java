package com.tansun.eam2.jiekou.erp.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.service.IERPCommonBS;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
@Service
public class ERPCommonUCCImpl implements IERPCommonUCC {

	@Autowired
	private IERPCommonBS commonBS;
	/**
	 * 根据表单id 表单类型，生成card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String creatBook4Card(CaShead head){
		return commonBS.creatBook4Card(head);
	}

	/**
	 * 根据表单id 变动类型，更新card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String updateBook4Card(CaShead head){
		return commonBS.updateBook4Card(head);
	}
	
	/**
	 * 根据表单id 生成台账
	 * @param headId
	 * @return
	 */
	public String book4CardById(String headId){
		return commonBS.book4CardById(headId);
	}
}
