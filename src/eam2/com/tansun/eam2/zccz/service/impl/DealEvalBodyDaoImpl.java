package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.zccz.service.IDealEvalBodyDao;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

@Repository
public class DealEvalBodyDaoImpl extends CommonBSImpl implements
		IDealEvalBodyDao {

	private PublicDao publicDao;
	@Autowired
	private ICodeService codeServiceImpl;

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public void addBodys(List<CzPgxxLsb> bodyIdList) {
		for (CzPgxxLsb body : bodyIdList) {
			if (StringUtils.equals("0", body.getPgzclb())) {
				// 过滤保存
				if (publicDao.find(
						"from CzPgxxLsb o where o.czpgscclid=? and o.zcid=?",
						new String[] { body.getCzpgscclid(), body.getZcid() })
						.size() == 0)
					publicDao.save(body);
			} else if (StringUtils.equals("3", body.getPgzclb())) {
				// 过滤保存
				if (publicDao
						.find(
								"from CzPgxxLsb o where o.czpgscclid=? and o.gqstid=?",
								new String[] { body.getCzpgscclid(),
										body.getGqstid() }).size() == 0)
					publicDao.save(body);
			} else if (StringUtils.equals("4", body.getPgzclb())) {
				// 过滤保存
				if (publicDao.find(
						"from CzPgxxLsb o where o.czpgscclid=? and o.zqid=?",
						new String[] { body.getCzpgscclid(), body.getZqid() })
						.size() == 0)
					publicDao.save(body);
			} else if (StringUtils.equals("5", body.getPgzclb())) {
				// 过滤保存
				if (publicDao
						.find(
								"from CzPgxxLsb o where o.czpgscclid=? and o.zqid=?",
								new String[] { body.getCzpgscclid(),
										body.getZyzcid() }).size() == 0)
					publicDao.save(body);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public PageableList getBodyPagerByCldId(Paginator paginator, String cldId)
			throws IllegalAccessException, InvocationTargetException {
		String preparHQL = "from CzPgxxLsb body where body.czpgscclid = ? order by body.id";
		List<String> params = new ArrayList<String>();
		params.add(cldId);
		List<CzPgxxLsb> pageList = (List<CzPgxxLsb>) publicDao.find(preparHQL,
				params);
		PageableList voPage = new PageableList();
		// List<CzPgxxLsb> resultList = new ArrayList<CzPgxxLsb>();
		// for(CzPgxxLsb bo : pageList){
		// CzPgxxLsb vo = new CzPgxxLsb();
		// BeanUtils.copyProperties(vo, bo);
		// resultList.add(vo);
		// }
		// voPage.setResults(resultList);
		voPage.setResults(pageList);
		return voPage;
	}

	public List<CardAssetHistory> getCardIdListByAssetId(String assetId) {
		List<String> params = new ArrayList<String>();
		params.add(assetId);
		String preparedHQL = "from CardAssetHistory o where o.zcId=? and o.dqgjzt='1'";
		return (List<CardAssetHistory>) publicDao.find(preparedHQL, params);
	}

	public List<CzPgxxLsb> getPgxxLsbByIds(String assetIds) {
		if (StringUtils.isNotEmpty(assetIds)) {
			return (List<CzPgxxLsb>) publicDao
					.find("from CzPgxxLsb lsb where lsb.id in (" + assetIds
							+ ")");
		}
		return null;
	}

	public void saveBody(CzPgxxLsb cpl) {

		publicDao.save(cpl);
	}

	public void updateBody(CzPgxxLsb cpl) {
		publicDao.update(cpl);
	}

	/**
	 * 通过stfsxxid查找信息
	 * 
	 * @param stfsxxid
	 * @return
	 */
	public CzPgxxLsb getCzPgxxLsbInfo(String stfsxxid, String czpgscclid) {
		String[] params = new String[2];
		params[0] = stfsxxid;
		params[1] = czpgscclid;
		return (CzPgxxLsb) publicDao.findSingleResult(
				" from CzPgxxLsb where stfsxxid=? and czpgscclid=?", params);
	}

	/**
	 * 通过id查找ZcPgXx信息
	 * 
	 * @param id
	 * @return
	 */
	public ZcPgXx getZcPgXxInfo(String id) {
		String[] params = new String[1];
		params[0] = id;

		return (ZcPgXx) publicDao.findSingleResult(" from ZcPgXx where id=?",
				params);
	}

	/**
	 * 显示czpgscclid相同的 数据
	 * 
	 * @param czpgscclid
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	@SuppressWarnings("unchecked")
	public List<CzPgxxLsb> getCzPgxxLsbList(String czpgscclid)
			throws IllegalAccessException, InvocationTargetException {
		List<CzPgxxLsb> boList = (List<CzPgxxLsb>) publicDao
				.find("from CzPgxxLsb where czpgscclid = '" + czpgscclid
						+ "' order by stmc");
		// List<CzPgxxLsb> voList = new ArrayList<CzPgxxLsb>();
		// for(CzPgxxLsb bo : boList){
		// CzPgxxLsb vo = new CzPgxxLsb();
		// BeanUtils.copyProperties(vo, bo);
		// voList.add(vo);
		// }
		// return voList;
		List<CzPgxxLsb> pgList = new ArrayList<CzPgxxLsb>();
		for (int i = 0; i < boList.size(); i++) {
			CzPgxxLsb pg = new CzPgxxLsb();
			String pgff = boList.get(i).getPgff();
			pgff = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey(
					"ESTIMATE_METHOD", pgff);
			BeanUtils.copyProperties(pg, boList.get(i));
			pg.setPgff(pgff);
			pgList.add(pg);
		}
		return pgList;
	}

	/**
	 * 删除CzPgxxLsb信息
	 * 
	 * @param id
	 */
	public void deletCzPgxxLsbInfo(String cldId, String[] id) {

		for (int i = 0; i < id.length; i++) {
			if (StringUtils.isNotEmpty(id[i])) {
				CzPgxxLsb czPgxxLsb = (CzPgxxLsb) publicDao.findSingleResult(
						"from CzPgxxLsb o where o.id =?",
						new Object[] { new String(id[i]) });
				publicDao.delete(czPgxxLsb);
			}
		}
	}

	public void delAssets(String cldId, String assetIds) {
		publicDao.updateBySql("delete from CZ_PGXX_LSB where ID in ("
				+ assetIds + ") and CZPGSCCLID = '" + cldId + "'");
	}

	public void updateGqjzrjzcz(String bodyId, Double gqjzrjzcz,
			Double pingguzhi) {
		publicDao
				.updateBySql(
						"update CZ_PGXX_LSB set GQJZRJZCZ=?, PINGGUZHI=?, ZJZ=?, ZJFD=? where id=?",
						new Object[] {
								gqjzrjzcz,
								pingguzhi,
								pingguzhi - gqjzrjzcz,
								gqjzrjzcz == 0D ? 0D : (pingguzhi - gqjzrjzcz)
										/ gqjzrjzcz * 100, bodyId });
	}

	public void updatePgjzrzmzqz(String bodyId, Double pgjzrzmzqz,
			Double pingguzhi) {
		publicDao
				.updateBySql(
						"update CZ_PGXX_LSB set PGJZRZMZQZ=?, PINGGUZHI=?, ZJZ=?, ZJFD=? where id=?",
						new Object[] {
								pgjzrzmzqz,
								pingguzhi,
								pingguzhi - pgjzrzmzqz,
								pgjzrzmzqz == 0D ? 0D
										: (pingguzhi - pgjzrzmzqz) / pgjzrzmzqz,
								bodyId });
	}

	public String getCardNameByCode(String kpbh) {
		String hql = "from Cardinfo o where o.cardcode = ?";
		Object[] params = new Object[] { kpbh };
		Cardinfo cardinfo = (Cardinfo) this.publicDao.findSingleResult(hql,
				params);
		if (cardinfo != null) {
			return cardinfo.getZcname();
		} else {
			return null;
		}
	}

	public ZcPgXx findPgXx(String zcid, String wdid, String stid, String gqid,
			String zqid, String zyid, Date pgjzr) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sf.format(pgjzr);
		String hql = "from ZcPgXx o where 1=1 ";
		if (zcid != null) {
			hql += " and o.zcid = '" + zcid + "' ";
		}
		if (wdid != null) {
			hql += " and o.wdid = '" + wdid + "' ";
		}
		if (stid != null) {
			hql += " and o.stid = '" + stid + "' ";
		}
		if (gqid != null) {
			hql += " and o.gqstid = '" + gqid + "' ";
		}
		if (zqid != null) {
			hql += " and o.zqid = '" + zqid + "' ";
		}
		if (zyid != null) {
			hql += " and o.zyzcid = '" + zyid + "' ";
		}
		hql += "  and to_char(o.pgjzr,'yyyy-mm-dd') = '" + date + "'";
		List list = publicDao.find(hql);
		ZcPgXx xx = null;
		if (list.size() > 0) {
			xx = (ZcPgXx) list.get(0);
		}
		return xx;
	}

	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}

}
