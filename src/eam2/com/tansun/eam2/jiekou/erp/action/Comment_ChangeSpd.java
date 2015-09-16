package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 卡片变动 拼装xml
 * @author lantb
 *	根据一期相关代码复制更改
 */
public class Comment_ChangeSpd {

	public static StringBuffer EsbHead() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
		erpxml.append("<soap:Header>");
		erpxml.append("<jic:header xmlns:jic=\"http://www.jic.cn/soa\" >");
		erpxml.append("<jic:auth_user>erp</jic:auth_user>");
		erpxml.append("<jic:auth_password>weblogic</jic:auth_password>");
		erpxml.append("<jic:svc_name>ERPCommonWS</jic:svc_name>");
		erpxml.append("<jic:req_appName>" + OAconfig.loginuse+ "</jic:req_appName>");
		erpxml.append("</jic:header>");
		erpxml.append("</soap:Header>");
		erpxml.append("<soap:Body>");
		erpxml.append("<jic:service xmlns:jic=\"http://www.jic.cn/soa\">");
		return erpxml;
	}
	
	public static StringBuffer ErpModelhead() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.erpcompany +"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"资产变动审批单.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"资产变动审批单.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static String geterpcode(PublicDao dao, String str) {
		String code = "";
		try {
			String sql = "select t.erpcode from erp_cardbdsend  t where t.eamcode='"+ str + "'";
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				code = (String)((Map) list.get(0)).get("ERPCODE");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return code;
	}
	
	public static StringBuffer ErpAddhead() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.erpcompany+"\" sender=\""
				+ OAconfig.loginuse
//				+ "\" isexchange=\"Y\" proc=\"add\" filename=\"资产变动审批单.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"add\" filename=\"资产变动审批单.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer Erpbillbody(String cardcode, String assetcode,
			String newvalue, String oldvalue, String reason, String adress) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardcode>" + cardcode + "</cardcode>");
		erpxml.append("<asset_code>" + assetcode + "</asset_code>");
		erpxml.append("<fk_carditem>" + Comment.checknull(adress) + "</fk_carditem>");
		erpxml.append("<newvalue>" + newvalue + "</newvalue>");
		erpxml.append("<oldvalue>" + oldvalue + "</oldvalue>");
		erpxml.append("<alertreason>" + reason + "</alertreason>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static String getreasoncode(PublicDao dao, String str) { //查询变动原因的 code表和dic_app_asset_state表对应的数据
		String code = "";
		try {
			String sql = "select   t.code   from dic_app_asset_state t   where t.type='changeReason' and t.pk_id ='" + str + "'";
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				code = (String) ((HashMap) list.get(0)).get("code");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return code;
	}
	
	public static StringBuffer Erpbillhead(String billid, String billcode,String erpurl,
			String type, String notice, String sender,String shenqingliyou) {
		Date now = new Date();
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + billid + "\">");
		erpxml.append("<bill_head>");
		erpxml.append("<source>6</source>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>"+ERPconfig.erpcompany+"</company>");
		erpxml.append("<bill_code>" + billcode + "</bill_code>");
		erpxml.append("<recorder>" + sender + "</recorder>");
		erpxml.append("<recorddate>" + Comment.changedate(now)+ "</recorddate>");
		erpxml.append("<reason>"+(shenqingliyou==null?"":shenqingliyou)+"</reason>");
		erpxml.append("<altertype>" + type + "</altertype>");
		erpxml.append("<reason></reason>");
		erpxml.append("<def9>" + Comment.checklength(notice) + "12345678</def9>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer  Erpbillend() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</bill_body>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		return erpxml;
	}
	
	public static StringBuffer Esbend() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static StringBuffer QuerySpd(String bill_code) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<?xml version=\"1.0\" encoding=\"GBK\"?>");
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
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h3\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"hnq_query_demo.xml\" proc=\"query\" operation=\"req\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"hnq_query_demo.xml\" proc=\"query\" operation=\"req\" account=\"" +ERPconfig.account +"\">");
		erpxml.append("<bill id=\"QUERY\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>"+ERPconfig.erpcompany+"</company>");
		erpxml.append("<bill_code>" + bill_code + "</bill_code>");
		erpxml.append("</bill_head>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static String getQueryvalue(String inputstr, String str1) {
		String id = "";
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
			List list1 = books.getChildren("queryresult");
			Iterator it = list1.iterator();
			Element book1 = (Element) it.next();
			List list2 = book1.getChildren("result");
			Iterator it3 = list2.iterator();
			Element book3 = (Element) it3.next();
			List list4 = book3.getChildren("bill");
			Iterator it4 = list4.iterator();
			Element book4 = (Element) it4.next();
			id = book4.getChildTextTrim(str1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
}
