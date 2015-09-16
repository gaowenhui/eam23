package com.tansun.eam2.jygdzc.service;

import java.util.*;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.*;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * ILiquidateBS定义了合同清算时所需要的后台服务访问接口
 * @author 刘峻松
 *
 */
public interface ILiquidateBS extends ICommonBS{
	
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
