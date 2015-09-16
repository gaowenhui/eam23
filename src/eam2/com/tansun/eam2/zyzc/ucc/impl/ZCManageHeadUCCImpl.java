package com.tansun.eam2.zyzc.ucc.impl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zyzc.service.ZCBookQueryService;
import com.tansun.eam2.zyzc.service.ZCManageBodyBS;
import com.tansun.eam2.zyzc.service.ZCManageHeadBS;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.vo.ZySheadVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 
* @author 穆占强
* @date 2010-11-20
* 
*/
@Service
public class ZCManageHeadUCCImpl implements ZCManageHeadUCC{

	@Autowired
	private ZCManageHeadBS zCManageHeadBS;
	@Autowired
	private ZCManageBodyBS zCManageBodyBS;
	@Autowired
	private ZCBookQueryService zCBookQueryBS;
	
	/**
	 * 新增一张单子,数据库中插入一条空记录,得到id
	 * @return
	 */
	public void newHead(ZyShead zyShead){
		zCManageHeadBS.newHead(zyShead);
	}
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * @return
	 */
	public ZyShead readHead(String sheadID){
		return zCManageHeadBS.readHead(sheadID);
	}
	
	/**
	 * 界面上加一个删除按钮,点击后提交. 
	 * @return
	 */
	public void deleteHead(String hid){
		zCManageHeadBS.deleteHead(hid);
	}
	
	/**
	 * 根据表体ID删除一条表体
	 * @return
	 */
	public void deleteBody(String[] bodyIds){
		zCManageHeadBS.deleteBody(bodyIds);
	}
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * @return
	 */
	public ZyShead viewHead(String hid){
		return zCManageHeadBS.viewHead(hid);
	}
	
	/**
	 * 界面上有一个保存按钮,点击以后更新保存到数据库,
	 * @return
	 */
	public void saveHead(ZyShead zyShead){
		zCManageHeadBS.saveHead(zyShead);
	}
	
	/**
	 * 更新head
	 * @param zyShead
	 */
	public void updateHead(ZyShead zyShead) {
		zCManageHeadBS.updateHead(zyShead);
	}
	
	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * @param sheettype 存放查询类型，区分是领用还是借用的
	 * @param dept 存放部门id，作为查询区间
	 * @return 
	 */
	public List<ZySbody> getBodyByDept(String sheettype, String dept){
		return zCManageHeadBS.getBodyByDept(sheettype, dept);
	}
	
	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * 
	 * @param sheettype
	 *            存放查询类型，区分是领用还是借用的
	 * @param dept
	 *            存放部门id，作为查询区间
	 * @return
	 */
	public List<ZySbody> getBodyByDeptWithoutGRSQDBodyId(String sheettype, String dept,Paginator paginator) {
		return zCManageHeadBS.getBodyByDeptWithoutGRSQDBodyId(sheettype, dept,paginator);
	}

	/**
	 * 归还物品，同时将归还信息记录台账，并且更新资产表
	 * @param zyShead
	 */
	public void goodReturn(ZyShead zyShead){
		zCManageHeadBS.saveHead(zyShead);
		zCManageHeadBS.saveBodyToBook(zyShead.getSheadId());
		zCManageHeadBS.refreshZc(zyShead.getSheadId());
	}	
	
	/**
	 * 流程结束后将表单录入台账
	 * @return
	 */
	public void zcBodyToBook(String sheadId, String sheettype){
		Date date = new Date();
		List<ZySbody> bodyList = zCManageBodyBS.readBodyByHeadID(sheadId);
		ZyShead head = zCManageHeadBS.readHead(sheadId);
		Iterator iterator = bodyList.iterator();
		while(iterator.hasNext()){
			ZySbody body = (ZySbody)iterator.next();
			// 通过三级分类来获得当前资产的在库数量
			Double kcsl = zCManageBodyBS.getKcsl(body.getSjflbm());
			ZyKctz book = new ZyKctz();
			if("tostock".equals(sheettype)){
				// 变动原因
				book.setBdyy(head.getCgyj());
				// 备注
				book.setBz(head.getYtxq());
				// 出库数量
				book.setCksl(Double.valueOf(0));
				// 入库数量
				book.setRksl(body.getSl());
				// 库存数量
				book.setKcsl(kcsl + body.getSl());
				// 对应单据号
				book.setDjh(head.getSheetId());
				// 对应单据类型
				book.setDjlx(head.getSheetType());
				// 记帐日期时间
				book.setRq(date);
				
				// 
				book.setSysUpdateTime(date);
				// 
				book.setSysUpdateUser(head.getSysUpdateUser());
				// 备注
				book.setTzzt(body.getBz1());
				// ZC_ID
				book.setZcId(body.getZcId());
				
			} else if("dept_consuming".equals(sheettype)){
				// 变动原因
				book.setBdyy(head.getCgyj());
				// 备注
				book.setBz(head.getYtxq());
				// 出库数量
				book.setCksl(body.getSl());
				// 入库数量
				book.setRksl(Double.valueOf(0));
				// 库存数量
				book.setKcsl(kcsl - body.getSl());
				// 对应单据号
				book.setDjh(head.getSheetId());
				// 对应单据类型
				book.setDjlx(head.getSheetType());
				// 领用部门编码
				book.setLybmbm(head.getNgbmbh());
				// 领用部门名称
				book.setLybmmc(head.getNgbmmc());
				// 领用借用人编号
				book.setLyrbh(head.getNgrbh());
				// 领用借用人名称
				book.setLyrmc(head.getNgrmc());
				// 领借用日期
//				book.setLyrq(head.getNgrq());
				// 记帐日期时间
				book.setRq(date);
				// 
				book.setSysUpdateTime(date);
				// 
				book.setSysUpdateUser(head.getSysUpdateUser());
				// 备注
				book.setTzzt(body.getBz1());
				// ZC_ID
				book.setZcId(body.getZcId());
				
			}else if("dept_borrow".equals(sheettype)){
				// 变动原因
				book.setBdyy(head.getCgyj());
				// 备注
				book.setBz(head.getYtxq());
				// 出库数量
				book.setCksl(body.getSl());
				// 入库数量
				book.setRksl(Double.valueOf(0));
				// 库存数量
				book.setKcsl(kcsl - body.getSl());
				// 对应单据号
				book.setDjh(head.getSheetId());
				// 对应单据类型
				book.setDjlx(head.getSheetType());
				// 借用部门编码
				book.setJybmbm(head.getNgbmbh());
				// 借用部门名称
				book.setJybmmc(head.getNgbmmc());
				// 借用到期日期
//				book.setJydqrq(head.getNgrq() + body.getJyts());
				// 领用借用人编号
				book.setLyrbh(head.getNgrbh());
				// 领用借用人名称
				book.setLyrmc(head.getNgrmc());
				// 领借用日期
//				book.setLyrq(head.getNgrq());
				// 记帐日期时间
				book.setRq(date);
				// 是否续借
				book.setSfxj("0");
				// 是否最新记录
				book.setSfzxjl(Long.valueOf(1));
				// 
				book.setSysUpdateTime(date);
				// 
				book.setSysUpdateUser(head.getSysUpdateUser());
				// 备注
				book.setTzzt(body.getBz1());
				// ZC_ID
				book.setZcId(body.getZcId());
				
			}else if("reborrow".equals(sheettype)){
				ZyKctz zyKctz = new ZyKctz();
				// 根据资产ID获得最新的台账
				book = zCBookQueryBS.findZyKctz(body.getZcId());
				if(zyKctz.getSfxj().equals("1")){
					// 改为领用
					book.setSfxj("0");
					// 借用到期日期
					book.setJydqrq(null);
					// 借用部门编码
					book.setJybmbm("");
					// 借用部门名称
					book.setJybmmc("");
					// 领用部门编码
					book.setLybmbm(head.getNgbmbh());
					// 领用部门名称
					book.setLybmmc(head.getNgbmmc());
					// 领用借用人编号
					book.setLyrbh(head.getNgrbh());
					// 领用借用人名称
					book.setLyrmc(head.getNgrmc());
					// 领借用日期
//					book.setLyrq(head.getNgrq());
					// 记帐日期时间
					book.setRq(date);
				}else{
					// 是否续借
					book.setSfxj("1");
					book.setSfzxjl(Long.valueOf(1));
					// 借用到期日期
//					book.setJydqrq(head.getNgrq() + body.getJyts());
					// 记帐日期时间
					book.setRq(date);
				}
			}else if("reborrow".equals(sheettype)){
				// 变动原因
				book.setBdyy(head.getCgyj());
				// 备注
				book.setBz(head.getYtxq());
				// 出库数量
				book.setCksl(Double.valueOf(0));
				// 入库数量
				book.setRksl(Double.valueOf(0));
				// 库存数量
				book.setKcsl(kcsl);
				// 对应单据号
				book.setDjh(head.getSheetId());
				// 对应单据类型
				book.setDjlx(head.getSheetType());
				// 借用部门编码
				book.setJybmbm(head.getNgbmbh());
				// 借用部门名称
				book.setJybmmc(head.getNgbmmc());
//				// 借用到期日期
//				book.setJydqrq(head.getNgrq() + body.getJyts());
				// 领用借用人编号
				book.setLyrbh(head.getNgrbh());
				// 领用借用人名称
				book.setLyrmc(head.getNgrmc());
//				// 领借用日期
//				book.setLyrq(head.getNgrq());
				// 记帐日期时间
				book.setRq(date);
				// 是否续借
				book.setSfxj("1");
				// 是否最新记录
				book.setSfzxjl(Long.valueOf(1));
				// 
				book.setSysUpdateTime(date);
				// 
				book.setSysUpdateUser(head.getSysUpdateUser());
				// 备注
				book.setTzzt(body.getBz1());
				// ZC_ID
				book.setZcId(body.getZcId());
				
			}
			zCBookQueryBS.saveBook(book);
		}
		
	}

	public ZCManageHeadBS getZCManageHeadBS() {
		return zCManageHeadBS;
	}

	public void setZCManageHeadBS(ZCManageHeadBS manageHeadBS) {
		zCManageHeadBS = manageHeadBS;
	}
	
	/**
	 * 查询head表中已通过审批的采购单的ID
	 * @return
	 */
	public String [] obtainHeadId(){
		return zCManageHeadBS.obtainHeadId();
	}
	
	/**
	 * 根据VO中
	 * @param headVO
	 * @return
	 */
	public List<ZyShead> obtainHeadList(ZySheadVO headVO){
		return zCManageHeadBS.obtainHeadList(headVO);
	}
	
	public void print(String headId, HttpServletRequest request, HttpServletResponse response){
		zCManageHeadBS.print(headId,  request,  response);
	}
	
	/**
	 * 把采购单作为办理依据
	 * @param headId
	 * @param applyId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String applyId){
		return zCManageHeadBS.getBLYJByHeadId(headId, applyId);
	}
}
