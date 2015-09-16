package com.tansun.eam2.zccz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICzCztzfaXxService;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.service.ICzStcztzDao;
import com.tansun.eam2.zccz.service.ICzXmSpwYjDao;
import com.tansun.eam2.zccz.service.ICzXmxxLsbDao;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.eam2.zccz.service.impl.CzXmxxLsbDaoImpl;
import com.tansun.eam2.zccz.ucc.IApproveAdviceUCC;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;

@Service
public class ApproveAdviceUCCImpl implements IApproveAdviceUCC {
	
	private ICzStcztzDao czStcztzDao;
	private ICzXmSpwYjDao czXmSpwYjDao;
	private CzXmxxLsbDaoImpl czXmxxLsbDao;
	private ICzCztzfaXxService cztzfaXxService;
	private ICzXmxxLsbDao xmDao;
	private ZcczWfBS wfBS;

	@Autowired
	public void setWfBS(ZcczWfBS wfBS) {
		this.wfBS = wfBS;
	}

	@Autowired
	public void setXmDao(ICzXmxxLsbDao xmDao) {
		this.xmDao = xmDao;
	}

	@Autowired
	public void setCztzfaXxService(ICzCztzfaXxService cztzfaXxService) {
		this.cztzfaXxService = cztzfaXxService;
	}

	@Autowired
	public void setCzXmxxLsbDao(CzXmxxLsbDaoImpl czXmxxLsbDao) {
		this.czXmxxLsbDao = czXmxxLsbDao;
	}

	@Autowired
	public void setCzStcztzDao(ICzStcztzDao czStcztzDao) {
		this.czStcztzDao = czStcztzDao;
	}

	@Autowired
	public void setCzXmSpwYjDao(ICzXmSpwYjDao czXmSpwYjDao) {
		this.czXmSpwYjDao = czXmSpwYjDao;
	}

	//根据委员审批意见取得处理单对象（实体整体处置、实体人员安置）
	public CzStcztz getHeadByAdviceId(String czXmSpwYjId) {
		CzXmSpwYj czXmSpwYj = czXmSpwYjDao.getCzXmSpwYjById(czXmSpwYjId);
		if(StringUtils.isNotEmpty(czXmSpwYj.getXmId())){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(czXmSpwYj.getXmId());
			if(StringUtils.isNotEmpty(czXmxxLsb.getCldId())){
				return czStcztzDao.getHeadById(czXmxxLsb.getCldId());
			}
		}
		return new CzStcztz();
	}

	//根据委员审批意见取得项目信息
	public CzXmxxLsbVO getXmxxByAdviceId(String czXmSpwYjId) throws IllegalAccessException, InvocationTargetException {
		CzXmxxLsbVO lsbVo = new CzXmxxLsbVO();
		CzXmSpwYj czXmSpwYj = czXmSpwYjDao.getCzXmSpwYjById(czXmSpwYjId);
		if(StringUtils.isNotEmpty(czXmSpwYj.getXmId())){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(czXmSpwYj.getXmId());
			BeanUtils.copyProperties(lsbVo, czXmxxLsb);
			if(StringUtils.isNotEmpty(czXmxxLsb.getHyId())){
				CzHyxx hyxx = (CzHyxx)czXmxxLsbDao.findById(CzHyxx.class, czXmxxLsb.getHyId());
				lsbVo.setSpsj(hyxx.getSpsj());
				lsbVo.setHycs(hyxx.getHycs());
			}
		}
		return lsbVo;
	}
	
	public CzXmSpwYj getCzXmSpwYjById(String id){
		if(StringUtils.isNotEmpty(id)){
			return czXmSpwYjDao.getCzXmSpwYjById(id);
		}
		return new CzXmSpwYj();
	}

	/**提交意见时调用，每个项目正常情况下只执行一次
	 * 修改同意、不同意、是否提交意见、提交意见时间、其它情况、审批意见和建议
	 * @param czXmSpwYj
	 */
	public void update6Items(CzXmSpwYj czXmSpwYj) {
		if(czXmSpwYj != null && StringUtils.isNotEmpty(czXmSpwYj.getId())){
			CzXmSpwYj czXmSpwYjTem = czXmSpwYjDao.getCzXmSpwYjById(czXmSpwYj.getId());
			czXmSpwYjTem.setButongyi(czXmSpwYj.getButongyi());
			czXmSpwYjTem.setTongyi(czXmSpwYj.getTongyi());
			czXmSpwYjTem.setQtqk(czXmSpwYj.getQtqk());
			czXmSpwYjTem.setSftjspyj("1");
			czXmSpwYjTem.setSpyjjy(czXmSpwYj.getSpyjjy());
			czXmSpwYjTem.setTyyjsj(czXmSpwYj.getTyyjsj());
			czXmSpwYjDao.updateCzXmSpwYj(czXmSpwYjTem);
			if(StringUtils.equals("1", czXmSpwYjTem.getSfwzcr())){
				CzXmxxLsb lsb = czXmxxLsbDao.getCzXmxxLsbById(czXmSpwYjTem.getXmId());
				wfBS.setXmzt_YJHZZ(lsb.getHyId());
			}else if(wfBS.isAllYjSubmit(czXmSpwYjTem.getXmId())){
				wfBS.setXmzt_WYTJYJZWB(czXmSpwYjTem.getXmId());
			}
			if(wfBS.isAllYjSubmit(czXmSpwYj.getXmId()))
				wfBS.setXmzt_WYTJYJZWB(czXmSpwYj.getXmId());
		}
	}

	//根据项目Id取得处理单对象（实体整体处置或实体人员安置）
	public CzStcztz getHeadByXiangmuId(String xiangmuId) {
		if(StringUtils.isNotEmpty(xiangmuId)){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(xiangmuId);
			if(StringUtils.isNotEmpty(czXmxxLsb.getCldId())){
				return czStcztzDao.getHeadById(czXmxxLsb.getCldId());
			}
		}
		return new CzStcztz();
	}

	//根据委员审批意见Id取得处理单对象（资产处置）
	public CzCztzfaXx getDisposeHeadByAdviceId(String czXmSpwYjId) {
		CzXmSpwYj czXmSpwYj = czXmSpwYjDao.getCzXmSpwYjById(czXmSpwYjId);
		if(StringUtils.isNotEmpty(czXmSpwYj.getXmId())){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(czXmSpwYj.getXmId());
			if(StringUtils.isNotEmpty(czXmxxLsb.getCldId())){
				return (CzCztzfaXx)cztzfaXxService.findById(CzCztzfaXx.class, czXmxxLsb.getCldId());
			}
		}
		return new CzCztzfaXx();
	}

	//根据项目Id取得处理单对象（资产处置）
	public CzCztzfaXx getDisposeHeadByXiangmuId(String xiangmuId) {
		if(StringUtils.isNotEmpty(xiangmuId)){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(xiangmuId);
			if(StringUtils.isNotEmpty(czXmxxLsb.getCldId())){
				return (CzCztzfaXx)cztzfaXxService.findById(CzCztzfaXx.class, czXmxxLsb.getCldId());
			}
		}
		return new CzCztzfaXx();
	}

	public CzXmSpwYj getCzXmSpwYjByXmIdWyId(String xmId, String spwy) {
		CzXmSpwYj yj = czXmSpwYjDao.getCzXmSpwYjByXmIdWyId(xmId, spwy);
		return yj;
	}

	public CzXmxxLsbVO getXmxxByXmId(String xmId) throws IllegalAccessException, InvocationTargetException {
		CzXmxxLsbVO lsbVo = new CzXmxxLsbVO();
		if(StringUtils.isNotEmpty(xmId)){
			CzXmxxLsb czXmxxLsb = czXmxxLsbDao.getCzXmxxLsbById(xmId);
			BeanUtils.copyProperties(lsbVo, czXmxxLsb);
			if(StringUtils.isNotEmpty(czXmxxLsb.getHyId())){
				CzHyxx hyxx = (CzHyxx)czXmxxLsbDao.findById(CzHyxx.class, czXmxxLsb.getHyId());
				lsbVo.setSpsj(hyxx.getSpsj());
				lsbVo.setHycs(hyxx.getHycs());
			}
		}
		return lsbVo;
	}

	public boolean isAllYjTjInXm(String id) {
		CzXmSpwYj yj = czXmSpwYjDao.getCzXmSpwYjById(id);
		CzXmxxLsb xm = xmDao.getCzXmxxLsbById(yj.getXmId());
		List<CzXmxxLsb> xmList = xmDao.getXmListByHyId(xm.getHyId());
		for(CzXmxxLsb xmLsb : xmList){
			CzXmSpwYj yjTem = czXmSpwYjDao.getCzXmSpwYjByXmIdWyId(xmLsb.getId(), yj.getSpwy());
			if(yjTem != null){
				if(StringUtils.equals("0", yjTem.getSftjspyj())){
					return false;
				}
			}
		}
		return true;
	}

	public void todoToDid(String todoId) {
		wfBS.submitToDo(todoId);
	}

}
