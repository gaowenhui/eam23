package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.CardaddZjmodel;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardspdaddsend;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * 卡片新增 审批增加拼装xml 
 * @author lantb
 *	根据一期相关代码复制更改
 */
public class Comment_AddSpd {

	public static StringBuffer CardAddHead(CaShead pojo, String medth) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"); 
		erpxml.append("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">");
		erpxml.append("<soap:Header>");
		erpxml.append("<jic:header xmlns:jic=\"http://www.jic.cn/soa\" >");
		erpxml.append("<jic:auth_user>erp</jic:auth_user>");
		erpxml.append("<jic:auth_password>weblogic</jic:auth_password>");
		erpxml.append("<jic:svc_name>ERPCommonWS</jic:svc_name>");
		erpxml.append("<jic:req_appName>"+OAconfig.loginuse+"</jic:req_appName>");
		erpxml.append("</jic:header>");
		erpxml.append("</soap:Header>");
		erpxml.append("<soap:Body>");
		erpxml.append("<jic:service xmlns:jic=\"http://www.jic.cn/soa\">");
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""+OAconfig.loginuse+"\" isexchange=\"Y\" proc=\""+medth+"\" filename=\"fa_hn_import.xml\" account=\"0001\">");
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""+OAconfig.loginuse+"\" isexchange=\"Y\" proc=\""+medth+"\" filename=\"fa_hn_import.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static String getErpCode(PublicDao dao, String eamcode) {
		String erpcode = null;
		try {
			String str = "from  ErpCardspdaddsend t  where t.bdh= ?";
			String [] strs = new String[1];
			strs[0] = eamcode;
			List list = dao.find(str, strs);
			if (list.size() > 0) {
				ErpCardspdaddsend erpcard = (ErpCardspdaddsend) list.get(0);
				erpcode = erpcard.getErpkpbm();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return erpcode;
	}
	
	public static StringBuffer CardAddItemHead(PublicDao dao, CaShead pojo,
			String billcode, String zdr,String erpurl) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + pojo.getId() + "\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<bill_code>" + Comment.checknull(billcode)+ "</bill_code>");
//		erpxml.append("<applycorp>10101</applycorp>");
		erpxml.append("<applycorp>" + ERPconfig.erpcompany + "</applycorp>");
//		erpxml.append("<fk_dept>1023</fk_dept>");
		erpxml.append("<fk_dept>"+pojo.getNgbm()+"</fk_dept>");
		erpxml.append("<applydate>" + Comment.NewDate() + "</applydate>");
		erpxml.append("<reason>"+(pojo.getBz()==null?"":pojo.getBz())+"</reason>");
//		erpxml.append("<proposer>"+pojo.getNgr()+"</proposer>");
//		erpxml.append("<maker>"+pojo.getNgr()+"</maker>");
		erpxml.append("<proposer></proposer>");
		erpxml.append("<maker>"+zdr+"</maker>");
		erpxml.append("<makedate>" + Comment.NewDate() + "</makedate>");
		erpxml.append("<checker></checker>");
		erpxml.append("<checkdate></checkdate>");
		erpxml.append("<def1></def1>");
		erpxml.append("<def2></def2>");
		erpxml.append("<def3></def3>");
		erpxml.append("<def4></def4>");
		erpxml.append("<def5></def5>");
		erpxml.append("<def6></def6>");
		erpxml.append("<def7></def7>");
		erpxml.append("<def8></def8>");
		erpxml.append("<def9>"+ Comment_AddSpd.getGubNotice(String.valueOf(pojo.getId()), dao, pojo) + "</def9>");
		erpxml.append("<def10></def10>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("<def12></def12>");
		erpxml.append("<def13></def13>");
		erpxml.append("<def14></def14>");
		erpxml.append("<def15></def15>");
		erpxml.append("<def16></def16>");
		erpxml.append("<def17></def17>");
		erpxml.append("<def18></def18>");
		erpxml.append("<def19></def19>");
		erpxml.append("<def20></def20>");
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static String getGubNotice(String floow, PublicDao dao,
			CaShead pojo) {
		String mulstr = "";
		List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{String.valueOf(pojo.getId())});
		if (mullist.size() > 0) {
			Iterator optioniter = mullist.iterator();
			while (optioniter.hasNext()) {
				PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
				mulstr = mulstr + mulpojo.getYjnr()	+ mulpojo.getTjr() + mulpojo.getTjrq();
			}
		}
		if (mulstr != null) {
			if (mulstr.length() > 100) {
				mulstr = mulstr.substring(0, 99);
			}
		}
		
		return mulstr;
	}
	
	public static ErpCardspdaddsend getCardValue(CaShead pojo, LcCardtemp lccardtem, String zccode) {
		ErpCardspdaddsend temp = new ErpCardspdaddsend();
		temp.setBdh(String.valueOf(pojo.getId()));
		temp.setDypk(String.valueOf(lccardtem.getId()));
		temp.setErpzcbm("");
		temp.setErpkpbm("");
		temp.setFhbm("");
		temp.setFhxx("");
		temp.setSfbh("");
		temp.setKpid(lccardtem.getErppk());
//		temp.setGsbm("10101");
		temp.setGsbm(ERPconfig.erpcompany);
		temp.setDjh("");
//		temp.setSqdwbm("10101");
		temp.setSqdwbm(ERPconfig.erpcompany);
		temp.setSqbmbm("1023");
		temp.setSqrq(String.valueOf(pojo.getNgrq()));
		temp.setSqly("EAM系统增加");
		temp.setJbrbm("");
		temp.setZdrbm(OAconfig.loginuse);
		temp.setZdrq(String.valueOf(pojo.getNgrq()));
		temp.setShrbm("");
		temp.setShrq(lccardtem.getQydate());
		temp.setJe(Comment.checknull(String.valueOf(lccardtem.getYbyz())));
		temp.setZjfs(lccardtem.getAddtype());
		temp.setSfcj(lccardtem.getIfjc());
		temp.setSyyx(Comment.checknull(String.valueOf((lccardtem.getSyyx()==null?0l:lccardtem.getSyyx())+ (lccardtem.getSynx()==null?0l:lccardtem.getSynx()) * 12)));
		temp.setSyzk(lccardtem.getUsestatus());
		temp.setLbbm(lccardtem.getTypecode());
		temp.setZcbm(lccardtem.getZcid());
		temp.setZcmc(lccardtem.getZcname());
		temp.setSl(lccardtem.getGlbm());
		temp.setSybmbm(lccardtem.getUsepartment());
		temp.setGgxh(lccardtem.getGgxh());
		temp.setCfdd(lccardtem.getSaveadsress());
		return temp;
	}
	
	public static String getbillcode(String billcode, PublicDao dao) {
		try {
			String sql = "from  ErpCardspdaddsend t where t.dypk = ?";
			String strs [] = new String[1];
			strs[0] = billcode;
			List list = dao.find(sql, strs);
			if (list.size() > 0) {
				Iterator it = list.iterator();
				if (it.hasNext()) {
					ErpCardspdaddsend erpsend = (ErpCardspdaddsend) it.next();
					billcode = erpsend.getErpzcbm();
				}
			} else {
				billcode = "";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return billcode;
	}
	
	public static StringBuffer CardAddItemBody(ErpCardspdaddsend temp,
			String eampk, String zcbm, PublicDao dao, String srybm) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<billbid>" + Comment.checknull(eampk) + "</billbid>");
		erpxml.append("<assettype>" + Comment.checkzjgc(temp.getLbbm())+ "</assettype>");
		erpxml.append("<assetcode>" + Comment.checknull(zcbm) + "</assetcode>");
		erpxml.append("<assetname>" + temp.getZcmc() + "</assetname>");
		erpxml.append("<usedept>" + temp.getSybmbm() + ":100</usedept>");
		erpxml.append("<useperson>" + srybm + "</useperson>");
		erpxml.append("<spec>" + Comment.checknull(temp.getGgxh()) + "</spec>");
		erpxml.append("<site>" + Comment.checknull(temp.getCfdd()) + "</site>");
		erpxml.append("<quantity>1</quantity>");
		erpxml.append("<originbase>" + temp.getJe() + "</originbase>");
		erpxml.append("<def1></def1>");
		erpxml.append("<def2></def2>");
		erpxml.append("<def3>" + temp.getSyyx() + "</def3>");
		erpxml.append("<def4></def4>");
		erpxml.append("<def5></def5>");
		erpxml.append("<def6>" + temp.getSyzk() + "</def6>");
		erpxml.append("<def7>" + temp.getShrq() + "</def7>");
		erpxml.append("<def8></def8>");
		erpxml.append("<def9></def9>");
		erpxml.append("<def10></def10>");
		erpxml.append("<def11></def11>");
		erpxml.append("<def12></def12>");
		erpxml.append("<def13></def13>");
		erpxml.append("<def14></def14>");
		erpxml.append("<def15></def15>");
		erpxml.append("<def16></def16>");
		erpxml.append("<def17>" + temp.getDypk() + "</def17>");
		erpxml.append("<def18>" + temp.getZjfs() + "</def18>");
		erpxml.append("<def19></def19>");
		erpxml.append("<def20>" + Comment.checkifjc(temp.getSfcj())+ "</def20>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static void saveOrUpdate(PublicDao dao, LcCardtemp temp,CaShead pojo, ErpCardspdaddsend erpcardvalue) {
		String str1 = "from ErpCardspdaddsend t  where t.dypk = ? and t.bdh = ?";
		String[] strs = new String[2];
		strs[0] = String.valueOf(temp.getId());
		strs[1] = String.valueOf(pojo.getId());
		List list2 = dao.find(str1, strs);
		if (list2.size() > 0) {
			ErpCardspdaddsend erpcard = (ErpCardspdaddsend) list2.get(0);
			erpcard.setSfbh("");
			dao.update(erpcard);
		} else {
			dao.save(erpcardvalue);
		}
	}
	
	public static StringBuffer CardAddItemEnd() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</bill_body>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static List pasexml(String documentstr) {
		String billpk = "";
		String bdocid = "";
		String resultcode = "";
		String resultdescription = "";
		String cardcode = "";
		String asset_code = "";
		List resultlist = new ArrayList();
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(documentstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
			//
//			List list1 = books.getChildren("sendresult");
//			for (Iterator it = list1.iterator(); it.hasNext();) {
//				Element book = (Element) it.next();
//				bdocid = book.getChildTextTrim("bdocid");
//				resultcode = book.getChildTextTrim("resultcode");
//				resultdescription = book.getChildTextTrim("resultdescription");
//				List list2 = book.getChildren("content");
//				Iterator it2 = list2.iterator();
//				Element book2 = (Element) it2.next();
//				List list3 = book2.getChildren("bill");
//				Iterator it3 = list3.iterator();
//				Element book3 = (Element) it3.next();
//				asset_code = book3.getChildTextTrim("billcode");
//				billpk = book3.getChildTextTrim("billpk");
//				List cardlist = book3.getChildren("card");
//				for (Iterator it4 = cardlist.iterator(); it4.hasNext();) {
//					Element book4 = (Element) it4.next();
//					String erppk = book4.getAttributeValue("id");
//					String eamcard = book4.getText();
//					CardaddZjmodel cardinfo = new CardaddZjmodel();
//					cardinfo.setEamCode(bdocid);
//					cardinfo.setEamPk(erppk);
//					cardinfo.setErpCardCode(asset_code);
//					cardinfo.setErpZcCode(eamcard);
//					cardinfo.setReturnCode(resultcode);
//					cardinfo.setReturnInfo(resultdescription);
//					cardinfo.setErppk(billpk);
//					resultlist.add(cardinfo);
//				}
//			}
			//修改卡片新增读取xml顺序
			List lists2 = books.getChildren("sendresult");
			for (Iterator it = lists2.iterator(); it.hasNext();) {
				Element book = (Element) it.next();
				bdocid = book.getChildTextTrim("bdocid");
				resultcode = book.getChildTextTrim("resultcode");
				resultdescription = book.getChildTextTrim("resultdescription");
			}
			List list1 = books.getChildren("bill");
			
			for (Iterator it = list1.iterator(); it.hasNext();) {
				Element book = (Element) it.next();
				List list2 = book.getChildren("bill");
				Iterator it3 = list2.iterator();
				Element book3 = (Element) it3.next();
				asset_code = book3.getChildTextTrim("billcode");
				billpk = book3.getChildTextTrim("billpk");
				List cardlist = book3.getChildren("card");
				for (Iterator it4 = cardlist.iterator(); it4.hasNext();) {
					Element book4 = (Element) it4.next();
					String erppk = book4.getAttributeValue("id");
					String eamcard = book4.getText();
					CardaddZjmodel cardinfo = new CardaddZjmodel();
					cardinfo.setEamCode(bdocid);
					cardinfo.setEamPk(erppk);
					cardinfo.setErpCardCode(asset_code);
					cardinfo.setErpZcCode(eamcard);
					cardinfo.setReturnCode(resultcode);
					cardinfo.setReturnInfo(resultdescription);
					cardinfo.setErppk(billpk);
					resultlist.add(cardinfo);
				}
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultlist;
	}
	
	public static void ChangeInterface(PublicDao dao, List list,
			CaShead pojo) {
		String erpnotice = pojo.getErpnotice();
		if (erpnotice != null) {
			String sql = "from ErpCardspdaddsend t  where  t.bdh = ?";
			String []strs = new String[1];
			strs[0] = String.valueOf(pojo.getId());
			List lista = dao.find(sql, strs);
			Iterator it1 = lista.iterator();
			while (it1.hasNext()) {
				ErpCardspdaddsend delspd = (ErpCardspdaddsend) it1.next();
				String dypk = delspd.getDypk();
				String tempsql = "from LcCardtemp td where td.id= ?";
				Long []strs1 = new Long[1];
				strs1[0] = Long.valueOf(dypk);
				List listb = dao.find(tempsql, strs1);
				if (listb.size() < 1) {
					dao.delete(delspd);
				} else {
					delspd.setSfbh(null);
					delspd.setFhxx(null);
					dao.update(delspd);
				}
			}
		}

		Iterator it = list.iterator();
		while (it.hasNext()) {
			CardaddZjmodel model = (CardaddZjmodel) it.next();
			String cardcode = model.getEamCode();
			String cardpk = model.getEamPk();
			String str1 = "from ErpCardspdaddsend t  where t.dypk = ? and t.bdh = ?";
			String []strs1 = new String[2];
			strs1[0] = model.getEamPk();
			strs1[1] = model.getEamCode();
			List list2 = dao.find(str1, strs1);
			if (list2.size() > 0) {
				ErpCardspdaddsend erpcard = (ErpCardspdaddsend) list2.get(0);
				erpcard.setErpkpbm(model.getErpCardCode());
				erpcard.setErpzcbm(model.getErpZcCode());
				erpcard.setKpid(model.getErppk());
				erpcard.setFhbm("1");
				erpcard.setSfbh("");
				dao.update(erpcard);
			}
			String cardsql = "from LcCardtemp td where td.kpxzid = '"+model.getEamCode()+"' and td.wfconfigCode = ? and td.id = '"+model.getEamPk()+"'";
			String [] strs2 = new String[1];
			strs2[0] = pojo.getWfconfigCode();
			List list1 = dao.find(cardsql, strs2);
			if (list1.size() > 0) {
				LcCardtemp lccardtemp = (LcCardtemp) list1.get(0);
				lccardtemp.setErpassetcode(model.getErpCardCode());
				lccardtemp.setErppk(model.getErppk());
				dao.update(lccardtemp);
			}
		}
		pojo.setSenderp("1");
		dao.update(pojo);
	}
	
	public static StringBuffer QuerySpd(String bill_code) {
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
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"hnq_query_demo.xml\" proc=\"query\" operation=\"req\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"hnq_query_demo.xml\" proc=\"query\" operation=\"req\" account=\"" +ERPconfig.account + "\">");
		erpxml.append("<bill id=\"QUERY\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
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
	
	public static StringBuffer QueryCardCode(String erpcardpk,String erpcode) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<?xml version=\"1.0\" encoding=\"GBK\"?>");
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
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hn\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver+ "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"查询资产新增审批单表体卡片信息.xml\" proc=\"queryhnb\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"查询资产新增审批单表体卡片信息.xml\" proc=\"queryhnb\" account=\"" +ERPconfig.account + "\">");
		
		erpxml.append("<bill id=\"QUERY\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<bill_code>" + erpcardpk + "</bill_code>");
		erpxml.append("<billbid>" + erpcardpk + "</billbid>"); 
		erpxml.append("</bill_head>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static String getQueryerppk(String inputstr, String str1) {
		String id = "";
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
//			List list1 = books.getChildren("queryresult");
			List list1 = books.getChildren("result");
			if(list1.size()>0){
				Iterator it = list1.iterator();
				Element book1 = (Element) it.next();
				List list2 = book1.getChildren("result");
				Iterator it3 = list2.iterator();
				Element book3 = (Element) it3.next();
				List list4 = book3.getChildren("card");
				Iterator it4 = list4.iterator();
				Element book4 = (Element) it4.next();
				id = book4.getChildTextTrim(str1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	
	public static String getEamPk(String str, String start, String end) {
		String s = "";
		if (str.length() > 0) {
			int i = str.indexOf(start);
			int j = str.lastIndexOf(end);
			s = str.substring(i + start.length(), j);
		}
		return s;
	}
}
