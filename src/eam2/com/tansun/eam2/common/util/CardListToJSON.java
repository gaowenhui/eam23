package com.tansun.eam2.common.util;

import java.util.Iterator;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;


public class CardListToJSON {
	/**
	 * 这个方法是将一个List<ZySbody>转化为JSON字符串
	 * @param bodyList:一个List<ZySbody>,这是json字符串的主要数据。对应jqgrid的每一行
	 * @param totalPages 总共多少页
	 * @param currentPage 当前第几页
	 * @param totalRecords 总共多少条数据
	 * @return 返回一个JSON字符串，内容是jqgrid的数据
	 */
	public static String getJSON(List<Cardinfo> cardList,int totalPages,int currentPage,int totalRecords){
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(totalPages).append("\",");
		jsonSB.append("\"page\" : \"").append(currentPage).append("\",");
		jsonSB.append("\"records\" : \"").append(totalRecords).append("\",");
		jsonSB.append("\"rows\" : [");
		for(Iterator<Cardinfo> i = cardList.iterator(); i.hasNext();){
			jsonSB.append(cardToJSON(i.next()));
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
	public static String cardToJSON(Cardinfo card){
		StringBuffer bodyJSON = new StringBuffer();
		bodyJSON.append("{");
		bodyJSON.append("\"card.id\":\"").append(card.getId()==null?"":card.getId()).append("\",");
		bodyJSON.append("\"card.cardcode\":\"").append(card.getCardcode()==null?"":card.getCardcode()).append("\",");
		bodyJSON.append("\"card.zcname\":\"").append(card.getZcname()==null?"":card.getZcname()).append("\",");
//		bodyJSON.append("\"\":\"").append("").append("\",");
//		bodyJSON.append("\"\":\"").append("").append("\",");
		bodyJSON.append("\"card.saveadsress\":\"").append(card.getSaveadsress()==null?"":card.getSaveadsress()).append("\",");
		bodyJSON.append("\"card.usepartment\":\"").append(card.getUsepartment()==null?"":card.getUsepartment()).append("\",");
		bodyJSON.append("\"card.glbm\":\"").append(card.getGlbm()==null?"":card.getGlbm()).append("\",");
		bodyJSON.append("\"card.firstbranch\":\"").append(card.getFirstbranch()==null?"":card.getFirstbranch()).append("\"");
		bodyJSON.append("}");
		return bodyJSON.toString();
	}
}
