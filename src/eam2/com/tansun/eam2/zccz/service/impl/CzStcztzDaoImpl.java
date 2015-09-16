package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.DebtInfoLsb;
import com.tansun.eam2.zccz.service.ICzStcztzDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import java.util.Map;

@Repository
public class CzStcztzDaoImpl extends CommonBSImpl implements ICzStcztzDao {

	private PublicDao publicDao;
	
	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	
	public String saveHead(CzStcztz head) {
		if(StringUtils.isEmpty(head.getId())){
			return (String)publicDao.save(head);
		}
		publicDao.saveOrUpdate(head);
		return null;
	}

	public CzStcztz getHeadById(String id) {
		if(StringUtils.isNotEmpty(id))
			return (CzStcztz)publicDao.findById(CzStcztz.class, id);
		return null;
	}

	//根据处理单编号查询历史办理记录
	@SuppressWarnings("unchecked")
	public List<CzStcztz> getHeadListByBianhao(String id,String bianhao) {
		CzStcztz head = getHeadById(id);
		List params = new ArrayList();
		params.add(bianhao);
		if(head.getFblsj() == null){
			params.add(new Date());
		}else{
			params.add(head.getFblsj());
		}
		List<CzStcztz> headList = (List<CzStcztz>)publicDao.find("from CzStcztz o where o.bianhao=? and o.fblsj<? order by o.fblsj desc",params);
		if(headList != null){
			return headList;
		}
		return new ArrayList<CzStcztz>();
	}

	public CzStcztz updateCzStcztzState(String id, String cldzt){
		CzStcztz czStcztz = this.getHeadById(id);
		czStcztz.setCldzt(cldzt);
		publicDao.update(czStcztz);
		return czStcztz;
	}

	public void delDebtByIds(String ids) {
		if(StringUtils.isNotEmpty(ids))
			publicDao.updateBySql("delete from DEBT_INFO_LSB where id in (" + ids + ")");
	}

	@SuppressWarnings("unchecked")
	public List<DebtInfoLsb> getDebtListByCldId(String cldId) {
		if(StringUtils.isNotEmpty(cldId))
			return (List<DebtInfoLsb>)publicDao.find("from DebtInfoLsb d where d.cldId=?", new String[]{cldId});
		return null;
	}

	public boolean isHaveDebt(String cldId, String debtId) {
		if(publicDao.find("from DebtInfoLsb d where d.cldId=? and d.zqxxId=?", new String[]{cldId,debtId}).size() != 0)
			return true;
		return false;
	}

	public void deleteDebtsByCldId(String cldId, String stid) {
		publicDao.updateBySql("delete from DEBT_INFO_LSB where CLD_ID=? and ZWRID=?", 
			new String[]{cldId, stid});
	}

}
