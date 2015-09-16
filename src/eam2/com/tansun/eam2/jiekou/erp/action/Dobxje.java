package com.tansun.eam2.jiekou.erp.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;


public class Dobxje {
	public static void bxje(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl) {
		try {
			String upsql = "SELECT  BILLCODE ,SUM(MONEY) as money  FROM  ERP_BXMX   GROUP BY BILLCODE";
			List list8 = dao.queryForList(upsql, new ArrayList());
			if (list8.size() > 0) {
				for (int i = 0; i < list8.size(); i++) {
					Map Object = (Map) list8.get(i);
					String billcode = (String) Object.get("BILLCODE");
					BigDecimal money = new BigDecimal(String.valueOf( Object.get("money")));
//					String sql1 = " select t.MONEY_APPROVED from JYZC_HEAD t where t.xlid = '"+billcode+"' ";
//					List list9 = session.createSQLQuery(sql1).list();
//					Object Object1[] = (Object[]) list8.get(0);
//					BigDecimal money1 = new BigDecimal(0).add(money).add(((BigDecimal) Object1[0]));
					String sql = "UPDATE  JYZC_XX_LSB  T   SET T.SJHF=" + money + "  WHERE T.XLID='" + billcode + "'";
					dao.getJdbcTemplate().execute(sql);
					String sql1 = "select b.money_approved,a.bdocid from erp_fyspd a,jyzc_head b where  a.bdocid = b.xlid and  a.bdocid = '"+billcode+"'";
					List list9 = dao.queryForList(sql1, new ArrayList());
					if(list9 != null && list9.size() > 0){
						Map Object1 = (Map) list9.get(0);
						BigDecimal money1 = new BigDecimal((Object1.get("money_approved")==null?"0":String.valueOf(Object1.get("money_approved"))));
						String bdocid = (String) Object1.get("bdocid");
						BigDecimal money2 = new BigDecimal(0).add(money).add(money1);
						String sql2 = "UPDATE  JYZC_HEAD  T   SET T.MONEY_APPROVED=" 
							+ money2 + "  WHERE T.XLID='" + bdocid + "'";
						dao.getJdbcTemplate().execute(sql2);	
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
