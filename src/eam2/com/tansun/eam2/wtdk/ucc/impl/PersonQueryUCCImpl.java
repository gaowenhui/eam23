package com.tansun.eam2.wtdk.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.WdLnDptInfo;
import com.tansun.eam2.wtdk.service.IPersonQueryBS;
import com.tansun.eam2.wtdk.ucc.IPersonQueryUCC;
import com.tansun.eam2.wtdk.vo.OrgQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 人员机构信息
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
@Service
public class PersonQueryUCCImpl implements IPersonQueryUCC {
	@Autowired
	private IPersonQueryBS personQueryBSImpl;

	/**
	 * 查询机构信息
	 * 
	 * @return
	 */
	public String orgQuery(OrgQueryVO orgVO, Paginator paginator) {
		return personQueryBSImpl.orgQuery(orgVO, paginator);
	}

	/**
	 * 查询人员信息
	 * 
	 * @return
	 */
	public String perQuery(WdLnDptInfo perVO, Paginator paginator) {
		return personQueryBSImpl.perQuery(perVO, paginator);
	}

	/**
	 * 保存人员信息
	 * 
	 * @param perVO
	 */
	public void savePer(WdLnDptInfo perVO) {
		personQueryBSImpl.savePer(perVO);
	}

	/**
	 * 根据Id查找人员信息
	 * 
	 * @return
	 */
	public WdLnDptInfo findPerInfoById(String id) {
		return personQueryBSImpl.findPerInfoById(id);
	}

	/**
	 * 修改人员信息
	 * 
	 * @param perVO
	 */
	public void updatePer(WdLnDptInfo perVO) {
		personQueryBSImpl.updatePer(perVO);
	}

	/**
	 * 删除人员信息
	 * 
	 * @param ids
	 */
	public void deletePerson(String[] ids) {
		personQueryBSImpl.deletePerson(ids);
	}

	/**
	 * 根据机构编号查找机构名称
	 * 
	 * @param cmCod
	 * @return
	 */
	public String findDeptByNo(String cmCod) {
		return personQueryBSImpl.findDeptByNo(cmCod);
	}
}
