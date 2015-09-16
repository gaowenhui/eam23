package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.service.IAssetDealHeadBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

@Service
public class AssetDealHeadBSImpl extends CommonBSImpl implements
		IAssetDealHeadBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 根据拟稿日期、拟稿人和处理单状态，查询出处理单信息
	 * 
	 * @param date
	 *            拟稿日期
	 * @param ngr
	 *            拟稿人
	 * @param state
	 *            处理单状态
	 * @return
	 */
	public CzCztzfaXx findHeadByDateAndPerson(Date date, String ngr,
			String state) {
		String hql = "from CzCztzfaXx o where o.ngrq = ? and o.ngr = ? and o.cldzt = ?";
		Object[] params = new Object[] { date, ngr, state };
		CzCztzfaXx result = (CzCztzfaXx) publicDao
				.findSingleResult(hql, params);
		return result;
	}

	/**
	 * 根据处理单id计算预计处置费用总额
	 * 
	 * @param cldId
	 */
	@SuppressWarnings("unchecked")
	public Double fillDisposeExpense(String cldId) {
		String hql = "from CzFysrMx o where o.cldId = ?";
		Object[] params = new Object[] { cldId };
		List<CzFysrMx> list = (List<CzFysrMx>) this.publicDao.find(hql, params);
		// 修改表单中信息
		Double disposeExpenses = 0d;
		for (CzFysrMx temp : list) {
			disposeExpenses += temp.getYjhf();
		}
		CzCztzfaXx czCztzfaXx = this.publicDao
				.findById(CzCztzfaXx.class, cldId);
		czCztzfaXx.setYjczfy(disposeExpenses);
		this.publicDao.update(czCztzfaXx);
		return disposeExpenses;
	}

	/**
	 * 查找当前流程在项目受理中的部门和人员,返回到页面，在合规审查提交会议组织时用
	 * 
	 * @param taskId
	 * @return
	 */
	public String findXmslDept(String taskId, String taskp) {
		// String sql = "select t."
		String hql = "from PTDid o, "
				+ " 	(select max(t.draft_date) draft_date "
				+ "		from PTDid t "
				+ "		where  t.taskid = ? and t.taskname=?) p "
				+ " where o.taskid = ? and o.taskname = ? o.draft_date = p.draft_date";
		Object[] params = new Object[] { taskId, taskp, taskId, taskp };

		List<PTDid> list = (List<PTDid>) this.publicDao.find(hql, params);
		String deptAndUser = ((PTDid) list.get(0)).getDeptId() + ","
				+ String.valueOf(((PTDid) list.get(0)).getUserId());
		return deptAndUser;
	}

	// select * from p_t_did r , (select max(t.draft_date) draft_date
	// from p_t_did t
	// where t.taskname='项目受理' and t.taskid = '1240015' ) n
	// where r.taskname='项目受理' and r.taskid = '1240015' and r.draft_date =
	// n.draft_date

	// ------------------------------------------------------//
	// ------ 程序自动生成的SetGet方法 -----------------------//
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	@SuppressWarnings("unchecked")
	public List<CzCztzfaXx> findHistoryBlInfo(String cldId) {
		// 根据处理单id查询出编号
		String sql = "select t.* from cz_cztzfa_xx t where t.id = ?";
		List<String> params = new ArrayList<String>();
		params.add(cldId);
		List list = this.publicDao.queryForList(sql, params);
		Map map = (Map) list.get(0);
		Date fblsj = (Date) map.get("FBLSJ");
		if (fblsj == null)
			fblsj = new Date();
		String bianhao = (String) map.get("BIANHAO");
		// 根据编号查询出历史办理情况，不包括本次处理单信息
		String hql = "from CzCztzfaXx o where o.bianhao = ? and o.fblsj < ? order by o.fblsj desc";
		Object[] param = new Object[] { bianhao, fblsj };
		List<CzCztzfaXx> resultList = (List<CzCztzfaXx>) this.publicDao.find(
				hql, param);
		return resultList;
	}

	public String zcczDataProcess() {
		String sql = "from PTEnd where headType = '会议组织'";
		// String sql = "from PTEnd where headType = '资产处置审批'";
		List list = publicDao.find(sql);
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				PTEnd end = (PTEnd) list.get(i);
				// 会议组织
				end.setUrl("/eam2/zcczshWorkflow/zcczshWorkflow_endView.do");
				end.setProcInstId("tbtbhyzz" + i);
				// zccz_assetdisposalsubproc

				// 通用资产处置
				// end.setUrl("/eam2/zcczassetWorkflow/zcczassetWorkflow_endView.do");
				// end.setProcInstId("tbtbtyzccz" + i);

				publicDao.update(end);
				String headId = end.getHeadId();
				if (headId != null) {
					String sql1 = "select t.id, t.DRAFT_USERID,t.send_userid from P_T_Did t where t.head_Id=?";
					List list1 = publicDao.queryForList(sql1,
							new Object[] { headId });
					if (list1 != null && list1.size() > 0) {
						for (int j = 0; j < list1.size(); j++) {
							Map map = (Map) list1.get(j);
							String sendUserId = String.valueOf(map
									.get("send_userid"));
							String draftUserId = String.valueOf(map
									.get("draft_userid"));
							String id = String.valueOf(map.get("id"));
							// draft_userid 转换
							String sql4 = "from PTUserBO t where t.username = ?";
							PTUserBO user2 = (PTUserBO) publicDao
									.findSingleResult(sql4,
											new Object[] { draftUserId });
							if (user2 != null) {
								draftUserId = String.valueOf(user2.getTid());
							}
							// send_userid 转换
							String sql6 = "from PTUserBO t where t.username = ?";
							PTUserBO user3 = (PTUserBO) publicDao
									.findSingleResult(sql6,
											new Object[] { sendUserId });
							if (user3 != null) {
								sendUserId = String.valueOf(user3.getTid());
							}

							String sql5 = "update P_T_Did t set t.DRAFT_USERID = '"
									+ draftUserId
									+ "' , t.send_userid = '"
									+ sendUserId
									+ "' ,t.statu = '0', t.PROC_INST_ID= '"
									+ end.getProcInstId()
									+ "' where t.id = '"
									+ id + "'";
							System.out.println(id + "-------" + sql5);
							publicDao.getJdbcTemplate().execute(sql5);
						}
					}
				}
			}
		}
		return "";
	}

	public void processData() {
		String hql = "from CzZcXx";
		List<CzZcXx> list = (List<CzZcXx>) publicDao.find(hql);
		for (CzZcXx temp : list) {
			String cldId = temp.getCldId();
			String[] ids = cldId.split(",");
			if (ids.length >= 2) {
				for (int i = 0; i < ids.length; i++) {
					CzZcXx czzcxx = new CzZcXx();
					try {
						BeanUtils.copyProperties(czzcxx, temp);
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
					czzcxx.setId(null);
					czzcxx.setCldId(ids[i]);
					this.publicDao.save(czzcxx);
				}
				this.publicDao.delete(temp);
			} else {
				continue;
			}
		}
	}

	/*
	 * 数据加工脚本
	 * 
	 * 修改初始处理单id值为id update cz_cztzfa_xx t set t.CSCLDID = t.id;
	 */
	public void processData2() {
		// 对资产的处置方式进行修改
		String hql = "from CzCztzfaXx";
		List<CzCztzfaXx> list = (List<CzCztzfaXx>) publicDao.find(hql);
		for (int i = 0; i < list.size(); i++) {
			CzCztzfaXx temp = list.get(i);
			String czfs = temp.getCCzfs();
			String hql2 = "from CzZcXx o where o.cldId = ?";
			List<CzZcXx> zcList = (List<CzZcXx>) publicDao.find(hql2,
					new Object[] { temp.getId() });
			for (CzZcXx zcxx : zcList) {
				zcxx.setCCzfs(czfs);
				this.publicDao.update(zcxx);
			}
		}
	}

	//卡片数据处理	
	public String test() {
		String sql = "from PTEnd where headType like '卡片%' ";
		List list = publicDao.find(sql);
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				PTEnd end = (PTEnd) list.get(i);
				end.setUrl("/eam2/kpglWorkflow/kpglWorkflow_endView.do");
				end.setProcInstId("tbtbcpgl" + i);
				publicDao.update(end);
				String headId = end.getHeadId();
				if (headId != null) {
					String sql1 = "select t.id, t.DRAFT_USERID,t.send_userid from P_T_Did t where t.head_Id=?";
					List list1 = publicDao.queryForList(sql1,
							new Object[] { headId });
					if (list1 != null && list1.size() > 0) {
						for (int j = 0; j < list1.size(); j++) {
							// did.setProcInstId(end.getProcInstId());
							Map map = (Map) list1.get(j);
							String sendUserId = String.valueOf(map
									.get("send_userid"));
							String draftUserId = String.valueOf(map
									.get("draft_userid"));
							String id = String.valueOf(map.get("id"));
							String sql4 = "from PTUserBO t where t.username = ?";
							// PTUserBO user1 =
							// (PTUserBO)publicDao.findSingleResult(sql4,new
							// Object[]{sendUserId});
							PTUserBO user2 = (PTUserBO) publicDao
									.findSingleResult(sql4,
											new Object[] { draftUserId });
							// if(user1!=null){
							// sendUserId = String.valueOf(user1.getTid());
							// }
							if (user2 != null) {
								draftUserId = String.valueOf(user2.getTid());
							}
							String sql5 = "update P_T_Did t set t.DRAFT_USERID = '"
									+ draftUserId
									+ "' , t.send_userid = '' ,t.statu = '0', t.PROC_INST_ID= '"
									+ end.getProcInstId()
									+ "' where t.id = '"
									+ id + "'";
							System.out.println(id + "-------" + sql5);
							publicDao.getJdbcTemplate().execute(sql5);
						}
					}
				}
			}
		}
		return "";
	}

}
