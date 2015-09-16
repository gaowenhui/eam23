package com.tansun.eam2.jygdzc.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.AeMachineEquipment;
import com.tansun.eam2.common.model.orm.bo.AeRealEstate;
import com.tansun.eam2.common.model.orm.bo.AeVehicle;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcPdkpXx;
import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.jygdzc.JygdzcCommon;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.AssetCardVO;
import com.tansun.eam2.jygdzc.vo.AssetCostVO;
import com.tansun.eam2.jygdzc.vo.AssetFlowVO;
import com.tansun.eam2.jygdzc.vo.AssetInfoVO;
import com.tansun.eam2.jygdzc.vo.CheckForCard;
import com.tansun.eam2.jygdzc.vo.HtViewVOZC;
import com.tansun.eam2.jygdzc.vo.JBHCommonVO;
import com.tansun.eam2.jygdzc.vo.JyzcExmineVO;
import com.tansun.eam2.jygdzc.vo.JyzcRiskVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.eam2.jygdzc.vo.QueryVO;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.eam2.ssgl.service.ISsglBS;
import com.tansun.eam2.stgl.vo.CzxxVO;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.file.service.IAttachHandleService;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

@Service
public class AssetBSImpl extends CommonBSImpl implements IAssetBS {

	private static final String String = null;
	@Autowired
	public PublicDao publicDao;
	@Autowired
	public ISsglBS ssglBSImpl;
	@Autowired
	IAttachHandleService attachHandleServiceImpl;
	@Autowired
	private ICardCommonBS cardAddBSImpl;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	/**
	 * 根据处理单ID，在JYZC_XX_LSB表中，查询到符合条件的AssetBodyVO对象
	 * 
	 * @param CldId
	 *            处理单ID
	 * 
	 * @return AssetBodyVO对象的集合
	 */
	public List<AssetBodyVO> getAssetBodyVOById(String CldId ) {
		// 卡片、 资产临时表、 费用
		String hql = "from JyzcXxLsb jyzc where jyzc.cldId = ?";
		List<JyzcXxLsb> list = (List<JyzcXxLsb>) this.getPublicDao().find(hql,
				new Object[] { CldId });
		List<AssetBodyVO> resultList = new ArrayList<AssetBodyVO>();
		for (int i = 0; i < list.size(); i++) {
			AssetBodyVO assetBodyVO = new AssetBodyVO();
			JyzcXxLsb JyzcXxLsb = list.get(i);
			assetBodyVO.copyProperties(JyzcXxLsb);
			assetBodyVO.setId(JyzcXxLsb.getId());
			assetBodyVO.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(String.valueOf(JyzcXxLsb.getCZclx())))));
			assetBodyVO.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",checkString(String.valueOf(JyzcXxLsb.getCZczc())))));//资产状态
			assetBodyVO.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",checkString(String.valueOf(JyzcXxLsb.getCZcdq())))));//地区
			assetBodyVO.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(JyzcXxLsb.getCJyfl()))));
			assetBodyVO.setBdsl(publicDao);
			assetBodyVO.setZlzt(publicDao);
			String zcId = JyzcXxLsb.getId();
			JyzcXx jyzcXx = this.getJyzcXxByzclsbId(zcId);
			if(jyzcXx!=null){
				assetBodyVO.setCardinfo(publicDao,jyzcXx.getId());
				assetBodyVO.setCardinfoList(publicDao,jyzcXx.getId());
			}else{
				assetBodyVO.setCardinfo(publicDao);
				assetBodyVO.setCardinfoList(publicDao);
			}
			assetBodyVO.setSfgjkp();
			if (assetBodyVO.getCardinfo() != null) {
				assetBodyVO.setValuesAboutCard(publicDao);
			}
			resultList.add(assetBodyVO);
		}
		return resultList;
	}
	/**
	 * 根据资产Id 查询挂接在该资产下的卡片信息
	 * 
	 * @param ziId
	 * @return
	 */
	public List<CardAssetHistory> getCardAssetHistoryByZcId(String zcId) {
		List<CardAssetHistory>  CardAssetHistory = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from CardAssetHistory o where o.zcId = ? ";
		CardAssetHistory= (List<CardAssetHistory>) publicDao.find(preparedHQL, params);
		return CardAssetHistory;
	}

	/**
	 * 根据资产临时表Id查找到对应的风险信息
	 * 
	 * @param zcId
	 *            --资产Id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<JyzcRiskLsb> getJyzcRiskLsbByZcId(String zcId ,Paginator paginator) {
		String hql = "from JyzcRiskLsb risk where risk.zcId = ? order by risk.id desc";
		List params = new ArrayList();
		params.add(zcId);
		PageableList pageableList= publicDao.queryByHQLWithPaginator(hql, params, paginator);
		
		List<JyzcRiskLsb> list = (List<JyzcRiskLsb>) pageableList.getResults();
		List<JyzcRiskLsb> resultList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			JyzcRiskLsb jyzcRiskLsb = list.get(i);
			jyzcRiskLsb.setFxzt(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",checkString(String.valueOf(jyzcRiskLsb.getFxzt())))));
			jyzcRiskLsb.setCFxlx(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",checkString(String.valueOf(jyzcRiskLsb.getCFxlx())))));//风险状态
			resultList.add(jyzcRiskLsb);
		}
		return resultList;
	}
	@SuppressWarnings("unchecked")
	public List<JyzcRiskVO> getJyzcRiskLsbByZcIdForView(String zcId ,Paginator paginator) {
		String hql = "from JyzcRiskLsb risk where risk.zcId = ? order by risk.id desc";
		List params = new ArrayList();
		params.add(zcId);
		PageableList pageableList= publicDao.queryByHQLWithPaginator(hql, params, paginator);
		
		List<JyzcRiskLsb> list = (List<JyzcRiskLsb>) pageableList.getResults();
		List<JyzcRiskVO> resultList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			JyzcRiskLsb jyzcRiskLsb = list.get(i);
			JyzcRiskVO jyzcRiskVO = new JyzcRiskVO();
			try {
				BeanUtils.copyProperties(jyzcRiskVO, jyzcRiskLsb);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jyzcRiskVO.setFxzt(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",checkString(String.valueOf(jyzcRiskLsb.getFxzt())))));
			jyzcRiskVO.setCFxlx(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",checkString(String.valueOf(jyzcRiskLsb.getCFxlx())))));//风险状态
			resultList.add(jyzcRiskVO);
		}
		return resultList;
	}
	/**
	 * 根据资产风险临时表Id查找到对应的风险临时信息(对于字典表数据不做转换 用来生成台账表时查询用)
	 * 
	 * @param zcId
	 *            --资产Id
	 * @return
	 */
	public List<JyzcRiskLsb> getJyzcRiskLsbByzclsbId(String zclsbId) {
		String hql = "from JyzcRiskLsb risk where risk.zcId = ?";
		List params = new ArrayList();
		params.add(zclsbId);
		List<JyzcRiskLsb> list = (List<JyzcRiskLsb>) publicDao.find(hql,params);
		//List<JyzcRiskLsb> resultList = new ArrayList();
		return list;
	}
	/**
	 * 根据风险表Id查找到对应的风险信息(对于字典表数据不做转换 用来生成台账表时查询用)
	 * 
	 * @param zcId
	 *            --资产Id
	 * @return
	 */
	public List<JyzcRisk> getJyzcRiskByzczsbId(String zczsbId) {
		String hql = "from JyzcRisk risk where risk.zczsbId = ?";
		List params = new ArrayList();
		params.add(zczsbId);
		List<JyzcRisk> list = (List<JyzcRisk>) publicDao.find(hql,params);
		//List<JyzcRiskLsb> resultList = new ArrayList();
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<JyzcRisk> getJyzcRiskByZcId(String zczsbId ,Paginator paginator) {
		String hql = "from JyzcRisk risk where risk.zczsbId = ? order by risk.id desc";
		List  params = new ArrayList();
		params.add(zczsbId);
		PageableList pageableList=  this.publicDao.queryByHQLWithPaginator(hql,params,paginator);
		List<JyzcRisk> resultList =(List<JyzcRisk>) pageableList.getResults();
		List<JyzcRisk> riskList = new ArrayList();
		for (int i = 0; i < resultList.size(); i++) {
			JyzcRisk jyzcRisk = resultList.get(i);
			jyzcRisk.setFxzt(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",checkString(String.valueOf(jyzcRisk.getFxzt())))));
			jyzcRisk.setCFxlx(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",checkString(String.valueOf(jyzcRisk.getCFxlx())))));//风险状态
			riskList.add(jyzcRisk);
		}
		return riskList;
	}
	public List<JyzcRiskVO> getJyzcRiskByZcIdForView(String zczsbId ,Paginator paginator) {
		String hql = "from JyzcRisk risk where risk.zczsbId = ? order by risk.id desc";
		List  params = new ArrayList();
		params.add(zczsbId);
		PageableList pageableList=  this.publicDao.queryByHQLWithPaginator(hql,params,paginator);
		List<JyzcRisk> resultList =(List<JyzcRisk>) pageableList.getResults();
		
		List<JyzcRiskVO> riskList = new ArrayList();
		for (int i = 0; i < resultList.size(); i++) {
			JyzcRisk jyzcRisk = resultList.get(i);
			JyzcRiskVO jyzcRiskVO = new JyzcRiskVO();
			try {
				BeanUtils.copyProperties(jyzcRiskVO, jyzcRisk);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jyzcRiskVO.setFxzt(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",checkString(String.valueOf(jyzcRisk.getFxzt())))));
			jyzcRiskVO.setCFxlx(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",checkString(String.valueOf(jyzcRisk.getCFxlx())))));//风险状态
			riskList.add(jyzcRiskVO);
		}
		return riskList;
	}
	/**
	 * 根据资产ID 找到相应的费用信息
	 * 
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<JyzcSqsdfyXx> getJyzcSqsdfyXxByZcId(String zcId) {
		if(zcId.startsWith(",")){
			zcId = zcId.substring(1);
		}
		String hql = "from JyzcSqsdfyXx fy where fy.zcId = ?";
		List<JyzcSqsdfyXx> resultList = (List<JyzcSqsdfyXx>) this.publicDao
				.find(hql, new Object[] { zcId });
		return resultList;
	}

	/**
	 * 根据HeadId 查找到所有的值
	 * 
	 * @param headId
	 */
	@SuppressWarnings("unchecked")
	public List<JyzcXxLsb> getJyzcXxLsbsByHeadId(String headId) {
		String hql = "from JyzcXxLsb o where o.cldId = ?";
		List<JyzcXxLsb> ret = (List<JyzcXxLsb>) publicDao.find(hql,
				new String[] { headId });
		return ret;
	}
	/**
	 * 按照资产ID 查询出相应数据
	 * @param aaa
	 * @return
	 */
	public List<JyzcXxVO> getJyzcXxVOByCondition(String ids){
		List<JyzcXxVO> resultList = new ArrayList<JyzcXxVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("select distinct o.ID,o.ZCBH , o.ZCMC , o.C_ZCLX , o.C_JYFL , o.C_ZCZC , o.C_ZCDQ , o.EJDQ ,o.C_YJWTJG , o.C_ERWTJG ,o.ZLZT  from jyzc_xx o where  o.id in ("+IdStrFormat.formatIds(ids)+")");
		sql.append(" order by o.zcbh asc  ");
		List params = new ArrayList();
		List list=publicDao.queryForList(sql.toString(),params);
		// 进行属性拷贝
		try{	
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				JyzcXxVO vo = new JyzcXxVO();
				vo.setId(checkString(map.get("ID")));//ID
				vo.setZcbh(checkString(map.get("ZCBH")));//资产编号
				vo.setZcmc(checkString(map.get("ZCMC")));//资产名称
				//vo.setCZclx(checkString(String.valueOf(map.get("C_ZCLX"))));//资产类型
				vo.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(map.get("C_ZCLX")))));//资产类型
				//vo.setCJyfl(checkString(String.valueOf(map.get("C_JYFL"))));//经营分类
				vo.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(map.get("C_JYFL")))));//经营分类
				vo.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(map.get("C_ZCZC")))));//资产状态
				vo.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("C_ZCDQ")))));//地区
				//vo.setZlzt(checkString(this.findCoteNameByCoteKey("ASSET_RENT_STATE",String.valueOf(map.get("zlzt")))));// 租赁状态
				//vo.setZlzt(checkString(String.valueOf(map.get("zlzt"))));// 租赁状态
				//vo.setZlzt(publicDao);
				vo.setZlzt(viewZlzt(vo.getId()));
				vo.setEjdq(checkString(findCateNameByParentId("department","438",String.valueOf(map.get("EJDQ")))));//二级地区
				//vo.setEjdq(checkString(String.valueOf(map.get("EJDQ"))));//二级地区
				vo.setCYjwtjg(checkString(getIndividualtreeByNodeValue(String.valueOf(map.get("C_YJWTJG")))));//一级委托管理机构
				//vo.setCYjwtjg(checkString(String.valueOf(map.get("C_YJWTJG"))));//一级委托管理机构
				vo.setCErwtjg(checkString(getIndividualtreeByNodeValue(String.valueOf(map.get("C_ERWTJG")))));//二级委托管理机构
				//vo.setCErwtjg(checkString(String.valueOf(map.get("C_ERWTJG"))));//二级委托管理机构
				vo.setCardinfo(publicDao);
				if(vo.getCardinfo()!=null){
					vo.setCardcode(checkString(vo.getCardinfo().getCardcode()));//卡片编号
					vo.setZcname(checkString(vo.getCardinfo().getZcname()));//卡片名称
					vo.setParentid(checkString(this.findCoteNameByCoteKey("CARD_TYPE",String.valueOf(map.get("PARENTID")))));//卡片类型
					vo.setGlbm(publicDao, vo.getCardinfo().getGlbm());
					vo.setSybm(publicDao, vo.getCardinfo().getUsepartment());
				}
				resultList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return resultList;
	}
	/**
	 * 根据经营性固定资产查询VO信息，查找到符合特条件的值
	 * 
	 * @param JyzcXxVO
	 *            查询VO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<JyzcXxVO> getJyzcXxVOByCondition(QueryBO queryBO,Paginator paginator) {
		List params = new ArrayList();
		if (paginator == null || queryBO == null) {
			return null;
		}
		StringBuilder sql = new StringBuilder();
		if((queryBO.getGlbm()!=null&&!"".equals(queryBO.getGlbm())||(queryBO.getSybm()!=null&&!"".equals(queryBO.getSybm())))||(queryBO.getCardcode()!=null&&!"".equals(queryBO.getCardcode()))||(queryBO.getZcname()!=null&&!"".equals(queryBO.getZcname()))||(queryBO.getParentid()!=null&&!"".equals(String.valueOf(queryBO.getParentid()))&&!"0".equals(queryBO.getParentid().toString()))){
			sql.append("select distinct o.ID,o.ZCBH , o.ZCMC , o.C_ZCLX , o.C_JYFL , o.C_ZCZC , o.C_ZCDQ , o.EJDQ ,o.C_YJWTJG , o.C_ERWTJG ,o.ZLZT  from jyzc_xx o, card_asset_history his  , cardinfo  card where o.id = his.ZCZSB_ID(+) and his.KP_ID = card.id(+) and his.DQGJZT = '0'  ");
		}else{
			sql.append("select distinct o.ID,o.ZCBH , o.ZCMC , o.C_ZCLX , o.C_JYFL , o.C_ZCZC , o.C_ZCDQ , o.EJDQ ,o.C_YJWTJG , o.C_ERWTJG ,o.ZLZT  from jyzc_xx o where 1=1");
		}
		//资产编号
		if (queryBO.getZcbh() != null && queryBO.getZcbh().trim().length() > 0) {
			params.add("%" + queryBO.getZcbh() + "%");
			sql.append(" and o.zcbh like ? ");
		}
		// 资产名称
		if (queryBO.getZcmc() != null && queryBO.getZcmc().trim().length() > 0) {
			params.add("%" + queryBO.getZcmc() + "%");
			sql.append(" and o.zcmc like ? ");
		}
		// 资产类型
		if (queryBO.getZclx() != null &&queryBO.getZclx().trim().length() > 0) {
			params.add(  queryBO.getZclx() );
			sql.append(" and o.C_ZCLX = ? ");
		}
		// 资产状态
		if (queryBO.getZczt() != null && queryBO.getZczt().trim().length() > 0) {
			params.add( queryBO.getZczt() );
			sql.append(" and o.C_ZCZC = ? ");
		}
		// 经营分类
		if (queryBO.getJyfl() != null && queryBO.getJyfl().trim().length() > 0) {
			params.add( queryBO.getJyfl() );
			sql.append(" and o.C_JYFL = ? ");
		}
		// 地区
		if (queryBO.getDq() != null && queryBO.getDq().trim().length() > 0) {
			params.add( queryBO.getDq() );
			sql.append(" and o.C_ZCDQ = ? ");
		}
		// 二级分行
		if (queryBO.getEjdq() != null && queryBO.getEjdq().trim().length() > 0) {
			params.add(  queryBO.getEjdq() );
			sql.append(" and o.EJDQ = ? ");
		}
		// 卡片编号
		if (queryBO.getCardcode() != null && queryBO.getCardcode().trim().length() > 0) {
			params.add("%" + queryBO.getCardcode() + "%");
			sql.append(" and card.CARDCODE like ? ");
		}
		// 卡片名称
		if (queryBO.getZcname() != null && queryBO.getZcname().trim().length() > 0) {
			params.add("%" + queryBO.getZcname() + "%");
			sql.append(" and card.ZCNAME like ? ");
		}
		// 卡片类型
		if (queryBO.getParentid() != null &&!"0".equals(queryBO.getParentid().toString())&& String.valueOf(queryBO.getParentid()).trim().length() > 0) {
			params.add(  queryBO.getParentid() );
			sql.append(" and card.PARENTID = ? ");
		}
		// 管理部门
		if (queryBO.getGlbm() != null && queryBO.getGlbm().trim().length() > 0) {
			params.add( queryBO.getGlbm() );
			sql.append(" and card.GLBM = ? ");
		}
		// 使用部门：
		if (queryBO.getSybm() != null && queryBO.getSybm().trim().length() > 0) {
			params.add(  queryBO.getSybm() );
			sql.append(" and card.USEPARTMENT = ? ");
		}
		// 租赁状态
		if (queryBO.getZlzt() != null && queryBO.getZlzt().trim().length() > 0) {
			if(queryBO.getZlzt().equals("1")){
				sql.append(" and exists (select distinct h.zcId from jjzc_ht_zlwg h where h.c_htzt='1' and h.zcid=o.id )");
			}
			else if(queryBO.getZlzt().equals("2")){
				sql.append(" and not exists (select distinct h.zcId from jjzc_ht_zlwg h where h.c_htzt='1' and h.zcid=o.id )");
			}
		}
		// 一级委托管理机构：

		if (queryBO.getYjwtgljg() != null
				&& queryBO.getYjwtgljg().trim().length() > 0) {
			params.add( queryBO.getYjwtgljg() );
			sql.append(" and o.C_YJWTJG = ? ");
		}
		// 二级委托管理机构
		if (queryBO.getEjwtgljg() != null && queryBO.getEjwtgljg().trim().length() > 0 && !"null".equals(queryBO.getEjwtgljg())) {
//			System.out.println("---rjwtgljg-------"+queryBO.getEjwtgljg()+"--------------");
			if("建银实业".equals(queryBO.getEjwtgljg())){
				//建银实业    建银实业人可以看到 资产二级委托管理机构为其他实体下的所有公司的
				sql.append(" and o.C_ERWTJG  in (select b.tid from p_t_dept b where b.par_id='11262' and b.del_flag_cd ='002002') ");
			}else{
				List parmslist =new ArrayList();
				parmslist.add(queryBO.getEjwtgljg());
				List dljgList = publicDao.find(" from PTDeptBO b where b.parId='11262' and b.delFlagCd ='002002' and b.deptName =?", parmslist);
				if(dljgList!=null&&dljgList.size()>0){
					PTDeptBO ptDeptBO  = (PTDeptBO) dljgList.get(0);
					params.add( ptDeptBO.getTid() );
//					System.out.println("--------deptID--------"+ptDeptBO.getTid()+"---------------------");
					sql.append(" and o.C_ERWTJG  = ? ");
				}else{
					params.add( queryBO.getEjwtgljg() );
					sql.append(" and o.C_ERWTJG  = ? ");
				}
				
			}
		}
		if(StringUtils.isNotEmpty(queryBO.getQuanshu())){
			params.add(queryBO.getQuanshu());
			sql.append(" and o.C_ZCQS = ? ");
		}
		if(StringUtils.isNotEmpty(queryBO.getFenlei())){
			params.add("1");
			if(StringUtils.equals("1", queryBO.getFenlei())){
				sql.append("and o.C_JYFL = ?");
			}else{
				sql.append("and o.C_JYFL != ?");
			}
		}
		sql.append(" order by o.zcbh asc  ");
		System.out.println(sql.toString());
		PageableList pageableList =  this.publicDao.queryForList(sql.toString(), params,paginator);
		List queryList = pageableList.getResults();
		List<JyzcXxVO> resultList = new ArrayList<JyzcXxVO>();
		// 进行属性拷贝
		try{	
			for (int i = 0; i < queryList.size(); i++) {
				Map map = (Map) queryList.get(i);
				JyzcXxVO vo = new JyzcXxVO();
				vo.setId(checkString(map.get("ID")));//ID
				vo.setZcbh(checkString(map.get("ZCBH")));//资产编号
				vo.setZcmc(checkString(map.get("ZCMC")));//资产名称
				//vo.setCZclx(checkString(String.valueOf(map.get("C_ZCLX"))));//资产类型
				vo.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(map.get("C_ZCLX")))));//资产类型
				//vo.setCJyfl(checkString(String.valueOf(map.get("C_JYFL"))));//经营分类
				vo.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(map.get("C_JYFL")))));//经营分类
				vo.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(map.get("C_ZCZC")))));//资产状态
				vo.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("C_ZCDQ")))));//地区
				//vo.setZlzt(checkString(this.findCoteNameByCoteKey("ASSET_RENT_STATE",String.valueOf(map.get("zlzt")))));// 租赁状态
				//vo.setZlzt(checkString(String.valueOf(map.get("zlzt"))));// 租赁状态
				//vo.setZlzt(publicDao);
				vo.setZlzt(viewZlzt(vo.getId()));
				vo.setEjdq(checkString(findCateNameByParentId("department","438",String.valueOf(map.get("EJDQ")))));//二级地区
				//vo.setEjdq(checkString(String.valueOf(map.get("EJDQ"))));//二级地区
				//一级委托管理机构
				vo.setCYjwtjg(checkString(getOrgNameById(String.valueOf(map.get("C_YJWTJG")))));//一级委托管理机构
				//vo.setCYjwtjg(checkString(String.valueOf(map.get("C_YJWTJG"))));//一级委托管理机构
				//二级委托管理机构
				vo.setCErwtjg(checkString(getOrgNameById(String.valueOf(map.get("C_ERWTJG")))));//二级委托管理机构
				//vo.setCErwtjg(checkString(String.valueOf(map.get("C_ERWTJG"))));//二级委托管理机构
				vo.setCardinfo(publicDao);
				if(vo.getCardinfo()!=null){
					vo.setCardcode(checkString(vo.getCardinfo().getCardcode()));//卡片编号
					vo.setZcname(checkString(vo.getCardinfo().getZcname()));//卡片名称
					vo.setParentid(checkString(this.findCoteNameByCoteKey("CARD_TYPE",String.valueOf(map.get("PARENTID")))));//卡片类型
					vo.setGlbm(publicDao, vo.getCardinfo().getGlbm());
					vo.setSybm(publicDao, vo.getCardinfo().getUsepartment());
				}
				resultList.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return resultList;
	}
	//判断资产是否在租
	public Boolean sfzz(String zcId) {
		/* 查询合同，根据租赁合同的合同开始日期进行判断该资产当前的租赁状态 */
		// 租赁合同key 2,合同状态为 执行中 0
		try{	
			String hql = "from JjzcHtZlwg o where o.CHtlx = '2' and o.CHtzt ='1' and o.zcid = ?";
			List params = new ArrayList();
			params.add(zcId);
			List<JjzcHtZlwg> ht = (List<JjzcHtZlwg>) publicDao.find(hql, params);
	//		Object[] params = new Object[] { this.getId() };
	//		JjzcHtZlwg ht = (JjzcHtZlwg) publicDao.findSingleResult(hql, params);
			if (ht != null && ht.size()>0) {
				return true;
			} else { 
				//String zt = "在租";
	//			for(int i=0;i<ht.size();i++){
	//				
	//				JjzcHtZlwg zlwg = ht.get(i);
	//				if (zlwg.getHtdqrq().after(new Date())) {
	//				// 合同结束日期和当前日期进行判断
	//					zt = "在租";
	//				} 
	//			}
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	public String viewZlzt(String zcId) {
		/* 查询合同，根据租赁合同的合同开始日期进行判断该资产当前的租赁状态 */
		// 租赁合同key 2,合同状态为 执行中 0
		try{
		String hql = "from JjzcHtZlwg o where o.CHtlx = '2' and o.CHtzt ='1' and o.zcid = ?";
		List params = new ArrayList();
		params.add(zcId);
		List<JjzcHtZlwg> ht = (List<JjzcHtZlwg>) publicDao.find(hql, params);
//		Object[] params = new Object[] { this.getId() };
//		JjzcHtZlwg ht = (JjzcHtZlwg) publicDao.findSingleResult(hql, params);
		if (ht != null && ht.size()>0) {
			return "在租";
		} else { 
//			for(int i=0;i<ht.size();i++){
//				
//				JjzcHtZlwg zlwg = ht.get(i);
//				if (zlwg.getHtdqrq().after(new Date())) {
//				// 合同结束日期和当前日期进行判断
//					zt = "在租";
//				} 
//			}
			return "空闲";
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "aaa";
	}
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public JyzcXxLsb jyzc2Body(JyzcXx jyzcXx) {
		JyzcXxLsb jyzcXxLsb = new JyzcXxLsb();
		try {
			BeanUtils.copyProperties(jyzcXxLsb, jyzcXx);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return jyzcXxLsb;
	}
	/**
	 * 
	 * 把信息表里的数据复制到临时表
	 * @return
	 */
	public void copyAtoB(CommonBO dest ,CommonBO orig) {
			try {
				BeanUtils.copyProperties(dest, orig);
			} catch (IllegalAccessException e) {
			
				e.printStackTrace();
			} catch (InvocationTargetException e) {
			
				e.printStackTrace();
			}
	}
	public List getLsbIdByzsbId(String zsbId){
		List zclsbId = new ArrayList();
		JyzcXx jyzcXx= (JyzcXx) this.findById(JyzcXx.class, zsbId);
		if(jyzcXx!=null){
			List<JyzcXxLsb> jyzcLsbList = this.getJyzcXxLsbByzcbh(jyzcXx.getZcbh());
			for(int i=0;i<jyzcLsbList.size();i++){
				JyzcXxLsb jyzcXxLsb = jyzcLsbList.get(i);
				zclsbId.add(jyzcXxLsb.getId());
			}
		}
		return zclsbId;
	}
	public List<JyzcXxLsb> getJyzcXxLsbByzcbh(String zcbh){
		List resultList = new ArrayList();
		List params = new ArrayList();
		params.add(zcbh);
		String preparedHQL = "from JyzcXxLsb o where o.zcbh = ? ";
		resultList = this.publicDao.find(preparedHQL, params);
		return resultList;
		
	}
	/**
	 * 根据资产Id  查询其变动历史
	 * @param ziId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Recordhistory> getRecordhistoryByzcId(List<String> zcId ,Paginator paginator) {
		StringBuilder sb = new StringBuilder();
		for(String id : zcId){
			sb.append("'").append(id).append("'").append(",");
		}
		sb.deleteCharAt(sb.lastIndexOf(","));
		if (zcId == null || zcId.size()==0) {
			return null;
		} else {
			List params = new ArrayList();
//			params.add(sb.toString());
			StringBuffer preparedHQL = new StringBuffer();
			preparedHQL.append("from Recordhistory o where o.zhuangTai='2' and o.zcId in (" + sb.toString() + ")");
//			for(int i=0;i<zcId.size();i++){
//				String zclsbId = (String) zcId.get(i);
//				if(i==0){
//					preparedHQL.append("and o.zcId in ?");
//				}else{
//					preparedHQL.append("or o.zcId=?");
//				}
//				params.add(zclsbId);
//			}
			preparedHQL.append(" order by o.changedate desc");
			List<Recordhistory> resultList = new ArrayList();
			PageableList pageableList =  this.publicDao.queryByHQLWithPaginator(preparedHQL.toString(), params,paginator);
			resultList = (List<Recordhistory>) pageableList.getResults();
			return resultList;
		}
	}
	/**
	 * 根据资产Id 处理单ID 找出变动信息
	 * @param zcId
	 * @param pkId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Recordhistory> getRecordhistoryByzcId(String zcId ,String pkId,Paginator paginator) {
		if (zcId == null || "".equals(zcId)) {
			return null;
		} else {
			List params = new ArrayList();
			List<Recordhistory> resultList = new ArrayList();
			params.add(zcId);
			params.add(pkId);
			String preparedHQL = "from Recordhistory o where o.zcId=? and o.pkId=? order by o.changedate desc";
			PageableList pageableList = this.publicDao.queryByHQLWithPaginator(preparedHQL,params,paginator);
			resultList = (List<Recordhistory>) pageableList.getResults();
			return resultList;
		}
	}
	/**
	 * 根据资产ID取得其与卡片的相关信息
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AssetCardVO> getAssetCardVOByzcId(String zcId ,Paginator paginator) {
		if (zcId == null) {
			return null;
		}
		List list = new ArrayList();
		List params = new ArrayList();
		List result = new ArrayList();
		params.add(zcId);
		String preparSQL = "select a.ID,ZC_ID,CARDCODE,ZCNAME,PARENTID,TYPECODE,STATE ,GLBM,USEPARTMENT,to_char(GJKSRQ,'YYYY-MM-DD') as GJKSRQ,FIRSTBRANCH,SAVEADSRESS ,YBYZ,SFWZKP,SYNX,KSDATE from card_asset_history a ,cardinfo b where  a.kp_id=b.id  and a.zc_id= ? order by a.id desc";
		PageableList pageableList = this.publicDao.queryForList(preparSQL, params,paginator);
		list = pageableList.getResults();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			AssetCardVO assetCardVO = new AssetCardVO();
			assetCardVO.setId(String.valueOf(map.get("ID")));
			assetCardVO.setZcId(String.valueOf(map.get("ZC_ID")));
			assetCardVO.setCardcode(String.valueOf(map.get("CARDCODE")));
			assetCardVO.setZcname(String.valueOf(map.get("ZCNAME")));
			assetCardVO.setCardState(this.viewState(String.valueOf(map.get("STATE"))));
			assetCardVO.setTypecode(String.valueOf(this.findCoteNameByCoteKey("CARD_TYPE",String.valueOf(map.get("PARENTID")))));
			assetCardVO.setGlbm(this.getIndividualtreeByNodeValue(String
					.valueOf(map.get("GLBM"))));
			assetCardVO.setUsepartment(this.getIndividualtreeByNodeValue(String
					.valueOf(map.get("USEPARTMENT"))));
			assetCardVO.setZcname(String.valueOf(map.get("ZCNAME")));
			assetCardVO.setSaveadsress(String.valueOf(map.get("SAVEADSRESS")));
			assetCardVO.setYz(Double.parseDouble(String
					.valueOf(map.get("YBYZ") == null ? "0" : map.get("YBYZ"))));
			assetCardVO.setSfwzkp(findCodeName(String.valueOf(map.get("SFWZKP"))));
			assetCardVO.setSynx(String.valueOf(map.get("SYNX")));
			assetCardVO.setGjksrq(map.get("GJKSRQ").toString());
			assetCardVO.setFirstbranch(findCateNameByParentId("department","438",String.valueOf(map.get("FIRSTBRANCH"))));
			result.add(assetCardVO);
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public List<AssetCardVO> getAssetCardXxVOByzcId(String zcId ,Paginator paginator) {
		if (zcId == null) {
			return null;
		}
		List list = new ArrayList();
		List params = new ArrayList();
		List result = new ArrayList();
		params.add(zcId);
		String preparSQL = "select a.ID,ZC_ID,CARDCODE,ZCNAME,PARENTID,TYPECODE ,STATE,GLBM,USEPARTMENT,to_char(GJKSRQ,'YYYY-MM-DD') as GJKSRQ,FIRSTBRANCH,SAVEADSRESS ,YBYZ,SFWZKP,SYNX,KSDATE from card_asset_history a ,cardinfo b where  a.kp_id=b.id and a.dqgjzt ='0' and a.spzt='2' and a.zczsb_id= ? order by a.id desc";
		
		PageableList pageableList = this.publicDao.queryForList(preparSQL, params,paginator);
		list = pageableList.getResults();
		//list = publicDao.queryForList(preparSQL, params);
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			AssetCardVO assetCardVO = new AssetCardVO();
			assetCardVO.setId(String.valueOf(map.get("ID")));
			assetCardVO.setZcId(String.valueOf(map.get("ZC_ID")));
			assetCardVO.setCardcode(String.valueOf(map.get("CARDCODE")));
			assetCardVO.setZcname(String.valueOf(map.get("ZCNAME")));
			assetCardVO.setCardState(this.viewState(String.valueOf(map.get("STATE"))));
			assetCardVO.setTypecode(String.valueOf(this.findCoteNameByCoteKey("CARD_TYPE",String.valueOf(map.get("PARENTID")))));
			assetCardVO.setGlbm(this.getIndividualtreeByNodeValue(String
					.valueOf(map.get("GLBM"))));
			assetCardVO.setUsepartment(this.getIndividualtreeByNodeValue(String
					.valueOf(map.get("USEPARTMENT"))));
			assetCardVO.setZcname(String.valueOf(map.get("ZCNAME")));
			assetCardVO.setSaveadsress(String.valueOf(map.get("SAVEADSRESS")));
			assetCardVO.setYz(Double.parseDouble(String
					.valueOf(map.get("YBYZ") == null ? "0" : map.get("YBYZ"))));
			assetCardVO.setSfwzkp(this.findCodeName(String.valueOf(map.get("SFWZKP"))));
			assetCardVO.setSynx(String.valueOf(map.get("SYNX")));
			assetCardVO.setGjksrq(map.get("GJKSRQ")==null?"":map.get("GJKSRQ").toString());
			assetCardVO.setFirstbranch(findCateNameByParentId("department","438",String.valueOf(map.get("FIRSTBRANCH"))));
			result.add(assetCardVO);
		}
		return result;
	}
	
	public String getOrgNameById(String value) {
		PTDeptBO bo = null;
		if(value != null && !"".equals(value) && value.trim().length() > 0 && !"null".equals(value)){
			try{
				Long tid = Long.parseLong(value);
				bo = this.publicDao.findById(PTDeptBO.class, tid);
			}catch(NumberFormatException exception){
				System.out.println("p_t_dept表查询问题，tid数字转换异常，异常值为：" + value);
			}
		} else {
		}
		if(bo != null){
			return bo.getDeptName();
		}else{
			return null;
		}
	}
	
	public String getIndividualtreeByNodeValue(String value) {
		String sql = "SELECT T.CATEGORYNAME FROM INDIVIDUALTREE T WHERE T.TREETYPE='department'AND  T.NODEVALUE=?";
		List list = this.publicDao.queryForList(sql, new Object[] { value });
		String s = "";
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			s = (String) map.get("categoryname");
		}
		return s;
	}
	//卡片状态
	public String viewState(String object) {
		if("01".equals(object)){
			return "正在使用";
		}else if("02".equals(object)){
			return "空闲状态";
		}else if("03".equals(object)){
			return "退役";
		}else return "";
	}
	/**
	 *根据资产ID 找出与其相关的处理单信息
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AssetFlowVO> getAssetFlowVOByzcId(String zcId) {
		if (zcId == null) {
			return null;
		}
		List list = new ArrayList();
		List params = new ArrayList();
		List result = new ArrayList();
		params.add(zcId);
		String preparSQL = "select ZC_ID,CARDCODE,ZCNAME,TYPECODE ,USEPARTMENT  from card_asset_history a ,cardinfo b  where  a.kp_id=b.id and a.zc_id= ? ";
		list = publicDao.queryForList(preparSQL, params);
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			AssetFlowVO assetFlowVO = new AssetFlowVO();
			assetFlowVO.setZcId(String.valueOf(map.get("ID")));
			assetFlowVO.setBianhao(String.valueOf(map.get("BIAOTI")));
			assetFlowVO.setBiaoti(String.valueOf(map.get("BIAOTI")));
			assetFlowVO.setNgr(String.valueOf(map.get("NGR")));
			assetFlowVO.setNgrq(String.valueOf(map.get("NGRQ")));
			result.add(assetFlowVO);
		}
		if (result.size() == 0) {

			return null;
		}
		return result;
	}

	public void deleteJYGlbt(String[] btIds) {
		for (int i = 0; i < btIds.length; i++) {
			String preparedHQL = " from JyzcXxLsb o where o.id=?";
			JyzcXxLsb stglbt = (JyzcXxLsb) publicDao.findSingleResult(
					preparedHQL, new Object[] { btIds[i] });
			if (stglbt != null) {
				publicDao.delete(stglbt);
			}

		}
	}

	public JyzcXx getJyzcXxByLsbZcid(String zcId) {
		String sql = "SELECT A.ID FROM JYZC_XX_LSB B,JYZC_XX A WHERE A.ZCBH=B.ZCBH AND B.ID =?";
		List list = this.publicDao.queryForList(sql, new Object[] { zcId });
		String s = "";
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			s = (String) map.get("id");
		}
		return publicDao.findById(JyzcXx.class, s);
	}

	/**
	 * 如果是修改日常管理表体信息，那么先删除已添加的申请审定信息明细
	 * @param id 
	 * lantianbo
	 */
	public void deleteJyzcSqsdfyXxByZcId(String id) {
		String sql = "delete from jyzc_sqsdfy_xx t where t.zc_id = '" + id
				+ "'";
		publicDao.getJdbcTemplate().execute(sql);

	}

	/**
	 * 根据处理单id删除临时表数据 addby lantianbo
	 * @param headId
	 */
	public void deleteLSBByCLDId(String headId) {
		String sql = "DELETE FROM JYZC_XX_LSB T WHERE T.CLD_ID = '" + headId
				+ "'";
		publicDao.getJdbcTemplate().execute(sql);

	}

	public List<AssetBodyVO> getJygdzcRcglVOListById(String headId) {
		String hql = "from JyzcXxLsb jyzc where jyzc.cldId = ?";
		List<JyzcXxLsb> list = (List<JyzcXxLsb>) this.getPublicDao().find(hql,
				new Object[] { headId });
		List<AssetBodyVO> resultList = new ArrayList<AssetBodyVO>();
		for (int i = 0; i < list.size(); i++) {
			AssetBodyVO assetBodyVO = new AssetBodyVO();
			JyzcXxLsb JyzcXxLsb = list.get(i);
			assetBodyVO.copyProperties(JyzcXxLsb);
			assetBodyVO.setId(JyzcXxLsb.getId());
			assetBodyVO.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(String.valueOf(JyzcXxLsb.getCZclx())))));
			assetBodyVO.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",checkString(String.valueOf(JyzcXxLsb.getCZczc())))));//资产状态
			assetBodyVO.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",checkString(String.valueOf(JyzcXxLsb.getCZcdq())))));//地区
			assetBodyVO.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(JyzcXxLsb.getCJyfl()))));
			assetBodyVO.setBdsl(publicDao);
			assetBodyVO.setZlzt(publicDao);
			String zcId = JyzcXxLsb.getId();
			JyzcXx jyzcXx = this.getJyzcXxByzclsbId(zcId);
			if(jyzcXx!=null){
				assetBodyVO.setCardinfo(publicDao,jyzcXx.getId());
				assetBodyVO.setCardinfoList(publicDao, jyzcXx.getId());
			}else{
				assetBodyVO.setCardinfo(publicDao);
				assetBodyVO.setCardinfoList(publicDao);
			}
			if (assetBodyVO.getCardinfo() != null) {
				if(assetBodyVO.getCardinfo().getSaveadsress()!=null){
					assetBodyVO.setSaveadsress(assetBodyVO.getCardinfo().getSaveadsress().toString());
				}
				assetBodyVO.setValuesAboutCard(publicDao);
			}
			List<JyzcSqsdfyXx> jyzcSqsdjes =  this.getJyzcSqsdfyXxByZcId(JyzcXxLsb.getId());// 取得临时表信息下所有的申请审定金额信息
			double sqje =new Double(0);
			double sdje =new Double(0);
			if (jyzcSqsdjes.size() > 0) {
				for (int j = 0; j < jyzcSqsdjes.size(); j++) {
					JyzcSqsdfyXx sqsdfyXx = (JyzcSqsdfyXx) jyzcSqsdjes.get(j);
					sqje += sqsdfyXx.getSqje(); // 申请金额
					if(sqsdfyXx.getSdje()!=null){
						sdje += sqsdfyXx.getSdje(); // 审定金额
					}
				}
			}
			assetBodyVO.setSqje(sqje);
			assetBodyVO.setSdje(sdje);
			resultList.add(assetBodyVO);
		}
		return resultList;
	}
	/**
	 * 根据查询条件展示合同需要的------------HtViewVOZC 资产id也要带出来
	 * -------//文档
	 * @param queryBO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HtViewVOZC> getByCondition(String zcId, Paginator paginator) {
		List<HtViewVOZC> resultList = new ArrayList();
		List<JyzcXx> tempList = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		tempList = (List<JyzcXx>) publicDao.queryByHQLWithPaginator(
				"from JyzcXx where id=? order by id", params, paginator).getResults();
		for (int i = 0; i < tempList.size(); i++) {
			JyzcXx JyzcXx = tempList.get(i);
			HtViewVOZC htViewVOZC = new HtViewVOZC();
			try {
				BeanUtils.copyProperties(htViewVOZC, JyzcXx);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}

			htViewVOZC.setId(JyzcXx.getId());
	//没有关联表的占时关闭		
			htViewVOZC.setYbyz(getYbyz(JyzcXx.getId()));
			htViewVOZC.setZkpbh(getZkpbh(JyzcXx.getId()));
			htViewVOZC.setZkpmc(getZkpmc(JyzcXx.getId()));
			resultList.add(htViewVOZC);

		}
		return resultList;
	}
	/*
	 * 
	 * 比对资产表和资产临时表不同 并将其记录到RECORDHISTORY中
	 * 
	 */
	@SuppressWarnings("unchecked")
	public void compareXxVsLsb(JyzcXx jyzcXx, JyzcXxLsb jyzcXxLsb) {

		Map<String,Object> jyzcXxMap = null;
		Map<String,Object> jyzcXxLsbMap = null;
		try {
			jyzcXxMap = BeanUtils.describe(jyzcXx);
			jyzcXxLsbMap = BeanUtils.describe(jyzcXxLsb);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		Set<String> keySet = jyzcXxMap.keySet();
		Iterator ite = keySet.iterator();
		while(ite.hasNext()){
			String property = (String)ite.next();
			if("id".equals(property)||"class".equals(property)||"lrr".equals(property)||"lrrq".equals(property)){
				continue;
			}
			Object valueAfter = jyzcXxLsbMap.get(property);
			Object valueBefore = jyzcXxMap.get(property);
			if("kssyrq".equals(property)){
				if(valueBefore != null){
					valueBefore = DateUtils.formatDate(jyzcXx.getKssyrq(),"yyyy-MM-dd");
				}
				if(valueAfter != null){
					valueAfter = DateUtils.formatDate(jyzcXxLsb.getKssyrq(),"yyyy-MM-dd");
				}
			}else if("jcrq".equals(property)){
				if(valueBefore != null){
					valueBefore = DateUtils.formatDate(jyzcXx.getJcrq(),"yyyy-MM-dd");
				}
				if(valueAfter != null){
					valueAfter = DateUtils.formatDate(jyzcXxLsb.getJcrq(),"yyyy-MM-dd");
				}
			}
			else if("tdzblsj".equals(property)){
				if(valueBefore != null){
					valueBefore = DateUtils.formatDate(jyzcXx.getTdzblsj(),"yyyy-MM-dd");
				}
				if(valueAfter != null){
					valueAfter = DateUtils.formatDate(jyzcXxLsb.getTdzblsj(),"yyyy-MM-dd");
				}
			}
			if(allToString(String.valueOf(valueAfter)).equals(allToString(String.valueOf(valueBefore)))){
				continue;
			}else if((valueAfter == null && valueBefore != null) || (valueAfter != null && !valueAfter.equals(valueBefore))){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("JyzcXx");//变动的表名
				record.setZcId(jyzcXxLsb.getId().toString());//变动记录的ID，临时表的主键
				record.setName(this.checkString(this.switchString(property)));//改变的列名
				if("CZclx".equals(property)){
					record.setBefore(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(valueBefore))));
					record.setAfter(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(valueAfter))));	
				}else if("CJyfl".equals(property)){
					record.setBefore(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(valueBefore))));
					record.setAfter(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(valueAfter))));	
				}else if("CZczc".equals(property)){
					record.setBefore(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(valueBefore))));
					record.setAfter(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(valueAfter))));	
				}else if("CZcdq".equals(property)){
					record.setBefore(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(valueAfter))));	
				}else if("CZcqs".equals(property)){
					record.setBefore(checkString(findCoteNameByCoteKey("ASSET_OWNERSHIP",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCoteNameByCoteKey("ASSET_OWNERSHIP",String.valueOf(valueAfter))));	
				}else if("CYdxz".equals(property)){
					record.setBefore(checkString(findCoteNameByCoteKey("LAND_USE_PROPERTY",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCoteNameByCoteKey("LAND_USE_PROPERTY",String.valueOf(valueAfter))));	
				}else if("ejdq".equals(property)){
					record.setBefore(checkString(findCateNameByParentId("department","438",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCateNameByParentId("department","438",String.valueOf(valueAfter))));	
				}else if("CYjwtjg".equals(property)){
					record.setBefore(checkString(findCateNameByParentId("department","438",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCateNameByParentId("department","438",String.valueOf(valueAfter))));	
				}else if("CErwtjg".equals(property)){
					record.setBefore(checkString(findCateNameByParentId("department","438",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCateNameByParentId("department","438",String.valueOf(valueAfter))));	
				}else if("fczwyxwj".equals(property)||"tdwyxwj".equals(property)||"fdflfw".equals(property)||"CYwtd".equals(property)||"fwybz".equals(property)||"kongdi".equals(property)||"fdfltd".equals(property)||"tdybz".equals(property)||"fdhy".equals(property)||"fdhyybz".equals(property)||"lzqwb".equals(property)){
					record.setBefore(checkString(findCodeName(String.valueOf(valueBefore))));
					record.setAfter(checkString(findCodeName(String.valueOf(valueAfter))));
				}else if("CYt".equals(property)){
					record.setBefore(checkString(findCoteNameByCoteKey("ASSET_USE",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCoteNameByCoteKey("ASSET_USE",String.valueOf(valueAfter))));		
				}else{
					record.setBefore(valueBefore==null?"":valueBefore.toString());
					record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
				}
				if(record.getAfter().equals(record.getBefore())){
					continue;
				}else{
				
					//查询head对象，获得拟稿人，拟稿日期
					JyzcHead head = (JyzcHead) this.findById(JyzcHead.class,jyzcXxLsb.getCldId());
					if(head != null){
						//record.setChangedate(head.getNgrq());//变动的日期
						record.setChangeperson(head.getNgrmc());//变动记录人
						//record.setWfCode(head);//流程
						record.setPkId(head.getId().toString());
					}
					record.setZhuangTai("0");//设置审批状态为0：未审批
					if(valueAfter!=null){
						this.save(record);//保存变动信息到recordhistory
					}
				}
			}
		}
	}
	/**
	 * 对比时做转换
	 * @param str
	 * @return
	 */
	public String allToString(String str){
		if(str==null){
			return "";
		}
		if(str.trim().equals("")||str.trim().equals("null")
				||str.trim().equals("0")||str.trim().equals("0.0")){
			return "";
		}else{
			return str.trim();
		}
	}
	/**
	 * 设置变更时间 已办结时间为准
	 * @param cldId
	 */
	public void  setChangeDate2(String cldId){
		List params = new ArrayList();
		String hql = "from Recordhistory  t where t.pkId = ?";
		params.add(cldId);
		List RecordhistoryList = new ArrayList();
		RecordhistoryList = publicDao.find(hql, params);
		for(int i=0 ;i < RecordhistoryList.size();i++){
			Recordhistory recordhistory = new Recordhistory();
			recordhistory = (Recordhistory) RecordhistoryList.get(i);
			recordhistory.setChangedate(new Date());
			this.update(recordhistory);
		}
	}
	/*
	 * 
	 * 比对风险表和风险临时表不同 并将其记录到RECORDHISTORY中
	 * 
	 */
	public void compareXxVsLsb(JyzcRisk jyzcRisk, JyzcRiskLsb jyzcRiskLsb) {

		Map<String,Object> jyzcRiskLsbMap = null;
		Map<String,Object> jyzcRiskMap = null;
		try {
			jyzcRiskMap = BeanUtils.describe(jyzcRisk);
			jyzcRiskLsbMap = BeanUtils.describe(jyzcRiskLsb);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		Set<String> keySet = jyzcRiskMap.keySet();
		Iterator ite = keySet.iterator();
		while(ite.hasNext()){
			String property = (String)ite.next();
			if("id".equals(property)||"class".equals(property)||"lrrbh".equals(property)||
					"lrr".equals(property)||"lrrq".equals(property)){
				continue;
			}
			Object valueAfter = jyzcRiskLsbMap.get(property);
			Object valueBefore = jyzcRiskMap.get(property);
			if(allToString(String.valueOf(valueAfter)).equals(allToString(String.valueOf(valueBefore)))){
				continue;
			}else if((valueAfter == null && valueBefore != null) || (valueAfter != null && !valueAfter.equals(valueBefore))){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzcRiskLsb");//变动的表名
				record.setZcId(jyzcRiskLsb.getZcId().toString());//变动记录的ID，临时表的主键
				record.setName(this.checkString(switchString(property)));//改变的列名
				if(valueBefore == null){//改变前值
					record.setBefore(null);
				}else{
					if("CFxlx".equals(property)){
						record.setBefore(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",String.valueOf(valueBefore))));
						record.setAfter(checkString(this.findCoteNameByCoteKey("ASSET_RISK_TYPE",String.valueOf(valueAfter))));	
					}else if("fxzt".equals(property)){
						record.setBefore(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",String.valueOf(valueBefore))));
						record.setAfter(checkString(this.findCoteNameByCoteKey("ASSET_RISK_STATE",String.valueOf(valueAfter))));	
					}else{
						record.setBefore(valueBefore.toString());
						record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
					}
				}
				record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
				//查询head对象，获得拟稿人，拟稿日期
				if(jyzcRiskLsb != null){
					String headId = jyzcRiskLsb.getCldId();
					JyzcHead head = (JyzcHead) this.findById(JyzcHead.class, headId);
					//record.setChangedate(head.getNgrq());//变动的日期
					record.setChangeperson(head.getNgrmc());//变动记录人
					//record.setWfCode(head);//流程
					record.setPkId(jyzcRiskLsb.getCldId().toString());
				}
				record.setZhuangTai("0");//设置审批状态为0：未审批
				if(valueAfter!=null){
					this.save(record);//保存变动信息到recordhistory
				}
			}
		}
	}
	@SuppressWarnings("unchecked")
	public String getYbyz(String id) {
		List<Cardinfo> cardinfoList;
		String hql = "select o.kpId from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0'";
		String KPHQL = "from Cardinfo t where t.id=? ";
		Object[] params = new Object[] { id };
		List pkIdList = publicDao.find(hql, params);
		Double ybyz = new Double(0);
		if (pkIdList != null) {
			for (int i = 0; i < pkIdList.size(); i++) {
				Long  pkId =  Long.valueOf(pkIdList.get(i).toString()) ;
				List param = new ArrayList();
				param.add(pkId);
				Cardinfo cardinfo  = (Cardinfo) publicDao.findSingleResult(KPHQL, param);
				if(cardinfo!=null){
					ybyz += cardinfo.getYbyz();
				}
			}
			return ybyz.toString();
		} else {
			return "";
		}

	}

	@SuppressWarnings("unchecked")
	public String getZkpbh(String id) {

		Cardinfo cardinfo = new Cardinfo();
		String strCardid = "";
		String hql = "select o.kpId from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		String KPHQL = "from Cardinfo t where t.id=? ";
		Object[] params = new Object[] { id };
		List pkIdList = publicDao.find(hql, params);
		if (pkIdList != null && pkIdList.size() > 0) {
			Long  pkId =  Long.valueOf(pkIdList.get(0).toString()) ;
			List param = new ArrayList();
			param.add(pkId);
			cardinfo  = (Cardinfo) publicDao.findSingleResult(KPHQL, param);
			if(cardinfo.getCardcode()!=null){
				strCardid = cardinfo.getCardcode();
			}
		} else {
			cardinfo = null;
			strCardid = "";
		}
		return strCardid;
	}

	@SuppressWarnings("unchecked")
	public String getZkpmc(String id) {
		Cardinfo cardinfo = new Cardinfo();
		String strCardid = "";
		String hql = "select o.kpId from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		String KPHQL = "from Cardinfo t where t.id=? ";
		Object[] params = new Object[] { id };
		List pkIdList =  publicDao.find(hql, params);
		if (pkIdList != null && pkIdList.size() > 0) {
			Long  pkId =  Long.valueOf(pkIdList.get(0).toString()) ;
			List param = new ArrayList();
			param.add(pkId);
			cardinfo  = (Cardinfo) publicDao.findSingleResult(KPHQL, param);
			if(cardinfo.getZcname()!=null){
				strCardid = cardinfo.getZcname();
			}
		} else {
			cardinfo = null;
			strCardid = "";
		}
		return strCardid;
	}

	/**
	 * 根据资产Id 查询挂接在该资产下挂接的卡片信息（当前挂接状态为挂接中）
	 * 
	 * @param ziId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Cardinfo> getCardInfoByZcId(String ziId) {
		String hql = "select o from Cardinfo o,CardAssetHistory his where o.id = his.kpId and his.dqgjzt = '"
				+ JygdzcCommon.CURRENT_ASSET_CARD_CONN + "' and his.zcId = ?";
		Object[] params = new Object[] { ziId };
		List<Cardinfo> list = (List<Cardinfo>) this.publicDao.find(hql, params);
		return list;
	}

	@SuppressWarnings("unchecked")
	public Cardinfo getMainCardByZcId(String ziId) {
		Cardinfo cardinfo = null;
		// 查询主卡片信息
		String hql = "select o from CardAssetHistory o where o.zcId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		Object[] params = new Object[] { ziId };
		List<CardAssetHistory> tempList = (List<CardAssetHistory>) publicDao
				.find(hql, params);
		if (tempList != null && tempList.size() > 0) {
			CardAssetHistory temp = tempList.get(0);
			cardinfo = this.publicDao.findById(Cardinfo.class, Long
					.valueOf(temp.getKpId()));
		}
		return cardinfo;
	}

	/**
	 * 根据资产的id修改资产状态为指定的状态
	 * 
	 * @param zcId
	 *            资产id
	 * @param state
	 *            要修改的资产状态 Added by liubeibei.2010-12-1.
	 */
	public void updateAssetStateById(String zcId, String state) {
		String sql = "update jyzc_xx t set t.C_ZCZC = '" + state
				+ "' where t.id = '" + zcId + "'";
		this.publicDao.updateBySql(sql);
	}
	public void zcXxcopy(JyzcXxLsb jyzcXxLsb,CommonBO commonBO) {

		try {
			BeanUtils.copyProperties(jyzcXxLsb, commonBO);
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			
			e.printStackTrace();
		}
	}

	public void copyZcXx(CommonBO commonBO, CommonBO commonBO1) {

		try {
			BeanUtils.copyProperties(commonBO, commonBO1);
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 根据treeType和nodeValue和parentid查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String treeType,String parentId,String nodeValue) {
		String sql = "select i.categoryname from individualtree i where i.treetype = '"+treeType+"' and " +
				"i.parentcategoryid = '"+parentId+"' and i.nodevalue = '"+nodeValue+"'";
		String categoryname = "";
		if (nodeValue != null && nodeValue.length() > 0) {
			
//			categoryname = publicDao.getJdbcTemplate().queryForObject(sql, String.class);
//			if(categoryname!=null&&!"".equals(categoryname)){
//				return categoryname;
//			}else{
//				return "";
//			}
//			
//		} else {
//			return "";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if(list.size()>0){
				Map map = (Map)list.get(0);
				categoryname = (String)map.get("categoryname");
			}
		}
		return categoryname;
	}
	/**
	 * 通过codeKey查找codename
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String coteType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = coteType;
			str[1] = codeKey;
			com.tansun.eam2.common.model.orm.bo.Code tree = new com.tansun.eam2.common.model.orm.bo.Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if(tree!=null&&!"".equals(tree)){
				String codeValue = tree.getCodeValue();
				return codeValue;
			}else{
				return "";
			}
		} else {
			return "";
		}
	}
	/**
	 * 通过codeKey查找codetag
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteTagBycodeKey(String coteType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = coteType;
			str[1] = codeKey;
			com.tansun.eam2.common.model.orm.bo.Code tree = new com.tansun.eam2.common.model.orm.bo.Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if(tree!=null&&!"".equals(tree)){
				String codeTag = tree.getCodeTag();
				return codeTag;
			}else{
				return "";
			}
		} else {
			return "";
		}
	}
	/**
	 * 根据省份查询银行，addby lantianbo
	 * @param sheng
	 */
	public String jbhQuery(String sheng) {
		String []shengs = sheng.split(",");
		StringBuffer hql = new StringBuffer().append("SELECT T.CODE,T.NAME FROM DIC_APP_ASSET_STATE T ")
				.append("WHERE T.TYPE='fenhang' ");
		if(shengs.length==1){
		//	if(!"010".equals(shengs[0])){ //010 为 一级分行为总行的nodevalue的后三位 当 一级分行为总行时 分行不做限制
				hql.append(" AND SUBSTR(T.CODE,0,3) = '" + shengs[0] +"'" );
		//	}
		}		
		if(shengs.length>1){
			hql.append(" AND ( ");
			for(int i=0;i<shengs.length;i++){
				hql.append( " SUBSTR(T.CODE,0,3) = '" + shengs[i] +"'" );
				if(i!=shengs.length-1){
					hql.append(" OR ");
				}
			}
			
			hql.append(")");
		}
		hql.append(" ORDER BY NLSSORT(T.NAME,'NLS_SORT=SCHINESE_PINYIN_M')");
	    List list = this.publicDao.queryForList(hql.toString(), new ArrayList());
	    StringBuilder jsonSB = new StringBuilder();
		jsonSB.append("{\"jbh\":[");
	    JsonConfig jsonConfig = new JsonConfig();
		JSONObject jsonObject = null;
		JBHCommonVO jbhVO = new JBHCommonVO();
		for(Iterator i = list.iterator(); i.hasNext();){
			Map map = (Map) i.next();
			jbhVO.setJbhkey(String.valueOf(map.get("code")));
			jbhVO.setJbhvalue(String.valueOf(map.get("name")));
			jsonObject = JSONObject.fromObject(jbhVO,jsonConfig); 
			jsonSB.append(jsonObject.toString());
			if(i.hasNext()){
				jsonSB.append(",");
			}
		}
		jsonSB.append("]}");
		int l = jsonSB.length();
		return jsonSB.toString();
	}

	/**
	 * 得到发送erp的唯一标识
	 * @return
	 */
	public String getSend2ERPSEQ() {
		SimpleDateFormat dsf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = dsf.format(new Date());
		int iRandom = 0;
		Random random1 = new Random();
		SecureRandom seeder = new SecureRandom();
        random1.setSeed(seeder.nextInt());
        iRandom = 0x1860 + random1.nextInt(0xdbbf);
		String strRandom = String.valueOf(iRandom);
		return date+strRandom;
	}

	/**
	 * 得到费用名称 
	 * @param fyzl
	 * @return
	 */
	public String getCFyzlValue(String fyzl) {
		String str = "";
		String hql = "from Individualtree tree where tree.treetype=? and tree.nodevalue = ?";
		Object[] params = new Object[] {"feiyong", fyzl };
		Individualtree tree = (Individualtree) publicDao.findSingleResult(hql,params);
		if (tree != null) {
			str = tree.getCategoryname();
		} 
		return str;
	}

	public String getZcXxByCondition(QueryVO queryVO,Paginator paginator) {
		String sql = "";
		//if(queryVO.getKpbh()!=null||queryVO.getKplx()!=null||queryVO.getKpmc()!=null){
			sql = "select distinct j.id,j.c_zclx,j.c_zcdq ,j.zcbh,j.zcmc,j.c_jyfl,j.c_zczc,j.zlzt,j.c_yjwtjg,j.c_erwtjg,j.ejdq from jyzc_xx j , cardinfo c where j.id = c.ZCID(+)";
		//}else{
		//	sql = "select * from jyzc_xx j where 1=1 ";
		//}
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		//List queryList = this.publicDao.queryForList(sql, list);
		PageableList pageableList = this.publicDao.queryForList(sql, list,paginator);
		List queryList = pageableList.getResults();
		List<JyzcXxVO> resultList = new ArrayList<JyzcXxVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			JyzcXxVO vo = new JyzcXxVO();
			vo.setId(checkString(String.valueOf(map.get("id"))));//ID
			vo.setZcbh(checkString(String.valueOf(map.get("zcbh"))));//资产编号
			vo.setZcmc(checkString(String.valueOf(map.get("zcmc"))));//资产名称
			//vo.setCZclx(checkString(map.get("c_zclx")));//资产类型
			vo.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",String.valueOf(map.get("C_ZCLX")))));//资产类型
			vo.setCJyfl(checkString(String.valueOf(map.get("C_JYFL"))));//经营分类
			//vo.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(map.get("C_JYFL")))));//经营分类
			//vo.setCZczc(checkString(map.get("c_zczc")));//资产状态
			vo.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(map.get("C_ZCZC")))));//资产状态
			//vo.setCZcdq(checkString(map.get("C_ZCDQ")));//地区
			vo.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("C_ZCDQ")))));//地区
			vo.setZlzt(checkString(String.valueOf(map.get("zlzt"))));// 租赁状态
			//vo.setZlzt(checkString(this.findCoteNameByCoteKey("ASSET_RENT_STATE",String.valueOf(map.get("zlzt")))));// 租赁状态
			vo.setEjdq(checkString(String.valueOf(map.get("EJDQ"))));//二级地区
			//vo.setEjdq(checkString(findCateNameByParentId("ENTITY_TRADE","438",String.valueOf(map.get("EJDQ")))));//二级地区
			//vo.setCYjwtjg(checkString(getIndividualtreeByNodeValue(String.valueOf(map.get("C_YJWTJG")))));//一级委托管理机构
			vo.setCYjwtjg(checkString(String.valueOf(map.get("C_YJWTJG"))));//一级委托管理机构
			//vo.setCErwtjg(checkString(getIndividualtreeByNodeValue(String.valueOf(map.get("C_ERWTJG")))));//二级委托管理机构
			vo.setCErwtjg(checkString(String.valueOf(map.get("C_ERWTJG"))));//二级委托管理机构
//			if (map.get("GLBM") != null&&!"".equals(map.get("GLBM"))) {
//				vo.setGlbm(publicDao, vo.getCardinfo().getGlbm());
//			}
//			if(map.get("USEPARTMENT") != null&&!"".equals(map.get("USEPARTMENT"))){
//				vo.setSybm(publicDao, vo.getCardinfo().getUsepartment());
//			}
			resultList.add(vo);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}
	
	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(QueryVO queryVO) {
		String hql = "";
		if (queryVO.getZcbh() != null
				&& queryVO.getZcbh().trim().length() > 0) {
			hql += " and j.zcbh like ? ";
		}
		if (queryVO.getZcmc() != null
				&& queryVO.getZcmc().trim().length() > 0) {
			hql += " and j.zcmc like ? ";
		}
		if (queryVO.getZclx() != null
				&& queryVO.getZclx().trim().length() > 0) {
			hql += " and j.c_zclx = ? ";
		}
		if (queryVO.getJyfl() != null
				&& queryVO.getJyfl().trim().length() > 0) {
			hql += " and j.c_jyfl = ";
		}
		if (queryVO.getZczt() != null
				&& queryVO.getZczt().trim().length() > 0) {
			hql += " and j.c_zczc like ?  ";
		}
		if(queryVO.getDq() != null
				&& queryVO.getDq().trim().length() > 0) {
			hql += " and j.C_ZCDQ = ? ";
		}
		if(queryVO.getKpbh() != null
				&& queryVO.getKpbh().trim().length() > 0) {
			hql += " and c.cardcode like ? ";
		}
		if(queryVO.getKpmc() != null
				&& queryVO.getKpmc().trim().length() > 0) {
			hql += " and c.zcname like ? ";
		}
		if(queryVO.getKplx() != null
				&& queryVO.getKplx().trim().length() > 0) {
			hql += " and c.parentid = ? ";
		}
		hql += " order by j.id ";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(QueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		
		if (queryVO.getZcbh() != null
				&& queryVO.getZcbh().trim().length() > 0) {
			list.add("%" + queryVO.getZcbh() + "%");
		}
		if (queryVO.getZcmc() != null
				&& queryVO.getZcmc().trim().length() > 0) {
			list.add("%" + queryVO.getZcmc() + "%");
		}
		if (queryVO.getZclx() != null
				&& queryVO.getZclx().trim().length() > 0) {
			list.add("" + queryVO.getZclx() + "");
		}
		if (queryVO.getJyfl() != null
				&& queryVO.getJyfl().trim().length() > 0) {
			list.add("" + queryVO.getJyfl() + "");
		}
		if (queryVO.getZczt() != null
				&& queryVO.getZczt().trim().length() > 0) {
			list.add("%" + queryVO.getZczt() + "%");
		}
		if(queryVO.getDq() != null
				&& queryVO.getDq().trim().length() > 0) {
			list.add("" + queryVO.getDq() + "");
		}
		if(queryVO.getKpbh() != null
				&& queryVO.getKpbh().trim().length() > 0) {
			list.add("%" + queryVO.getKpbh() + "%");
		}
		if(queryVO.getKpmc() != null
				&& queryVO.getKpmc().trim().length() > 0) {
			list.add("%" + queryVO.getKpmc() + "%");
		}
		if(queryVO.getKplx() != null
				&& queryVO.getKplx().trim().length() > 0) {
			list.add("%" + queryVO.getKplx() + "%");
		}
		return list;
	}
	
	/**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	
	public String checkDouble(Object obj) {
		String str = "0";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "0";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	public AssetBodyVO getAssetBodyVOByzcId(String zcId){
		AssetBodyVO assetBodyVO = new AssetBodyVO();
		JyzcXxLsb jyzcXxLsb =  publicDao.findById(JyzcXxLsb.class, zcId);
			if(jyzcXxLsb!=null){
				assetBodyVO.copyProperties(jyzcXxLsb);
				assetBodyVO.setEjwtgljgvalue(this.findCateNameByNodeValue("department", jyzcXxLsb.getCErwtjg()));
				assetBodyVO.setYjwtgljgvalue(this.findCateNameByNodeValue("department", jyzcXxLsb.getCYjwtjg()));
				JyzcXx jyzcXx = this.getJyzcXxByzclsbId(zcId);
				if(jyzcXx!=null){
					assetBodyVO.setCardinfo(publicDao,jyzcXx.getId());
					assetBodyVO.setCardinfoList(publicDao, jyzcXx.getId());
				}else{
					assetBodyVO.setCardinfo(publicDao);
					assetBodyVO.setCardinfoList(publicDao);
				}
				if (assetBodyVO.getCardinfo() != null) {
					assetBodyVO.setValuesAboutCard(publicDao);
				}
			}
		return assetBodyVO;
	}
	public AssetInfoVO getAssetInfoVOByzcId(String zcId){
		AssetInfoVO assetInfoVO = new AssetInfoVO();
		JyzcXx jyzcXx =  publicDao.findById(JyzcXx.class, zcId);
			if(jyzcXx!=null){
				assetInfoVO.copyProperties(jyzcXx);
				//查询二级委托管理机构
				assetInfoVO.setEjwtgljgvalue(this.getOrgNameById(jyzcXx.getCErwtjg()));
//				assetInfoVO.setEjwtgljgvalue(this.findCateNameByNodeValue("department", jyzcXx.getCErwtjg()));
				//查询一级委托管理机构
				assetInfoVO.setYjwtgljgvalue(this.getOrgNameById(jyzcXx.getCYjwtjg()));
//				assetInfoVO.setYjwtgljgvalue(this.findCateNameByNodeValue("department", jyzcXx.getCYjwtjg()));
				assetInfoVO.setCardinfo(publicDao);
				
				if (assetInfoVO.getCardinfo() != null) {
					assetInfoVO.setValuesAboutCard(publicDao);
					assetInfoVO.setKpmc(assetInfoVO.getCardinfo().getZcname());
					assetInfoVO.setZkpbh(assetInfoVO.getCardinfo().getCardcode());
				}
			}
		return assetInfoVO;
	}
	public String getZcXxByCondition(String zcId ,Paginator paginator) {
		String s = "";
		//String str = "select c from JyzcHead c ,JyzcXxLsb b, JyzcXx a where a.zcbh = b.zcbh and b.spzt ='2' and b.cldId = c.id and  a.id = ? ";
		//String preparSQL ="select a.id ,t.biaoti,t.bianhao,t.ngrmc,t.ngrq,t.ywlx, a.C_fyzl  from jyzc_head t , jyzc_Xx_lsb  a where (t.sheettype='manage' or  t.sheettype='agentManage') and a.spzt='2' and a.cld_Id in ( select c.cld_Id from jyzc_Xx_lsb c where c.zcbh in(select k.zcbh from jyzc_XX k where k.id=?) ) order by a.id";
		String preparSQL ="	select distinct lsb.id ,lsb.sjhf,lsb.spzt, lsb.c_fyzl,head.biaoti,head.bianhao,head.ngrmc,head.ngrq,head.ywlx from jyzc_xx_lsb lsb,jyzc_head head where lsb.cld_id=head.id and head.cld_zt='2' and head.sheettype in ('agentManage','manage') and lsb.spzt='2' and lsb.zcbh in (select zcbh from jyzc_xx where id=?) order by  lsb.id";
		List params = new ArrayList();
		params.add(zcId);
		PageableList pageableList = publicDao.queryForList(preparSQL, params,paginator);
		List list  =pageableList.getResults();
		List jsonList = new ArrayList();
		for(int j=0;j<list.size();j++){
			AssetCostVO assetCostVO = new AssetCostVO();
			Map map = (Map) list.get(j);
			assetCostVO.setId(this.checkString(map.get("id")));
			assetCostVO.setBiaoti(this.checkString(map.get("bianhao")));
			assetCostVO.setBianhao(this.checkString(map.get("biaoti")));
			assetCostVO.setNgrmc(this.checkString(map.get("ngrmc")));
			assetCostVO.setNgrq((Date) map.get("ngrq"));
			assetCostVO.setCfyzl(getCFyzlValue(checkString(map.get("c_fyzl"))));
			assetCostVO.setSjhf(Double.valueOf(checkDouble(map.get("sjhf"))));
			assetCostVO.setYwlx(getYwlxBycode(checkString(map.get("ywlx"))));
			assetCostVO.setSqje(publicDao);
			assetCostVO.setSdje(publicDao);
			//assetCostVO.
			jsonList.add(assetCostVO);
		}
		s = BodyListToJSON.getJSON(jsonList, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
	
//		if(list!=null&&list.size()>0){
//			JyzcHead head = null;
//			for(int i=0;i<list.size();i++){
//				head = (JyzcHead) list.get(i);
//				jsonList.add(head);
//			}
//			s = BodyListToJSON.getJSON(jsonList, 1, 1, 10000);
//		}
		return s;
		
	}
	public String getYwlxBycode(String code){
		String value = "";
		if("0".equals(code)){
			value = "确权审批";
		}else if("1".equals(code)){
			value = "更新改造";
		}else if("2".equals(code)){
			value = "业务维修";
		}else if("3".equals(code)){
			value = "其他事项审批";
		}
		return value;
	}
	/**
	 * 根据treeType和nodeValue查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByNodeValue(String treeType, String nodeValue) {
		String hql = "from Individualtree i where i.treetype = ? and i.nodevalue = ?";
		if (nodeValue != null && nodeValue.length() > 0) {
			String[] str = new String[2];
			str[0] = treeType;
			str[1] = nodeValue;
			Individualtree tree = new Individualtree();
			tree = (Individualtree) publicDao.findSingleResult(hql, str);
			String categoryname ="";
			if(tree!=null){
				categoryname = tree.getCategoryname();
			}
			
			return categoryname;
		} else {
			return "";
		}
	}

	/**
	 * 查找一级分行和地区
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String nodeValue) {
		String sql = "select  i.categoryname from individualtree i where i.treetype = 'department' and " +
				"i.parentcategoryid = '438' and i.nodevalue = '"+nodeValue+"'";
		String categoryname = null;
		if (nodeValue != null && nodeValue.length() > 0) {
			categoryname = publicDao.getJdbcTemplate().queryForObject(sql, String.class);
			return categoryname;
		} else {
			return "";
		}
	}
	public void setMainCardByYbYz(String zcId){
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from CardAssetHistory o where o.zcId=? ";
		List<CardAssetHistory>  list  = (List<CardAssetHistory>) publicDao.find(preparedHQL, params);
		int  j = 0;
		Double ybyz = new Double(0);
		if(list.size()>0&&list!=null){
			for(int i=0;i<list.size();i++){
				CardAssetHistory cardAssetHistory= list.get(i);
				Cardinfo cardinfo = new Cardinfo();
				cardinfo = this.publicDao.findById(Cardinfo.class,Long.valueOf(cardAssetHistory.getKpId()));
				if(cardinfo.getYbyz()>ybyz){
					ybyz = cardinfo.getYbyz();
					j=i;
				}
			}
			CardAssetHistory carList= list.get(j);
			carList.setSfwzkp("1");
			this.update(carList);
		}
	}

	public String cksfyzkp(String zcId) {
		List<CardAssetHistory>  list=this.getCardAssetHistoryByZcId(zcId);
		String zkp = "true";
		if(list.size()>0&&list!=null){
			for(int i=0;i<list.size();i++){
				CardAssetHistory cardAssetHistory= list.get(i);
				String sfwzkp = cardAssetHistory.getSfwzkp();
				if("1".equals(sfwzkp)){
					zkp = "false";
					return zkp;
				}
			}
		}else{
			zkp="null";
		}
		return zkp;
	}
	public String findCodeName(String key){
		String name = "";
		if(key!=null&&!"".equals(key)){
			if("0".equals(key)){
				name="否";
			}else if("1".equals(key)){
				name="是";
			}
		}
		return name;
	}
	public String findCodeNameYW(String key){
		String name = "";
		if(key!=null&&!"".equals(key)){
			if("0".equals(key)){
				name="无";
			}else if("1".equals(key)){
				name="有";
			}
		}
		return name;
	}
	public JyzcXx getJyzcXxByzclsbId(String zclsbId) {
		JyzcXx jyzcXx = new JyzcXx();
		JyzcXxLsb jyzcXxLsb = new  JyzcXxLsb();
		jyzcXxLsb = (JyzcXxLsb) this.findById(JyzcXxLsb.class, zclsbId);
		if(jyzcXxLsb!=null){
			String zcbh = jyzcXxLsb.getZcbh();
			jyzcXx = this.getJyzcXxByzcbh(zcbh) ;
			if(jyzcXx!=null){
				return jyzcXx;
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	public JyzcXx getJyzcXxByzcbh(String zcbh){
		List list = new ArrayList();
		List params = new ArrayList();
		JyzcXx jyzcXx = new JyzcXx();
		params.add(zcbh);
		String  preparedHQL = "from JyzcXx j where j.zcbh = ?";
		list = publicDao.find(preparedHQL, params);
		if(list.size()>0){
			jyzcXx= (JyzcXx) list.get(0);
			return jyzcXx;
		}else{
			return null;
		}
		
	}
	public JyzcRisk getJyzcRiskByRiskId(String fxbh) {
		String hql = "from JyzcRisk risk where risk.fxbh = ?";
		List<JyzcRisk> resultList = (List<JyzcRisk>) this.publicDao.find(hql,
				new Object[] { fxbh });
		if(resultList.size()>0&&resultList!=null){
			JyzcRisk jyzcRisk = new JyzcRisk();
			jyzcRisk = resultList.get(0);
			return jyzcRisk;
		}else{
			return null;
		}
	
	}
	public JyzcRiskLsb getJyzcRiskLsbByfxbhAndzcId(String zclsbId,String fxbh) {
		String hql = "from JyzcRiskLsb risk where risk.zcId=? and risk.fxbh = ?";
		List params = new ArrayList();
		params.add(zclsbId);
		params.add(fxbh);
		List<JyzcRiskLsb> resultList = (List<JyzcRiskLsb>) this.publicDao.find(hql,params);
		if(resultList!=null&&resultList.size()>0){
			JyzcRiskLsb jyzcRiskLsb = new JyzcRiskLsb();
			jyzcRiskLsb = resultList.get(0);
			return jyzcRiskLsb;
		}else{
			return null;
		}
	
	}
	@SuppressWarnings("unchecked")
	public String switchString(String orig){
		HashMap hashMap=new HashMap();
		hashMap.put( "CZczlbm","资产种类编码");           
		hashMap.put("CZclx","资产类型");
		hashMap.put("CZcdq","地区");
		hashMap.put("zcbh","资产编号");
		hashMap.put("zcmc","资产名称");
		hashMap.put("CJyfl","经营分类");
		hashMap.put("xxdz","详细地址");
		hashMap.put("CYt","用途");
		hashMap.put("jbdw","经办单位");
		hashMap.put("CZjfs","增加方式");
		hashMap.put("qsqk","权属情况");
		hashMap.put("zwhj","周围环境");
		hashMap.put("CZczc","资产状态");
		hashMap.put("kssyrq","开始使用日期");
		hashMap.put("ejdq","二级地区");
		hashMap.put("CYjwtjg","一级委托机构");
		hashMap.put("CErwtjg","二级委托机构");
		hashMap.put("lrrq","录入日期");
		hashMap.put("lrr","录入人");
		hashMap.put("jcrq","建成日期");
		hashMap.put("fwjg","房屋结构");
		hashMap.put("yangao","檐高");
		hashMap.put("bzcg","标准层高");
		hashMap.put("zcs","总层数");
		hashMap.put("zlzdjc","坐落在第几层");
		hashMap.put("fjh","房间号");
		hashMap.put("jzmj","建筑面积");
		hashMap.put("cbdj","成本单价");
		hashMap.put("fdflfw","房地分离房屋");
		hashMap.put("CYwtd","有无土地");
		hashMap.put("fczsyqr","房产证所有权人");
		hashMap.put("fczh","房产证号");
		hashMap.put("fcztdwj","房产证替代文件");
		hashMap.put("fczwyxwj","房产证无有效文件");
		hashMap.put("fwybz","房屋已办证");
		hashMap.put("fczblsj","	房产证办理时间");
		hashMap.put("kongdi","空地");
		hashMap.put("CYdxz","用地性质");
		hashMap.put("tdmj","土地面积");
		hashMap.put("qdrq","取得日期");
		hashMap.put("zynx","准用年限");
		hashMap.put("sysynx","剩余使用年限");
		hashMap.put("kfcd","开发程度");
		hashMap.put("fdfltd","房地分离土地");
		hashMap.put("tdzsyqr","	土地证使用权人");
		hashMap.put("tdzh","土地证号");
		hashMap.put("tdztdwj","土地证替代文件");
		hashMap.put("tdwyxwj","土地无有效文件");
		hashMap.put("tdybz","土地已办证");
		hashMap.put("tdzblsj","	土地证办理时间");
		hashMap.put("gzwjg","结构");
		hashMap.put("ggcc","规格尺寸");
		hashMap.put("jldw","计量单位");
		hashMap.put("gzwsl","	构筑物数量");
		hashMap.put("gzwcbdj","构筑物成本单价");
		hashMap.put("gzwjcsj","构筑物建成时间");
		hashMap.put("fdhy","	房地合一");
		hashMap.put("fdhyybz","房地合一已办证");
		hashMap.put("fdhyqzh","房地合一权证号");
		hashMap.put("tslx","特殊类型");
		hashMap.put("wfbzyy","无法办证原因");
		hashMap.put("lzqwb","两证全未办");
		hashMap.put("clph","车辆牌号");
		hashMap.put("clxszsyr","车辆行驶证所有");
		hashMap.put("clmcjggxh","车辆名称及型号");
		hashMap.put("gzrq","购置日期");
		hashMap.put("qyrq","启用日期");
		hashMap.put("yxslc","已行驶里程");
		hashMap.put("sbmc","设备名称");
		hashMap.put("ggxh","规格型号");
		hashMap.put("sccj","生产厂家");
		hashMap.put("CJldw","设备计量单位");
		hashMap.put("sbsl","设备数量");
		hashMap.put("spzt","审批状态");
		hashMap.put("CJbhbh","经办行");
		hashMap.put("CEjfhbh","二级分行");
		hashMap.put("CFyzl","费用种类");
		hashMap.put("blsm","办理说明");
		hashMap.put("xlid","发送erp序列号");
		hashMap.put("ysynx","已使用年限");
		hashMap.put("sksynx","尚可使用年限");
		hashMap.put("CZcqs","资产权属");
		hashMap.put("wtrmc","委托人");
		hashMap.put("sjhf","实际花费");
		hashMap.put("CJsfs","结算方式");
		hashMap.put("CBz","币种");
		//风险=============
		hashMap.put("CFxlx","风险类型");        
		hashMap.put("fxbh","风险编号");
		hashMap.put("fxms","风险描述");
		hashMap.put("fxzt","风险状态");
		hashMap.put("fxkz","风险控制");
		hashMap.put("lrrq","录入日期");
		hashMap.put("lrrbh","录入人编号");
		hashMap.put("lrr","录入人");
		return (String) hashMap.get(orig);
		
	} 
	@SuppressWarnings("unchecked")
	public String createBookBycldId(String cldId) {
		if(cldId!=null&&!"".equals(cldId)){
			JyzcHead jyzcHead = new JyzcHead();	
			jyzcHead =(JyzcHead) this.findById(JyzcHead.class, cldId);
			jyzcHead.setCldZt("2");
			this.update(jyzcHead);
			if(jyzcHead!=null){
				String sheettype = jyzcHead.getSheettype();
				if("add".equals(sheettype)){
					List assetlist = new ArrayList();
					assetlist = this.getJyzcXxLsbsByHeadId(cldId);
					for(int i=0;i<assetlist.size();i++){
						JyzcXxLsb jyzcXxLsb = new JyzcXxLsb();
						jyzcXxLsb = (JyzcXxLsb) assetlist.get(i);
						jyzcXxLsb.setSpzt("2");
						this.update(jyzcXxLsb);
						String zcId = jyzcXxLsb.getId();
						//生成资产台账====================================
						JyzcXx jyzcXx = new JyzcXx();
						//jyzcXxLsb.copyProperties(jyzcXx);
						try {
							BeanUtils.copyProperties(jyzcXx, jyzcXxLsb);
						} catch (IllegalAccessException e) {
							
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							
							e.printStackTrace();
						}
						jyzcXx.setId("");
						this.save(jyzcXx);
						String zcXxId = jyzcXx.getId();
						//生成卡片资产关联关系
						List cardAssetHistoryList = new ArrayList();
						cardAssetHistoryList = this.getCardAssetHistoryByZcId(zcId);
						for(int k = 0;k<cardAssetHistoryList.size();k++){
							CardAssetHistory cardAssetHistory= new CardAssetHistory();
							cardAssetHistory = (CardAssetHistory) cardAssetHistoryList.get(k);
							cardAssetHistory.setZczsbId(jyzcXx.getId());
							cardAssetHistory.setSpzt("2");
							this.update(cardAssetHistory);
						}
						//拷贝 附件======================================
						String FileType = "1";
						attachHandleServiceImpl.copyAttach(zcId, FileType , zcXxId, FileType);
						//生成风险台账====================================
						List riskList = new ArrayList();
						riskList = this.getJyzcRiskLsbByzclsbId(zcId);
						for(int j=0;j<riskList.size();j++){
							JyzcRiskLsb jyzcRiskLsb = new JyzcRiskLsb();
							jyzcRiskLsb = (JyzcRiskLsb) riskList.get(j);
							JyzcRisk jyzcRisk = new JyzcRisk();
							try {
								BeanUtils.copyProperties(jyzcRisk, jyzcRiskLsb);
							} catch (IllegalAccessException e) {
								
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								
								e.printStackTrace();
							}
							jyzcRisk.setZczsbId(zcXxId);
							this.save(jyzcRisk);
						}
						
						//生成诉讼台账=====================================
						List lawsuitList = new ArrayList();
						lawsuitList = ssglBSImpl.getSsBaseinfoByzcId(zcId);
						for(int z=0;z<lawsuitList.size();z++){
							SsBaseinfo ssBaseinfo = new SsBaseinfo();
							ssBaseinfo = (SsBaseinfo) lawsuitList.get(z);
							ssBaseinfo.setZczsbId(zcXxId);
							//ssBaseinfo.setSazcid(zcXxId);
							ssBaseinfo.setJaztid("2");
							this.update(ssBaseinfo);
						}
					}
				}else if("change".equals(sheettype)){
					List assetlist = new ArrayList();
					assetlist = this.getJyzcXxLsbsByHeadId(cldId);
					for(int i=0;i<assetlist.size();i++){
						JyzcXxLsb jyzcXxLsb = new JyzcXxLsb();
						jyzcXxLsb = (JyzcXxLsb) assetlist.get(i);
						jyzcXxLsb.setSpzt("2");
						this.update(jyzcXxLsb);
						String zcId = jyzcXxLsb.getId();
						//生成资产台账====================================
						JyzcXx jyzcXx = new JyzcXx();
						jyzcXx = this.getJyzcXxByzcbh(jyzcXxLsb.getZcbh());
						String zcXxId = jyzcXx.getId();
						try {
							BeanUtils.copyProperties(jyzcXx, jyzcXxLsb);
						} catch (IllegalAccessException e) {
							
							e.printStackTrace();
						} catch (InvocationTargetException e) {
							
							e.printStackTrace();
						}
						jyzcXx.setId(zcXxId);
						this.update(jyzcXx);
						//生成风险台账====================================
						List riskList = new ArrayList();
						riskList = this.getJyzcRiskByZcId(zcXxId ,new Paginator());
						for(int m=0;m<riskList.size();m++){
							JyzcRisk jyzcRisk = new JyzcRisk();
							jyzcRisk = (JyzcRisk) riskList.get(m);
							this.delete(jyzcRisk);
						}
						List riskLsbList = new ArrayList();
						riskLsbList = this.getJyzcRiskLsbByzclsbId(zcId);
						for(int j=0;j<riskLsbList.size();j++){
							JyzcRiskLsb jyzcRiskLsb = new JyzcRiskLsb();
							jyzcRiskLsb = (JyzcRiskLsb) riskLsbList.get(j);
							JyzcRisk jyzcRisk = new JyzcRisk();
							try {
								BeanUtils.copyProperties(jyzcRisk, jyzcRiskLsb);
							} catch (IllegalAccessException e) {
								
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								
								e.printStackTrace();
							}
							jyzcRisk.setZczsbId(zcXxId);
							this.save(jyzcRisk);
						}
						//修改变动表状态====================================
						List<Recordhistory> recordList = this.getRecordhistoryByzcId(zcId, cldId, new Paginator());
						for(int u=0;u<recordList.size();u++){
							Recordhistory recordhistory = recordList.get(u);
							recordhistory.setZhuangTai("2");
							this.update(recordhistory);
						}
					}
					this.setChangeDate2(cldId);//设置变动时间
				}else if("check".equals(sheettype)||"agentCheck".equals(sheettype)){
					this.doOver(cldId);
				}else if("scrap".equals(sheettype)||"agentScrap".equals(sheettype)){
					List assetlist = new ArrayList();
					assetlist = this.getJyzcXxLsbsByHeadId(cldId);
					for(int i=0;i<assetlist.size();i++){
						JyzcXxLsb jyzcXxLsb = new JyzcXxLsb();
						jyzcXxLsb = (JyzcXxLsb) assetlist.get(i);
						jyzcXxLsb.setSpzt("2");
						this.update(jyzcXxLsb);
						String zcbh = jyzcXxLsb.getZcbh();
						//生成资产台账====================================
						JyzcXx jyzcXx = new JyzcXx();
						jyzcXx = this.getJyzcXxByzcbh(zcbh);
						jyzcXx.setCZczc("07");
						this.update(jyzcXx);
					}
				}else if("manage".equals(sheettype)||"agentManage".equals(sheettype)){
					List assetlist = new ArrayList();
					assetlist = this.getJyzcXxLsbsByHeadId(cldId);
					for(int i=0;i<assetlist.size();i++){
						JyzcXxLsb jyzcXxLsb = new JyzcXxLsb();
						jyzcXxLsb = (JyzcXxLsb) assetlist.get(i);
						jyzcXxLsb.setSpzt("2");
						this.update(jyzcXxLsb);
						List costList = this.getJyzcSqsdfyXxByZcId(jyzcXxLsb.getId());
						if(costList!=null&&costList.size()>0){
							for(int g=0;g<costList.size();g++){
								JyzcSqsdfyXx jyzcSqsdfyXx = (JyzcSqsdfyXx) costList.get(g);
								jyzcSqsdfyXx.setSpzt("2");
							}
						}
					}
				}
			}
		}
		return "办结成功";
	}


	public List<PTEnd> findMyPTEndList_nopage(String strZcId,String strTitle) {
			List<PTEnd> resultList = new ArrayList();
			List templist = new ArrayList();
			StringBuffer stringbuffer = new StringBuffer();
			String strSQL = "";
			stringbuffer.append("select id ");
			stringbuffer.append("  from p_t_end");
			stringbuffer.append(" where (head_id in (select cld_id from jyzc_xx_lsb where spzt='2' and  zcbh   in ( select zcbh from jyzc_xx where  id ='"+strZcId+"')) or");
			stringbuffer.append("       head_id in (select cld_id from jyzc_jyzl_lsb where spzt='2'and  zc_id = '"+strZcId+"') or");
			stringbuffer.append("       head_id in (select cld_id from jyzc_htqs_body where spzt='2'and  zc_id = '"+strZcId+"') or");
			stringbuffer.append("       head_id in (select cld_id from cz_zc_xx where  ZHUANGTAI='2'and  azcid =  '"+strZcId+"'))");
			if(strTitle !=null && strTitle.toString().trim().length()>0 ){
				stringbuffer.append(" and title like '%"+strTitle+"%' ");
			}
			stringbuffer.append(" order by id desc");
			templist = publicDao.queryForList(stringbuffer.toString(), new ArrayList());
			for (int i = 0; i < templist.size(); i++) {
				Map tempMap = (Map) templist.get(i);
				PTEnd ptend = publicDao.findById(PTEnd.class,new Long( tempMap
						.get("ID").toString()));
				resultList.add(ptend);
			}
			return resultList;
		}
	
	/**
	 * 查询资产下的卡片信息
	 * 
	 * @param zcids
	 * @return
	 */
	public void saveCardLSB(String[] zcids, String headId) {
		@SuppressWarnings("unused")
		List<CheckForCard> resultList = new ArrayList<CheckForCard>();
		for (int i = 0; i < zcids.length; i++) {
			String zcid = zcids[i];
			String sql = "select c.id as kpid,z.id as zcid,z.zcbh, z.zcmc, c.ybyz, c.cardcode,c.zcname,c.glbm,c.usepartment,"
					+ "c.firstbranch,c.ybyz from jyzc_xx z, cardinfo c, card_asset_history h "
					+ "where z.id = h.zczsb_id and c.id = h.kp_id and z.id = '"+zcid+"'";
			List queryList = publicDao.queryForList(sql, new ArrayList());
			if(queryList!=null){
				for (int j = 0; j < queryList.size(); j++) {
					String zcLsbId = "";
					Map map = (Map) queryList.get(j);
					String sqlLsb = "select id from jyzc_xx_lsb where cld_id = '"
							+ headId + "' and zcbh = '"
							+ String.valueOf(map.get("zcbh")) + "'";
					List list = publicDao.queryForList(sqlLsb, new ArrayList());
					if (list.size() > 0) {
						Map lsb = (Map) list.get(0);
						zcLsbId = String.valueOf(lsb.get("id"));
					}
					JyzcPdkpXx kp = new JyzcPdkpXx();
					kp.setKpId(String.valueOf(map.get("kpid")));
					kp.setZcId(String.valueOf(map.get("zcid")));
					kp.setZcLsbId(zcLsbId);
					kp.setCldId(headId);
					kp.setCardcode(String.valueOf(map.get("cardcode")));
					kp.setZcname(String.valueOf(map.get("zcname")));
					kp.setFirstbranch(String.valueOf(map.get("firstbranch")));
					kp.setGlbm(String.valueOf(map.get("glbm")));
					kp.setUsepartment(String.valueOf(map.get("usepartment")));
					kp.setYbyz(Double.valueOf(map.get("ybyz").toString()));
					kp.setSpzt("审批中");
					kp.setPdzt("1");
					publicDao.save(kp);
				}
			}
		}
	}
	
	/**
	 * 查找卡片临时表中的内容
	 * @param headId
	 * @return
	 */
	public String queryCardLSB(String headId ,String pdzt) {
		String sql = "select * from jyzc_pdkp_xx where pdzt= ? and cld_id = '" + headId + "' order by ZC_ID desc" ;
		List params =  new ArrayList();
		params.add(pdzt);
		List list = publicDao.queryForList(sql, params);
		List<CheckForCard> cardList = new ArrayList<CheckForCard>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map)list.get(i);
			String zcid = String.valueOf(map.get("zc_id")); // 资产正式表id
			JyzcXx xx = (JyzcXx)this.findById(JyzcXx.class, zcid);
			CheckForCard card = new CheckForCard();
			card.setId(String.valueOf(map.get("id")));
			card.setKpid(String.valueOf(map.get("kp_id")));
			card.setCardcode(String.valueOf(map.get("cardcode")));
			card.setFirstbranch(findCateNameByParentId(String.valueOf(map.get("firstbranch"))));
			card.setGlbm(findCateNameByNodeValue("department",String.valueOf(map.get("glbm"))));
			card.setUsepartment(findCateNameByNodeValue("department",String.valueOf(map.get("usepartment"))));
			card.setZcbh(xx.getZcbh());
			card.setZcmc(xx.getZcmc());
			card.setZcname(String.valueOf(map.get("zcname")));
			card.setYbyz(Double.valueOf(map.get("ybyz").toString()));
			cardList.add(card);
		}
		String json = BodyListToJSON.getJSON(cardList, 1, 1, 10000);
		return json;
	}
	/**
	 * 根据卡片编号 卡片名称 查询不在盘点中的卡片信息
	 * @param headId
	 * @param cardcode
	 * @param cardname
	 * @return
	 */
	public String queryCardLSB(String headId ,String cardcode,String cardname) {
		List params =  new ArrayList();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from jyzc_pdkp_xx where pdzt= '0' and cld_id = '" + headId + "'");
		if(cardcode!=null&&cardcode.trim()!=""){
			sql.append("and cardcode like ?");
			params.add("%" + cardcode + "%");
		}
		if(cardname!=null&&cardname.trim()!=""){
			sql.append("and zcname like ?");
			params.add("%" + cardname + "%");
		}
		
		List list = publicDao.queryForList(sql.toString(), params);
		List<CheckForCard> cardList = new ArrayList<CheckForCard>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map)list.get(i);
			String zcid = String.valueOf(map.get("zc_id")); // 资产正式表id
			JyzcXx xx = (JyzcXx)this.findById(JyzcXx.class, zcid);
			CheckForCard card = new CheckForCard();
			card.setId(String.valueOf(map.get("id")));
			card.setKpid(String.valueOf(map.get("kp_id")));
			card.setCardcode(String.valueOf(map.get("cardcode")));
			card.setFirstbranch(findCateNameByParentId(String.valueOf(map.get("firstbranch"))));
			card.setGlbm(findCateNameByNodeValue("department",String.valueOf(map.get("glbm"))));
			card.setUsepartment(findCateNameByNodeValue("department",String.valueOf(map.get("usepartment"))));
			card.setZcbh(xx.getZcbh());
			card.setZcmc(xx.getZcmc());
			card.setZcname(String.valueOf(map.get("zcname")));
			card.setYbyz(Double.valueOf(map.get("ybyz").toString()));
			cardList.add(card);
		}
		String json = BodyListToJSON.getJSON(cardList, 1, 1, 10000);
		return json;
	}
	/**
	 * 根据资产id查找卡片信息
	 * 
	 * @param zcid
	 * @return
	 */
	public String query4CardLSBIds(String zcid, String headId) {
		String cardLSBId = "";
		List<CheckForCard> resultList = new ArrayList<CheckForCard>();
		String sql = "select id from jyzc_pdkp_xx where cld_id = '" + headId
				+ "' and zc_lsb_id = '" + zcid + "' ";
		List queryList = publicDao.queryForList(sql, new ArrayList());
		for (int j = 0; j < queryList.size(); j++) {
			Map map = (Map) queryList.get(j);
			CheckForCard check = new CheckForCard();
			cardLSBId = cardLSBId + String.valueOf(map.get("id")) + ",";
		}
		return cardLSBId;
	}
	
	/**
	 *取消盘点卡片
	 * @param kpids
	 */
	public void deleteCardLSB(String[] kpids){
		for(int i = 0 ; i < kpids.length;i++){
			JyzcPdkpXx xx = (JyzcPdkpXx)publicDao.findById(JyzcPdkpXx.class, kpids[i]);
			xx.setPdzt("0");
			publicDao.update(xx);
		}
	}
	/**
	 * 添加盘点卡片
	 * @param kpids
	 */
	public void addCardLSB(String[] kpids){
		for(int i = 0 ; i < kpids.length;i++){
			JyzcPdkpXx xx = (JyzcPdkpXx)publicDao.findById(JyzcPdkpXx.class, kpids[i]);
			xx.setPdzt("1");
			publicDao.update(xx);
		}
	}
	/**
	 * 删除盘点表体和卡片临时表信息
	 * @param zcIds
	 * @param headId
	 */
	public void deleteBodyAndCardLSB(String[] zcIds,String headId){
		for(int i = 0 ; i < zcIds.length;i++){
			JyzcXxLsb xx = (JyzcXxLsb)publicDao.findById(JyzcXxLsb.class, zcIds[i]);
			publicDao.delete(xx);
			String sql = "delete from jyzc_pdkp_xx where cld_id = '"+headId+"' and zc_lsb_id = '"+zcIds[i]+"'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}
	
	/**
	 * 办结盘点
	 * @param headId
	 */
	public String doOver(String headId) {
		String cardId = "";
		String selBody = "select * from jyzc_xx_lsb where cld_id = '" + headId + "' ";
		List bodyList = publicDao.queryForList(selBody, new ArrayList());
		for (int i = 0; i < bodyList.size(); i++) {
			Map map = (Map) bodyList.get(i);
			String zcLSBid = String.valueOf(map.get("id"));
			String zcbh = String.valueOf(map.get("zcbh"));
			String selCardLSB = "select * from jyzc_pdkp_xx where pdzt ='1' and cld_id = '"
					+ headId + "' and zc_lsb_id = '" + zcLSBid + "'";
			List cardLSBList = publicDao.queryForList(selCardLSB, new ArrayList());
			int cardLSBNum = cardLSBList.size();
			String selCard = "select c.id as kpid,z.id as zcid,z.zcbh, z.zcmc, c.cardcode,c.zcname,c.glbm,c.usepartment,"
					+ "c.firstbranch,c.ybyz from jyzc_xx z, cardinfo c, card_asset_history h "
					+ "where z.id = h.zczsb_id and c.id = h.kp_id and z.zcbh = '"
					+ zcbh + "'";
			List cardList = publicDao.queryForList(selCard, new ArrayList());
			int cardNum = cardList.size();
			if (cardNum == cardLSBNum) { // 如果卡片临时表里面的数据等于
				String updateSql = "update jyzc_xx set c_zczc = '08' where zcbh = '" + zcbh + "' ";
				publicDao.getJdbcTemplate().execute(updateSql);
			}
			if(cardLSBList.size()!=0 && cardLSBList.size()>0){
				for (int j = 0; j < cardLSBList.size(); j++) {
					Map card = (Map)cardLSBList.get(j);
					cardId = cardId + String.valueOf(card.get("kp_id"))+",";
				}
			}
		}
		if(cardId!="" && cardId.length()>0){
			cardId = cardId.substring(0,cardId.length()-1);
			return cardId;
		}else{
			return "ok";
		}
	}
	
	/**
	 * 通过表单id查找办理依据
	 */
	public String findBLYJ(String headId){
		String sql = "select * from common_according where bdid = '"+headId+"'";
		String blyjId = "";
		List list = publicDao.queryForList(sql, new ArrayList());
		for(int i = 0;i<list.size();i++){
			Map map = (Map)list.get(i);
			blyjId = blyjId + String.valueOf(map.get("id")) + ",";
		}
		return blyjId;
	}

	public String setcard(String zcId, String cardId) {
		String result="添加成功";
		String[] cardIds = null;
		cardIds = cardId.split(",");
		for (int i = 0; i < cardIds.length; i++) {
			CardAssetHistory cardAssetHistory = new CardAssetHistory();
			cardAssetHistory.setZcId(zcId);
			cardAssetHistory.setKpId(cardIds[i]);
			cardAssetHistory.setGjksrq(new Date());// 挂接开始日期
			cardAssetHistory.setDqgjzt("0");
			cardAssetHistory.setSfwzkp("0");
			this.save(cardAssetHistory);
		}
		return null;
	}

	public CardAssetHistory getCardAssetHistoryByZcId(String zcId, String kpId) {
		List<CardAssetHistory>  CardAssetHistoryList = new ArrayList();
		CardAssetHistory cardAssetHistory = new  CardAssetHistory();
		List params = new ArrayList();
		params.add(zcId);
		params.add(kpId);
		String preparedHQL = "from CardAssetHistory o where o.zcId = ? and kpId=? ";
		CardAssetHistoryList = (List<CardAssetHistory>) publicDao.find(preparedHQL, params);
		if(CardAssetHistoryList.size()>0){
			cardAssetHistory = CardAssetHistoryList.get(0);
			return cardAssetHistory;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 资产处置项目信息查询 add by lantianbo 2011-1-8
	 * @return
	 */
	public String findCzXxList(String zcId){
		StringBuffer sb = new StringBuffer("")
				.append(" select f.*, e.c_czfs as czfs from ")
				.append(" (select a.id, a.fenlei, a.cld_id, c.id as lsbid, a.czxmmc,  a.zhuangtai, d.hycs  ")
				.append(" from CZ_XM_XX a, CZ_XMXX_LSB c, CZ_HYXX d  ")
				.append(" where a.xmlsb = c.id and c.hy_id = d.id  ")
				.append(" and a.cld_id in  ")
				.append(" (select distinct b.cld_id from CZ_ZC_XX b ")
				.append(" where b.zhuangtai = '2' and b.azcid = ?) ")
				.append(" ) f,  CZ_ZC_XX e ")
				.append(" where f.cld_id = e.cld_id  and  e.azcid = ?");
		String jsonStr = "";
		List list = this.publicDao.queryForList(sb.toString(), new Object[]{zcId,zcId});
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			CzxxVO vo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				vo = new CzxxVO();
				vo.setId(String.valueOf(map.get("id")));
				vo.setFenlei(String.valueOf(map.get("fenlei")));
				vo.setLsbId(String.valueOf(map.get("lsbid")));
				vo.setCzxmmc(String.valueOf(map.get("czxmmc")));
				vo.setCzfs(findCodeByKey(String.valueOf(map.get("czfs")),"ASSET_DISPOSE_METHOD"));
				vo.setCldId(String.valueOf(map.get("cld_id")));
				String zt = String.valueOf(map.get("zhuangtai"));
				if(ZcczCommon.PROJECT_TYPE_WZX.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_WZX_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_YJA.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_YJA_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_ZXZ.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_ZXZ_ZH;
				}else{
					zt = "";
				}
				vo.setZhuangtai(zt);
				vo.setHycs(String.valueOf(map.get("hycs")));
				List spwyList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_SPWY);//查询审批委员
				StringBuffer name = new StringBuffer("");
				for(int j=0;j<spwyList.size();j++){
					CzXmSpwYj spwy = (CzXmSpwYj) spwyList.get(j);
					name.append(spwy.getSpwyxm());
					if(j != spwyList.size()-1){
						name.append(",");
					}
				}
				List zcrList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_ZCR);//查询审批委员
				vo.setSpwy(name.toString());
				if(zcrList!=null&&zcrList.size()>0){
					CzXmSpwYj zcr = (CzXmSpwYj) zcrList.get(0);
					vo.setZcr(String.valueOf(zcr.getSpwyxm()));
				}
				returnList.add(vo);
			}
		}
		jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		return jsonStr;
	}
	/**
	 * 查询code表的value字段
	 * @param codeKey
	 * @param codeType
	 * @return
	 */
	public String findCodeByKey(String codeKey,String codeType){
		String sql = "from Code e where e.codeKey = ? and e.codeType = ? ";
		String value = "";
		Code code = (Code) publicDao.findSingleResult(sql, new Object[]{codeKey,codeType});
		if(code !=null){
			value  = code.getCodeValue();
		}
		return value;
	}
	/**
	 * 根据项目id查询主持人，或审批委员 
	 * @param id
	 * @return
	 */
	public List findSpwyByLsbId(String id,String isZcrOrSpwy) {
		
		String sql = "from CzXmSpwYj x where x.sfwzcr = ? and x.xmId = ?";
		List list = publicDao.find(sql, new Object[]{isZcrOrSpwy,id});
		return list;
	}
	
	/**
	 * 从正式表里查出的数据到临时表里 但是不能重复添加
	 * @param id
	 * @return
	 */
	public String queryForSingle(String cldId,String zcIds){
		//用来拼接临时表里存在的资产编号的值 用拼接字符串的格式
		
		String sql = "select CLD_ID,ZCBH from jyzc_xx_lsb t where t.CLD_ID = ?";
		String buffer = "";
		List list = this.publicDao.queryForList(sql, new Object[]{cldId});
		if((list!=null && list.size()>0)&&(zcIds!=null&&zcIds.length()>0)){
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				String id = String.valueOf(map.get("CLD_ID"));
				String bh = String.valueOf(map.get("ZCBH"));
				if(zcIds.startsWith(",")){
					zcIds = zcIds.substring(1);
				}
				if("".equals(cldId)){
					return "";
				}
				String[] zcId = zcIds.split(",");
				for (int j = 0; j < zcId.length; j++) {
					if(zcId[j].equals(id)){
						buffer += (zcId[i]+",");
					}
				}
				if (buffer.endsWith(",")) {
					buffer = buffer.substring(0, buffer.length() - 1);
				}
			}
		}
		return buffer;
	}
	
	/**
	 * 通过headid查找表头表的信息
	 * 
	 * @param headId
	 * @return
	 */
	public JyzcHead findHeadByHeadId(String headId) {
		return (JyzcHead) publicDao.findById(JyzcHead.class, headId);
	}
	
	/**
	 * 根据headid查找办理依据
	 * @param headId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String yjId){
		String pthql ="select  t from PTEnd t where t.headId =? ";
		List ptparams = new ArrayList();
		CommonAccording blyj = new CommonAccording();
		ptparams.add(yjId);
		List pTEndList = publicDao.find(pthql, ptparams);
		if(pTEndList!=null&&pTEndList.size()==1){
			PTEnd  pTEnd =new PTEnd();
			pTEnd = (PTEnd) pTEndList.get(0);
			blyj.setBdid(headId);
			blyj.setBh(pTEnd.getSheetId());
			blyj.setBt(pTEnd.getTitle());
			blyj.setLcid(pTEnd.getProcInstId());
			blyj.setLcmc(pTEnd.getProcInstName());
			blyj.setNgr(pTEnd.getDraftUserId().toString());
			blyj.setNgrq(pTEnd.getDraftDate());
			blyj.setUrl(pTEnd.getUrl()+"?"+"id="+pTEnd.getId());
			blyj.setUserCode(pTEnd.getUserId().toString());
			blyj.setDel(new Long(0));
			blyj.setTbdid(yjId);
			blyj.setSource("EAM");
		}
		return blyj;
	}

	@SuppressWarnings("unchecked")
	public List<Cardinfo> getCardInfoByZczsbId(String zczsbId) {
		String hql = "select o from Cardinfo o,CardAssetHistory his where o.id = his.kpId and his.dqgjzt = '"
				+ JygdzcCommon.CURRENT_ASSET_CARD_CONN + "' and his.zczsbId = ?";
		Object[] params = new Object[] {zczsbId};
		List<Cardinfo> list = (List<Cardinfo>) this.publicDao.find(hql, params);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public Cardinfo getMainCardByZczsbId(String zizsbId) {
		Cardinfo cardinfo = null;
		// 查询主卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		Object[] params = new Object[] { zizsbId };
		List<CardAssetHistory> tempList = (List<CardAssetHistory>) publicDao
				.find(hql, params);
		if (tempList != null && tempList.size() > 0) {
			CardAssetHistory temp = tempList.get(0);
			cardinfo = this.publicDao.findById(Cardinfo.class, Long
					.valueOf(temp.getKpId()));
		}
		return cardinfo;
	}

	/**
	 * 取得经营资产list
	 * @param ids	: JyzcXx.id
	 * @return	List<JyzcXx>
	 */
	public List<JyzcXx> getJygdzcListByIds(String[] ids) {
		List<JyzcXx> jyzcxxList = new ArrayList<JyzcXx>();
		for(String id : ids){
			jyzcxxList.add(publicDao.findById(JyzcXx.class, id));
		}
		return jyzcxxList;
	}

	public List <CardAssetHistory> checkCard(String ids) {
		String sql = "from CardAssetHistory card where card.dqgjzt='0' and card.kpId =? and card.spzt='2'";
		List params = new ArrayList();
		params.add(ids);
		List <CardAssetHistory> list  =(List<CardAssetHistory>) publicDao.find(sql, params);
		return list;
	}

	public List<JyzcExmineVO> getjyzcExmineVOByCondition(String zcId,String kpbh, String hcpgnf ,String zclx) {
		StringBuffer hql =new StringBuffer();
		List list =new ArrayList();
		List  jyzcExmineVOList =new ArrayList();
		List params =new ArrayList();
		if(zcId==null||zclx==null){
			return jyzcExmineVOList;
		}else{
			params.add(zcId);
		}
		if(hcpgnf!=null&&!"".equals(hcpgnf)&&!"2010".equals(hcpgnf.trim())){
			return jyzcExmineVOList;
		}else{
			if(zclx!=null&&"buildingInfo".equals(zclx.trim())){
				hql.append("from  AeRealEstate t where t.zcId =? ");
			}else if(zclx!=null&&"vehicleInfo".equals(zclx.trim())){
				hql.append("from  AeVehicle t where t.zcId =?");
			}else if(zclx!=null&&"elseInfo".equals(zclx.trim())){
				hql.append("from AeMachineEquipment t where t.zcId =?");
			}
			if(kpbh!=null&&!"".equals(kpbh.trim())){
				params.add(kpbh);
				hql.append("and t.kpbh =?");
			}
			list = publicDao.find(hql.toString(), params);
			
			if(list!=null&&list.size()>0){
				for(int i=0 ;i<list.size();i++){
					JyzcExmineVO jyzcExmineVO = new JyzcExmineVO();
					if(zclx!=null&&"buildingInfo".equals(zclx.trim())){
						AeRealEstate aeRealEstate = new AeRealEstate();
						aeRealEstate = (AeRealEstate) list.get(i);
						jyzcExmineVO.setId(aeRealEstate.getId());
						jyzcExmineVO.setKpbh(aeRealEstate.getKpbh()==null?"":aeRealEstate.getKpbh());
						if(aeRealEstate.getKpbh()!=null&&!"".equals(aeRealEstate.getKpbh())){
							Cardinfo cardinfo =cardAddBSImpl.findCardinfoByCardCode(aeRealEstate.getKpbh());
							jyzcExmineVO.setKpmc(cardinfo.getZcname()==null?"":cardinfo.getZcname());
						}
						jyzcExmineVO.setHcpgnf("2010");
					}else if(zclx!=null&&"vehicleInfo".equals(zclx.trim())){
						AeVehicle aeVehicle = new AeVehicle();
						aeVehicle = (AeVehicle) list.get(i);
						jyzcExmineVO.setId(aeVehicle.getId());
						jyzcExmineVO.setKpbh(aeVehicle.getKpbh()==null?"":aeVehicle.getKpbh());
						if(aeVehicle.getKpbh()!=null&&!"".equals(aeVehicle.getKpbh())){
							Cardinfo cardinfo =cardAddBSImpl.findCardinfoByCardCode(aeVehicle.getKpbh());
							jyzcExmineVO.setKpmc(cardinfo.getZcname()==null?"":cardinfo.getZcname());
						}
						jyzcExmineVO.setHcpgnf("2010");
					}else if(zclx!=null&&"elseInfo".equals(zclx.trim())){
						AeMachineEquipment aeMachineEquipment = new AeMachineEquipment();
						aeMachineEquipment = (AeMachineEquipment) list.get(i);
						jyzcExmineVO.setId(aeMachineEquipment.getId());
						jyzcExmineVO.setKpbh(aeMachineEquipment.getKpbh()==null?"":aeMachineEquipment.getKpbh());
						if(aeMachineEquipment.getKpbh()!=null&&!"".equals(aeMachineEquipment.getKpbh())){
							Cardinfo cardinfo =cardAddBSImpl.findCardinfoByCardCode(aeMachineEquipment.getKpbh());
							jyzcExmineVO.setKpmc(cardinfo.getZcname()==null?"":cardinfo.getZcname());
						}
						jyzcExmineVO.setHcpgnf("2010");
					}
					jyzcExmineVO.setZclx(zclx);
					jyzcExmineVOList.add(jyzcExmineVO);
				}
			}
		}
		return jyzcExmineVOList;
	}

}