package com.tansun.eam2.cjtz.ucc;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.CzZcXx;

public interface ICzZcXxUCC {

	public List<CzZcXx> getCzZcXxListByCzCztzfaXxId(String czCztzfaXxId);
	
	public Map<String,String> getJbhMap();
	
	public String getEjfhListByJbhKeys(String jbhKeys);
	
	public String getCzZcXxJsonByZcId(String azcid);
}
