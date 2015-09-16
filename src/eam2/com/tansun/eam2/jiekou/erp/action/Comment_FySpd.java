package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.jiekou.erp.model.bo.ErpFyspd;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

public class Comment_FySpd {

	public static String GetNotice(JyzcHead pojo, PublicDao dao) {
		String notice = "";
		try {
			List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? and o.yjylx = '5'", new Object[]{pojo.getId()});
			
			if (mullist.size() > 0) {
				Iterator optioniter = mullist.iterator();
				while (optioniter.hasNext()) {
					PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
					String username = "";
					if(mulpojo!=null){
						String sql = " select a.username from p_t_user a where a.tid = ? ";
						List  list = (List) dao.queryForList(sql, new Object[]{mulpojo.getTjr()});
						if(list!=null){
							Map map = (Map)list.get(0);
							username = String.valueOf( map.get("username"));
						}
						
					}
					String rq = String.valueOf(mulpojo.getTjrq());
					notice = notice + mulpojo.getYjnr()+","	+ username +","
							+ rq.substring(0,16)+"。";
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return notice;
	}

	public static String GetPerson(JyzcHead pojo, PublicDao dao) {
		String notice = "";
		try {
			List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{pojo.getId()});
			
			if (mullist.size() > 0) {
				Iterator optioniter = mullist.iterator();
				while (optioniter.hasNext()) {
					PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
					notice = notice	+ mulpojo.getTjr() + mulpojo.getTjrq();
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return notice;
	}
	
	public static void ljfyspd(String inputstr, PublicDao dao) {
		try {
			if (inputstr.indexOf("sendresult") > 0
					&& inputstr.indexOf("content") > 0
					&& inputstr.indexOf("bill") > 0) {
				SAXBuilder builder = new SAXBuilder(false);
				Reader in = new StringReader(inputstr);
				Document doc = builder.build(in);
				Element books = doc.getRootElement();
				// sendresult
				List list1 = books.getChildren("sendresult");
				Iterator it = list1.iterator();
				Element book1 = (Element) it.next();
				// bdocid
				String bdocid = book1.getChildTextTrim("bdocid");
				// resultcode
				String resultcode = book1.getChildTextTrim("resultcode");
				// content
				List list2 = book1.getChildren("content");
				Iterator it3 = list2.iterator();
				Element book3 = (Element) it3.next();
				// bill
//				List list3 = book3.getChildren("bill");
				List list3 = books.getChildren("bill");
				Iterator it41 = list3.iterator();
				Element book41 = (Element) it41.next();
				
				List list31 = book41.getChildren("bill");
				Iterator it4 = list31.iterator();
				Element book4 = (Element) it4.next();
				// id
				String erpbill = book4.getChildTextTrim("erpbill");
				String id = book4.getAttributeValue("id");
				// body
				List list4 = book4.getChildren("body");
				Iterator it5 = list4.iterator();
				Element book9 = (Element) it5.next();
				// entry
				List list5 = book9.getChildren("entry");
				Iterator it6 = list5.iterator();

				String sql = "select  t from  ErpFyspd  t  where t.bdocid= ?";
				
				List list9 = dao.find(sql, new Object[]{bdocid});
				if (list9.size() > 0) {
					Iterator it9 = list9.iterator();
					while (it9.hasNext()) {
						ErpFyspd fyspd = (ErpFyspd) it9.next();
						dao.delete(fyspd);
					}
				}
				while (it6.hasNext()) {
					Element book6 = (Element) it6.next();
					String eampk = book6.getChildTextTrim("eampk");
					String erppk = book6.getChildTextTrim("erppk");
					ErpFyspd fyspd = new ErpFyspd();
					fyspd.setBdocid(bdocid);
					fyspd.setErpbill(erpbill);
					fyspd.setBill(id);
					fyspd.setErppk(erppk);
					fyspd.setEampk(eampk);
					dao.save(fyspd);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void deletecz(String mainid, String wfconfigCode, PublicDao dao) {
		String sql = "select td from JyzcXxLsb td  where td.cldId=?";// and td.WfconfigCode=:wfconfigCode and td.State='01'";//TODO流程相关，备注
		List list1 = dao.find(sql, new Object[]{mainid});
		if (list1.size() > 0) {
			Iterator it = list1.iterator();
			while (it.hasNext()) {
				JyzcXxLsb zctemp = (JyzcXxLsb) it.next();
				String assetcode = zctemp.getCZczlbm();//.getAssetCode();
				String zccard = "select  zc  from  JyzcXx zc where zc.CZczlbm=?";
				List list2 = dao.find(zccard, new Object[]{assetcode});
				Iterator it2 = list2.iterator();
				while (it2.hasNext()) {
					JyzcXx zcinfo = (JyzcXx) it2.next();
					//zcinfo.setState("02"); //TODO 流程相关 备注
					dao.update(zcinfo);
				}
			}
		}
	}
}
