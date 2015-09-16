package com.tansun.eam2.jiekou.erp.ucc;

import com.tansun.eam2.common.model.orm.bo.CaShead;

public interface IERPCommonUCC {

	/**
	 * 根据表单id 表单类型，生成card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String creatBook4Card(CaShead head);

	/**
	 * 根据表单id 变动类型，更新card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String updateBook4Card(CaShead head);

	/**
	 * 根据表单id 生成台账
	 * @param headId
	 * @return
	 */
	public String book4CardById(String headId);

}
