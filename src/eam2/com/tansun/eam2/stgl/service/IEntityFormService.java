package com.tansun.eam2.stgl.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.vo.IncomeCostResultVO;
import com.tansun.eam2.stgl.vo.IncomeResultVO;

@Service
public interface IEntityFormService {
    /**
     * 新建基本信息，需要生成ID。
     * @param head
     */
    void newEntityForm(StHead head);
    
    /**
     * 保存表体
     * @param body
     */
    void newEntityForm(StGlbt body);
    /**
     * 保存表体(动态表格)
     * @param body
     */
    void newEntityForm2(StGlbt body);

	/**
	 * 保存表单
	 * @param stHead
	 * @return
	 */
	public void saveEntityForm(StHead stHead);
    
    /**
     * 查出表体信息
     * @param headid
     * @return
     */
    List<StGlbt> viewEntityBody(String headid);
    
    /**
     * 查出处理单信息
     * @return
     */
    
    StHead viewEntityHead(String headid);
    
    /**
     * 删除表体记录；
     * @param btIds为一个存放表体Id的数组
     * @return
     */
    
    void deleteStGlbt(String [] btIds);
    
    /**
     * 删除表体记录
     */
	public void deleteStGlbt(StGlbt body);

	public void updateStGlbt(String headId, String stId);
    
    /**
     * 根据表单id，更新表单信息中的某个属性
     */
	public void updateStHead(String headId, String property, String value);
	
    /**
     * 根据实体id和实体类型，查询该实体所涉及到的处理单流程信息
     * @param stId
     * @param zixunType
     * @return
     */
	List<StHead> findHeadList(String stId, String zixunType);

	/**
	 * 查询某实体所涉及到的费用
	 * @return
	 */
	List<IncomeCostResultVO> viewStIncomeCost(String stId, String zixunType);
	
	/**
	 * 根据表体Id查询某条表体记录
	 * @return
	 */
	StGlbt findBody(String btId);
	/**
	 * 查询某实体所涉及到的收入
	 * @return
	 */
	List<IncomeResultVO> viewStIncome(String stId);
	
}
