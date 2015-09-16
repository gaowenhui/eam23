package com.tansun.eam2.zccz.ucc;


import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.zccz.vo.PersonHeadVo;

public interface IPersonDealHeadService {
	
	/**
	 * 设置实体信息
	 * @param	stid	:实体id
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public PersonHeadVo setStjbxxToCzStcztz(String headId, String stid, String fafl, String oldStid) throws IllegalAccessException, InvocationTargetException;

	public CzStcztz setRyFyInfo(String headId);
	
	public void reSetRenyuanFeiyong(String cldId);
	
	public String saveHead(CzStcztz head);
	
	public CzStcztz generateShoulixuhaoShenbaoRQ(String cldId);
	
	//生成编号,在综合提交出部门的时候调用
	public CzStcztz generateBianhao(String cldId);   
	
	/**
	 * 草稿箱入口
	 */
	public CzStcztz viewDraft(String id); 
	/**
	 * 根据查出处理单
	 */
	public List<CzStcztz> viewHead(String stid,String lcmc);
	
	public void endProcess(CzStcztz head);
}
