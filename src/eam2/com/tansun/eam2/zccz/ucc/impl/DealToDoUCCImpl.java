package com.tansun.eam2.zccz.ucc.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IDealToDoBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.vo.CjtzWordVo;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.dept.service.IDeptBS;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
@Service
public class DealToDoUCCImpl implements IDealToDoUCC {

	@Autowired
	private IDealToDoBS dealToDoBS;
	private ZcczWfBS wfBS;
	private IUserBS userBS;
	private IDeptBS deptBS;
	private ICommonOpinionUcc opinionUcc;
	
	@Autowired
	public void setOpinionUcc(ICommonOpinionUcc opinionUcc) {
		this.opinionUcc = opinionUcc;
	}

	@Autowired
	public void setDeptBS(IDeptBS deptBS) {
		this.deptBS = deptBS;
	}

	@Autowired
	public void setUserBS(IUserBS userBS) {
		this.userBS = userBS;
	}

	@Autowired
	public void setWfBS(ZcczWfBS wfBS) {
		this.wfBS = wfBS;
	}

	/**
	 * 查出所有处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMs(CzXmxxLsb lsb ){
		return dealToDoBS.findZCXMs(lsb);
	}
	
	/**
	 * 保存信息 
	 * @param id
	 * @return
	 */
	public void save(CommonBO commonBO) {
		dealToDoBS.save(commonBO);
	}
	
	/**
	 * 更新信息 
	 * @param id
	 * @return
	 */
	public void update(CommonBO commonBO){
		dealToDoBS.update(commonBO);
	}
	
	/**
	 * 删除信息 
	 * @param id
	 * @return
	 */
	public void delete(CommonBO commonBO){
		dealToDoBS.delete(commonBO);
	}
	
	/**
	 * 处置项目关联到会议下
	 * @param id
	 * @param xmIds
	 */
	public void creatCzxm2Meeting(String id, String[] xmIds){
		dealToDoBS.creatCzxm2Meeting(id,xmIds);
	}
	
	/**
	 * 在会议下 删除处置项目
	 * @return
	 */
	public void delCzxm2Meeting(String hyId, String[] xmIds){
		dealToDoBS.delCzxm2Meeting(hyId,xmIds);
	}
	
	/**
	 * 根据角色，查询出审批委员，或者审批主持人的JSON
	 * @param role
	 * @return
	 */
	public String getZcrOrSpwyByRole(String role){
		return dealToDoBS.getZcrOrSpwyByRole(role);
	}
	
	/**
	 * 修改处置项目的审批委员
	 * @return
	 */
	public void modigySpwy(String xmIds, String spwyIds,String spwys){
		dealToDoBS.modigySpwy(xmIds,spwyIds,spwys);
	}
	
	/**
	 * 会议下项目的排序
	 * @return
	 */
	public String sortXm(String sortType, String hyId, String xmId){
		return dealToDoBS.sortXm(sortType, hyId, xmId);
	}
	
	/**
	 * 保存会议后更新项目的状态为上会
	 * @param id
	 */
	public void updateXmZt(String id){
		dealToDoBS.updateXmZt(id);
	}
	
	/**
	 * 查询hyId的会议信息
	 * @param hyId
	 */
	public CzHyxx findHyxxById(String hyId){
		return dealToDoBS.findHyxxById(hyId);
	}
	
	/**
	 * 根据审批委员Id，会议id查询上会中项目
	 * @return
	 */
	public String findCzxmJSON4Sp(String spwyId, String hyId){
		return dealToDoBS.findCzxmJSON4Sp(spwyId,hyId);
	}
	
	/**
	 * 根据会议id查询上会中项目上会意见情况
	 * @return
	 */
	public String findCzxmJSON4Shyj(String hyId){
		return dealToDoBS.findCzxmJSON4Shyj(hyId);
	}
	
	/**
	 * 组织会议，并关联选择的项目到会议下,并给每个项目配主持人
	 * @return
	 */
	public void saveHyxxAndZcr(CzHyxx hyxx){
		dealToDoBS.saveHyxxAndZcr(hyxx);
	}

	public String getDsiposeXmJson() {
		List<CzXmxxLsb> xmList = dealToDoBS.getDsiposeXmList();
		List<CzXmxxLsbVO> xmListVO = null;
		if(xmList != null || xmList.size() > 0) {
			xmListVO = new ArrayList<CzXmxxLsbVO>();
		} else {
			return "";
		}
		for(CzXmxxLsb temp : xmList) {
			String lsbId = temp.getId();
			List<CzXmSpwYj> list = this.dealToDoBS.findSpwyByLsbId(lsbId,ZcczCommon.DEALTODO_SPWY);
			String spwyStr = "";
			for(CzXmSpwYj spwyTemp : list){
				spwyStr += spwyTemp.getSpwyxm() + ",";
			}
			if(StringUtils.isNotEmpty(spwyStr))
				spwyStr += spwyStr.substring(0, spwyStr.length() - 1);
			CzXmxxLsbVO vo = new CzXmxxLsbVO();
			vo.copyProperties(temp);
			vo.setSpwy(spwyStr);
			xmListVO.add(vo);
		}
		return BodyListToJSON.getJSON(xmListVO, 100, 1, 10000);
	}
	public String getDsiposeXmJson(CzXmxxLsb lsb){
		List<CzXmxxLsb> xmList = dealToDoBS.getDsiposeXmList(lsb);
		List<CzXmxxLsbVO> xmListVO = null;
		if(xmList != null || xmList.size() > 0) {
			xmListVO = new ArrayList<CzXmxxLsbVO>();
		} else {
			return "";
		}
		for(CzXmxxLsb temp : xmList) {
			String lsbId = temp.getId();
			List<CzXmSpwYj> list = this.dealToDoBS.findSpwyByLsbId(lsbId,ZcczCommon.DEALTODO_SPWY);
			String spwyStr = "";
			for(CzXmSpwYj spwyTemp : list){
				spwyStr += spwyTemp.getSpwyxm() + ",";
			}
			if(StringUtils.isNotEmpty(spwyStr))
				spwyStr = spwyStr.substring(0, spwyStr.length() - 1);
			CzXmxxLsbVO vo = new CzXmxxLsbVO();
			vo.copyProperties(temp);
			vo.setSpwy(spwyStr);
			xmListVO.add(vo);
		}
		return BodyListToJSON.getJSON(xmListVO, 100, 1, 10000);
	}
	@SuppressWarnings("unchecked")
	public String getInvestmentXmJson(CzXmxxLsb lsb) {
		List<CzXmxxLsb> xmList = dealToDoBS.getInvestmentXmList(lsb);
		List<CzXmxxLsbVO> xmListVO = null;
		if(xmList != null || xmList.size() > 0) {
			xmListVO = new ArrayList<CzXmxxLsbVO>();
		} else {
			return "";
		}
		for(CzXmxxLsb temp : xmList) {
			String lsbId = temp.getId();
			List<CzXmSpwYj> list = this.dealToDoBS.findSpwyByLsbId(lsbId,ZcczCommon.DEALTODO_SPWY);
			String spwyStr = "";
			for(CzXmSpwYj spwyTemp : list){
				spwyStr += spwyTemp.getSpwyxm() + ",";
			}
			if(StringUtils.isNotEmpty(spwyStr))
				spwyStr = spwyStr.substring(0, spwyStr.length() - 1);
			CzXmxxLsbVO vo = new CzXmxxLsbVO();
			vo.copyProperties(temp);
			vo.setSpwy(spwyStr);
			xmListVO.add(vo);
		}
		return BodyListToJSON.getJSON(xmListVO, 100, 1, 10000);
	}

	public void sendToDoWysp(String hyId, PTUserBO currentUser) {
		wfBS.sendSpwySpdb(hyId, currentUser);
		wfBS.setXmzt_WYTJYJZ(hyId);//委员提交意见中
	}
	
	public CzHyxx setZcrInfo(String hyId, String zcrId){
		if(StringUtils.isNotEmpty(hyId)){
			CzHyxx hyxx = dealToDoBS.findHyxxById(hyId);
			if(StringUtils.isNotEmpty(zcrId)){
				PTUserBO user = userBS.getSingleById(Long.parseLong(zcrId));
				PTDeptBO dept = deptBS.getDeptByUserId(Long.parseLong(zcrId)).get(0);
				hyxx.setSpzcr(String.valueOf(user.getTid()));
				hyxx.setZcrxm(user.getUsername());
				hyxx.setZcrbmid(String.valueOf(dept.getTid()));
				hyxx.setZcrbmmc(dept.getDeptName());
				dealToDoBS.update(hyxx);
			}
			return hyxx;
		}
		return null;
	}

	public String isAllSpwySubmit(String hyId) {
		return JSONObject.fromObject(wfBS.isAllXmSubmit(hyId)).toString();
	}
	
	public void saveSpsj(String hyId, Date spsj){
		CzHyxx hyxx = dealToDoBS.findHyxxById(hyId);
		hyxx.setSpsj(spsj);
		dealToDoBS.update(hyxx);
	}
	public void setOrder(String strid, String sortid) {
		dealToDoBS.setOrder(strid,sortid);
	}

	public void sendMessageToWtjSpwy(String hyId, Long currentUserId) {
		CzHyxx hyxx = dealToDoBS.findHyxxById(hyId);
		List<CzXmSpwYj> yjList = dealToDoBS.getAllWtjSpwy(hyId);
		for(CzXmSpwYj yj : yjList){
			PTMessage message = new PTMessage();
			message.setSendUserId(currentUserId);
			message.setUserId(Long.parseLong(yj.getSpwy()));
			StringBuffer cjyj = new StringBuffer();
			cjyj.append("请为会议 ");
			cjyj.append(hyxx.getHycs()==null?"":hyxx.getHycs());
			cjyj.append(" 中的项目提交意见!");
			message.setMessage(cjyj.toString());
//			message.setUrl(url);
//			message.setParam(param);
			message.setType("1");
			dealToDoBS.save(message);
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<CzXmSpwYj> findSpwyByLsbId(String lsbId, String isSpwy) {
		return this.dealToDoBS.findSpwyByLsbId(lsbId, isSpwy);
	}

	public CzXmxxLsb findCzXmXxById(String id) {
		return this.dealToDoBS.findCzXmXxById(id);
	}

	public String generatorZhenwen(String hyId, String hylx) {
		String[] arr = new String[]{"一","二","三","四","五","六","七","八","九","十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十"};
		CzHyxx hyxx = dealToDoBS.findHyxxById(hyId);
		List<CzXmxxLsb> xmxxList = dealToDoBS.findCzXmXxByHyid(hyId);
		StringBuffer sb = new StringBuffer();
		CzXmxxLsb xm = null;
		if(StringUtils.equals("investment", hylx)){
			CjtzWordVo vo = new CjtzWordVo();
			vo.setHyqs(hyxx.getHycs());
			vo.setHydd(hyxx.getHydd());
			vo.setHyrq(new SimpleDateFormat("yyyy-MM-dd").format(hyxx.getSpsj()));
			vo.setHysj(new SimpleDateFormat("HH:mm:ss").format(hyxx.getSpsj()));
			vo.setHyzc(hyxx.getZcrxm());
			if(StringUtils.isNotEmpty(hyxx.getHyjyzlr())){
				vo.setHyjyzlr(
						userBS.getSingleById(Long.parseLong(hyxx.getHyjyzlr())).getUsername()
				);
			}
			vo.setDqrq(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			vo.setZqs(dealToDoBS.getCjtzHyxxCount(hyId));
			for(int i=0; i<xmxxList.size(); i++){
				xm = xmxxList.get(i);
				List<CzXmSpwYj> wyList = dealToDoBS.findSpwyByLsbId(xm.getId(), "0");
				List<CzXmxxLsbVO> allWyList = dealToDoBS.getAllSpwy("139");
				boolean isSetCx = false;
				for(CzXmxxLsbVO awy : allWyList){
					boolean isCx = false;
					for(CzXmSpwYj wy : wyList){//设置出席人员he未出席人员
						if(wy.getSpwy().equals(awy.getSpwyId()))
							isCx = true;
						if(!isSetCx && StringUtils.isNotEmpty(wy.getSpwyxm())){
//							if(StringUtils.equals("0", wy.getSftjspyj())){
//								vo.setWcxry(vo.getWcxry() + "," + wy.getSpwyxm());
//							}else if(StringUtils.equals("1", wy.getSftjspyj())){
							vo.setCxry(vo.getCxry() + "," + wy.getSpwyxm());
//							}
						}
					}
					if(!isCx){
						vo.setWcxry(vo.getWcxry() + "," + awy.getSpwy());
					}
					isSetCx = true;
				}
				if(StringUtils.isNotEmpty(xm.getJcslxrxm()))//设置检查员
					vo.setJcy(vo.getJcy() + "," + xm.getJcslxrxm());
				//设置发生部门
				CzStcztz cld = (CzStcztz)dealToDoBS.findById(CzStcztz.class,xm.getCldId());
				vo.setFsbm(vo.getFsbm() + "," + cld.getNgbmmc() + "(" + cld.getCzxmmc() + ")");
				
				//设置正文
				sb.append("议题").append(i+1).append(": ").append(xm.getCzxmmc()).append("\n");
				sb.append("会议审议了 ").append(cld.getNgbmmc()).append(" 的《").append(cld.getCzxmmc()).append("》").append("\n");
				sb.append("会议决定: ").append(StringUtils.equals("0", xm.getSpjl())?"不同意":"同意").append("\n");
				sb.append("会议要求: ");
				List<PTCommonOpinionBO> opinionList = opinionUcc.query4View(xm.getId(), new Integer(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST));
				for(PTCommonOpinionBO opinion : opinionList){
					sb.append(opinion.getYjnr()).append("\n");
				}
				sb.append("\n");
			}
			vo.setZhengwen(sb.toString());
			if(vo.getCxry() != null && vo.getCxry().length() > 0)
				vo.setCxry(vo.getCxry().substring(1, vo.getCxry().length()));
			if(vo.getWcxry() != null && vo.getWcxry().length() > 0)
				vo.setWcxry(vo.getWcxry().substring(1, vo.getWcxry().length()));
			if(vo.getJcy() != null && vo.getJcy().length() > 0)
				vo.setJcy(vo.getJcy().substring(1, vo.getJcy().length()));
			if(vo.getFsbm() != null && vo.getFsbm().length() > 0)
				vo.setFsbm(vo.getFsbm().substring(1, vo.getFsbm().length()));
			return JSONObject.fromObject(vo).toString();
		}else{
			for(int i=0; i<xmxxList.size(); i++){
				xm = xmxxList.get(i);
				sb.append("议题").append(i>=arr.length?i:arr[i]).append(":").append(xm.getCzxmmc()).append("\n");
				sb.append("\t").append("审批委员：");
					List<CzXmSpwYj> wyList = dealToDoBS.findSpwyByLsbId(xm.getId(), "0");
					for(CzXmSpwYj wy : wyList){
						sb.append(wy.getSpwyxm()).append(",");
					}
					sb.deleteCharAt(sb.length()-1);
				sb.append("\n").append("汇总意见和建议：");
					List<PTCommonOpinionBO> opinionList = opinionUcc.query4View(xm.getId(), new Integer(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST));
					for(PTCommonOpinionBO opinion : opinionList){
						sb.append(opinion.getYjnr()).append("\n");
					}
				sb.append("\n");
			}
			return sb.toString();
		}
	}
	public PTTodo getPTTodoById(String todoId){
		return this.dealToDoBS.getPTTodoById(todoId);
	}
	public void updateHyZT(String[] xmIds){
		this.dealToDoBS.updateHyZT(xmIds);
	}
}
