package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IAssetDealBodyBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
@Service
public class AssetDealBodyBSImpl extends CommonBSImpl implements IAssetDealBodyBS{
	
	@Autowired
	private PublicDao publicDao;
	
	@Autowired
	private IAssetBS assetBSImpl;

	/**
	 * 根据资产ids保存选择的资产信息到处置资产信息表CZ_ZC_XX
	 * 同时修改资产的状态为处置审批中
	 * 同时修改处置单中的统计信息，账面原值，账面净值，预计损失率
	 * @param ids
	 */
	public void saveJyzcByIds(String[] ids,String cldId, String assetType) {
		//账面原值
		Double zmyz = 0d;
		//账面净值
		Double zmjz = 0d;
		for(int i = 0;i <ids.length;i++){
			CzZcXx temp = this.findJyzcbyAssetId(ids[i], cldId, assetType);
			zmyz += temp.getAzmyz();
			zmjz += temp.getAzmjz();
			//保存处置资产信息
			this.save(temp);
		}
		//处理单信息
		CzCztzfaXx czCztzfaXx = (CzCztzfaXx)this.findById(CzCztzfaXx.class, cldId);
		czCztzfaXx.setZmyz(zmyz);
		czCztzfaXx.setZmjz(zmjz);
		//预计损失率
		if(zmyz != 0 && czCztzfaXx.getYjssje() != null){
			Double loseRate = czCztzfaXx.getYjssje()/zmyz;
			czCztzfaXx.setYjssl("" + (Math.round(loseRate * 10000)/10000d));
		}
		//修改处理单信息
		this.saveOrUpdate(czCztzfaXx);
	}

	private CzZcXx findJyzcbyAssetId(String id,String cldId, String assetType){
		CzZcXx result = new CzZcXx();
		JyzcXx jyzcXx = (JyzcXx)this.findById(JyzcXx.class, id);
		result.setId(java.util.UUID.randomUUID().toString());
		//处理单id
		result.setCldId(cldId);
		//资产类别
		result.setZclb(assetType);
		//资产id
		result.setAzcid(jyzcXx.getId());
		//资产编号
		result.setAzcbh(jyzcXx.getZcbh());
		//资产名称
		result.setAzcmc(jyzcXx.getZcmc());
		//资产类型 资产类型:不动产、交通运输设备、设备及其他  见数据字典表
		result.setAcZclx(jyzcXx.getCZclx());
		//卡片信息列表
		List<Cardinfo> cardList = this.assetBSImpl.getCardInfoByZczsbId(jyzcXx.getId());
		//账面原值
		Double originalValue = 0d;
		//账面净值
		Double accountValue = 0d;
		for(int i = 0;i < cardList.size();i++){
			Cardinfo temp = cardList.get(i);
			if(!StringUtils.equals("03",temp.getState())){
				if(temp.getYbyz() != null){
					originalValue += temp.getYbyz();
				}
				if(temp.getJvalue() != null){
					accountValue += temp.getJvalue();
				}
			}
		}
		result.setAzmyz(originalValue);
		result.setAzmjz(accountValue);
		//评估值
		Double estimateValue = this.getEstimateValueByZcId(jyzcXx.getId());
		result.setApgjz(estimateValue);
		//查询主卡片
		Cardinfo mainCardinfo = this.assetBSImpl.getMainCardByZczsbId(jyzcXx.getId());
		if(mainCardinfo != null){
			//设置主卡片编号
			result.setAzkpbh(mainCardinfo.getCardcode());
			//设置主卡片名称
			result.setAzkpmc(mainCardinfo.getZcname());
		}
		//当前上会次数
		long times = this.getMeetingTimesByZcId(id,ZcczCommon.MANAGE_FIXED_ASSEET);
		//设置状态为未审批
		result.setZhuangtai(ZcczCommon.FORM_HAVE_NOT_APPROVED);
		result.setDqshcs(times);
		result.setCCzfs(ZcczCommon.ZC_DISPOSE_TYPE_GKPM);
		//资产权属
		result.setCZcqs(jyzcXx.getCZcqs());
		return result;
	}

	/**
	 * 根据自用资产ids保存选择的自用资产信息到处置资产信息表CZ_ZC_XX
	 * 同时修改资产的状态为处置审批中
	 * 同时修改处置单中的统计信息，账面原值，账面净值，预计损失率
	 * @param ids
	 */
	public void saveZyzcByIds(String[] ids,String cldId) {
		for(int i = 0;i < ids.length;i++){
			CzZcXx temp = this.findZyzcAssetId(ids[i], cldId);
			//保存处置资产信息
			this.save(temp);
		}
	}

	/**
	 * 查询自用资产信息
	 * @param id
	 * @param cldId
	 * @return
	 */
	private CzZcXx findZyzcAssetId(String id,String cldId){
		CzZcXx result = new CzZcXx();
		ZyZc zyzc = (ZyZc)this.findById(ZyZc.class, id);
		result.setId(java.util.UUID.randomUUID().toString());
		//处理单id
		result.setCldId(cldId);
		//资产类别
		result.setZclb(ZcczCommon.ZYZC_ASSET);
		//资产id
		result.setZyzcid(zyzc.getZcId());
		//资产编号
		result.setZyzcbh(zyzc.getZcbh());
		//资产名称
		result.setZyzcmc(zyzc.getZcmc());
		//自用资产卡片编号
		result.setZykpbh(zyzc.getKpbh());
		result.setZykpmc(this.getCardNameByCode(zyzc.getKpbh()));
		//自用资产财产原值
		result.setZyccyz(zyzc.getCzyz());
		//自用资产保管地点
		result.setZybgdd(zyzc.getBgdd());
		//当前上会次数
		long times = this.getMeetingTimesByZcId(id,ZcczCommon.ZYZC_ASSET);
		//设置状态为未审批
		result.setZhuangtai(ZcczCommon.FORM_HAVE_NOT_APPROVED);
		result.setDqshcs(times);
		result.setCCzfs(ZcczCommon.ZC_DISPOSE_TYPE_GKPM);
		return result;
	}

	private String getCardNameByCode(String code){
		String hql = "from Cardinfo o where o.cardcode = ?";
		Object[] params = new Object[]{code};
		Cardinfo cardinfo = (Cardinfo)this.publicDao.findSingleResult(hql, params);
		if(cardinfo != null){
			return cardinfo.getZcname();
		}else{
			return null;
		}
	}
	/**
	 * 根据资产id和资产类别ZCLB获得资产上会次数
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private long getMeetingTimesByZcId(String zcId,String zclb){
		long times = 0;
		String sql = "";
		if(ZcczCommon.MANAGE_FIXED_ASSEET.equals(zclb)){
			sql = "select count(*) times from CZ_ZC_XX t where t.AZCID = '" + zcId + "' and t.ZHUANGTAI = '2'";
		}
		if(ZcczCommon.ENTITY_ASSET.equals(zclb)){
			sql = "select count(*) times from CZ_ZC_XX t where t.BFSXXID = '" + zcId + "'and t.ZHUANGTAI = '2'";
		}
		if(ZcczCommon.LOAN_PLEDGE.equals(zclb)){
			sql = "select count(*) times from CZ_ZC_XX t where t.BFSXXID = '" + zcId + "'and t.ZHUANGTAI = '2'";
		}
		if(ZcczCommon.ZYZC_ASSET.equals(zclb)){
			sql = "select count(*) times from CZ_ZC_XX t where t.ZYZCID = '" + zcId + "'and t.ZHUANGTAI = '2'";
		}
		List list = new ArrayList();
		List resultList = this.publicDao.queryForList(sql,list);
		if(resultList != null && resultList.size() > 0){
			HashMap map = (HashMap)resultList.get(0);
			times = ((BigDecimal)map.get("times")).longValue();
		}
		return times;
	}

	/**
	 * 根据资产id，获取资产最新的评估价值
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Double getEstimateValueByZcId(String zcId) {
		ZcPgXx zcPgXx = null;
		Double estimateValue = null;
		String hql = "select o from ZcPgXx o where o.zcid = ? order by o.pgjzr desc";
		Object[] params = new Object[]{zcId};
		List<ZcPgXx> list = (List<ZcPgXx>)this.publicDao.find(hql, params);
		if(list != null && list.size() > 0){
			zcPgXx = list.get(0);
			estimateValue = zcPgXx.getPingguzhi();
		}
		return estimateValue;
	}

	@SuppressWarnings("unchecked")
	public List<CzZcXx> viewBody(String cldId, String zclb) {
		String hql = "select o from CzZcXx o where o.cldId = ? and o.zclb = ?";
		Object[] params = new Object[]{cldId,zclb};
		List<CzZcXx> list = (List<CzZcXx>)this.publicDao.find(hql, params);
		return list;
	}
	public List<CzZcXx> viewBodyFY(String cldId,String zclb,List list,Paginator paginator){
		String hql = "from CzZcXx o where o.cldId = ? and o.zclb = ? order by o.id";
//		Object[] params = new Object[]{cldId,zclb};
		List<String> params = new ArrayList<String>();
		params.add(cldId);
		params.add(zclb);
//		List<CzZcXx> list2 = (List<CzZcXx>)this.publicDao.find(hql, params);
		PageableList pageableList  = publicDao.queryByHQLWithPaginator(hql, params, paginator);
		List<CzZcXx> returnList = new ArrayList<CzZcXx>();
		for(CzZcXx cz : (List<CzZcXx>)pageableList.getResults()){
			CzZcXx czZcXx = new CzZcXx();
			try {
				BeanUtils.copyProperties(czZcXx, cz);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			returnList.add(czZcXx);
		}
	
		return returnList;
	}
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public IAssetBS getAssetBSImpl() {
		return assetBSImpl;
	}

	public void setAssetBSImpl(IAssetBS assetBSImpl) {
		this.assetBSImpl = assetBSImpl;
	}

	public void deleteBody(String[] ids) {
		for(int i = 0;i < ids.length;i++){
			CzZcXx temp = this.publicDao.findById(CzZcXx.class, ids[i]);
			this.publicDao.delete(temp);
		}
	}
	
	/**
	 * 根据资产ids保存选择的实体内资产信息到处置资产信息表CZ_ZC_XX
	 * @param ids 实体附属信息id
	 * @param cldId 处理单id
	 * @param zclb 实体内资产类别
	 * @return
	 */
	public boolean saveEntityByIds(String[] ids, String cldId, String zclb,String stid) {
		for(String id:ids){
			CzZcXx czZcXx = this.findCzZcXxById(id, zclb, stid,cldId);
			//保存处置资产信息
			this.save(czZcXx);
		}
		return true;
	}
	
	/**
	 * 根据实体附属信息表id和实体内资产类别，查询出处置资产信息对象。
	 * @param id
	 * @param zclb
	 * @return
	 */
	private CzZcXx findCzZcXxById(String id,String zclb,String stid,String cldId){
		/*
		String ST_INFO_TUDI = "7";			  //7：(实体资产)土地
		String ST_INFO_FANGWU = "8";		  //8：(实体资产)房屋
		String ST_INFO_JIXIESHEBE = "9";	  //9：(实体资产)机械设备
		String ST_INFO_JIAOTONGYUNSHU = "10"; //10：交通运输
		String ST_INFO_DUIWAITOUZI = "11";    //11：对外投资
		String ST_INFO_QITAZICHAN = "12";	  //12：其他资产
		*/
		CzZcXx resultVO = new CzZcXx();
		StFsxx stFsxx = this.publicDao.findById(StFsxx.class, id);
		StJbxx stJbxx = this.publicDao.findById(StJbxx.class, stid);
		resultVO.setBstid(stid);
		resultVO.setCldId(cldId);
		resultVO.setBfsxxid(id);
		resultVO.setBstmc(stJbxx.getStzwmc());
		resultVO.setStlx(stJbxx.getStlx());
		resultVO.setBpgz(this.findEstimateValueByFsxxId(id, stid));  //评估值
		resultVO.setZclb(ZcczCommon.ENTITY_ASSET);
		resultVO.setDqshcs(this.getMeetingTimesByZcId(id, ZcczCommon.ENTITY_ASSET));
		if(StglCommon.ST_INFO_TUDI.equals(zclb)){
			resultVO.setBzcbh(stFsxx.getJtdbh());      //土地编号     
			resultVO.setBzcmc(stFsxx.getJtdmc());      //土地名称
			resultVO.setBstzclx(StglCommon.ST_INFO_TUDI);
			resultVO.setBsjzyr(stFsxx.getJsjzyr());     //实际占有人
		}
		if(StglCommon.ST_INFO_FANGWU.equals(zclb)){  	//房屋
			resultVO.setBzcbh(stFsxx.getKfwbh());	   //房屋编号
			resultVO.setBzcmc(stFsxx.getKfwmc());      //房屋名称
			resultVO.setBstzclx(StglCommon.ST_INFO_FANGWU);
			resultVO.setBsjzyr(stFsxx.getKfwsjzyr());   //实际占有人
			resultVO.setBcfwz(stFsxx.getKfwdz());     //房屋位置
		}
		if(StglCommon.ST_INFO_JIXIESHEBE.equals(zclb)){   //机械设备
			resultVO.setBzcbh(stFsxx.getMsbbh());             
			resultVO.setBzcmc(stFsxx.getMsbmc());      
			resultVO.setBstzclx(StglCommon.ST_INFO_JIXIESHEBE);
			resultVO.setBsjzyr(stFsxx.getMsbsjzyr());
			resultVO.setBcfwz(stFsxx.getMsbcfwz()); 
		}	
		if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(zclb)){   //交通运输
			resultVO.setBzcbh(stFsxx.getLjtgjbh());             
			resultVO.setBzcmc(stFsxx.getLcph());      
			resultVO.setBstzclx(StglCommon.ST_INFO_JIAOTONGYUNSHU);
			resultVO.setBsjzyr(stFsxx.getLsjzyr());
			resultVO.setBcfwz(stFsxx.getLjtgjcfwz()); 
		}	
		if(StglCommon.ST_INFO_QITAZICHAN.equals(zclb)){   //其他资产
			resultVO.setBzcbh(stFsxx.getPqtzcbh());             
			resultVO.setBzcmc(stFsxx.getPqtzcmc());      
			resultVO.setBstzclx(StglCommon.ST_INFO_QITAZICHAN);
			resultVO.setBsjzyr(stFsxx.getPqtzcsjzyr());
			resultVO.setBsjzyr(stFsxx.getPqtzccfwz());
		}	
		resultVO.setCCzfs(ZcczCommon.ZC_DISPOSE_TYPE_GKPM);
		return resultVO;
	}
	
	@SuppressWarnings("unchecked")
	private Double findEstimateValueByFsxxId(String id,String stid){
		Double estimateValue = 0d;
		String hql = "from ZcPgXx o where o.stfsxxid = ? and o.stid = ? order by o.pgjzr desc";
		Object[] params = new Object[]{id,stid};
		List<ZcPgXx> list = (List<ZcPgXx>)this.publicDao.find(hql, params);
		if(list != null && list.size() > 0){
			estimateValue = list.get(0).getPingguzhi();
		}
		return estimateValue;
	}

	public boolean saveLoanByIds(String[] ids, String cldId, String zclb,String loanNo) {
		for(String id:ids){
			CzZcXx czZcXx = this.findCzZcXxLoanById(id, zclb, loanNo,cldId);
			//保存处置资产信息
			this.save(czZcXx);
		}
		return true;
	}
	
	/**
	 * 根据实体附属信息表id和委托贷款抵债物资产类别，查询出处置资产信息对象。
	 * @param id
	 * @param zclb 
	 * @return
	 */
	private CzZcXx findCzZcXxLoanById(String id,String zclb,String loanNo,String cldId){
		/*
		String ST_INFO_TUDI = "7";			  //7：(实体资产)土地
		String ST_INFO_FANGWU = "8";		  //8：(实体资产)房屋
		String ST_INFO_JIXIESHEBE = "9";	  //9：(实体资产)机械设备
		String ST_INFO_JIAOTONGYUNSHU = "10"; //10：交通运输
		String ST_INFO_DUIWAITOUZI = "11";    //11：对外投资
		String ST_INFO_QITAZICHAN = "12";	  //12：其他资产
		*/
		CzZcXx resultVO = new CzZcXx();
		StFsxx stFsxx = this.publicDao.findById(StFsxx.class, id);
		resultVO.setCdkzh(loanNo);
		resultVO.setCldId(cldId);
		resultVO.setBfsxxid(id);
		resultVO.setCpgz(this.findEstimateValueByLoanNo(id, loanNo));  //评估值
		resultVO.setZclb(ZcczCommon.LOAN_PLEDGE);               //委贷抵债物
		resultVO.setDqshcs(this.getMeetingTimesByZcId(id, ZcczCommon.LOAN_PLEDGE));
		if(StglCommon.ST_INFO_TUDI.equals(zclb)){
			resultVO.setCzcbh(stFsxx.getJtdbh());      //土地编号     
			resultVO.setCzcmc(stFsxx.getJtdmc());      //土地名称
			resultVO.setCzclx(StglCommon.ST_INFO_TUDI);
			resultVO.setCsjzyr(stFsxx.getJsjzyr());     //实际占有人
		}
		if(StglCommon.ST_INFO_FANGWU.equals(zclb)){  	//房屋
			resultVO.setCzcbh(stFsxx.getKfwbh());	   //房屋编号
			resultVO.setCzcmc(stFsxx.getKfwmc());      //房屋名称
			resultVO.setCzclx(StglCommon.ST_INFO_FANGWU);
			resultVO.setCsjzyr(stFsxx.getKfwsjzyr());   //实际占有人
			resultVO.setCcfwz(stFsxx.getKfwdz());     //房屋位置
		}
		if(StglCommon.ST_INFO_JIXIESHEBE.equals(zclb)){   //机械设备
			resultVO.setCzcbh(stFsxx.getMsbbh());             
			resultVO.setCzcmc(stFsxx.getMsbmc());      
			resultVO.setCzclx(StglCommon.ST_INFO_JIXIESHEBE);
			resultVO.setCsjzyr(stFsxx.getMsbsjzyr());
			resultVO.setCcfwz(stFsxx.getMsbcfwz()); 
		}	
		if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(zclb)){   //交通运输
			resultVO.setCzcbh(stFsxx.getLjtgjbh());             
			resultVO.setCzcmc(stFsxx.getLcph());      
			resultVO.setCzclx(StglCommon.ST_INFO_JIAOTONGYUNSHU);
			resultVO.setCsjzyr(stFsxx.getLsjzyr());
			resultVO.setCcfwz(stFsxx.getLjtgjcfwz()); 
		}	
		if(StglCommon.ST_INFO_QITAZICHAN.equals(zclb)){   //其他资产
			resultVO.setCzcbh(stFsxx.getPqtzcbh());             
			resultVO.setCzcmc(stFsxx.getPqtzcmc());      
			resultVO.setCzclx(StglCommon.ST_INFO_QITAZICHAN);
			resultVO.setCsjzyr(stFsxx.getPqtzcsjzyr());
			resultVO.setCcfwz(stFsxx.getPqtzccfwz());
		}	
		resultVO.setCCzfs(ZcczCommon.ZC_DISPOSE_TYPE_GKPM);
		return resultVO;
	}
	
	@SuppressWarnings("unchecked")
	private Double findEstimateValueByLoanNo(String id,String loanNo){
		Double estimateValue = 0d;
		String hql = "from ZcPgXx o where o.stfsxxid = ? and o.dkzh = ? order by o.pgjzr desc";
		Object[] params = new Object[]{id,loanNo};
		List<ZcPgXx> list = (List<ZcPgXx>)this.publicDao.find(hql, params);
		if(list != null && list.size() > 0){
			estimateValue = list.get(0).getPingguzhi();
		}
		return estimateValue;
	}
	
	//============拟稿环节环节以后，如果删除表体中选择的资产需要触发的操作=====================	
	/**
	 * 需要修改处置资产信息CZ_ZC_XX表中状态为流程作废
	 * 根据处置资产类别，修改相应资产状态为未处置
	 * @param cldId
	 */
	public void modifyBodyStateDel(String cldId){
		// step1:修改 处置资产信息表中状态为已审批
		String strsql = "Update CZ_ZC_XX Set ZHUANGTAI = ? " + " Where CLD_Id = ?";
		List<String> params = new ArrayList<String>();
		params.add(ZcczCommon.ASSET_BE_DELETED);        //设置状态为删除
		params.add(cldId); // 处理单ID
		this.publicDao.updateBySql(strsql, params);
		
		// step2:修改相应资产的状态为未处置5
		this.modifyTablesZCZT(cldId,"5");
	}
	
	private void modifyTablesZCZT(String cldId, String status) {
		List params = new ArrayList();
		String strsql = "";
		String hsql = "from CzZcXx where cldId = ?";
		params = new ArrayList();
		params.add(cldId);
		List bolist = this.publicDao.find(hsql, params);
		int i = 0;
		for (i = 0; i < bolist.size(); i++) {
			CzZcXx bo = (CzZcXx) bolist.get(i);
			if (bo != null) {
				// 根据bo所对应的资产类型,来更新不同的对应数据表
				if (bo.getZclb().equals("0")) {// 经营型资产
					strsql = "Update JYZC_XX Set C_ZCZC= ? " // CODE表中定义资产状态3代表处置审批中
							+ " Where ID=?";
					params = new ArrayList();
					params.add(status);
					params.add(bo.getAzcid()); // 对应经营型固定资产ID
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}
				if (bo.getZclb().equals("1")) {// 实体内资产
											   //土地状态,房屋状态,设备状态,交通工具,其他
					strsql = "Update ST_FSXX Set JTDZT = ?, " + " KFWZT = ? ,"
							+ " LJTGJZT = ?, " + " MSBZT = ?,"
							+ " PZCZT = ? " + " Where Id = ?";
					params = new ArrayList();
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(bo.getAzcid()); // 对应实体内资产Id
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}

				if (bo.getZclb().equals("2")) {// 委贷抵债物,也保存在实体附属信息表中
					strsql = "Update ST_FSXX Set JTDZT = ?, " + " KFWZT = ? ,"
							+ " LJTGJZT = ?, " + " MSBZT = ?,"
							+ " PZCZT = ? " + " Where Id = ?";
					params = new ArrayList();
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(status);
					params.add(bo.getAzcid()); // 对应委贷抵债物
					this.publicDao.updateBySql(strsql, params); // 执行SQL命令
					continue;
				}
			}
		}
	}

	public List<CzZcXx> checkAddAssetIdsForTip(String cldId,String zclb,String[] ids) {
		return null;
	}

	@SuppressWarnings("unchecked")
	public String[] checkAssetIdsForAdd(String cldId,String zclb,String[] ids) {
		if(ids == null || ids.length == 0){
			return null;
		}
		String addIds = "";
		for(String id :ids){
			String hql = "";
			//经营性固定资产
			if(StringUtils.indexOfAny(zclb, new String[]{
					ZcczCommon.MANAGE_FIXED_ASSEET,
					ZcczCommon.DEALING_ASSET,
					ZcczCommon.ENTRUST_ASSET
			}) != -1){
				hql = "from CzZcXx o where o.zclb = ? and o.cldId = ? and o.azcid = ?";
			}else if(ZcczCommon.ENTITY_ASSET.equals(zclb) || ZcczCommon.LOAN_PLEDGE.equals(zclb)){
				hql = "from CzZcXx o where o.zclb = ? and o.cldId = ? and o.bfsxxid = ?";
			}else if (StringUtils.equals(ZcczCommon.STOCK, zclb)){
				hql = "from CzZcXx o where o.zclb = ? and o.cldId = ? and o.fzqId = ?";
			}else if (StringUtils.equals(ZcczCommon.ZYZC_ASSET, zclb)){
				hql = "from CzZcXx o where o.zclb = ? and o.cldId = ? and o.zyzcid = ?";
			}
			Object[] params = new Object[]{zclb,cldId,id};
			List<CzZcXx> queryResult = (List<CzZcXx>)this.publicDao.find(hql, params);
			if(queryResult == null || queryResult.size() == 0){
				addIds += id + ",";
			}
		}
		if(addIds.trim().length() > 0){
			addIds = addIds.substring(0,addIds.length() - 1);
			return addIds.split(",");
		}
		return null;
	}
	
	public void saveZqByIds(String[] ids, String cldId, String assetType) {
		for(int i = 0;i <ids.length;i++){
			CzZcXx temp = this.zqToCzZcXx(ids[i], cldId, assetType);
			//保存处置资产信息
			this.save(temp);
		}
	}

	private CzZcXx zqToCzZcXx(String id, String cldId, String assetType){
		StockInfo stock = publicDao.findById(StockInfo.class, id);
		CzZcXx czzcxx = new CzZcXx();
		czzcxx.setCldId(cldId);
		czzcxx.setZclb(assetType);
		czzcxx.setFzqId(stock.getId());
		czzcxx.setFzqxmId(stock.getXmId());
		czzcxx.setFzqxmmc(stock.getXmmc());
		czzcxx.setJhfhid(stock.getJhfhid());
		czzcxx.setJhfhbm(stock.getJhfhbm());
		czzcxx.setJhfhmc(stock.getJhfhmc());
		czzcxx.setZqzlid(stock.getZqzlid());
		czzcxx.setZqzlbm(stock.getZqzlbm());
		czzcxx.setZqzlmc(stock.getZqzlmc());
		czzcxx.setZqmc(stock.getZqmc());
		czzcxx.setDqr(stock.getDqr());
		czzcxx.setCCzfs(ZcczCommon.ZC_DISPOSE_TYPE_GKPM);
		return czzcxx;
	}

	public void updateBodyCzfs(String id, String czfs) {
		publicDao.updateBySql("update CZ_ZC_XX set C_CZFS=? where ID=?",new String[]{czfs,id});
	}
}
