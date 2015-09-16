package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface ICzSczskBS {
	public String save(CommonBO commonBO);
	public String delete(CommonBO commonBO);
	public String update(CommonBO commonBO); 
	public CommonBO findById(Class cls,String id);
	public List<CzSczsk> getCzSczskByCondition(CzSczsk czSczsk);
	public List<CzSczskLsb> getCzSczskByDataType(CzSczskLsb lsb,String dataType,String headId);
	public CzSczskLsb getSingle(String id);
	public List<CzSczskBdxx> getCzSczskBdxxBycldId(String cldId);
	public void CopyCzSczsk(String cldId);
	/**
	 * 保存变动信息
	 * @param czSczskBdxx
	 */
	public void saveCzSczskBdxx(CzSczskBdxx czSczskBdxx);
	
	/**
	 * 保存变动信息
	 * @param czSczskBdxx
	 */
	public void updatCzSczskBdxx(CzSczskBdxx czSczskBdxx);
	
	
	public void deleteXm(CzSczskLsb lsb);

}
