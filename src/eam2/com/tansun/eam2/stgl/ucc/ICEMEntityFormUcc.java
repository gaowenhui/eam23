package com.tansun.eam2.stgl.ucc;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.vo.IncomeCostResultVO;
import com.tansun.eam2.stgl.vo.IncomeResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;


/**
 * 实体流程审批相关
 * @Title: ICEMEntityService.java 
 * @Package com.tansun.eam2.stgl.ucc 
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Nov 16, 2010 3:29:12 PM 
 * @version V1.0
 */
public interface ICEMEntityFormUcc{
	
//	/**
//	 * 实体查询方法，咨询实体与非咨询实体是用Type字段区分。
//	 * @param entity
//	 * @return
//	 */
//    List<StJbxx> listEntities(EntityQueryVO entity);
    
    /**
     * 新建基本信息，需要生成ID。
     * 可能用不上。
     * @param head
     */
    void newEntityForm(StHead head);
    
    /**
     * 保存表体
     * @param body
     */
    void newEntityForm(StGlbt body);
    
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
    
    List<StFsxx> viewStaff(StaffQueryVO staffQueryVO );
    
    /**
     * 保存表体信息，表体为一个列表
     * 
     */
    void newEntityForm(List<StGlbt> list);
    /**
     * 保存表体信息，表体为一个列表（动态表格）
     * 
     */
    void newEntityForm2(List<StGlbt> list);
    /**
     * 新建表单信息，产生表单id
     */
    void saveEntityForm(StHead head);
    
    /**
     * 删除表体信息
     * @param btIds
     */
    void deleteStGlbt(List<StGlbt>  bodyList);
    
    /**
     * 更新表体信息中的实体id
     * @param btIds
     */
    void updateStGlbt(String headId,String StId);
    
    /**
     * 根据表单id，更新表单信息中的某个属性
     */
    void updateStHead(String headId,String property,String value);
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
	 * 根据表体Id查出某条表体记录
	 * @param btId
	 * @return
	 */
	StGlbt findBody(String btId);
	/**
	 * 查询某实体所涉及到的收入
	 * @return
	 */
	List<IncomeResultVO> viewStIncome(String stId);
}
