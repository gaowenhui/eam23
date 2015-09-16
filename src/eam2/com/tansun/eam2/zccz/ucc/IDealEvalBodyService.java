package com.tansun.eam2.zccz.ucc;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.springframework.beans.BeanUtils;

import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

public interface IDealEvalBodyService {

	
	/**
	 * 保存表体
	 */
	public void saveBody();

	/**
	 * 增加表体记录
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void addBodys(List<String> bodyIdList, String assetType, String cldId) throws IllegalAccessException, InvocationTargetException;
	
	public void addBodys(String[] bodyIdArray, String assetType, String cldId) throws IllegalAccessException, InvocationTargetException;

	/**
	 * 删除表体记录
	 */
	public void deleteBody(String cldId,String[] id)throws IllegalAccessException, InvocationTargetException;

	/**
	 * 修改表体记录入口
	 */
	public void modifyBody();

	/**
	 * 查看表体记录入口(只读)
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public PageableList getDealEvalVOPage(Paginator paginator, String cldId, String assetType) throws IllegalAccessException, InvocationTargetException;

	//删除经营性固定资产
	public void delAssets(String cldId, String assetIds) throws IllegalAccessException, InvocationTargetException;
	
	//----------------------------------------------
	/**
	 * 通过id查找ZcPgXx信息
	 * @param id
	 * @return
	 */
	public ZcPgXx getZcPgXxInfo(String id);
	
	/**
	 * 保存
	 * @param cpl
	 * @param id
	 * @param czpgscclid  
	 */
	public void saveBodyInfo(CzPgxxLsb cpl,String id,String czpgscclid);
	
	
	public void saveBody(CzPgxxLsb cpl);
	
	public void updateBody(CzPgxxLsb cpl);
	
	/**
	 * 通过stfsxxid查找信息
	 * @param stfsxxid
	 * @return
	 */
	public CzPgxxLsb getCzPgxxLsbInfo(String stfsxxid,String czpgscclid);
	
	
	/**
	 * 显示czpgscclid相同的 数据
	 * @param czpgscclid
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<CzPgxxLsb> getCzPgxxLsbList(String czpgscclid) throws IllegalAccessException, InvocationTargetException;
	
	//根据id取得body
	public CzPgxxLsb getpgXxLsbById(String id);
	
	public void updatePgxx(CzPgxxLsb pgxx) throws IllegalAccessException, InvocationTargetException;
	
	public void updateGqjzrjzcz(String bodyId, Double gqjzrjzcz, Double pingguzhi) throws IllegalAccessException, InvocationTargetException;
	
	public void updatePgjzrzmzqz(String bodyId, Double pgjzrzmzqz, Double pingguzhi) throws IllegalAccessException, InvocationTargetException;

}
