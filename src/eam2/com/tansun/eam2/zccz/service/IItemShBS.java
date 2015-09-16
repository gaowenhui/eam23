package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface IItemShBS extends ICommonBS{

	public List<CzZcXx> findCzzcByCldId(String cldId);
	public void updateCzXmxxLsbById(String id);
	public List<CzXmSpwYj> findYjByItemId(String id);
	
	/**
	 * 根据处理单id在处置投资项目信息临时表CZ_XMXX_LSB中查询出主键id
	 * @param cldId
	 * @return
	 * TODO
	 */
	public String findItemIdByCldId(String cldId);
	
	public CommonBO getHeadByIdAndFeilei(String cldId, String feilei);
	
	public void deleteYjByItemId(String itemId);
	
	public int getTzwyCount();
}
