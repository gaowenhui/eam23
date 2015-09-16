package com.tansun.eam2.jygdzc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtBxzcgx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzjLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqxBody;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.vo.ClearQueryVO;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxHtView;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzcHtqxBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO2;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

public interface IContractBS {
	public String getHtlxName(String strKey);
	public void deleteJjzcHtBx(String ids);

	public JjzcHtqsHead getJjzcHtqsHeadById(String id);
	
	/**
	 * 得到
	 * @param cldId
	 * @return
	 */
	public List<JyzcHtqxBodyVO> getBodyByCldId(String cldId);
	/**
	 *租赁合同 委管合同
	 * JJZC_HT_JDZJ
	 * 保存JjzcHtZlwgLsb的数据 && 保存JjzcHtJdzj的数据
	 * @param caShead
	 */
	public void saveJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb);
	

	/**
	 *保存车险的数据
	 * JJZC_HT_JDZJ
	 * 保存JJZC_HT_BX的数据
	 * @param caShead
	 */
	public void saveJjzcHtBBxC(JjzcHtBx jjzcHtBx);
	/**
	 *保险合同资产关系表-----------保存非车险的数据  //不用管表里的关于资产的信息
	 * JJZC_HT_BXZCGX
	 * @param caShead
	 */
	public void saveJjzcHtBBxFc(JjzcHtBxzcgx jjzcHtBxzcgx);
	
	/**
	 * 删除JjzcHtZlwgLsb的信息 同时删除挂接的JjzcHtJdzj的数据
	 * @param wgIds
	 */
	public void deleteJjzcHtZlwgLsb(String[] wgIds);
	
	
	/**
	 * JJZC_HT_JDZJ
	 * 修改JjzcHtZlwgLsb的数据 && 修改JjzcHtJdzj的数据
	 * @param caShead
	 */
	public void updateJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb);
	
	//变动
	/**
	 * 将合同保险转换到临时表里
	 * @param jjzcHtBx
	 * @return
	 */
	public JjzcHtZlwgLsb jjzcHtBx2Body(JjzcHtZlwg jjzcHtBx);
	
	/**
	 * 添加一条数据 JjzcHtZlwg 
	 * @param jjzcHtZlwg 
	 */
	public void saveJjzcHtZlwg(JjzcHtZlwg jjzcHtZlwg);
	
	/**
	 * 
	 * 得到资产的变动信息
	 * @param JjzcHtZlwglsb
	 * @param jjzcHtZlwg
	 * @return
	 */
	public JjzcHtBx getChangeInfo(JjzcHtZlwgLsb JjzcHtZlwglsb,JjzcHtZlwg jjzcHtZlwg);
	/**
	 * 根据资产ID 资产LX查询合同信息
	 * @param zcId
	 * @param zcLx
	 * @return
	 */
	public List<JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLxforAsset(String zcId, String zcLx);
	/**
	 * 根据id得到合同变动信息
	 * @param wgId
	 * @return
	 */
	public List<JjzcHtBx> getJjzcHtBxsByWgId(String wgId);
	/**
	 * 根据委管合同Id得到经营资产信息
	 * @param wgId
	 * @return
	 */
	public List<JyzcXx> getJyzcXxByWgId(String wgId);
	//得到清算信息
	/**
	 * 根据委管合同Id得到经营资产信息
	 * @param wgId
	 * @return
	 */
	public List<JyzcXx> getJyzcQsByWgId(String wgId);
	//public JjzcHtZlwgLsb jjzcHtBx2Body(JjzcHtBx jjzcHtBx);
	/**
	 * JjzcHtZlwgLsb 得到委管合同的临时表信息 
	 * 
	 * @param id
	 * @return
	 */
	public JjzcHtZlwgLsb getJjzcHtZlwgLsbById(String id);
	
	
	/**
	 * 
	 * 根据合同保险的查询条件查询
	 * 需要根据合同的类型来作区分 如果合同类型类型没有值的话 要查出来委管合同和保险的信息项
	 *                       如果是委管合同 委管合同的情况 需要查出来 JJZC_HT_ZLWG
     ×                         如果是车险合同 非车险合同的情况 需要查出来 JJZC_HT_BX
	 * @param queryBO  查询条件组成的bo对象
	 * @return   展示查询出来的view对象
	 */
	public String getJjzcHtBxHtViewByCondition(JjzcHtBxQueryVO queryBO ,Paginator paginator);
	
	// 根据id查找 属于合同和保险的信息
	public List<JjzcHtBxHtView> getJjzcHtBxHtViewByCondition(JjzcHtBxQueryVO queryVo,String ids);
//////////////////////////////清算////////////////////////////////////////////////////
	public String getJjzcHtViewByCondition(ClearQueryVO queryvo ,Paginator paginator);
	
	public List<ClearQueryVO> getJjzcHtViewByCondition(String ids);
	
	public List<JyzcHtqxBody> getByCldId(String cldId);
	public void saveJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead);
	public void updateJjzcHtqsHead(JjzcHtqsHead jjzcHtqsHead);
	public JjzcHtqsHead updateJjzcHtqsHead(String id);
	
	/**
	 * 根据id得到一条记录
	 * @param id
	 * @return
	 */
	public JjzcHtZlwgLsb getById(String id);
	public void saveJyzchtJdzj(List<JjzcHtJdzjLsb> list);
	
	/**
	 * 得到headId下的JyzlBodyVO ----从JyzcJyzlLsb
	 * @param headId
	 * @return
	 */
	public  List<JyzlBodyVO> getJyzlBodyVOByCldId(String headId);
	
	/**
	 *  得到headId下的JyzlBodyVO ----和 JyzcHtBX表里查
	 * @param headId
	 * @return
	 */
	public List<JyzlBodyVO2> getJyzlBodyVO2ByCldId(String headId);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public JjzcHtZlwg getJjzcHtZlwgById(String id);
	
	public void deleteJjzcHtZlwgLsb(String id);

	/**
	 * 根据资产ID和资产类型 查询出相应的合同List
	 * @param zcId
	 * @param zcLx
	 * @return
	 */
	public List <JjzcHtZlwg> getJjzcHtZlwgByzcIdandzcLx(String zcId ,String zcLx);
	public List <JjzcHtBx> getJjzcHtBxByzcId(String zcId);
	//add by lantianbo 查询委管合同
	public String getJjzcHtBxHtViewByCondition(String sheettype, JjzcHtBxQueryVO queryVO, Paginator paginator);
	/**
	 * 展现选择的合同列表
	 * @return
	 */
	public List queryChooseHtListByIds(String[] htIds,String headId);

	/**
	 * 展现选择的合同列表,清算查询里的录入实收页面
	 * @return
	 */
	public List queryChooseHtListByIds1(String[] htIds,String headId);
	public JjzcHtZlwg getJjzcHtZlwgByHtbh(String contractId);

	public List getJjzcHtJdzjByHtId(String id);
	
	public JyzcHtqsBody getJyzcHtqsBodyById(String id);
	
	public void update(CommonBO bo);
	
	public String getSszj(String headId, String htbh, String bodyId, String qsjzrq);

	public void saveSszj(String[] qsjzrqs, String[] yszjs, String[] sszjs,
			String[] bodyIds);

	public void deleteBody(String ids);

	public ClearQueryVO getClearQueryVOById(String id);
	// 根据合同ID查询变动信息
	public List<Recordhistory> getBianDongByHtId(String htId);
	//根据合同ID查询清算信息
	public List<JjzcHtqsHead> getQingSuanByHtId(String htId);
	//拷贝合同临时表信息到正式表
	public void saveLsb2Zsb_HtZlwg(JjzcHtZlwg jjzcHtZlwg,JjzcHtZlwgLsb  jjzcHtZlwgLsb);
	//得到租赁委管临时表的信息
	public List<JjzcHtZlwgLsb> getByHeadId(String cldId);
	// 得到状态是执行中的  并且合同的到期时间 那么更改合同的状态    ___________返回list
	public  List<JjzcHtZlwgLsb> getJjzcHtZlwgLsb();
	public  List<JjzcHtBx> getJjzcHtBx();


	public JjzcHtBx getByJjzcHtBxsId(String id);

	
	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public void updateInfoToBody(String headId,String[] qsjzrqs, String[] yszjs,String[] qstzje,
			String[] xghyszj,String[] tzyy,String[] htbh,String[] qsksrq,String[]bodyIds,String[]mzq);

	/**
	 * 根据bodyId保存清算截至日期，应收资金，到body表中
	 * @param qsjzrqs  清算截至日期
	 * @param yszjs 应收资金
	 * @param bodyIds 
	 */
	public String validateHt(String headId, String htIds);

	/**
	 * 锁合同
	 * @param headId
	 */
	public void lockContrat4Liquidate(String headId);

	/**
	 * 算总钱数
	 * @param headId
	 */
	public void countTotal(JjzcHtqsHead head);
	
	/**
	 * 查询清算body列表
	 * @param headid
	 * @return
	 */
	public List<JyzcHtqsBody> getBodyListByHeadId(String headid);
	/**
	 * 根据body和card对比出卡片的变化信息，并存到变动表里，
	 * @param body
	 * @param card
	 * @return
	 * 
	 */
	@SuppressWarnings("unchecked")
	public void compareHtVsBody(JjzcHtZlwgLsb body, JjzcHtZlwg htzl);
	/**
	 * 根据id查询保险合同信息
	 * @param Id
	 * @return
	 */
	public JjzcHtBx getJjzcHtBxById(String id) ;
	/**
	 * 根据合同类型，合同id(lsb) 查出合同关联的资产
	 * @return
	 */
	public String getZc4Ht(String htId, String htlx);
	/**
	 * 根据合同类型，合同id(zsb) 查出合同关联的资产
	 * @return
	 */
	public List getZc4HtInfo(String htId, String htlx);
	/**
	 * 根据合同id，选择的资产id 删除资产与合同之间的关系
	 */
	public void deleteZc4Ht(String htId, String zcIds,String htlx);
	
	/**
	 * 根据合同id，选择的资产id 合同类型 关联资产与合同之间的关系
	 * @param htId
	 * @param zcIds
	 * @param htlx
	 */
	public void getZcList(String htId, String zcIds, String htlx);
	/**
	 * 删除一条或多条合同临时表信息
	 * @param htIds
	 */
	public void deleteBodys(String[] htIds);
	/**
	 * 根据合同id，分段租金数据保存分段租金数据
	 * @param id
	 * @param ksrqs
	 * @param jsrqs
	 * @param yzjs
	 */
	public void updateJdzjByHtId(String id, String[] ksrqs, String[] jsrqs,
			String[] yzjs);
	
	/**
	 * 根据合同id查询分段租金列表
	 * @param htId
	 * @return
	 */
	public List getJdzjList(String htId);
	/**
	 * 根据合同正式表id查询分段租金列表
	 * @param htId
	 * @return
	 */
	public List getzsbJdzjList(String htId);
	
	/**
	 * 终止合同
	 * @param htId
	 * @param jjzcHtZlwgLsb
	 */
	public void zhongzhiContract(String htId, JjzcHtZlwgLsb jjzcHtZlwgLsb);
	
	/**
	 * //对合同的变动信息进行记录
	 * @param jjzcHtZlwgLsb
	 */
	public void saveRecordhistory(JjzcHtZlwgLsb jjzcHtZlwgLsb);
	/**
	 * 流程办结并生成台账
	 * @param headId
	 * @return
	 */
	public String banjie(String headId);
	/**
	 * 根据合同Id 处理单ID 找出本次变动信息
	 * @param zcId
	 * @param pkId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryByhtId(String htId ,String pkId);
	/**
	 * 根据合同编号查找出历史变动信息
	 * @param zcId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryByhtbh(String htbh);
	/**
	 * 根据合同ID 查询相应清算信息
	 * @param htbh
	 * @return
	 */
	public List<JyzcHtqsBody> getJyzcHtqsBodyByhtbh(String htbh );
	
	/**
	 * 页面点击确定后，保存信息，
	 * @return
	 */
	public void updateInfoToBody1(String headId, String[] sszjs,
			String[] bcbdjes, String[] scbdjes, String[] bdyys, String[] bodyIds);
	public List<PTEnd> findMyPTEndList_nopage(String strZcId, String strTitle);
	/**
	 * 根据租赁ID 合同ID 新增合同 租赁数据作为合同数据 租赁流程 作为合同的办理依据
	 * @param zlHeadId
	 * @param htHeadID
	 */
	public void tenancyTOcontract(String zlHeadId ,String htHeadID);
	/**
	 * 根据合同编号 处理单ID 查询相应数据
	 * @param htbh
	 * @param headId
	 * @return
	 */
	public List<JjzcHtZlwgLsb> getJjzcHtZlwgLsbByfxbhAndzcId(String htbh, String headId);
	/**
	 * 根据合同编号 处理单ID 查询相应数据
	 * @param htbh
	 * @param headId
	 * @return
	 */
	public List<JjzcHtBx> getJJjzcHtBxByfxbhAndzcId(String htbh, String headId);
}
