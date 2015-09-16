package com.tansun.eam2.zyzc.service;

import com.tansun.eam2.common.model.orm.bo.ZyZc;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ZCDetailBS {
	
	/**
	 * 根据资产id查询资产信息
	 * @param zid
	 * @return
	 */
	public ZyZc readZC(String zid);
}
