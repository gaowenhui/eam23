package com.tansun.eam2.common.commonService;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface ICommonBS {
	
	/**
	 * 保存一对象
	 * @param commonBO 操作对象
	 */
	public void save(CommonBO commonBO);

	/**
	 * 修改一对象
	 * @param commonBO 操作对象
	 */
	public void update(CommonBO commonBO);
	
	/**
	 * 删除一对象
	 * @param commonBO 操作对象
	 */
	public void delete(CommonBO commonBO);
	
	/**
	 * 保存或删除对象
	 * @param commonBO 操作对象
	 */	
	public void saveOrUpdate(CommonBO commonBO);
	
	/**
	 * 根据id查询出
	 * @param id
	 */	
	public CommonBO findById(Class cls,String id);
}
