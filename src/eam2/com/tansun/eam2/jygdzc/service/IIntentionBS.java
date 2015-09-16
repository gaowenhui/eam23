package com.tansun.eam2.jygdzc.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.JjzcGctbXx;
import com.tansun.eam2.common.model.orm.bo.JjzcTbgcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;
import com.tansun.eam2.common.model.orm.bo.JyzcZlBgmx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.JyzlLedgerVO;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.eam2.jygdzc.vo.JyzlXxBodyVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface IIntentionBS extends ICommonBS {

	/**
	 * 保存新增卡片表头
	 * @param caShead
	 */
	public void save(CommonBO commonBO );
	public void update(CommonBO commonBO);
	public void delete(CommonBO commonBO);
	/**
	 * 根据查询条件 查出相应租赁信息
	 * @param jyzlQueryVO
	 * @return
	 */
	public List<JyzlViewVO> getJyzlViewVOByCondition(JyzlQueryVO jyzlQueryVO ,Paginator paginator);
	
	public List<JyzlViewVO> getJyzlViewVOByCondition(String idStr);
	/**
	 * 根据表头ID 查出相应表体信息
	 * @param id
	 * @return
	 */
	public List<JyzlXxBodyVO> getJyzlBodyVOByHeadId(String id ,Paginator paginator);
	/**
	 * 根据资产ID 查询出一条JyzcXxVO 数据
	 * @param zcId
	 * @return
	 */
	public JyzcXxVO getJyzcXxVOByzcId(String zcId);
	/**
	 * 根据经营租赁ID查出租赁变更明细信息
	 * @param zlId
	 * @return
	 */
	public List<JyzcZlBgmx> getJyzcZlBgmxByzlId(String zlId);
	/**
	 * 根据租赁表ID 查询出相应的资产ID
	 * @param zlId
	 * @return
	 */
	public String getZcIdByzlId(String zlId);
	/**
	 * 根据资产ID在JyzcJyzlXx查询相应的租赁信息
	 * @param zcId
	 * @return
	 */
	public List<JyzcJyzlXx> getJyzcJyzlXxByzcId(String zcId);
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public JyzcJyzlLsb jyzc2Body(JyzcJyzlXx jyzcJyzlXx);
	/**
	 * 比对租赁表和租赁临时表不同 并将其记录到RECORDHISTORY中
	 * @param body
	 * @param card
	 */
	public void compareZlXxVsZlXxLsb(JyzcJyzlXx jyzlXx, JyzcJyzlLsb jyzlLsb);
	/**
	 * 根据处理单ID 取出变动记录
	 * @param pkId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryBypkId(String pkId,String zlXxId, Paginator paginator);
	/**
	 * 根据处理单ID 查出投保固产表信息
	 * @return
	 */
	public List<JjzcGctbXx> getJjzcGctbXxBycldId(String cldId);
	/**
	 * 根据投保ID和投保类别取出投保资产详细信息
	 * @param cldId
	 * @return
	 */
	public List<AssetBodyVO> getJyzcXxBytbId(String tbId,String tblb);
	/**
	 * 根据处理单ID 找出符合条件的投保固产信息
	 * @param cldId
	 * @return
	 */
	public List<JjzcTbgcXx> getJjzcTbgcXxBycldId(String cldId);
	/**
	 * 根据投保ID 投保类别 查询投保资产ID
	 * @param tbId
	 * @param tblb
	 * @return
	 */
	public List getZcIdByTbIdAndTblb(String tbId,String tblb);
	/**
	 * 根据资产ID 投保ID 找出相应的投保固产信息
	 * @param cldId
	 * @param zcId
	 * @return
	 */
	public JjzcTbgcXx getJjzcTbgcXxBytbIdAndzcId(String tbId,String zcId);
	/**
	 * 根据资产ID 查询JJZC_HT_BX 中 该资产ID 对应数据（可能多条）中 合同开始日期为1年之内（一条）的 SFHJ 列 的值 
	 * @return SFHJ 值 
	 */
	public double getSfhjByzcId(String zcId);
	/**
	 * 根据资产ID 查询该资产挂接的卡片中 卡片类型为房屋及建筑物 和在建工程的 卡片  取出 卡片的原币原值 做累加 返回累加值
	 * @return
	 */
	public double getYbyzByzcId(String zcId);
	/**
	 * 根据资产ID 查询该资产挂接的卡片中 卡片类型为在建工程的 卡片  取出 卡片的原币原值 做累加 返回累加值
	 * @return
	 */
	public double getZjgcYbyzByzcId(String zcId);
	/**
	 * 生成台账
	 * @param cldId
	 * @return
	 */
	public String createBookBycldId(String cldId);
	/**
	 * 根据经营租赁ID查出租赁临时表信息
	 * 
	 * @param zlId
	 * @return
	 */
	public List<JyzcJyzlLsb> getJyzcJyzlLsbByhtId(String htId, String cldId);
	
	/**
	 * 修改后的租赁变更比对方法
	 * @param jyzlLsb
	 */
	public void compareZlXxVsHTXx(JyzcJyzlLsb jyzlLsb);
	/**
	 * 根据条件查询租赁台账
	 * 
	 * @param 
	 * @return
	 */
	public List<JyzlLedgerVO> getJyzlLedgerVOByCondition(JyzlLedgerVO jyzlLedgerVO , Paginator paginator);
}
