package com.tansun.eam2.jfreeChart.chartUcc.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.StaticCode;
import com.tansun.eam2.jfreeChart.chartService.MapTjService;
import com.tansun.eam2.jfreeChart.chartUcc.MapTjUCC;
import com.tansun.eam2.jfreeChart.map.ProvincePicture;

@Service
public class MapTjUCCImpl implements MapTjUCC {
	
	private MapTjService mapTjService;

	public MapTjService getMapTjService() {
		return mapTjService;
	}
	@Autowired
	public void setMapTjService(MapTjService mapTjService) {
		this.mapTjService = mapTjService;
	}
	

	/**
	 * 查询数据list（全资产统计）
	 * @param 
	 * @return
	 */
	public String queryDataQzcList() {
		List list = mapTjService.queryDataQzcList();
		HashMap map = new HashMap();
		String val="";
		try {
			map = (HashMap) this.getXmlValues("c:/tjxml/XMLQzc.xml");
			val=this.mapColorPj(map, list,"true");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return val;
	}
	
	
	/**
	 * 查询数据list（经营类资产统计）
	 * @param 
	 * @return
	 */
	public String queryDataJylzcList() {
		List list = mapTjService.queryDataJylzcList();
		HashMap map = new HashMap();
		String val="";
		try {
			map = (HashMap) this.getXmlValues("c:/tjxml/XMLJylzc.xml");
			val=this.mapColorPj(map, list,"true");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return val;
	}
	
	
	
	/**
	 * 查询数据list（委托贷款统计）
	 * @param 
	 * @return
	 */
	public String queryDataWtdkList() {
		List list = mapTjService.queryDataWtdkList();
		HashMap map = new HashMap();
		String val="";
		try {
			map = (HashMap) this.getXmlValues("c:/tjxml/XMLWtdk.xml");
			val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return val;
	}
	
	
	/**
	 * 查询数据list（担险委托贷款统计）
	 * @param 
	 * @return
	 */
	public String queryDataDxwtdkList() {
		List list = mapTjService.queryDataDxwtdkList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLDxwtdk.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	/**
	 * 查询数据list（资产日常费用）
	 * @param 
	 * @return
	 */
	public String queryDataZcrcfyList() {
		List list = mapTjService.queryDataZcrcfyList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLZcrcfy.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	
	
	/**
	 * 查询数据list（合同租金收入）
	 * @param 
	 * @return
	 */
	public String queryDataHtzjsrList() {
		List list = mapTjService.queryDataHtzjsrList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLHtzjsr.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	/**
	 * 查询数据list（实体日常管理费用）
	 * @param 
	 * @return
	 */
	public String queryDataStrcglfyList() {
		List list = mapTjService.queryDataStrcglfyList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLStrcglfy.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	
	/**
	 * 查询数据list（债权）
	 * @param 
	 * @return
	 */
	public String queryDataZqList() {
		List list = mapTjService.queryDataZqList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLZq.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	
	/**
	 * 查询数据list（债券）
	 * @param 
	 * @return
	 */
	public String queryDataZq2List() {
		List list = mapTjService.queryDataZq2List();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLZq2.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	/**
	 * 查询数据list（资产处置）
	 * @param 
	 * @return
	 */
	public String queryDataZcczList() {
		List list = mapTjService.queryDataZcczList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLZccz.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	/**
	 * 查询数据list（实体整体处置）
	 * @param 
	 * @return
	 */
	public String queryDataStztczList() {
		List list = mapTjService.queryDataStztczList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLStztcz.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	/**
	 * 查询数据list（实体人员安置）
	 * @param 
	 * @return
	 */
	public String queryDataStryazList() {
		List list = mapTjService.queryDataStryazList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLStryaz.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	
	/**
	 * 查询数据list（ 诉讼信息统计）
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String queryDataSusongList() {
		List list = mapTjService.queryDataSusongList();
		HashMap map = new HashMap();
		String val="";
		try {
		   map = (HashMap) this.getXmlValues("c:/tjxml/XMLSusong.xml");
		   val=this.mapColorPj(map, list,"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return val;
	}
	
	
	
	/**
	 * 
	 * @param 
	 * @return
	 * @throws IOException 
	 */
	public HashMap  getXmlValues(String url) throws IOException{
		HashMap returnMap = new HashMap();
		StringBuffer sb = new StringBuffer("");
		File file = new File(url);

		BufferedReader reader = null;
		reader = new BufferedReader(new FileReader(file));
		String tempString = null;
		try {
			while ((tempString = reader.readLine()) != null) {
				sb.append(tempString);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		reader.close();

		SAXBuilder builder = new SAXBuilder(false);
		Reader in = new StringReader(sb.toString());
		Document doc = null;
		try {
			doc = builder.build(in);
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Element books = doc.getRootElement();
		
		List list = books.getChildren("percent");
		for (int i = 0; i < list.size(); i++) {
			Element book = (Element) list.get(i);
			List listChild = book.getChildren("childPercent");
			String [] s = new String[2];
			for (int j = 0; j < listChild.size(); j++) {
				Element book1 = (Element) listChild.get(j);
				s[j] = book1.getText();
			}
			returnMap.put(String.valueOf(i), s);
		}
		return returnMap;
	}
	
	public String mapColorPj(HashMap map,List list,String isCzl){
		String val = "";// 使用什么地图颜色编码
		double wtdkye = 0;
		HashMap map2 = null;
		
		
		
	/*	ProvincePicture p = new ProvincePicture();
		String [][] pic = p.getPic();
		String [] PROVINCE_CN_PY = p.PROVINCE_CN_PY;
		int flag=0;
		for (int k = 0; k < PROVINCE_CN_PY.length; k++) {
			if(PROVINCE_CN_PY[k].equals("河北")){
				flag = k;
				break;
			}*/
		 String valStr="";
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					map2 = (HashMap) list.get(i);
					BigDecimal big = (BigDecimal) map2.get("he");
					String cityCode = (String) map2.get("code");
					StaticCode staticCode = new StaticCode();
					String cityName = (String) staticCode.cityMap.get(cityCode);
					if (big != null) {
						int mapSize = map.size();
						for (int j = 0; j < mapSize; j++) {
							String[] s = (String[]) map.get(String.valueOf(j));
							BigDecimal d1 = new BigDecimal(s[0]);
							BigDecimal d2 = new BigDecimal(s[1]);
								if ((d1.compareTo(big) == -1 || d1.compareTo(big) == 0)
										&& (d2.compareTo(big) == 1)) {
									if("true".equals(isCzl)){
									     valStr = String.valueOf(3-j);
									 }else{
										 valStr = String.valueOf(j);
									 }
									val += valStr + ",";
									break;
								}
							}
						}else{
							if("true".equals(isCzl)){
							     valStr = String.valueOf(3);
							 }else{
								 valStr = String.valueOf(0);
							 }
						
							val += valStr + ",";
						}
					}
					
				}
		//}
		if (val.endsWith(",")) {
			val = val.substring(0, val.length() - 1);
		}
		return val;
		
	}

}
