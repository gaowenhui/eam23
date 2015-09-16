package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.DebtInfoLsb;

public interface ICzStcztzDao extends ICommonBS {

	public CzStcztz getHeadById(String headId);
	
//	public void resetRenyuan(String headId);
	
	public String saveHead(CzStcztz head);
	
	public List<CzStcztz> getHeadListByBianhao(String id,String bianhao);
	
	public CzStcztz updateCzStcztzState(String id, String cldzt);
	
	public void delDebtByIds(String ids);
	
	public List<DebtInfoLsb> getDebtListByCldId(String cldId);
	
	public boolean isHaveDebt(String cldId, String debtId);
	
	public void deleteDebtsByCldId(String cldId, String stid);

}
