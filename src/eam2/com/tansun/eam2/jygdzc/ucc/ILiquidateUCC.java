package com.tansun.eam2.jygdzc.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 清算管理所设计的UCC接口定义
 * @author Administrator
 *
 */
public interface ILiquidateUCC {
	/**
	 * 根据给定的清算表头ID,从JYZC_HTQC_BODY表中检索出数据出来.
	 * 需要考虑分页参数
	 * @param headid	表头ID
	 * @param paginator	标准分页参数
	 * @return
	 */
	public List<JyzcHtqsBody> getBodyListByHeadId(String headid,Paginator paginator); 

	/**
	 * 保存一个body对象
	 * @param body
	 */
	public void saveBody (JyzcHtqsBody body);
	
	/**
	 * 删除一个body对象
	 * @param body
	 */
	public void deleteBody (JyzcHtqsBody body);

	public void updateContractAfterApproval(String headId);

	/**
	 * 相关流程
	 * @param headId
	 * @return
	 */
	public String findXglc(String headId);
	
	
	
}
