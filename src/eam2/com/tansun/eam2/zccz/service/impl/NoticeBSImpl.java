package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzNoticeBody;
import com.tansun.eam2.common.model.orm.bo.CzNoticeHead;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.NoticeCommon;
import com.tansun.eam2.zccz.service.INoticeBS;
import com.tansun.eam2.zccz.vo.STZCqueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;

/**
 * 处置公告
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
@Service
public class NoticeBSImpl extends NoticeCommon implements INoticeBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 保存表头信息
	 * 
	 * @param head
	 */
	public void saveHead(CzNoticeHead head) {
		publicDao.save(head);
	}

	/**
	 * 修改表头信息
	 * 
	 * @param head
	 */
	public void updateHead(CzNoticeHead head) {
		publicDao.update(head);
	}

	/**
	 * 通过headid查找head内容
	 * 
	 * @param headId
	 * @return
	 */
	public CzNoticeHead findHeadByHeadId(String headId) {
		String hql = "from CzNoticeHead c where c.id = '" + headId + "'";
		CzNoticeHead head = (CzNoticeHead) publicDao.findSingleResult(hql,
				new ArrayList());
		return head;
	}

	/**
	 * 通过headid查找实体body
	 * 
	 * @param headId
	 */
	public String findSTBodyByHeadId(String headId) {
		String sql = "select * from cz_notice_body where cld_id = '" + headId
				+ "' ";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < list.size(); i++) {
			STZCqueryVO vo = new STZCqueryVO();
			Map map = (Map) list.get(i);
			String id = checkString(map.get("id"));
			String stbId = checkString(map.get("ccb_id"));
			CzStcztz st = publicDao.findById(CzStcztz.class, stbId);
			vo.setId(id);
			vo.setCzysbs(checkString(map.get("czysbs")));
			vo.setZcms(checkString(map.get("zcms")));
			vo.setStbh(checkString(st.getZcbh()));
			vo.setStmc(checkString(st.getStmc()));
			vo.setStlx(findSTLX(checkString(st.getStlx())));
			vo.setStxz(checkString(st.getStxz()));
			vo.setStscsf(findCoteNameByCoteKey("PROVIENCE", checkString(st
					.getStscsf())));
			resultList.add(vo);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 通过headid查找资产body
	 * 
	 * @param headId
	 */
	public String findZCBodyByHeadId(String headId) {
		String sql = "select * from cz_notice_body where cld_id = '" + headId
				+ "' ";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < list.size(); i++) {
			STZCqueryVO vo = new STZCqueryVO();
			Map map = (Map) list.get(i);
			String id = checkString(map.get("id"));
			String zcbId = checkString(map.get("ccb_id"));
			CzZcXx xx = publicDao.findById(CzZcXx.class, zcbId);
			vo.setId(id);
			vo.setCzysbs(checkString(map.get("czysbs")));
			vo.setZcms(checkString(map.get("zcms")));
			String zclb = xx.getZclb();
			if ("0".equals(zclb) || "5".equals(zclb) || "6".equals(zclb)) {
				vo.setZcbh(checkString(xx.getAzcbh()));
				vo.setZcmc(checkString(xx.getAzcmc()));
				vo.setZcfl(findZCLBbyNo(checkString(xx.getZclb())));
				vo.setSzd(xx.getAcZcdq());
				vo.setPgz(checkDouble(xx.getApgjz()));
				vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
						checkString(xx.getCCzfs()).trim()));
			} else if ("1".equals(zclb)) {
				vo.setZcbh(checkString(xx.getBzcbh()));
				vo.setZcmc(checkString(xx.getBzcmc()));
				vo.setZcfl(findZCLBbyNo(checkString(xx.getZclb())));
				vo.setSzd(xx.getBcfwz());
				vo.setPgz(checkDouble(xx.getBpgz()));
				vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
						checkString(xx.getCCzfs()).trim()));
			} else if ("2".equals(zclb)) {
				vo.setZcbh(checkString(xx.getCzcbh()));
				vo.setZcmc(checkString(xx.getCzcmc()));
				vo.setZcfl(findZCLBbyNo(checkString(xx.getZclb())));
				vo.setSzd(xx.getCcfwz());
				vo.setPgz(checkDouble(xx.getCpgz()));
				vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
						checkString(xx.getCCzfs()).trim()));
			} else if ("4".equals(zclb)) {
				vo.setZcbh(checkString(xx.getZyzcbh()));
				vo.setZcmc(checkString(xx.getZyzcmc()));
				vo.setZcfl(findZCLBbyNo(checkString(xx.getZclb())));
				vo.setSzd(xx.getZybgdd());
				vo.setPgz(0D);
				vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
						checkString(xx.getCCzfs()).trim()));
			}
			resultList.add(vo);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 通过headid查找债券body
	 * 
	 * @param headId
	 */
	public String findZQBodyByHeadId(String headId) {
		String sql = "select * from cz_notice_body where cld_id = '" + headId
				+ "' ";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<STZCqueryVO> resultList = new ArrayList<STZCqueryVO>();
		for (int i = 0; i < list.size(); i++) {
			STZCqueryVO vo = new STZCqueryVO();
			Map map = (Map) list.get(i);
			String id = checkString(map.get("id"));
			String zqbId = checkString(map.get("ccb_id"));
			String sqla = "select FZQXMMC,ZQZLMC,ZQMC,c_czfs,JHFHMC,TO_CHAR(DQR,'yyyy-mm-dd') as DQRQ"
					+ " from cz_zc_xx o where ZCLB = '7' and ID = '" + zqbId + "'";
			vo.setId(id);
			vo.setCzysbs(checkString(map.get("czysbs")));
			vo.setZcms(checkString(map.get("zcms")));
			List lista = publicDao.queryForList(sqla, new ArrayList());
			if (lista.size() > 0) {
				Map mapa = (Map) lista.get(0);
				vo.setXmmc(checkString(mapa.get("FZQXMMC")).trim()); // 项目名称
				vo.setZqzlmc(checkString(mapa.get("ZQZLMC")).trim()); // 债券种类名称
				vo.setZqmc(checkString(mapa.get("ZQMC")).trim()); // 债券名称
				vo.setHm(checkString(mapa.get("JHFHMC")).trim()); // 行名
				vo.setDqr(checkString(mapa.get("DQRQ")).trim()); // 到期日
				vo.setCzfs(findCoteNameByCoteKey("ASSET_DISPOSE_METHOD",
						checkString(mapa.get("c_czfs")).trim())); // 处置方式
				resultList.add(vo);
			}
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 保存处置实体表体
	 * 
	 * @param headId
	 * @param stIds
	 */
	public void saveSTBody(String headId, String[] stIds) {
		for (int i = 0; i < stIds.length; i++) {
			CzNoticeBody body = new CzNoticeBody();
			body.setCldId(headId);
			body.setCcbId(stIds[i]);
			String zcId = this.findSTIdById(stIds[i]);
			body.setZcId(zcId);
			publicDao.save(body);
		}
	}

	/**
	 * 保存处置资产表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZCBody(String headId, String[] zcIds) {
		for (int i = 0; i < zcIds.length; i++) {
			CzNoticeBody body = new CzNoticeBody();
			body.setCldId(headId);
			body.setCcbId(zcIds[i]);
			CzZcXx xx = findCZXXById(zcIds[i]);
			String zclb = xx.getZclb();
			if ("0".equals(zclb) || "5".equals(zclb) || "6".equals(zclb)) {
				body.setZcId(xx.getAzcid());
			} else if ("1".equals(zclb)) {
				body.setZcId(xx.getBstid());
			} else if ("2".equals(zclb)) {
				body.setZcId(xx.getCdkzh());
			} else if ("4".equals(zclb)) {
				body.setZcId(xx.getZyzcid());
			}
			publicDao.save(body);
		}
	}

	/**
	 * 保存处置公告债券表体
	 * 
	 * @param headId
	 * @param zcIds
	 */
	public void saveZQBody(String headId, String[] zqIds) {
		for (int i = 0; i < zqIds.length; i++) {
			CzNoticeBody body = new CzNoticeBody();
			body.setCldId(headId);
			body.setCcbId(zqIds[i]);
			CzZcXx xx = findCZXXById(zqIds[i]);
			String zqid = xx.getFzqId();
			body.setZcId(zqid);
			publicDao.save(body);
		}
	}

	/**
	 * 删除处置实体表体
	 * 
	 * @param bodyIds
	 */
	public void delBody(String[] bodyIds) {
		for (int i = 0; i < bodyIds.length; i++) {
			String sql = "delete from cz_notice_body where id = '" + bodyIds[i]
					+ "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 修改处置表体
	 * 
	 * @param bodyIds
	 * @param czms
	 * @param czysbs
	 */
	public void updBody(String[] bodyIds, String czms, String czysbs) {
		for (int i = 0; i < bodyIds.length; i++) {
			String sql = "update cz_notice_body set zcms = '" + czms
					+ "',czysbs = '" + czysbs + "' where id = '" + bodyIds[i]
					+ "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

}
