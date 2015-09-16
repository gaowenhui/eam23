package com.tansun.eam2.zccz.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.zccz.service.ICzSczskBSMethod;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.eam2.common.model.orm.bo.*;

@Service
public class CzSczskBSMethodImpl extends CommonBSImpl implements
		ICzSczskBSMethod {
	@Autowired
	private PublicDao publicDao;

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	/**
	 * 更新一个项目中安置的人员的状态,处理单对象:CzStcztz,人员对象:StFsxx 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuInCld(String cldId, String statu) {
		String strsql = "Update ST_FSXX Set FAZZT= ? "
				+ " Where ID in (Select ST_FSXX_ID from CZ_AZRY_XX "
				+ " Where CZ_AZRY_XX.CLD_ID=?)";
		List args = new ArrayList();
		args.add(statu);
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);

	}

	/**
	 * 合规审查次数加一 head对象CzStcztz
	 */
	public void heguishenchaChishuAdd1(String cldId) {
		String strsql = "Update CZ_STCZTZ " + " Set HGSCCS = HGSCCS + 1 "
				+ " Where Id=?";
		List args = new ArrayList();
		args.add(cldId);
		this.publicDao.updateBySql(strsql, args);
	}

	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 
	 * @param hyId
	 * @return Map<"处理单id",List<"审批委员Id">>
	 */
	public Map<String, List<String>> getAllShenpiWeiyuan(String hyId) {
		String hsql = "from CzXmxxLsb where hyId=?";
		List args = new ArrayList();
		args.add(hyId);
		List list1 = this.publicDao.find(hsql, args);

		Map retmap = new HashMap();
		int i = 0;
		for (i = 0; i < list1.size(); i++) {
			CzXmxxLsb bo = (CzXmxxLsb) list1.get(i);
			String cldid = bo.getCldId(); // 处理单信息
			String xmid = bo.getId(); // 项目编号

			hsql = "from CzXmSpwYj where xmId=?";
			args = new ArrayList();
			args.add(xmid);
			List list2 = this.publicDao.find(hsql, args);
			int j = 0;
			List xmlist = new ArrayList();
			for (j = 0; j < list2.size(); j++) {
				CzXmSpwYj bo2 = (CzXmSpwYj) list2.get(j);
				xmlist.add(bo2.getSpwy()); // 把审批委员加上去
			}
			retmap.put(xmid, xmlist);
		}

		return retmap; //
	}

	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 如果说有的审批委员都已经提交审批意见(字段SFTJSPYJ)return true;否则return false
	 * 
	 * @param hyId
	 * @return
	 */
	public boolean isAllXmSubmit(String hyId) {

		String hsql = "from CzXmxxLsb where hyId=?";
		List args = new ArrayList();
		args.add(hyId);
		List list1 = this.publicDao.find(hsql, args);

		Map retmap = new HashMap();
		int i = 0;
		for (i = 0; i < list1.size(); i++) {
			CzXmxxLsb bo = (CzXmxxLsb) list1.get(i);
			String cldid = bo.getCldId(); // 处理单信息
			String xmid = bo.getId(); // 项目编号

			hsql = "from CzXmSpwYj where xmId=?";
			args = new ArrayList();
			args.add(xmid);
			List list2 = this.publicDao.find(hsql, args);
			int j = 0;
			List xmlist = new ArrayList();
			for (j = 0; j < list2.size(); j++) {
				CzXmSpwYj bo2 = (CzXmSpwYj) list2.get(j);
				// xmlist.add(bo2.getSpwy()); //把审批委员加上去
				if (bo2.getSftjspyj() != null
						&& bo2.getSftjspyj().trim().equals("0")) {
					// 有人没提交,返回false;
					return false;
				}
			}
			// retmap.put(xmid, xmlist);
		}

		return true; //
	}

	/**
	 * 返回一个会议内的所有项目的处理单id和意见汇总人id 表CZ_XMXX_LSB
	 * 
	 * @param hyId
	 * @return Map<处理单id,意见汇总人id>
	 */
	public Map<String, String> getAllcldIdInHy(String hyId) {
		return null;
	}
}
