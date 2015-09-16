package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardreducesend;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * 卡片变动,卡片减少 拼装xml
 * @author lantb
 *	根据一期相关代码复制更改
 */
public class Comment_Reduce {

	public static String getQueryvalue(String inputstr, String str1) {
		String id = "";
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
//			List list1 = books.getChildren("sendresult");
//			Iterator it = list1.iterator();
//			Element book1 = (Element) it.next();
//			List list2 = book1.getChildren("content");
//			Iterator it3 = list2.iterator();
//			Element book3 = (Element) it3.next();
//			List list4 = book3.getChildren("bill");
//			Iterator it4 = list4.iterator();
//			Element book4 = (Element) it4.next();
//			id = book4.getChildTextTrim(str1);
			/**
			 * 修改读取xml
			 */
			List list1 = books.getChildren("bill");
			Iterator it = list1.iterator();
			Element book1 = (Element) it.next();
			List list2 = book1.getChildren("bill");
			Iterator it3 = list2.iterator();
			Element book3 = (Element) it3.next();
			id = book3.getChildTextTrim(str1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	
	public static String getQueryAtt(String inputstr, String str1) {
		String id = "";
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
//			List list1 = books.getChildren("sendresult");
//			Iterator it = list1.iterator();
//			Element book1 = (Element) it.next();
//			List list2 = book1.getChildren("content");
//			Iterator it3 = list2.iterator();
//			Element book3 = (Element) it3.next();
//			List list4 = book3.getChildren("bill");
//			Iterator it4 = list4.iterator();
//			Element book4 = (Element) it4.next();
//			id = book4.getAttributeValue(str1);
			
			/**
			 * 修改读取xml
			 */
			List list1 = books.getChildren("bill");
			Iterator it = list1.iterator();
			Element book1 = (Element) it.next();
			List list2 = book1.getChildren("bill");
			Iterator it3 = list2.iterator();
			Element book3 = (Element) it3.next();
			id = book3.getAttributeValue(str1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	
	public static String getGubNotice(PublicDao dao, CaShead pojo) {
		String mulstr = "";
		List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{String.valueOf(pojo.getId())});
		if (mullist.size() > 0) {
			Iterator optioniter = mullist.iterator();
			while (optioniter.hasNext()) {
				PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
				mulstr = mulstr + mulpojo.getYjnr()	+ mulpojo.getTjr() + mulpojo.getTjrq();
			}
		}
		return mulstr;
	}
	
	public static StringBuffer CardReduceHead() {
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
		return erpxml;
	}
	
	public static StringBuffer Erpupdatetype() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver +"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"update\"	filename=\"资产减少审批单.xml\"  account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"update\"	filename=\"资产减少审批单.xml\"  account=\""+ERPconfig.account+"\">");
		return erpxml;
	}
	
	public static String QueryerpCode(String eamdjh, PublicDao dao) {
		String erpcode = "";
		try {
			String sql = "select t.erpdjh  from erp_cardreducesend t  where t.eamdjh=?  and t.erpdjh is not null";
			List list = dao.queryForList(sql, new Object[]{eamdjh});
			Iterator it = list.iterator();
			if (it.hasNext()) {
				erpcode = (String) ((HashMap)it.next()).get("erpdjh");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return erpcode;
	}
	
	public static StringBuffer Erpaddtype() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver +"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"add\"	filename=\"资产减少审批单.xml\"  account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"add\"	filename=\"资产减少审批单.xml\"  account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer CardReduceItemHead(String billid,
			String billcode, String eamnotice, String sender,String erpurl) {
		if(eamnotice!=null){
			if(eamnotice.length()>100){
				eamnotice = eamnotice.substring(0,100);
			}
		}
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + billid + "\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>"+ERPconfig.erpcompany+"</company>");
		erpxml.append("<bill_code>" + billcode + "</bill_code>");
		erpxml.append("<recorder>" + sender + "</recorder>");
		erpxml.append("<recorddate>" + Comment.changedate(new Date()) + "</recorddate>");
		erpxml.append("<source>6</source>");
		erpxml.append("<def9>" + eamnotice + "</def9>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer CardReduceItemBody(LcCardtemp temp,String shenqingliyou) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardcode>" + temp.getCardcode() + "</cardcode>");
		erpxml.append("<asset_code>" + temp.getErpassetcode() + "</asset_code>");
		erpxml.append("<fk_addreducestyle>" + temp.getDealmethod() + "</fk_addreducestyle>");
		erpxml.append("<income></income>");
		erpxml.append("<expense></expense>");
		erpxml.append("<reason>"+ (shenqingliyou==null?"":shenqingliyou)+"</reason>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static void savejl(PublicDao dao, String kpbm, String zcbm,
			String eamdjh, String jgdm) {
		try {
			String sql = "from  ErpCardreducesend  t where t.kpbm=? ";
			List list = dao.find(sql, new Object[]{kpbm});
			if (list.size() > 0) {
				ErpCardreducesend cardreduce = (ErpCardreducesend) list.get(0);
				cardreduce.setKpbm(kpbm);
				cardreduce.setZcbm(zcbm);
				cardreduce.setEamdjh(eamdjh);
				cardreduce.setJgdm(jgdm);
				cardreduce.setZcmc("");
				dao.update(cardreduce);
			} else {
				ErpCardreducesend cardreduce = new ErpCardreducesend();
				cardreduce.setKpbm(kpbm);
				cardreduce.setZcbm(zcbm);
				cardreduce.setEamdjh(eamdjh);
				cardreduce.setJgdm(jgdm);
				dao.save(cardreduce);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static StringBuffer CardReduceItemEnd() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</bill_body>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static void savereduce(PublicDao dao, String kpbm, String zcbm,
			String erpcode, String eamdjh, String jgdm) {
		try {
			String sql = "from  ErpCardreducesend  t where t.kpbm=? ";
			List list = dao.find(sql, new Object[]{kpbm});
			if (list.size() > 0) {
				ErpCardreducesend cardreduce = (ErpCardreducesend) list.get(0);
				cardreduce.setKpbm(kpbm);
				cardreduce.setZcbm(zcbm);
				cardreduce.setEamdjh(eamdjh);
				cardreduce.setJgdm(jgdm);
				cardreduce.setErpdjh(erpcode);
				cardreduce.setZcmc("");
				dao.update(cardreduce);
			} else {
				ErpCardreducesend cardreduce = new ErpCardreducesend();
				cardreduce.setKpbm(kpbm);
				cardreduce.setZcbm(zcbm);
				cardreduce.setEamdjh(eamdjh);
				cardreduce.setJgdm(jgdm);
				dao.save(cardreduce);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static StringBuffer getReduceQuerySpd(String bill_code) {
		StringBuffer erpxml = new StringBuffer();
		try {
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
//			erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
			erpxml.append("<ufinterface roottag=\"bill\" billtype=\"h2\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver +"\" sender=\""
							+ OAconfig.loginuse
//							+ "\" isexchange=\"Y\" filename=\"资产减少审批单查询.xml\" proc=\"query\" operation=\"req\"  account=\"0001\">");
							+ "\" isexchange=\"Y\" filename=\"资产减少审批单查询.xml\" proc=\"query\" operation=\"req\"  account=\""+ERPconfig.account+"\">");
			erpxml.append("<bill id=\"QUERY\">");
			erpxml.append("<bill_head>");
//			erpxml.append("<company>10101</company>");
			erpxml.append("<company>"+ERPconfig.erpcompany +"</company>");
			erpxml.append("<bill_code>" + bill_code + "</bill_code>");
			erpxml.append("</bill_head>");
			erpxml.append("</bill>");
			erpxml.append("</ufinterface>");
			erpxml.append("</jic:service>");
			erpxml.append("</soap:Body>");
			erpxml.append("</soap:Envelope>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return erpxml;
	}
}
