package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;

/**
 * 
 * @author 赵贤义
 *
 */
public class ZyKctzListToJSON {
	
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<ZyKctz> bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<ZyKctz> i = bodyList.iterator(); i.hasNext();){
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
	public static String bodyToJSON(ZyKctz body){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"body.bdyy\":\"").append(body.getBdyy()==null?"":body.getBdyy()).append("\",");
		bodyJSON.append("\"body.bz\":\"").append(body.getBz()==null?"":body.getBz()).append("\",");
		bodyJSON.append("\"body.cksl\":\"").append(body.getCksl()==null?"":body.getCksl()).append("\",");
		bodyJSON.append("\"body.djh\":\"").append(body.getDjh()==null?"":body.getDjh()).append("\",");
		bodyJSON.append("\"body.djlx\":\"").append(body.getDjlx()==null?"":body.getDjlx()).append("\",");
		bodyJSON.append("\"body.ghbh\":\"").append(body.getGhbh()==null?"":body.getGhbh()).append("\",");
		bodyJSON.append("\"body.ghsj\":\"").append(body.getGhsj()==null?"":body.getGhsj()).append("\",");
		bodyJSON.append("\"body.jybmbm\":\"").append(body.getJybmbm()==null?"":body.getJybmbm()).append("\",");
		bodyJSON.append("\"body.jybmmc\":\"").append(body.getJybmmc()==null?"":body.getJybmmc()).append("\",");
		bodyJSON.append("\"body.jydqrq\":\"").append(body.getJydqrq()==null?"":body.getJydqrq()).append("\",");
		bodyJSON.append("\"body.kcsl\":\"").append(body.getKcsl()==null?"":body.getKcsl()).append("\",");
		bodyJSON.append("\"body.kctzId\":\"").append(body.getKctzId()==null?"":body.getKctzId()).append("\",");
		bodyJSON.append("\"body.lybmbm\":\"").append(body.getLybmbm()==null?"":body.getLybmbm()).append("\",");
		bodyJSON.append("\"body.lybmmc\":\"").append(body.getLybmmc()==null?"":body.getLybmmc()).append("\",");
		bodyJSON.append("\"body.lyrbh\":\"").append(body.getLyrbh()==null?"":body.getLyrbh()).append("\",");
		bodyJSON.append("\"body.lyrmc\":\"").append(body.getLyrmc()==null?"":body.getLyrmc()).append("\",");
		bodyJSON.append("\"body.lyrq\":\"").append(body.getLyrq()==null?"":body.getLyrq()).append("\",");
		bodyJSON.append("\"body.mid\":\"").append(body.getMid()==null?"":body.getMid()).append("\"");
		bodyJSON.append("\"body.rksl\":\"").append(body.getRksl()==null?"":body.getRksl()).append("\",");
		bodyJSON.append("\"body.rq\":\"").append(body.getRq()==null?"":body.getRq()).append("\",");
		bodyJSON.append("\"body.sfzxjl\":\"").append(body.getSfzxjl()==null?"":body.getSfzxjl()).append("\",");
		bodyJSON.append("\"body.sysUpdateTime\":\"").append(body.getSysUpdateTime()==null?"":body.getSysUpdateTime()).append("\",");
		bodyJSON.append("\"body.sysUpdateUser\":\"").append(body.getSysUpdateUser()==null?"":body.getSysUpdateUser()).append("\",");
		bodyJSON.append("\"body.tid\":\"").append(body.getTid()==null?"":body.getTid()).append("\"");
		bodyJSON.append("\"body.zcId\":\"").append(body.getZcId()==null?"":body.getZcId()).append("\",");
		bodyJSON.append("\"body.tzzt\":\"").append(body.getTzzt()==null?"":body.getTzzt()).append("\",");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
