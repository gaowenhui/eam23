package com.tansun.eam2.common.codeService.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class CodeServiceImpl implements ICodeService{

	@Autowired
	public PublicDao publicDao;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	private static String HQL = "from Code c where c.usable = '1' ";
	
	@SuppressWarnings("unchecked")
	public List<Code> findAllByCodeType(String codeType) {
		Object[] params = new Object[]{codeType};
		String hql = HQL + "and c.codeType = ? order by c.orderNumber asc";
		List<Code> list = new ArrayList<Code>();
		Code code = new Code();
		code.setCodeKey("----------！");
		code.setCodeValue("全部");
		list.add(code);
		List<Code> tempList = (List<Code>)this.publicDao.find(hql,params);
		list.addAll(tempList);
		return list;
		 
	}

	@SuppressWarnings("unchecked")
	public List<Code> findByCodeType(String codeType) {
		
		Object[] params = new Object[]{codeType};
		String hql = HQL + "and c.codeType = ? order by c.orderNumber asc";
		return (List<Code>)this.publicDao.find(hql,params);
		
	}

	public Code findByCodeTypeAndCodeKey(String codeType, String codeKey) {

		Object[] params = new Object[]{codeType,codeKey};
		String hql = HQL + "and c.codeType = ? and c.codeKey = ? order by c.orderNumber asc";
		return (Code)this.publicDao.findSingleResult(hql,params);
		
	}

	public Code findCodeById(String id) {
		
		return (Code)this.publicDao.findById(Code.class, id);
		
	}

	public String findCodeValueByCodeTypeAndCodeKey(String codeType,String codeKey) {
		if(StringUtils.isNotEmpty(codeKey)){
			if(this.findByCodeTypeAndCodeKey(codeType, codeKey)!=null){
				return this.findByCodeTypeAndCodeKey(codeType, codeKey).getCodeValue();
			}else{
				return "";
			}	
		}else{
			return "";
		}
		
	}
}
