package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
public interface IDealToDoBS extends ICommonBS{

	/**
	 * jf add 根据id查询项目信息
	 * @param id
	 * @return
	 */
	public CzXmxxLsb findCzXmXxById(String id);
	/**
	 * 查出所有处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMs(CzXmxxLsb lsb );
	public void updateHyZT(String[] xmIds);
	/**
	 * 保存信息  
	 * @param id
	 * @return
	 */
	public void save(CommonBO commonBO);

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

	/**
	 * 根据项目id查询主持人，或审批委员 
	 * @param id
	 * @return
	 */
	public List findSpwyByLsbId(String id,String isZcrOrSpwy);
	
	public List<CzXmxxLsb> getDsiposeXmList();
	public List<CzXmxxLsb> getDsiposeXmList(CzXmxxLsb lsb);
	public List<CzXmxxLsb> getInvestmentXmList(CzXmxxLsb lsb);
	public void setOrder(String strid, String sortid);
	
	public List<CzXmSpwYj> getAllWtjSpwy(String hyId);
	
	public List<CzXmxxLsb> findCzXmXxByHyid(String hyId);
	
	public String getCjtzHyxxCount(String hyId);
	
	public List<CzXmxxLsbVO> getAllSpwy(String role);
	
	//根据代办id获得代办对象
	public PTTodo getPTTodoById(String todoId);
}
