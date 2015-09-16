package com.tansun.eam2.zyzc.ucc.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.ToCheckBodyBS;
import com.tansun.eam2.zyzc.ucc.ToCheckBodyUCC;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
@Service
public class ToCheckBodyUCCImpl implements ToCheckBodyUCC{

	@Autowired
	ToCheckBodyBS toCheckBodyBS;
	
	/**
	 * 保存页面的盘点信息，有插入，也有修改
	 * @return
	 */
	public void saveBody(ZyPdxx zyPdxx) {
		toCheckBodyBS.saveBody(zyPdxx);
	}
	
	/**
	 * 根据页面的盘点信息ID得到盘点详细信息
	 * @return
	 */
	public ZyPdxx modifyBody(String zyPdID){
		return toCheckBodyBS.modifyBody(zyPdID);
	}
}
