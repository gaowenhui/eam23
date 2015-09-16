package com.tansun.eam2.zccz.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.zccz.service.IWNBBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 万能表相关后台数据库访问的具体实现
 * @author 刘峻松
 *
 */
@Repository
public class WNBBSImpl implements IWNBBS {
	@Autowired
	private PublicDao publicDao;
	
	public void save(CommonBO commonBO){
		publicDao.save(commonBO);
	}
	public void update(CommonBO commonBO){
		publicDao.update(commonBO);
	}
	public void delete(CommonBO commonBO){
		publicDao.delete(commonBO);
	}	
	/**
	 * 根据虚拟表名称,得到所有数据列定义的列表
	 * @param zd_code
	 * @return ColBO组成的List对象
	 */
	public List getColList(String zd_code) {

		List params = new ArrayList();
		params.add(zd_code);
		String strsql = "from CzWnbcol where zdCode=?";
		List l1 = publicDao.find(strsql, params);
		return l1;
	}
	/**
	 * 根据项目ID,资产ID,虚拟表编号，得到对应的万能表实际数据
	 * @param xm_id
	 * @param zc_id
	 * @param zd_code
	 * @return WNBBO组成的List对象
	 */
	public List getWNBList(String xm_id, String zc_id, String zd_code) {
		List params = new ArrayList();
		params.add(xm_id);
		params.add(zc_id);
		params.add(zd_code);
		
		String strsql = "from CzWnb where xmId=? and zcId=? and zcCode=?";
		
		List l1 = publicDao.find(strsql, params);
		return l1;
	}
	
	/**
	 * 根据WNB_ID，检索对应的WNB　BO对象
	 * @param wnb_id 万能表的ID
	 * @return 万能表的BO对象，如果没有找到，返回null
	 */
	public CommonBO retrieveWNBBO(String wnb_id) {
		List params = new ArrayList();
		params.add(wnb_id);
		
		String strsql = "from CzWnb where wnbId=?";
		
		CommonBO bo = publicDao.findSingleResult(strsql, params);
		return bo;
	}
	
	/**
	 * 保存一个万能表BO对象到后台数据库去
	 * @param wnbbo
	 */
	public void saveWNBBO(CommonBO wnbbo) {
		publicDao.saveOrUpdate(wnbbo);
	}

	//-------------------------------------------------------------//
	//---------------　程序自动生成的Get Set 方法 ---------------------//
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

}
