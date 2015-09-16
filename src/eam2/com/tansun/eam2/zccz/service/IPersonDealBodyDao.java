package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;

public interface IPersonDealBodyDao {

	/**
	 * 取得实体内所有未安置人员
	 * @param stId
	 * @return
	 */
	public List<StFsxx> getAllAnZhiPerson(String stId, String sidx, String sord);
	
	/**
	 * 根据处理单id取得本次安置人员
	 * @param headId
	 * @return
	 */
	public List<CzAzryXx> getAzryByHeadId(String headId, String sidx, String sord);
	
	public List<CzFysrMx> getAzfyByHeadId(String headId, String sidx, String sord);
	
	public List<CzAzryXx> getNewAnZhiPerson(String headId);
	
	public void addAnZhiPerson(List<CzAzryXx> czAzryXxList);
	
	public void delAnZhiPerson(List<CzAzryXx> personList);
	
	public void modifyAnZhiPersonInfo(CzAzryXx czAzryXx);
	
	public CzAzryXx getAnZhiPersonInfoById(String czAzryXxId);
	
	/**
	 * 根据实体附属信息id查询实体附属信息
	 * @param id
	 * @return
	 */
	public StFsxx getStFsxxById(String id);
	
	/**
	 * 根据headid取得本次安置的人员列表
	 * @param headId
	 * @return
	 */
	public List<CzAzryXx> getAnZhiPersonByHeadId(String headId);
	
	/**
	 * 根据headid取得本次安置的费用列表
	 * @param headId
	 * @return
	 */
	public List<CzFysrMx> getAnZhiFeiyongBy(String headId);
	
	public void resetRenyuan(String headId);
	
	public List<String> getFsxxIdListByHeadId(String headId);
	
	public List<CzAzryXx> getPersonListByHeadIdAndIds(String headId, String ids);
	
	public void updataPerson(CzAzryXx person);
	
	public String addAnZhiFeiyong(CzFysrMx feiyong);
	
	public void updateAnZhiFeiyong(CzFysrMx feiyong);
	
	public List<CzFysrMx> getAnZhiFeiyongByIds(String ids);
	
	public void delAnZhiFeiyong(List<CzFysrMx> feiyongList);
}
