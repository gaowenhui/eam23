package com.tansun.eam2.zccz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.AssetCardUtil;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.zccz.service.IDealEvalBodyDao;
import com.tansun.eam2.zccz.ucc.IDealEvalBodyService;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class DealEvalBodyServiceImpl implements IDealEvalBodyService {

	private IDealEvalBodyDao bodyDao;
	private IAssetBS assetBS;
	private ICodeService codeBS;
	private AssetCardUtil assetCardUtil;

	@Autowired
	public void setAssetCardUtil(AssetCardUtil assetCardUtil) {
		this.assetCardUtil = assetCardUtil;
	}

	@Autowired
	public void setCodeBS(ICodeService codeBS) {
		this.codeBS = codeBS;
	}

	/**
	 * 添加body
	 * 
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public void addBodys(List<String> assetIdList, String assetType,
			String cldId) throws IllegalAccessException,
			InvocationTargetException {
		this.addBodys((String[]) assetIdList.toArray(), assetType, cldId);
	}

	// 新增评估资产
	public void addBodys(String[] assetIdArray, String assetType, String cldId)
			throws IllegalAccessException, InvocationTargetException {
		List<CzPgxxLsb> pgxxList = createBodyList(assetIdArray, cldId,
				assetType);
		bodyDao.addBodys(pgxxList);
		refreshHeadMoney(cldId);
	}

	public PageableList getDealEvalVOPage(Paginator paginator, String cldId,
			String assetType) throws IllegalAccessException,
			InvocationTargetException {

		return bodyDao.getBodyPagerByCldId(paginator, cldId);
		/*
		 * if(StringUtils.equals(assetType, ZcczCommon.MANAGE_FIXED_ASSEET)){
		 * //经营性固定资产 }else if(StringUtils.equals(assetType,
		 * ZcczCommon.ENTITY_ASSET)){ //实体内资产 return null; }else
		 * if(StringUtils.equals(assetType, ZcczCommon.LOAN_PLEDGE)){ //委贷抵债物
		 * return null; }else if(StringUtils.equals(assetType,
		 * ZcczCommon.ZYZC_ASSET)){ //自用资产 return null; }else{ return null; }
		 */
	}

	/**
	 * 通过id查找ZcPgXx信息
	 * 
	 * @param id
	 * @return
	 */
	public ZcPgXx getZcPgXxInfo(String id) {

		return (ZcPgXx) bodyDao.getZcPgXxInfo(id);
	}

	/**
	 * 保存
	 * 
	 * @param cpl
	 * @param id
	 * @param czpgscclid
	 */
	public void saveBodyInfo(CzPgxxLsb cpl, String id, String czpgscclid) {
		ZcPgXx zc = this.getZcPgXxInfo(id);
		CzPgxxLsb czplb = this.getCzPgxxLsbInfo(zc.getStfsxxid(), czpgscclid);
		if (czplb == null) {
			// BeanUtils.copyProperties(zc, cpl, new String []{"id"});
			cpl = this.copyPgXx2LSB(zc, cpl);
			cpl.setCzpgscclid(czpgscclid);
			bodyDao.saveBody(cpl);
		} else {
			// BeanUtils.copyProperties(zc, czplb, new String []{"id"});
			czplb = this.copyPgXx2LSB(zc, czplb);
			czplb.setCzpgscclid(czpgscclid);
			bodyDao.updateBody(czplb);
		}
		try {
			refreshHeadMoney(czpgscclid);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	public CzPgxxLsb copyPgXx2LSB(ZcPgXx zc, CzPgxxLsb cp) {
		cp.setBeizhu(zc.getBeizhu());
		cp.setBxe(zc.getBxe());
		cp.setCcfwz(zc.getCcfwz());
		cp.setCCzfs(zc.getCCzfs());
		cp.setCJzlx(zc.getCJzlx());
		cp.setCsjzyr(zc.getCsjzyr());
		cp.setCzcbh(zc.getCzcbh());
		cp.setCzclx(zc.getCzclx());
		cp.setCzcmc(zc.getCzcmc());
		cp.setDkzh(zc.getDkzh());
		cp.setGqjzrjzcz(zc.getGqjzrjzcz());
		cp.setGqstglbm(zc.getGqstglbm());
		cp.setGqstid(zc.getGqstid());
		cp.setGqstmc(zc.getGqstmc());
		cp.setGqstsf(zc.getGqstsf());
		cp.setGqstwtgljg(zc.getGqstwtgljg());
		cp.setGqstzl(zc.getGqstzl());
		cp.setGrzye(zc.getGrzye());
		cp.setJingzhi(zc.getJingzhi());
		cp.setJygczcbh(zc.getJygczcbh());
		cp.setJzrzmjz(zc.getJzrzmjz());
		cp.setPgff(zc.getPgff());
		cp.setPgjg(zc.getPgjg());
		cp.setPgjzr(zc.getPgjzr());
		cp.setPgjzrzmzqz(zc.getPgjzrzmzqz());
		cp.setPgmd(zc.getPgmd());
		cp.setPgzclb(zc.getPgzclb());
		cp.setPingguzhi(zc.getPingguzhi());
		cp.setSfmc(zc.getSfmc());
		cp.setSpzt("0");
		cp.setStcfwz(zc.getStcfwz());
		cp.setStfsxxid(zc.getStfsxxid());
		cp.setStid(zc.getStid());
		cp.setStmc(zc.getStmc());
		cp.setStsjzyr(zc.getStsjzyr());
		cp.setSttzclx(zc.getSttzclx());
		cp.setStzcbh(zc.getStzcbh());
		cp.setStzclb(zc.getStzclb());
		cp.setStzcmc(zc.getStzcmc());
		cp.setWdid(zc.getWdid());
		cp.setXzlb(zc.getXzlb());
		cp.setZcid(zc.getZcid());
		cp.setZclb(zc.getZclb());
		cp.setZclbbm(zc.getZclbbm());
		cp.setZcmc(zc.getZcmc());
		cp.setZcybyz(zc.getZcybyz());
		cp.setZczmjz(zc.getZczmjz());
		cp.setZjfd(zc.getZjfd());
		cp.setZjz(zc.getZjz());
		cp.setZkpbh(zc.getZkpbh());
		cp.setZqid(zc.getZqid());
		cp.setZqzl(zc.getZqzl());
		cp.setZwrmc(zc.getZwrmc());
		cp.setZybgdd(zc.getZybgdd());
		cp.setZyccyz(zc.getZyccyz());
		cp.setZykpbh(zc.getZykpbh());
		cp.setZykpmc(zc.getZykpmc());
		cp.setZyzcbh(zc.getZyzcbh());
		cp.setZyzcid(zc.getZyzcid());
		cp.setZyzcmc(zc.getZyzcmc());
		return cp;
	}

	public void saveBody(CzPgxxLsb cpl) {
		bodyDao.saveBody(cpl);
	}

	public void updateBody(CzPgxxLsb cpl) {
		bodyDao.updateBody(cpl);
	}

	/**
	 * 通过stfsxxid查找信息
	 * 
	 * @param stfsxxid
	 * @return
	 */
	public CzPgxxLsb getCzPgxxLsbInfo(String stfsxxid, String czpgscclid) {
		return bodyDao.getCzPgxxLsbInfo(stfsxxid, czpgscclid);
	}

	/**
	 * 显示czpgscclid相同的 数据
	 * 
	 * @param czpgscclid
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public List<CzPgxxLsb> getCzPgxxLsbList(String czpgscclid)
			throws IllegalAccessException, InvocationTargetException {

		return bodyDao.getCzPgxxLsbList(czpgscclid);
	}

	public void deleteBody(String cldId, String[] id)
			throws IllegalAccessException, InvocationTargetException {
		bodyDao.deletCzPgxxLsbInfo(cldId, id);
		this.refreshHeadMoney(cldId);
	}

	public void modifyBody() {
		// TODO Auto-generated method stub

	}

	public void saveBody() {
		// TODO Auto-generated method stub

	}

	public void vidwBody() {
		// TODO Auto-generated method stub

	}

	@Autowired
	public void setBodyDao(IDealEvalBodyDao bodyDao) {
		this.bodyDao = bodyDao;
	}

	@Autowired
	public void setAssetBS(IAssetBS assetBS) {
		this.assetBS = assetBS;
	}

	/**
	 * 创建评估信息List
	 * 
	 * @param assetIdArray
	 *            ：assetType=0时表示经营性固定资产的id数组，assetType=3时表示实体的id数组
	 * @param cldId
	 * @param assetType
	 *            评估资产类别
	 * @return
	 */
	private List<CzPgxxLsb> createBodyList(String[] assetIdArray, String cldId,
			String assetType) {
		CzPgscZskwhCld cld = (CzPgscZskwhCld) bodyDao.findById(
				CzPgscZskwhCld.class, cldId);
		List<CzPgxxLsb> bodyList = new ArrayList<CzPgxxLsb>();
		for (String assetId : assetIdArray) {
			if (StringUtils.isNotEmpty(assetId.trim())) {
				CzPgxxLsb body = new CzPgxxLsb();
				body.setCzpgscclid(cldId);
				if (StringUtils.equals("0", assetType)) {
					// 经营性固定资产
					JyzcXx asset = (JyzcXx) assetBS.findById(JyzcXx.class,
							assetId);
					body.setZcid(asset.getId());
					body.setJygczcbh(asset.getZcbh());
					body.setZcmc(asset.getZcmc());
					body.setSfmc(codeBS.findCodeValueByCodeTypeAndCodeKey(
							"PROVIENCE", asset.getCZcdq()));
					body.setZclb(asset.getCZczlbm());
					body.setZclbbm(asset.getCZczlbm());
					Cardinfo card = assetCardUtil.getCardinfo(asset.getId());
					if (card != null)
						body.setZkpbh(card.getCardcode());
					Map<String, Double> assetCardMap = assetCardUtil
							.getYbyz(asset.getId());
					body.setZcybyz(assetCardMap.get("ybyz"));
					body.setZczmjz(assetCardMap.get("je"));
					body.setZjz(assetCardMap.get("jz"));
					body.setPgzclb("0");
					body.setSpzt(cld.getCldzt());
				} else if (StringUtils.equals("3", assetType)) {
					// 股权（也就是实体）
					StJbxx st = (StJbxx) bodyDao
							.findById(StJbxx.class, assetId);
					body.setGqstid(st.getId());
					body.setGqstglbm(st.getCGlbm());
					body.setGqstmc(st.getStzwmc());
					body.setGqstsf(st.getCShengfen());
					body.setGqstwtgljg(st.getCWtgljg());
					body.setGqstzl(st.getStlx());
					body.setPgzclb("3");
				} else if (StringUtils.equals("4", assetType)) {
					// 债权
					DebtInfo debt = (DebtInfo) bodyDao.findById(DebtInfo.class,
							assetId);
					body.setZqid(debt.getId());
					body.setZqzl(debt.getZqzl());
					body.setZwrmc(debt.getZwrmc());
					body.setGrzye(debt.getGrzye());
					body.setPgzclb("4");
				} else if (StringUtils.equals("5", assetType)) {
					// 自用资产
					ZyZc zyzc = (ZyZc) bodyDao.findById(ZyZc.class, assetId);
					// 资产id
					body.setZyzcid(zyzc.getZcId());
					// 资产编号
					body.setZyzcbh(zyzc.getZcbh());
					// 资产名称
					body.setZyzcmc(zyzc.getZcmc());
					// 自用资产卡片编号
					body.setZykpbh(zyzc.getKpbh());
					body.setZykpmc(bodyDao.getCardNameByCode(zyzc.getKpbh()));
					// 自用资产财产原值
					body.setZyccyz(zyzc.getCzyz());
					// 自用资产保管地点
					body.setZybgdd(zyzc.getBgdd());
					body.setPgzclb("5");
				}
				body.setGqjzrjzcz(0D);
				body.setPingguzhi(0D);
				body.setZjz(0D);
				body.setZjfd(0D);
				body.setJzrzmjz(0D);
				body.setPgjzrzmzqz(0D);
				bodyList.add(body);
			}
		}
		return bodyList;
	}

	public CzPgxxLsb getCzPgxxLsbInfo(String stfsxxid) {
		return null;
	}

	// 删除经营性固定资产
	public void delAssets(String cldId, String assetIds)
			throws IllegalAccessException, InvocationTargetException {
		assetIds = IdStrFormat.formatIds(assetIds);
		bodyDao.delAssets(cldId, assetIds);
		refreshHeadMoney(cldId);
	}

	public CzPgxxLsb getpgXxLsbById(String id) {
		return (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class, id);
	}

	// update评估信息
	public void updatePgxx(CzPgxxLsb pgxx) throws IllegalAccessException,
			InvocationTargetException {
		CzPgxxLsb pgxxLsb = (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class, pgxx
				.getId());
		NumberFormat format = NumberFormat.getNumberInstance();
		format.setMaximumFractionDigits(4);
		DecimalFormat df = new DecimalFormat("###,###,###,###,##0.0000");
		pgxxLsb.setCJzlx(pgxx.getCJzlx());
		pgxxLsb.setCCzfs(pgxx.getCCzfs());
		pgxxLsb.setBeizhu(pgxx.getBeizhu());
		pgxxLsb.setPgjzr(pgxx.getPgjzr());
		if (pgxx.getPingguzhi() != null) {
			Double pgz = 0d;
			try {
				pgz = df.parse(pgxx.getPingguzhi().toString()).doubleValue();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			pgxxLsb.setPingguzhi(pgz);
		}
		if (pgxx.getJzrzmjz() != null) {
			Double jzrzmjz = 0d;
			try {
				jzrzmjz = df.parse(pgxx.getJzrzmjz().toString()).doubleValue();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			pgxxLsb.setJzrzmjz(jzrzmjz);
		}
		// 评估方法
		pgxxLsb.setPgff(pgxx.getPgff());
		// 评估值-基准日账面价值=增减值
		if (pgxx.getPingguzhi() != null && pgxxLsb.getJzrzmjz() != null) {
			Double zjz = pgxx.getPingguzhi() - pgxxLsb.getJzrzmjz();
			try {
				zjz = df.parse(zjz.toString()).doubleValue();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			pgxxLsb.setZjz(zjz);
		}

		// 增减值/基准日账面价值=增减幅度
		if (pgxxLsb.getJzrzmjz() == null || pgxxLsb.getJzrzmjz() == 0D) {
			pgxxLsb.setZjfd(0D);
		} else {
			BigDecimal zjfdValue = BigDecimal.valueOf(pgxxLsb.getZjz()).divide(
					BigDecimal.valueOf(pgxxLsb.getJzrzmjz()), 4,
					RoundingMode.HALF_UP);
			pgxxLsb.setZjfd(zjfdValue.doubleValue());
		}
		bodyDao.update(pgxxLsb);
		refreshHeadMoney(pgxx.getCzpgscclid());
	}

	// 刷新head与金额相关的属性
	public void refreshHeadMoney(String cldId) throws IllegalAccessException,
			InvocationTargetException {
		CzPgscZskwhCld cld = (CzPgscZskwhCld) bodyDao.findById(
				CzPgscZskwhCld.class, cldId);
		List<CzPgxxLsb> pgxxList = bodyDao.getCzPgxxLsbList(cldId);
		BigDecimal zmjz = new BigDecimal("0.00");
		BigDecimal zmyz = new BigDecimal("0.00");
		BigDecimal zjz = new BigDecimal("0.00");
		BigDecimal zjfd = new BigDecimal("0.00");
		BigDecimal pgzz = new BigDecimal("0.00");
		// 基准日账面价值
		BigDecimal jzrzmjz = new BigDecimal("0.00");
		for (CzPgxxLsb lsb : pgxxList) {
			// String MANAGE_FIXED_ASSEET = "0"; //经营性固产
			if (StringUtils.equals("0", lsb.getPgzclb())) {
				// 账面价值
				zmjz = zmjz.add(BigDecimal.valueOf(lsb.getZczmjz()));
				zmyz = zmyz.add(BigDecimal.valueOf(lsb.getZcybyz()));
			} else if (StringUtils.equals("3", lsb.getPgzclb())) {
				// String ENTITY = "3"; //实体（承继投资使用、评估审查使用）
				jzrzmjz = jzrzmjz.add(BigDecimal.valueOf(lsb.getGqjzrjzcz()));
			} else if (StringUtils.equals("7", lsb.getPgzclb())) {
				// String STOCK = "7"; //债券 updated by liubeibei.
				zmjz = zmjz.add(BigDecimal.valueOf(lsb.getPgjzrzmzqz()));
			}
			// 基准日账面价值
			jzrzmjz = jzrzmjz.add(BigDecimal.valueOf(lsb.getJzrzmjz()));
			// 评估总值（元）
			pgzz = pgzz.add(BigDecimal.valueOf(lsb.getPingguzhi()));
		}
		// 增减值 评估值-基准日账面价值=增减值
		zjz = pgzz.add(jzrzmjz.negate());
		if (jzrzmjz.compareTo(new BigDecimal("0.0")) != 0)
			// 增减值/基准日账面价值=增减幅度
			zjfd = zjz.divide(jzrzmjz, 4, RoundingMode.HALF_UP);
		cld.setZczmjz(zmjz.doubleValue());
		cld.setZczmyz(zmyz.doubleValue());
		cld.setZjz(zjz.doubleValue());
		cld.setZjfd(zjfd.doubleValue());
		cld.setPgzz(pgzz.doubleValue());
		// Added by liubeibei.
		cld.setJzrzmjz(jzrzmjz.doubleValue());
		bodyDao.update(cld);
	}

	public void updateGqjzrjzcz(String bodyId, Double gqjzrjzcz,
			Double pingguzhi) throws IllegalAccessException,
			InvocationTargetException {
		bodyDao.updateGqjzrjzcz(bodyId, gqjzrjzcz, pingguzhi);
		CzPgxxLsb pgxxLsb = (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class,
				bodyId);
		refreshHeadMoney(pgxxLsb.getCzpgscclid());
	}

	public void updatePgjzrzmzqz(String bodyId, Double pgjzrzmzqz,
			Double pingguzhi) throws IllegalAccessException,
			InvocationTargetException {
		bodyDao.updatePgjzrzmzqz(bodyId, pgjzrzmzqz, pingguzhi);
		CzPgxxLsb pgxxLsb = (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class,
				bodyId);
		refreshHeadMoney(pgxxLsb.getCzpgscclid());
	}

	public String getStlxById(String stId) {
		StJbxx jbxx = (StJbxx) bodyDao.findById(StJbxx.class, stId);
		String zixunlx = null;
		if (jbxx != null) {
			zixunlx = jbxx.getStlx();
		}
		return zixunlx;
	}

}
