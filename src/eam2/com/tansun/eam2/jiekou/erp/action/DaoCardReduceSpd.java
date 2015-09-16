package com.tansun.eam2.jiekou.erp.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardreducesend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

public class DaoCardReduceSpd {
	public static final String ERPBoHui = "01";

	public static void reducespdStatus(PublicDao dao, PTTodoBS ptBs,
			WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,
			ICardQueryUCC cardQueryUCCImpl, String erpNotice) {
		try {
			String sql = "select distinct t.erpdjh,t.eamdjh   from erp_cardreducesend t   where t.zcmc is null";
			List list = dao.queryForList(sql, new ArrayList());
			String noticeERP = null;
			//System.out.println("list.size()------>" + list.size());
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Map erpdjh = (Map) list.get(i);
					StringBuffer erpxml = Comment_Reduce
							.getReduceQuerySpd(String.valueOf(erpdjh
									.get("erpdjh")));
					//System.out.println(String.valueOf(erpdjh.get("erpdjh")) + "====send=========" + erpxml);
					String input = new Comment().sender(erpxml);
					//System.out.println(String.valueOf(erpdjh.get("erpdjh")) + "====receive======" + input);
					CaShead pojo1 = (CaShead) dao.findSingleResult(
							"from CaShead t where t.id = ?",
							new Object[] { Long.parseLong(erpdjh.get("eamdjh")
									.toString()) }); // add by lantianbo
														// 2010-12-01根据表单号，得到表单信息，
					// 插入erp_history表，备份发送记录
					/*
					if (pojo1 != null) {
						new OA_Database().insertClob(pojo1.getId().toString(),
								String.valueOf(pojo1.getId()),
								pojo1.getNgrmc(),
								pojo1.getBdlx()// TODO 这个需要确认
								, String.valueOf(erpxml),
								String.valueOf(input), dao);
					}
					*/
					if (input.indexOf("</ufinterface>") > 0) {
						String documentstr = Comment.geterp(input,
								"<ufinterface", "</ufinterface>");
						String code = Comment.getvalue(documentstr,
								"resultcode");
						if (code.equals("1")) {
							String billstatus = Comment_AddSpd.getQueryvalue(
									documentstr, "billstatus");
							if (billstatus.equals("3")) {
								String billcode = Comment_AddSpd.getQueryvalue(
										documentstr, "billcode");
								String checknote = Comment_AddSpd
										.getQueryvalue(documentstr, "checknote");
								if (checknote.length() < 1) {
									checknote = "财务部驳回,但没有填写驳回意见!";
								}
								if (!Comment.checkPTCommonOpinion(String
										.valueOf(erpdjh.get("eamdjh")), dao,
										"不通过")) {
									PTCommonOpinionBO bo = new PTCommonOpinionBO();
									bo.setBdid(String.valueOf(erpdjh
											.get("eamdjh")));
									bo.setTaskId(null);
									bo.setTjr("15938");
									bo.setYjbm(10762);
									bo.setTjrq(new Date());
									bo.setYjylx(4);// 4为erp意见类型
									bo.setYjlx(2);
									bo.setYjnr("不通过");
									dao.save(bo);
								}
//								Integer OperationID = Integer.valueOf(erpdjh
//										.get("eamdjh").toString());
//								String lct = "reduceCard";
								// TODO 以下工作流相关
								// String depmentqf = "select distinct
								// t.operationkey from wf_pending t where
								// t.OperationID=:OperationID";
								// List listdep =
								// session.createSQLQuery(depmentqf).setInteger("OperationID",
								// OperationID).list();
								// if (listdep.size() > 0) {
								// lct = (String) listdep.get(0);
								// }
								// String hql2 = "select t from PendingForm t
								// where t.Workitemid in ("
								// + "select max(s.Workitemid) from PendingForm
								// s where s.OperationKey = '"
								// + lct
								// + "' and s.OperationID=:OperationID "
								// + ")";
								// List list3 =
								// session.createQuery(hql2).setInteger("OperationID",
								// OperationID).list();
								// if (list3.size() > 0) {
								// PendingForm pending = (PendingForm)
								// list3.get(0);
								// pending.setOpenState(0);
								// pending.setSenderCN("会计处");
								// Transaction trans =
								// session.beginTransaction();
								// session.saveOrUpdate(pending);
								// trans.commit();

								CaShead pojo = (CaShead) dao.findById(
										CaShead.class, Long.valueOf(erpdjh.get(
												"eamdjh").toString()));
								if (pojo != null) {
									String sqlu = "update Ca_Shead t set t.SENDERP='1',t.ISREJECTED='"
											+ ERPBoHui
											+ "',t.ERPNOTICE='"
											+ checknote
											+ "' where t.id='"
											+ erpdjh.get("eamdjh").toString()
											+ "'";
									dao.getJdbcTemplate().execute(sqlu);
								}
								String updatesql = "select t from ErpCardreducesend t where t.eamdjh=?";
								List list1 = dao.find(updatesql,
										new Object[] { erpdjh.get("eamdjh")
												.toString() });
								for (Iterator it1 = list1.iterator(); it1
										.hasNext();) {
									ErpCardreducesend updatecard = (ErpCardreducesend) it1
											.next();
									updatecard.setZcmc("03");
									dao.update(updatecard);
								}
								// }
							} else if (billstatus.equals("4")) {
//								Long OperationID = Long.valueOf(erpdjh
//										.get("eamdjh").toString());
								String lct = "reduceCard";
								// TODO 工作流相关
								// String depmentqf = "select distinct
								// t.operationkey from wf_pending t where
								// t.OperationID=:OperationID";
								// List listdep =
								// session.createSQLQuery(depmentqf).setInteger("OperationID",
								// OperationID).list();
								// if (listdep.size() > 0) {
								// lct = (String) listdep.get(0);
								// }
								// String hql2 = "select t from PendingForm t
								// where t.Workitemid in ("
								// + "select max(s.Workitemid) from PendingForm
								// s where s.OperationKey = '"
								// + lct
								// + "' and s.OperationID=:OperationID "
								// + ")";
								// List list3 = session.createQuery(hql2)
								// .setInteger("OperationID", OperationID)
								// .list();
								// if (list3.size() > 0) {
								// PendingForm pending = (PendingForm)
								// list3.get(0);
								// pending.setOpenState(0);
								// pending.setSenderCN("会计处");
								// Transaction trans =
								// session.beginTransaction();
								// session.saveOrUpdate(pending);
								// trans.commit();
								CaShead pojo = (CaShead) dao
										.findById(CaShead.class, Long
												.valueOf(String.valueOf(erpdjh
														.get("eamdjh"))));
								if (pojo != null) {
									String sqlu = "update ca_shead t set t.SENDERP='2',t.ISREJECTED='03',t.ERPNOTICE='"
											+ erpNotice
											+ "' where t.id='"
											+ String.valueOf(erpdjh
													.get("eamdjh")) + "'";
									dao.getJdbcTemplate().execute(sqlu);
								}
								// }
								if (!Comment.checkPTCommonOpinion(String
										.valueOf(erpdjh.get("eamdjh")), dao,
										"通过")) {
									PTCommonOpinionBO bo = new PTCommonOpinionBO();
									bo.setBdid(String.valueOf(erpdjh
											.get("eamdjh")));
									bo.setTaskId(null);
									bo.setTjr("15938");
									bo.setYjbm(10762);
									bo.setTjrq(new Date());
									bo.setYjylx(4);// 4为erp意见类型
									bo.setYjlx(2);
									bo.setYjnr("通过");
									dao.save(bo);
									Comment.banjie(dao, ptBs, workflowBS,
											erpCommonUCC, cardQueryUCCImpl,
											pojo, String.valueOf(erpdjh.get(
													"eamdjh").toString()));
								}
								String updatesql = "select t from ErpCardreducesend t where t.eamdjh=?";
								List list1 = dao.find(updatesql,
										new Object[] { erpdjh.get("eamdjh")
												.toString() });
								for (Iterator it1 = list1.iterator(); it1
										.hasNext();) {
									ErpCardreducesend updatecard = (ErpCardreducesend) it1
											.next();
									updatecard.setZcmc("03");
									dao.update(updatecard);
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
