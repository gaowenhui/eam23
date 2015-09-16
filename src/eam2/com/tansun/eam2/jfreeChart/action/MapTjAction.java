package com.tansun.eam2.jfreeChart.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.jfreeChart.chartUcc.MapTjUCC;
import com.tansun.eam2.jfreeChart.chartmain.Wtdk;
import com.tansun.rdp4j.common.web.action.CommonAction;
public class MapTjAction extends CommonAction {

	@Autowired
	private MapTjUCC mapTjUcc;
	
	/**
	 * 全资产统计
	 * @return
	 */
	public String qzcCount(){
	 	HashMap map=new HashMap();
	 	String jyl=request.getParameter("jyl");
		try {
			//查询出每个省的全资产
	        String cityColor=mapTjUcc.queryDataQzcList();
	        map=mapTjUcc.getXmlValues("c:/tjxml/XMLQzc.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if("true".equals(jyl)){
			return  "jyxqzctjChart";
		}else{
		return  "qzctjChart";
		}
	}
	
	/**
	 * 资产结构中的经营类资产统计
	 * @return
	 */
	public String jylzcCount(){
	 	HashMap map=new HashMap();
	 	String jyl=request.getParameter("jyl");
		try {
			//查询出每个省的经营类资产
	        String cityColor=mapTjUcc.queryDataJylzcList();
	        map=mapTjUcc.getXmlValues("c:/tjxml/XMLJylzc.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		if("true".equals(jyl)){
			return  "jyxzctjChart";
		}else{
			return  "jylzctjChart";
		}
		
	}
	
	
	/**
	 *  资产日常费用统计
	 * @return
	 */
	public String zcrcfyCount(){
		String jyl=request.getParameter("jyl");
		try {
			//查询出每个省的资产日常费用
	        String cityColor=mapTjUcc.queryDataZcrcfyList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLZcrcfy.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if("true".equals(jyl)){
			return  "jyxrcfyChart";
		}else{
			return  "zcrcfyChart";
		}
		
	
	}
	
	
	/**
	 *  合同租金收入统计
	 * @return
	 */
	public String htzjsrCount(){
		String jyl=request.getParameter("jyl");
		try {
			//查询出每个省的合同租金收入统计
	        String cityColor=mapTjUcc.queryDataHtzjsrList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLHtzjsr.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if("true".equals(jyl)){
			return  "jyxhtzjChart";
		}else{
			return  "htzjsrChart";
		}
	
	}
	
	
	
	
	/**
	 *  委托贷款余额统计
	 * @return
	 */
	public String wtdkCount(){
		try {
			//查询出每个省的委托贷款余额
	        String cityColor=mapTjUcc.queryDataWtdkList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLWtdk.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "wtdkChart";
	}
	
	/**
	 *  担险委托贷款余额统计
	 * @return
	 */
	public String dxwtdkCount(){
		try {
			//查询出每个省的担险委托贷款余额
	        String cityColor=mapTjUcc.queryDataDxwtdkList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLDxwtdk.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "dxwtdkChart";
	}
	
	
	
	/**
	 *  实体日常管理费用
	 * @return
	 */
	public String strcglfyCount(){
		try {
			//查询出每个省的实体日常管理费用统计
	        String cityColor=mapTjUcc.queryDataStrcglfyList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLStrcglfy.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "strcfyChart";
	}
	
	/**
	 *  债权
	 * @return
	 */
	public String zqCount(){
		try {
			//查询出每个省的债权统计
	        String cityColor=mapTjUcc.queryDataZqList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLZq.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "zqChart";
	}
	
	
	/**
	 *  债券
	 * @return
	 */
	public String zq2Count(){
		try {
			//查询出每个省的债权统计
	        String cityColor=mapTjUcc.queryDataZq2List();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLZq2.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "zq2Chart";
	}
	
	
	/**
	 *  资产处置
	 * @return
	 */
	public String zqCzCount(){
		try {
			//查询出每个省的资产处置金额统计
	        String cityColor=mapTjUcc.queryDataZcczList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLZccz.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "zcczChart";
	}
	
	
	/**
	 *  实体整体处置
	 * @return
	 */
	public String stztczCount(){
		try {
			//查询出每个省的实体整体处置金额统计
	        String cityColor=mapTjUcc.queryDataStztczList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLStztcz.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "stztczChart";
	}
	
	/**
	 *  实体人员安置
	 * @return
	 */
	public String stryazCount(){
		try {
			//查询出每个省的实体人员安置统计
	        String cityColor=mapTjUcc.queryDataStryazList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLStryaz.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "stryazChart";
	}
	
	/**
	 *  诉讼信息统计
	 * @return
	 */
	public String susongCount(){
		try {
			//查询出每个省的实体人员安置统计
	        String cityColor=mapTjUcc.queryDataSusongList();
	        HashMap map=mapTjUcc.getXmlValues("c:/tjxml/XMLSusong.xml");
	        request.setAttribute("cityColor",cityColor);
	        request.setAttribute("map",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "ssajChart";
	}
	
	
	
	
	
	

	public MapTjUCC getMapTjUcc() {
		return mapTjUcc;
	}


	public void setMapTjUcc(MapTjUCC mapTjUcc) {
		this.mapTjUcc = mapTjUcc;
	}

   
}
