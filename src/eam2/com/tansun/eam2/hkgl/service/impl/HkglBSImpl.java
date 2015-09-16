package com.tansun.eam2.hkgl.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.BizBackCashInfo;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmBody;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmHead;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.hkgl.service.IHkglBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;

/**
 * 回款管理
 * 
 * @author 陈煜霄
 * @date 2011-03-04
 */
@Service
public class HkglBSImpl implements IHkglBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 保存回款表头
	 * 
	 * @param head
	 */
	public void saveHead(BizBackCashInfo head) {
		publicDao.save(head);
	}

	/**
	 * 修改回款表头
	 * 
	 * @param head
	 */
	public void updateHead(BizBackCashInfo head) {
		publicDao.update(head);
	}

	/**
	 * 保存确认单表头
	 * 
	 * @param confirmHead
	 */
	public void saveConfirmHead(BizBackConfirmHead confirmHead) {
		publicDao.save(confirmHead);
	}

	/**
	 * 通过回款表单id查找回款表单信息
	 * 
	 * @param headId
	 * @return
	 */
	public BizBackCashInfo findHeadByHeadId(String headId) {
		return (BizBackCashInfo) publicDao.findById(BizBackCashInfo.class,
				headId);
	}

	/**
	 * 通过回款表头id和确认人编号查找确认表头信息
	 * 
	 * @param headId
	 * @param qrrbh
	 * @return
	 */
	public BizBackConfirmHead findConfirmHeadByHeadIdandUserCode(String headId,
			String qrrbh) {
		String hql = "from BizBackConfirmHead t where t.cashid = '" + headId
				+ "' and t.qrrbh = '" + qrrbh + "'";
		BizBackConfirmHead confirmHead = null;
		List<BizBackConfirmHead> list = (List<BizBackConfirmHead>) publicDao
				.find(hql);
		if (list.size() > 0) {
			confirmHead = list.get(0);
		}
		return confirmHead;
	}

	/**
	 * 通过confirmHeadId查找confirmBody信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmBodyByConfirmHeadId(String confirmHeadId,
			String type, String qrrbh) {
		String sql = "select b.* from biz_back_confirm_body b, biz_back_confirm_head h "
				+ "where b.headid = h.id and b.headid = '"
				+ confirmHeadId
				+ "' and h.qrrbh = '"
				+ qrrbh
				+ "' "
				+ "and b.qrdlx = '"
				+ type
				+ "' order by b.id desc";
		List list = publicDao.queryForList(sql, new ArrayList());
		List resultList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			BizBackConfirmBody body = new BizBackConfirmBody();
			body.setBz0(checkString(map.get("bz0")));
			body.setCzBz(checkString(map.get("cz_bz")));
			body.setCzCpqr(checkDouble(map.get("cz_cpqr")));
			body.setCzCzsr(checkDouble(map.get("cz_czsr")));
			body.setCzFycpje(checkDouble(map.get("cz_fycpje")));
			body.setCzSfjs(checkString(map.get("cz_sfjs")));
			body.setCzSfwb(checkString(map.get("cz_sfwb")));
			body.setCzXmbh(checkString(map.get("cz_xmbh")));
			body.setCzXmid(checkString(map.get("cz_xmid")));
			body.setCzXmmc(checkString(map.get("cz_xmmc")));
			body.setCzYkczfy(checkDouble(map.get("cz_ykczfy")));
			body.setGqBz(checkString(map.get("gq_bz")));
			body.setGqHkxz(checkString(map.get("gq_hkxz")));
			body.setGqHsxjje(checkDouble(map.get("gq_hsxjje")));
			body.setGqId(checkString(map.get("gq_id")));
			body.setGqQlzt(checkString(map.get("gq_qlzt")));
			body.setGqSf(checkString(map.get("gq_st")));
			body.setGqStbh(checkString(map.get("gq_stbh")));
			body.setGqStmc(checkString(map.get("gq_stmc")));
			body.setId(checkString(map.get("id")));
			body.setQrdlx(checkString(map.get("qrdlx")));
			body.setQsPc(checkString(map.get("qs_pc")));
			body.setQtBz(checkString(map.get("qt_bz")));
			body.setQtHsxz(checkString(map.get("qt_hsxz")));
			body.setSfybc(checkString(map.get("sfybc")));
			body.setSstzzje(checkDouble(map.get("sstzzje")));
			body.setSszje(checkDouble(map.get("sszje")));
			body.setZaLxhsje(checkDouble(map.get("za_lxhsje")));
			body.setZqBz(checkString(map.get("zq_bz")));
			body.setZqDyyz(checkDouble(map.get("zq_dyyz")));
			body.setZqHswb(checkString(map.get("zq_hswb")));
			body.setZqHszjxz(checkDouble(map.get("zq_hszjxz")));
			body.setZqHxfy(checkString(map.get("zq_hxfy")));
			body.setZqHxsr(checkString(map.get("zq_hxsr")));
			body.setZqId(checkString(map.get("zq_id")));
			body.setZqLxqj(checkString(map.get("zq_lxqj")));
			body.setZqMc(checkString(map.get("zq_mc")));
			body.setThsszje(checkDouble(map.get("thsszje")));
			body.setYsyfzje(checkDouble(map.get("ysyfzje")));
			body.setThysyfzje(checkDouble(map.get("thysyfzje")));
			body.setTzzje(checkDouble(map.get("tzzje")));
			body.setHeadid(confirmHeadId);
			resultList.add(body);
		}
		String json = BodyListToJSON.getJSON(resultList, 1, 1, 10000);
		return json;
	}

	/**
	 * 将处置项目保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveCZtoConfirmBody(String headId, String ids) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String czIds[] = ids.split(",");
		for (int i = 0; i < czIds.length; i++) {
			String hql = " from CzXmXx x where x.xmlsb='"+czIds[i]+"'"; 
			List<CzXmXx> l = (List<CzXmXx>) publicDao.find(hql);
//			CzXmXx xm = (CzXmXx) publicDao.findById(CzXmXx.class, czIds[i]);
			CzXmXx xm = new CzXmXx();
			if(l.size() > 0){
				xm = l.get(0);
			}
			BizBackConfirmBody body = new BizBackConfirmBody();
			body.setCzXmid(xm.getId());
			body.setCzXmbh(xm.getBianhao());
			body.setCzXmmc(xm.getCzxmmc());
			body.setHeadid(headId);
			body.setQrdlx("1");
			body.setSfybc("否");
			publicDao.save(body);
		}
	}

	/**
	 * 将清算信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveQStoConfirmBody(String headId, String ids) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String qsIds[] = ids.split(",");
		for (int i = 0; i < qsIds.length; i++) {
			JjzcHtqsHead qs = (JjzcHtqsHead) publicDao.findById(
					JjzcHtqsHead.class, qsIds[i]);
			BizBackConfirmBody body = new BizBackConfirmBody();
			body.setQsPc(qs.getQspc());
			body.setYsyfzje(qs.getYsyfzje());
			body.setThysyfzje(qs.getThysyfzje());
			body.setHeadid(headId);
			body.setQrdlx("2");
			body.setSfybc("否");
			publicDao.save(body);
		}
	}

	/**
	 * 将债券信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 */
	public void saveZQtoConfirmBody(String headId, String ids) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String zqIds[] = ids.split(",");
		for (int i = 0; i < zqIds.length; i++) {
			String sql = "SELECT a.nf,a.zqmz,a.zqmz2,b.id,b.jhfhmc,b.zqzlmc,b.zqmc,b.xm_id,b.xmmc,"
					+ " to_char(b.dqr, 'YYYY-MM-DD') as dqr FROM stock_bookvalue a, stock_info b "
					+ " WHERE b.ID = '"
					+ zqIds[i]
					+ "' and b.ID = a.stockid(+)"
					+ " AND (a.stockid || a.nf IN (SELECT stockid || MAX(nf) FROM stock_bookvalue GROUP BY stockid) OR "
					+ " a.stockid IS NULL)";
			List reslutList = this.publicDao.queryForList(sql, new ArrayList());
			if (reslutList.size() > 0) {
				Map map = (Map) reslutList.get(0);
				BizBackConfirmBody body = new BizBackConfirmBody();
				body.setZqMc(String.valueOf(map.get("ZQMC")));
				body.setHeadid(headId);
				body.setZqId(String.valueOf("ID"));
				body.setQrdlx("3");
				body.setSfybc("否");
				publicDao.save(body);
			}
		}
	}

	/**
	 * 将实体信息保存到body里面
	 * 
	 * @param headId
	 * @param ids
	 * @param stlx
	 */
	public void saveSTtoConfirmBody(String headId, String ids, String stlx) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String stIds[] = ids.split(",");
		for (int i = 0; i < stIds.length; i++) {
			StJbxx st = (StJbxx) publicDao.findById(StJbxx.class, stIds[i]);
			BizBackConfirmBody body = new BizBackConfirmBody();
			body.setGqId(st.getId());
			body.setGqStmc(st.getStzwmc());
			body.setGqStbh(st.getZcbh());
			body.setGqSf(st.getCShengfen());
			body.setHeadid(headId);
			body.setQrdlx("4");
			body.setSfybc("否");
			publicDao.save(body);
		}
	}

	/**
	 * 将其他信息保存到body里面
	 * 
	 * @param confirmBody
	 */
	public void saveQTtoConfirmBody(BizBackConfirmBody confirmBody) {
		publicDao.save(confirmBody);
	}

	/**
	 * 根据确认表体id删除确认信息
	 * 
	 * @param ids
	 */
	public void deleteConfirmBody(String ids, String confirmHeadId) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String bodyIds[] = ids.split(",");
		for (int i = 0; i < bodyIds.length; i++) {
			String sql = "delete biz_back_confirm_body where id = '"
					+ bodyIds[i] + "'";
			publicDao.getJdbcTemplate().execute(sql);
		}

		String hql = "from BizBackConfirmBody b where b.headid = '"
				+ confirmHeadId + "'";
		List list = publicDao.find(hql);
		if (list.size() == 0) {
			String sql1 = "delete biz_back_confirm_head h where id = '"
					+ confirmHeadId + "' and h.isbmhk = '是' ";
			publicDao.getJdbcTemplate().execute(sql1);
		}
	}

	/**
	 * 修改处置项目表体信息
	 * 
	 * @param czSfwb
	 * @param czCzsr
	 * @param czYkczfy
	 * @param czFycpje
	 * @param czCpqr
	 * @param czSfjs
	 * @param id
	 */
	public void updateCZtoConfirmBody(String czSfwb, String czCzsr,
			String czYkczfy, String czFycpje, String czCpqr, String czSfjs,
			String id) {
		BizBackConfirmBody body = (BizBackConfirmBody) publicDao.findById(
				BizBackConfirmBody.class, id);
		body.setCzSfwb(czSfwb);
		body.setCzCzsr(Double.valueOf(czCzsr));
		body.setCzYkczfy(Double.valueOf(czYkczfy));
		body.setCzSfjs(czSfjs);
		publicDao.update(body);
	}

	/**
	 * 修改债券表体信息
	 * 
	 * @param zqHszjxz
	 * @param zqDyyz
	 * @param zqHxsr
	 * @param zqHxfy
	 * @param zqHswb
	 * @param zaLxhsje
	 * @param zqLxqj
	 * @param id
	 */
	public void updateZQtoConfirmBody(String zqHszjxz, String zqDyyz,
			String zqHxsr, String zqHxfy, String zqHswb, String zaLxhsje,
			String zqLxqj, String id) {
		BizBackConfirmBody body = (BizBackConfirmBody) publicDao.findById(
				BizBackConfirmBody.class, id);
		body.setZqHszjxz(Double.valueOf(zqHszjxz));
		body.setZqDyyz(Double.valueOf(zqDyyz));
		body.setZqHxsr(zqHxsr);
		body.setZqHxfy(zqHxfy);
		body.setZqHswb(zqHswb);
		body.setZaLxhsje(Double.valueOf(zaLxhsje));
		body.setZqLxqj(zqLxqj);
		publicDao.update(body);
	}

	/**
	 * 修改实体表体信息
	 * 
	 * @param gqHkxz
	 * @param gqQlzt
	 * @param gqHsxjje
	 * @param id
	 */
	public void updateSTtoConfirmBody(String gqHkxz, String gqQlzt,
			String gqHsxjje, String id) {
		BizBackConfirmBody body = (BizBackConfirmBody) publicDao.findById(
				BizBackConfirmBody.class, id);
		body.setGqHkxz(gqHkxz);
		body.setGqQlzt(gqQlzt);
		body.setGqHsxjje(Double.valueOf(gqHsxjje));
		publicDao.update(body);
	}

	/**
	 * 修改其他表体信息
	 * 
	 * @param confirmBody
	 */
	public void updateQTtoConfirmBody(BizBackConfirmBody confirmBody) {
		publicDao.update(confirmBody);
	}

	/**
	 * 确认表体
	 * 
	 * @param ids
	 */
	public void confirmThisBody(String ids) {
		if (ids.startsWith(",")) {
			ids = ids.substring(1);
		}
		String bodyIds[] = ids.split(",");
		for (int i = 0; i < bodyIds.length; i++) {
			String sql = "update biz_back_confirm_body t set t.sfybc = '是' where t.id = '"
					+ bodyIds[i] + "'";
			publicDao.getJdbcTemplate().execute(sql);
		}
	}

	/**
	 * 查找部门内的确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmInfoInDept(String headId, String qrbmbh) {
		String sql = "select distinct h.* from biz_back_confirm_head h,"
				+ "(select * from biz_back_confirm_body b where b.sfybc = '是') t"
				+ " where h.cashid = '" + headId + "' and h.qrbmbh = '"
				+ qrbmbh + "'" + " and t.headid = h.id";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<BizBackConfirmHead> resuleList = new ArrayList<BizBackConfirmHead>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			BizBackConfirmHead head = new BizBackConfirmHead();
			head.setCashid(headId);
			head.setQrbmbh(qrbmbh);
			head.setQrbmmc(String.valueOf(map.get("qrbmmc")));
			head.setQrrmc(String.valueOf(map.get("qrrmc")));
			head.setQrrbh(String.valueOf(map.get("qrrbh")));
			head.setQrrq((Date) map.get("qrrq"));
			head.setQrdlx(findqrdlx(String.valueOf(map.get("qrdlx"))));
			head.setId(String.valueOf(map.get("id")));
			if ("1".equals(String.valueOf(map.get("isbmhk")))) {
				head.setIsbmhk("是");
			} else {
				head.setIsbmhk("否");
			}
			resuleList.add(head);
		}
		String json = BodyListToJSON.getJSON(resuleList, 1, 1, 10000);
		return json;
	}

	/**
	 * 查找出了部门以后的确认信息
	 * 
	 * @param headId
	 * @return
	 */
	public String findConfirmInfoOutDept(String headId) {
		String sql = "select distinct h.* from biz_back_confirm_head h,"
				+ "(select * from biz_back_confirm_body b where b.sfybc = '是') t where h.cashid = '"
				+ headId + "' and h.isbmhk = '1' and t.headid = h.id";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<BizBackConfirmHead> resuleList = new ArrayList<BizBackConfirmHead>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			BizBackConfirmHead head = new BizBackConfirmHead();
			head.setCashid(headId);
			head.setId(String.valueOf(map.get("id")));
			head.setQrbmbh(String.valueOf(map.get("qrbmbh")));
			head.setQrbmmc(String.valueOf(map.get("qrbmmc")));
			head.setQrrmc(String.valueOf(map.get("qrrmc")));
			head.setQrrbh(String.valueOf(map.get("qrrbh")));
			head.setQrrq((Date) map.get("qrrq"));
			head.setQrdlx(findqrdlx(String.valueOf(map.get("qrdlx"))));
			head.setBmfzrbh(String.valueOf(map.get("bmfzrbh")));
			head.setBmfzrmc(String.valueOf(map.get("bmfzrmc")));
			head.setSfzzhk(String.valueOf(map.get("sfzzhk")));
			resuleList.add(head);
		}
		String json = BodyListToJSON.getJSON(resuleList, 1, 1, 10000);
		return json;
	}

	/**
	 * 查找确认单类型
	 * 
	 * @param qrdlx
	 * @return
	 */
	public String findqrdlx(String qrdlx) {
		if ("1".equals(qrdlx)) {
			qrdlx = "固定资产处置确认单";
		} else if ("2".equals(qrdlx)) {
			qrdlx = "固定资产租赁确认单";
		} else if ("3".equals(qrdlx)) {
			qrdlx = "承继债券投资回收款确认单";
		} else if ("4".equals(qrdlx)) {
			qrdlx = "承继股权投资回收款确认单";
		} else if ("5".equals(qrdlx)) {
			qrdlx = "其他业务收款确认单";
		}
		return qrdlx;
	}

	/**
	 * 查看该回款在该部门是否已经有最终确认的回款
	 * 
	 * @param headId
	 * @param qrbmbh
	 * @return
	 */
	public String checkDeptEnd(String cashid, String qrbmbh,
			String confirmHeadId, String fzrbh, String fzrmc) {
		String sql = "select distinct h.* from biz_back_confirm_head h,"
				+ "(select * from biz_back_confirm_body b where b.sfybc = '是') t where h.cashid = '"
				+ cashid
				+ "' and h.isbmhk = '1' and t.headid = h.id and h.qrbmbh = '"
				+ qrbmbh + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			return "已经确认过了部门最终回款，无法再次确认！";
		} else {
			BizBackConfirmHead confirmHead = (BizBackConfirmHead) publicDao
					.findById(BizBackConfirmHead.class, confirmHeadId);
			confirmHead.setBmfzrbh(fzrbh);
			confirmHead.setBmfzrmc(fzrmc);
			confirmHead.setIsbmhk("1");
			publicDao.update(confirmHead);
			return "保存成功！";
		}
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

	/**
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Double checkDouble(Object obj) {
		Double dou = 0D;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0D;
		} else {
			dou = Double.valueOf(String.valueOf(obj));
		}
		return dou;
	}

	/**
	 * 办结时候的处理
	 * 
	 * @param id
	 * @param lx
	 * @return
	 */
	public void doOver(String id, String lx, String headId) {
		BizBackCashInfo hkInfo = publicDao.findById(BizBackCashInfo.class,
				headId);
		BizBackConfirmHead head = publicDao.findById(BizBackConfirmHead.class,
				id);
		String hql = "from BizBackConfirmBody b where b.headid = '" + id + "'";
		List<BizBackConfirmBody> list = (List<BizBackConfirmBody>) publicDao
				.find(hql);
		hkInfo.setQrbmbh(head.getQrbmbh());
		hkInfo.setHqywqrsj(head.getQrrq());
		hkInfo.setQrbmmc(head.getQrbmmc());
		hkInfo.setYwlx(lx);
		publicDao.update(hkInfo);
		for (int i = 0; i < list.size(); i++) {
			BizBackConfirmBody body = list.get(i);
			if ("固定资产处置确认单".equals(lx)) {
				CzFysrMx mx = new CzFysrMx();
				mx.setXmId(body.getCzXmid());
				mx.setFenlei("1");
				mx.setHksj(hkInfo.getDzrq());
				mx.setHkje(checkDouble(body.getCzCzsr())
						- checkDouble(body.getCzFycpje()));
				mx.setHkzfyje(body.getCzYkczfy());
				mx.setHkzsrje(body.getCzCzsr());
				mx.setCldId(hkInfo.getId());
				mx.setFkr(hkInfo.getHkr());
				mx.setJieduan("chuzhihuikuan");
				publicDao.save(mx);
			}
		}
	}

	/**
	 * 取消部门确认
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmDept(String confirmHeadId) {
		BizBackConfirmHead head = (BizBackConfirmHead) publicDao.findById(
				BizBackConfirmHead.class, confirmHeadId);
		head.setIsbmhk("否");
		publicDao.update(head);
		return "取消成功！";

	}

	/**
	 * 确定为最终回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String checkOutDeptEnd(String confirmHeadId, String headId) {
		String sql = "select h.sfzzhk from biz_back_confirm_head h where h.sfzzhk = '是' and cashid = '"
				+ headId + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			return "已经确认了最终回款，无法再次确认！";
		} else {
			String sql1 = "update biz_back_confirm_head h set h.sfzzhk = '是' "
					+ "where h.id = '" + confirmHeadId + "'";
			publicDao.getJdbcTemplate().execute(sql1);
			return "确认成功！";
		}
	}

	/**
	 * 取消确认为最终回款
	 * 
	 * @param confirmHeadId
	 * @return
	 */
	public String cancleConfirmOutDept(String confirmHeadId) {
		String sql1 = "update biz_back_confirm_head h set h.sfzzhk = '否' "
				+ "where h.id = '" + confirmHeadId + "'";
		publicDao.getJdbcTemplate().execute(sql1);
		return "取消成功！";
	}

	/**
	 * 查找其他的表体
	 * 
	 * @return
	 */
	public BizBackConfirmBody findConfirmBodyByConfirmHeadIdQT(
			String confirmHeadId) {
		String hql = "from BizBackConfirmBody where headid = '" + confirmHeadId
				+ "'";
		List list = publicDao.find(hql);
		BizBackConfirmBody confirmBody = null;
		if (list.size() > 0) {
			confirmBody = (BizBackConfirmBody) list.get(0);
		}
		return confirmBody;
	}

	/**
	 * 填写确认单时候的验证
	 * 
	 * @param confirmHeadId
	 * @param qrdlx
	 * @return
	 */
	public String checkBodyByLx(String confirmHeadId, String qrdlx) {
		String sql = "select * from biz_back_confirm_body b where b.headid = '"
				+ confirmHeadId + "' and b.qrdlx != '" + qrdlx + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		String returnStr = "";
		if (list.size() > 0) {
			returnStr = "no";
		} else {
			returnStr = "yes";
		}
		return returnStr;
	}

}
