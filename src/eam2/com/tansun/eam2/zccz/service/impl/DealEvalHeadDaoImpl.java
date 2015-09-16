package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//import com.sun.java_cup.internal.internal_error;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.zccz.service.IDealEvalHeadDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class DealEvalHeadDaoImpl extends CommonBSImpl implements IDealEvalHeadDao {

	private PublicDao publicDao;
	
	public String saveHead(CzPgscZskwhCld head) {
		return (String)publicDao.save(head);
	}

	public void updataHead(CzPgscZskwhCld head) {
		publicDao.update(head);
	}

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getMyScxmList(String cldId, String userId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.pid='0' and o.cldId='"+cldId+"' and o.tjyjr = '"+userId+"' and o.beizhu='0' and o.scbz = '0' order by o.tjrq asc");
	}
	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getScydList(String cldId, String xmId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.pid=? and o.cldId=? and o.scbz='0'", new String[]{xmId, cldId });
	}
	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getScyjList(String cldId, String ydId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.pid=? and o.cldId=? and o.scbz='0'", new String[]{ydId, cldId });
	}

	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getPgscListByCldId(String cldId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.cldId=? and o.scbz != '1'", new String[]{cldId });
	}

	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getPgscListByCldIdUserId(String cldId, String userId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.beizhu='0' and o.cldId=? and o.tjyjr=? and o.scbz!='1'", new String[]{cldId,userId });
	}
	
	@SuppressWarnings("unchecked")
	public List<CzPgscJl> getSubmitScxmList(String cldId) {
		return (List<CzPgscJl>)publicDao.find("from CzPgscJl o where o.pid='0' and o.beizhu='1' and o.cldId=? and o.scbz!='1'", new String[]{cldId });
	}
	
	public String findParentByChild(String childId){
		List list = publicDao.find("select pid from CzPgscJl o where o.id = '"+childId+"' and o.scbz!='1'");
		String pid = "";
		if(list.size()>0){
			pid = String.valueOf(list.get(0));
		}
		return pid;
	}
	
	public String findValueById(String id){
		List list = publicDao.find("select value from CzPgscJl o where o.id = '"+id+"'");
		String value = "";
		if(list.size()>0){
			value = String.valueOf(list.get(0));
		}
		return value;
	}
	
	public void updateValueById(String id,String value){
		String sql = "update cz_pgsc_jl set value = '"+value+"' where id = '"+id+"'";
		publicDao.getJdbcTemplate().execute(sql);
	}
	
	/**
	 * 得到当前登录人的角色，通过不同的角色来将不同的意见代为自己的意见
	 * 组长带普通人员的 部门领导带组长的
	 */
	@SuppressWarnings("unchecked")
	public String getUserLX(String cldId,String userId){
		//先查出该处理单中最大的批次号,后面带意见的时候需要这个批次号+1
		Double maxpc = 0d;
		String maxpcsql = "select tjpc from cz_pgsc_jl where cld_id = '"+cldId+"' order by tjpc desc";
		List listpc = publicDao.queryForList(maxpcsql, new ArrayList()); // 当前最大的批次
		if(listpc.size()>0){
			Map map = (Map)listpc.get(0);
			if(map.get("tjpc") != null)
				maxpc = Double.valueOf(String.valueOf(map.get("tjpc")));
		}
		// 以下代码是得到当前登录人的角色  判断是普通人员 评估审查组长 以及 部门领导
		String hqluser = "select t.username from p_t_user t where t.tid = '"+userId+"'";
		List listname = publicDao.queryForList(hqluser, new ArrayList());
		String userName = "";
		if(listname.size()>0){
			Map map = (Map)listname.get(0);
			userName = String.valueOf(map.get("username")); 
		}
		String sqluser = "select t.role_id from p_t_user_l_role t where t.user_id = "+userId;
		List listuser = publicDao.queryForList(sqluser, new ArrayList());
		String isbmld = ""; //是否部门领导
		String iszz = ""; // 是否组长
		for(int i=0;i<listuser.size();i++){
			Map map = (Map)listuser.get(i);
			if("96".equals(String.valueOf(map.get("role_id")))){
				isbmld = "yes";
			}else if("5300".equals(String.valueOf(map.get("role_id")))){
				iszz = "yes";
			}
		}
		if("yes".equals(iszz)){ //是评估审查组长
			String hql = "from CzPgscJl o where o.pid='0' and o.cldId='"+cldId+"' and o.tjyjr = '"+userId+"' and o.beizhu = '0' ";
			List listzz = publicDao.find(hql);
			if(listzz.size()>0){ // 如果有自己提交了的意见则返回null
				return null;
			}else{ // 如果没有自己提交的意见则组长把普通人员的意见带过来，部门领导把组长的意见带过来
				String sql = "select t.user_id from p_t_user_l_role t where t.role_id = 96 ";
				List list = publicDao.queryForList(sql, new ArrayList());
				String userIds = "";
				for(int i=0;i<list.size();i++){
					Map map = (Map)list.get(i);
					userIds = userIds + String.valueOf(map.get("user_id")) + ",";
				}
				userIds = userIds + userId;
				String sqlpc = "select max(tjpc) pc from cz_pgsc_jl l where l.tjyjr not in ("+userIds+") and" +
								" l.scbz = '0' and l.cld_id = '"+cldId+"' and l.pid='0' ";
				List listpc1 = publicDao.queryForList(sqlpc, new ArrayList()); // 普通人最后一次提交的批次
				int pc = 0;
				if(listpc1.size()>0){
					Map map = (Map)listpc1.get(0);
					if(map.get("pc") != null){
						pc = Integer.valueOf(String.valueOf(map.get("pc")));
					}
				}
				String hqlxm = "from CzPgscJl o where o.pid='0' and o.cldId='"+cldId+"' and o.tjyjr not in ("+userIds+") and o.scbz='0' and o.tjpc = "+pc+" order by o.tjrq asc";
				List<CzPgscJl> listxm = (List<CzPgscJl>)publicDao.find(hqlxm);
				for(int i=0;i<listxm.size();i++){
					CzPgscJl xm = listxm.get(i);
					CzPgscJl xm1 = new CzPgscJl();
					xm1.setBeizhu(xm.getBeizhu());
					xm1.setBgwtbz(xm.getBgwtbz());
					xm1.setCldId(xm.getCldId());
					xm1.setCode(xm.getCode());
					xm1.setCScjl(xm.getCScjl());
					xm1.setJlxz(xm.getJlxz());
					xm1.setOldId(xm.getOldId());
					xm1.setPid("0");
					xm1.setSfxxz(xm.getSfxxz());
					xm1.setValue(xm.getValue());
					xm1.setTjrq(new Date());
					xm1.setTjyjrxm(userName);
					xm1.setTjyjr(userId);
					xm1.setBeizhu("0");
					xm1.setScbz("0");
					xm1.setTjpc(maxpc+1);
					publicDao.save(xm1);
					String hqlyd = "from CzPgscJl o where o.pid = '"+xm.getId()+"' ";
					List<CzPgscJl> listyd = (List<CzPgscJl>)publicDao.find(hqlyd);
					if(listyd.size()>0){
						CzPgscJl yd = listyd.get(0);
						CzPgscJl yd1 = new CzPgscJl();
						yd1.setBeizhu(yd.getBeizhu());
						yd1.setBgwtbz(yd.getBgwtbz());
						yd1.setCldId(yd.getCldId());
						yd1.setCode(yd.getCode());
						yd1.setCScjl(yd.getCScjl());
						yd1.setJlxz(yd.getJlxz());
						yd1.setOldId(yd.getOldId());
						yd1.setPid(xm1.getId());
						yd1.setSfxxz(yd.getSfxxz());
						yd1.setValue(yd.getValue());
						yd1.setTjrq(new Date());
						yd1.setTjyjrxm(userName);
						yd1.setTjyjr(userId);
						yd1.setBeizhu("0");
						yd1.setScbz("0");
						yd1.setTjpc(maxpc+1);
						publicDao.save(yd1);
						String hqlyj = "from CzPgscJl o where o.pid = '"+yd.getId()+"' ";
						List<CzPgscJl> listyj = (List<CzPgscJl>)publicDao.find(hqlyj);
						if(listyj.size()>0){
							CzPgscJl yj = listyj.get(0);
							CzPgscJl yj1 = new CzPgscJl();
							yj1.setBeizhu(yj.getBeizhu());
							yj1.setBgwtbz(yj.getBgwtbz());
							yj1.setCldId(yj.getCldId());
							yj1.setCode(yj.getCode());
							yj1.setCScjl(yj.getCScjl());
							yj1.setJlxz(yj.getJlxz());
							yj1.setOldId(yj.getOldId());
							yj1.setPid(yd1.getId());
							yj1.setSfxxz(yj.getSfxxz());
							yj1.setValue(yj.getValue());
							yj1.setTjrq(new Date());
							yj1.setTjyjrxm(userName);
							yj1.setTjyjr(userId);
							yj1.setBeizhu("0");
							yj1.setScbz("0");
							yj1.setTjpc(maxpc+1);
							publicDao.save(yj1);
						}
					}
				}
				return null;
			}
		}else if("yes".equals(isbmld)){ // 是部门领导
			String hql = "from CzPgscJl o where o.pid='0' and o.cldId='"+cldId+"' and o.tjyjr = '"+userId+"' and o.beizhu = '0'";
			List listzz = publicDao.find(hql);
			if(listzz.size()>0){//如果已经有了自己提交的意见 则不把别人的意见带过来
				return null;
			}else{ // 如果没有自己提交的意见则组长把普通人员的意见带过来，部门领导把组长的意见带过来
				String sql = "select t.user_id from p_t_user_l_role t where t.role_id = 5300 ";
				List list = publicDao.queryForList(sql, new ArrayList());
				String userIds = userId+",";
				// 首先查出有哪些人是组长
				for(int i=0;i<list.size();i++){
					Map map = (Map)list.get(i);
					userIds = userIds + checkString(map.get("user_id")) + ",";
				}
				userIds = userIds.substring(0,userIds.length()-1);
				String sqlpc = "select max(tjpc) pc from cz_pgsc_jl l where l.pid = '0' and l.tjyjr in ("+userIds+") and" +
							" l.scbz = '0' and l.cld_id = '"+cldId+"'";
				List listpc1 = publicDao.queryForList(sqlpc, new ArrayList());
				int pc = 0;
				if(listpc1.size()>0){
					Map map = (Map)listpc1.get(0);
					if(map.get("pc") != null){
						pc = Integer.valueOf(String.valueOf(map.get("pc")));
					}
				}
				String hqlxm = "from CzPgscJl o where o.pid='0' and o.cldId='"+cldId+"' and o.tjyjr in ("+userIds+") and o.scbz='0' and o.tjpc = "+pc;
				List<CzPgscJl> listxm = (List<CzPgscJl>)publicDao.find(hqlxm);
				for(int i=0;i<listxm.size();i++){
					CzPgscJl xm = listxm.get(i);
					CzPgscJl xm1 = new CzPgscJl();
					xm1.setBeizhu(xm.getBeizhu());
					xm1.setBgwtbz(xm.getBgwtbz());
					xm1.setCldId(xm.getCldId());
					xm1.setCode(xm.getCode());
					xm1.setCScjl(xm.getCScjl());
					xm1.setJlxz(xm.getJlxz());
					xm1.setOldId(xm.getOldId());
					xm1.setPid("0");
					xm1.setSfxxz(xm.getSfxxz());
					xm1.setValue(xm.getValue());
					xm1.setTjrq(new Date());
					xm1.setTjyjrxm(userName);
					xm1.setTjyjr(userId);
					xm1.setBeizhu("0");
					xm1.setScbz("0");
					xm1.setTjpc(maxpc+1);
					publicDao.save(xm1);
					String hqlyd = "from CzPgscJl o where o.pid = '"+xm.getId()+"' ";
					List<CzPgscJl> listyd = (List<CzPgscJl>)publicDao.find(hqlyd);
					for(int j=0;j<listyd.size();j++){
						CzPgscJl yd = listyd.get(j);
						CzPgscJl yd1 = new CzPgscJl();
						yd1.setBeizhu(yd.getBeizhu());
						yd1.setBgwtbz(yd.getBgwtbz());
						yd1.setCldId(yd.getCldId());
						yd1.setCode(yd.getCode());
						yd1.setCScjl(yd.getCScjl());
						yd1.setJlxz(yd.getJlxz());
						yd1.setOldId(yd.getOldId());
						yd1.setPid(xm1.getId());
						yd1.setSfxxz(yd.getSfxxz());
						yd1.setValue(yd.getValue());
						yd1.setTjrq(new Date());
						yd1.setTjyjrxm(userName);
						yd1.setTjyjr(userId);
						yd1.setBeizhu("0");
						yd1.setScbz("0");
						yd1.setTjpc(maxpc+1);
						publicDao.save(yd1);
						String hqlyj = "from CzPgscJl o where o.pid = '"+yd.getId()+"' ";
						List<CzPgscJl> listyj = (List<CzPgscJl>)publicDao.find(hqlyj);
						for(int l=0;l<listyj.size();l++){
							CzPgscJl yj = listyj.get(l);
							CzPgscJl yj1 = new CzPgscJl();
							yj1.setBeizhu(yj.getBeizhu());
							yj1.setBgwtbz(yj.getBgwtbz());
							yj1.setCldId(yj.getCldId());
							yj1.setCode(yj.getCode());
							yj1.setCScjl(yj.getCScjl());
							yj1.setJlxz(yj.getJlxz());
							yj1.setOldId(yj.getOldId());
							yj1.setPid(yd1.getId());
							yj1.setSfxxz(yj.getSfxxz());
							yj1.setValue(yj.getValue());
							yj1.setTjrq(new Date());
							yj1.setTjyjrxm(userName);
							yj1.setTjyjr(userId);
							yj1.setBeizhu("0");
							yj1.setScbz("0");
							yj1.setTjpc(maxpc+1);
							publicDao.save(yj1);
						}
					}
				}
				return null;
			}
		}else{ //如果是普通人员（王继华）
			return null;
		}
	}
	
	/**
	 * 查找通过与否
	 */
	public String findRadioValue(String cldId, String userId) {
		String sql = "select t.c_scjl from cz_pgsc_jl t where t.cld_id = '"
				+ cldId + "' and t.tjyjr = '" + userId
				+ "' order by t.tjrq asc";
		List list = publicDao.queryForList(sql, new ArrayList());
		String radioValue = "";
		if(list.size()>0){
			Map map = (Map)list.get(0);
			radioValue = checkString(map.get("c_scjl"));
		}
		return radioValue;
	}

	/**
	 * 得到这次意见添加的批次
	 */
	public Double findTjpc(String cldId, String tjrId) {
		String sql = "select t.beizhu,t.tjpc,t.tjyjr from cz_pgsc_jl t where" +
				" t.cld_id = '"+cldId+"'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if(list.size()>0){//如果里面已经有了意见
			String sql1 = "select t.beizhu from cz_pgsc_jl t where t.cld_id = '"+cldId+"' " +
					"and t.tjyjr = '"+tjrId+"'";
			List list1 = publicDao.queryForList(sql1, new ArrayList());
			if(list1.size()>0){//如果有了自己提交的意见
				String sql11 = "select t.tjpc from cz_pgsc_jl t where t.beizhu = '0' and " +
						"t.tjyjr = '"+tjrId+"' and cld_id = '"+cldId+"' ";
				List list11 = publicDao.queryForList(sql11, new ArrayList());
				if(list11.size()>0){//自己有加入进表但是还没提交的意见，则提交批次等于自己之前的提交批次 
					Map map = (Map)list11.get(0);
					return Double.valueOf(checkString(map.get("tjpc")));
				}else{//有自己的意见 而且自己的意见已经全部提交 则提交批次等于当前表里面最大的提交批次+1
					String sql13 = "select t.tjpc from cz_pgsc_jl t order by t.tjrq desc";
					List list13 = publicDao.queryForList(sql13, new ArrayList());
					Double pc = 0d;
					if(list13.size()>0){
						Map map13 = (Map)list13.get(0);
						pc = Double.valueOf(checkString(map13.get("tjpc")));
					}
					return pc+1;
				}
			}else{// 如果没有自己的意见则自己此次提交的批次为最后一次提交时候的批次+1
				String sql12 = "select t.tjpc from cz_pgsc_jl t order by t.tjrq desc";
				List list12 = publicDao.queryForList(sql12, new ArrayList());
				Double pc = 0d;
				if(list12.size()>0){
					Map map12 = (Map)list12.get(0);
					pc = Double.valueOf(checkString(map12.get("tjpc")));
				}
				return pc+1;
			}
		}else{//如果还没提交任何意见 则批次为1
			return 1d;
		}
	}
	
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	
	public String getStIdByCldId(String cldId){
		List list = publicDao.find("select stid from CzPgxxLsb o where o.czpgscclid = '" + cldId + "'");
		String stid = "";
		if(list.size()>0){
			stid = String.valueOf(list.get(0));
		}
		return stid;
	}
}
