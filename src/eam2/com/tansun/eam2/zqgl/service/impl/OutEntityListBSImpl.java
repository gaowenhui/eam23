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
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.eam2.zqgl.service.IOutEntityListBS;
import com.tansun.eam2.zqgl.vo.OutEntityVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
@Service
public class OutEntityListBSImpl implements IOutEntityListBS {
	@Autowired
	private PublicDao publicDao;
	
	
	
	public PublicDao getPublicDao() {
		return publicDao;
	}


	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	
	/**
	 * 外部实体维护列表
	 */
	public List<StJbxx> outEntityList(Paginator paginator,OutEntityVO oeVO,String stType) {
		List<String> params = new ArrayList<String>();
		StringBuffer hql = new StringBuffer();
		hql.append("from StJbxx o where 1=1 ");
		if(StringUtils.isNotEmpty(oeVO.getEntityNumber())){
			hql.append(" and o.zcbh like ? ");
			params.add("%" + oeVO.getEntityNumber() + "%");
		}
		if(StringUtils.isNotEmpty(oeVO.getEntityName())){
			hql.append(" and o.stzwmc like ? ");
			params.add("%" + oeVO.getEntityName() + "%");
		}
		if(StringUtils.isNotEmpty(oeVO.getCorporation())){
			hql.append(" and o.frdb like ? ");
			params.add("%" + oeVO.getCorporation() + "%");
		}
		if(StringUtils.isNotEmpty(stType)){
			hql.append(" and o.stlx=? ");
			params.add(stType);
		}
		hql .append(" order by o.id");
		return (List<StJbxx>)publicDao.queryByHQLWithPaginator(hql.toString(), params,paginator).getResults();
	}

	/**
	 * 插入一条实体信息
	 * @param st
	 */
	public void newEntity(StJbxx st){
		publicDao.save(st);
	}
	
	/**
	 * 保存一条实体信息
	 * @param st
	 */
	public void saveEntity(StJbxx st){
		StJbxx o = publicDao.findById(StJbxx.class, st.getId());
		try {
			BeanUtils.copyProperties(o, st);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		publicDao.update(o);
	}
	
	/**
	 * 根据id查找实体基本信息
	 * @param id
	 * @return
	 */
	public StJbxx getStJbxxInfo(String id){
		String[]params = new String[1];
		params[0] = id;
		return (StJbxx)publicDao.findSingleResult("from StJbxx where id=?", params);
	}
	
	/**
	 * 删除外部实体
	 * @param id
	 */
	public void deleteStJbxx(String[] id){
		for(int i = 0;i<id.length;i++){
			if(StringUtils.isNotEmpty(id[i])){
				StJbxx st = (StJbxx)publicDao.findSingleResult("from StJbxx where id=?", new Object[] {new String(id[i])});
				publicDao.delete(st);
			}
		}
	}
	
	
	/**
	 * 年初
	 * @param proId
	 * @return
	 */
	  public String getPropNameByPropId_pro_start(String proId){
			HashMap hashMap=new HashMap();
			hashMap.put("zcbh","实体编号");
			hashMap.put("stzwmc","实体名称");
			hashMap.put("frdb","法人代表");
			hashMap.put("bgdz","办公地址");
			hashMap.put("lxr","联系人");
			hashMap.put("stxz","实体性质");
			hashMap.put("lxdh","联系电话");
			hashMap.put("zczj","注册资金");
			hashMap.put("zjl","总经理");
			hashMap.put("jjxz","经济性质");
			hashMap.put("beizhu","备注");
			
			return (String) hashMap.get(proId);
		}
	
	  
	  public void saveSSchangePro(StJbxx stJbxx_old, StJbxx stJbxx_new,String opType){
			
			
			String strObjcode=stJbxx_new.getId();
			if("修改".equals(opType)){
				Map<String, Object> oldMap = null;
				Map<String, Object> newMap = null;
				try {
					oldMap = org.apache.commons.beanutils.BeanUtils
							.describe(stJbxx_old);
					newMap = org.apache.commons.beanutils.BeanUtils
							.describe(stJbxx_new);
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
						assetChangeLog.setUpobjId(stJbxx_new.getId());//被修改对象的主键
						assetChangeLog.setUpobjcode(strObjcode);
						assetChangeLog.setUpsheet("外部实体信息维护");//修改的页签
						assetChangeLog.setUpproper(getPropNameByPropId_pro_start(property));//修改属性名称
						assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
						assetChangeLog.setSubsys("5");
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
				assetChangeLog.setUpobjId(stJbxx_new.getId());//被修改对象的主键
				assetChangeLog.setUpobjcode(strObjcode);
				assetChangeLog.setUpsheet("外部实体信息维护");//修改的页签
				assetChangeLog.setUpproper("新增外部实体信息");//修改属性名称
				assetChangeLog.setUpaftervalue("新增外部实体信息");//修改后值
				assetChangeLog.setSubsys("5");
				publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
			}
		}
}
