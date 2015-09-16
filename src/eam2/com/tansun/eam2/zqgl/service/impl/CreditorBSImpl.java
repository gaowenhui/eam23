package com.tansun.eam2.zqgl.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.DebtWorklog;
import com.tansun.eam2.zqgl.service.ICreditorBS;
import com.tansun.eam2.zqgl.vo.CreditorQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
@Repository
public class CreditorBSImpl implements ICreditorBS {
	@Autowired
	private PublicDao publicDao;
	
	
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	@SuppressWarnings("unchecked")
	public List<DebtInfo> getDebtListByStid(String stId) {
		//List<DebtInfo> debtList = (List<DebtInfo>)publicDao.find("from DebtInfo o where (o.czzt!='2' or o.czzt is null) and o.zqrid='10775' and o.zwrid='" + stId + "'");
		List<DebtInfo> debtList = (List<DebtInfo>)publicDao.find("from DebtInfo o where o.zqrid='10775' and o.zwrid='" + stId + "'");
		if(debtList == null)return new ArrayList<DebtInfo>();
		return debtList;
	}
	
	  /**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	  private String checkEmpty(String bh) {
			String str = "";
			if(bh==null){
				str = "";
			}else if("".equals(bh)||"null".equals(bh)||bh.trim().length()==0){
				str = "";
			}else{
				str = String.valueOf(bh);
			}
			return str;
		}
	/**
	 *债权信息维护列表
	 * @param cqVO
	 * @return
	 */
	public List<DebtInfo> debtList(Paginator paginator,CreditorQueryVO cqVO){
		List list = new ArrayList();
		
		String  hql = "from DebtInfo o where (o.zqrid='10775' and (o.zwrbh like '%" + checkEmpty(cqVO.getZwrid())+"%' or '"+ checkEmpty(cqVO.getZwrid())+"' is null)"   //债务人bh
						      + " and (o.bzbm = '"+checkEmpty(cqVO.getBz())+"' or '"+ checkEmpty(cqVO.getBz())+"' is null)"					//币种
							  + " and (o.fshx ='"+checkEmpty(cqVO.getFshx())+"' or '"+checkEmpty(cqVO.getFshx())+"' is null)"						//是否核销
							  + " and (o.zwrmc like '%"+checkEmpty(cqVO.getZwrmc())+"%' or '"+checkEmpty(cqVO.getZwrmc())+"' is null)"			//债务人名称
							  + " and (o.grzye >='"+checkEmpty(cqVO.getZqyedy())+"' or '"+checkEmpty(cqVO.getZqyedy())+"' is null)"				//债权余额
							  + " and (o.grzye <= '"+checkEmpty(cqVO.getZqyexy())+"' or '" + checkEmpty(cqVO.getZqyexy())+"' is null)"			//债权余额
							  + " and (to_char(o.htzzrq,'YYYY-mm-DD') >='"+checkEmpty(cqVO.getHtdqBegin())+"' or '"+checkEmpty(cqVO.getHtdqBegin())+"' is null)"			//到期时间
							  + " and (to_char(o.htzzrq,'YYYY-mm-DD') <= '"+checkEmpty(cqVO.getHtdqEnd())+"' or '" + checkEmpty(cqVO.getHtdqEnd())+"' is null)"		//到期时间
							  + " and (o.djzrje >='"+checkEmpty(cqVO.getDjzrfydy())+"' or '"+checkEmpty(cqVO.getDjzrfydy())+"' is null)"				//转让对价 
							  + " and (o.djzrje <= '"+checkEmpty(cqVO.getDjzrfyxy())+"' or '" + checkEmpty(cqVO.getDjzrfyxy())+"' is null)"		//转让对价 
							  + " and (o.dbhtje >='"+checkEmpty(cqVO.getDbhtjedy())+"' or '"+checkEmpty(cqVO.getDbhtjedy())+"' is null)"			//担保合同金额
							  + " and (o.dbhtje <= '"+checkEmpty(cqVO.getDbhtjexy())+"' or '" +checkEmpty(cqVO.getDbhtjexy())+"' is null)"		//担保合同金额
							  + " and (o.shengfen ='"+checkEmpty(cqVO.getSf())+"' or '"+checkEmpty(cqVO.getSf())+"' is null)"							//省份
							  + " and (o.zqzl ='"+checkEmpty(cqVO.getZqzl())+"' or '"+checkEmpty(cqVO.getZqzl())+"' is null)) and o.sfbc='1' ";						//债权种类
//		StringBuffer buffer = new StringBuffer();
//		String hql="from DebtInfo o   where 1=1 ";
////		if(StringUtils.isNotEmpty(cqVO.getBz())){
////			buffer.append(" and  o.bzmc = ? ");
////			list.add(o);
////		}
//		if(StringUtils.isNotEmpty(cqVO.getZqzl())){
//			buffer.append(" and  o.zqzl = ? ");
//			list.add(cqVO.getZqzl());
//		}
		hql += (" order by o.id");
//		System.out.println("-------------"+hql);
		return (List<DebtInfo>)publicDao.queryByHQLWithPaginator(hql,list, paginator).getResults();
	}
	
	
	private String getBzmc(String key){
		String returnValue = "";
		Map<String , String > map = new HashMap<String, String>();
		//0:'人民币',1:'美元',2:'港元',3:'欧元'
		map.put("0", "人民币");
		map.put("1", "美元");
		map.put("2", "港元");
		map.put("3", "欧元");
  
		return map.get(key);
		
	}
	
	
	
	/**
	 * 插入一条DebtInfo
	 * @param st
	 */
	public void newDebtInfo(DebtInfo di){
		publicDao.save(di);
	}
	
	/**
	 * 保存一条DebtInfo
	 * @param st
	 */
	public void saveDebtInfo(DebtInfo di){
		//先找到该表的所有
		DebtInfo o = publicDao.findById(DebtInfo.class,di.getId());
		try {
			BeanUtils.copyProperties(o, di);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		publicDao.update(o);
	}
	
	/**
	 * 根据id查找DebtInfo
	 * @param id
	 * @return
	 */
	public DebtInfo getDebtInfo(String id){
		String[]params = new String[1];
		params[0] = id;
		return (DebtInfo)publicDao.findSingleResult("from DebtInfo where id=?", params);
	}
	
	/**
	 * 删除DebtInfo
	 * @param id
	 */
	public void deleteDebtInfo(String[] id){
		for(int i = 0;i<id.length;i++){
			if(StringUtils.isNotEmpty(id[i])){
				DebtInfo di = (DebtInfo)publicDao.findSingleResult("from DebtInfo where id=?", new Object[] {new String(id[i])});
				publicDao.delete(di);
			}
		}
	}
	
	/**
	 * 根据zqid 查找办理依据 列表
	 * @param id
	 * @return
	 */
	public List<DebtWorklog> getDebtWorklogList(String id) {
		List<DebtWorklog> debtList = (List<DebtWorklog>)publicDao.find("from DebtWorklog o where o.zqid='" + id + "'" + " and o.sfbc = '1' ");
		if(debtList == null)return new ArrayList<DebtWorklog>();
		return debtList;
	}
	
	
	/**
	 * 插入一条DebtWorklog
	 * @param st
	 */
	public void newDebtWorklog(DebtWorklog dk){
		publicDao.save(dk);
	}
	
	/**
	 * 保存一条DebtWorklog
	 * @param st
	 */
	public void saveDebtWorklog(DebtWorklog dk){
		publicDao.update(dk);
	}
	
	/**
	 * 根据id查找DebtWorklog
	 * @param id
	 * @return
	 */
	public DebtWorklog getDebtWorklogInfo(String id){
		String[]params = new String[1];
		params[0] = id;
		return (DebtWorklog)publicDao.findSingleResult("from DebtWorklog where id=?", params);
	}
	
//-------------------日志更新-----------------------
	
	
//	public void saveSSchangeInfo(DebtInfo debtInfo_old,
//			DebtInfo debtInfo_new,String opType) {
//		Map<String, Object> oldMap = null;
//		Map<String, Object> newMap = null;
//	
//		String strObjcode=debtInfo_new.getId();
//
//		try {
//			oldMap = org.apache.commons.beanutils.BeanUtils
//					.describe(debtInfo_old);
//			newMap = org.apache.commons.beanutils.BeanUtils
//					.describe(debtInfo_new);
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		} catch (NoSuchMethodException e) {
//			e.printStackTrace();
//		}
//		Set<String> newSet = newMap.keySet();
//		Iterator ite = newSet.iterator();
//		while (ite.hasNext()) {
//			String property = (String) ite.next();
//			if ("id".equals(property) || "class".equals(property)) {
//				continue;
//			}
//			Object valueNew = newMap.get(property);
//			Object valueOld = oldMap.get(property);
//			if (valueNew == null && valueOld == null) {
//				continue;
//			} else if (valueNew != null && valueNew.equals(valueOld)) {
//				continue;
//			} else if ((valueNew == null && valueOld != null)
//					|| (valueNew != null && !valueNew.equals(valueOld))) {
//				String strUserName=UserThreadLocal.get().getUsername();
//				Long strUserID=UserThreadLocal.get().getUserTid();
//				AssetChangeLog assetChangeLog = new AssetChangeLog();
//				assetChangeLog.setPersonId(strUserID.toString());
//				assetChangeLog.setPersonName(strUserName);
//				assetChangeLog.setUpdatedate(new Date());
//				assetChangeLog.setUpdatetype(opType);//新增、修改
//				assetChangeLog.setUpobjId(debtInfo_new.getId());//被修改对象的主键
//				assetChangeLog.setUpobjcode(strObjcode);
//				assetChangeLog.setUpsheet("中国建投债权信息");//修改的页签
//
//				assetChangeLog.setUpproper(getPropNameByPropId_pro_start(property));//修改属性名称
//				
//				assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
//				assetChangeLog.setSubsys("4");
//				if (valueOld == null) {// 改变前值
//					assetChangeLog.setUpbefovalue(null);
//				} else {
//					assetChangeLog.setUpbefovalue(valueOld.toString());
//				}
//				if (valueNew != null) {
//					publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
//				}
//			}
//		}
//	}
	
	/**
	 * 年初
	 * @param proId
	 * @return
	 */
	  public String getPropNameByPropId_pro_start(String proId){
			HashMap hashMap=new HashMap();
			hashMap.put("id","id,UUID");
			hashMap.put("shengfen","省份");
			hashMap.put("htbh","合同/档案编号");
			hashMap.put("zwrmc","债务人名称");
			hashMap.put("bzbm","合同金额 币种");
			hashMap.put("htje","合同金额 原币金额(元)");
			hashMap.put("htqsrq","合同起始日期");
			hashMap.put("grzye","购入债余额(元)");
			hashMap.put("htzzrq","合同终止日期");
			hashMap.put("bj","本金");
			hashMap.put("lx","利息");
			hashMap.put("sfss","是否诉讼");
			hashMap.put("hj","合计");
			hashMap.put("ssfy","诉讼费用");
			hashMap.put("sfysxflws","是否有生效法律文书");
			hashMap.put("dblxmc","担保类型");
			hashMap.put("zhtsfss","主合同是否胜诉");
			hashMap.put("dbhtbh","担保合同编号");
			hashMap.put("dbhtsfss","担保合同是否胜诉");
			
			hashMap.put("dbhtje","担保合同金额");
			hashMap.put("dbwzlbmc","抵押物质类别");
			hashMap.put("fshx","是否核销");
			hashMap.put("bzrmc","保证人名称");
			hashMap.put("djzr","是否转让");
			hashMap.put("zqzl","债权种类");
			hashMap.put("djzrje","转让对价金额");
			
			hashMap.put("beizhu","备注");
			return (String) hashMap.get(proId);
		}
	
	  
	  
	  
	  
	  
	  
	  
	  
	  public void saveSSchangePro(DebtInfo debtInfo_old, DebtInfo debtInfo_new,String opType,String subSys){
			
			
			String strObjcode=debtInfo_new.getId();
			if("修改".equals(opType)){
				Map<String, Object> oldMap = null;
				Map<String, Object> newMap = null;
				try {
					oldMap = org.apache.commons.beanutils.BeanUtils
							.describe(debtInfo_old);
					newMap = org.apache.commons.beanutils.BeanUtils
							.describe(debtInfo_new);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				}
				Set<String> newSet = newMap.keySet();
				Iterator ite = newSet.iterator();
				while (ite.hasNext()) {
					String property = (String) ite.next();
					if ("id".equals(property) || "class".equals(property)) {
						continue;
					}
					Object valueNew = newMap.get(property);
					Object valueOld = oldMap.get(property);
					if (valueNew == null && valueOld == null) {
						continue;
					} else 	if (valueNew != null && valueNew.equals(valueOld)) {
						continue;
					}
					else if ((valueNew == null && valueOld != null)
							|| (valueNew != null && !valueNew.equals(valueOld))) {
						if("".equals(valueNew)&&valueOld==null){
							continue;
						}
						//合同起始日期
						if("htqsrq".equals(property)){
							if(debtInfo_new.getHtqsrq() != null){
								valueNew = DateUtils.formatDate(debtInfo_new.getHtqsrq());
							}
							if(debtInfo_old.getHtqsrq() != null){
								valueOld = DateUtils.formatDate(debtInfo_old.getHtqsrq());
							}
						}else
						//合同终止日期
						if("htzzrq".equals(property)){
							if(debtInfo_new.getHtzzrq() != null){
								valueNew = DateUtils.formatDate(debtInfo_new.getHtzzrq());
							}
							if(debtInfo_old.getHtzzrq() != null){
								valueOld = DateUtils.formatDate(debtInfo_old.getHtzzrq());
							}
						}
						if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
							continue;
						}
						String strUserName=UserThreadLocal.get().getUsername();
						Long strUserID=UserThreadLocal.get().getUserTid();
						AssetChangeLog assetChangeLog = new AssetChangeLog();
						assetChangeLog.setPersonId(strUserID.toString());
						assetChangeLog.setPersonName(strUserName);
						assetChangeLog.setUpdatedate(new Date());
						assetChangeLog.setUpdatetype(opType);//新增、修改
						if(GlobalVariable.ENTITY_SUBSYSTEM.equals(subSys)){
							assetChangeLog.setUpsheet("债权信息");//修改的页签
							assetChangeLog.setUpobjId(debtInfo_old.getZqrid());//被修改对象的主键
						}else if(GlobalVariable.DEBT_SUBSYSTEM.equals(subSys)){
							assetChangeLog.setUpobjId(debtInfo_old.getId());//被修改对象的主键
							assetChangeLog.setUpsheet("中国建投债权信息");//修改的页签
							
						}
						assetChangeLog.setUpobjcode(strObjcode);
						assetChangeLog.setUpproper(getPropNameByPropId_pro_start(property));//修改属性名称
						assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
						assetChangeLog.setSubsys(subSys);
						if (valueOld == null) {// 改变前值
							assetChangeLog.setUpbefovalue(null);
						} else {
							assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
						}
						if (valueNew != null) {
							publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
						}
					}
				}
			}else if("新增".equals(opType)){
				String strUserName=UserThreadLocal.get().getUsername();
				Long strUserID=UserThreadLocal.get().getUserTid();
				AssetChangeLog assetChangeLog = new AssetChangeLog();
				assetChangeLog.setPersonId(strUserID.toString());
				assetChangeLog.setPersonName(strUserName);
				assetChangeLog.setUpdatedate(new Date());
				assetChangeLog.setUpdatetype("新增");//新增、修改
//				assetChangeLog.setUpobjId(debtInfo_new.getId());//被修改对象的主键
//				assetChangeLog.setUpsheet("中国建投债权信息");//修改的页签
//				assetChangeLog.setUpproper("新增中国建投债权信息");//修改属性名称
				if(GlobalVariable.ENTITY_SUBSYSTEM.equals(subSys)){
					assetChangeLog.setUpsheet("债权信息");//修改的页签
					assetChangeLog.setUpobjId(debtInfo_new.getZqrid());//被修改对象的主键
				}else if(GlobalVariable.DEBT_SUBSYSTEM.equals(subSys)){
					assetChangeLog.setUpobjId(debtInfo_new.getZwrid());//被修改对象的主键
					assetChangeLog.setUpsheet("中国建投债权信息");//修改的页签
					
				}
				assetChangeLog.setUpaftervalue("新增中国建投债权信息");//修改后值
				assetChangeLog.setSubsys(subSys);
				publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
			}
		}

	@SuppressWarnings("unchecked")
	public List<DebtInfo> selectDabtList(String ids) {
		return (List<DebtInfo>)publicDao.find("from DebtInfo d where d.id in (" + ids + ")");
	}
	  
}
