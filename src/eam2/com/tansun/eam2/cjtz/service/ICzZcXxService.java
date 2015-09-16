package com.tansun.eam2.cjtz.service;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;

public interface ICzZcXxService extends ICommonBS {

	public List<CzZcXx> getListByCzCztzfaXxId(String czCztzfaXxId);
	
	public List<Map<String,Object>> getEjfhListByJbhKey(String jbhKey);
	
	public PTDeptBO getDeptByCode(String code);
	
	public List<CzZcXx> findCzzcxxByCldId(String cldId);
	
	public String getStlxByStid(String stid);
}
