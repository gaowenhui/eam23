package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.service.ICzSczskBS;
import com.tansun.eam2.zccz.ucc.ICzSczskUCC;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Service
public class CzSczskUCCImpl implements ICzSczskUCC {

	@Autowired
	private  ICzSczskBS czSczskBSImpl;
	
	public List<CzSczsk> getCzSczskByCondition(CzSczsk czSczsk) {
		return czSczskBSImpl.getCzSczskByCondition(czSczsk);
	}
	
	
	
	public ICzSczskBS getCzSczskBSImpl() {
		return czSczskBSImpl;
	}
	public void setCzSczskBSImpl(ICzSczskBS czSczskBSImpl) {
		this.czSczskBSImpl = czSczskBSImpl;
	}

	public List<CzSczskLsb> getCzSczskByDataType(CzSczskLsb lsb,String dataType,String headId) {
		System.out.println("-------------------"+dataType+"------"+headId);
		return czSczskBSImpl.getCzSczskByDataType(lsb,dataType,headId);
	}


	public String delete(CommonBO commonBO) {
		czSczskBSImpl.delete(commonBO);
		return null;
	}

	public CommonBO findById(Class cls,String id) {
		
		return czSczskBSImpl.findById(cls,id);
	}

	public String save(CommonBO commonBO) {
		czSczskBSImpl.save(commonBO);
		return null;
	}

	public List<CzSczskBdxx> getCzSczskBdxxBycldId(String cldId) {
		
		return czSczskBSImpl.getCzSczskBdxxBycldId(cldId);
	}



	public void CopyCzSczsk(String cldId){
		czSczskBSImpl.CopyCzSczsk(cldId);
	}



	public CzSczskLsb getSingle(String id) {
		return czSczskBSImpl.getSingle(id);
	}



	public void deleteXm(CzSczskLsb lsb) {
		// TODO Auto-generated method stub
		
	}



	public void saveCzSczskBdxx(CzSczskBdxx czSczskBdxx) {
		czSczskBSImpl.saveCzSczskBdxx(czSczskBdxx);
		
	}



	public void updatCzSczskBdxx(CzSczskBdxx czSczskBdxx) {
		// TODO Auto-generated method stub
		
	}



	public String update(CommonBO commonBO) {
		czSczskBSImpl.update(commonBO);
		return null;
	}

	
}
