package com.tansun.eam2.jygdzc.vo;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 经营资产查询VO
 * 
 * @author lihuan
 * 
 */
public class JyzcXxVO extends JyzcXx {

	private static final long serialVersionUID = 3010709354732300012L;
	//卡片编号
	private String cardcode;
	//卡片名称
	private String zcname;
	//卡片类型
	private String parentid;
	// 管理部门
	private String glbm;
	// 使用部门
	private String sybm;
	// 当前租赁状态
	private String zlzt;
	// 主卡片
	private Cardinfo cardinfo;
	// 资产下挂接的卡片信息
	private List<Cardinfo> cardinfoList;
	//已租面积
	private Double yzmj;
	
	//一级委托管理机构
	private String yjwtgljgName;
	//二级委托管理机构
	private String ejwtgljgName;
	
	public String getYjwtgljgName() {
		return yjwtgljgName;
	}

	public void setYjwtgljgName(String yjwtgljgName) {
		this.yjwtgljgName = yjwtgljgName;
	}

	public String getEjwtgljgName() {
		return ejwtgljgName;
	}

	public void setEjwtgljgName(String ejwtgljgName) {
		this.ejwtgljgName = ejwtgljgName;
	}

	// get方法
	public String getSybm() {
		return sybm;
	}

	public String getZlzt() {
		return zlzt;
	}

	public String getGlbm() {
		return glbm;
	}

	public Cardinfo getCardinfo() {
		return cardinfo;
	}

	public List<Cardinfo> getCardinfoList() {
		return cardinfoList;
	}

	// set 方法
	// 设置管理部门
	@SuppressWarnings("unchecked")
	public void setGlbm(PublicDao publicDao, String glbm) {
		// 根据管理部门编号在individualtree中查询管理部门名称
		String hql = "select tree from Individualtree tree where tree.nodevalue = ?";
		List params = new ArrayList();
		params.add(glbm);
		List temp =  publicDao.find(hql,params);
		if (temp != null) {
			this.glbm = ((Individualtree) temp.get(0)).getCategoryname();
		} else {
			this.glbm = null;
		}
	}

	// 设置使用部门
	@SuppressWarnings("unchecked")
	public void setSybm(PublicDao publicDao, String sybm) {
		// 根据管理部门编号在individualtree中查询管理部门名称
		String hql = "select tree from Individualtree tree where tree.nodevalue = ?";
		List params = new ArrayList();
		params.add(sybm);
		List<Individualtree> temp = (List<Individualtree>) publicDao.find(hql,
				params);
		if (temp != null) {
			this.sybm = temp.get(0).getCategoryname();
		} else {
			this.sybm = null;
		}
	}

	// 设置租赁状态
	public void setZlzt(PublicDao publicDao) {
		/* 查询合同，根据租赁合同的合同开始日期进行判断该资产当前的租赁状态 */
		// 租赁合同key 2,合同状态为 执行中 0
		String hql = "from JjzcHtZlwg o where o.CHtlx = '2' and o.CHtzt ='1' and o.zcid = ?";
		List params = new ArrayList();
		params.add(this.getId());
		List<JjzcHtZlwg> ht = (List<JjzcHtZlwg>) publicDao.find(hql, params);
//		Object[] params = new Object[] { this.getId() };
//		JjzcHtZlwg ht = (JjzcHtZlwg) publicDao.findSingleResult(hql, params);
		if (ht == null) {
			this.zlzt = "空闲";
		} else { 
			String zt = "再租";
//			for(int i=0;i<ht.size();i++){
//				
//				JjzcHtZlwg zlwg = ht.get(i);
//				if (zlwg.getHtdqrq().after(new Date())) {
//				// 合同结束日期和当前日期进行判断
//					zt = "在租";
//				} 
//			}
			this.zlzt = zt;
		}
	}

	public void copyProperties(JyzcXx jyzcXx) {
		try {
			BeanUtils.copyProperties(this, jyzcXx);
			this.setId(null);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void setCardinfoList(PublicDao publicDao) {
		// 根据资产id查询出所有的卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0'";
		Object[] params = new Object[] { this.getId() };
		this.cardinfoList = (List<Cardinfo>) publicDao.find(hql, params);
	}

	
	@SuppressWarnings("unchecked")
	public void setCardinfo(PublicDao publicDao) {
		// 查询主卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		Object[] params = new Object[] { this.getId() };
		List<CardAssetHistory> tempList = (List<CardAssetHistory>) publicDao.find(hql, params);
		CardAssetHistory history = null;
		if (tempList != null && tempList.size()>0) {
			history = tempList.get(0);
		} 
		if(history != null){
			this.cardinfo = publicDao.findById(Cardinfo.class, Long.valueOf(history.getKpId()));
		}
	}
	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public void setSybm(String sybm) {
		this.sybm = sybm;
	}

	public void setZlzt(String zlzt) {
		this.zlzt = zlzt;
	}

	public void setCardinfo(Cardinfo cardinfo) {
		this.cardinfo = cardinfo;
	}

	public void setCardinfoList(List<Cardinfo> cardinfoList) {
		this.cardinfoList = cardinfoList;
	}

	public String getCardcode() {
		return cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public Double getYzmj() {
		return yzmj;
	}

	public void setYzmj(PublicDao publicDao) {
		Date date = new Date();
		Double yzmj = new Double(0);
		List params = new ArrayList();
		params.add(this.getId());
		params.add(date);
		params.add(date);
		String preparedHQL = "from JjzcHtZlwg t where t.zcid =? and t.CHtzt='0' and t.htqsrq< ? and t.htdqrq > ? order by t.id";
		List<JjzcHtZlwg> jjzcHtZlwgList = (List<JjzcHtZlwg>) publicDao.find(preparedHQL, params);
		
		for(int i=0;i<jjzcHtZlwgList.size();i++){
			JjzcHtZlwg jjzcHtZlwg = jjzcHtZlwgList.get(i);
			yzmj += jjzcHtZlwg.getCzsl(); 
			
		}
 		this.yzmj = yzmj;
	}
}
