package com.tansun.eam2.common.ucc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.bo.PTFunctionGroupBO;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class MenuTreeUccImpl implements IMenuTreeUcc {
	
	@Autowired
	private PublicDao publicDao;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	
	/**
	 * 根据parent节点查找子节点
	 * @param sid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PTFunctionGroupBO> getFuncGroup(String perid, String parid) {
		String sql = "From PTFunctionGroupBO t where t.parId=? order by t.sortOrder ASC ";
		List<String> list = new ArrayList<String>();
		list.add(parid);
		List<PTFunctionGroupBO> result = (List<PTFunctionGroupBO>)publicDao.find(sql, list);
		return result;
	}
	
	/**
	 * 根据parent节点查找子节点
	 * @param sid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getSonItem(String perid, String parid) {
		// 根据当前登录人员的角色和节点父id查找相对应的可以显示的节点
		String sqlStr = "select distinct fg.* " +
						" from p_t_function_group fg," +
						" 	p_t_role_l_func_group rfg," +
						" 	p_t_user_l_role ur,  " +
						"	p_t_role r" +
						// " where fg.function_id = rfg.func_group_id " +
						" where fg.tid = rfg.func_group_id " +
						"	and rfg.role_id = ur.role_id" +
						"	and ur.role_id = r.tid " +
						"	and fg.par_id = ? " +
						"	and (r.role_desc = '功能树角色'" +
						"		or r.role_desc = '系统管理员')" +
						"	and ur.user_id = ? order by fg.sort_order asc";
		List<String> list = new ArrayList<String>();
		list.add(parid);
		list.add(perid);
		List result = publicDao.queryForList(sqlStr, list);
		return result;
	}
}
