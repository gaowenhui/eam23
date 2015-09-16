package com.tansun.eam2.zccz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IDealEvalBodyDao;
import com.tansun.eam2.zccz.service.IDealEvalHeadDao;
import com.tansun.eam2.zccz.ucc.IDealEvalHeadService;
import com.tansun.eam2.zccz.vo.ScyjVo;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

@Service
public class DealEvalHeadServiceImpl implements IDealEvalHeadService {

	private IDealEvalHeadDao headDao;
	private IDealEvalBodyDao bodyDao;
	private ICodeService codeService;
	private ICodeGenerator codeGenerator;

	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}

	@Autowired
	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}

	@Autowired
	public void setBodyDao(IDealEvalBodyDao bodyDao) {
		this.bodyDao = bodyDao;
	}

	public String newHead(CzPgscZskwhCld head) {
		return headDao.saveHead(head);
	}

	public void updateHead(CzPgscZskwhCld head) throws IllegalAccessException,
			InvocationTargetException {
		List<CzPgxxLsb> pgxxList = bodyDao.getCzPgxxLsbList(head.getId());
		if(StringUtils.equals(head.getPgzclb(), "0")){
			for (CzPgxxLsb lsb : pgxxList) {
				CzPgxxLsb bo = (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class, lsb
						.getId());
				bo.setPgjzr(head.getPgjzr());
				bodyDao.updateBody(bo);
			}			
		}

		headDao.updataHead(head);
	}

	public void copyPgxx(String headId) throws IllegalAccessException,
			InvocationTargetException {
		List<CzPgxxLsb> pgxxList = bodyDao.getCzPgxxLsbList(headId);
		for (CzPgxxLsb lsb : pgxxList) {
			ZcPgXx zcPgxx = bodyDao.findPgXx(lsb.getZcid(), lsb.getWdid(), lsb
					.getStid(), lsb.getGqstid(), lsb.getZqid(),
					lsb.getZyzcid(), lsb.getPgjzr());
			String id = null;
			if(zcPgxx != null){
				id = zcPgxx.getId();
			}else{
				zcPgxx = new ZcPgXx();
			}
			BeanUtils.copyProperties(zcPgxx, lsb);
			zcPgxx.setId(id);
			zcPgxx.setSfbc("1");
			bodyDao.saveOrUpdate(zcPgxx);		
		}
	}

	public void updateHead(CzPgscZskwhCld head, String jlxz)
			throws IllegalAccessException, InvocationTargetException {
		List<CzPgxxLsb> pgxxList = bodyDao.getCzPgxxLsbList(head.getId());
		for (CzPgxxLsb lsb : pgxxList) {
			CzPgxxLsb bo = (CzPgxxLsb) bodyDao.findById(CzPgxxLsb.class, lsb
					.getId());
			bo.setPgjzr(head.getPgjzr());
			bodyDao.updateBody(bo);
		}
		headDao.updataHead(head);
	}

	@Autowired
	public void setHeadDao(IDealEvalHeadDao headDao) {
		this.headDao = headDao;
	}

	public CzPgscZskwhCld getHeadById(String cldId) {
		return (CzPgscZskwhCld) headDao.findById(CzPgscZskwhCld.class, cldId);
	}

	public void addScjl(ScyjVo vo, PTUserBO user) {
		String tjrId = String.valueOf(user.getTid());
		String cldId = vo.getCldId();
		Double tjpc = headDao.findTjpc(cldId, tjrId);
		CzPgscJl xm = new CzPgscJl();
		CzPgscJl yd = new CzPgscJl();
		CzPgscJl yj = new CzPgscJl();
		// 保存项目
		xm.setCldId(vo.getCldId());
		xm.setOldId(vo.getScxmId());
		xm.setPid("0");
		xm.setValue(vo.getScxmText());
		xm.setTjrq(new Date());
		xm.setTjyjr(String.valueOf(user.getTid()));
		xm.setTjyjrxm(user.getUsername());
		xm.setSfxxz("0");
		xm.setBeizhu("0");
		xm.setScbz("0");
		xm.setTjpc(tjpc);
		headDao.save(xm);
		// 保存要点
		yd.setCldId(vo.getCldId());
		yd.setOldId(vo.getScydId());
		yd.setPid(xm.getId());
		yd.setValue(vo.getScydText());
		yd.setTjrq(new Date());
		yd.setTjyjr(String.valueOf(user.getTid()));
		yd.setTjyjrxm(user.getUsername());
		yd.setSfxxz("0");
		yd.setBeizhu("0");
		yd.setScbz("0");
		yd.setTjpc(tjpc);
		headDao.save(yd);
		// 保存意见
		yj.setCldId(vo.getCldId());
		yj.setOldId(vo.getJtyjId());
		yj.setPid(yd.getId());
		yj.setValue(vo.getJtyjText());
		yj.setTjrq(new Date());
		yj.setTjyjr(String.valueOf(user.getTid()));
		yj.setTjyjrxm(user.getUsername());
		yj.setSfxxz("0");
		yj.setBeizhu("0");
		yj.setScbz("0");
		yj.setTjpc(tjpc);
		headDao.save(yj);
	}

	public void addScjl(ScyjVo vo, PTUserBO user, String historyIds)
			throws IllegalAccessException, InvocationTargetException {
		String[] hids = historyIds.split(",");
		Double tjpc = headDao.findTjpc(vo.getCldId(), String.valueOf(user
				.getTid()));
		for (String hid : hids) {
			if (StringUtils.isEmpty(hid))
				continue;
			CzPgscJl hYj = (CzPgscJl) headDao.findById(CzPgscJl.class, hid);
			CzPgscJl hYd = (CzPgscJl) headDao.findById(CzPgscJl.class, hYj
					.getPid());
			CzPgscJl hXm = (CzPgscJl) headDao.findById(CzPgscJl.class, hYd
					.getPid());
			CzPgscJl xm = new CzPgscJl();
			CzPgscJl yd = new CzPgscJl();
			CzPgscJl yj = new CzPgscJl();
			BeanUtils.copyProperties(yj, hYj);
			BeanUtils.copyProperties(yd, hYd);
			BeanUtils.copyProperties(xm, hXm);
			xm.setTjpc(tjpc);
			xm.setCldId(vo.getCldId());
			xm.setTjrq(new Date());
			xm.setTjyjr(String.valueOf(user.getTid()));
			xm.setTjyjrxm(user.getUsername());
			xm.setBeizhu("0");
			xm.setSfxxz("0");
			headDao.save(xm);
			yd.setTjpc(tjpc);
			yd.setCldId(vo.getCldId());
			yd.setTjrq(new Date());
			yd.setTjyjr(String.valueOf(user.getTid()));
			yd.setTjyjrxm(user.getUsername());
			yd.setBeizhu("0");
			yd.setSfxxz("0");
			yd.setPid(xm.getId());
			headDao.save(yd);
			yj.setTjpc(tjpc);
			yj.setCldId(vo.getCldId());
			yj.setTjrq(new Date());
			yj.setTjyjr(String.valueOf(user.getTid()));
			yj.setTjyjrxm(user.getUsername());
			yj.setBeizhu("0");
			yj.setSfxxz("0");
			yj.setPid(yd.getId());
			headDao.save(yj);
		}
	}

	public String getMyScyjJson(String cldId, String userId)
			throws IllegalAccessException, InvocationTargetException {
		List<CzPgscJl> xmList = headDao.getMyScxmList(cldId, userId);
		List<ScyjVo> voList = new ArrayList<ScyjVo>();
		for (CzPgscJl xm : xmList) {
			List<CzPgscJl> ydList = headDao.getScydList(cldId, xm.getId());
			for (CzPgscJl yd : ydList) {
				List<CzPgscJl> yjList = headDao.getScyjList(cldId, yd.getId());
				for (CzPgscJl yj : yjList) {
					ScyjVo vo = new ScyjVo();
					BeanUtils.copyProperties(vo, yj);
					vo.setScxmId(xm.getOldId());
					vo.setScxmText(xm.getValue());
					vo.setScydId(yd.getOldId());
					vo.setScydText(yd.getValue());
					vo.setJtyjId(yj.getOldId());
					vo.setJtyjText(yj.getValue());
					voList.add(vo);
				}
			}
		}
		return BodyListToJSON.getJSON(voList, 1, 1, 9999999);
	}

	public String getSubmitScyjJson(String cldId)
			throws IllegalAccessException, InvocationTargetException {
		List<CzPgscJl> xmList = headDao.getSubmitScxmList(cldId);
		List<ScyjVo> voList = new ArrayList<ScyjVo>();
		for (CzPgscJl xm : xmList) {
			List<CzPgscJl> ydList = headDao.getScydList(cldId, xm.getId());
			for (CzPgscJl yd : ydList) {
				List<CzPgscJl> yjList = headDao.getScyjList(cldId, yd.getId());
				for (CzPgscJl yj : yjList) {
					ScyjVo vo = new ScyjVo();
					BeanUtils.copyProperties(vo, yj);
					vo.setScxmId(xm.getOldId());
					vo.setScxmText(xm.getValue());
					vo.setScydId(yd.getOldId());
					vo.setScydText(yd.getValue());
					vo.setJtyjId(yj.getOldId());
					vo.setJtyjText(yj.getValue());
					voList.add(vo);
				}
			}
		}
		return BodyListToJSON.getJSON(voList, 1, 1, 9999999);
	}

	public void updateScyj(ScyjVo vo) {
		CzPgscJl yj = (CzPgscJl) headDao.findById(CzPgscJl.class, vo.getId());
		CzPgscJl yd = (CzPgscJl) headDao.findById(CzPgscJl.class, yj.getPid());
		CzPgscJl xm = (CzPgscJl) headDao.findById(CzPgscJl.class, yd.getPid());
		yj.setValue(vo.getJtyjText());
		yd.setValue(vo.getScydText());
		xm.setValue(vo.getScxmText());
		headDao.update(yj);
		headDao.update(yd);
		headDao.update(xm);
	}

	public void delScyj(String ids) {
		String[] idArray = ids.split(",");
		for (String id : idArray) {
			if (StringUtils.isNotEmpty(id)) {
				CzPgscJl yj = (CzPgscJl) headDao.findById(CzPgscJl.class, id);
				CzPgscJl yd = (CzPgscJl) headDao.findById(CzPgscJl.class, yj
						.getPid());
				CzPgscJl xm = (CzPgscJl) headDao.findById(CzPgscJl.class, yd
						.getPid());
				yj.setScbz("1");
				yd.setScbz("1");
				xm.setScbz("1");
				headDao.update(yj);
				headDao.update(yd);
				headDao.update(xm);
			}
		}
	}

	// 保存处置审批意见（只跟新了审查结论）
	public void submitScyj(CzPgscJl pgscJl, String userId, String adviceType) {
		List<CzPgscJl> pgscList = headDao.getPgscListByCldIdUserId(pgscJl
				.getCldId(), userId);
		for (CzPgscJl pgsc : pgscList) {
			pgsc.setCScjl(pgscJl.getCScjl());
			headDao.update(pgsc);
		}
	}

	public String generatorBianhao(String cldId, String deptId, String deptName) {
		CzPgscZskwhCld cld = (CzPgscZskwhCld) headDao.findById(
				CzPgscZskwhCld.class, cldId);
		if (StringUtils.isEmpty(cld.getBianhao())) {
			String bianhao = codeGenerator.generateCurrentCode("zcczpgsc",
					deptId, deptName);
			if (StringUtils.contains(bianhao, "未找到编号生成规则"))
				return null;
			cld.setBianhao(bianhao);
			headDao.updataHead(cld);
			return bianhao;
		} else {
			return cld.getBianhao();
		}
	}

	public void updateJlxz(String headId, String jlxz) {
		// 如果是办理单环节，提交的时候更新未提交的结论的结论性质字段
		if (StringUtils.indexOfAny(jlxz, new String[] { "0", "1", "2" }) != -1) {
			List<CzPgscJl> jlList = headDao.getPgscListByCldIdUserId(headId,
					UserThreadLocal.get().getUserTidChar());
			for (CzPgscJl jl : jlList) {
				jl.setJlxz(jlxz);
				headDao.update(jl);
			}
			if (StringUtils.indexOfAny(jlxz, new String[] { "1", "2" }) != -1) {
				if (jlList.size() > 0) {
					CzPgscJl jl = jlList.get(0);
					CzPgscZskwhCld cld = (CzPgscZskwhCld) headDao.findById(
							CzPgscZskwhCld.class, headId);
					cld.setCScjl(jl.getCScjl());
					cld.setScsj(new Date());
					headDao.updataHead(cld);
				}
			}
		}
	}

	// 根据子节点查找父节点
	public String findParentByChild(String childId) {
		return headDao.findParentByChild(childId);
	}

	public String findValueById(String id) {
		return headDao.findValueById(id);
	}

	public void updateValueById(String id, String value) {
		headDao.updateValueById(id, value);
	}

	public String getUserLX(String cldId, String userId) {
		return headDao.getUserLX(cldId, userId);
	}

	public String findRadioValue(String cldId, String userId) {
		return headDao.findRadioValue(cldId, userId);
	}

	public String getStIdByCldId(String cldId) {
		return headDao.getStIdByCldId(cldId);
	}

	public String getStlxById(String stId) {
		StJbxx jbxx = (StJbxx) headDao.findById(StJbxx.class, stId);
		String zixunlx = null;
		if (jbxx != null) {
			zixunlx = jbxx.getStlx();
		}
		return zixunlx;
	}
}
