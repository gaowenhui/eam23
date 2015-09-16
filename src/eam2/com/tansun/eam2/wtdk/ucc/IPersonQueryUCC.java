package com.tansun.eam2.wtdk.ucc;

import com.tansun.eam2.common.model.orm.bo.WdLnDptInfo;
import com.tansun.eam2.wtdk.vo.OrgQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 人员机构信息
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public interface IPersonQueryUCC {

	/**
	 * 查询机构信息
	 * 
	 * @return
	 */
	public String orgQuery(OrgQueryVO orgVO, Paginator paginator);

	/**
	 * 查询人员信息
	 * 
	 * @return
	 */
	public String perQuery(WdLnDptInfo perVO, Paginator paginator);

	/**
	 * 保存人员信息
	 * 
	 * @param perVO
	 */
	public void savePer(WdLnDptInfo perVO);

	/**
	 * 根据Id查找人员信息
	 * 
	 * @return
	 */
	public WdLnDptInfo findPerInfoById(String id);

	/**
	 * 修改人员信息
	 * 
	 * @param perVO
	 */
	public void updatePer(WdLnDptInfo perVO);

	/**
	 * 删除人员信息
	 * 
	 * @param ids
	 */
	public void deletePerson(String[] ids);

	/**
	 * 根据机构编号查找机构名称
	 * 
	 * @param cmCod
	 * @return
	 */
	public String findDeptByNo(String cmCod);
}
