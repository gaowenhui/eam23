package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.service.IPersonDealBodyDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class PersonDealBodyDaoImpl implements IPersonDealBodyDao {
	
	private PublicDao publicDao;

	public void addAnZhiPerson(List<CzAzryXx> czAzryXxList) {
		for(CzAzryXx person : czAzryXxList){
			publicDao.save(person);
		}
	}

	public void delAnZhiPerson(List<CzAzryXx> personList) {
		for(CzAzryXx person : personList){
			StFsxx ayxx = publicDao.findById(StFsxx.class, person.getStFsxxId());
			ayxx.setFazzt(StglCommon.ST_RENYUANANZHI_WEIANZHI);
			publicDao.update(ayxx);
			publicDao.delete(person);
		}
	}

	public List<StFsxx> getAllAnZhiPerson(String stId, String sidx, String sord) {
		sidx = StringUtils.isEmpty(sidx)?"id":sidx;
		sord = StringUtils.isEmpty(sord)?"Asc":sord;
		String preparedHQL = "from StFsxx o where o.fazzt='0' and o.stid='" + stId + "' and o.sfbc = '1' and o.fxingming is not null order by " + sidx + " " + sord;
		return (List<StFsxx>)publicDao.find(preparedHQL);
	}

	public List<CzAzryXx> getAzryByHeadId(String headId, String sidx, String sord) {
		sidx = StringUtils.isEmpty(sidx)?"id":sidx;
		sord = StringUtils.isEmpty(sord)?"Asc":sord;		
		String hql = "from CzAzryXx o where o.cldId='" + headId + "' order by " + sidx + " " + sord;
		//查询CzAzryXx信息
		List<CzAzryXx> resulList = (List<CzAzryXx>)publicDao.find(hql);
		//遍历resulList<CaAzryXx>
		for(CzAzryXx body : resulList){
			//在CaAzryXx查出FSid
			String FSid = body.getStFsxxId();
			//根据FSid 去StFsxx表里查出所有数据
			String hql1 = "from StFsxx o where o.id ='" + FSid + "'";
			List<StFsxx> resulList2 = (List<StFsxx>)publicDao.find(hql1);
			for(StFsxx fxbody : resulList2){
				//类型转换
				String je = fxbody.getFazfy();
				Double je2 = Double.parseDouble(je);
				body.setFazfy(je2);
				body.setFazfs(fxbody.getFazfs());
				publicDao.save(body);
			}
		}
		String hql3 = "from CzAzryXx o where o.cldId='" + headId + "' order by " + sidx + " " + sord;
		return (List<CzAzryXx>)publicDao.find(hql3);
	}
	
	public List<CzFysrMx> getAzfyByHeadId(String headId, String sidx, String sord) {
		sidx = StringUtils.isEmpty(sidx)?"id":sidx;
		sord = StringUtils.isEmpty(sord)?"Asc":sord;		
		String hql = "from CzFysrMx o where o.cldId='" + headId + "' order by " + sidx + " " + sord;
		return (List<CzFysrMx>)publicDao.find(hql);
	}	
	
	public StFsxx getStFsxxById(String id){
		return (StFsxx)publicDao.findById(StFsxx.class, id);
	}
	
	public CzAzryXx getAnZhiPersonInfoById(String czAzryXxId) {
		return (CzAzryXx)publicDao.findById(CzAzryXx.class, czAzryXxId);
	}

	public List<CzAzryXx> getNewAnZhiPerson(String headId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyAnZhiPersonInfo(CzAzryXx czAzryXx) {
		// TODO Auto-generated method stub
	}

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public List<CzAzryXx> getAnZhiPersonByHeadId(String headId) {
		return (List<CzAzryXx>)publicDao.find("from CzAzryXx o where o.cldId='" + headId + "'");
	}

	public List<String> getFsxxIdListByHeadId(String headId) {
		return (List<String>)publicDao.find("select o.stFsxxId from CzAzryXx o where o.cldId='" + headId + "'");
	}

	public List<CzAzryXx> getPersonListByHeadIdAndIds(String headId, String ids) {
		if(StringUtils.isNotEmpty(ids))
		return (List<CzAzryXx>)publicDao.find("from CzAzryXx o where o.cldId='" + headId + "' and o.id in (" + ids + ")");
		return new ArrayList<CzAzryXx>();
	}

	public List<CzFysrMx> getAnZhiFeiyongBy(String headId) {
		return (List<CzFysrMx>)publicDao.find("from CzFysrMx o where o.cldId='" + headId + "'");
	}

	public void updataPerson(CzAzryXx person){
		publicDao.update(person);
	}

	public String addAnZhiFeiyong(CzFysrMx feiyong) {
		return (String)publicDao.save(feiyong);
	}
	
	public void updateAnZhiFeiyong(CzFysrMx feiyong) {
		publicDao.update(feiyong);
	}

	public List<CzFysrMx> getAnZhiFeiyongByIds(String ids) {
		return (List<CzFysrMx>)publicDao.find("from CzFysrMx o where o.id in (" + ids + ")");
	}

	public void delAnZhiFeiyong(List<CzFysrMx> feiyongList) {
		for(CzFysrMx feiyong : feiyongList){
			publicDao.delete(feiyong);
		}
	}

	public void resetRenyuan(String headId) {
		List<CzAzryXx> oList = (List<CzAzryXx>)publicDao.find("from CzAzryXx o where o.cldId='" + headId + "'");
		for(CzAzryXx o : oList){
			publicDao.delete(o);
		}
	}
}
