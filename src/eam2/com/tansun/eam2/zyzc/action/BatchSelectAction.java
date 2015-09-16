package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

//@Controller
//@Scope("prototype")
public class BatchSelectAction extends CommonAction{
	private ZyPdxx zyPdxx;
	private String zcIds;
	private Paginator paginator;
	@Autowired
	DicAppAssetTypeUCC dicAppAssetTypeUCC;
	@Autowired
	ToCheckUCC toCheckUCCimpl;

	/**
	 * 页面初始化和当前类的其他方法调用完成后，都要返回该方法
	 */
	public String findFL() {
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		String pclx = request.getParameter("pclx");
		if (zyPdxx == null) {
			zyPdxx = new ZyPdxx();
		} 
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();

		if (StringUtils.isNotEmpty(yjflbm)) {
			ejMap = dicAppAssetTypeUCC.findEjFl(yjflbm);
			if (StringUtils.isNotEmpty(ejflbm)) {
				sjMap = dicAppAssetTypeUCC.findSjFl(ejflbm);
			}
		}
		request.setAttribute("yjMap", yjMap);
		request.setAttribute("ejMap", ejMap);
		request.setAttribute("sjMap", sjMap);
		return "initSubPage"+pclx;
	}
	
	/**
	 *一级分类值改变时，根据前台传过来的一级分类编码值到二级分类表中查询MainCode为一级分类编码所有记录名称
	 *并组成json串，传到前台
	 */
  	public String ejflRefresh(){
  		request.getParameter("");
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'ejfls':[");
			Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(zyPdxx.getYjflbm());
			for(Map.Entry<String, String> entry : ejMap.entrySet()){
				returnStr.append("{'ejflbm':'" + entry.getKey() + "','ejflmc':'" + entry.getValue() + "'},");
			}
			if(ejMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
  	
  	/**
  	 * 查询三级分类中所有二级分类编码为选中的二级分类编码的值
  	 * @return
  	 */
	public String sjflRefresh(){
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'sjfls':[");
			Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(zyPdxx.getEjflbm());
			for(Map.Entry<String, String> entry : sjMap.entrySet()){
				returnStr.append("{'sjflbm':'" + entry.getKey() + "','sjflmc':'" + entry.getValue() + "'},");
			}
			if(sjMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
  	
  	/**
  	 * 弹出页面查询时调用此方法，然后转到此页面
  	 * @return
  	 * @throws IOException 
  	 */
//  	public String subPageQuery() throws IOException{
//		if(zyPdxx != null){
//			String type = request.getParameter("type");
//			if(type!=null){
//				String ids = toCheckUCCimpl.subPageQueryWithCondition(zyPdxx);
//				response.setCharacterEncoding("UTF-8");
//				response.getWriter().print(ids); 
//			}else{
//				List<ZyPdxx> pdxxList = toCheckUCCimpl.subPageQueryWithCondition(zyPdxx,paginator);
//				String josnStr = BodyListToJSON.getJSON(pdxxList, paginator.getPageCount(), 
//						paginator.getCurrentPage(), paginator.getCount());
//				response.setCharacterEncoding("UTF-8");
//				response.getWriter().print(josnStr); 
//			}
//		}
//		return null;
//  	}
  	
	public String subPageQuery() throws IOException{
  		String pclx = request.getParameter("pclx");
  		String isConsuming = request.getParameter("isConsuming");
  		String type = request.getParameter("type");
  		List resultList = null;
  		if(type!=null){
  			String ids = "";
  			if(zyPdxx != null){
  				if("0".equals(pclx)){
  					if("是".equals(isConsuming)){
  						ids = toCheckUCCimpl.subPageQueryWithConditionId(zyPdxx,paginator);
  					}else if("否".equals(isConsuming)){
  						ids =toCheckUCCimpl.subPageQueryWithConditionId(zyPdxx,pclx,isConsuming,paginator);
  					}
  				}else if("1".equals(pclx)){
  					ids =toCheckUCCimpl.subPageQueryWithConditionId(zyPdxx,pclx,paginator);
  				}
  				response.setCharacterEncoding("UTF-8");
  				response.getWriter().print(ids); 
  			}
  		}else{
  			if(zyPdxx != null){
  				if("0".equals(pclx)){
  					if("是".equals(isConsuming)){
  						resultList =toCheckUCCimpl.subPageQueryWithCondition(zyPdxx,paginator);
  					}else if("否".equals(isConsuming)){
  						resultList =toCheckUCCimpl.subPageQueryWithCondition(zyPdxx,pclx,isConsuming,paginator);
  					}
  				}else if("1".equals(pclx)){
  					resultList =toCheckUCCimpl.subPageQueryWithCondition(zyPdxx,pclx,paginator);
  				}
  				String josnStr = BodyListToJSON.getJSON(resultList, paginator.getPageCount(), 
  						paginator.getCurrentPage(), paginator.getCount());
  				response.setCharacterEncoding("UTF-8");
  				response.getWriter().print(josnStr); 
  			}
  		}
		return null;
  	}
  	
  	/**
  	 * 查询出结果以后关闭此页面时调用，把用户选择的记录存到盘点信息表中
  	 * @return
  	 */
  	public String closePage(){
  		String [] zcidAyyar = zcIds.split(",");
  		for(String zcId : zcidAyyar){
  			if(StringUtils.isNotEmpty(zcId)){
  				ZyPdxx Pdxxtemp = toCheckUCCimpl.createZyPdxxByZcId(zcId);
  				toCheckUCCimpl.saveZyPdxx(Pdxxtemp);
  			}
  		}
  		return "null";
  	}
  	
	public ZyPdxx getZyPdxx() {
		return zyPdxx;
	}

	public void setZyPdxx(ZyPdxx zyPdxx) {
		this.zyPdxx = zyPdxx;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
}
