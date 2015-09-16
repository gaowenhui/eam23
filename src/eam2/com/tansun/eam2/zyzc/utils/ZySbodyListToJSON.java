package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZySbody;

/**
 * 
 * @author 赵贤义
 *
 */
public class ZySbodyListToJSON {
	
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<ZySbody> bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<ZySbody> i = bodyList.iterator(); i.hasNext();){
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
	public static String bodyToJSON(ZySbody body){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"body.sbodyId\":\"").append(body.getSbodyId()==null?"":body.getSbodyId()).append("\",");
		bodyJSON.append("\"body.yjflbm\":\"").append(body.getYjflmc()==null?"":body.getYjflmc()).append("\",");
		bodyJSON.append("\"body.ejflbm\":\"").append(body.getEjflmc()==null?"":body.getEjflmc()).append("\",");
		bodyJSON.append("\"body.sjflbm\":\"").append(body.getSjflmc()==null?"":body.getSjflmc()).append("\",");
		bodyJSON.append("\"body.yjflmc\":\"").append(body.getYjflmc()==null?"":body.getYjflmc()).append("\",");
		bodyJSON.append("\"body.ejflmc\":\"").append(body.getEjflmc()==null?"":body.getEjflmc()).append("\",");
		bodyJSON.append("\"body.sjflmc\":\"").append(body.getSjflmc()==null?"":body.getSjflmc()).append("\",");
		bodyJSON.append("\"body.zcId\":\"").append(body.getZcId()==null?"":body.getZcId()).append("\",");
		bodyJSON.append("\"body.gg\":\"").append(body.getGg()==null?"":body.getGg()).append("\",");
//		bodyJSON.append("\"body.xlh\":\"").append(body.getXlh()==null?"":body.getXlh()).append("\",");
		bodyJSON.append("\"body.jldw\":\"").append(body.getJldw()==null?"":body.getJldw()).append("\",");
		bodyJSON.append("\"body.dj\":\"").append(body.getDj()==null?"":body.getDj()).append("\",");
		bodyJSON.append("\"body.sl\":\"").append(body.getSl()==null?"":body.getSl()).append("\",");
		bodyJSON.append("\"body.je\":\"").append(body.getJe()==null?"":body.getJe()).append("\",");
		bodyJSON.append("\"body.gys\":\"").append(body.getGys()==null?"":body.getGys()).append("\",");
		bodyJSON.append("\"body.cbrq\":\"").append(body.getCbrq()==null?"":body.getCbrq()).append("\",");
		bodyJSON.append("\"body.bxjg\":\"").append(body.getBxjg()==null?"":body.getBxjg()).append("\",");
		bodyJSON.append("\"body.jyts\":\"").append(body.getJyts()==null?"":body.getJyts()).append("\",");
		bodyJSON.append("\"body.zcmc\":\"").append(body.getZcmc()==null?"":body.getZcmc()).append("\"");
//		bodyJSON.append("\"body.zcms\":\"").append(body.getZcms()==null?"":body.getZcms()).append("\"");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
