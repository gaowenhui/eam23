package com.tansun.eam2.zccz.ucc;

import java.util.List;
import java.util.Map;

/**
 * 知识库查询
 * 
 * @author 陈煜霄
 * @date 2010-12-21
 */
public interface IKnowQueryUCC {

	/**
	 * 得到正式表并拼成xml文件
	 * 
	 * @return
	 */
	public String getKnowXML();

	/**
	 * 得到正式表并拼成xml文件
	 * 
	 * @return
	 */
	public String gotKnowLSBXML(String headId);

	/**
	 * 判断LSB里是否有该字段
	 * 
	 * @param headId
	 * @return
	 */
	public boolean findLSBbyHeadId(String headId);

	/**
	 * 将正式表的数据导入临时表
	 */
	public void addToLSB(String headId);

	/**
	 * 查询所有项目临时表
	 * 
	 * @param headId
	 * @return
	 */
	public List queryXM(String headId);

	/**
	 * 查询正式表中所有项目
	 * 
	 * @return
	 */
	public List queryXMZSB();

	/**
	 * 根据项目id查找要点内容临时表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXM(String pid, String headId);

	/**
	 * 根据项目id查找要点内容正式表
	 * 
	 * @param pid
	 * @return
	 */
	public Map findYDByXMZSB(String pid);

	/**
	 * 通过条件查找正式表
	 * 
	 * @param xmid
	 * @param ydid
	 * @return
	 */
	public String getKnowXMLByChoose(String xmid, String ydid);
	
	/**
	 * 得到正在流程中的知识库数据
	 * 
	 * @return
	 */
	public String getKnowInFlow();
	
	/*
	 * 
	 *  EXCEL查询
	 * 	 
	 */
	public List getKnowExeclByChoose(String pid);
	
    /*
     * 
     *  导出数据调用方法
     *   
     */
	public List getKnowZSB(String pid);
}
