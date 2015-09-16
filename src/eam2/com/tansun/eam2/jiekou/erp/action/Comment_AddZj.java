package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.math.BigDecimal;
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
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardaddsend;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 卡片新增 直接增加拼装xml 
 * @author lantb
 *	根据一期相关代码复制更改
 */
public class Comment_AddZj {
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
//		erpxml.append("<ufinterface roottag=\"card\" billtype=\"h1\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\""+OAconfig.loginuse+"\" isexchange=\"Y\" proc=\""
		erpxml.append("<ufinterface roottag=\"card\" billtype=\"h1\" subtype=\"\" replace=\"Y\" receiver=\"" +ERPconfig.receiver + "\" sender=\""+OAconfig.loginuse+"\" isexchange=\"Y\" proc=\""
						+ medth
//						+ "\" filename=\"固定资产凭证.xml\" account=\"0001\"> ");
						+ "\" filename=\"固定资产凭证.xml\" account=\"" +ERPconfig.account + "\"> ");
		return erpxml;
	}
	
	public static ErpCardaddsend getCardValue(CaShead pojo, LcCardtemp temp,String zccode, PublicDao dao) {
		ErpCardaddsend cardxml = new ErpCardaddsend();
		cardxml.setBdh(String.valueOf(pojo.getId()));
		cardxml.setDypk(String.valueOf(temp.getId()));
//		cardxml.setGsbm("10101");
		cardxml.setGsbm(ERPconfig.erpcompany);
		cardxml.setZibm(String.valueOf(zccode));
		cardxml.setZcmc(temp.getZcname());
		cardxml.setKssyrq(String.valueOf(temp.getKsdate()));
		cardxml.setBzmc("RMB");
		cardxml.setBzcw("元");
		cardxml.setLrrmc(temp.getUsername());
		cardxml.setLrrq(Comment.checkdate(String.valueOf(temp.getLrrq())));
		cardxml.setSyrbm(temp.getUsername());
		cardxml.setGgxh(temp.getGgxh());
		cardxml.setCfdd(temp.getSaveadsress());
		cardxml.setGzldw("小时");
		cardxml.setZjfsbm(temp.getAddtype());
		cardxml.setZcth("001");
		cardxml.setSybmbm(temp.getUsepartment());
		cardxml.setGlbmbm(temp.getGlbm());
		cardxml.setZjcdbm(temp.getZjcdbm());
		cardxml.setHjn(new Comment().getYear());
		cardxml.setHjy(new Comment().getMonth());
		cardxml.setYbyz(String.valueOf(temp.getYbyz()));
		cardxml.setBbyz(String.valueOf(temp.getYbyz()));
		cardxml.setFbyz("0");
		cardxml.setGzzl("0");
		cardxml.setSyyx(Comment.checkZero(String.valueOf(temp.getSyyx()==null?0l:temp.getSyyx()+ (temp.getSynx()==null?0l:temp.getSynx() )* 12)));
		cardxml.setLjzj(Comment.checkZero(String.valueOf(temp.getLjzj()==null?0.0:temp.getLjzj())));
		cardxml.setLjgzl("0");
		cardxml.setJzzb(String.valueOf(temp.getJzzb()));
		cardxml.setYjtyf(Comment.checkZero(String.valueOf(temp.getYjtyf()==null?0l:temp.getYjtyf())));
		cardxml.setYgzl("0");
		cardxml.setDwzj("0");
		cardxml.setJczl(Comment.checkZero(String.valueOf(temp.getJczl()==null?0.0:temp.getJczl())));
		cardxml.setJcz(Comment.checkZero(String.valueOf(temp.getJcz()==null?0.0:temp.getJcz())));
		cardxml.setYzkpbj("1");
		cardxml.setZclbbm(Comment.checkzjgc(temp.getTypecode()));
		cardxml.setSyzkbm(temp.getUsestatus());
		cardxml.setJzfabm(temp.getZjtype());
		cardxml.setXmdabm("01");
		cardxml.setGysbm(Comment.checknull(temp.getGys()));
		cardxml.setLy("6");
		cardxml.setYrje(Comment.checknull(String.valueOf(temp.getOldjz())));
		cardxml.setYrljzj(Comment.checknull(String.valueOf(temp.getOldyearjz())));
		cardxml.setYryz(Comment.checknull(String.valueOf(temp.getOldyearyz())));
		cardxml.setCpuxh(Comment.checknull(temp.getCupxh()));
		cardxml.setBxq(Comment.checknull(String.valueOf(temp.getBxq())));
		cardxml.setBz(temp.getBzsm());
		cardxml.setClpzh(temp.getClpxh());
		cardxml.setDytdzsyqr(Comment.checknull(temp.getQzsyz()));
		cardxml.setFdjhm(Comment.checknull(temp.getFdjhm()));
		cardxml.setFczhm(Comment.checknull(temp.getFdzhm()));
		cardxml.setJjmj(Comment.checknull(String.valueOf(temp.getJzmj())));
		cardxml.setJe(String.valueOf(temp.getJevalue()==null?0.0:temp.getJevalue()));
		cardxml.setJz(String.valueOf(temp.getJvalue()==null?0.0:temp.getJvalue()));
		cardxml.setJkpbh(temp.getOldcode());
		cardxml.setLbbm(temp.getTypecode());
		cardxml.setLbmc(temp.getTypecode());
		cardxml.setNc(Comment.checknull(temp.getNsave()));
		cardxml.setNzyp(Comment.checknull(temp.getNzyp()));
		cardxml.setPgqljzj(String.valueOf(temp.getPgqljzj()));
		cardxml.setPgqyz(String.valueOf(temp.getPgqyz()));
		cardxml.setQyrq(String.valueOf(temp.getQydate()));
		cardxml.setQszm(Comment.checknull(temp.getQszm()));
		cardxml.setQzsyz(Comment.checknull(temp.getQzsyz()));
		cardxml.setSmbxq(Comment.checknull(String.valueOf(temp.getSmbxq())));
		cardxml.setSbxlh(Comment.checknull(temp.getSbxlh()));
		cardxml.setSfjc(temp.getIfjc());
		cardxml.setSxbxq(Comment.checknull(String.valueOf(temp.getSxbxq())));
		cardxml.setTdzhm(Comment.checknull(temp.getTdzhm()));
		cardxml.setWzyp(Comment.checknull(temp.getWzyp()));
		cardxml.setXtxsq(Comment.checknull(temp.getXsq()));
		cardxml.setYwdytd(Comment.checknull(temp.getYwdytd()));
		cardxml.setYxtrry(temp.getYxtlry());
		cardxml.setYzje(Comment.checknull(String.valueOf(temp.getYzje()==null?0.0:temp.getYzje())));
		cardxml.setYzjl(Comment.checknull(String.valueOf(temp.getYzjl()==null?0.0:temp.getYzjl())));
		cardxml.setZyzt(Comment.checknull(temp.getZyzk()));
		cardxml.setZdmj(Comment.checknull(String.valueOf(temp.getZdmj())));
		cardxml.setZyyt(temp.getMainyt());
		cardxml.setZxrq(String.valueOf(temp.getZxrq()));
		cardxml.setZxmj(Comment.checknull(String.valueOf(temp.getZxmj())));
		return cardxml;
	}
	
	public static StringBuffer CardAddBody(CaShead pojo, ErpCardaddsend cardxml,String ysqdjz,String synx,PublicDao dao,LcCardtemp  temp,String sender) {
		StringBuffer erpxml = new StringBuffer();
		BigDecimal jcz = new BigDecimal("0");
		if (temp.getJczl() != null && temp.getYbyz() != null) {
			jcz = new BigDecimal(temp.getYbyz()).multiply(
					new BigDecimal(temp.getJczl())).multiply(
					new BigDecimal("0.01"));
		}
		erpxml.append("" + "<card id=\"" + cardxml.getDypk() + "\">"
				+ "<card_head>" 
				+ "<eambill>"+cardxml.getBdh()+"</eambill>"
				+ "<company>" + cardxml.getGsbm()+ "</company>" 
				+ "<asset_code>" + cardxml.getZibm()+ "</asset_code>" 
				+ "<asset_name>" + cardxml.getZcmc()+ "</asset_name>" 
				+ "<begindate>" + cardxml.getKssyrq().substring(0, 10)+ "</begindate>"  //addby lantianbo 该字段日期字符串格式过长
				+ "<fk_currency>" + cardxml.getBzmc()+ "</fk_currency>" 
				+ "<currunit>" + cardxml.getBzcw()+ "</currunit>" 
				+ "<recorder>"+sender+"</recorder>"                              
				+ "<recorddate >" + cardxml.getLrrq()+ "</recorddate>" 
				+ "<assetuser>" +Comment.getsyrbm(cardxml.getSyrbm(),dao)+ "</assetuser>"      
				+ "<spec>" + Comment.checkZero(cardxml.getGgxh()) + "</spec>"
				+ "<position>" + Comment.checknull(cardxml.getCfdd()) + "</position>"
				+ "<workloanunit>" + cardxml.getGzldw() + "</workloanunit>"
				+ "<fk_addreducestyle>" + cardxml.getZjfsbm()+ "</fk_addreducestyle>"     
				+ "<assetsuit_code>"+ cardxml.getZcth() + "</assetsuit_code>"               
				+ "<fk_usedept>"+ cardxml.getSybmbm() + "</fk_usedept>" 
				+ "<fk_mandept>"+ cardxml.getGlbmbm() + "</fk_mandept>" 
				+ "<paydept_flag>"+ Comment.zjcdbm(cardxml.getZjcdbm()) + "</paydept_flag>" 
				+ "<accyear>"+ cardxml.getHjn() + "</accyear>" 
				+ "<period>"+ cardxml.getHjy() + "</period>" 
				+ "<originvalue>"+ cardxml.getYbyz() + "</originvalue>" 
				+ "<localoriginvalue>"+ cardxml.getBbyz() + "</localoriginvalue>"
				+ "<fracoriginvalue>" + cardxml.getFbyz()+ "</fracoriginvalue>" 
				+ "<allworkloan>" + cardxml.getGzzl()+ "</allworkloan>" 
				+ "<servicemonth>" + Comment.checkZero(cardxml.getSyyx())+ "</servicemonth>" 
				+ "<accudep>" + cardxml.getLjzj()+ "</accudep>"
				+ "<accuworkloan>"+ cardxml.getLjgzl()+ "</accuworkloan>"
				+ "<predevaluate>"+ Comment.checkZero(cardxml.getJzzb())+ "</predevaluate>"
				+ "<usedmonth>"+ Comment.checkZero(cardxml.getYjtyf())+ "</usedmonth>"
				+ "<monthworkloan>"+ cardxml.getYgzl()+ "</monthworkloan>"
				+ "<depunit>"+ cardxml.getDwzj()+ "</depunit>"
				+ "<salvagerate>"+ cardxml.getJczl()+ "</salvagerate>"
				+ "<salvage>"+String.valueOf(jcz)+ "</salvage>"
				+ "<newasset_flag>"+ cardxml.getYzkpbj()+ "</newasset_flag>"
				+ "<fk_category>"+ cardxml.getZclbbm()+ "</fk_category>"
				+ "<fk_usingstatus>"+ cardxml.getSyzkbm()+ "</fk_usingstatus>"  
				+ "<fk_depmethod>"+ cardxml.getJzfabm()+ "</fk_depmethod>"       
				+ "<fk_jobmngfil>"+ cardxml.getXmdabm()+ "</fk_jobmngfil>"
				+ "<fk_provider>"+ cardxml.getGysbm()+ "</fk_provider> "
				+ "<source>"+ cardxml.getLy()+ "</source>"
				+ "</card_head>"
				+ "<card_body>"
				+ "<entry>  <def_quote>2004年1月1日净值</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYrje())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>2004年1月1日累计折旧</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYrljzj())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>2004年1月1日原值</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYryz())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>CPU型号</def_quote>  <def_value>"+ Comment.checknull(cardxml.getCpuxh())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>保修期</def_quote>  <def_value>"+ Comment.checknull(cardxml.getBxq())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>备注</def_quote>  <def_value>"+ Comment.checknull(cardxml.getBz())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>车辆牌照号</def_quote>  <def_value>"+ Comment.checknull(cardxml.getClpzh())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>对应土地证使用权人</def_quote>  <def_value>"+ cardxml.getDytdzsyqr()+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>发动机号码</def_quote>  <def_value>"+ Comment.checknull(cardxml.getFdjhm())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>房产证号码</def_quote>  <def_value>"+ Comment.checknull(cardxml.getFczhm())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>建筑面积</def_quote>  <def_value>"+ Comment.checknull(cardxml.getJjmj())+ "</def_value>  </entry>"
				/**
				 * yu zhuo 2009-01-13
				 *屏蔽掉净值净额两节点 此两节点影响NC系统固定资产折旧
				 */
				/*
				+ "<entry>  <def_quote>净额</def_quote>  <def_value>"+ Comment.checknull(cardxml.getJe())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>净值</def_quote>  <def_value>"+ Comment.checknull(cardxml.getJz())+ "</def_value>  </entry>"
				*/
				/*
				+ "<entry>  <def_quote>净额</def_quote>  <def_value></def_value>  </entry>"
				+ "<entry>  <def_quote>净值</def_quote>  <def_value></def_value>  </entry>"
				*/				
				+ "<entry>  <def_quote>旧卡片编号</def_quote>  <def_value>"+ Comment.checknull(cardxml.getJkpbh())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>类别编码</def_quote>  <def_value>"+ Comment.checknull(cardxml.getLbbm())+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>类别名称</def_quote>  <def_value>"+ Comment.checknull(cardxml.getLbmc())+ "</def_value>  </entry>" 
				+ "<entry>  <def_quote>内存</def_quote>  <def_value>"+ Comment.checknull(cardxml.getNc() )+ "</def_value>  </entry>"
				+ "<entry>  <def_quote>内置硬盘</def_quote>  <def_value>"+ Comment.checknull(cardxml.getNzyp()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>评估前累计折旧</def_quote>  <def_value>"+ Comment.checknull(cardxml.getPgqljzj()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>评估前原值</def_quote>  <def_value>"+ Comment.checknull(cardxml.getPgqyz()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>启用日期</def_quote>  <def_value></def_value>  </entry>"
				+ "<entry>  <def_quote>权属证明</def_quote>  <def_value>"+ Comment.checknull(cardxml.getQszm()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>权证所有者</def_quote>  <def_value>"+ Comment.checknull(cardxml.getQzsyz()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>上门保修期</def_quote>  <def_value>"+ Comment.checknull(cardxml.getSmbxq()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>设备序列号</def_quote>  <def_value>"+ Comment.checknull(cardxml.getSbxlh()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>是否承继</def_quote>  <def_value>"+ Comment.getifjc(cardxml.getSfjc()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>送修保修期</def_quote>  <def_value>"+ Comment.checknull(cardxml.getSxbxq()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>土地证号码</def_quote>  <def_value>"+ Comment.checknull(cardxml.getTdzhm()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>外置硬盘</def_quote>  <def_value>"+ Comment.checknull(cardxml.getWzyp()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>系统显示器</def_quote>  <def_value>"+ Comment.checknull(cardxml.getXtxsq()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>有无对应土地</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYwdytd()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>原系统录入员</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYxtrry()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>月折旧额</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYzje()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>月折旧率</def_quote>  <def_value>"+ Comment.checknull(cardxml.getYzjl()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>在用状态</def_quote>  <def_value>"+ Comment.checknull(cardxml.getZyzt()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>占地面积</def_quote>  <def_value>"+ Comment.checknull(cardxml.getZdmj()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>主要用途</def_quote>  <def_value>"+ Comment.checknull(cardxml.getZyyt()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>注销日期</def_quote>  <def_value>"+ Comment.checknull(cardxml.getZxrq()) + "</def_value>  </entry>"
				+ "<entry>  <def_quote>装修面积</def_quote>  <def_value>"+ Comment.checknull(cardxml.getZxmj()) + "</def_value>  </entry>" 
				+ "<entry>  <def_quote>原始取得价值</def_quote>  <def_value>"+ Comment.checknull(ysqdjz) + "</def_value>  </entry>" 
				+ "<entry>  <def_quote>使用年限</def_quote>  <def_value>"+ Comment.checknull(synx) + "</def_value>  </entry>" 
				+ "<entry>  <def_quote>资产状态</def_quote>  <def_value>"+"0102"+"</def_value>  </entry>" 
				+ "<entry>  <def_quote>对应土地证号</def_quote>  <def_value>"+Comment.checknull(temp.getDytdzh())+ "</def_value>  </entry>" 
				+ "<entry>  <def_quote>对应土地原卡片编号</def_quote>  <def_value>"+Comment.checknull(temp.getDytdkp())+ "</def_value>  </entry>" 
				+ "<entry>  <def_quote>合同号码</def_quote>  <def_value>"+Comment.checknull(temp.getHthm())+ "</def_value>  </entry>" 
				+ "<entry>  <def_quote>供应商</def_quote>  <def_value>"+Comment.checknull(temp.getGys())+ "</def_value>  </entry>" 
				+ "<entry>  <def_quote>硬盘型号</def_quote>  <def_value>"+Comment.checknull(temp.getQpxh())+ "</def_value>  </entry>" 
				+ "</card_body>"
				+ "</card>");
		return erpxml;
	}
	
	public static void saveOrUpdate(PublicDao dao, LcCardtemp temp,CaShead pojo, ErpCardaddsend erpcardvalue) {
		String str1 = "from ErpCardaddsend t  where t.dypk = ? and t.bdh = ?";
		String strs[] = new String[2];
		strs[0] = String.valueOf(temp.getId());
		strs[1] = String.valueOf(pojo.getId());
		List list2 = dao.find(str1, strs);
		if (list2.size() > 0) {
			ErpCardaddsend erpcard = (ErpCardaddsend) list2.get(0);
			dao.update(erpcard);
		} else {
			dao.save(erpcardvalue);
		}
	}
	
	public static StringBuffer CardAddEnd() {
		StringBuffer erpxml = new StringBuffer();
		erpxml.append("</ufinterface>");
		erpxml.append("</jic:service>");
		erpxml.append("</soap:Body>");
		erpxml.append("</soap:Envelope>");
		return erpxml;
	}
	
	public static List pasexml(String documentstr) {
		String resultcode = "";
		String resultdescription = "";
		String billpk = "";
		String bdocid = "";
		String cardcode = "";
		String asset_code = "";
		List resultlist = new ArrayList();
		try {
			if (documentstr.indexOf("sendresult") > 0
					&& documentstr.indexOf("content") > 0) {
				SAXBuilder builder = new SAXBuilder(false);
				Reader in = new StringReader(documentstr);
				Document doc = builder.build(in);
				Element books = doc.getRootElement();
				List list1 = books.getChildren("sendresult");
				for (Iterator it = list1.iterator(); it.hasNext();) {
					Element book = (Element) it.next();
					billpk = book.getChildTextTrim("bdocid");
					resultcode = book.getChildTextTrim("resultcode");
					resultdescription = book
							.getChildTextTrim("resultdescription");
					List list2 = book.getChildren("content");
					Iterator it2 = list2.iterator();
					Element book2 = (Element) it2.next();
					List list3 = book2.getChildren("card");
					Iterator it3 = list3.iterator();
					Element book3 = (Element) it3.next();
					cardcode = book3.getChildTextTrim("cardcode");
					asset_code = book3.getChildTextTrim("asset_code");
					bdocid = book3.getChildTextTrim("eambill");
					CardaddZjmodel cardinfo = new CardaddZjmodel();
					cardinfo.setErpCardCode(cardcode);
					cardinfo.setErpZcCode(asset_code);
					cardinfo.setEamCode(bdocid);
					cardinfo.setEamPk(billpk);
					cardinfo.setReturnCode(resultcode);
					cardinfo.setReturnInfo(resultdescription);
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

		Iterator it = list.iterator();
		while (it.hasNext()) {
			CardaddZjmodel model = (CardaddZjmodel) it.next();
			String cardcode = model.getEamCode();
			String cardpk = model.getEamPk();
			String str1 = "from ErpCardaddsend t  where t.dypk = ? and t.bdh = ?";
			String[]strs = new String[2];
			strs[0] = model.getEamPk();
			strs[1] = model.getEamCode();
			List list2 = dao.find(str1, strs);
			if (list2.size() > 0) {
				ErpCardaddsend erpcard = (ErpCardaddsend) list2.get(0);
				erpcard.setErpkpbm(model.getErpCardCode());
				erpcard.setErpzcbm(model.getErpZcCode());
				dao.update(erpcard);
			}
			String cardsql = "from LcCardtemp td where td.kpxzid='"+model.getEamCode()+"'  and td.id='"+model.getEamPk()+"'";
			//String[]strs1 = new String[1];
			//strs1[0] = pojo.getWfconfigCode();
			List list1 = dao.find(cardsql, new ArrayList()); 
			if (list1.size() > 0) {
				LcCardtemp lccardtemp = (LcCardtemp) list1.get(0);
				lccardtemp.setCardcode(model.getErpCardCode());
				lccardtemp.setErpassetcode(model.getErpZcCode());
				dao.update(lccardtemp);
			}
		}
		pojo.setSenderp("2");
		dao.update(pojo);
	}
}
