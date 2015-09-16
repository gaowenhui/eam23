package com.tansun.eam2.jiekou.erp.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardhbsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

public class DaoCardHb {
	public static void QueryHbState(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl, String erpNotice) {
		try {
			String sql = "select   distinct   billcode,bcardcode ,EAMCODEPK  from erp_cardhbsend  where  sfbh is null";
			List list = dao.queryForList(sql, new ArrayList());
			Iterator it = list.iterator();
			while (it.hasNext()) {
				Map map = (Map) it.next();
				String billcode = (String) map.get("billcode");
				String billid = (String)  map.get("bcardcode");
				String eamcode = (String) map.get("EAMCODEPK");
				StringBuffer erpxml = new StringBuffer();
				erpxml.append(Comment_CoalitionSpd.CardHbHead());
				erpxml.append(Comment_CoalitionSpd.CardhQuery());
				erpxml.append(Comment_CoalitionSpd.getQueryhead(billid, billcode));
				String zjsql = "select  t from  ErpCardhbsend t  where t.billcode=?";
				List list1 = dao.find(zjsql, new Object[]{billcode});
				if (list1.size() > 0) {
					Iterator ite = list1.iterator();
					while (ite.hasNext()) {
						ErpCardhbsend cardhbsend = (ErpCardhbsend) ite.next();
						erpxml.append(Comment_CoalitionSpd.QueryModel(cardhbsend.getBcardcode()));
					}
				}
				erpxml.append(Comment_CoalitionSpd.CardReduceItemEnd());
				String input = new Comment().sender(erpxml);//发送消息，并得到返回erp信息
				
				CaShead pojo1 = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.parseLong(eamcode)}); //add by lantianbo 2010-12-01根据表单号，得到表单信息，
				//插入erp_history表，备份发送记录  
				if(pojo1!=null){
					new OA_Database().insertClob(pojo1.getId().toString(), String.valueOf(pojo1 
							.getId()), pojo1.getNgrmc(), pojo1.getBdlx()// TODO 这个需要确认
							, String.valueOf(erpxml), String.valueOf(input),dao);
				}
				Comment_CoalitionSpd.Queryspstate(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl,Comment.geterp(input, "<ufinterface", "</ufinterface>"), erpNotice);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
