package com.tansun.eam2.jiekou.erp.action;

import java.io.Reader;
import java.io.StringReader;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.jiekou.erp.model.bo.ErpBxmx;
import com.tansun.eam2.jiekou.erp.model.bo.ErpFyspd;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

public class DaoSxSpd {

	public static void QueryJs(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl) {
		try {
			String delsql = "truncate table  erp_bxmx";
			dao.getJdbcTemplate().execute(delsql);
			String sql = "from  ErpFyspd  t ";
			List list = dao.find(sql);
			if (list.size() > 0) {
				Iterator it8 = list.iterator();
				while (it8.hasNext()) {
					ErpFyspd fyspd = (ErpFyspd) it8.next();
					String eamvalue = fyspd.getEampk();
					String erpvalue = fyspd.getErppk();
					String bill = fyspd.getBdocid();

					StringBuffer xml = new StringBuffer();
					xml.append(Comment_Money.Esbhead());
					xml.append(Comment_Money.QueryFyhead());
					xml.append(Comment_Money.QueryFySpd(bill, eamvalue, erpvalue));
					xml.append(Comment_Money.Esbend());
					String input = new Comment().sender(xml);
					if (input.indexOf("<ufinterface") > 0) {
						String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
						String code = Comment.getvalue(documentstr, "resultcode");
						if (code.equals("1")) {
							SAXBuilder builder = new SAXBuilder(false);
							Reader in = new StringReader(documentstr);
							Document doc = builder.build(in);
							Element books = doc.getRootElement();
							List list9 = books.getChildren("sendresult");
							Iterator it9 = list9.iterator();
							Element booky = (Element) it9.next();
							String bdocid = booky.getChildTextTrim("bdocid");
							List list1 = books.getChildren("queryresult");
							Iterator it = list1.iterator();
							Element book1 = (Element) it.next();
							List list2 = book1.getChildren("bill");
							Iterator it2 = list2.iterator();
							Element book2 = (Element) it2.next();
							String issettled = book2.getChildTextTrim("issettled");
							if (issettled.equals("Y")) {
								List list3 = book2.getChildren("body");
								Iterator it3 = list3.iterator();
								Element book3 = (Element) it3.next();
								List list4 = book3.getChildren("entry");
								Iterator it4 = list4.iterator();
								while (it4.hasNext()) {
									Element book4 = (Element) it4.next();
									String money = book4.getChildTextTrim("money");
									String erppk = book4.getChildTextTrim("erppk");
									String eampk = book4.getChildTextTrim("eampk");
									ErpBxmx erpbx = new ErpBxmx();
									erpbx.setEampk(eampk);
									erpbx.setErppk(erppk);
									erpbx.setMoney(Double.parseDouble(money));
									erpbx.setBillcode(bdocid);
									dao.save(erpbx);
								}
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
