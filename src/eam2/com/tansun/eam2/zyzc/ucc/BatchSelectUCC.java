package com.tansun.eam2.zyzc.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

public interface BatchSelectUCC {

	public List<ZyPdxx> subPageQueryWithCondition(ZyPdxx zyPdxx);
}
