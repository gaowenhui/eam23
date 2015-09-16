package com.tansun.eam2.zyzc.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ToCheckBodyUCC {

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
	
//	public List<ZyPdxx> findPdxx(QueryPurchaseVo queryPurchaseVo);
}
