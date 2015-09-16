package com.tansun.eam2.cjtz.action;

import java.io.IOException;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.cjtz.ucc.ICjtzBodyUcc;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class CjtzBodyAction extends CommonAction {
	
	Log log = LogFactory.getLog(this.getClass());
	
	private ICjtzBodyUcc bodyUcc;
	
	private String cldId;
	
	public ICjtzBodyUcc getBodyUcc() {
		return bodyUcc;
	}

	@Autowired
	public void setBodyUcc(ICjtzBodyUcc bodyUcc) {
		this.bodyUcc = bodyUcc;
	}

	public String getCldId() {
		return cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	//添加自用资产到body表中
	public String addOtherZyzc(){
		try{
			String zyzcIds = request.getParameter("zyzcIds");
			if(StringUtils.isNotEmpty(zyzcIds)){
				bodyUcc.addOtherZyzc(zyzcIds, cldId);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	/**
	 * 添加委贷抵债物到body表中
	 * @return
	 */
	public String addOtherWddzw(){
		try{
			//委贷抵债物,不是实体ID
			String stid = request.getParameter("stid");
			String landList = request.getParameter("landList");
			String houseList = request.getParameter("houseList");
			String machineList = request.getParameter("machineList");
			String trafficList = request.getParameter("trafficList");
			String otherassetList = request.getParameter("otherassetList");
			if(StringUtils.isNotEmpty(stid)){
				bodyUcc.addOtherWddzw(stid,landList,houseList,machineList,
						trafficList,otherassetList, cldId);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	/**
	 * 添加实体内资产到body表中
	 * @return
	 */
	public String addOtherStlzc(){
		try{
			//这次是实体ID,卫视委贷Id
			String stid = request.getParameter("stid");
			String landList = request.getParameter("landList");
			String houseList = request.getParameter("houseList");
			String machineList = request.getParameter("machineList");
			String trafficList = request.getParameter("trafficList");
			String otherassetList = request.getParameter("otherassetList");
			if(StringUtils.isNotEmpty(stid)){
				bodyUcc.addOtherStlzc(stid,landList,houseList,machineList,
						trafficList,otherassetList, cldId);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	/**
	 * 添加经营性固定资产\待处置资产到body表中
	 * @return
	 */
	public String addOtherJygdzc(){
		try{
			String jygdzcIds = request.getParameter("jygdzcIds");
			String fenlei = request.getParameter("fenlei");
			if(StringUtils.isNotEmpty(jygdzcIds)){
				bodyUcc.addOtherJygdzc(jygdzcIds, cldId, fenlei);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			e.printStackTrace();
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	/**
	 * 添加债券到body表中
	 * @return
	 */
	public String addOtherZQuan(){
		try{
			String zqIds = request.getParameter("zqIds");
			if(StringUtils.isNotEmpty(zqIds)){
				bodyUcc.addOtherZQuan(zqIds, cldId);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	public String addOtherSti(){
		try{
			String stIds = request.getParameter("zqIds");
			if(StringUtils.isNotEmpty(stIds)){
				bodyUcc.addOtherSti(stIds, cldId);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	public String showOtherBodyJson(){
		try{
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(bodyUcc.getOtherBodyJson(cldId));
		}catch(Exception e){
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
	public String getStlxByStid(){
		String stid = request.getParameter("stid");
		try {
			response.getWriter().print(bodyUcc.getStlxByStid(stid));
		} catch (IOException e) {
			if(log.isErrorEnabled()){
				log.equals(e.getStackTrace());
			}
		}
		return null;
	}
	
}
