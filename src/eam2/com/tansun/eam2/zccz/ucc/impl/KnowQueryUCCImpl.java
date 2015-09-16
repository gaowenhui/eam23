package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zccz.service.IKnowQueryBS;
import com.tansun.eam2.zccz.ucc.IKnowQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 知识库查询
 * 
 * @author 陈煜霄
 * @date 2010-12-21
 */
@Service
public class KnowQueryUCCImpl implements IKnowQueryUCC {

	@Autowired
	private IKnowQueryBS knowQueryBSImpl;

	/**
	 * 组合xml文件
	 * 
	 * @param menus
	 * @return
	 */
	public String getKnowXML() {
		return knowQueryBSImpl.getKnowXML();
	}

	/**
	 * 得到正式表并拼成xml文件
	 * 
	 * @return
	 */
	public String gotKnowLSBXML(String headId) {
		return knowQueryBSImpl.gotKnowLSBXML(headId);
	}

	/**
	 * 判断LSB里是否有该字段
	 * 
	 * @param headId
	 * @return
	 */
	public boolean findLSBbyHeadId(String headId) {
		return knowQueryBSImpl.findLSBbyHeadId(headId);
	}

	/**
	 * 将正式表的数据导入临时表
	 */
	public void addToLSB(String headId) {
		knowQueryBSImpl.addToLSB(headId);
	}

	/**
	 * 查询所有项目临时表
	 * 
	 * @param headId
	 * @return
	 */
	public List queryXM(String headId) {
		return knowQueryBSImpl.queryXM(headId);
	}

	/**
	 * 查询正式表中所有项目
	 * 
	 * @return
	 */
	public List queryXMZSB() {
		return knowQueryBSImpl.queryXMZSB();
	}

	/**
	 * 根据项目id查找要点内容临时表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXM(String pid, String headId) {
		return knowQueryBSImpl.findYDByXM(pid, headId);
	}

	/**
	 * 根据项目id查找要点内容正式表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXMZSB(String pid) {
		return knowQueryBSImpl.findYDByXMZSB(pid);
	}

	/**
	 * 通过条件查找正式表
	 * 
	 * @param xmid
	 * @param ydid
	 * @return
	 */
	public String getKnowXMLByChoose(String xmid, String ydid) {
		return knowQueryBSImpl.getKnowXMLByChoose(xmid, ydid);
	}

	/**
	 * 得到正在流程中的知识库数据
	 * 
	 * @return
	 */
	public String getKnowInFlow() {
		return knowQueryBSImpl.getKnowInFlow();
	}
	
	public List getKnowExeclByChoose(String pid){
		return knowQueryBSImpl.getKnowExeclByChoose(pid);
	}
	
	 /*
     * 
     *  导出数据调用方法
     *   
     */
	public List getKnowZSB(String pid){
		return knowQueryBSImpl.getKnowZSB(pid);
	}

}
