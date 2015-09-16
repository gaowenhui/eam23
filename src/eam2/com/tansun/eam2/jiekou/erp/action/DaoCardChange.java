package com.tansun.eam2.jiekou.erp.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardbdsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

public class DaoCardChange {

	public static void checkChange(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl, String erpNotice) {
		String sql = "select t from  ErpCardbdsend t where t.sfbh  is null";
		List list = dao.find(sql, new ArrayList());
		Iterator it = list.iterator();
		while (it.hasNext()) {
			ErpCardbdsend carddbsend = (ErpCardbdsend) it.next();
			StringBuffer erpxml = new StringBuffer();
			String bill_code = carddbsend.getErpcode();
			erpxml.append(Comment_ChangeSpd.QuerySpd(bill_code));
			String input = new Comment().sender(erpxml);
			String eamcode = carddbsend.getEamcode();
			CaShead pojo1 = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.parseLong(eamcode)}); //add by lantianbo 2010-12-01根据表单号，得到表单信息，
			//插入erp_history表，备份发送记录  
			if(pojo1!=null){
				new OA_Database().insertClob(pojo1.getId().toString(), String.valueOf(pojo1 
						.getId()), pojo1.getNgrmc(), pojo1.getBdlx()// TODO 这个需要确认
						, String.valueOf(erpxml), String.valueOf(input),dao);
			}
			
			
			String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
			String code = Comment.getvalue(documentstr, "resultcode");
			String codeinfo = Comment.getinfo(documentstr, "resultdescription");
			if (code.equals("1")) {
				String billstatus = Comment_ChangeSpd.getQueryvalue(documentstr, "billstatus");
				if (billstatus.equals("2")) {
					String billcode = Comment_ChangeSpd.getQueryvalue(documentstr, "billcode");
					carddbsend.setSfbh("2");
					dao.update(carddbsend);
					
					CaShead lcdpdb = (CaShead) dao.findById(CaShead.class, Long.valueOf(carddbsend.getEamcode()));
					if (lcdpdb != null) {
						String sqlu = "update Ca_Shead t set t.SENDERP='2',t.ISREJECTED='03',t.ERPNOTICE='"+erpNotice+"' where t.id='"+carddbsend.getEamcode()+"'";
						dao.getJdbcTemplate().execute(sqlu);
					}
					if(!Comment.checkPTCommonOpinion(String.valueOf(carddbsend.getEamcode()), dao,"通过")){
						PTCommonOpinionBO bo = new PTCommonOpinionBO();
						bo.setBdid(String.valueOf(carddbsend.getEamcode()));
						bo.setTaskId(null);
						bo.setTjr("15938");
						bo.setYjbm(10762);
						bo.setTjrq(new Date());
						bo.setYjylx(4);//4为erp意见类型
						bo.setYjlx(2);
						bo.setYjnr("通过");
						dao.save(bo);
						Comment.banjie(dao, ptBs, workflowBS, erpCommonUCC, cardQueryUCCImpl, lcdpdb, String.valueOf(carddbsend.getEamcode()));
					}
					String lct = "card_change";
					Integer OperationID = Integer.valueOf(carddbsend.getEamcode());
					//TODO 以下工作流相关
//					String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//					List listdep = session.createSQLQuery(depmentqf).setInteger("OperationID", OperationID).list();
//					if (listdep.size() > 0) {
//						lct = (String) listdep.get(0);
//					}
//					String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//							+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//							+ lct + "'  and s.OperationID=:OperationID " + ")";
//					List list3 = session.createQuery(hql2).setInteger(
//							"OperationID", OperationID).list();
//					if (list3.size() > 0) {
//						PendingForm pending = (PendingForm) list3.get(0);
//						pending.setOpenState(0);
//						pending.setSenderCN("会计处");
//						Transaction tans2 = session.beginTransaction();
//						session.saveOrUpdate(pending);
//						tans2.commit();
//					}
				} else if (billstatus.equals("3") || billstatus.equals("0")) {
					String billcode = Comment_ChangeSpd.getQueryvalue(documentstr, "billcode");
					carddbsend.setSfbh("1");
					dao.update(carddbsend);
					String checknote = Comment_ChangeSpd.getQueryvalue(documentstr, "checknote");
					CaShead lcdpdb = (CaShead) dao.findById(CaShead.class, Long.valueOf(carddbsend.getEamcode()));
					if (lcdpdb != null) {
						// lcdpdb.setIsRejected("01");
						if (checknote.length() < 1) {
							checknote = "财务部驳回卡片变动,但没有填写驳回意见!";
						}
						if(!Comment.checkPTCommonOpinion(String.valueOf(carddbsend.getEamcode()), dao,"不通过")){
							PTCommonOpinionBO bo = new PTCommonOpinionBO();
							bo.setBdid(String.valueOf(carddbsend.getEamcode()));
							bo.setTaskId(null);
							bo.setTjr("15938");
							bo.setYjbm(10762);
							bo.setTjrq(new Date());
							bo.setYjylx(4);//4为erp意见类型
							bo.setYjlx(2);
							bo.setYjnr("不通过");
							dao.save(bo);
						}
						// lcdpdb.setErpNotice(checknote);
						String sqlu = "update Ca_Shead t set t.ISREJECTED='01',t.ERPNOTICE='"+checknote+"' where t.id='"+carddbsend.getEamcode()+"'";
						dao.getJdbcTemplate().execute(sqlu);
					}
					Integer OperationID = Integer.valueOf(carddbsend.getEamcode());
					String lct = "card_change";
					//TODO 以下工作流相关
//					String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=:OperationID";
//					List listdep = session.createSQLQuery(depmentqf).setInteger("OperationID", OperationID).list();
//					if (listdep.size() > 0) {
//						lct = (String) listdep.get(0);
//					}
//					String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//							+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//							+ lct + "'  and s.OperationID=:OperationID " + ")";
//					List list3 = session.createQuery(hql2).setInteger( "OperationID", OperationID).list();
//					if (list3.size() > 0) {
//						PendingForm pending = (PendingForm) list3.get(0);
//						pending.setOpenState(0);
//						pending.setSenderCN("会计处");
//						Transaction trans2 = session.beginTransaction();
//						session.saveOrUpdate(pending);
//						trans2.commit();
//					}
				}
			}
		}
	}
}
