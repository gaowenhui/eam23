package com.tansun.eam2.jiekou.erp.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardspdaddsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * EAM定时取ERP反馈信息 卡片新增
 * @author lantb
 *根据一期相关代码复制更改
 */
public class DaoCardaddSpd {
	public static void diaodu(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl) {
		String hql = "select  distinct t.erpkpbm, t.bdh ,t.sfbh  from erp_cardspdaddsend t  where t.sfbh is null  and  t.fhbm<>'3' ";
		String noticeERP = null;
		List erpKpbmList = dao.queryForList(hql, new ArrayList());
		for (int i = 0; i < erpKpbmList.size(); i++) {
			Map map = (Map) erpKpbmList.get(i);
			String erpkpbm 	= (String) (map.get("erpkpbm")==null?"":map.get("erpkpbm"));
			String bdh 		= (String) (map.get("bdh")	  ==null?"":map.get("bdh"));
			String sfbh 	= (String) (map.get("sfbh")	  ==null?"":map.get("sfbh"));
			
			StringBuffer erpxml = new StringBuffer();
			erpxml.append(Comment_AddSpd.QuerySpd(Comment.checknull(String.valueOf(erpkpbm))));
			String input = new Comment().sender(erpxml);
			CaShead pojo = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.parseLong(bdh)}); //add by lantianbo 2010-12-01根据表单号，得到表单信息，
			//插入erp_history表，备份发送记录  
			if(pojo !=null){
				new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo 
						.getId()), pojo.getNgrmc(), pojo.getBdlx()// TODO 这个需要确认
						, String.valueOf(erpxml), String.valueOf(input),dao);
			}
			String documentstr = Comment.geterp(input, "<ufinterface",
					"</ufinterface>");
			String code = Comment.getvalue(documentstr, "resultcode");
			if (code.equals("1")) {
				String billstatus = Comment_AddSpd.getQueryvalue(documentstr,
						"billstatus");
				if (billstatus.equals("3")) {
					String billcode = Comment_AddSpd.getQueryvalue(documentstr,
							"billcode");
					String checknote = Comment_AddSpd.getQueryvalue(
							documentstr, "checknote");
					if (checknote.length() < 1) {
						checknote = "卡片新增，不通过";
					}
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
					pojo.setIsrejected("01");
					pojo.setErpnotice(checknote);
					dao.update(pojo);
					String sql = "from ErpCardspdaddsend  t where t.erpkpbm = ?";
					ErpCardspdaddsend send = (ErpCardspdaddsend)dao.findSingleResult(sql, new Object[]{billcode});
					if(send!=null){
						send.setSfbh("1");
						dao.update(send);
					}
					String lct = "addCard";
					// TODO 以下涉及流程，暂时不考虑
//					Integer OperationID = Integer.valueOf(erp[1].toString());
//					String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID = ?";
//					List listdep = dao.getHibernateSession().createSQLQuery(
//							depmentqf).setInteger("OperationID", OperationID)
//							.list();
//					if (listdep.size() > 0) {
//						lct = (String) listdep.get(0);
//					}
//
//					String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//							+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//							+ lct + "'  and s.OperationID=:OperationID " + ")";
//					List list3 = session.createQuery(hql2).setInteger(
//							"OperationID", OperationID).list();
//					if (list3.size() > 0) {
//						PendingForm pending = (PendingForm) list3.get(0);
//						pending.setOpenState(0);
//						pending.setSenderCN("会计处");
//						Transaction trans = session.beginTransaction();
//						session.saveOrUpdate(pending);
//						trans.commit();
//						CaShead pojo = (CaShead) session.get(LcKpadd.class,
//								pending.getOperationID());
//						if (pojo != null) {
//							String sqlu = "update CaShead t set t.SENDERP=:send,t.ISREJECTED=:IsRejected,t.ERPNOTICE=:ErpNotice where t.id=:id";
//							session.createSQLQuery(sqlu).setString("send", "1")
//									.setString("IsRejected", "01").setString(
//											"ErpNotice", checknote).setInteger(
//											"id",
//											Integer.valueOf(pending
//													.getOperationID()))
//									.executeUpdate();
//						}
//						try {
//							String sql = "from ErpCardspdaddsend  t where t.erpkpbm=:erpkpbm";
//							List list2 = session.createQuery(sql).setString(
//									"erpkpbm", billcode).list();
//							if (list2.size() > 0) {
//								for (Iterator it2 = list2.iterator(); it2
//										.hasNext();) {
//									ErpCardspdaddsend erpcard = (ErpCardspdaddsend) it2
//											.next();
//									erpcard.setSfbh("1");
//									Transaction tran = session
//											.beginTransaction();
//									session.saveOrUpdate(erpcard);
//									tran.commit();
//								}
//							}
//						} catch (Exception ex) {
//							ex.printStackTrace();
//						}
//					}
				}

			}
		}
		//session.close();
	}
	public static void getcardcode(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl) {   
		try {
			String sql = "select  w.erpzcbm,w.dypk ,w.bdh,w.erpkpbm from erp_cardspdaddsend w where w.fhbm='1' and w.fhxx  is null ";
			List list = dao.queryForList(sql, new ArrayList()); 
			for (Iterator it = list.iterator(); it.hasNext();) {
				Map map = (Map) it.next();
				String erpkpbm 	= (String) (map.get("erpzcbm")==null?"":map.get("erpzcbm"));
				String dypk 	= (String) (map.get("dypk")	  ==null?"":map.get("dypk"));
				String bdh 		= (String) (map.get("bdh")	  ==null?"":map.get("bdh"));
				String erpkapiancode 	= (String) (map.get("erpkpbm")==null?"":map.get("erpkpbm"));
				//Object[] erpinfo = (Object[]) it.next();
				String erppk = erpkpbm;
				StringBuffer erpxml = Comment_AddSpd.QueryCardCode(erppk,erpkapiancode);
				String input = new Comment().sender(erpxml);
				CaShead pojo = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.parseLong(bdh)}); //add by lantianbo 2010-12-01根据表单号，得到表单信息，
				//插入erp_history表，备份发送记录  
				if(pojo!=null){
					new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo 
							.getId()), pojo.getNgrmc(), pojo.getBdlx()// TODO 这个需要确认
							, String.valueOf(erpxml), String.valueOf(input),dao);
				}
				String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
				String code = Comment.getvalue(documentstr, "resultcode");
				if (code.equals("1")) {
					String erpcode = Comment_AddSpd.getQueryerppk(documentstr, "cardcode");
					String erpzccode = Comment_AddSpd.getQueryerppk(documentstr, "assetcode");
					if (!erpcode.equals("")) {
						String gxsql = "from ErpCardspdaddsend  t where t.erpzcbm = ?";
						List list1 = dao.find(gxsql, new Object[]{erppk});
						Iterator it1 = list1.iterator();
						while (it1.hasNext()) {
							ErpCardspdaddsend erpcard = (ErpCardspdaddsend) it1.next();
							erpcard.setFhxx(erpcode);
							erpcard.setSfbh("");
							erpcard.setFhbm("2");
							dao.update(erpcard);
						}
						LcCardtemp lctemp = (LcCardtemp) dao.findSingleResult("from LcCardtemp t where t.id = ?", new Object[]{Long.parseLong(dypk)});
						if (lctemp != null) {
							lctemp.setCardcode(erpcode);
							lctemp.setErpassetcode(erpzccode);
							dao.update(lctemp);
						}
					}

				}
			}
//			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	public static void taizang(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl, String erpNotice) {
		try {
			String sql = "select  distinct  w.bdh  from erp_cardspdaddsend w where w.fhxx is not null  and w.sfbh is null and w.fhbm='2'";
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				for (Iterator it = list.iterator(); it.hasNext();) {
					Map map = (Map) it.next();
					String bdh = (String) map.get("bdh");
					
					String tempsql = "select t.* from erp_cardspdaddsend  t where t.bdh = ?  and t.fhxx is null";
					List list2 = dao.queryForList(tempsql, new Object[]{bdh});
					if (list2.size() == 0) {
						CaShead kpadd = (CaShead) dao.findSingleResult("from CaShead t where t.id = ?", new Object[]{Long.valueOf(bdh)});
						if (kpadd != null) {
							//String sqlu = "update Ca_Shead t set t.SENDERP = '2',t.ISREJECTED = '03' , t.ERPNOTICE="+erpNotice+" where t.id="+bdh;
							//dao.getJdbcTemplate().execute(sqlu);
							kpadd.setSenderp("2");
							kpadd.setIsrejected("03");
							kpadd.setErpnotice(erpNotice);
							dao.update(kpadd);
							if(!Comment.checkPTCommonOpinion(bdh, dao,"通过")){
								PTCommonOpinionBO bo = new PTCommonOpinionBO();
								bo.setBdid(String.valueOf(bdh));
								bo.setTaskId(null);
								bo.setTjr("15938");
								bo.setYjbm(10762);
								bo.setTjrq(new Date());
								bo.setYjylx(4);//4为erp意见类型
								bo.setYjlx(2);
								bo.setYjnr("通过");
								dao.save(bo);
								Comment.banjie(dao, ptBs, workflowBS, erpCommonUCC, cardQueryUCCImpl, kpadd, bdh);
							}
						}
						String lct = "addCard";
//						Integer OperationID = Integer.valueOf(String.valueOf(kpadd.getId()));
						// TODO 以下涉及流程，暂时不考虑
//						String depmentqf = "select  distinct  t.operationkey   from  wf_pending  t where t.OperationID=?";
//						List listdep = dao.queryForList(depmentqf, new Object[]{OperationID}); 
//						if (listdep.size() > 0) {
//							lct = (String) listdep.get(0);
//						}
//						String hql2 = "select t from PendingForm t where  t.Workitemid in ("
//								+ "select max(s.Workitemid) from PendingForm s where s.OperationKey = '"
//								+ lct
//								+ "'  and s.OperationID=:OperationID "
//								+ ")";
//						List list3 = session.createQuery(hql2).setInteger(
//								"OperationID", Integer.valueOf(bdh)).list();
//						if (list3.size() > 0) {
//							PendingForm pending = (PendingForm) list3.get(0);
//							pending.setOpenState(0);
//							pending.setSenderCN("会计处");
//							Transaction tran = session.beginTransaction();
//							session.saveOrUpdate(pending);
//							tran.commit();
//						}
						String bdhsql = "select t  from ErpCardspdaddsend  t where t.bdh=?";
						List listls = dao.find(bdhsql, new Object[]{bdh}); 
						Iterator itls = listls.iterator();
						while (itls.hasNext()) {
							ErpCardspdaddsend erpcard = (ErpCardspdaddsend) itls.next();
							erpcard.setFhbm("3");
							dao.update(erpcard);
						}
					}
				}
			}
//			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
