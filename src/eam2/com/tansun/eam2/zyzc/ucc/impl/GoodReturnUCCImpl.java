package com.tansun.eam2.zyzc.ucc.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.zyzc.service.GoodReturnBS;
import com.tansun.eam2.zyzc.ucc.GoodReturnUCC;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class GoodReturnUCCImpl implements GoodReturnUCC {

	@Autowired
	private GoodReturnBS goodReturnBSImpl;

	/**
	 * 自用资产资产归还查询
	 * 
	 * @param queryPurVo
	 * @param paginator
	 * @return
	 */
	public String queryReturn(QueryPurchaseVo queryPurVo, Paginator paginator) {
		return goodReturnBSImpl.queryReturn(queryPurVo, paginator);
	}

	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl() {
		return goodReturnBSImpl.findYjFl();
	}

}
