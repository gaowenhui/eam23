package com.tansun.eam2.zyzc.service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ToCheckBodyBS {
	
	/**
	 * 保存页面的盘点信息，有插入，也有修改
	 * @return
	 */
	public void saveBody(ZyPdxx zyPdxx);
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID);
}
