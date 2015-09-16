package com.tansun.eam2.zccz.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.DebtInfoLsb;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ICzStcztzDao;
import com.tansun.eam2.zccz.service.IStatisticQueryBS;
import com.tansun.eam2.zccz.ucc.IEntityDealHeadService;
import com.tansun.eam2.zqgl.service.ICreditorBS;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

@Service
public class EntityDealHeadServiceImpl implements IEntityDealHeadService {

	private ICreditorBS deptDao;
	private ICzStcztzDao headDao;
	private IEntityService entityBS;
	private IStatisticQueryBS statisticBS;
	private ICodeGenerator codeGenerator;

	@Autowired
	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}

    @Autowired
    public void setStatisticBS(IStatisticQueryBS statisticBS) {
        this.statisticBS = statisticBS;
    }

	@Autowired
	public void setHeadDao(ICzStcztzDao headDao) {
		this.headDao = headDao;
	}

	@Autowired
	public void setDeptDao(ICreditorBS deptDao) {
		this.deptDao = deptDao;
	}
	
	public String saveHead(CzStcztz head) {
		return headDao.saveHead(head);
	}

	public CzStcztz viewDraft(String id){
		CzStcztz head = headDao.getHeadById(id);
		if(head != null)return head;
		return new CzStcztz();
	}

    public double[] selectEDM(String stid) {
        double yjhsje = statisticBS.selectEntityYjhsje(stid);
        double hkje = statisticBS.selectEntityHkje(stid);
        return new double[]{yjhsje, hkje};
    }

	/**
	 * 根据实体id取得实体内的债权列表
	 */
	public List<DebtInfo> getDebtListByStid(String stId) {
		if(StringUtils.isNotEmpty(stId)){
			return deptDao.getDebtListByStid(stId);
		}
		return new ArrayList<DebtInfo>();
	}

	/**
	 * 根据表单编号取得该处置项目的历史处置记录List
	 */
	public List<CzStcztz> getHisttoryHeadList(String id,String cldBianhao) {
		if(StringUtils.isNotEmpty(cldBianhao)){
			return headDao.getHeadListByBianhao(id,cldBianhao);
		}
		return new ArrayList<CzStcztz>();
	}

	public void updateCzStcztz(String id, String cldzt){
		CzStcztz czStcztz = headDao.updateCzStcztzState(id, cldzt);
		if(StringUtils.equals(ZcczCommon.FORM_HAVE_NOT_APPROVED, cldzt)){
			entityBS.updateEntityState(czStcztz.getStid(), "1");
		}else if(StringUtils.equals(ZcczCommon.FORM_IS_APPROVING, cldzt)){
			entityBS.updateEntityState(czStcztz.getStid(), "2");
		}else if(StringUtils.equals(ZcczCommon.FORM_HAVE_APPROVED, cldzt)){
			entityBS.updateEntityState(czStcztz.getStid(), "3");
		}
	}

	public CzStcztz generateBianhao(String cldId) {
		CzStcztz czStcztz = headDao.getHeadById(cldId);
		if(StringUtils.isEmpty(czStcztz.getBianhao())){
			String bianhao = codeGenerator.generateCurrentCode("stztcz", czStcztz.getNgbm(), czStcztz.getNgbmmc());
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

	//选择债权
	public void selectDebtList(String cldId, String stid, String ids) throws IllegalAccessException, InvocationTargetException {
		if(StringUtils.isNotEmpty(ids)){
			List<DebtInfo> debtList = deptDao.selectDabtList(IdStrFormat.formatIds(ids));
			for(DebtInfo debt : debtList){
				if(!headDao.isHaveDebt(cldId, debt.getId())){
					DebtInfoLsb lsb = new DebtInfoLsb();
					BeanUtils.copyProperties(lsb, debt);
					lsb.setCldId(cldId);
					lsb.setZqxxId(debt.getId());
					headDao.save(lsb);
				}
			}
		}
	}
	
	//删除债权	
	public void delDebtList(String ids){
		headDao.delDebtByIds(IdStrFormat.formatIds(ids));
	}

	//返回本次处置的债权列表的Json串	
	public String getDebtListJsonByHeadId(String cldId) {
		List<DebtInfoLsb> deptLsbList = headDao.getDebtListByCldId(cldId);
		if(deptLsbList != null){
			return BodyListToJSON.getJSON(deptLsbList, 1, 1, 1);
		}
		return null;
	}

	public void updateDept(String id, Double zrje) {
		DebtInfoLsb lsb = (DebtInfoLsb)headDao.findById(DebtInfoLsb.class, id);
		lsb.setZrje(zrje);
		headDao.update(lsb);
	}

	public void cleanStMessage(String cldId, String stid) {
		CzStcztz czStcztz = headDao.getHeadById(cldId);
		czStcztz.setZcbh(null);
		czStcztz.setStid(null);
		czStcztz.setStmc(null);
		czStcztz.setStxz(null);
		czStcztz.setStscsf(null);
		czStcztz.setZmzcze(0D);
		czStcztz.setZmzcfz(0D);
		headDao.update(czStcztz);
		headDao.deleteDebtsByCldId(cldId, stid);
	}

	private CzStcztzWfBS wfBS;

	@Autowired
	public void setWfBS(CzStcztzWfBS wfBS) {
		this.wfBS = wfBS;
	}
	
	public void endProcess(CzStcztz head) {
		wfBS.modifyStztczStateYsp(head.getId());
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
