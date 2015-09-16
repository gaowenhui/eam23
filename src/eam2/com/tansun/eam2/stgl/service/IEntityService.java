package com.tansun.eam2.stgl.service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StSkjnXx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

public interface IEntityService {
	/**
	 * 实体查询方法，咨询实体与非咨询实体是用Type字段区分。
	 * @param entity
	 * @return
	 */
    List<StJbxx> listEntities(EntityQueryVO entity);
    List<StJbxx> listEntities(Paginator paginator,EntityQueryVO entity, String type) throws IllegalAccessException, InvocationTargetException;
    
    
    /**
     * 非咨询实体
     * @param entity
     * @return
     */
    List<StJbxx> listNonEntities(EntityQueryVO entity);
    
    /**
     * 新建基本信息，需要生成ID。
     * @param jbxx
     */
    void newEntity(StJbxx jbxx);
    
    /**
     * 新建附属信息，需要生成ID。
     * @param fsxx
     */
    void newEntityFsxx(StFsxx fsxx);

    /**
     * 保存实体信息
     * @param jbxx
     */
    void saveEntity(StJbxx jbxx);
    /**
     * 查出基本信息
     * 根据实体ID查询基本信息
     * @return
     */
    StJbxx viewEntityJbxx(String stid);
    
    /**
     * 查出基本信息
     * 根据实体ID查询附属信息
     * 类型的命名见@see com.tansun.eam2.stgl.StglCommon.java
     * @return
     */
    List<StFsxx> viewEntityFsxx(String stid, String leixing);
    
    /**
     * 删除附属信息；
     * @param fsxxIds为一个存放附属信息Id的数组
     * @return
     */
    void deleteFsxx(String [] fsxxIds);
    
    
    /**
     * 删除表体信息
     * @param jbxxIds为一个存放附属信息Id的数组
     * @return
     */
    void deleteStJbxx(String[] jbxxIds);
   
    List<StFsxx> viewEntityFsxxPop(String stid, String leixing,String pop);
    
    /**
     * 贷款抵制压物查询 add by chenyuxiao 
     * @param loansId
     * @param leixing
     * @param pop
     * @return
     */
    List<StFsxx> viewEntityFsxxLoans(String loansId,String leixing,String pop);
    
	  /**
	   * 查询附属信息记录数
	   * @param stid
	   * @param leixing
	   * @return
	   */
    int selectFsxxCount(String stid, String leixing);
    
    
    //---------------------实体资产----------------------
    
	/**
	 * 插入一条数据
	 */
	 public void saveZcPgXx(ZcPgXx zc);
    
	/**
	 * 保存一条数据
	 */
	 public void updateZcPgXx(ZcPgXx zc);
		/**
		 * 保存或一条数据
		 */
	public void saveOrUpdateZcPgXx(ZcPgXx zc);
	
	/**
	 * 根据主键查找ZcPgXx 信息
	 */
	public ZcPgXx getZcPgXx(String id);
	
	
	/**
	 * 根据stfsxxid查找ZcPgXx 信息
	 */
	public ZcPgXx viewZcPgXx(String stfsxxid);
	
	/**
	 * 根据stfsxxid查找ZcPgXx列表 信息
	 */
	public List<ZcPgXx> getZcPgXxList(String stfsxxid,String ispgsc);
	
	/**
	 * 删除评估信息
	 */
	public void deleteZcPgXx(String[] ZcPgXxIds) ;
    
    //---------------------债权 债务-------------------------
    
	/**
	 * 删除债权信息
	 * @return
	 */
	public void claimsdeleList(String[] ids);    
	
	/**
	 * 插入一条DebtInfo
	 * @param st
	 */
	public void newDebtInfo(DebtInfo di);
	
	/**
	 * 保存一条DebtInfo
	 * @param st
	 */
	public void saveDebtInfo(DebtInfo di);
	
	/**
	 * 根据id查找DebtInfo
	 * @param id
	 * @return
	 */
	public DebtInfo getDebtInfo(String id);
	
	/**
	 * 删除DebtInfo
	 * @param id
	 */
	public void deleteDebtInfo(String[] id);
	
	/**
	 * 根据zqrid 查找债务 列表
	 * @param id
	 * @return
	 */
	public List<DebtInfo> getDebtInfoList(String id);
	
	
	
	/**
	 * 根据zwrid 查找债权 列表
	 * @param id
	 * @return
	 */
	public List<DebtInfo> getDebtList(String id);
	
	
	//--------------------------税务-----------------------
	
	
	/**
	 * 根据stid 查找 税务 列表
	 * @param id
	 * @return
	 */
	public List<StSkjnXx> getTaxList(String id);
	
	
	/**
	 * 插入一条StSkjnXx
	 * @param st
	 */
	public void newTaxInfo(StSkjnXx dk);
	
	/**
	 * 保存一条StSkjnXx
	 * @param st
	 */
	public void saveTaxInfo(StSkjnXx dk);
	
	/**
	 * 根据id查找StSkjnXx
	 * @param id
	 * @return
	 */
	public StSkjnXx getTaxInfo(String id);
	
	/**
	 * 删除StSkjnXx
	 * @param id
	 */
	public void deleteTaxInfo(String[] id);
	
	
	//--------------------------诉讼-------------------------------
	
	/**
	 * 诉讼  被诉  查询
	 * @param stid            实体id
	 * @param litigationType  诉讼/被诉
	 */
	public List<SsBaseinfo> getLitigationList(String stid,String litigationType);
	
	//更新实体状态
	public void updateEntityState(String stid, String state);
	
	public void saveEntityLog(StJbxx jbxx_old,StJbxx jbxx_new,String opType);
	public void saveEntityFsxxLog(StFsxx fsxx_old,StFsxx fsxx_new,String opType);
	public void saveEntityZcPgXxLog(ZcPgXx zcPgXx_old, ZcPgXx zcPgXx_new, String opType);
	public void saveDebtClaimsLog(DebtInfo debtInfo_old, DebtInfo debtInfo_new,
			String opType, String debtInfo);
	/**
	 * 根据实体附属信息id查出一条附属信息
	 * @param id
	 * @return
	 */
	StFsxx viewEntityFsxx(String id);
	List<PTEnd> queryEndList_page(String strSTID,Paginator paginator, String title);
	/**
	 * 记录税款缴纳修改日志
	 * @param stSkjnXx_old
	 * @param stSkjnXx_new
	 * @param opType
	 */
	public void saveTaxInfoLog(StSkjnXx stSkjnXx_old, StSkjnXx stSkjnXx_new,
			String opType);
	
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList(String stId);
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList2(String stId);
	
	/**
	 * 根据选择的项目得到项目下的资产列表
	 * @return
	 */
	public String findAssetByCzXxList(String stId,String cldId,String xmId);
	/**
	 * 删除税款缴纳信息
	 * @return
	 */
	public void deleTaxPayment(String[] taxPaymentIds);

	/**
	 * 取得实体List
	 * @param ids StJbxx.id[]
	 * return List<StJbxx>
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<StJbxx> getEntityListByIds(String[] ids) throws IllegalAccessException, InvocationTargetException;
	
	/**
	 * 根据附属信息id取得附属信息List
	 * @param ids : StFsxx.id[]
	 * @return List<StFsxx>
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<StFsxx> getFsxxListByIds(String[] ids) throws IllegalAccessException, InvocationTargetException;
}
