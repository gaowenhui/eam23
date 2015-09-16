package com.tansun.eam2.zccz.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface IItemShUCC {

	public void updateCzXmxxLsbById(String id);//修改处置项目状态。把分类变为7即：意见汇总完毕
	public CzXmxxLsbVO findCzXmxxById(String id);
	
	public CzXmxxLsb findCzXmxxLsbById(String id);
	
	public CzCztzfaXx findFaxxById(String id);
	
	public List<CzZcXx> findCzzcByCldId(String cldId);
	
	public void saveCzXmxxLsb(CzXmxxLsbVO czXmxxLsbVO);
	
	public List<CzXmSpwYj> findYjByItemId(String id);
	
	public void saveSummarySugg(CzXmxxLsb czXmxxLsb);
	
	public String findItemIdByCldId(String cldId);
	
	public CommonBO getHeadByIdAndFeilei(String cldId, String feilei);
	
	public void updateScheadId(CzXmxxLsb czXmxxLsb);
	
	public CzHyxx findHyxxById(String id);
	
	public int getTzwyCount();
}
