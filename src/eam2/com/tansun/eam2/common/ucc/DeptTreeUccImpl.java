package com.tansun.eam2.common.ucc;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.EAMDept;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserLRoleBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserLDeptBO;

@Service
public class DeptTreeUccImpl implements IDeptTreeUcc {
	
	@Autowired
	private PublicDao publicDao;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	@SuppressWarnings("unchecked")
	public List<EAMDept> getEAMDept(Long id, Long parid) {
		boolean hasId = true;
		hasId = (id != null);
		String sql = "From EAMDept t where " + (hasId ? "t.tid=? and " : "") + " t.dept.id=?  and t.delFlagCd='002002' order by t.sortOrder ASC ";
		Long[] params = hasId ? new Long[]{id, parid} : new Long[]{parid};
		List<EAMDept> result = (List<EAMDept>)publicDao.find(sql, params);
		return result;
	}

	/**
	 * 查找当前部门的子部门
	 */
	@SuppressWarnings("unchecked")
	public List getEAM2Dept(String parid) {
		String hsql = "";
		if("10775".equals(parid)){
			hsql = " select distinct pardept.TID deptid, pardept.DEPT_NAME deptname, pardept.sort_order " +
			" from p_t_dept pardept,p_t_dept chidept, " +
			" p_t_user_l_dept userdept, " +
			" p_t_user_l_role urole " +
			" where (chidept.TID = userdept.DEPT_ID " +
			" and chidept.par_id = pardept.TID " +
			" and urole.USER_ID = userdept.user_id " +
			" and pardept.PAR_ID = " + parid +
			" and urole.ROLE_ID = 107) or " +
			"(pardept.TID = userdept.DEPT_ID and " +
			"chidept.par_id = pardept.TID and urole.USER_ID = " +
			"userdept.user_id and pardept.PAR_ID = 10775 " +
			"and urole.ROLE_ID = 107) or "+
			" (pardept.TID = userdept.DEPT_ID " +
			" and urole.USER_ID = userdept.user_id " +
			" and pardept.PAR_ID = " + parid +
			" and urole.ROLE_ID = 107 )" +
			" order by pardept.sort_order";
		}else if("113".equals(parid)){
			hsql = " select distinct pardept.TID deptid, pardept.DEPT_NAME deptname, pardept.sort_order " +
			" from p_t_dept pardept,p_t_dept chidept, " +
			" p_t_user_l_dept userdept, " +
			" p_t_user_l_role urole " +
		//------------------修改后建银实业会签树---------------------------//	
		//	" where urole.role_id = 107"+
		//	 " and urole.user_id = userdept.user_id"+
		//	  " and userdept.dept_id = chidept.tid"+
		//	  " and chidept.par_id = pardept.tid"+
		//	  " and pardept.tid = '113'";
		//-----------------修改前建银实业会签树----------------------//	
			" where (chidept.TID = userdept.DEPT_ID " +
			" and chidept.par_id = pardept.TID " +
			" and urole.USER_ID = userdept.user_id " +
			" and pardept.PAR_ID = " + parid +
			" and urole.ROLE_ID = 107) or " +
			//"(pardept.TID = userdept.DEPT_ID and " +
			//"chidept.par_id = pardept.TID and urole.USER_ID = " +
			//"userdept.user_id and pardept.PAR_ID = 10775 " +
			//"and urole.ROLE_ID = 107) or"+ 
			" (pardept.TID = userdept.DEPT_ID " +
			" and urole.USER_ID = userdept.user_id " +
			" and pardept.PAR_ID = " + parid +
			" and urole.ROLE_ID = 107 )" +
			" order by pardept.sort_order";
		}else{
			// 会签部门
			hsql = " select distinct dept.TID deptid, dept.DEPT_NAME deptname, dept.sort_order " +
			" from p_t_dept dept, " +
			" p_t_user_l_dept userdept, " +
			" p_t_user_l_role urole " +
			" where dept.TID = userdept.DEPT_ID " +
			" and urole.USER_ID = userdept.user_id " +
			" and dept.PAR_ID = " + parid +
			" and urole.ROLE_ID = 107 " +
			" order by dept.sort_order";
		}
//		String hsql = "select distinct urole.role_id from p_t_dept deptparent, p_t_user_l_role urole, p_t_user_l_dept userdept,p_t_dept deptchild where deptchild.TID = userdept.DEPT_ID and urole.USER_ID = userdept.user_id and deptchild.par_id = deptparent.tid and deptparent.par_id = '"
//				+ parid + "' and urole.ROLE_ID = 107 ";
		List result = this.publicDao.queryForList(hsql, new ArrayList());

		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List getEAM2Dept(String parid, String option) {
		String hsql = null;
		if(StringUtils.equals("pgsc",option)){
			// 会签部门
			hsql = " select distinct dept.TID deptid, dept.DEPT_NAME deptname, dept.sort_order " +
			"	from p_t_dept        dept, " +
			"      p_t_user_l_dept userdept, " +
			"      p_t_user_l_role urole " +
			"  where dept.TID = userdept.DEPT_ID " +
			"      and urole.USER_ID = userdept.user_id " +
			"      and dept.TID = " + "11589" +
			"  order by dept.sort_order";
		}else{
			// 会签部门
			hsql = " select distinct dept.TID deptid, dept.DEPT_NAME deptname, dept.sort_order " +
			"	from p_t_dept        dept, " +
			"      p_t_user_l_dept userdept, " +
			"      p_t_user_l_role urole " +
			"  where dept.TID = userdept.DEPT_ID " +
			"      and urole.USER_ID = userdept.user_id " +
			"      and dept.PAR_ID = " + parid +
			"      and urole.ROLE_ID = 107 " +
			"  order by dept.sort_order";
		}
		List result = this.publicDao.queryForList(hsql, new ArrayList());
		
		return result;
	}

}
