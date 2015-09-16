package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.ucc.ZCQueryUCC;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

//@Controller("toCheckAction")
//@Scope("prototype")
public class ToCheckAction extends CommonAction {

	private PdxxVO pdxxVo; 
	private ZyPdxx pdxx;
	private Paginator paginator;
	private String modIds;
	private String sheettype;
	private String saveSuccess = null;
	@Autowired
	ToCheckUCC toCheckUCCimpl;
	@Autowired
	DicAppAssetTypeUCC dicAppAssetTypeUCCimpl;
	@Autowired
	private DicAppAssetTypeUCC dicAppAssetTypeUCC;
	@Autowired
	private ZCQueryUCC ZCQueryUCCimpl;
	@Autowired
	private ZCManageHeadUCC zCManageHeadUCC;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCC;
	
	Log log = LogFactory.getLog(this.getClass());
	
	/**
	 * 盘盈盘亏页面初始化时使用，主要提供盘点批次号
	 * @return
	 */
	public String init(){
		List<ZyPdxx> PdxxList = toCheckUCCimpl.queryPdxxEnd();
		ZyPdxx pdxxForMap;
		Map<String,String> pdpcMap = new LinkedHashMap<String,String>();
		for (Iterator<ZyPdxx> i = PdxxList.iterator(); i.hasNext();) {
			pdxxForMap = i.next();
			if(pdxxForMap.getPdpc() != null){
				pdpcMap.put(pdxxForMap.getPdpc(), pdxxForMap.getPdpc());
			}
		}
		request.setAttribute("pdpcMap", pdpcMap);
		return "initPYPKPage";
	}
	
	/*
	 * 盘盈盘亏页面中的盘盈界面调用本方法，初始化盘盈界面
	 */
	public String panYing() {
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}
	
	/**
	 * 盘盈盘亏调用本方法，实现了分页
	 * @return
	 */
	public String query(){
		if(pdxxVo != null){
			String returnStr = null;
			try{
				returnStr = toCheckUCCimpl.query4PanYingPanKui(pdxxVo,paginator);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(returnStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 把盘盈的物品信息添加到盘点信息表中
	 */
	public String saveZcListToPdxx(){
		String isOperateSuccess = "";
		try{
			String zcIds = request.getParameter("delBodyIds");
			String headId = request.getParameter("headId");
			String pdpc = request.getParameter("pdpc");
			String [] zcIdArray = zcIds.split(",");
			ZyPdxx pdxx = new ZyPdxx();
			for(String zcId : zcIdArray){
				if(StringUtils.isNotEmpty(zcId)){
					ZyZc zyZc = ZCQueryUCCimpl.getZyzcByZcId(zcId);
					pdxx.setSheadId(headId);
					pdxx.setPdrq   (new Date());
					pdxx.setPdpc   (pdpc);
					pdxx.setYjflbm (zyZc.getYjflbm ()!=null?zyZc.getYjflbm ():null);
					pdxx.setEjflbm (zyZc.getEjflbm ()!=null?zyZc.getEjflbm ():null);
					pdxx.setSjflbm (zyZc.getSjflbm ()!=null?zyZc.getSjflbm ():null);
					pdxx.setYjflmc (zyZc.getYjflmc ()!=null?zyZc.getYjflmc ():null);
					pdxx.setEjflmc (zyZc.getEjflmc ()!=null?zyZc.getEjflmc ():null);
					pdxx.setSjflmc (zyZc.getSjflmc ()!=null?zyZc.getSjflmc ():null);
					pdxx.setZcId   (zyZc.getZcId   ()!=null?zyZc.getZcId   ():null);
					pdxx.setZcbh   (zyZc.getZcbh   ()!=null?zyZc.getZcbh   ():null);
					pdxx.setZcmc   (zyZc.getZcmc   ()!=null?zyZc.getZcmc   ():null);
					pdxx.setGg     (zyZc.getGg     ()!=null?zyZc.getGg     ():null);
					pdxx.setSl     (zyZc.getSl     ()!=null?zyZc.getSl     ():null);
					pdxx.setJldw   (zyZc.getJldw   ()!=null?zyZc.getJldw   ():null);
					pdxx.setCfdd   (zyZc.getBgdd   ()!=null?zyZc.getBgdd   ():null);
					toCheckUCCimpl.saveZyPdxx(pdxx);
				}
			}
			isOperateSuccess = "ok";
		}catch(Exception e){
			isOperateSuccess = "error";
			e.printStackTrace();
		}finally{
			try {
				response.getWriter().print(isOperateSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sheettype;
	}
	
	/**
	 * 盘点盘库办结
	 */
	public String endProcess(){
		String isOperateSuccess = "";
		try{
			String zcIds = request.getParameter("delBodyIds");
			String headId = request.getParameter("headId");
			ZyShead head = zCManageHeadUCC.readHead(headId);
			head.setBdzt("数据已办结");
			zCManageHeadUCC.updateHead(head);
			String pdpc = request.getParameter("pdpc");
			String [] zcIdArray = zcIds.split(",");
			ZyPdxx pdxx = new ZyPdxx();
			for(String zcId : zcIdArray){
				if(StringUtils.isNotEmpty(zcId)){
					ZyZc zyZc = ZCQueryUCCimpl.getZyzcByZcId(zcId);
					pdxx.setSheadId(headId);
					pdxx.setPdrq   (new Date());
					pdxx.setPdpc   (pdpc);
					pdxx.setYjflbm (zyZc.getYjflbm ()!=null?zyZc.getYjflbm ():null);
					pdxx.setEjflbm (zyZc.getEjflbm ()!=null?zyZc.getEjflbm ():null);
					pdxx.setSjflbm (zyZc.getSjflbm ()!=null?zyZc.getSjflbm ():null);
					pdxx.setYjflmc (zyZc.getYjflmc ()!=null?zyZc.getYjflmc ():null);
					pdxx.setEjflmc (zyZc.getEjflmc ()!=null?zyZc.getEjflmc ():null);
					pdxx.setSjflmc (zyZc.getSjflmc ()!=null?zyZc.getSjflmc ():null);
					pdxx.setZcId   (zyZc.getZcId   ()!=null?zyZc.getZcId   ():null);
					pdxx.setZcbh   (zyZc.getZcbh   ()!=null?zyZc.getZcbh   ():null);
					pdxx.setZcmc   (zyZc.getZcmc   ()!=null?zyZc.getZcmc   ():null);
					pdxx.setGg     (zyZc.getGg     ()!=null?zyZc.getGg     ():null);
					pdxx.setSl     (zyZc.getSl     ()!=null?zyZc.getSl     ():null);
					pdxx.setJldw   (zyZc.getJldw   ()!=null?zyZc.getJldw   ():null);
					pdxx.setCfdd   (zyZc.getBgdd   ()!=null?zyZc.getBgdd   ():null);
					toCheckUCCimpl.saveZyPdxx(pdxx);
				}
			}
			isOperateSuccess = "ok";
		}catch(Exception e){
			isOperateSuccess = "error";
			e.printStackTrace();
		}finally{
			try {
				response.getWriter().print(isOperateSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	/**
	 * 走流程时根据HeadId到pdxx表中查找pdpc
	 * @return
	 */
	public String getPdpcWithHeadId(){
		String headId = request.getParameter("headId");
		String pdpc = toCheckUCCimpl.getPdpcWithHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(pdpc);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 盘点、盘库修改信息后调用本方法，从数据库中查出本条信息，然后更新字段
	 * @return
	 */
	public String saveInfoToPdxx(){
		ZyPdxx pdxxFromTable = toCheckUCCimpl.findZyPdxxWithID(pdxx.getId());
		pdxxFromTable.setPdjg(StringUtils.isNotEmpty(pdxx.getPdjg())==true?pdxx.getPdjg():null);
		pdxxFromTable.setPdsl(pdxx.getPdsl()!=null?pdxx.getPdsl():null);
		pdxxFromTable.setGg(pdxx.getGg());
		pdxxFromTable.setJldw(pdxx.getJldw());
		pdxxFromTable.setSl(pdxx.getSl());
		pdxxFromTable.setSyrmc(pdxx.getSyrmc());
		pdxxFromTable.setSybmbmc(pdxx.getSybmbmc());
		pdxxFromTable.setCfdd(pdxx.getCfdd());
		toCheckUCCimpl.update(pdxxFromTable);
		request.setAttribute("isSaveSuccess", "success");
		return "tocheckstock";
	}
	
	/**
	 * 批次新增修改
	 * @return
	 */
	public String modify(){
		String recordId = request.getParameter("bodyId");
		if(StringUtils.isNotEmpty(recordId)){
			pdxx = toCheckUCCimpl.findZyPdxxWithID(recordId);
		}else{
			pdxx = new ZyPdxx();
		}
		return "openModifyPage";
	}
	
	/**
	 * 盘库盘点修改
	 * @return
	 */
	public String PYPKModify(){
		String recordId = request.getParameter("bodyId");
		pdxx = toCheckUCCimpl.modifyBody(recordId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(pdxx.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(pdxx.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}
	
	/**
	 * 从盘点信息表中查看要盘点的物品的详细信息
	 */
	public String viewDetailFromPdxx(){
		String zcId = request.getParameter("zcId");
		pdxx = toCheckUCCimpl.findZyPdxxWithID(zcId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(pdxx.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(pdxx.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return "viewDetailFromPdxx";
	}
	
	public String updatePYPK(){
		return null;
	}
	
	/**
	 * 更新盘点信息表
	 * @return
	 */
	public String updateBody(){
		ZyPdxx pdxxForTable = toCheckUCCimpl.findZyPdxxWithID(pdxx.getId());
		pdxxForTable.setPdsl(pdxx.getPdsl());
		pdxxForTable.setSyrmc(pdxx.getSyrmc());
		pdxxForTable.setSybmbmc(pdxx.getSybmbmc());
		pdxxForTable.setCfdd(pdxx.getCfdd());
		pdxxForTable.setPdjg(pdxx.getPdjg());
		pdxxForTable.setBz(pdxx.getBz());
		toCheckUCCimpl.update(pdxxForTable);
		saveSuccess = "saveSuccess";
		return "openModifyPage";
	}
	
	/**
	 * 批量更新盘点信息表
	 * @return
	 */
	public String batUpdateBody(){
		String [] modIdArray = modIds.split(",");
		for(String modId : modIdArray){
			if(StringUtils.isNotEmpty(modId)){
				ZyPdxx pdxxForTable = toCheckUCCimpl.findZyPdxxWithID(modId);
				pdxxForTable.setPdsl(pdxx.getPdsl());
				pdxxForTable.setSyrmc(pdxx.getSyrmc());
				pdxxForTable.setSybmbmc(pdxx.getSybmbmc());
				pdxxForTable.setCfdd(pdxx.getCfdd());
				pdxxForTable.setPdjg(pdxx.getPdjg());
				pdxxForTable.setBz(pdxx.getBz());
				toCheckUCCimpl.update(pdxxForTable);
			}
		}
		saveSuccess = "saveSuccess";
		return "openModifyPage";
	}
	
	/**
	 * 盘盈盘亏时点击确定按钮生成台账和资产
	 * @return
	 * @throws IOException 
	 * @throws Exception 
	 */
	public String generZcAndTz() throws IOException{
		String pdpc = request.getParameter("pdpc");
		String isGenerSuccess = "ok";
		try{
			List<ZyPdxx> pdxxList = toCheckUCCimpl.findZyPdxxWithPdpc(pdpc);
			for(ZyPdxx pdxx	:	pdxxList){
				String pdjg = pdxx.getPdjg();
				double pdsl = pdxx.getPdsl();
				double sl = pdxx.getSl();
				String yjflbm = pdxx.getYjflbm();
				if("盘亏".equals(pdjg)){
					if("3".equals(yjflbm) || "7".equals(yjflbm)){
						List<ZyZc> zcList = ZCQueryUCCimpl.obtainZcListBySjflbm(pdxx.getSjflbm());
						ZyZc zyzc = null;
						Date date = new Date();
						String zcId = pdxx.getZcId();
						for(int i = 0; i < (sl-pdsl); i++){
							zyzc = zcList.get(i);
							zyzc.setZczt("盘亏");
							if(pdpc.contains("盘库")){
								zyzc.setZjpkrq(date);
							}else if(pdpc.contains("盘点")){
								zyzc.setZjpdrq(date);
							}
							zyzc.setZjxgsj(date);
							ZCQueryUCCimpl.updateZyZc(zyzc);
							
							ZyKctz kctz = new ZyKctz();
							kctz.setCksl(0.0);
							kctz.setKcsl(0.0);
							kctz.setRksl(0.0);
							kctz.setRq(date);
							kctz.setSfzxjl(1L);
							kctz.setTzzt("盘亏");
							kctz.setZcId(zcId);
							ZCQueryUCCimpl.saveTZ(kctz);
						}
					}else{
						Date date = new Date();
						String zcId = pdxx.getZcId();
						ZyZc zyzc = ZCQueryUCCimpl.getZyzcByZcId(zcId);
						zyzc.setZczt("盘亏");
						if(pdpc.contains("盘库")){
							zyzc.setZjpkrq(date);
						}else if(pdpc.contains("盘点")){
							zyzc.setZjpdrq(date);
						}
						zyzc.setZjxgsj(date);
						ZCQueryUCCimpl.updateZyZc(zyzc);
						
						ZyKctz kctz = ZCQueryUCCimpl.findTZById(zcId);
						if(kctz != null){
							ZCQueryUCCimpl.updateTZ(kctz.getKctzId());
						}
						kctz = new ZyKctz();
						kctz.setCksl(0.0);
						kctz.setKcsl(0.0);
						kctz.setRksl(0.0);
						kctz.setRq(date);
						kctz.setSfzxjl(1L);
						kctz.setTzzt("盘亏");
						kctz.setZcId(zcId);
						ZCQueryUCCimpl.saveTZ(kctz);
					}
				}else if("盘盈".equals(pdjg)){
					if("3".equals(yjflbm) || "7".equals(yjflbm)){
						Date date = new Date();
						for(int i = 0; i < (pdsl-sl); i++){
							ZyZc zyzc = new ZyZc();
							zyzc.setBgdd(pdxx.getCfdd());
							zyzc.setEjflbm(pdxx.getEjflbm());
							zyzc.setEjflmc(pdxx.getEjflmc());
							zyzc.setGg(pdxx.getGg());
							zyzc.setJldw(pdxx.getJldw());
							zyzc.setSfsckp("否");
							zyzc.setRkrq(date);
							zyzc.setSjflbm(pdxx.getSjflbm());
							zyzc.setSjflmc(pdxx.getSjflmc());
							zyzc.setSl(1.0);
							zyzc.setYjflbm(pdxx.getYjflbm());
							zyzc.setYjflmc(pdxx.getYjflmc());
							zyzc.setZcbh(zCManageBodyUCC.generalKpbh(pdxx.getYjflbm(), pdxx.getEjflbm()));
							zyzc.setZczt("在库");
							zyzc.setZcmc(pdxx.getZcmc());
							if(pdpc.contains("盘库")){
								zyzc.setZjpkrq(date);
							}else if(pdpc.contains("盘点")){
								zyzc.setZjpdrq(date);
							}
							zyzc.setZjxgsj(date);
							ZCQueryUCCimpl.saveZyZc(zyzc);
							
							ZyKctz kctz = new ZyKctz();
							kctz.setCksl(0.0);
							kctz.setKcsl(1.0);
							kctz.setRksl(1.0);
							kctz.setRq(date);
							kctz.setSfzxjl(1L);
							kctz.setZcId(zyzc.getZcId());
							kctz.setTzzt("在库");
							ZCQueryUCCimpl.saveTZ(kctz);
						}
					}else{
						Date date = new Date();
						ZyZc zyzc = new ZyZc();
						zyzc.setBgdd(pdxx.getCfdd());
						zyzc.setEjflbm(pdxx.getEjflbm());
						zyzc.setEjflmc(pdxx.getEjflmc());
						zyzc.setGg(pdxx.getGg());
						zyzc.setJldw(pdxx.getJldw());
						zyzc.setSfsckp("否");
						zyzc.setRkrq(date);
						zyzc.setSjflbm(pdxx.getSjflbm());
						zyzc.setSjflmc(pdxx.getSjflmc());
						zyzc.setSl(1.0);
						zyzc.setYjflbm(pdxx.getYjflbm());
						zyzc.setYjflmc(pdxx.getYjflmc());
						zyzc.setZcbh(zCManageBodyUCC.generalKpbh(pdxx.getYjflbm(), pdxx.getEjflbm()));
						zyzc.setZczt("在库");
						zyzc.setZcmc(pdxx.getZcmc());
						if(pdpc.contains("盘库")){
							zyzc.setZjpkrq(date);
						}else if(pdpc.contains("盘点")){
							zyzc.setZjpdrq(date);
						}
						zyzc.setZjxgsj(date);
						ZCQueryUCCimpl.saveZyZc(zyzc);
						
						ZyKctz kctz = new ZyKctz();
						kctz.setCksl(0.0);
						kctz.setKcsl(1.0);
						kctz.setRksl(1.0);
						kctz.setRq(date);
						kctz.setSfzxjl(1L);
						kctz.setTzzt("在库");
						kctz.setZcId(zyzc.getZcId());
						ZCQueryUCCimpl.saveTZ(kctz);
					}
				}
				
			}
		}catch(Exception e){
//			if(log.isErrorEnabled()){
//				log.error(e.printStackTrace());
//			}
			e.printStackTrace();
			isGenerSuccess = "failure";
		}finally{
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(isGenerSuccess);
		}
		return null;
	}
	
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	
	public ZyPdxx getPdxx() {
		return pdxx;
	}
	public void setPdxx(ZyPdxx pdxx) {
		this.pdxx = pdxx;
	}

	public String getModIds() {
		return modIds;
	}

	public void setModIds(String modIds) {
		this.modIds = modIds;
	}

	public String getSaveSuccess() {
		return saveSuccess;
	}

	public void setSaveSuccess(String saveSuccess) {
		this.saveSuccess = saveSuccess;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public PdxxVO getPdxxVo() {
		return pdxxVo;
	}

	public void setPdxxVo(PdxxVO pdxxVo) {
		this.pdxxVo = pdxxVo;
	}
}
