package com.tansun.eam2.ssgl.ucc;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.vo.SsBaseinfoQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

public interface ISsglUCC {

	void save(SsBaseinfo ssBaseinfo);

	SsBaseinfo getSsById(String id);

	List<SsBaseinfo> getSsList();

	List<SsBaseinfo> getSsList2(Paginator paginator,
			SsBaseinfoQueryVO ssBaseinfoQueryVO);

	void delete(String id);

	void saveroc(SsProc ssproc);

	SsProc getSsprocById(String id);

	SsProc getSsprocById2(String id, String type);

	void update(SsBaseinfo ssBaseinfo) throws IllegalAccessException, InvocationTargetException;

	void updatePro(SsProc ssproc);

	List<SsBaseinfo> getSsBaseinfoByzcId(String zcId);

	public Code findCodeDetail(String codeType, String codeKey);

	public Map<String, String> findCityCodeDetail(String id);

	public void saveSSchangeInfo(SsBaseinfo ssBaseinfo_old,SsBaseinfo ssBaseinfo_new,String opType);

	public void saveSSchangePro(SsProc ssproc_old, SsProc ssproc_new,String opType,String sheet);
	/**
	 * 根据资产临时表ID 找到相应诉讼信息
	 * @param zcId
	 * @param paginator
	 * @return
	 */
	List<SsBaseinfo> getSsBaseinfoByzcLsbId(String zcId,Paginator paginator);
	/**
	 * 根据正式表资产ID 查找对应的诉讼信息
	 * @param zcZsbId
	 * @param paginator
	 * @return
	 */
	List<SsBaseinfo> getSsBaseinfoByzcZsbId(String zcZsbId,Paginator paginator);

	String getDjsmcById(String strID);
}
