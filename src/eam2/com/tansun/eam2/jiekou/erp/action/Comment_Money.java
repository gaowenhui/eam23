package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.bo.ErpFyspd;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 卡片减值用 确权用
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Comment_Money {
	public static StringBuffer Esbhead() {
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
	
	public static StringBuffer Esbend() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static StringBuffer QueryFySpd(String id, String value1,
			String value2) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<voucher id =\"" + id + "\" subdoctype=\"test\">");
		erpxml.append("<voucher_head>");
		erpxml.append("<corp>10101</corp> ");
//		erpxml.append("<corp>"+ERPconfig.erpcompany+"</corp> ");
		erpxml.append("<businessType>23AC</businessType>");
		erpxml.append("<freeitem8>" + id + "</freeitem8>");
		erpxml.append("<freeitem19>" + value1 + "</freeitem19>");
		erpxml.append("<ddhh>" + value2 + "</ddhh>");
		erpxml.append("</voucher_head>");
		erpxml.append("</voucher>");
		erpxml.append("</ufinterface>");
		return erpxml;
	}
	
	public static StringBuffer QueryFyhead() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZq\" subtype=\"run\" replace=\"Y\" receiver=\"10101\" sender=\""
//		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZq\" subtype=\"run\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"dz_query_demo.xml\" proc=\"query\" operation=\"req\"  account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"dz_query_demo.xml\" proc=\"query\" operation=\"req\"  account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer AddFyhead(String sender) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZ\" subtype=\"run\" replace=\"Y\" receiver=\"10101\" sender=\""
//		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZ\" subtype=\"run\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"dz_demonew.xml\" proc=\"add\" operation=\"req\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"dz_demonew.xml\" proc=\"add\" operation=\"req\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static String FySpd(String bill, PublicDao dao) {
		String id = "";
		try {
			String sql = "select  t from  ErpFyspd  t  where t.bdocid=?";
			List list7 = dao.find(sql, new Object[]{bill});
			if (list7.size() > 0) {
				Iterator it7 = list7.iterator();
				while (it7.hasNext()) {
					ErpFyspd fyspd = (ErpFyspd) it7.next();
					String eamvalue = fyspd.getEampk();
					String erpvalue = fyspd.getErppk();
					StringBuffer xml = new StringBuffer();
					xml.append(Comment_Money.Esbhead());
					xml.append(Comment_Money.QueryFyhead());
					xml.append(Comment_Money.QueryFySpd(bill, eamvalue, erpvalue));
					xml.append(Comment_Money.Esbend());
					String input = new Comment().sender(xml);
					String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
					String code = Comment.getvalue(documentstr, "resultcode");
					if (code.equals("1")) {
						SAXBuilder builder = new SAXBuilder(false);
						Reader in = new StringReader(documentstr);
						Document doc = builder.build(in);
						Element books = doc.getRootElement();
						List list1 = books.getChildren("queryresult");
						Iterator it = list1.iterator();
						Element book1 = (Element) it.next();
						List list2 = book1.getChildren("bill");
						Iterator it2 = list2.iterator();
						Element book2 = (Element) it2.next();
						id = book2.getChildTextTrim("issettled");
						if (id.equals("Y")) {
							break;
						}
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	public static StringBuffer ModenFyhead() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZ\" subtype=\"run\" replace=\"Y\" receiver=\"10101\" sender=\""
//		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZ\" subtype=\"run\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"dz_demonew.xml\" proc=\"update\" operation=\"req\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"dz_demonew.xml\" proc=\"update\" operation=\"req\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer DeleteFyhead() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZdel\" subtype=\"run\" replace=\"Y\" receiver=\"10101\" sender=\""
//		erpxml.append("<ufinterface roottag=\"voucher\" billtype=\"DZdel\" subtype=\"run\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" filename=\"dz_del_demonew.xml\" proc=\"delete\" operation=\"req\" account=\"0001\">");
						+ "\" isexchange=\"Y\" filename=\"dz_del_demonew.xml\" proc=\"delete\" operation=\"req\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer DeleteFy(String id) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<voucher id =\"" + id + "\" subdoctype=\"test\">");
		erpxml.append("<voucher_head>");
		erpxml.append("<corp>10101</corp> ");
//		erpxml.append("<corp>"+ERPconfig.erpcompany+"</corp> ");
		erpxml.append("<businessType>23AC</businessType>");
		erpxml.append("<freeitem8>" + id + "</freeitem8>");
		erpxml.append("</voucher_head>");
		erpxml.append("</voucher>");
		erpxml.append("</ufinterface>");
		return erpxml;
	}
	
	public static StringBuffer CardAddItemHead(String id, String freeitem8,
			String erpcode, String notice, String yjjbh, String usercode,
			String title) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<voucher id=\"" + freeitem8 + "\" subdoctype=\"\">");
		erpxml.append("<voucher_head>");
		erpxml.append("<prepay>N</prepay>");
		erpxml.append("<corp>10101</corp>");
//		erpxml.append("<corp>"+ERPconfig.erpcompany+"</corp>");
		erpxml.append("<businessType>23AC</businessType>");
		erpxml.append("<billnumber>" + erpcode + "</billnumber>");
		erpxml.append("<billDate>" + Comment.NewDate() + "</billDate>");
		erpxml.append("<effectdate>" + Comment.NewDate() + "</effectdate>");
		erpxml.append("<sysid>3</sysid>");
		erpxml.append("<initFlag>N</initFlag>");
		erpxml.append("<inputOp>" + usercode + "</inputOp>");
		erpxml.append("<saleType>01</saleType>");
		erpxml.append("<freeitem8>" + freeitem8 + "</freeitem8>");
		erpxml.append("<freeitem9>" + notice + "</freeitem9>");
		erpxml.append("<freeitem16>" + title + "</freeitem16>");
		erpxml.append("<payCorp></payCorp>");
		erpxml.append("<teller></teller>");
		erpxml.append("<subject></subject>");
		erpxml.append("<note_num></note_num>");
		erpxml.append("<settleType>001</settleType>");
		erpxml.append("<affirmant></affirmant>");
		erpxml.append("<bank_affirmant></bank_affirmant>");
		erpxml.append("<scomment></scomment>");
		erpxml.append("<appendix>0</appendix>");
		erpxml.append("<original_sum>0</original_sum>");
		erpxml.append("<fractional_sum>0</fractional_sum>");
		erpxml.append("<local_sum>0</local_sum>");
		erpxml.append("<lybz></lybz>");
		erpxml.append("<checkman>" + "" + "</checkman>");
		erpxml.append("<checkdate>"
				+ new SimpleDateFormat("yyyy-MM-dd").format(new Date())
				+ "</checkdate>");
		erpxml.append("<billstatus>2</billstatus>");
		erpxml.append("<deptid>" + yjjbh + "</deptid>");
		erpxml.append("<ywybm>1006002</ywybm>");
		erpxml.append("</voucher_head>");
		erpxml.append("<voucher_body>");

		return erpxml;
	}
	
	public static StringBuffer CardAddItemBody(String jbh, String jbr,
			String sqje, String jbrdh, String eampk, String sdje, String fyzl,
			String yjjbh,String zhaiyao,String title,String jsfs,String bz) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<sum_direction>1</sum_direction>");
		erpxml.append("<digest>"+(zhaiyao==null?"":zhaiyao)+"</digest>");
		erpxml.append("<subject></subject>");
		erpxml.append("<customer></customer>");
		erpxml.append("<settleType>"+Comment.checknull(jsfs)+"</settleType>");
		erpxml.append("<currencyId>"+Comment.checknull(bz)+"</currencyId>");
		erpxml.append("<original_exchange_rate>1</original_exchange_rate>");
		erpxml.append("<fractional_exchange_rate></fractional_exchange_rate>");
		erpxml.append("<job></job>");
		erpxml.append("<invoicebillno></invoicebillno>");
		erpxml.append("<debit_original_sum>" + Comment.checkZero(sdje) + "</debit_original_sum>");
		erpxml.append("<debit_fractional_sum>0</debit_fractional_sum>");
		erpxml.append("<debit_local_sum>" + Comment.checkZero(sdje) + "</debit_local_sum>");
		erpxml.append("<original_balance>" + Comment.checkZero(sdje) + "</original_balance>");
		erpxml.append("<fractional_balance>0</fractional_balance>");
		erpxml.append("<local_balance>0</local_balance>");
		erpxml.append("<quantity_balance>1</quantity_balance>");
		erpxml.append("<inventoryId></inventoryId>");
		erpxml.append("<investFlag></investFlag>");
		erpxml.append("<debit_quantity>1</debit_quantity>");
		erpxml.append("<unit_price></unit_price>");
		erpxml.append("<tax_rate></tax_rate>");
		erpxml.append("<debit_original_tax>1</debit_original_tax>");
		erpxml.append("<debit_fractional_tax>0</debit_fractional_tax>");
		erpxml.append("<debit_local_tax>1</debit_local_tax>");
		erpxml.append("<pay_bankName></pay_bankName>");
		erpxml.append("<pay_accounts></pay_accounts>");
		erpxml.append("<pay_bank_addr></pay_bank_addr>");
		erpxml.append("<gather_bankName></gather_bankName>");
		erpxml.append("<gather_accounts></gather_accounts>");
		erpxml.append("<gather_bank_addr></gather_bank_addr>");
		erpxml.append("<freeitem1>" + Comment.checknull(jbh) + "</freeitem1>");
		erpxml.append("<freeitem2>" + Comment.checknull(jbr) + "</freeitem2>");
		erpxml.append("<freeitem10>" + Comment.checkZero(sqje) + "</freeitem10>");
		erpxml.append("<freeitem15>" + Comment.checknull(jbrdh) + "</freeitem15>");
		erpxml.append("<freeitem19>" + eampk + "</freeitem19>");
		erpxml.append("<orderId></orderId>");
		erpxml.append("<check_date></check_date>");
		erpxml.append("<debit_frac_noTax>0</debit_frac_noTax>");
		erpxml.append("<credit_frac_noTax>0</credit_frac_noTax>");
		erpxml.append("<debit_local_noTax>0</debit_local_noTax>");
		erpxml.append("<incomeFlag>y</incomeFlag>");
		erpxml.append("<accsubjId>" + fyzl + "</accsubjId>");
		erpxml.append("<accountid></accountid>");
		erpxml.append("<pay_agreementId></pay_agreementId>");
		erpxml.append("<credit_original_sum>0</credit_original_sum>");
		erpxml.append("<credit_frac_sum>0</credit_frac_sum>");
		erpxml.append("<credit_local_sum>0</credit_local_sum>");
		erpxml.append("<credit_quantity>0</credit_quantity>");
		erpxml.append("<credit_original_Tax>0</credit_original_Tax>");
		erpxml.append("<credit_frac_Tax>0</credit_frac_Tax>");
		erpxml.append("<credit_local_Tax>0</credit_local_Tax>");
		erpxml.append("<object>0</object>");
		erpxml.append("<debit_original_noTax>0</debit_original_noTax>");
		erpxml.append("<credit_original_noTax>0</credit_original_noTax>");
		erpxml.append("<credit_local_noTax>0</credit_local_noTax>");
		erpxml.append("<tax_num></tax_num>");
		erpxml.append("<pk_jobobjpha></pk_jobobjpha>");
		erpxml.append("<purpose_sum></purpose_sum>");
		erpxml.append("<deptid>" + yjjbh + "</deptid>");
		erpxml.append("<employeeId>1003001</employeeId>");
		erpxml.append("<unit_price_WithTax></unit_price_WithTax>");
		erpxml.append("<Tax_Type>0</Tax_Type>");
		erpxml.append("</entry>");

		return erpxml;
	}
	
	public static StringBuffer ErpEnd() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</voucher_body>");
		erpxml.append("</voucher>");
		erpxml.append("</ufinterface>");
		return erpxml;
	}
	
	public static void delestate(String str, PublicDao dao) {
		try {
			String sql = "select  t  from  JyzcXxLsb  t  where  t.cldId=? ";
			List list = dao.find(sql,new Object[]{str});
			Iterator it = list.iterator();
			while (it.hasNext()) {
				JyzcXxLsb lczctemp = (JyzcXxLsb) it.next();
				// TODO 以下跟流程相关 暂时备注 
//				JyzcXx zcba = (JyzcXx) dao.load(JyzcXx.class,lczctemp.get.getZcBaseinfoId());
//				if (zcba != null) {
//					zcba.setState("02");
//					dao.saveOrUpdate(zcba);
//				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
