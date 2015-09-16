package com.tansun.eam2.zccz.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzWnb;
import com.tansun.eam2.zccz.ucc.IWNBUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * WNBListAction用来查询万能表,检索对应的数据给前台界面进行显示.
 * @author 刘峻松
 *
 */

public class WNBListAction  extends CommonAction{
	@Autowired
	private IWNBUCC wnbUCC;
	//------------- 参数定义部分 ----------------------//
	public String xmId; //项目对应ID
	public String zcId; //资产对应ID
	public String zcCode; //对应数据字典的编码,代表虚拟表名
	public String wnbId; //万能表ID
	public CzWnb czWnb;
	public List list;
	
	public String init(){
		return "list1";
	}
	public String add(){
		list = wnbUCC.modifyWNBList(wnbId, zcCode);
		czWnb =new CzWnb();
		wnbUCC.save(czWnb);
		wnbId = czWnb.getWnbId();
		String col= (String) list.get(0);
		request.setAttribute("col", col);
		
		return "add";
	}
	public String  save(){
		
		if(wnbId==null||"".equals(wnbId)){
			
			wnbUCC.save(czWnb);
		}else{
			wnbUCC.update(czWnb);
		}
		wnbId = czWnb.getWnbId();
		request.setAttribute("wnbId", wnbId);
		return null;
	}
	public String  modify(){
		wnbId = (String) request.getAttribute("wnbId");
		if(wnbId!=null||zcCode!=null){
		    list = wnbUCC.modifyWNBList(wnbId, zcCode);
			String col= (String) list.get(0);
			String wnb = (String) list.get(1);
			request.setAttribute("col", col);
			request.setAttribute("wnb", wnb);
		}
		
		return "add";
	}
	public String  delete(){
		czWnb = (CzWnb) wnbUCC.retrieveWNBBO(wnbId);
		wnbUCC.delete(czWnb);
		return null;
	}
	public String query(){
		request.getParameter("");
		List datalist = new ArrayList();
		//调用UCC方法，得到结果数据
		datalist = wnbUCC.queryWNBList(xmId, zcId, zcCode);
		request.setAttribute("datalist", datalist);
		return "list";
	}
	
	//--------------------------------------------------------------//
	//-------------------　程序自动生成的GetSet方法 --------------------//
	public IWNBUCC getWnbUCC() {
		return wnbUCC;
	}
	public void setWnbUCC(IWNBUCC wnbUCC) {
		this.wnbUCC = wnbUCC;
	}
	public String getXmId() {
		return xmId;
	}
	public void setXmId(String xmId) {
		this.xmId = xmId;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	public String getZcCode() {
		return zcCode;
	}
	public void setZcCode(String zcCode) {
		this.zcCode = zcCode;
	}
	public String getWnbId() {
		return wnbId;
	}
	public void setWnbId(String wnbId) {
		this.wnbId = wnbId;
	}
	public CzWnb getCzWnb() {
		return czWnb;
	}
	public void setCzWnb(CzWnb czWnb) {
		this.czWnb = czWnb;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
}
