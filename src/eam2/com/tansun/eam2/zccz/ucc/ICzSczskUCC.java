package com.tansun.eam2.zccz.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface ICzSczskUCC {
    //模糊查询
	public String save(CommonBO commonBO);
	public String delete(CommonBO commonBO);
	public String update(CommonBO commonBO);
	public CommonBO findById(Class cls,String id);
	public List<CzSczsk> getCzSczskByCondition(CzSczsk czSczsk);
	//根据数据类型 查找修改前的  数据类型，1修改前
	public List<CzSczskBdxx> getCzSczskBdxxBycldId(String cldId);
	public List<CzSczskLsb> getCzSczskByDataType(CzSczskLsb lsb,String dataType,String headId);
	
	public CzSczskLsb getSingle(String id);

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
	
	
	/**
	 * 删除信息 只是更改
	 * @param lsb
	 */
	public void deleteXm(CzSczskLsb lsb);

}
