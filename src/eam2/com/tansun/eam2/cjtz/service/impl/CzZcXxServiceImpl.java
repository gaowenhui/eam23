package com.tansun.eam2.cjtz.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.cjtz.service.ICzZcXxService;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;

@Repository
public class CzZcXxServiceImpl extends CommonBSImpl implements ICzZcXxService {
	@Autowired
	private PublicDao publicDao;
	

	@SuppressWarnings("unchecked")
	public List<CzZcXx> getListByCzCztzfaXxId(String czCztzfaXxId){
		return (List<CzZcXx>)publicDao.find("from CzZcXx o where o.cldId='" + czCztzfaXxId + "'");
	}

	public List<Map<String, Object>> getEjfhListByJbhKey(String jbhKey) {
		Map<String,String> ejfhMap = new LinkedHashMap<String, String>();
		StringBuffer hql = new StringBuffer().append("SELECT T.CODE,T.NAME FROM DIC_APP_ASSET_STATE T ")
				.append(" WHERE T.TYPE='fenhang' ");
			hql.append(" AND SUBSTR(T.CODE,0,3) = '" + jbhKey +"'" );
		hql.append(" ORDER BY NLSSORT(T.NAME,'NLS_SORT=SCHINESE_PINYIN_M')");
	    List<Map<String,Object>> list = this.publicDao.queryForList(hql.toString(), new ArrayList());
		return list;
	}

	public PTDeptBO getDeptByCode(String code) {
		return (PTDeptBO)publicDao.findSingleResult("from PTDeptBO o where o.deptCode=?", new String[]{code});
	}

	@SuppressWarnings("unchecked")
	public List<CzZcXx> findCzzcxxByCldId(String cldId) {
		return (List<CzZcXx>)publicDao.find("from CzZcXx o where o.cldId='" + cldId + "'");
	}

	public String getStlxByStid(String stid) {
		List<Map<String,Object>> resultList = publicDao.queryForList("select STLX from ST_JBXX where ID=?", new String[]{stid});
		Map<String,Object> resultMap = null;
		String resultStr = "";
		if(resultList != null)
			resultMap = resultList.get(0);
		if(resultMap != null)
			resultStr = (String)resultMap.get("STLX");
		return resultStr;
	}
}
