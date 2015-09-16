package com.tansun.eam2.zyzc.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.ZCDetailBS;
import com.tansun.eam2.zyzc.ucc.ZCDetailUCC;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
@Service
public class ZCDetailUCCImpl implements ZCDetailUCC{
	
	@Autowired
	private ZCDetailBS zCDetailBS;
	
	/**
	 * 根据资产id查询资产信息
	 * @param zid
	 * @return
	 */
	public ZyZc readZC(String zid){
		return zCDetailBS.readZC(zid);
	}
}
