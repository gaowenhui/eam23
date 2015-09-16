package com.tansun.eam2.zccz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 操作生成审查知识库临时表的功能类，用来根据变动信息表来生成修改后知识库和审批后知识库 具体算法参见审查知识库的详细设计文档。
 * 
 * @author 刘峻松 2010-12-06
 * 
 */
@Repository
public class SczckLSBUtil {
//	@Autowired
//	private PublicDao publicDao;
//
//	/**
//	 * generateChangeLSB 自动生成修改后临时表数据。 输入：临时表中的原始知识库信息 表单的变动信息 输出：临时表中的修改后知识库信息
//	 * 
//	 * @param headId
//	 */
//	public void generateChangeLSB(String headId) {
//		// Step1: 数据准备，准备输入数据：原始知识库信息，表单的变动信息
//		List sourceLib = getSourceList(headId); // 原始知识库信息
//		List bdxxList = getBDXXList(headId); // 变动信息列表
//
//		// Step2: 现有的修改后知识库数据清理
//		String strsql = "delete from CZ_SCZSK_LSB where cld_id='" + headId
//				+ "'" + " and dtype='2'";
//		publicDao.updateBySql(strsql); // 执行SQL命令
//		// Step3: 将现有的原始知识库信息复制到修改后知识库信息
//		int i = 0;
//		for (i = 0; i < sourceLib.size(); i++) {
//			CzSczskLsb sourcebo = (CzSczskLsb) sourceLib.get(i);
//			CzSczskLsb newbo = new CzSczskLsb(); // 生成一个新对象
//			copyLSBbo(sourcebo, newbo);
//			newbo.setDtype("2"); // 2代表修改后数据
//			newbo.setDelflag("0"); // 初始化为未删除
//			publicDao.save(newbo); // 插入到后台数据库去
//		}
//		// Step4: 逐条根据变动信息，来生成SQL语句，更新修改后的知识库信息。
//		for (i = 0; i < bdxxList.size(); i++) {
//			CzSczskBdxx bdxxbo = (CzSczskBdxx) bdxxList.get(i);
//			String sql = "";
//			// 将BO转换成标准的SQL语句
//			sql = this.convertToLSBSQL(bdxxbo, "2"); // 操作修改表
//			// 执行SQL命令
//			if (sql.length() > 0) {
//				publicDao.updateBySql(sql); // 执行SQL命令，以更新后台数据
//			}
//		}
//		// 执行结束。
//	}
//
//	/*
//	 * 生成审批后临时表，查询用
//	 */
//	public void generateSPLSB(String headId) {
//		// Step1: 数据准备，准备输入数据：原始知识库信息，表单的变动信息
//		List sourceLib = getSourceList(headId); // 原始知识库信息
//		List bdxxList = getBDXXList(headId); // 变动信息列表
//
//		// Step2: 现有的修改后知识库数据清理
//		String strsql = "delete from CZ_SCZSK_LSB where cld_id='" + headId
//				+ "'" + " and dtype='3'";
//		publicDao.updateBySql(strsql); // 执行SQL命令
//		// Step3: 将现有的原始知识库信息复制到修改后知识库信息
//		int i = 0;
//		for (i = 0; i < sourceLib.size(); i++) {
//			CzSczskLsb sourcebo = (CzSczskLsb) sourceLib.get(i);
//			CzSczskLsb newbo = new CzSczskLsb(); // 生成一个新对象
//			copyLSBbo(sourcebo, newbo);
//			newbo.setDtype("3"); // 3代表审批后数据
//			newbo.setDelflag("0"); // 初始化为未删除
//			publicDao.save(newbo); // 插入到后台数据库去
//		}
//		// Step4: 逐条根据变动信息，来生成SQL语句，更新修改后的知识库信息。
//		for (i = 0; i < bdxxList.size(); i++) {
//			CzSczskBdxx bdxxbo = (CzSczskBdxx) bdxxList.get(i);
//			String sql = "";
//			// 将BO转换成标准的SQL语句
//			sql = this.convertToLSBSQL(bdxxbo, "3"); // 操作审批结果表
//			// 执行SQL命令
//			if (sql.length() > 0) {
//				publicDao.updateBySql(sql); // 执行SQL命令，以更新后台数据
//			}
//		}
//		// 执行结束。
//	}
//
//	/**
//	 * 得到修改前的知识库列表,返回一个
//	 * 
//	 * @param headId
//	 * @return
//	 */
//
//	private List getSourceList(String headId) {
//		List params = new ArrayList();
//		params.add(headId);
//
//		String hql = "from CzSczskLsb where cldId=? and dtype=1";
//		return publicDao.find(hql, params); // 得到原始知识库信息
//	}
//
//	/**
//	 * 根据表单Id，检索对应的变动信息列表
//	 * 
//	 * @param headId
//	 * @return
//	 */
//	private List getBDXXList(String headId) {
//		List params = new ArrayList();
//		params.add(headId);
//
//		String hql = "from CzSczskBdxx where cldId=? ";
//		return publicDao.find(hql, params); // 得到原始知识库信息
//	}
//
//	/**
//	 * 根据表单Id，检索对应的变动信息列表,只要其中审批通过的。
//	 * 
//	 * @param headId
//	 * @return
//	 */
//	private List getBDXXList2(String headId) {
//		List params = new ArrayList();
//		params.add(headId);
//
//		String hql = "from CzSczskBdxx where cldId=? And spzt='1'";
//		return publicDao.find(hql, params); // 得到原始知识库信息
//	}
//
//	/**
//	 * 把信息从sourcebo拷贝到newbo, 其中dtype和delflag不拷贝
//	 * 
//	 * @param sourcebo
//	 * @param newbo
//	 */
//	private void copyLSBbo(CzSczskLsb sourcebo, CzSczskLsb newbo) {
//		newbo.setCldId(sourcebo.getCldId());
//		newbo.setZskId(sourcebo.getZskId());
//		newbo.setScxmbh(sourcebo.getScxmbh());
//		newbo.setScxm(sourcebo.getScxm());
//		newbo.setScydbh(sourcebo.getScydbh());
//		newbo.setScyd(sourcebo.getScyd());
//		newbo.setJtyjbh(sourcebo.getJtyjbh());
//		newbo.setJtyj(sourcebo.getJtyj());
//	}
//	
//	/**
//	 * 将一个变动信息的对象转换成一个标准的SQL语句，其中的表名可能不一致 如果数据有错误，则返回一个空字符串
//	 * 
//	 * @param bdxx
//	 * @return
//	 */
//	private String convertToLSBSQL(CzSczskBdxx bdxx, String dtype) {
//		if (bdxx.getBdfs() == null) {
//			System.out.println("数据错误，变动方式为空!");
//			return "";
//		}
//		String strsql = "";
//		String tablename = "CZ_SCZSK_LSB";
//
//		// 项目变更
//		if (bdxx.getBdfs().equalsIgnoreCase("CHANGEXM")) {
//			strsql = "Update " + tablename + " Set SCXM ='" + bdxx.getAfterxm()
//					+ "'" + " Where SCXM ='" + bdxx.getBeforexm() + "'";
//		}
//		// 要点变更
//		if (bdxx.getBdfs().equalsIgnoreCase("CHANGEYD")) {
//			strsql = "Update " + tablename + " Set SCYD ='" + bdxx.getAfteryd()
//					+ "'" + " Where SCYD ='" + bdxx.getBeforeyd() + "'";
//		}
//		// 项目删除
//		if (bdxx.getBdfs().equalsIgnoreCase("DELETEXM")) {
//			strsql = "Update " + tablename + " Set DELFLAG ='1'"
//					+ " Where SCXM ='" + bdxx.getBeforexm() + "'";
//		}
//		// 要点删除
//		if (bdxx.getBdfs().equalsIgnoreCase("DELETEYD")) {
//			strsql = "Update " + tablename + " Set DELFLAG ='1'"
//					+ " Where SCYD ='" + bdxx.getBeforexm() + "'";
//		}
//		// 意见迁移
//		if (bdxx.getBdfs().equalsIgnoreCase("MOVEYJ")) {
//			strsql = "Update " + tablename + " Set SCXM ='" + bdxx.getAfterxm()
//					+ "'," + " SCYD ='" + bdxx.getAfteryd() + "'"
//					+ " Where ZSK_ID ='" + bdxx.getZskid() + "'";
//		}
//
//		if (strsql.length() > 0) {
//			strsql = strsql + " And DType='" + dtype + "'";
//		}
//
//		return strsql; // 返回生成的SQL命令
//	}
//
//	// --------------------------------------------------------//
//	// ---- 系统自动生成的GetSet方法 ---------------------------//
//	public PublicDao getPublicDao() {
//		return publicDao;
//	}
//
//	public void setPublicDao(PublicDao publicDao) {
//		this.publicDao = publicDao;
//	}

}
