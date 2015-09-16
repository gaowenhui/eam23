package com.tansun.eam2.zyzc.utils;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.ZyZc;

/**
 * 
 * @author 赵贤义
 *
 */
public class ZyZcListToJSON {
	
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<ZyZc> bodyList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<ZyZc> i = bodyList.iterator(); i.hasNext();){
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
	public static String bodyToJSON(ZyZc body){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"body.bgdd\":\"").append(body.getBgdd()==null?"":body.getBgdd()).append("\",");
		bodyJSON.append("\"body.bz\":\"").append(body.getBz()==null?"":body.getBz()).append("\",");
		bodyJSON.append("\"body.cbrq\":\"").append(body.getCbrq()==null?"":body.getCbrq()).append("\",");
		bodyJSON.append("\"body.cpuxh\":\"").append(body.getCpuxh()==null?"":body.getCpuxh()).append("\",");
		bodyJSON.append("\"body.czyz\":\"").append(body.getCzyz()==null?"":body.getCzyz()).append("\",");
		bodyJSON.append("\"body.disk\":\"").append(body.getDisk()==null?"":body.getDisk()).append("\",");
		bodyJSON.append("\"body.dzyhdj\":\"").append(body.getDzyhdj()==null?"":body.getDzyhdj()).append("\",");
		bodyJSON.append("\"body.dzyhjg\":\"").append(body.getDzyhjg()==null?"":body.getDzyhjg()).append("\",");
		bodyJSON.append("\"body.ejflbm\":\"").append(body.getEjflbm()==null?"":body.getEjflbm()).append("\",");
		bodyJSON.append("\"body.ejflmc\":\"").append(body.getEjflmc()==null?"":body.getEjflmc()).append("\",");
		bodyJSON.append("\"body.fdjbh\":\"").append(body.getFdjbh()==null?"":body.getFdjbh()).append("\",");
		bodyJSON.append("\"body.gg\":\"").append(body.getGg()==null?"":body.getGg()).append("\",");
		bodyJSON.append("\"body.jldw\":\"").append(body.getJldw()==null?"":body.getJldw()).append("\",");
		bodyJSON.append("\"body.kpbh\":\"").append(body.getKpbh()==null?"":body.getKpbh()).append("\",");
		bodyJSON.append("\"body.kssyrq\":\"").append(body.getKssyrq()==null?"":body.getKssyrq()).append("\",");
		bodyJSON.append("\"body.memory\":\"").append(body.getMemory()==null?"":body.getMemory()).append("\",");
		bodyJSON.append("\"body.mid\":\"").append(body.getMid()==null?"":body.getMid()).append("\",");
		bodyJSON.append("\"body.nzdisk\":\"").append(body.getNzdisk()==null?"":body.getNzdisk()).append("\",");
		bodyJSON.append("\"body.sjflbm\":\"").append(body.getSjflbm()==null?"":body.getSjflbm()).append("\",");
		bodyJSON.append("\"body.sjflmc\":\"").append(body.getSjflmc()==null?"":body.getSjflmc()).append("\",");
		bodyJSON.append("\"body.sl\":\"").append(body.getSl()==null?"":body.getSl()).append("\",");
		bodyJSON.append("\"body.sszg\":\"").append(body.getSszg()==null?"":body.getSszg()).append("\",");
		bodyJSON.append("\"body.sysUpdateTime\":\"").append(body.getSysUpdateTime()==null?"":body.getSysUpdateTime()).append("\",");
		bodyJSON.append("\"body.sysUpdateUser\":\"").append(body.getSysUpdateUser()==null?"":body.getSysUpdateUser()).append("\",");
		bodyJSON.append("\"body.syzk\":\"").append(body.getSyzk()==null?"":body.getSyzk()).append("\",");
		bodyJSON.append("\"body.tid\":\"").append(body.getTid()==null?"":body.getTid()).append("\",");
		bodyJSON.append("\"body.txmbh\":\"").append(body.getTxmbh()==null?"":body.getTxmbh()).append("\",");
		bodyJSON.append("\"body.wzbh\":\"").append(body.getWzbh()==null?"":body.getWzbh()).append("\",");
		bodyJSON.append("\"body.xlh\":\"").append(body.getXlh()==null?"":body.getXlh()).append("\",");
		bodyJSON.append("\"body.xtxsq\":\"").append(body.getXtxsq()==null?"":body.getXtxsq()).append("\",");
		bodyJSON.append("\"body.yjflbm\":\"").append(body.getYjflbm()==null?"":body.getYjflbm()).append("\",");
		bodyJSON.append("\"body.yjflmc\":\"").append(body.getYjflmc()==null?"":body.getYjflmc()).append("\",");
		bodyJSON.append("\"body.yjkcsl\":\"").append(body.getYjkcsl()==null?"":body.getYjkcsl()).append("\",");
		bodyJSON.append("\"body.ylrr\":\"").append(body.getYlrr()==null?"":body.getYlrr()).append("\",");
		bodyJSON.append("\"body.zcbh\":\"").append(body.getZcbh()==null?"":body.getZcbh()).append("\",");
		bodyJSON.append("\"body.zcId\":\"").append(body.getZcId()==null?"":body.getZcId()).append("\",");
		bodyJSON.append("\"body.zcmc\":\"").append(body.getZcmc()==null?"":body.getZcmc()).append("\",");
		bodyJSON.append("\"body.zczt\":\"").append(body.getZczt()==null?"":body.getZczt()).append("\",");
		bodyJSON.append("\"body.zjxgsj\":\"").append(body.getZjxgsj()==null?"":body.getZjxgsj()).append("\",");
		bodyJSON.append("\"body.ztwz\":\"").append(body.getZtwz()==null?"":body.getZtwz()).append("\"");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
