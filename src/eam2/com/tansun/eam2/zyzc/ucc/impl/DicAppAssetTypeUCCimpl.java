package com.tansun.eam2.zyzc.ucc.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype2;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype3;
import com.tansun.eam2.zyzc.service.impl.DicAppAssetTypeBSimpl;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;

@Service
public class DicAppAssetTypeUCCimpl implements DicAppAssetTypeUCC {
	@Autowired
	DicAppAssetTypeBSimpl dicAppAssetTypeBSimpl;
	
	/**
	 * 根据二级分类编码到二级分类表中查询记录，然后删除
	 * @param yjflbm
	 */
	public void deleteejFL(String ejflbm) {
		dicAppAssetTypeBSimpl.deleteejFL(ejflbm);
	}

	/**
	 * 根据三级分类编码到三级分类表中查询记录，然后删除
	 * @param yjflbm
	 */
	public void deletesjFL(String sjflbm) {
		dicAppAssetTypeBSimpl.deletesjFL(sjflbm);
	}

	/**
	 * 根据一级分类编码到一级分类表中查询记录，然后删除
	 * @param yjflbm
	 */
	public void deleteyjFL(String yjflbm) {
		dicAppAssetTypeBSimpl.deleteyjFL(yjflbm);
	}

	/**
	 * 根据调用方法的传过来不同类型实参分别组成不同类型的字符串，到数据库中查询对象并返回
	 * @param <T>
	 * @param objectType
	 * @param Id
	 * @return
	 */
	public <T> T findSingleRecordById(T objectType, String Id) {
		return dicAppAssetTypeBSimpl.findSingleRecordById(objectType, Id);
	}

	/**
	 * 根据调用方法的不同类型实参分别更新不同类型的对象
	 * @param <T> 
	 * @param FLType 
	 */
	public <T> void modifyFL(T FLType) {
		dicAppAssetTypeBSimpl.modifyFL(FLType);
	}

	/**
	 * 根据调用方法的不同类型实参分别保存不同类型的对象
	 * @param <T> 
	 * @param FLType 
	 */
	public <T> void saveFL(T FLType) {
		dicAppAssetTypeBSimpl.saveFL(FLType);
	}

	/**
	 * 根据一级分类编码查找一级分类对象
	 * @param yjflbm
	 * @return
	 */
	public DicAppAssettype1 findDic1(String yjflbm) {
		return dicAppAssetTypeBSimpl.findDic1(yjflbm);
	}

	/**
	 * 根据二级分类编码查找二级分类对象
	 * @param ejflbm
	 * @return
	 */
	public DicAppAssettype2 findDic2(String ejflbm) {
		return dicAppAssetTypeBSimpl.findDic2(ejflbm);
	}

	/**
	 * 根据三级分类编码查找三级分类对象
	 * @param sjflbm
	 * @return
	 */
	public DicAppAssettype3 findDic3(String sjflbm) {
		return dicAppAssetTypeBSimpl.findDic3(sjflbm);
	}

	/**
	 * 查找二级分类列表
	 */
	public Map<String, String> findEjFl(String yjFlBm) {
		return dicAppAssetTypeBSimpl.findEjFl(yjFlBm);
	}

	/**
	 * 根据二级分类编码到二级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findEjFlMC(String ejflbm) {
		return dicAppAssetTypeBSimpl.findEjFlMC(ejflbm);
	}

	/**
	 * 查找三级分类列表
	 */
	public Map<String, String> findSjFl(String ejFlBm) {
		return dicAppAssetTypeBSimpl.findSjFl(ejFlBm);
	}

	/**
	 * 根据三级分类编码到三级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findSjFlMC(String sjflbm) {
		return dicAppAssetTypeBSimpl.findSjFlMC(sjflbm);
	}

	/**
	 * 查找一级分类列表
	 */
	public Map<String, String> findYjFl() {
		return dicAppAssetTypeBSimpl.findYjFl();
	}

	/**
	 * 根据一级分类编码到一级分类表中查询对应的分类名称
	 * @param yjflbm
	 */
	public String findYjFlMC(String yjflbm) {
		return dicAppAssetTypeBSimpl.findYjFlMC(yjflbm);
	}
	
	/**
	 * 判断该三级编码下是否含有物品，如果含有三级分类编码，返回true，否则，返回false
	 * @param sjflbm
	 * @return
	 */
	public boolean isCurrentFLHaveGoods(String sjflbm){
		return dicAppAssetTypeBSimpl.isCurrentFLHaveGoods(sjflbm);
	}
	
	/**
	 * 一级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String yjflDelCheck(String yjfl){
		return dicAppAssetTypeBSimpl.yjflDelCheck(yjfl);
	}
	
	/**
	 * 二级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String ejflDelCheck(String ejfl){
		return dicAppAssetTypeBSimpl.ejflDelCheck(ejfl);
	}
	
	/**
	 * 三级分类删除时的验证
	 * @param yjfl
	 * @return
	 */
	public String sjflDelCheck(String sjfl){
		return dicAppAssetTypeBSimpl.sjflDelCheck(sjfl);
	}
}
