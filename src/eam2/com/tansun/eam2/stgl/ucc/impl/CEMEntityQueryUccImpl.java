package com.tansun.eam2.stgl.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.stgl.service.ICEMEntityQueryService;
import com.tansun.eam2.stgl.ucc.ICEMEntityQueryUcc;
import com.tansun.eam2.stgl.vo.AssetQueryVO;
import com.tansun.eam2.stgl.vo.DebtQueryVO;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;
import com.tansun.eam2.stgl.vo.ZCXXQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class CEMEntityQueryUccImpl implements ICEMEntityQueryUcc {
	@Autowired
	ICEMEntityQueryService cEMEntityQueryServiceImpl;
	/**
	 * 资产信息查询
	 */
	public List<QueryResultVO> queryAsset(AssetQueryVO assetQueryVO,Paginator paginator) {
		return cEMEntityQueryServiceImpl.queryAsset(assetQueryVO,paginator);
	}
	/**
	 * 人员信息查询
	 */
	public List<QueryResultVO> queryStaff(StaffQueryVO staffQueryVO,Paginator paginator) {
		return cEMEntityQueryServiceImpl.queryStaff(staffQueryVO,paginator);
	}
	/**
	 * 债权债务信息查询
	 */
	public List<DebtInfo> queryDebt(DebtQueryVO debtQueryVO,Paginator paginator) {
		return cEMEntityQueryServiceImpl.queryDebt(debtQueryVO,paginator);
	}

	public ICEMEntityQueryService getCEMEntityQueryServiceImpl() {
		return cEMEntityQueryServiceImpl;
	}

	public void setCEMEntityQueryServiceImpl(
			ICEMEntityQueryService entityQueryServiceImpl) {
		cEMEntityQueryServiceImpl = entityQueryServiceImpl;
	}
	public List<QueryResultVO> queryAsset(ZCXXQueryVO queryVO,Paginator paginator) {
		// TODO Auto-generated method stub
		 return cEMEntityQueryServiceImpl.queryAsset(queryVO,paginator);
	}
	
}
