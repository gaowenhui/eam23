package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.service.IKnowQueryBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 知识库查询
 * 
 * @author 陈煜霄
 * @date 2010-12-21
 */
@Service
public class KnowQueryBSImpl implements IKnowQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 组合xml文件
	 * 
	 * @param menus
	 * @return
	 */
	public String getKnowXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"0\">").append("\n");
		try{
		this.getZSBXMLCerter(sb, "0");
		}catch(Exception ex){
			System.out.print(ex.toString());
		}
		sb.append("</tree>").append("\n");
		System.out.print(sb.toString());
		return sb.toString();
	}

	/**
	 * 得到正式表中间部分的xml
	 * 
	 * @param sb
	 * @param menus
	 */
	public void getZSBXMLCerter(StringBuffer sb, String parid) {
		List menus = this.getKnowZSB(parid);
		Iterator iterator = menus.iterator();
		while (iterator.hasNext()) {
			Map map = new HashMap();
			map = (Map) iterator.next();
			System.out.print("====="+map.get("id"));
			// 判断如果有链接地址的话就是叶子结点，如果没有链接地址的话就继续查询子节点
			sb.append("<item text=\"" + map.get("value") + "\"");
			if (map.get("id") != null && map.get("id").toString().length() > 0) {
				sb.append(" id=\"" + map.get("id") + "\"");
			}
			sb.append(" >").append("\n");
			getZSBXMLCerter(sb, String.valueOf(map.get("id")));
			sb.append("</item>").append("\n");
		}
	}

	/**
	 * 得到知识库正式表
	 * 
	 * @param parid
	 * @return
	 */
	public List getKnowZSB(String parid) {
		String sqlStr = " select * from cz_sczsk p where p.pid = ? and scbz = '0' "
				+ "order by p.code asc ";
		List<String> list = new ArrayList<String>();
		list.add(parid);
		List result = publicDao.queryForList(sqlStr, list);
		return result;
	}

	/**
	 * 得到临时表并拼成xml文件
	 * 
	 * @return
	 */
	public String gotKnowLSBXML(String headId) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"0\">").append("\n");
		try {
			this.gotLSBXMLCerter(sb, "0", headId);
		} catch (Exception e) {
			System.out.println("aaaaaaaaaaaaaaaa_______" + e.getMessage());
		}
		sb.append("</tree>").append("\n");
		return sb.toString();
	}

	/**
	 * 得到临时表中间部分的xml
	 * 
	 * @param sb
	 * @param menus
	 */
	@SuppressWarnings("unchecked")
	public void gotLSBXMLCerter(StringBuffer sb, String parid, String headId) {
		List menus = this.searchKnowLSB(parid, headId);
		Iterator iterator = menus.iterator();
		int i = 0;
		while (iterator.hasNext()) {
			i++;
			Map map = new HashMap();
			map = (Map) iterator.next();
			// 判断如果有链接地址的话就是叶子结点，如果没有链接地址的话就继续查询子节点
			sb.append("<item text=\"" + map.get("value") + "\"");
			if (map.get("zsk_id") != null
					&& map.get("zsk_id").toString().length() > 0) {
				sb.append(" id=\"" + map.get("zsk_id") + "\"");
			}
			sb.append(" >").append("\n");
			gotLSBXMLCerter(sb, String.valueOf(map.get("zsk_id")), headId);
			sb.append("</item>").append("\n");
		}
	}

	/**
	 * 得到知识库临时表
	 * 
	 * @param parid
	 * @return
	 */
	public List searchKnowLSB(String parid, String headId) {
		String sqlStr = " select * from cz_sczsk_lsb p where  p.pid = ? and cld_id = ? and scbz = '0'"
				+ " order by p.code asc";
		List<String> list = new ArrayList<String>();
		list.add(parid);
		list.add(headId);
		List result = publicDao.queryForList(sqlStr, list);
		return result;
	}

	/**
	 * 将正式表的数据导入临时表
	 */
	@SuppressWarnings("unchecked")
	public void addToLSB(String headId) {
		String sqlStr = "select * from cz_sczsk ";
		List list = publicDao.queryForList(sqlStr, new ArrayList());
		for (int i = 0; i < list.size(); i++) {
			CzSczskLsb lsb = new CzSczskLsb();
			Map map = (Map) list.get(i);
			lsb.setCldId(headId);
			lsb.setPid(String.valueOf(map.get("pid")));
			lsb.setCode(String.valueOf(map.get("code")));
			lsb.setValue(String.valueOf(map.get("value")));
			lsb.setScbz(String.valueOf(map.get("scbz")));
			lsb.setZskId(String.valueOf(map.get("id")));
			publicDao.save(lsb);
		}
	}

	/**
	 * 判断LSB里是否有该字段
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean findLSBbyHeadId(String headId) {
		String sqlStr = "select * from cz_sczsk_lsb where cld_id = '" + headId
				+ "'";
		List list = publicDao.queryForList(sqlStr, new ArrayList());
		if (list.size() != 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 查询所有项目
	 * 
	 * @param headId
	 * @return
	 */
	public List queryXM(String headId) {
		String sqlStr = "from CzSczskLsb c where  c.cldId = '" + headId
				+ "' and c.pid = '0'";
		List list = publicDao.find(sqlStr, new ArrayList());
		return list;
	}

	/**
	 * 查询正式表中所有项目
	 * 
	 * @return
	 */
	public List queryXMZSB() {
		String sqlStr = "from CzSczsk c where c.pid = '0'";
		List list = publicDao.find(sqlStr, new ArrayList());
		return list;
	}

	/**
	 * 根据项目id查找要点内容临时表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXM(String pid, String headId) {
		Map<String, String> map = new HashMap<String, String>();
		String hql = "from CzSczskLsb c where c.cldId = '" + headId
				+ "' and c.pid = '" + pid + "' ";
		List flList = publicDao.find(hql);
		Iterator iterator = flList.iterator();
		while (iterator.hasNext()) {
			CzSczskLsb lsb = (CzSczskLsb) iterator.next();
			map.put(lsb.getZskId(), lsb.getValue());
		}
		return map;
	}

	/**
	 * 根据项目id查找要点内容正式表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXMZSB(String pid) {
		Map<String, String> map = new HashMap<String, String>();
		String hql = "from CzSczsk c where c.pid = '" + pid + "' ";
		List flList = publicDao.find(hql);
		Iterator iterator = flList.iterator();
		while (iterator.hasNext()) {
			CzSczsk zsb = (CzSczsk) iterator.next();
			map.put(zsb.getId(), zsb.getValue());
		}
		return map;
	}

	/**
	 * 通过条件查找正式表
	 * 
	 * @param xmid
	 * @param ydid
	 * @return
	 */
	public String getKnowXMLByChoose(String xmid, String ydid) {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version='1.0' encoding='UTF-8'?>").append("\n");
		sb.append("<tree id=\"0\">").append("\n");
		this.getZSBXMLCerterByChoose(sb, xmid, ydid);
		sb.append("</tree>").append("\n");
		return sb.toString();
	}

	/**
	 * 得到正式表中间部分的xml
	 * 
	 * @param sb
	 * @param menus
	 */
	public void getZSBXMLCerterByChoose(StringBuffer sb, String xmid,
			String ydid) {
		List menus = this.getKnowZSBByChoose(xmid, ydid);
		Iterator iterator = menus.iterator();
		while (iterator.hasNext()) {
			Map map = new HashMap();
			map = (Map) iterator.next();
			// 判断如果有链接地址的话就是叶子结点，如果没有链接地址的话就继续查询子节点
			sb.append("<item text=\"" + map.get("value") + "\"");
			if (map.get("id") != null && map.get("id").toString().length() > 0) {
				sb.append(" id=\"" + map.get("id") + "\"");
			}
			sb.append(" >").append("\n");
			getZSBXMLCerter(sb, String.valueOf(map.get("id")));
			sb.append("</item>").append("\n");
		}
	}

	/**
	 * 得到知识库正式表
	 * 
	 * @param parid
	 * @return
	 */
	public List getKnowZSBByChoose(String xmid, String ydid) {
		String sqlStr = " select * from cz_sczsk p where p.pid = ? and scbz = '0' "
				+ "order by p.code asc ";
		List<String> list = new ArrayList<String>();
		if (ydid != null && ydid != "" && ydid.length() != 0) {
			list.add(ydid);
		} else if (xmid != null && xmid != "" && xmid.length() != 0) {
			list.add(xmid);
		} else {
			list.add("0");
		}
		List result = publicDao.queryForList(sqlStr, list);
		return result;
	}

	/**
	 * 得到正在流程中的知识库数据
	 * 
	 * @return
	 */
	public String getKnowInFlow() {
		String sql = "select user_id,taskname from p_t_todo where proc_inst_name = 'zccz_evalknow' and statu = '1'";
		List list = publicDao.queryForList(sql, new ArrayList());
		String returnStr = "";
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			returnStr = String.valueOf(map.get("user_id")) + ","
					+ String.valueOf(map.get("taskname"));
		}
		return returnStr;
	}

	/*
	 * 
	 * 打印Excel
	 * 
	 */
	public List getKnowExeclByChoose(String pid) {
		String sqlStr = " select * from cz_sczsk p where p.pid = ? and scbz = '0' "
				+ "order by p.code asc ";
		List<String> list = new ArrayList<String>();
		list.add(pid);
		List result = publicDao.queryForList(sqlStr, list);
		return result;
	}

}
