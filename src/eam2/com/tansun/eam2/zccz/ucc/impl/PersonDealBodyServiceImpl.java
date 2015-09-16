package com.tansun.eam2.zccz.ucc.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.zccz.service.IPersonDealBodyDao;
import com.tansun.eam2.zccz.ucc.IPersonDealBodyService;

@Service
public class PersonDealBodyServiceImpl implements IPersonDealBodyService {

	private IPersonDealBodyDao personDao;
	private IEntityService entityDao;
	
	public void addAnZhiPerson(String headId, String[] stFsxxIdArray, String stid) {
		StFsxx fsxx = null;
		List<CzAzryXx> personList = new ArrayList<CzAzryXx>();
		List<String> fsxxIdList = personDao.getFsxxIdListByHeadId(headId);
		StJbxx jbxx = entityDao.viewEntityJbxx(stid);
		for(String id : stFsxxIdArray){
			if(StringUtils.isNotEmpty(id)){
				fsxx = personDao.getStFsxxById(id);
				if(fsxxIdList.contains(fsxx.getId()))
					continue;
				CzAzryXx person = new CzAzryXx();
				person.setCldId(headId);
				person.setStFsxxId(fsxx.getId());
				person.setXingming(fsxx.getFxingming());
				person.setFgddh(fsxx.getFgddh());
				person.setFyddh(fsxx.getFyddh());
				person.setRybh(fsxx.getFrybh());
				person.setStId(fsxx.getStid());
				if(jbxx != null)person.setZcbh(jbxx.getZcbh());
				personList.add(person);
			}
		}
		personDao.addAnZhiPerson(personList);
	}

	public List<CzAzryXx> getAzryByHeadId(String headId, String sidx, String sord) {
		return personDao.getAzryByHeadId(headId, sidx, sord);
	}
	
	public void delAnZhiPerson(String headId, String ids) {
		ids = IdStrFormat.formatIds(ids);
		List<CzAzryXx> personList = personDao.getPersonListByHeadIdAndIds(headId,ids);
		personDao.delAnZhiPerson(personList);
	}

	public List<StFsxx> getAllAnZhiPerson(String stId, String sidx, String sord) {
		List<StFsxx> list =new ArrayList<StFsxx>();
		list = personDao.getAllAnZhiPerson(stId, sidx, sord);
		List<StFsxx> listNew =new ArrayList<StFsxx>();
		for(StFsxx object:list){
			if(object.getFazzt()!="3"){
				listNew.add(object);
			}
		}
		return listNew;
	}


	public List<CzFysrMx> getAzfyByHeadId(String headId, String sidx, String sord) {
		return personDao.getAzfyByHeadId(headId, sidx, sord);
	}
	
	public CzAzryXx getAnZhiPersonInfoById(String headId, String czAzryXxId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<CzAzryXx> getNewAnZhiPerson(String headId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyAnZhiPersonInfo(CzAzryXx czAzryXx) {
		// TODO Auto-generated method stub

	}

	@Autowired
	public void setPersonDao(IPersonDealBodyDao personDao) {
		this.personDao = personDao;
	}

	@Autowired
	public void setEntityDao(IEntityService entityDao) {
		this.entityDao = entityDao;
	}

	/**
	 * 设置安置方式和安置费用
	 */
	public void setPersonAnZhiInfo(String id, String fazfs,
			String fazfy) {
		CzAzryXx person = personDao.getAnZhiPersonInfoById(id);
		person.setFazfs(fazfs);
		person.setFazfy(Double.parseDouble(fazfy));
		personDao.updataPerson(person);
	}

	public String addAnZhiFeiyong(String headId, String fyzl, Double yjhf,
			String beizhu) {
		CzFysrMx feiyong = new CzFysrMx();
		feiyong.setBeizhu(beizhu);
		feiyong.setCldId(headId);
		feiyong.setFyzl(fyzl);
		feiyong.setYjhf(yjhf);
		return personDao.addAnZhiFeiyong(feiyong);
	}
	
	public void updateAnZhiFeiyong(String id, String headId, String fyzl, Double yjhf,
			String beizhu) {
		CzFysrMx feiyong = new CzFysrMx();
		feiyong.setCldId(headId);
		feiyong.setId(id);
		feiyong.setBeizhu(beizhu);
		feiyong.setFyzl(fyzl);
		feiyong.setYjhf(yjhf);
		personDao.updateAnZhiFeiyong(feiyong);
	}

	public void delAnZhiFeiyong(String ids) {
		ids = IdStrFormat.formatIds(ids);
		List<CzFysrMx> feiyongList = personDao.getAnZhiFeiyongByIds(ids);
		personDao.delAnZhiFeiyong(feiyongList);
	}
}
