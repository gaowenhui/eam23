package com.tansun.eam2.jiekou.erp.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;
/**
 * 定时器，取卡片拆分返回信息
 * @author lantb
 *根据一期eam代码复制更改
 */
public class DaoCardCf {
	public static void QuerySpState(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl, String erpNotice) { 
		try {
			String sql = "select   t.fbyz ,t.erpcode  ,t.eamcode  from erp_cardcfsend t  where t.sfcode  is null";
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				for(int i=0;i<list.size();i++){
					Map erp = (Map) list.get(i);
					StringBuffer erpxml = new StringBuffer();
					
					String billid = (String) erp.get("fbyz");
					String billcode = (String)  erp.get("erpcode");
					String eamcode = (String) erp.get("eamcode");
					erpxml.append(Comment_SplitSpd.CardReduceHead());
					erpxml.append(Comment_SplitSpd.ufdQueryhead());
					erpxml.append(Comment_SplitSpd.QuerybillHead(billid, billcode));//得到发送xml的头信息
					erpxml.append(Comment_SplitSpd.geterpcode(billid, billcode, dao));//得到erpcode
					erpxml.append(Comment_SplitSpd.Querybillend());
					erpxml.append(Comment_SplitSpd.esbend());
					String input = new Comment().sender(erpxml);//拼装xml后返回信息
					CaShead pojo1 = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.parseLong(eamcode)}); //add by lantianbo 2010-12-01根据表单号，得到表单信息，
					//插入erp_history表，备份发送记录  
					if(pojo1!=null){
						new OA_Database().insertClob(pojo1.getId().toString(), String.valueOf(pojo1 
								.getId()), pojo1.getNgrmc(), pojo1.getBdlx()// TODO 这个需要确认
								, String.valueOf(erpxml), String.valueOf(input),dao);
					}
					Comment_SplitSpd.Queryspstate(Comment.geterp(input, "<ufinterface", "</ufinterface>"), dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl, erpNotice);//返回信息操作主方法
				}
			}
//			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
