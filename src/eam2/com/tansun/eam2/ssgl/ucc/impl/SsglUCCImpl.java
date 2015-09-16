package com.tansun.eam2.ssgl.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.service.ISsglBS;
import com.tansun.eam2.ssgl.ucc.ISsglUCC;
import com.tansun.eam2.ssgl.vo.SsBaseinfoQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class SsglUCCImpl implements ISsglUCC {

	@Autowired
	private ISsglBS ssglBSImpl;

	public SsBaseinfo getSsById(String id) {
		return ssglBSImpl.getSsById(id);
	}

	public List<SsBaseinfo> getSsList() {
		
		return ssglBSImpl.getSsList();
	}

	public void save(SsBaseinfo ssBaseinfo) {
		ssglBSImpl.save(ssBaseinfo);

	}

	public List<SsBaseinfo> getSsList2(Paginator paginator,
			SsBaseinfoQueryVO ssBaseinfoQueryVO) {
		return ssglBSImpl.getSsList2(paginator, ssBaseinfoQueryVO);
	}

	public void delete(String id) {
		ssglBSImpl.delete(id);
	}

	public void saveroc(SsProc ssproc) {
		ssglBSImpl.savepro(ssproc);

	}

	public SsProc getSsprocById(String id) {
		
		return ssglBSImpl.getSsprocById(id);
	}

	public SsProc getSsprocById2(String id, String type) {
		
		return ssglBSImpl.getSsprocById2(id, type);
	}

	public void update(SsBaseinfo ssBaseinfo) throws IllegalAccessException, InvocationTargetException {
		ssglBSImpl.update(ssBaseinfo);
	}

	public void updatePro(SsProc ssproc) {
		ssglBSImpl.updatePro(ssproc);

	}

	public List<SsBaseinfo> getSsBaseinfoByzcId(String zcId) {
		
		return ssglBSImpl.getSsBaseinfoByzcId(zcId);
	}

	public Code findCodeDetail(String codeType, String codeKey) {
		return ssglBSImpl.findCodeDetail(codeType, codeKey);
	}

	public Map<String, String> findCityCodeDetail(String id) {
		return ssglBSImpl.findCityCodeDetail(id);
	}

	public void saveSSchangeInfo(SsBaseinfo ssBaseinfo_old,
			SsBaseinfo ssBaseinfo_new,String opType) {
		ssglBSImpl.saveSSchangeInfo(ssBaseinfo_old,ssBaseinfo_new,opType );
		
	}

	public void saveSSchangePro(SsProc ssproc_old, SsProc ssproc_new,String opType,String sheet) {
		ssglBSImpl.saveSSchangePro(ssproc_old, ssproc_new,opType, sheet);
	}

	public List<SsBaseinfo> getSsBaseinfoByzcLsbId(String zcId,
			Paginator paginator) {
		
		return ssglBSImpl.getSsBaseinfoByzcLsbId(zcId, paginator);
	}

	public List<SsBaseinfo> getSsBaseinfoByzcZsbId(String zcZsbId,
			Paginator paginator) {
		
		return ssglBSImpl.getSsBaseinfoByzcZsbId(zcZsbId, paginator);
	}

	public String getDjsmcById(String strID) {
		
		return ssglBSImpl.getDjsmcById(strID);
	}
}
