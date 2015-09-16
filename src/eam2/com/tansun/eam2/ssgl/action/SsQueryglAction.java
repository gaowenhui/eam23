package com.tansun.eam2.ssgl.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.ucc.ISsglUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class SsQueryglAction extends CommonAction {

	public SsBaseinfo ssBaseinfo;

	public SsProc ssproc;

	@Autowired
	public ISsglUCC ssglUCCImpl;

	public String ssid;

	public ISsglUCC getSsglUCCImpl() {
		return ssglUCCImpl;
	}

	public void setSsglUCCImpl(ISsglUCC ssglUCCImpl) {
		this.ssglUCCImpl = ssglUCCImpl;
	}

	public String getSsid() {
		return ssid;
	}

	public void setSsid(String ssid) {
		this.ssid = ssid;
	}

	public String index() {

		if (ssBaseinfo == null) {
			ssBaseinfo = new SsBaseinfo();
			ssglUCCImpl.save(ssBaseinfo);
		} else {

		}

		request.setAttribute("ssid", ssBaseinfo.getId());
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

	public String save() {
		ssglUCCImpl.save(ssBaseinfo);
		request.setAttribute("ssid", ssBaseinfo.getId());
		return "index";
	}

	public SsBaseinfo getSsBaseinfo() {
		return ssBaseinfo;
	}

	public void setSsBaseinfo(SsBaseinfo ssBaseinfo) {
		this.ssBaseinfo = ssBaseinfo;
	}

}
