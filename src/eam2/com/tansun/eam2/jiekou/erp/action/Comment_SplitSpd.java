package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardcfsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * 卡片拆分 拼装xml
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Comment_SplitSpd {

	public static StringBuffer CardReduceHead() {
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
		return erpxml;
	}
	
	public static StringBuffer ufdModelhead() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hmupdate\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hmupdate\" subtype=\"\" replace=\"Y\" receiver=\"" + ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"fa_hm_update.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"fa_hm_update.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer ufdAddhead() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hm\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hm\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"add\" filename=\"cardcfadd.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"add\" filename=\"cardcfadd.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static String getcfcode(String str, String eamcode, PublicDao dao) {
		String value = "";
		try {
			String sql = "select  distinct   t." + str
					+ "   from erp_cardcfsend t  where t.eamcode='" + eamcode
					+ "'";
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				value = (String) ((HashMap)list.get(0)).get(str);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return value;
	}
	
	public static StringBuffer CardModelItemHead(LcCardtemp lct,
			String billcode, String erpcode, String notice, String sender,String shenqingliyou,String erpurl) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + lct.getCardcode() + "\">");
		erpxml.append("<bill_head>");
		erpxml.append("<source>6</source>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" +ERPconfig.erpcompany + "</company>");
		erpxml.append("<billcode>" + billcode + "</billcode>");
		erpxml.append("<fk_addreducestyle>0213</fk_addreducestyle>");
		erpxml.append("<reason>"+(shenqingliyou==null?"":shenqingliyou)+"</reason>");
		erpxml.append("<OriginalBillID>" + erpcode + "</OriginalBillID>");//
		erpxml.append("<asset_code>" + lct.getErpassetcode() + "</asset_code>");
		erpxml.append("<accyear>" + new Comment().getYear() + "</accyear>");
		erpxml.append("<period>" + new Comment().getMonth() + "</period>");
		erpxml.append("<Maker>" + sender + "</Maker>");
		erpxml.append("<MakeDate>" + Comment.NewDate() + "</MakeDate>");
		erpxml.append("<CheckOpinion>" + notice + "</CheckOpinion>");
		erpxml.append("<reduceperson>EAM</reduceperson>");
		erpxml.append("<reducedate>" + Comment.NewDate() + "</reducedate>");
		erpxml.append("<updater>" + sender + "</updater>");
		erpxml.append("<updatedate>" + Comment.NewDate() + "</updatedate>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer CardReduceItemHead(LcCardtemp lct,
			String notice, String sender,String erpurl) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + lct.getCardcode() + "\">");
		erpxml.append("<bill_head>");
		erpxml.append("<source>6</source>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<fk_addreducestyle>0213</fk_addreducestyle>");
		erpxml.append("<reason>" + OAconfig.loginuse + "</reason>");
		erpxml.append("<OriginalBillID>" + lct.getCardcode() + "</OriginalBillID>");
		erpxml.append("<asset_code>" + lct.getErpassetcode() + "</asset_code>");
		erpxml.append("<accyear>" + new Comment().getYear() + "</accyear>");
		erpxml.append("<period>" + new Comment().getMonth() + "</period>");
		erpxml.append("<Maker>" + sender + "</Maker>");
		erpxml.append("<MakeDate>" + Comment.NewDate() + "</MakeDate>");
		erpxml.append("<CheckOpinion>" + notice + "</CheckOpinion>");
		erpxml.append("<reduceperson>" + sender + "</reduceperson>");
		erpxml.append("<reducedate>" + Comment.NewDate() + "</reducedate>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer CardReduceItemBody(LcCardtemp lct, String ybyz,
			String ljzj, String jzzb, String jcz, PublicDao dao, String sender) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardid>" + lct.getId() + "</cardid>");// eam pk
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<asset_code>" + lct.getErpassetcode() + "</asset_code>");
		erpxml.append("<asset_name>" + lct.getZcname() + "</asset_name>");
		erpxml.append("<begindate>" + Comment.changedate(lct.getKsdate()) + "</begindate>");
		erpxml.append("<fk_currency>RMB</fk_currency>");
		erpxml.append("<currunit>元</currunit>");
		erpxml.append("<recorder>" + sender + "</recorder>");
		erpxml.append("<recorddate >" + Comment.NewDate() + "</recorddate>");
		erpxml.append("<assetuser>" + Comment.getsyrbm(lct.getUsername(), dao) + "</assetuser>");
		erpxml.append("<spec>" + Comment.checknull(lct.getGgxh()) + "</spec>");
		erpxml.append("<position></position>");
		erpxml.append("<workloanunit>小时</workloanunit>");
		erpxml.append("<fk_addreducestyle>" + lct.getAddtype() + "</fk_addreducestyle>");
		erpxml.append("<assetsuit_code></assetsuit_code>");
		erpxml.append("<fk_usedept>" + lct.getUsepartment() + ":100</fk_usedept>");
		erpxml.append("<fk_mandept>" + lct.getGlbm() + "</fk_mandept>");
		erpxml.append("<paydept_flag>" + Comment.zjcdbm(lct.getZjcdbm()) + "</paydept_flag>");
		erpxml.append("<accyear>" + new Comment().getYear() + "</accyear>");
		erpxml.append("<period>" + new Comment().getMonth() + "</period>");
		erpxml.append("<originvalue>" + ybyz + "</originvalue>");
		erpxml.append("<localoriginvalue>" + ybyz + "</localoriginvalue>");
		erpxml.append("<fracoriginvalue>0</fracoriginvalue>");
		erpxml.append("<allworkloan>0</allworkloan>");
		erpxml.append("<servicemonth>" + Comment.checkZero(String.valueOf(lct.getSynx() * 12
						+ lct.getSyyx())) + "</servicemonth>");// add by xie
		erpxml.append("<accudep>" + ljzj + "</accudep>");
		erpxml.append("<accuworkloan>0</accuworkloan>");
		erpxml.append("<predevaluate>" + jzzb + "</predevaluate>");
		erpxml.append("<usedmonth>" + lct.getYjtyf() + "</usedmonth>");
		erpxml.append("<monthworkloan>0</monthworkloan>");
		erpxml.append("<depunit>0</depunit>");
		erpxml.append("<salvagerate>" + Comment.checkZero(String.valueOf(lct.getJczl()))
				+ "</salvagerate>");
		erpxml.append("<salvage>" + jcz + "</salvage>");
		erpxml.append("<newasset_flag>1</newasset_flag>");
		erpxml.append("<fk_category>" + lct.getTypecode() + "</fk_category>");
		erpxml.append("<fk_usingstatus>" + lct.getUsestatus() + "</fk_usingstatus>");
		erpxml.append("<fk_depmethod>" + lct.getZjtype() + "</fk_depmethod>");
		erpxml.append("<fk_jobmngfil>01</fk_jobmngfil>");
		erpxml.append("<quantity>1</quantity>");
		erpxml.append("</entry>");
		return erpxml;
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
	
	public static void getCfinfo(String inputstr, PublicDao dao, String eamcode) {
		try {
			if (inputstr.indexOf("sendresult") > 0
					&& inputstr.indexOf("content") > 0
					&& inputstr.indexOf("eambill") > 0) {
				SAXBuilder builder = new SAXBuilder(false);
				Reader in = new StringReader(inputstr);
				Document doc = builder.build(in);
				Element books = doc.getRootElement();
				List list1 = books.getChildren("sendresult");
				Iterator it = list1.iterator();
				Element book = (Element) it.next();
				String bdocid = book.getChildTextTrim("bdocid");
				
				
//				List list2 = book.getChildren("content");
//				Iterator it1 = list2.iterator();
//				Element book2 = (Element) it1.next();
				List list2 = books.getChildren("eambill");
				Iterator it1 = list2.iterator();
				Element book2 = (Element) it1.next();
				
				List list3 = book2.getChildren("eambill");
				Iterator it3 = list3.iterator();
				Element book3 = (Element) it3.next();
				
				List list4 = book3.getChildren("head");
				Iterator it4 = list4.iterator();
				Element book4 = (Element) it4.next();
//				
//				List list2 = book.getChildren("eambill");
//				List list3 = book.getChildren("eambill");

				String billpk = book4.getChildTextTrim("pk_billid");
				String billcode = book4.getChildTextTrim("billcode");
				List list5 = book3.getChildren("body");
				Iterator it5 = list5.iterator();
				Element book5 = (Element) it5.next();
				List list6 = book5.getChildren("entry");
				Iterator it6 = list6.iterator();
				while (it6.hasNext()) {
					Element book6 = (Element) it6.next();
					String cardid = book6.getChildTextTrim("cardid");
					String pk_billbid = book6.getChildTextTrim("pk_billbid");
					ErpCardcfsend cardcfsend = new ErpCardcfsend();
					cardcfsend.setErpcode(billcode);
					cardcfsend.setErpcodepk(billpk);
					cardcfsend.setErppk(pk_billbid);
					cardcfsend.setCardid(cardid);
					cardcfsend.setEamcode(eamcode);
					cardcfsend.setFbyz(bdocid);

					dao.save(cardcfsend);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static StringBuffer ufdQueryhead() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hm\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"hm\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"query\" filename=\"fa_hm_query.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"query\" filename=\"fa_hm_query.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer QuerybillHead(String billid, String billcode) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + billid + "\">");
		erpxml.append("<bill_head>");
		erpxml.append("<source>6</source>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<billcode>" + billcode + "</billcode>");
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer geterpcode(String erpcode, String fbyz,PublicDao dao) {
		StringBuffer erpxml = new StringBuffer();
		String sql = "select t from ErpCardcfsend  t where t.fbyz=? and t.erpcode=?";
		List list = dao.find(sql, new Object[]{erpcode,fbyz});
		for (Iterator it = list.iterator(); it.hasNext();) {
			ErpCardcfsend erpcard = (ErpCardcfsend) it.next();
			String cardid1 = erpcard.getCardid();
			erpxml.append(Comment_SplitSpd.QuerybillBody(cardid1));
		}
		return erpxml;
	}
	
	public static StringBuffer QuerybillBody(String cardid) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardid>" + cardid + "</cardid>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static StringBuffer Querybillend() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</bill_body>");
		erpxml.append("</bill>");
		erpxml.append("</ufinterface>");
		return erpxml;
	}
	
	public static StringBuffer esbend() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static void Queryspstate(String inputstr, PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl, String erpNotice) {
		try {
			if (inputstr.indexOf("sendresult") > 0 && inputstr.indexOf("resultcode") > 0) {
				String bdh = "";
				SAXBuilder builder = new SAXBuilder(false);
				Reader in = new StringReader(inputstr);
				Document doc = builder.build(in);
				Element books = doc.getRootElement();
				List list1 = books.getChildren("sendresult");
				Iterator it = list1.iterator();
				Element book = (Element) it.next();
				String resultcode = book.getChildTextTrim("resultcode");
				String bdocid = book.getChildTextTrim("bdocid");
				if (resultcode.equals("1")) {
					List list2 = books.getChildren("queryresult");
					Iterator it2 = list2.iterator();
					Element book2 = (Element) it2.next();
					List list3 = book2.getChildren("result");
					Iterator it3 = list3.iterator();
					Element book3 = (Element) it3.next();
					List list8 = book3.getChildren("bill");
					Iterator it8 = list8.iterator();
					Element book8 = (Element) it8.next();
					String billstatus = book8.getChildTextTrim("billstatus");
					if (billstatus.equals("4")) {
//					if (billstatus.equals("2")) {
						String headId = "";
						if (inputstr.indexOf("card_code") > 0 && inputstr.indexOf("asset_code") > 0) {
							
							List list4 = book3.getChildren("body");
							Iterator it4 = list4.iterator();
							Element book4 = (Element) it4.next();
							List list5 = book4.getChildren("entry");
							Iterator it5 = list5.iterator();
							while (it5.hasNext()) {
								Element book5 = (Element) it5.next();
								String cardid = book5.getChildTextTrim("cardid");
								String card_code = book5.getChildTextTrim("card_code");
								String asset_code = book5.getChildTextTrim("asset_code");
								String sql = "select  t  from  ErpCardcfsend  t  where    t.cardid=?";
								List listcard = dao.find(sql, new Object[]{cardid});
								for (Iterator cardlist = listcard.iterator(); cardlist.hasNext();) {
									ErpCardcfsend erpcardcfsend = (ErpCardcfsend) cardlist.next();
									erpcardcfsend.setSfcode("确认拆分");
									erpcardcfsend.setEampk(card_code);
									erpcardcfsend.setEamnotice(asset_code);
									dao.getHibernateTemplate().update( erpcardcfsend);
									headId = erpcardcfsend.getEamcode();
									CaShead lckpcf = (CaShead) dao.getHibernateTemplate().get(CaShead.class,
													Long.valueOf(erpcardcfsend.getEamcode()));
									if (lckpcf != null) {
										String sqlu = "update Ca_Shead t set t.SENDERP='2',t.ISREJECTED='03',t.ERPNOTICE='"+erpNotice+"' where t.id='"+String.valueOf(erpcardcfsend.getEamcode())+"'";
										dao.getJdbcTemplate().execute(sqlu);
									}
									bdh = erpcardcfsend.getEamcode();
								}
								LcCardtemp lccardtemp = (LcCardtemp) dao .getHibernateTemplate().get(LcCardtemp.class, Long.valueOf(cardid));
								if (lccardtemp != null) {
									lccardtemp.setCardcode(card_code);
									lccardtemp.setErpassetcode(asset_code);
									dao.update(lccardtemp);
								}
							}
							if (!bdh.equals("")) {
								String lct = "card_Split";
								//TODO 以下工作流相关
//								String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//								List listdep = dao.getHibernateTemplate().getSessionFactory().openSession()
//										.createSQLQuery(depmentqf).setInteger( "OperationID", Integer.valueOf(bdh)).list();
//								if (listdep.size() > 0) {
//									lct = (String) listdep.get(0);
//								}
//								String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//										+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//										+ lct
//										+ "'  and s.OperationID=:OperationID "
//										+ ")";
//								List listping = dao.getHibernateTemplate().getSessionFactory().openSession()
//										.createQuery(hql2).setInteger("OperationID", Integer.valueOf(bdh)).list();
//								if (listping.size() > 0) {
//									PendingForm pending = (PendingForm) listping.get(0);
//									pending.setOpenState(0);
//									pending.setSenderCN("会计处");
//									dao.getHibernateTemplate().saveOrUpdate(pending);
//								}
							}
							if(!"".equals(headId)){
								if(!Comment.checkPTCommonOpinion(bdh, dao,"通过")){
									PTCommonOpinionBO bo = new PTCommonOpinionBO();
									bo.setBdid(String.valueOf(headId));
									bo.setTaskId(null);
									bo.setTjr("15938");
									bo.setYjbm(10762);
									bo.setTjrq(new Date());
									bo.setYjylx(4);//4为erp意见类型
									bo.setYjlx(2);
									bo.setYjnr("通过");
									dao.save(bo);
									CaShead lckpcf = (CaShead) dao.getHibernateTemplate().get(CaShead.class,
											Long.valueOf(headId));
									Comment.banjie(dao, ptBs, workflowBS, erpCommonUCC, cardQueryUCCImpl, lckpcf, bdh);
								}
							}
						}
					} else if (billstatus.equals("3")) {
						String billcode = book8.getChildTextTrim("billcode");
						String checknote = book8.getChildTextTrim("checknote");
						if (checknote == null) {
							checknote = "ERP驳回拆分审批单,但没有添写驳回意见!";
						}
						String headId = "";
						
						String billid = book8.getAttributeValue("id");
						String sql = "select  t  from  ErpCardcfsend  t  where    t.erpcode=?";
						List listcard = dao.find(sql,new Object[]{billcode});
						for (Iterator cardlist = listcard.iterator(); cardlist.hasNext();) {
							ErpCardcfsend erpcardcfsend = (ErpCardcfsend) cardlist.next();
							erpcardcfsend.setSfcode("ERP驳回");
							dao.getHibernateTemplate().update(erpcardcfsend);
							CaShead lckpcf = (CaShead) dao.getHibernateTemplate()
									.get(CaShead.class,Long.valueOf(erpcardcfsend.getEamcode()));
							headId = erpcardcfsend.getEamcode();
							if (lckpcf != null) {
								String sqlu = "update Ca_Shead t set t.SENDERP='1',t.ISREJECTED='01',t.ERPNOTICE='"+checknote+"' where t.id='"+erpcardcfsend.getEamcode()+"'";
								dao.getJdbcTemplate().execute(sqlu);
							}
							bdh = erpcardcfsend.getEamcode();

							String lct = "card_Split";
							//TODO 以下工作流相关
//							String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//							List listdep = dao.getHibernateTemplate().getSessionFactory().openSession()
//									.createSQLQuery(depmentqf).setInteger("OperationID", Integer.valueOf(bdh)).list();
//							if (listdep.size() > 0) {
//								lct = (String) listdep.get(0);
//							}
//							String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//									+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//									+ lct
//									+ "'  and s.OperationID=:OperationID "
//									+ ")";
//							List listping = dao.getHibernateTemplate().getSessionFactory().openSession()
//									.createQuery(hql2).setInteger("OperationID", Integer.valueOf(bdh)).list();
//							if (listping.size() > 0) {
//								PendingForm pending = (PendingForm) listping.get(0);
//								pending.setOpenState(0);
//								pending.setSenderCN("会计处");
//								dao.getHibernateTemplate().saveOrUpdate(pending);
//							}
						}
						if(!"".equals(headId)){
							if(!Comment.checkPTCommonOpinion(bdh, dao,"不通过")){
								PTCommonOpinionBO bo = new PTCommonOpinionBO();
								bo.setBdid(String.valueOf(headId));
								bo.setTaskId(null);
								bo.setTjr("15938");
								bo.setYjbm(10762);
								bo.setTjrq(new Date());
								bo.setYjylx(4);//4为erp意见类型
								bo.setYjlx(2);
								bo.setYjnr("不通过");
								dao.save(bo);
							}
						}
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
