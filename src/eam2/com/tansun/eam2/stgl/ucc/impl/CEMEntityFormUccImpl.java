package com.tansun.eam2.stgl.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.service.IEntityFormService;
import com.tansun.eam2.stgl.ucc.ICEMEntityFormUcc;
import com.tansun.eam2.stgl.vo.IncomeCostResultVO;
import com.tansun.eam2.stgl.vo.IncomeResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;

@Service
public class CEMEntityFormUccImpl implements ICEMEntityFormUcc {

	@Autowired
	IEntityFormService entityFormServiceImpl;
	
	public void saveEntityForm(StHead head) {
		StHead stHeadNew = viewEntityHead( head.getId());
        stHeadNew.setBiaoti(head.getBiaoti());
        stHeadNew.setChengsong(head.getChengsong());
        //stHeadNew.setBianhao(head.getBianhao());
        stHeadNew.setSfsjfy(head.getSfsjfy());
        stHeadNew.setJhcd(head.getJhcd());
        //stHeadNew.setNgbm(head.getNgbm());
        stHeadNew.setLxdh(head.getLxdh());
        stHeadNew.setYwlx(head.getYwlx());
        stHeadNew.setSqjehj(head.getSqjehj());
        stHeadNew.setSdjehj(head.getSdjehj());
        stHeadNew.setZcbh(head.getZcbh());
        stHeadNew.setStId(head.getStId());
        stHeadNew.setStzwmc(head.getStzwmc());
        stHeadNew.setGqgc(head.getGqgc());
        stHeadNew.setZzqk(head.getZzqk());
        stHeadNew.setDiqu(head.getDiqu());
        stHeadNew.setBgdz(head.getBgdz());
        stHeadNew.setStrs(head.getStrs());
        stHeadNew.setCWtgljg(head.getCWtgljg());
        stHeadNew.setZmtz(head.getZmtz());
        stHeadNew.setCzygsnsqk(head.getCzygsnsqk());
        stHeadNew.setZyyw(head.getZyyw());
        stHeadNew.setHqbm(head.getHqbm());
        stHeadNew.setHqbmid(head.getHqbmid());
        stHeadNew.setZzc(head.getZzc());
        stHeadNew.setJhxzrs(head.getJhxzrs());
        stHeadNew.setFuzhai(head.getFuzhai());
        stHeadNew.setGuben(head.getGuben());
        stHeadNew.setJzc(head.getJzc());
        stHeadNew.setStsr(head.getStsr());
        stHeadNew.setJlr(head.getJlr());
        stHeadNew.setBz(head.getBz());
		entityFormServiceImpl.newEntityForm(stHeadNew);
	}

	public StHead viewEntityHead(String headid) {
		return entityFormServiceImpl.viewEntityHead(headid);
	}
	public void deleteStGlbt(String[] btIds) {
		entityFormServiceImpl.deleteStGlbt(btIds);
		
	}

	public List<StGlbt> viewEntityBody(String headid) {
		return entityFormServiceImpl.viewEntityBody(headid);
	}

	public void newEntityForm(StGlbt body) {
		entityFormServiceImpl.newEntityForm(body);
		
	}

	public IEntityFormService getEntityFormServiceImpl() {
		return entityFormServiceImpl;
	}

	public void setEntityFormServiceImpl(IEntityFormService entityFormServiceImpl) {
		this.entityFormServiceImpl = entityFormServiceImpl;
	}

	public List<StFsxx> viewStaff(StaffQueryVO staffQueryVO) {
		// TODO Auto-generated method stub
		return null;
	}

	public void newEntityForm(List<StGlbt> list) {
		for(StGlbt body:list){
			entityFormServiceImpl.newEntityForm(body);
		}
		
	}
	public void newEntityForm2(List<StGlbt> list) {
		for(StGlbt body:list){
			entityFormServiceImpl.newEntityForm2(body);
		}
		
	}

	public void newEntityForm(StHead head) {
		entityFormServiceImpl.newEntityForm(head);
		
	}
	
	/**
	 * 删除表体
	 */
	public void deleteStGlbt(List<StGlbt> bodyList) {
		for(StGlbt body:bodyList){
			entityFormServiceImpl.deleteStGlbt(body);
		}
	}

	public void updateStGlbt(String headId,String stId) {
		entityFormServiceImpl.updateStGlbt( headId,stId);
		
	}

	public void updateStHead(String headId, String property, String value) {
		entityFormServiceImpl.updateStHead(headId, property, value);
		
	}
    /**
     * 根据实体id和实体类型，查询该实体所涉及到的处理单流程信息
     * @param stId
     * @param zixunType
     * @return
     */
	public List<StHead> findHeadList(String stId, String zixunType) {
		return entityFormServiceImpl.findHeadList(stId, zixunType);
	}
	
	/**
	 * 查询某实体所涉及到的费用
	 * @return
	 */
	public List<IncomeCostResultVO> viewStIncomeCost(String stId,
			String zixunType) {
		return entityFormServiceImpl.viewStIncomeCost(stId, zixunType);
	}

	public StGlbt findBody(String btId) {
		return entityFormServiceImpl.findBody(btId);
	}
	/**
	 * 查询某实体所涉及到的收入
	 * @return
	 */
	public List<IncomeResultVO> viewStIncome(String stId) {
		return entityFormServiceImpl.viewStIncome(stId);
	}
}
