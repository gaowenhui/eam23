package com.tansun.eam2.zyzc.service;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zyzc.vo.ZySheadVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
public interface ZCManageHeadBS{

	/**
	 * 新增一张单子,数据库中插入一条空记录,得到id
	 * @return
	 */
	public void newHead(ZyShead zyShead);
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * @return
	 */
	public ZyShead readHead(String sheadID);
	
	/**
	 * 界面上加一个删除按钮,点击后提交. 
	 * @return
	 */
	public void deleteHead(String hid);
	
	/**
	 * 根据表体ID删除一条表体
	 * @return
	 */
	public void deleteBody(String[] bodyIds);
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * @return
	 */
	public ZyShead viewHead(String hid);
	
	/**
	 * 界面上有一个保存按钮,点击以后更新保存到数据库,
	 * @return
	 */
	public void saveHead(ZyShead zyShead);
	
	/**
	 * 更新head
	 * @param zyShead
	 */
	public void updateHead(ZyShead zyShead);

	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * @param sheettype 存放查询类型，区分是领用还是借用的
	 * @param dept 存放部门id，作为查询区间
	 * @return 
	 */
	public List<ZySbody> getBodyByDept(String sheettype, String dept);
	
	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * 
	 * @param sheettype
	 *            存放查询类型，区分是领用还是借用的
	 * @param dept
	 *            存放部门id，作为查询区间
	 * @return
	 */
	public List<ZySbody> getBodyByDeptWithoutGRSQDBodyId(String sheettype,String dept,Paginator paginator);

	/**
	 * 根据表单信息将归还信息记录入台账
	 * @param sheadId
	 */
	public void saveBodyToBook(String sheadId);
	
	/**
	 * 归还物品，刷新资产表信息
	 * @param sheadId
	 */
	public void refreshZc(String sheadId);
	
	/**
	 * 查询head表中已通过审批的采购单的ID
	 * @return
	 */
	public String [] obtainHeadId();
	
	/**
	 * 根据VO中
	 * @param headVO
	 * @return
	 */
	public List<ZyShead> obtainHeadList(ZySheadVO headVO);

	public void print(String headId, HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 把采购单作为办理依据
	 * @param headId
	 * @param applyId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String applyId);
	
}
