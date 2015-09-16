package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.zyzc.vo.QueryBody4View;

/**
 * @author 赵贤义
 */
public class QueryBody4ViewListToJSON {
	
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<QueryBody4View> bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<QueryBody4View> i = bodyList.iterator(); i.hasNext();){
			jsonSB.append(bodyToJSON(i.next()));
			if(i.hasNext()){
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
	public static String bodyToJSON(QueryBody4View body){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"yjflmc\":\"").append(body.getYjflmc()==null?"":body.getYjflmc()).append("\",");
		bodyJSON.append("\"ejflmc\":\"").append(body.getEjflmc()==null?"":body.getEjflmc()).append("\",");
		bodyJSON.append("\"sjflmc\":\"").append(body.getSjflmc()==null?"":body.getSjflmc()).append("\",");
		bodyJSON.append("\"yjflbm\":\"").append(body.getYjflbm()==null?"":body.getYjflbm()).append("\",");
		bodyJSON.append("\"ejflbm\":\"").append(body.getEjflbm()==null?"":body.getEjflbm()).append("\",");
		bodyJSON.append("\"sjflbm\":\"").append(body.getSjflbm()==null?"":body.getSjflbm()).append("\",");
		bodyJSON.append("\"sbodyId\":\"").append(body.getSbodyId()==null?"":body.getSbodyId()).append("\",");
		bodyJSON.append("\"zcmc\":\"").append(body.getZcmc()==null?"":body.getZcmc()).append("\",");
		bodyJSON.append("\"gg\":\"").append(body.getGg()==null?"":body.getGg()).append("\",");
		bodyJSON.append("\"kcsl\":\"").append(body.getKcsl()==null?"":body.getKcsl()).append("\",");
		bodyJSON.append("\"zcbh\":\"").append(body.getZcbh()==null?"":body.getZcbh()).append("\",");
		bodyJSON.append("\"zczt\":\"").append(body.getZczt()==null?"":body.getZczt()).append("\",");
		bodyJSON.append("\"kssyrq\":\"").append(body.getKssyrq()==null?"":body.getKssyrq()).append("\",");
		bodyJSON.append("\"sfsckp\":\"").append(body.getSfsckp()==null?"":body.getSfsckp()).append("\",");
		bodyJSON.append("\"jldw\":\"").append(body.getJldw()==null?"":body.getJldw()).append("\",");
		bodyJSON.append("\"dj\":\"").append(body.getDj()==null?"":body.getDj()).append("\",");
		bodyJSON.append("\"je\":\"").append(body.getJe()==null?"":body.getJe()).append("\",");
//		bodyJSON.append("\"sl\":\"").append(body.getSl()==null?"":body.getSl()).append("\",");
		bodyJSON.append("\"zcId\":\"").append(body.getZcId()==null?"":body.getZcId()).append("\",");
		bodyJSON.append("\"jydqrq\":\"").append(body.getJydqrq()==null?"":body.getJydqrq()).append("\",");
		bodyJSON.append("\"lyrmc\":\"").append(body.getLyrmc()==null?"":body.getLyrmc()).append("\",");
		bodyJSON.append("\"bz\":\"").append(body.getBz()==null?"":body.getBz()).append("\",");
		bodyJSON.append("\"bgdd\":\"").append(body.getBgdd()==null?"":body.getBgdd()).append("\",");
		bodyJSON.append("\"gys\":\"").append(body.getGys()==null?"":body.getGys()).append("\",");
		bodyJSON.append("\"bxjg\":\"").append(body.getBxjg()==null?"":body.getBxjg()).append("\",");
		bodyJSON.append("\"bxfws\":\"").append(body.getBxfws()==null?"":body.getBxfws()).append("\",");
		bodyJSON.append("\"cbrq\":\"").append(body.getCbrq()==null?"":body.getCbrq()).append("\",");
		bodyJSON.append("\"pdjg\":\"").append(body.getPdjg()==null?"":body.getPdjg()).append("\",");
		bodyJSON.append("\"xxbrq\":\"").append(body.getXxbrq()==null?"":body.getXxbrq()).append("\"");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
