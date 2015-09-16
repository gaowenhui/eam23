package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.zccz.ucc.ICzSczskUCC;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;


public class SczskAction extends CommonAction {

	public List<CzSczsk> czSczsk=new ArrayList<CzSczsk>();
	public CzSczsk sczsk=new CzSczsk();
	@Autowired
	private ICzSczskUCC czSczskUCCImpl;
	
	public String query(){
		czSczsk=czSczskUCCImpl.getCzSczskByCondition(sczsk);
		return "query";
	}

	public String query4View(){
		czSczsk=czSczskUCCImpl.getCzSczskByCondition(sczsk);
		String bodyJSON = BodyListToJSON.getJSON(czSczsk, 1, 1, 1);
		System.out.println(bodyJSON+"------------");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
}
	public List<CzSczsk> getCzSczsk() {
		return czSczsk;
	}

	public void setCzSczsk(List<CzSczsk> czSczsk) {
		this.czSczsk = czSczsk;
	}

	public CzSczsk getSczsk() {
		return sczsk;
	}

	public void setSczsk(CzSczsk sczsk) {
		this.sczsk = sczsk;
	}

	public ICzSczskUCC getCzSczskUCCImpl() {
		return czSczskUCCImpl;
	}

	public void setCzSczskUCCImpl(ICzSczskUCC czSczskUCCImpl) {
		this.czSczskUCCImpl = czSczskUCCImpl;
	}
}
