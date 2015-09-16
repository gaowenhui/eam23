package com.tansun.eam2.stgl.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.service.IEntityFormService;
import com.tansun.eam2.stgl.vo.IncomeCostResultVO;
import com.tansun.eam2.stgl.vo.IncomeResultVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class EntityFormServiceImpl implements IEntityFormService {

	@Autowired
	PublicDao publicDao;
	@Autowired 
	ICodeService codeServiceImpl;	
	public void deleteStGlbt(String[] btIds) {
		for (int i = 0; i < btIds.length; i++) {
			StGlbt stglbt = publicDao.findById(StGlbt.class, btIds[i]);
			publicDao.delete(stglbt);
		}
	}
	
	public void newEntityForm(StHead head) {
		publicDao.saveOrUpdate(head);
	}

	public void newEntityForm(StGlbt body) {
 		publicDao.saveOrUpdate(body);
	}
	public void newEntityForm2(StGlbt body) {
//		publicDao.saveOrUpdate(body);
		String id = java.util.UUID.randomUUID().toString();
		id = id.replace("-", "");
		Double sqje = body.getSqje() == null?0:body.getSqje();
		Double sdje = body.getSdje() == null?0:body.getSdje();
		String sqxmmc = body.getSqxmmc() == null?"":body.getSqxmmc();
		String Csqsxlx = body.getCSqsxlx() == null?"":body.getCSqsxlx();
		String fyzl = body.getFyzl() == null?"":body.getFyzl();
		String sqsm = body.getSqsm() == null?"":body.getSqsm();
		String sql = "insert into st_glbt (id,cld_id,ST_ID,sqje,sdje,sqxmmc,C_SQSXLX,sqsm,FYZL) " +
				"values('"+id+"','"+body.getCldId()+"','"+body.getStId()+"','"+sqje+"','"+sdje+"','"+sqxmmc+"','"+Csqsxlx+"','"+sqsm+"','"+fyzl+"')";
		publicDao.getJdbcTemplate().execute(sql);
	}

	/**
	 * 保存表单
	 * @param stHead
	 * @return
	 */
	public void saveEntityForm(StHead stHead){
		publicDao.save(stHead);
	}
	
	public List<StGlbt> viewEntityBody(String headid) {
		return (List<StGlbt>) publicDao.find("from StGlbt o where o.cldId=?",
				new Object[] { headid });
	}

	public StHead viewEntityHead(String headid) {
		return (StHead) publicDao.findSingleResult("from StHead o where o.id=?",
				new Object[] { headid });
	}

	public void deleteStGlbt(StGlbt body) {
		publicDao.delete(body);
		
	}

	public void updateStGlbt(String headId, String stId) {
		String sql = "UPDATE ST_GLBT SET ST_ID = ?  WHERE CLD_ID = ? ";
		List params = new ArrayList();
		params.add(stId);
		params.add(headId);
		publicDao.updateBySql(sql, params);
		
	}
    
    /**
     * 根据表单id，更新表单信息中的某个属性
     */
	public void updateStHead(String headId, String property, String value) {
		String sql = "UPDATE ST_HEAD a SET a." +property+
				"= ?  WHERE a.Id = ? ";
		List params = new ArrayList();
		params.add(value);
		params.add(headId);
		publicDao.updateBySql(sql, params);
	}
	
    /**
     * 根据实体id和实体类型，查询该实体所涉及到的处理单流程信息
     * @param stId
     * @param zixunType
     * @return
     */
	@SuppressWarnings("unchecked")
	public List<StHead> findHeadList(String stId, String zixunType) {
		String preparedHQL;
		List params = new ArrayList();
		List<StHead> tempList = new ArrayList();
		preparedHQL = "select a from StHead  a where a.stId =  ? and a.zixuntype = ?  and  a.spzt = ? ";
		String spzt = "2";
		params.add(stId);
		params.add(zixunType);
		params.add(spzt);
		tempList = (List<StHead>) publicDao.find(preparedHQL, params);
//		tempList = (List<StHead>) publicDao.find(preparedHQL, params);
		return tempList;
	}
	
	/**
	 * 查询某实体所涉及到的费用
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<IncomeCostResultVO> viewStIncomeCost(String stId,String zixunType) {
		List<StHead> tempList = new ArrayList();
		List<IncomeCostResultVO> resultList = new ArrayList(); 
		tempList = this.findHeadList(stId, zixunType);
		for(StHead head:tempList){
			if(("重大财务事项".equals(head.getLcmc())||"确权".equals(head.getLcmc())||"其他事项审批".equals(head.getLcmc()))&&("2".equals(head.getSpzt()))){
				String headId = head.getId();
				List<StGlbt> bodyList= this.viewEntityBody(headId);
				for(StGlbt body:bodyList){
					IncomeCostResultVO incomeCostResultVO = new IncomeCostResultVO();
					BeanUtils.copyProperties(head, incomeCostResultVO);
					incomeCostResultVO.setBodyId(body.getId());
					//重大财务事项中申请事项类型
					String CSqsxlx = body.getCSqsxlx();
					if(CSqsxlx!=null&&""!=CSqsxlx){
						CSqsxlx = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EVENT_TYPE",CSqsxlx);
						incomeCostResultVO.setCSqsxlx(CSqsxlx);
					}
					
					incomeCostResultVO.setSqje(body.getSqje());
					incomeCostResultVO.setSdje(body.getSdje());
					incomeCostResultVO.setSqxmmc(body.getSqxmmc());
					//费用种类
					incomeCostResultVO.setFyzl(body.getFyzl());
					String fyzl = body.getFyzl();
					if(fyzl!=null&&""!=fyzl){
						fyzl = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_EXPENSES_TYPE",fyzl);
						incomeCostResultVO.setFyzl(fyzl);
					}
					incomeCostResultVO.setSqsm(body.getSqsm());
					resultList.add(incomeCostResultVO);
				}
			}
		}
		return resultList;
	}

	public StGlbt findBody(String btId) {
		return (StGlbt) publicDao.findSingleResult("from StGlbt o where o.id=?",
				new Object[] { btId });
	}
	/**
	 * 查询某实体所涉及到的收入（回款审批）
	 * @return
	 */
	public List<IncomeResultVO> viewStIncome(String stId) {
//		String preparedHQL;
//		List params = new ArrayList();
//		List<IncomeResultVO> tempList = new ArrayList<IncomeResultVO>();
//		preparedHQL = "select distinct b.gqStmc,i.lcmc,b.gqHkxz, h.qrrq, b.gqHsxjje " +
//				" from BizBackCashInfo i, BizBackConfirmBody b, BizBackConfirmHead h " +
//				"where b.headid = h.id and h.cashid = i.id and h.qrdlx = '4' and h.sfzzhk = '是'  and b.gqId = ? ";
//		params.add(stId);
		
		String sql = "select distinct b.gq_Stmc,i.lcmc,b.gq_Hkxz, h.qrrq, b.gq_Hsxjje " +
				" from biz_back_cash_info i,biz_back_confirm_body b,biz_back_confirm_head h " +
				"where b.headid = h.id and h.cashid = i.id and h.qrdlx = '4' and h.sfzzhk = '是'  and b.gq_Id = '"+stId+"' ";
//		tempList = (List<IncomeResultVO>) publicDao.find(preparedHQL, params);
		List list = publicDao.queryForList(sql, new ArrayList());
		List<IncomeResultVO> tempList = new ArrayList<IncomeResultVO>();
		for(int i=0;i<list.size();i++){
			Map map = (Map)list.get(i);
			IncomeResultVO vo = new IncomeResultVO();
			vo.setGqHkxz(checkString(map.get("gq_Hkxz")));
			vo.setGqHsxjje(checkDouble(map.get("gq_Hsxjje")));
			vo.setLcmc(checkString(map.get("lcmc")));
			vo.setGqStmc(checkString(map.get("gq_Stmc")));
			vo.setQrrq((Date)map.get("qrrq"));
			tempList.add(vo);
		}
		return tempList;
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

}
