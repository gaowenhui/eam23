package com.tansun.eam2.cjtz.action;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.cjtz.ucc.ICzCztzfaXxUCC;
import com.tansun.eam2.cjtz.ucc.ICzZcXxUCC;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;
public class CzZcXxAction extends CommonAction{

	private CzCztzfaXx czCztzfaXx;
	private CzStcztz czstcztz;
	private CzZcXx czZcXx;
	private String message;
	private String zcIds;
	private String headId;
	private List sqsdfyxxs;
	private String type;
	@Autowired
	private ICzZcXxUCC czZcXxUCC;
	@Autowired
	private ICzCztzfaXxUCC ucc;
	
	public String getCzZcXxList(){
		try{
			List<CzZcXx> czZcXxList = czZcXxUCC.getCzZcXxListByCzCztzfaXxId(czCztzfaXx.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(BodyListToJSON.getJSON(czZcXxList, 1, 1, 1111));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 显示添加资产页面
	 * @return
	 */
	public String showAddAsset(){
		String returnStr="";
		if("quequan".equals(type)){
			Map<String, String> jbhMap = czZcXxUCC.getJbhMap();
			request.setAttribute("jbhMap", jbhMap);
			returnStr = "showAddAsset";
		}else if("zulin".equals(type)){
			returnStr = "showAddAsset2";
		}
		
		return returnStr;
	}
	
	/**
	 * 删除body
	 * @return
	 */
	public String deleteBody(){
		ucc.deleteBody(zcIds,headId);
		
		return null;
	}
	
	/**
	 * 保存表体
	 * 
	 * @return
	 */
	public String saveBody(){
		
		ucc.saveBody(czZcXx,headId);
		message = "保存成功！";
		return "showAddAsset2";
	}
	
	/**
	 * 修改body
	 * @return
	 */
	public String modifyBody(){
		String returnStr="";
		if("quequan".equals(type)){
			sqsdfyxxs = ucc.getJyzcSqsdfyXxByZcId(zcIds, headId);
			Map<String, String> jbhMap = czZcXxUCC.getJbhMap();
			request.setAttribute("jbhMap", jbhMap);
			returnStr = "showAddAsset";
		}else if("zulin".equals(type)){
			returnStr = "showAddAsset2";
		}
		czZcXx = this.ucc.getCzZcXxById(zcIds);
		
		return returnStr;
	}
	
	//返回二级分行Json字符串
	public String returnEjfhJsonString(){
		try {
			if(StringUtils.isNotEmpty(czZcXx.getAcJbhbh())){
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(czZcXxUCC.getEjfhListByJbhKeys(czZcXx.getAcJbhbh()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getCzZcXxJson(){
		sqsdfyxxs = ucc.getJyzcSqsdfyXxByZcId(zcIds, headId);
		czZcXx = ucc.getCzZcXxByZcId(zcIds);
		Map<String, String> jbhMap = czZcXxUCC.getJbhMap();
		request.setAttribute("jbhMap", jbhMap);
		return "showAddAsset";
	}
	
	/**
	 * 处置承继投资添加，及申请审定费用表添加
	 * 
	 * @return
	 */
	public String addFy() {

		// 添加多条风险费用的信息
		String[] xmmcs = request.getParameterValues("xmmc");
		String[] sqjes = request.getParameterValues("sqje");
		String[] sdjes = request.getParameterValues("sdje");
		ucc.addFy(headId,czZcXx,xmmcs,sqjes,sdjes);
		
		Map<String, String> jbhMap = czZcXxUCC.getJbhMap();
		request.setAttribute("jbhMap", jbhMap);
		message="保存成功!";
		return "showAddAsset";
	}
	//**********以下为用到的getter setter*********************************************
	public CzCztzfaXx getCzCztzfaXx() {
		return czCztzfaXx;
	}

	public void setCzCztzfaXx(CzCztzfaXx czCztzfaXx) {
		this.czCztzfaXx = czCztzfaXx;
	}

	public CzZcXx getCzZcXx() {
		return czZcXx;
	}

	public void setCzZcXx(CzZcXx czZcXx) {
		this.czZcXx = czZcXx;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public List getSqsdfyxxs() {
		return sqsdfyxxs;
	}

	public void setSqsdfyxxs(List sqsdfyxxs) {
		this.sqsdfyxxs = sqsdfyxxs;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public CzStcztz getCzstcztz() {
		return czstcztz;
	}

	public void setCzstcztz(CzStcztz czstcztz) {
		this.czstcztz = czstcztz;
	}
}
