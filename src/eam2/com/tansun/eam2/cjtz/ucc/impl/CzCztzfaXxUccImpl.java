package com.tansun.eam2.cjtz.ucc.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICzCztzfaXxService;
import com.tansun.eam2.cjtz.ucc.ICzCztzfaXxUCC;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Service
public class CzCztzfaXxUccImpl implements ICzCztzfaXxUCC {
	@Autowired
	private ICzCztzfaXxService bs;
	private ICodeGenerator codeGenerator;

	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}	

	public CzCztzfaXx getCzCztzfaXxById(String id) {
		return bs.getCzCztzfaXxById( id);
	}

	public void saveOrUpdateCzCztzfaXx(CzCztzfaXx czCztzfaXx) {
	}

	public void delete(CommonBO bo) {
		bs.delete(bo);
	}

	public void save(CommonBO bo) {
		bs.save(bo);
	}

	public void update(CommonBO bo) {
		bs.update(bo);
	}
	/**
	 * 保存表体,根据表头id 选择资产ids
	 * 
	 * @return
	 */
	public void saveBody(String zcIds, String headId){
		bs.saveBody(zcIds,headId);
	}
	/**
	 * 得到固定资产的列表
	 * @return
	 */
	public String getGdzcList(String headId){
		return bs.getGdzcList( headId);
	}
	
	/**
	 * 根据资产ID 找到相应的费用信息
	 * 
	 * @param zcId
	 * @return
	 */
	public List getJyzcSqsdfyXxByZcId(String zcId,String cldId){
		return bs.getJyzcSqsdfyXxByZcId(zcId, cldId);
	}
	
	/**
	 * 选择资产后转换为处置资产信息
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxByZcId(String zcIds){
		return bs.getCzZcXxByZcId(zcIds);
	}
	/**
	 * 处置承继投资添加，及申请审定费用表添加
	 * 
	 * @return
	 */
	public void addFy(String headId, CzZcXx czZcXx, String[] xmmcs,
			String[] sqjes, String[] sdjes){
		bs.addFy(headId, czZcXx, xmmcs, sqjes, sdjes);
	}
	
	/**
	 * 根据id删除body
	 * @param zcIds
	 */
	public void deleteBody(String zcIds,String headId){
		bs.deleteBody(zcIds, headId);
	}
	
	/**
	 * 修改body
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxById(String zcIds){
		return bs.getCzZcXxById( zcIds);
	}
	
	/**
	 * 保存租赁表体
	 * @param czZcXx
	 * @param headId
	 */
	public void saveBody(CzZcXx czZcXx, String headId){
		bs.saveBody(czZcXx, headId);
	}
	/**
	 * 实体承继投资审批，即业务类型为实体的审批单
	 * @param czCztzfaXx
	 * @param czstcztz
	 */
	public void updateSt(CzCztzfaXx czCztzfaXx, CzStcztz czstcztz){
		bs.updateSt( czCztzfaXx,  czstcztz);
	}
	
	/**
	 * 根据id查询实体信息
	 * @param headId
	 * @return
	 */
	public CzStcztz getCzStcztzById(String headId){
		return bs.getCzStcztzById(headId);
	}
	
	public CzStcztz generateShoulixuhaoShenbaoRQ(String cldId) {
		CzStcztz czStcztz = (CzStcztz)bs.findById(CzStcztz.class, cldId);
		if(StringUtils.isEmpty(czStcztz.getSlxh())){
			String slxh = codeGenerator.generateCurrentCode("cjtz_slxh", "", "");
			if(StringUtils.indexOf(slxh, "未找到编号生成规则") != -1)
				return null;
			
			czStcztz.setSlxh(slxh);
			czStcztz.setSbrq(new Date());
			bs.save(czStcztz);
		}
		return czStcztz;
	}
	
	public CzStcztz generateBianhao(String cldId) {
		CzStcztz czStcztz = (CzStcztz)bs.findById(CzStcztz.class,cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao())){
			String bianhao = codeGenerator.generateCurrentCode("cjtz", czStcztz.getNgbm(), czStcztz.getNgbmmc());
			if(StringUtils.indexOf(bianhao, "未找到编号生成规则") != -1)
				return null;
			czStcztz.setBianhao(bianhao);
			bs.save(czStcztz);
		}
		return czStcztz;
	}	
}
