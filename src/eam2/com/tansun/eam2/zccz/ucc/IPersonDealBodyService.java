package com.tansun.eam2.zccz.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;

public interface IPersonDealBodyService {

	public List<StFsxx> getAllAnZhiPerson(String stId, String sidx, String sord);
	
	public List<CzAzryXx> getAzryByHeadId(String headId, String sidx, String sord);
	
	public List<CzFysrMx> getAzfyByHeadId(String headId, String sidx, String sord);
	
	public List<CzAzryXx> getNewAnZhiPerson(String headId);
	
	public void addAnZhiPerson(String headId, String[] stFsxxIdArray, String stid);
	
	public void delAnZhiPerson(String headId, String ids);
	
	public void modifyAnZhiPersonInfo(CzAzryXx czAzryXx);
	
	public CzAzryXx getAnZhiPersonInfoById(String headId, String czAzryXxId);
	
	public void setPersonAnZhiInfo(String id, String fazfs, String fazfy);
	
	public String addAnZhiFeiyong(String headId, String fyzl, Double yjhf, String beizhu);
	
	public void updateAnZhiFeiyong(String id, String headId, String fyzl, Double yjhf, String beizhu);
	
	public void delAnZhiFeiyong(String ids);
}
