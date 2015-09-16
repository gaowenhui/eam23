package com.tansun.eam2.jiekou.erp.action;

import java.util.List;

import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardjz;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 卡片减值 拼装xml
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Comment_JvalueSpd {

	public static StringBuffer CardAddHead(String method, String cardid) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
		erpxml.append("<soap:Header>");
		erpxml.append("<jic:header xmlns:jic=\"http://www.jic.cn/soa\" >");
		erpxml.append("<jic:auth_user>erp</jic:auth_user>");
		erpxml.append("<jic:auth_password>weblogic</jic:auth_password>");
		erpxml.append("<jic:svc_name>ERPCommonWS</jic:svc_name>");
		erpxml.append("<jic:req_appName>" + OAconfig.loginuse + "</jic:req_appName>");
		erpxml.append("</jic:header>");
		erpxml.append("</soap:Header>");
		erpxml.append("<soap:Body>");
		erpxml.append("<jic:service xmlns:jic=\"http://www.jic.cn/soa\">");
//		erpxml.append("<ufinterface roottag=\"card\" billtype=\"h8\" subtype=\"run\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"card\" billtype=\"h8\" subtype=\"run\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
						+ "\" isexchange=\"Y\" proc=\""
						+ method
//						+ "\" filename=\"h8_demo.xml\" operation=\"req\" account=\"0001\">");
						+ "\" filename=\"h8_demo.xml\" operation=\"req\" account=\"" +ERPconfig.account + "\">");
		erpxml.append("<card id=\"" + cardid + "\">");
		erpxml.append(" <card_head>");
		erpxml.append(" </card_head>");
		erpxml.append("<card_body>");
		return erpxml;
	}
	
	public static StringBuffer CardAddItemBody(String eampk, String cardcode,
			String resume, String ksdate, String sender,String shenqingliyou) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<eampk>" + eampk + "</eampk>");
//		erpxml.append("<pk_corp>10101</pk_corp>");
		erpxml.append("<pk_corp>"+ERPconfig.erpcompany+"</pk_corp>");
		erpxml.append("<devaluatedate>" + ksdate + "</devaluatedate>");
		erpxml.append("<cardcode>" + cardcode + "</cardcode>");
		erpxml.append("<resume>" + resume + "</resume>");
		erpxml.append("<devaluatereason>"+(shenqingliyou==null?"":shenqingliyou)+"</devaluatereason>");
		erpxml.append("<operator>" + sender + "</operator>");
		erpxml.append("<pk_predevaluate></pk_predevaluate>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static void insertjz(PublicDao dao, String cardcode,
			String eamcode, String eampk, String erpcode, String erpcodepk,
			String erppk) {
		try {
			String sql = "from  ErpCardjz  t where t.eampk=? ";
			List list = dao.find(sql, new Object[]{eampk});
			if (list.size() > 0) {
				ErpCardjz cardjz = (ErpCardjz) list.get(0);
				cardjz.setErpcode(erpcode);
				cardjz.setErpcodepk(erpcodepk);
				cardjz.setErppk(erppk);
				dao.update(cardjz);
			} else {
				ErpCardjz cardjz = new ErpCardjz();
				cardjz.setEamcode(eamcode);
				cardjz.setEampk(eampk);
				cardjz.setCardcode(cardcode);
				cardjz.setLccode(Comment.changedate(Comment.jzdate()));
				dao.save(cardjz);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static StringBuffer CardAddItemEnd() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</card_body>");
		erpxml.append("</card>");
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
}
