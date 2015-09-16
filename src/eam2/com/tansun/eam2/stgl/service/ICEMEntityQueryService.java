package com.tansun.eam2.stgl.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.stgl.vo.AssetQueryVO;
import com.tansun.eam2.stgl.vo.DebtQueryVO;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;
import com.tansun.eam2.stgl.vo.ZCXXQueryVO;
import com.tansun.rdp4j.common.util.Paginator;


/**
 * 
 * @author gengxiaoli
 *
 */
public interface ICEMEntityQueryService{
	
	/**
	 * 非咨询实体内资产的汇总查询。
	 * @param assetQueryVO
	 * @return
	 */
	List<QueryResultVO> queryAsset(AssetQueryVO assetQueryVO,Paginator paginator);
    List<QueryResultVO> queryAsset(ZCXXQueryVO queryVO,Paginator paginator);
    /**
     * 非咨询类实体内人员的汇总查询
     * @param assetQueryVO
     * @return
     */
    List<QueryResultVO> queryStaff(StaffQueryVO staffQueryVO,Paginator paginator);
    /**
     * 非咨询类实体内债权债务的汇总查询
     * @param assetQueryVO
     * @return
     */
	List<DebtInfo> queryDebt(DebtQueryVO debtQueryVO,Paginator paginator);

    
}
