package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.tansun.rdp4j.common.util.Paginator;

public class GetJsonString {
	public static <T>  String getJsonString(List<T> resultList ) {
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(10).append("\",");
		jsonSB.append("\"page\" : \"").append(1).append("\",");
		jsonSB.append("\"records\" : \"").append(resultList.size()).append("\",");
		jsonSB.append("\"rows\" : [");
		JsonConfig jsonConfig = new JsonConfig();
		JSONObject jsonObject = null;
		for (Iterator i = resultList.iterator(); i.hasNext();) {
			T bodyListVO = (T) i.next();
			jsonObject = JSONObject.fromObject(bodyListVO, jsonConfig);
			jsonSB.append(jsonObject.toString());
			if (i.hasNext()) {
				jsonSB.append(",");
			}
		}
		jsonSB.append("]");
		jsonSB.append("}");
		return jsonSB.toString();
	}
	
	public static <T>  String getJsonString(List<T> resultList,Paginator paginator) {
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(paginator.getPageCount()).append("\",");
		jsonSB.append("\"page\" : \"").append(paginator.getCurrentPage()).append("\",");
		jsonSB.append("\"records\" : \"").append(paginator.getCount()).append("\",");
		jsonSB.append("\"rows\" : [");
		JsonConfig jsonConfig = new JsonConfig();
		JSONObject jsonObject = null;
		for (Iterator i = resultList.iterator(); i.hasNext();) {
			T bodyListVO = (T) i.next();
			jsonObject = JSONObject.fromObject(bodyListVO, jsonConfig);
			jsonSB.append(jsonObject.toString());
			if (i.hasNext()) {
				jsonSB.append(",");
			}
		}
		jsonSB.append("]");
		jsonSB.append("}");
		return jsonSB.toString();
	}
}