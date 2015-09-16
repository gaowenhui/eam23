package com.tansun.eam2.common.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class CounterListToJSON {
	/**
	 * 这个方法是将一个List转化为JSON字符串
	 * @param counterList:一个List,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<Map> counterList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		Iterator iterater = counterList.iterator();
		while(iterater.hasNext()){
			jsonSB.append(counterToJSON((Map)iterater.next()));
			if(iterater.hasNext()){
				jsonSB.append(",");
			}
		}
		jsonSB.append("]");
		jsonSB.append("}");
		return jsonSB.toString();
	}
	
	/**
	 * 这个方法将一个ZySbody对象转化为JSON字符串
	 * @param body ZySbody对象
	 * @return JSON字符串
	 */
	public static String counterToJSON(Map map){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"piid\":\"").append(map.get("piid")==null?"":map.get("piid")).append("\",");
		bodyJSON.append("\"createtime\":\"").append(map.get("createtime")==null?"":map.get("createtime")).append("\",");
		bodyJSON.append("\"title\":\"").append(map.get("title")==null?"":map.get("title")).append("\",");
		bodyJSON.append("\"deptid\":\"").append(map.get("deptid")==null?"":map.get("deptid")).append("\",");
		bodyJSON.append("\"deptname\":\"").append(map.get("deptname")==null?"":map.get("deptname")).append("\",");
		bodyJSON.append("\"userid\":\"").append(map.get("userid")==null?"":map.get("userid")).append("\",");
		bodyJSON.append("\"username\":\"").append(map.get("username")==null?"":map.get("username")).append("\"");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
