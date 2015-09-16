package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype2;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype3;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.service.DicAppAssetTypeBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class DicAppAssetTypeBSimpl implements DicAppAssetTypeBS {

	@Autowired
	PublicDao publicDao;
	DicAppAssettype1 dicAppAssettype1;
	DicAppAssettype2 dicAppAssettype2;
	DicAppAssettype3 dicAppAssettype3;
	
	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl() {
		Map<String, String> map = new HashMap<String, String>();
		List flList = publicDao.find("from DicAppAssettype1");
		Iterator iterator = flList.iterator();
		while (iterator.hasNext()) {
			dicAppAssettype1 = (DicAppAssettype1) iterator.next();
			map.put(dicAppAssettype1.getAssettype1Id(), dicAppAssettype1
					.getTypename());
		}
		return map;
	}

	/**
	 * 查找二级分类列表
	 */
	public Map<String, String> findEjFl(String yjFlBm) {
		Map<String, String> map = new HashMap<String, String>();

		if (yjFlBm != null && yjFlBm.length() > 0 && yjFlBm.compareTo("0") > 0) {
			List flList = publicDao
					.find("from DicAppAssettype2 where maincode = '" + yjFlBm
							+ "'");
			Iterator iterator = flList.iterator();
			while (iterator.hasNext()) {
				dicAppAssettype2 = (DicAppAssettype2) iterator.next();
				map.put(dicAppAssettype2.getAssettype2Id(), dicAppAssettype2
						.getTypename());
			}
		}

		return map;
	}

	/**
	 * 查找三级分类列表
	 */
	public Map<String, String> findSjFl(String ejFlBm) {
		Map<String, String> map = new HashMap<String, String>();
		if (ejFlBm != null && ejFlBm.length() > 0 && ejFlBm.compareTo("0") > 0) {
			List flList = publicDao
					.find("from DicAppAssettype3 where secondcode = '" + ejFlBm
							+ "'");
			Iterator iterator = flList.iterator();
			while (iterator.hasNext()) {
				dicAppAssettype3 = (DicAppAssettype3) iterator.next();
				map.put(dicAppAssettype3.getAssettype3Id(), dicAppAssettype3
						.getTypename());
			}
		}

		return map;
	}

	/**
	 * 根据一级分类编码查找一级分类对象
	 * @param yjflbm
	 * @return
	 */
	public DicAppAssettype1 findDic1(String yjflbm) {
		List params = new ArrayList();
		params.add(yjflbm);
		DicAppAssettype1 dic3 = (DicAppAssettype1) publicDao.findSingleResult(
				"from DicAppAssettype1 d where d.assettype1Id = ?", params);
		return dic3;
	}

	/**
	 * 根据二级分类编码查找二级分类对象
	 * @param ejflbm
	 */
	public DicAppAssettype2 findDic2(String ejflbm) {
		List params = new ArrayList();
		params.add(ejflbm);
		DicAppAssettype2 dic2 = (DicAppAssettype2) publicDao.findSingleResult(
				"from DicAppAssettype2 d where d.assettype2Id = ?", params);
		return dic2;
	}

	/**
	 * 根据三级分类编码查找三级分类对象
	 * @param sjflbm
	 */
	@SuppressWarnings("unchecked")
	public DicAppAssettype3 findDic3(String sjflbm) {
		List params = new ArrayList();
		params.add(sjflbm);
		DicAppAssettype3 dic3 = (DicAppAssettype3) publicDao.findSingleResult(
				"from DicAppAssettype3 d where d.assettype3Id = ?", params);
		return dic3;
	}
	
	/**
	 * 根据一级分类编码到一级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findYjFlMC(String yjflbm) {
		List params = new ArrayList();
		params.add(yjflbm);
		DicAppAssettype1 dic1  = (DicAppAssettype1)publicDao.findSingleResult("from DicAppAssettype1 d where d.assettype1Id = ?",params);
		return dic1.getTypename();
	}
	
	/**
	 * 根据二级分类编码到二级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findEjFlMC(String ejflbm) {
		List params = new ArrayList();
		params.add(ejflbm);
		DicAppAssettype2 dic1  = (DicAppAssettype2)publicDao.findSingleResult("from DicAppAssettype2 d where d.assettype2Id = ?",params);
		return dic1.getTypename();
	}
	
	/**
	 * 根据三级分类编码到三级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findSjFlMC(String sjflbm) {
		List params = new ArrayList();
		params.add(sjflbm);
		DicAppAssettype3 dic1  = (DicAppAssettype3)publicDao.findSingleResult("from DicAppAssettype3 d where d.assettype3Id = ?",params);
		return dic1.getTypename();
	}
	
	/**
	 * 根据一级分类编码到一级分类表中查询记录，然后删除
	 * @param yjflbm
	 */
	public void deleteyjFL(String yjflbm){
		publicDao.delete(findDic1(yjflbm));
	}
	
	/**
	 * 根据二级分类编码到二级分类表中查询记录，然后删除
	 * @param ejflbm
	 */
	public void deleteejFL(String ejflbm){
		publicDao.delete(findDic2(ejflbm));
	}
	
	/**
	 * 根据三级分类编码到资产表中查询该分类编码下是否含有物品，如果含有物品，则不能删除该分类
	 * 否则，可以删除该分类
	 * @param sjflbm
	 */
	public void deletesjFL(String sjflbm){
			publicDao.delete(findDic3(sjflbm));
	}
	
	/**
	 * 根据调用方法的不同类型实参分别更新不同类型的对象
	 * @param <T>
	 * @param FLType 
	 */
	public <T> void modifyFL(T FLType){
		publicDao.update(FLType);
	}
	
	/**
	 * 根据调用方法的不同类型实参分别保存不同类型的对象
	 * @param <T> 
	 * @param FLType 
	 */
	public <T> void saveFL(T FLType){
		publicDao.save(FLType);
	}
	
	/**
	 * 根据调用方法的传过来不同类型实参分别组成不同类型的字符串，到数据库中查询对象并返回
	 * @param <T>
	 * @param objectType
	 * @param Id
	 * @return
	 */
	public <T> T findSingleRecordById(T objectType, String Id) {
		String preparedHQL = "";
		if("DicAppAssettype1".equals(objectType.getClass().getSimpleName())){
			preparedHQL = "from DicAppAssettype1 t where t.assettype1Id = ?";
		}else if("DicAppAssettype2".equals(objectType.getClass().getSimpleName())){
			preparedHQL = "from DicAppAssettype2 t where t.assettype2Id = ?";
		}else if("DicAppAssettype3".equals(objectType.getClass().getSimpleName())){
			preparedHQL = "from DicAppAssettype3 t where t.assettype3Id = ?";
		}
		List list = new ArrayList();
		list.add(Id);
		return (T)publicDao.findSingleResult(preparedHQL, list);
	}
	
	/**
	 * 判断该三级编码下是否含有物品，如果含有三级分类编码，返回true，否则，返回false
	 * @param sjflbm
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean isCurrentFLHaveGoods(String sjflbm){
		if(Integer.valueOf(sjflbm) > 0){
			String hql = "from ZyZc zz where zz.sjflbm = " +  sjflbm;
			List<ZyZc> zyZcList = (List<ZyZc>)publicDao.find(hql);
			for(ZyZc zyZc : zyZcList){
				if(zyZc != null){
					return true;
				}
			}
		}
		
		return false;
	}
	
	/**
	 * 一级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String yjflDelCheck(String yjfl) {
		String ejsql = "select * from dic_app_assettype2 where maincode = '"+yjfl+"'";
		List ejList = publicDao.queryForList(ejsql, new ArrayList());
		String zcsql = "select yjflbm from zy_zc where yjflbm = '" + yjfl + "'";
		List zcList = publicDao.queryForList(zcsql, new ArrayList());
		String bodysql = "select yjflbm from zy_sbody where yjflbm = '"+yjfl+"'";
		List bodyList = publicDao.queryForList(bodysql, new ArrayList());
		if(ejList.size()>0 || zcList.size()>0 || bodyList.size()>0){
			return "no";
		}else{
			return "yes";
		}
	}
	
	/**
	 * 二级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String ejflDelCheck(String ejfl){
		String sjsql = "select * from dic_app_assettype3 where SECONDCODE = '"+ejfl+"'";
		List sjList = publicDao.queryForList(sjsql, new ArrayList());
		String zcsql = "select ejflbm from zy_zc where ejflbm = '" + ejfl + "'";
		List zcList = publicDao.queryForList(zcsql, new ArrayList());
		String bodysql = "select ejflbm from zy_sbody where ejflbm = '"+ejfl+"'";
		List bodyList = publicDao.queryForList(bodysql, new ArrayList());
		if(sjList.size()>0 || zcList.size()>0 || bodyList.size()>0){
			return "no";
		}else{
			return "yes";
		}
	}
	
	/**
	 * 三级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String sjflDelCheck(String sjfl){
		String zcsql = "select sjflbm from zy_zc where sjflbm = '" + sjfl + "'";
		List zcList = publicDao.queryForList(zcsql, new ArrayList());
		String bodysql = "select sjflbm from zy_sbody where sjflbm = '"+sjfl+"'";
		List bodyList = publicDao.queryForList(bodysql, new ArrayList());
		if(zcList.size()>0 || bodyList.size()>0){
			return "no";
		}else{
			return "yes";
		}
	}
	
}
