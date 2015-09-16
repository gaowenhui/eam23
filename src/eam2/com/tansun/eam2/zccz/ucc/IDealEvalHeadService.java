package com.tansun.eam2.zccz.ucc;

import java.lang.reflect.InvocationTargetException;

import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.zccz.vo.ScyjVo;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public interface IDealEvalHeadService {

	/**
	 * 新建入口
	 */
	public String newHead(CzPgscZskwhCld head);    
	
	public CzPgscZskwhCld getHeadById(String cldId);
	
	public String getStIdByCldId(String cldId);
	
	public String getStlxById(String stId);
	
	public void updateHead(CzPgscZskwhCld head) throws IllegalAccessException, InvocationTargetException;

	public void updateHead(CzPgscZskwhCld head,String jlxz) throws IllegalAccessException, InvocationTargetException;

	//添加审查结论
	public void addScjl(ScyjVo vo, PTUserBO user);
	//从历史意见中添加审查结论
	public void addScjl(ScyjVo vo, PTUserBO user, String historyIds) throws IllegalAccessException, InvocationTargetException;

	//取得某人的未提交的审查结论的Json字符串
	public String getMyScyjJson(String cldId ,String userId) throws IllegalAccessException, InvocationTargetException;
	
	//取得所有已提交的审查结论
	public String getSubmitScyjJson(String cldId) throws IllegalAccessException, InvocationTargetException;
	
	//修改意见后跟新相应的审查项目、审查要点、审查结论。
	public void updateScyj(ScyjVo vo);
	
	//删除审查结论以及对应的审查要点、审查项目
	public void delScyj(String ids);
	
	//保存处置审批意见（只跟新了审查结论）
	public void submitScyj(CzPgscJl pgscJl, String userId, String adviceType);
	
	public String generatorBianhao(String cldId, String deptId, String deptName);
	
	//提交过程意见、最终意见、沟通意见时跟新结论性质
	public void updateJlxz(String headId, String jlxz);
	
	// 根据子节点查找父节点
	public String findParentByChild(String childId); 
	
	// 根据id查找value
	public String findValueById(String id);
	
	// 根据id修改value
	public void updateValueById(String id,String value);
	
	public String getUserLX(String cldId,String userId);// 查找用户类型
	
	//办结调用方法
	public void copyPgxx(String headId) throws IllegalAccessException, InvocationTargetException;

	public String findRadioValue(String cldId,String userId); // 查找通过与否
}
