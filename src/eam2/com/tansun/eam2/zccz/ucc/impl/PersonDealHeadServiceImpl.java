package com.tansun.eam2.zccz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ICzStcztzDao;
import com.tansun.eam2.zccz.service.IPersonDealBodyDao;
import com.tansun.eam2.zccz.ucc.IPersonDealHeadService;
import com.tansun.eam2.zccz.vo.PersonHeadVo;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

@Service
public class PersonDealHeadServiceImpl implements IPersonDealHeadService {

	private IEntityService entityBS;
	private ICzStcztzDao headDao;
	private IPersonDealBodyDao bodyDao;
	private ICodeGenerator codeGenerator;
	private ICodeService codeService;

	@Autowired
	PublicDao publicDao;

	private CzStcztzWfBS wfBS;

	@Autowired
	public void setWfBS(CzStcztzWfBS wfBS) {
		this.wfBS = wfBS;
	}

	@Autowired
	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}

	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}

	public PersonHeadVo setStjbxxToCzStcztz(String headId, String stid, String fafl, String oldStid) throws IllegalAccessException, InvocationTargetException {
		PersonHeadVo vo = new PersonHeadVo();
		StJbxx st = entityBS.viewEntityJbxx(stid);
		CzStcztz head = new CzStcztz();
		head.setId(headId);
		head.setStid(st.getId());
		head.setStmc(st.getStzwmc());
		head.setZcbh(st.getZcbh());
		head.setStscsf(st.getCShengfen());
		head.setStlx(st.getStlx());
		if(StringUtils.equals("1", fafl)){
			head.setStrs(st.getSyrys());
			head.setBgdz(st.getBgdz());
			head.setZmtz(StringUtils.isNotEmpty(st.getZmtz())?Double.valueOf(st.getZmtz()):null);
			head.setCWtgljg(st.getCWtgljg());
			head.setCzygsnsqk(st.getCzygsnsqk());
			head.setZyyw(st.getZyyw());
			head.setZzqk(st.getZzqk());
			head.setGqgc(this.getStGqgcStr(stid));
		}else{
			head.setStxz(st.getStxz2());
			head.setStlx(st.getStlx());
			if(!StringUtils.equals(stid, oldStid)){
				bodyDao.resetRenyuan(headId);
			}
		}
		BeanUtils.copyProperties(vo, head);
		if(head.getStscsf() != null)
			vo.setSfName(codeService.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", head.getStscsf()));
		if(head.getStxz() != null)
			vo.setStxzName(codeService.findCodeValueByCodeTypeAndCodeKey("ENTITY_CURRENT_STATUS", head.getStxz()));
		if(st.getCStzt() != null)
			vo.setCStzt(st.getCStzt());
		return vo;
	}

	/**cz_fysr_mx_lsb
	 * 设置head的安置人数和安置总费用
	 */
	public CzStcztz setRyFyInfo(String headId) {
		List<CzAzryXx> personList = bodyDao.getAnZhiPersonByHeadId(headId);
		List<CzFysrMx> feiyongList = bodyDao.getAnZhiFeiyongBy(headId);
		CzStcztz head = new CzStcztz();
		head.setAzrs((long)personList.size());
		double num = 0.0;
		//安置人员明细中 安置费用 显示
		//for(CzAzryXx person : personList){
		//	num += person.getFazfy()==null?0.0:person.getFazfy();
		//}
		for(CzFysrMx fy : feiyongList){
			num += fy.getYjhf()==null?0.0:fy.getYjhf();
		}
		head.setAzfy(num);
		return head;
	}

	public void reSetRenyuanFeiyong(String cldId) {
		CzStcztz czStcztz = headDao.getHeadById(cldId);
		czStcztz.setZcbh(null);
		czStcztz.setStid(null);
		czStcztz.setStlx(null);
		czStcztz.setStmc(null);
		czStcztz.setStxz(null);
		czStcztz.setStscsf(null);
		czStcztz.setStywyxzc(null);
		czStcztz.setDjtstyzr(null);
		czStcztz.setFzje(0d);
		headDao.update(czStcztz);
		bodyDao.delAnZhiFeiyong(bodyDao.getAnZhiFeiyongBy(cldId));
		bodyDao.delAnZhiPerson(bodyDao.getAnZhiPersonByHeadId(cldId));
	}

	public CzStcztz generateBianhao(String cldId) {
		CzStcztz czStcztz = headDao.getHeadById(cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao())){
			String bianhao = codeGenerator.generateCurrentCode("stryaz", czStcztz.getNgbm(), czStcztz.getNgbmmc());
			if(StringUtils.indexOf(bianhao, "未找到编号生成规则") != -1)
				return null;
			czStcztz.setBianhao(bianhao);
			headDao.saveHead(czStcztz);
		}
		return czStcztz;
	}
	
	public CzStcztz generateShoulixuhaoShenbaoRQ(String cldId) {
		CzStcztz czStcztz = headDao.getHeadById(cldId);
		if(StringUtils.isEmpty(czStcztz.getSlxh())){
			String slxh = codeGenerator.generateCurrentCode("slxh", "11310", "风险管理部");
			if(StringUtils.indexOf(slxh, "未找到编号生成规则") != -1)
				return null;
			czStcztz.setSlxh(slxh);
			czStcztz.setSbrq(new Date());
			headDao.saveHead(czStcztz);
		}
		return czStcztz;
	}
	
	public String saveHead(CzStcztz head) {
		return headDao.saveHead(head);
	}

	public CzStcztz viewDraft(String id){
		CzStcztz head = headDao.getHeadById(id);
		if(head != null)return head;
		return new CzStcztz();
	}
	
	public List<CzStcztz> viewHead(String stid,String lcmc) {
		String preparedHQL = "from CzStcztz a  where  a.stid=?  and a.lcmc=?  ";
		List params = new ArrayList();
		params.add(stid);
		params.add(lcmc);
		List<CzStcztz> tempList = new ArrayList();
		tempList = (List<CzStcztz>) publicDao.find(preparedHQL, params);
		return tempList;
	}
	
	@Autowired
	public void setEntityBS(IEntityService entityBS) {
		this.entityBS = entityBS;
	}

	@Autowired
	public void setHeadDao(ICzStcztzDao headDao) {
		this.headDao = headDao;
	}

	@Autowired
	public void setBodyDao(IPersonDealBodyDao bodyDao) {
		this.bodyDao = bodyDao;
	}
	
	@Autowired
	ICEMEntityService cEMEntityService;   	
	private String getStGqgcStr(String stId){
		List<StFsxx> stFsxxs=cEMEntityService.viewEntityFsxx(stId, StglCommon.ST_INFO_GUQUAN);
		String strStFsxs = "";
		if(stFsxxs.size()>0){
			for(StFsxx stFsxx:stFsxxs){
				//股东名称
				String egdmc = stFsxx.getEgdmc()==null?"&nbsp;":stFsxx.getEgdmc();
				strStFsxs = strStFsxs+egdmc+"#%#";
				//股东性质
				String egdxz = stFsxx.getEgdxz()==null?"&nbsp;":stFsxx.getEgdxz();
				strStFsxs = strStFsxs+egdxz+"#%#";
				//持股比例
				String ecgbl;
				if(stFsxx.getEcgbl()==null){
					ecgbl = "&nbsp;";
				}else{
					ecgbl = stFsxx.getEcgbl().toString();
				}
//				String ecgbl = stFsxx.getEcgbl()==null?"&nbsp;":stFsxx.getEcgbl().toString();
				strStFsxs = strStFsxs+ecgbl+"#%#";
				//报告日期
				String ebgrq;
				if(stFsxx.getEbgrq() == null){
					ebgrq = "&nbsp;";
				}else{
					ebgrq =( new SimpleDateFormat("yyyy-MM-dd").format(stFsxx.getEbgrq())).toString();
				}
//				String ebgrq = stFsxx.getEbgrq().toString()==null?"&nbsp;":stFsxx.getEbgrq().toString();
//				if("&nbsp;".equals(ebgrq)){
//					ebgrq =( new SimpleDateFormat("yyyy-MM-dd").format(stFsxx.getEbgrq())).toString();
//				}
				strStFsxs = strStFsxs+ebgrq+"#%#";
				//持股数量
				String ecgsl;
				if(stFsxx.getEcgsl() == null){
					ecgsl = "&nbsp;";
				}else{
					ecgsl = stFsxx.getEcgsl().toString();
				}
				strStFsxs = strStFsxs+ecgsl+"#%#";
				//本部是否控股
				String ebbsfkg =stFsxx.getEbbsfkg();
				if("0".equals(ebbsfkg)){
					ebbsfkg =" 否";
				}else if("1".equals(ebbsfkg)){
					ebbsfkg = "是";
				}else if("2".equals(ebbsfkg)){
					ebbsfkg = "未知";
					
				}else{
					ebbsfkg = "&nbsp;";
				}
				strStFsxs = strStFsxs+ebbsfkg+"<#>";			
			}
			strStFsxs.substring(0,strStFsxs.length()-4);
		}
		return strStFsxs;
	}

	public void endProcess(CzStcztz head) {
		wfBS.modifyStayazStateYsp(head.getId());
		headDao.save(head);
		CzXmXx xmXx = new CzXmXx();
		xmXx.setBianhao(head.getBianhao());
		xmXx.setCldId(head.getId());
//		xmXx.setCzsx(czsx)这个没有时效
		xmXx.setCzxmmc(head.getCzxmmc());
		xmXx.setFenlei(ZcczCommon.ITEM_FOR_ENTITY);
//		xmXx.setFwwh(fwwh)这个无发文文号
		xmXx.setHbr(head.getNgr());
		xmXx.setHbrxm(head.getNgrxm());
//		xmXx.setHyId(hyId)这个真没有
//		xmXx.setJacldId(jacldId)这个还是没有
		xmXx.setSbrq(new Date());
//		xmXx.setSfba("1");
		xmXx.setSpjl("1");
		xmXx.setZhuangtai("0");
		headDao.save(xmXx);
	}
}
