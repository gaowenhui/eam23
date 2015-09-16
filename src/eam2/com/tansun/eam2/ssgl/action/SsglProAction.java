package com.tansun.eam2.ssgl.action;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.ucc.ISsglUCC;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class SsglProAction extends CommonAction {
	public SsProc ssproc;
	public List<SsBaseinfo> ssBaseinfoList;
	public Paginator paginator;
	@Autowired
	public ISsglUCC ssglUCCImpl;
	public String id;
	public String type;

	public ISsglUCC getSsglUCCImpl() {
		return ssglUCCImpl;
	}

	public void setSsglUCCImpl(ISsglUCC ssglUCCImpl) {
		this.ssglUCCImpl = ssglUCCImpl;
	}

	public String index() {
		request.setAttribute("ssid", ssproc.getId());
		return "index";
	}

	public String query() {
		return "query";
	}

	public String log() {
		return "log";
	}

	public String add() {
		return "add";
	}

	public String pro() {
		String look = request.getParameter("look");
		request.setAttribute("look", look);
		String ssjbxxid = request.getParameter("jbxxid");
		String type = request.getParameter("type");
		ssproc = ssglUCCImpl.getSsprocById2(ssjbxxid, type);
		if (ssproc == null) {// 没有ssproc信息，新建ssproc信息。
			ssproc = new SsProc();
			ssproc.setSsjdid(type);
			
			System.out.println("xxxxxxxxxxxxx"+getSsjdmc(type));
			ssproc.setSsjbxxId(ssjbxxid);
			ssglUCCImpl.saveroc(ssproc);
		} else {
		}
		request.setAttribute("ssjbxxid", ssproc.getSsjbxxId());
		request.setAttribute("type", type);
		request.setAttribute("sspro_id", ssproc.getId());
		request.setAttribute("id", ssproc.getId());
		return "pro";
	}

	public String savepro() {
		if (id == null || "".equals(id)) {
			ssproc.setSsjdmc(getSsjdmc(type));
			SsProc ssproc_old=ssglUCCImpl.getSsprocById(ssproc.getId());
			ssglUCCImpl.saveroc(ssproc);
			ssglUCCImpl.saveSSchangePro(ssproc_old, ssproc, "新增",getSsjdmc(type));
		} else {
			SsProc ssproc_old=ssglUCCImpl.getSsprocById(ssproc.getId());
			ssglUCCImpl.updatePro(ssproc);
			ssglUCCImpl.saveSSchangePro(ssproc_old, ssproc, "修改",getSsjdmc(ssproc.getSsjdid()));
		}
		id = ssproc.getId();
		request.setAttribute("id", id);
		request.setAttribute("type", ssproc.getSsjdid());
		return "pro";
	}

	public String modifySsPro() {
		String ssjbxxid = (String) request.getAttribute("ssjbxxid");
		ssproc = ssglUCCImpl.getSsprocById2(ssjbxxid, type);
		return "pro";
	}

	// 系統生成的 get set 方法
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public SsProc getSsproc() {
		return ssproc;
	}

	public void setSsproc(SsProc ssproc) {
		this.ssproc = ssproc;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSsjdmc(String strKey) {
		HashMap hashmap = new HashMap();
		hashmap.put("1","一审");
		hashmap.put("2", "二审");
		hashmap.put("3", "执行");
		hashmap.put("4","再审");
		return (String)hashmap.get(strKey);
	}
}