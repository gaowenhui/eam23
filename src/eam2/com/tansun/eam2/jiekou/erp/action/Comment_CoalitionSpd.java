package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.OAconfig;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardhbsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 *  卡片合并 拼装xml
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Comment_CoalitionSpd {

	public static StringBuffer CardHbHead() {
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
	
	public static StringBuffer Cardhbupdate() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"houpdate\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"houpdate\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"fa_ho_import.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"update\" filename=\"fa_ho_import.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	public static StringBuffer Cardhbadd() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"ho\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"ho\" subtype=\"\" replace=\"Y\" receiver=\""+ERPconfig.receiver+"\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"add\" filename=\"fa_ho_import.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"add\" filename=\"fa_ho_import.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static String getbillcode(String eamcodepk, PublicDao dao) {
		String billcode = "";
		try {
			String sql = "select  distinct   t.billcode   from erp_cardhbsend   t where t.eamcodepk=?";
			List list = dao.queryForList(sql, new Object[]{eamcodepk});
			if (list.size() > 0) {
				billcode = (String) ((HashMap)list.get(0)).get("billcode");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return billcode;
	}
	
	public static StringBuffer CardHbmodenhead(LcCardtemp lct, String billcode,
			String notice, String addtype, String sender,String shenqingliyou,String erpurl) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\"" + lct.getId() + "\">");
		erpxml.append("<bill_head>");
		erpxml.append("<bill_code>" + billcode + "</bill_code>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<asset_code>" + lct.getTypecode() + "</asset_code>");
		erpxml.append("<asset_name>" + lct.getZcname() + "</asset_name>");
		erpxml.append("<begindate>" + Comment.changedate(lct.getKsdate()) + "</begindate>");
		erpxml.append("<fk_currency>RMB</fk_currency>");
		erpxml.append("<currunit>元</currunit>");
		erpxml.append("<recorder>" + sender + "</recorder>");
		erpxml.append("<recorddate >" + Comment.changedate(lct.getLrrq()) + "</recorddate>");
		erpxml.append("<assetuser>" + sender + "</assetuser>");
		erpxml.append("<spec>" + Comment.checknull(lct.getGgxh()) + "</spec>");
		erpxml.append("<position>" + Comment.checknull(lct.getSaveadsress()) + "</position>");
		erpxml.append("<workloanunit>小时</workloanunit>");
		erpxml.append("<fk_addreducestyle>" + addtype + "</fk_addreducestyle>");
		erpxml.append("<assetsuit_code></assetsuit_code>");
		erpxml.append("<fk_usedept>" + lct.getUsepartment() + ":100,</fk_usedept>");
		erpxml.append("<fk_mandept>" + lct.getGlbm() + "</fk_mandept>");
		erpxml.append("<paydept_flag>0</paydept_flag>");
		erpxml.append("<accyear>" + Comment.getYear() + "</accyear>");
		erpxml.append("<period>" + Comment.getMonth() + "</period>");
		erpxml.append("<originvalue>" + lct.getYbyz() + "</originvalue>");
		erpxml.append("<localoriginvalue>" + lct.getYbyz() + "</localoriginvalue>");
		erpxml.append("<fracoriginvalue>0</fracoriginvalue>");
		erpxml.append("<allworkloan>0</allworkloan>");
		erpxml.append("<servicemonth>" + lct.getSyyx() + "</servicemonth>");
		erpxml.append("<quantity>1</quantity>");
		erpxml.append("<accudep>" + lct.getLjzj() + "</accudep>");
		erpxml.append("<simulatedep></simulatedep>");
		erpxml.append("<accuworkloan>0</accuworkloan>");
		erpxml.append("<predevaluate>" + lct.getJzzb() + "</predevaluate>");
		erpxml.append("<usedmonth>" + lct.getYjtyf() + "</usedmonth>");
		erpxml.append("<monthworkloan>0</monthworkloan>");
		erpxml.append("<depunit>0</depunit>");
		erpxml.append("<salvagerate>" + lct.getJczl() + "</salvagerate>");
		erpxml.append("<salvage>" + lct.getJcz() + "</salvage>");
		erpxml.append("<newasset_flag>1</newasset_flag>");
		erpxml.append("<fk_category>" + lct.getTypecode() + "</fk_category>");
		erpxml.append("<fk_usingstatus>" + lct.getUsestatus() + "</fk_usingstatus>");
		erpxml.append("<fk_depmethod>" + lct.getZjtype() + "</fk_depmethod>");
		erpxml.append("<fk_jobmngfil></fk_jobmngfil>");
		erpxml.append("<fk_provider></fk_provider>");
		erpxml.append("<source>6</source>");
		erpxml.append("<reason>"+(shenqingliyou==null?"":shenqingliyou)+"</reason>");
		erpxml.append("<CheckOpinion>" + notice + "</CheckOpinion>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer  CardHbItemHead(LcCardtemp  lct,String notice,String sender,String erpurl)
	{
//		BigDecimal  jcz=new BigDecimal("0");
//		 if(lct.getJczl()!=null&&lct.getYbyz()!=null)
//		 {
//			jcz=lct.getYbyz().multiply(lct.getJczl()).multiply(new BigDecimal("0.01"));
//			jcz = jcz.setScale(2, BigDecimal.ROUND_HALF_UP);
//		 }
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<bill id=\""+lct.getId()+"\">");
		erpxml.append("<bill_head>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>" + ERPconfig.erpcompany + "</company>");
		erpxml.append("<asset_code>"+lct.getTypecode()+"</asset_code>");
		erpxml.append("<asset_name>"+lct.getZcname()+"</asset_name>");
		erpxml.append("<begindate>"+Comment.changedate(lct.getKsdate())+"</begindate>");
		erpxml.append("<fk_currency>RMB</fk_currency>");
		erpxml.append("<currunit>元</currunit>");
		erpxml.append("<recorder>"+sender+"</recorder>");
		erpxml.append("<recorddate >"+Comment.changedate(lct.getLrrq())+"</recorddate>");
		erpxml.append("<assetuser>"+sender+"</assetuser>");
		erpxml.append("<spec>"+Comment.checknull(lct.getGgxh())+"</spec>");
		erpxml.append("<position>"+Comment.checknull(lct.getSaveadsress())+"</position>");
		erpxml.append("<workloanunit>小时</workloanunit>");
		erpxml.append("<fk_addreducestyle>"+lct.getAddtype()+"</fk_addreducestyle>");
		erpxml.append("<assetsuit_code></assetsuit_code>");
		erpxml.append("<fk_usedept>"+lct.getUsepartment()+":100,</fk_usedept>");
		erpxml.append("<fk_mandept>"+lct.getGlbm()+"</fk_mandept>");
		erpxml.append("<paydept_flag>"+Comment.zjcdbm(lct.getZjcdbm())+"</paydept_flag>");
		erpxml.append("<accyear>"+Comment.getYear()+"</accyear>");
		erpxml.append("<period>"+Comment.getMonth()+"</period>");
		erpxml.append("<originvalue>"+lct.getYbyz()+"</originvalue>");
		erpxml.append("<localoriginvalue>"+lct.getYbyz()+"</localoriginvalue>");
		erpxml.append("<fracoriginvalue>0</fracoriginvalue>");
		erpxml.append("<allworkloan>0</allworkloan>");
		erpxml.append("<servicemonth>"+Comment.checkZero(String.valueOf(lct.getSyyx()+lct.getSynx()*12))+"</servicemonth>");
		erpxml.append("<quantity>1</quantity>");
		erpxml.append("<accudep>"+lct.getLjzj()+"</accudep>");
		erpxml.append("<simulatedep></simulatedep>");
		erpxml.append("<accuworkloan>0</accuworkloan>");
		erpxml.append("<predevaluate>"+lct.getJzzb()+"</predevaluate>");
		erpxml.append("<usedmonth>"+lct.getYjtyf()+"</usedmonth>");
		erpxml.append("<monthworkloan>0</monthworkloan>");
		erpxml.append("<depunit>0</depunit>");
		erpxml.append("<salvagerate>"+lct.getJczl()+"</salvagerate>");
		erpxml.append("<salvage>"+lct.getJcz()+"</salvage>");
		erpxml.append("<newasset_flag>1</newasset_flag>");
		erpxml.append("<fk_category>"+lct.getTypecode()+"</fk_category>");
		erpxml.append("<fk_usingstatus>"+lct.getUsestatus()+"</fk_usingstatus>");
		erpxml.append("<fk_depmethod>"+lct.getZjtype()+"</fk_depmethod>");
		erpxml.append("<fk_jobmngfil></fk_jobmngfil>");
		erpxml.append("<fk_provider></fk_provider>");
		erpxml.append("<source>6</source>");
		erpxml.append("<reason>EAM系统合并卡片</reason>");
		erpxml.append("<CheckOpinion>"+notice+"</CheckOpinion>");
		erpxml.append("<def11>" + erpurl + "</def11>");//URL
		erpxml.append("</bill_head>");
		erpxml.append("<bill_body>");
		return erpxml;
	}
	
	public static StringBuffer CardReduceItemBody(String cardcode,
			String zccode, String zjtype) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardid>" + cardcode + "</cardid>");
//		erpxml.append("<company>10101</company>");
		erpxml.append("<company>"+ERPconfig.erpcompany+"</company>");
		erpxml.append("<asset_code>" + zccode + "</asset_code>");
		erpxml.append("<fk_addreducestyle>" + zjtype + "</fk_addreducestyle>");
		erpxml.append("<accyear>" + Comment.getYear() + "</accyear>");
		erpxml.append("<period>" + Comment.getMonth() + "</period>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static void savehblj(LcCardtemp befor, LcCardtemp after,
			PublicDao dao, String id) {
		try {
			ErpCardhbsend cardhb = new ErpCardhbsend();
			cardhb.setEamcode(String.valueOf(after.getId()));
			cardhb.setEamcodepk(id);
			cardhb.setAzccode(after.getErpassetcode());
			cardhb.setBzccode(befor.getErpassetcode());
			cardhb.setBcardcode(befor.getCardcode());
			dao.save(cardhb);

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
	
	public static void updatehbjl(String inputstr, PublicDao dao) {
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
			List list1 = books.getChildren("sendresult");
			Iterator it = list1.iterator();
			Element book1 = (Element) it.next();
//			List list2 = book1.getChildren("content");
//			Iterator it2 = list2.iterator();
//			Element book2 = (Element) it2.next();
			
			List list2 = books.getChildren("eambill");
			Iterator it2 = list2.iterator();
			Element book2 = (Element) it2.next();
			
			List list3 = book2.getChildren("eambill");
			Iterator it3 = list3.iterator();
			Element book3 = (Element) it3.next();
			List list4 = book3.getChildren("head");
			Iterator it4 = list4.iterator();
			Element book4 = (Element) it4.next();
			String pk_billid = book4.getChildTextTrim("pk_billid");
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
				String sql = "from ErpCardhbsend  t  where  t.bcardcode=?";
				List listsql = dao.find(sql, new Object[]{cardid});
				Iterator itsql = listsql.iterator();
				while (itsql.hasNext()) {
					ErpCardhbsend erpcardhbsend = (ErpCardhbsend) itsql.next();
					erpcardhbsend.setBcardcodepk(pk_billbid);
					erpcardhbsend.setBillcode(billcode);
					erpcardhbsend.setBillcodepk(pk_billid);
					dao.update(erpcardhbsend);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static StringBuffer CardhQuery() {
		StringBuffer erpxml = new StringBuffer();
//		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"ho\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""
		erpxml.append("<ufinterface roottag=\"bill\" billtype=\"ho\" subtype=\"\" replace=\"Y\" receiver=\"" + ERPconfig.receiver + "\" sender=\""
						+ OAconfig.loginuse
//						+ "\" isexchange=\"Y\" proc=\"query\" filename=\"fa_hm_query.xml\" account=\"0001\">");
						+ "\" isexchange=\"Y\" proc=\"query\" filename=\"fa_hm_query.xml\" account=\"" +ERPconfig.account + "\">");
		return erpxml;
	}
	
	public static StringBuffer getQueryhead(String billid, String billcode) {
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
	
	public static StringBuffer QueryModel(String cardid) {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("<entry>");
		erpxml.append("<cardid>" + cardid + "</cardid>");
		erpxml.append("</entry>");
		return erpxml;
	}
	
	public static void Queryspstate(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl,String inputstr, String erpNotice) {
		if (!inputstr.equals("")) {
			try {
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
					String id = book8.getAttributeValue("id");
					String billstatus = book8.getChildTextTrim("billstatus");

					if (billstatus.equals("4")) {
						String headId = "";
						if (inputstr.indexOf("card_code") > 0 && inputstr.indexOf("asset_code") > 0) {
							String billcode = book8.getChildTextTrim("billcode");
							String card_code = book3.getChildTextTrim("card_code");
							String asset_code = book3.getChildTextTrim("asset_code");
							String sql = "select  t  from  ErpCardhbsend  t  where    t.billcode=?";
							List listcard = dao.find(sql, new Object[]{billcode});
							for (Iterator cardlist = listcard.iterator(); cardlist.hasNext();) {
								ErpCardhbsend erpcardhbsend = (ErpCardhbsend) cardlist.next();
								erpcardhbsend.setSfbh("确认合并");
								erpcardhbsend.setBackup2(card_code);
								erpcardhbsend.setBackup3(asset_code);
								dao.update(erpcardhbsend);
								CaShead LcKphb = (CaShead) dao.findById(CaShead.class, Long .valueOf(erpcardhbsend.getEamcodepk()));
								if (LcKphb != null) {
									String sqlu = "update Ca_Shead t set t.SENDERP='2',t.ISREJECTED='03',t.ERPNOTICE='"+erpNotice+"' where t.id='"+erpcardhbsend.getEamcodepk()+"'";
									dao.getJdbcTemplate().execute(sqlu);
									headId = erpcardhbsend.getEamcodepk();
								}
								String lcsql = "select  td  from LcCardtemp td where td.kpxzid=? and td.cardcode is  null";//and td.wfconfigCode='33' and td.state='05'";
								List list = dao.find(lcsql, new Object[]{Long.valueOf(erpcardhbsend.getEamcodepk())});
								Iterator cflist = list.iterator();
								while (cflist.hasNext()) {
									LcCardtemp lccardtemp = (LcCardtemp) cflist.next();
									lccardtemp.setCardcode(card_code);
									lccardtemp.setErpassetcode(asset_code);
									dao.update(lccardtemp);
								}
								bdh = erpcardhbsend.getEamcodepk();
							}
						}
						String lct = "ggb_CardCoalition";
						//TODO 以下工作流相关
//						String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//						List listdep = session.createSQLQuery(depmentqf).setInteger("OperationID", Integer.valueOf(bdh)).list();
//						if (listdep.size() > 0) {
//							lct = (String) listdep.get(0);
//						}
//
//						String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//								+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//								+ lct
//								+ "'  and s.OperationID=:OperationID "
//								+ ")";
//						List listping = session.createQuery(hql2).setInteger("OperationID", Integer.valueOf(bdh)).list();
//						if (listping.size() > 0) {
//							PendingForm pending = (PendingForm) listping.get(0);
//							pending.setOpenState(0);
//							pending.setSenderCN("会计处");
//							Transaction tran = session.beginTransaction();
//							session.saveOrUpdate(pending);
//							tran.commit();
//						}
						
						if(!"".equals(headId)){
							if(!Comment.checkPTCommonOpinion(headId, dao,"通过")){
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
					} else if (billstatus.equals("3")) {
						String billcode = book8.getChildTextTrim("billcode");
						String checknote = book8.getChildTextTrim("checknote");
						if (checknote == null || checknote.length() < 1) {
							checknote = "ERP驳回合并审批单,但没有添写驳回意见!";
						}
						String sql="select  t  from  ErpCardhbsend  t  where    t.billcode=?";
						List listcard=dao.find(sql, new Object[]{billcode});
						for(Iterator  cardlist=listcard.iterator();cardlist.hasNext();){
							ErpCardhbsend erpcardhbsend = (ErpCardhbsend) cardlist.next();
							erpcardhbsend.setSfbh("ERP驳回");
							dao.update(erpcardhbsend);
							CaShead lckphb = (CaShead) dao.findById(CaShead.class,Long.valueOf(erpcardhbsend.getEamcodepk()));
							if (lckphb != null) {
								String sqlu = "update Ca_Shead t set t.SENDERP='1',t.ISREJECTED='01',t.ERPNOTICE='"+checknote+"' where t.id='"+erpcardhbsend.getEamcodepk()+"'";
								dao.getJdbcTemplate().execute(sqlu);
							}
							bdh = erpcardhbsend.getEamcodepk();
							String lct = "ggb_CardCoalition";
							//TODO 以下工作流相关
//							String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//							List listdep = session.createSQLQuery(depmentqf).setInteger("OperationID", Integer.valueOf(bdh)).list();
//							if (listdep.size() > 0) {
//								lct = (String) listdep.get(0);
//							}
//							String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//									+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//									+ lct
//									+ "'  and s.OperationID=:OperationID "
//									+ ")";
//							List listping = session.createQuery(hql2).setInteger("OperationID", Integer.valueOf(bdh)).list();
//							if (listping.size() > 0) {
//								PendingForm pending = (PendingForm) listping
//										.get(0);
//								pending.setOpenState(0);
//								pending.setSenderCN("会计处");
//								Transaction trans2 = session.beginTransaction();
//								session.saveOrUpdate(pending);
//								trans2.commit();
//							}
						}
						
						if(!"".equals(bdh)){
							if(!Comment.checkPTCommonOpinion(bdh, dao,"不通过")){
								PTCommonOpinionBO bo = new PTCommonOpinionBO();
								bo.setBdid(String.valueOf(bdh));
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
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}
}
