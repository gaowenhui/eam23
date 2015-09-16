package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;

/**
 * 
 * @author 赵贤义
 *
 */
public class ZyPdxxListToJSON {
	
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<ZyPdxx> bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<ZyPdxx> i = bodyList.iterator(); i.hasNext();){
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
	public static String bodyToJSON(ZyPdxx body){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"body.bz\":\"").append(body.getBz()==null?"":body.getBz()).append("\",");
		bodyJSON.append("\"body.cksl\":\"").append(body.getCfdd()==null?"":body.getCfdd()).append("\",");
		bodyJSON.append("\"body.djh\":\"").append(body.getEjflbm()==null?"":body.getEjflbm()).append("\",");
		bodyJSON.append("\"body.djlx\":\"").append(body.getEjflmc()==null?"":body.getEjflmc()).append("\",");
		bodyJSON.append("\"body.ghbh\":\"").append(body.getGg()==null?"":body.getGg()).append("\",");
		bodyJSON.append("\"body.ghsj\":\"").append(body.getId()==null?"":body.getId()).append("\",");
		bodyJSON.append("\"body.jybmbm\":\"").append(body.getJldw()==null?"":body.getJldw()).append("\",");
		bodyJSON.append("\"body.jybmmc\":\"").append(body.getMid()==null?"":body.getMid()).append("\",");
		bodyJSON.append("\"body.jydqrq\":\"").append(body.getPdjg()==null?"":body.getPdjg()).append("\",");
		bodyJSON.append("\"body.kcsl\":\"").append(body.getPdpc()==null?"":body.getPdpc()).append("\",");
		bodyJSON.append("\"body.kctzId\":\"").append(body.getPdrq()==null?"":body.getPdrq()).append("\",");
		bodyJSON.append("\"body.lybmbm\":\"").append(body.getPdsl()==null?"":body.getPdsl()).append("\",");
		bodyJSON.append("\"body.lybmmc\":\"").append(body.getSbodyId()==null?"":body.getSbodyId()).append("\",");
		bodyJSON.append("\"body.lyrbh\":\"").append(body.getSheadId()==null?"":body.getSheadId()).append("\",");
		bodyJSON.append("\"body.lyrmc\":\"").append(body.getSjflbm()==null?"":body.getSjflbm()).append("\",");
		bodyJSON.append("\"body.lyrq\":\"").append(body.getSjflmc()==null?"":body.getSjflmc()).append("\",");
		bodyJSON.append("\"body.mid\":\"").append(body.getSl()==null?"":body.getSl()).append("\"");
		bodyJSON.append("\"body.rksl\":\"").append(body.getSybmbh()==null?"":body.getSybmbh()).append("\",");
		bodyJSON.append("\"body.rq\":\"").append(body.getSybmbmc()==null?"":body.getSybmbmc()).append("\",");
		bodyJSON.append("\"body.sfzxjl\":\"").append(body.getSyrbh()==null?"":body.getSyrbh()).append("\",");
		bodyJSON.append("\"body.sysUpdateTime\":\"").append(body.getSyrmc()==null?"":body.getSyrmc()).append("\",");
		bodyJSON.append("\"body.sysUpdateUser\":\"").append(body.getTid()==null?"":body.getTid()).append("\",");
		bodyJSON.append("\"body.tid\":\"").append(body.getYjflbm()==null?"":body.getYjflbm()).append("\"");
		bodyJSON.append("\"body.zcId\":\"").append(body.getYjflmc()==null?"":body.getYjflmc()).append("\",");
		bodyJSON.append("\"body.tzzt\":\"").append(body.getZcbh()==null?"":body.getZcbh()).append("\",");
		bodyJSON.append("\"body.tzzt\":\"").append(body.getZcmc()==null?"":body.getZcmc()).append("\",");
		bodyJSON.append("\"body.tzzt\":\"").append(body.getZcId()==null?"":body.getZcId()).append("\",");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
