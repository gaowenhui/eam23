package com.tansun.eam2.zyzc.ucc;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.util.Paginator;

public interface GoodReturnUCC {

	/**
	 * 自用资产资产归还查询
	 * 
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	public String queryReturn(QueryPurchaseVo queryPurVo, Paginator paginator);

	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl();

}
