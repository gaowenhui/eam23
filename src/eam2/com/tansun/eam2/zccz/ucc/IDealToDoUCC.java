package com.tansun.eam2.zccz.ucc;


import java.util.Date;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTTodo;


public interface IDealToDoUCC {

	/**
	 * jf add 根据id查询项目信息
	 * @param id
	 * @return
	 */
	public CzXmxxLsb findCzXmXxById(String id);
	
	public void updateHyZT(String[] xmIds);
	/**
	 * 查出所有处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMs(CzXmxxLsb lsb );
	
	/**
	 * 保存信息 
	 * @param id
	 * @return
	 */
	public void save(CommonBO commonBO);
	
	/**
	 * 更新信息 
	 * @param id
	 * @return
	 */
	public void update(CommonBO commonBO);
	
	/**
	 * 删除信息 
	 * @param id
	 * @return
	 */
	public void delete(CommonBO commonBO);

	/**
	 * 处置项目关联到会议下
	 * @param id
	 * @param xmIds
	 */
	public void creatCzxm2Meeting(String id, String[] xmIds);

	/**
	 * 在会议下 删除处置项目
	 * @return
	 */
	public void delCzxm2Meeting(String hyId, String[] xmIds);
	
	/**
	 * 根据角色，查询出审批委员，或者审批主持人的JSON
	 * @param role
	 * @return
	 */
	public String getZcrOrSpwyByRole(String role);
	
	/**
	 * 修改处置项目的审批委员
	 * @param spwys 
	 * @return
	 */
	public void modigySpwy(String xmIds, String spwyIds, String spwys);

	/**
	 * 会议下项目的排序
	 * @return
	 */
	public String sortXm(String sortType, String hyId, String xmId);

	/**
	 * 保存会议后更新项目的状态为上会
	 * @param id
	 */
	public void updateXmZt(String id);

	/**
	 * 查询hyId的会议信息
	 * @param hyId
	 */
	public CzHyxx findHyxxById(String hyId);

	/**
	 * 根据审批委员Id，会议id查询上会中项目
	 * @return
	 */
	public String findCzxmJSON4Sp(String spwyId, String hyId);

	/**
	 * 根据会议id查询上会中项目上会意见情况
	 * @return
	 */
	public String findCzxmJSON4Shyj(String hyId);

	/**
	 * 组织会议，并关联选择的项目到会议下,并给每个项目配主持人
	 * @return
	 */
	public void saveHyxxAndZcr(CzHyxx hyxx);
	
	public String getDsiposeXmJson();
	public String getDsiposeXmJson(CzXmxxLsb lsb);
	public String getInvestmentXmJson(CzXmxxLsb lsb);
	
	public void sendToDoWysp(String hyId, PTUserBO currentUser);
	
	public CzHyxx setZcrInfo(String hyId, String zcrId);
	
	public String isAllSpwySubmit(String hyId);
	
	public void saveSpsj(String hyId, Date spsj);
	public void setOrder(String strid, String sortid);
	
	//给会议内没有提交的审批委员发送提示消息
	public void sendMessageToWtjSpwy(String hyId,Long currentUserId);
	
	//根据处置项目临时表的id查询处置委员
	public List<CzXmSpwYj> findSpwyByLsbId(String lsbId,String isSpwy);
	
	public String generatorZhenwen(String hyId, String hylx);
	
	//根据代办id获得代办对象
	public PTTodo getPTTodoById(String todoId);
}
