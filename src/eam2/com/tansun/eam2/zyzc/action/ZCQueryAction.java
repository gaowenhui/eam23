package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.ucc.ZCQueryUCC;
import com.tansun.eam2.zyzc.ucc.impl.ZCManageBodyUCCImpl;
import com.tansun.eam2.zyzc.ucc.impl.ZCManageHeadUCCImpl;
import com.tansun.eam2.zyzc.ucc.impl.ZCQueryUCCImpl;
import com.tansun.eam2.zyzc.utils.QueryBody4ViewListToJSON;
import com.tansun.eam2.zyzc.vo.ExchangeVO;
import com.tansun.eam2.zyzc.vo.PurchaseGoodsQueryVO;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * ZCQueryAction用来实现对自用资产信息的查询功能和选取功能
 * @author 穆占强
 * @date 2010-11-20
 */
//@Controller
//@Scope("prototype")
public class ZCQueryAction extends CommonAction  implements IExport{
	//自用资产中的单据类型
	private String sheettype = "";
	private String headId;
	private ZyZc zyZc;
	private String zczt;
	private String syzt;
	private QueryPurchaseVo queryPurVo;
	private ExchangeVO exvo;
	private String existBodyIdArr;
	private Paginator paginator;
	private PurchaseGoodsQueryVO pgqv;
	private ZyKctz tz;
	@Autowired
	private ZCQueryUCC zCQueryUCC;
	@Autowired
	private DicAppAssetTypeUCC dicAppAssetTypeUCC;
	@Autowired
	private ZCManageHeadUCC zCManageHeadUCCimpl;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCCimpl;
	
	/**
	 * init 是资产查询界面的入口方法，
	 */
	public String init() {
		// 设置页面状态，直接返回
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		if(queryPurVo==null){
			queryPurVo = new QueryPurchaseVo();
		}
		queryPurVo.setZczt(zczt);
		// step4:结束工作，转到相关页面 ZCQuery.jsp
		if(sheettype != null && sheettype.length() > 0){
			request.setAttribute("sheettype", sheettype);
			request.setAttribute("headId", headId);
			request.setAttribute("existBodyIdArr", existBodyIdArr);
			return sheettype;
		}
		// 卡片新增挂接资产 add by chenyuxiao
		String isForCard = request.getParameter("isForCard");
		request.setAttribute("isForCard", isForCard);
		// 资产处置挂接资产 add by muzhanqiang
		String isForZccz = request.getParameter("isForZccz");
		String cldId = request.getParameter("cldId");
		request.setAttribute("isForZccz", isForZccz);
		request.setAttribute("cldId", cldId);
		//评估审查 added by liubeibei.
		String isForPgsc = request.getParameter("isForPgsc");
		request.setAttribute("isForPgsc", isForPgsc);
		return "init";
	}
	
	/**
	 * 物品续保的查询
	 * @return
	 */
	public String xubaoInit(){
		// 设置页面状态，直接返回
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		if(queryPurVo==null){
			queryPurVo = new QueryPurchaseVo();
		}
		queryPurVo.setZczt(zczt);
		// step4:结束工作，转到相关页面 ZCQuery.jsp
		if(sheettype != null && sheettype.length() > 0){
			request.setAttribute("sheettype", sheettype);
			return "xubaoinit";
		}
		// 卡片新增挂接资产 add by chenyuxiao
		String isForCard = request.getParameter("isForCard");
		request.setAttribute("isForCard", isForCard);
		// 资产处置挂接资产 add by muzhanqiang
		String isForZccz = request.getParameter("isForZccz");
		String cldId = request.getParameter("cldId");
		request.setAttribute("isForZccz", isForZccz);
		request.setAttribute("cldId", cldId);
		return "xubaoinit";
	}
	
	/**
	 * 资产维护界面调用，初始化资产增加页面
	 */
	public String manage(){
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 */
	public String query() {
		// step1:调用后台Service,得到资产对应的列表
		List<ZyZc> zclist = zCQueryUCC.queryZcByVo(queryPurVo);
		// step2:将List对象传递到前台去
		// 将得到的资产信息存入页面的显示的VO中
		List<QueryBody4View> zctzVOList = new ArrayList<QueryBody4View>();
		Iterator<ZyZc> iterater = zclist.iterator();
		while (iterater.hasNext()) {
			ZyZc zyZc = (ZyZc) iterater.next();
			QueryBody4View queryBody = new QueryBody4View();
			BeanUtils.copyProperties(zyZc, queryBody);
			zctzVOList.add(queryBody);
		}
		// 将页面显示的VO转换成JSON串，传送到页面
		String josnStr = QueryBody4ViewListToJSON.getJSON(zctzVOList, 1, 1, 24);
//		System.out.println(josnStr);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查找分类信息
	 */
	public String findFl(){
		String yjflbm = "";
		String ejflbm = "";
		if (queryPurVo != null) {
			yjflbm = queryPurVo.getYjflbm();
			ejflbm = queryPurVo.getEjflbm();
		} else if (zyZc != null) {
			yjflbm = zyZc.getYjflbm();
			ejflbm = zyZc.getEjflbm();
		}
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();

		if (StringUtils.isNotEmpty(yjflbm)) {
			ejMap = dicAppAssetTypeUCC.findEjFl(yjflbm);
			if (StringUtils.isNotEmpty(ejflbm)) {
				sjMap = dicAppAssetTypeUCC.findSjFl(ejflbm);
			}
		}

		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		
		if(sheettype != null && !sheettype.equals("")){
			return sheettype;
		}
		return "init";
	}
	
	/**
	 * 入口，这个入口代表要选择一个经营型固定资产，界面上要显示一个选择按钮
	 */
	public String selectinit() {
		// 设置页面状态，直接返回
		return "selectinit";
	}
	
	//--------------------------------Refactor Start-----------------------------------
	
	public String initZCQueryPage(){
		return sheettype;
	}
	
	/**
	 *一级分类值改变时，根据前台传过来的一级分类编码值到二级分类表中查询MainCode为一级分类编码所有记录名称
	 *并组成json串，传到前台
	 */
  	public String ejflRefresh(){
  		request.getParameter("");
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'ejfls':[");
			Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(zyZc.getYjflbm());
			for(Map.Entry<String, String> entry : ejMap.entrySet()){
				returnStr.append("{'ejflbm':'" + entry.getKey() + "','ejflmc':'" + entry.getValue() + "'},");
			}
			if(ejMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
  	
  	/**
  	 * 查询三级分类中所有二级分类编码为选中的二级分类编码的值
  	 * @return
  	 */
	public String sjflRefresh(){
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'sjfls':[");
			Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(zyZc.getEjflbm());
			for(Map.Entry<String, String> entry : sjMap.entrySet()){
				returnStr.append("{'sjflbm':'" + entry.getKey() + "','sjflmc':'" + entry.getValue() + "'},");
			}
			if(sjMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
  	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * zclistForLY,资产状态为领用的资产List
	 */
	public String queryForZCBodyList() {
		List<ZyZc> zcList = zCQueryUCC.queryZcByVo(queryPurVo);
		if("2,02,借用".contains(queryPurVo.getZczt())){
			queryPurVo.setZczt("3");
			List<ZyZc> zclistForLY = zCQueryUCC.queryZcByVo(queryPurVo);
			for(Iterator<ZyZc> i = zclistForLY.iterator();i.hasNext();){
				zcList.add(i.next());
			}
		}
		displayJSonString(zcList);
		return null;
	}
	
	/**
	 * query 是资产查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * zclistForLY,资产状态为领用的资产List
	 */
	public String queryForZCBodyListAndPager() throws IOException{
		String json = zCQueryUCC.queryExchangeZyzc(exvo,paginator);
//		List<ZyZc> zyZcList = zCManageBodyUCCimpl.queryForZCBodyListAndPager(queryPurVo,paginator,sheettype);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}
	
	public String query4ReborrowAdd(){
		List<ViewVO> ViewVOList = zCQueryUCC.query4ReborrowAdd(queryPurVo,paginator,sheettype);
		displayJSonString(ViewVOList);
		return null;
	}
	
	
	public String queryZcByVoWithPager4BorAndCon() {
		List<ZyZc> zyZcList = zCQueryUCC.queryZcByVoWithPager4BorAndCon(queryPurVo,paginator,sheettype);
		displayJSonString(zyZcList);
		return null;
	}
	
	/**
	 * 到分类表中查询采购物品种类
	 * @return
	 */
	public String query4PurchaseAndPager(){
		List<ZySbody> bodyList = zCQueryUCC.query4PurchaseAndPager(queryPurVo,paginator,sheettype);
		displayJSonString(bodyList);
		return null;
	}
	
	public String query4ConAndBor(){
		List<ZySbody> bodyList = zCQueryUCC.query4ConAndBor(queryPurVo,paginator,sheettype);
		displayJSonString(bodyList);
		return null;
	}
	/**
	 * 到资产表中查询所有在库的物品
	 * @return
	 */
	public String queryZcInStockWithPager(){
		List<ZyZc> zyZcList = zCQueryUCC.queryZcInStockWithPager(queryPurVo,paginator,sheettype);
		displayJSonString(zyZcList);
		return null;
	}
	
	
	/**
	 * 对物品更换单作查询，如果	queryPurVo中的资产状态为“2”（领用）则借用也要执行查询
	 * @return
	 */
	public String queryForGoodsExchange(){
		List<ZyZc> zclist = zCQueryUCC.queryZcByVo(queryPurVo);
		displayJSonString(zclist);
		return null;
	}
	
	/**
	 * 采购物品查询页面调用
	 * @return
	 */
	public String queryForPurchaseGoods(){
		String [] headIds = zCManageHeadUCCimpl.obtainHeadId();
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		List<ZySbody> finalDisplayList = new ArrayList<ZySbody>();
		String HeadIdStrWithWRKGoods = zCManageBodyUCCimpl.obtainHeadIdStrWithWRKGoods();
		for(String headId : headIds){
			if(HeadIdStrWithWRKGoods.contains(headId)){
				bodyList = zCManageBodyUCCimpl.obatainBodyListByVoAndHeadId(queryPurVo,headId);
				if(bodyList != null){
					for(Iterator<ZySbody> i = bodyList.iterator(); i.hasNext();){
						finalDisplayList.add(i.next());
					}
				}
			}
		}
		displayJSonString(finalDisplayList);
		return null;
	}
	
	/**
	 * 入库物品查询
	 * @return
	 */
	public String query4Stock(){
		try{
			List<ZyZc> zyZcList = zCQueryUCC.query4Stock(queryPurVo,paginator);
			displayJSonString(zyZcList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 对资产维护主页面传到后台的条件做查询
	 * @return
	 */
	public String query4ZcManage(){
		String queryCondition = request.getParameter("queryCondition");
		List<ZyZc> zcList = null;
		if("zcQuery4Card".equals(queryCondition)){
			zcList = zCQueryUCC.queryZcByVoWithPager(queryPurVo,paginator,queryCondition);
		}else{
			zcList = zCQueryUCC.queryZcByVoWithPager(queryPurVo,paginator,sheettype);
		}
		displayJSonString(zcList);
		return null;
	}
	
	/**
	 * 报废查询页面调用本方法
	 */
	public String discardQuery(){
		List<ViewVO> vvList = zCQueryUCC.discardQuery(queryPurVo, paginator);
		displayJSonString(vvList);
		return null;
	}
	
	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		String josnStr = null;
		List<ViewVO> vvList = null;
		List<ZyZc> zcList = null;
		if(zCQueryUCC==null){
			zCQueryUCC=(ZCQueryUCC)SpringContextHelper.getBean(ZCQueryUCCImpl.class);
		}
		
		if(zCManageBodyUCCimpl == null){
			zCManageBodyUCCimpl=(ZCManageBodyUCCImpl)SpringContextHelper.getBean(ZCManageBodyUCCImpl.class);
		}
		
		if(zCManageHeadUCCimpl == null){
			zCManageHeadUCCimpl=(ZCManageHeadUCCImpl)SpringContextHelper.getBean(ZCManageHeadUCCImpl.class);
		}
		
		if("discard".equals(queryPurVo.getGhlx())){
			vvList = zCQueryUCC.discardQuery(queryPurVo, paginator);
			josnStr = BodyListToJSON.getJSON(vvList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if("zcManage".equals(queryPurVo.getGhlx())){
			zcList = zCQueryUCC.queryZcByVoWithPager(queryPurVo,paginator,sheettype);
			josnStr = BodyListToJSON.getJSON(zcList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if("goodDeploy".equals(queryPurVo.getGhlx())){
			vvList = zCManageBodyUCCimpl.createViewVOByQueryconditionAndPager(queryPurVo, paginator);
			josnStr = BodyListToJSON.getJSON(vvList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if("goodBorrow".equals(queryPurVo.getGhlx())){
			sheettype = queryPurVo.getZcbh();
			vvList = zCQueryUCC.borrowOrConsumQuery(queryPurVo,sheettype,paginator);
			josnStr = BodyListToJSON.getJSON(vvList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if("stockGoodExcelExport".equals(queryPurVo.getGhlx())){
			zcList = zCQueryUCC.query4Stock(queryPurVo,paginator);
			josnStr = BodyListToJSON.getJSON(zcList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if("purchaseGoodExcelExport".equals(queryPurVo.getGhlx())){
			String [] headIds = zCManageHeadUCCimpl.obtainHeadId();
			List<ZySbody> bodyList = new ArrayList<ZySbody>();
			List<ZySbody> finalDisplayList = new ArrayList<ZySbody>();
			String HeadIdStrWithWRKGoods = zCManageBodyUCCimpl.obtainHeadIdStrWithWRKGoods();
			for(String headId : headIds){
				if(HeadIdStrWithWRKGoods.contains(headId)){
					bodyList = zCManageBodyUCCimpl.obatainBodyListByVoAndHeadId(queryPurVo,headId);
					if(bodyList != null){
						for(Iterator<ZySbody> i = bodyList.iterator(); i.hasNext();){
							finalDisplayList.add(i.next());
						}
					}
				}
			}
			josnStr = BodyListToJSON.getJSON(finalDisplayList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		return josnStr;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryPurVo = (QueryPurchaseVo)excelVO;
	}
	
	/**
	 * excel勾选导出
	 * @return
	 */
	public String discardQueryExcel(){
		String ids = request.getParameter("idStr");
		List<ViewVO> vvList = zCQueryUCC.discardQueryExcel(ids);
		String josnStr = BodyListToJSON.getJSON(vvList, 1,1,100000);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 领借用查询页面调用本方法
	 */
	public String borrowOrConsumQuery(){
		sheettype = request.getParameter("sheettype");
		List<ViewVO> vvList = zCQueryUCC.borrowOrConsumQuery(queryPurVo,sheettype,paginator);
		displayJSonString(vvList);
		return null;
	}
	
	
	/**
	 * 对物品维修查询页面的查询
	 * @return
	 */
	public String query4GoodDeploy(){
		List<ViewVO> vvList = zCManageBodyUCCimpl.createViewVOByQueryconditionAndPager(queryPurVo, paginator);
		displayJSonString(vvList);
		return null;
	}
	
	/**
	 * 资产维护界面点击增加按钮弹出界面，填写信息完成后，点击保存按钮把资产保存到资产表中
	 * 并返回添加后的资产Id,需要添加资产编号
	 * @return
	 */
	public String saveZcInfoToZyZc(){
		String isSaveSuccess ="";
		try{
//			StringBuffer zcIdBuf = new StringBuffer(); 
			String yjflmc = dicAppAssetTypeUCC.findYjFlMC(zyZc.getYjflbm());
			String ejflmc = dicAppAssetTypeUCC.findEjFlMC(zyZc.getEjflbm());
			String sjflmc = dicAppAssetTypeUCC.findSjFlMC(zyZc.getSjflbm());
			if("计算机类易耗品".equals(sjflmc) || "非计算机类易耗品".equals(sjflmc)){
				
			}
			for(int i = 0; i < zyZc.getSl(); i++){
				zyZc.setYjflmc(yjflmc);
				zyZc.setEjflmc(ejflmc);
				zyZc.setSjflmc(sjflmc);
				zyZc.setZczt("1");
				zCQueryUCC.saveZyZc(zyZc);
//				zcIdBuf.append(zyZc.getZcId() + ",");
			}
			isSaveSuccess = "success";
//			request.setAttribute("zcId", zcIdBuf.toString());
		}catch(Exception e){
			isSaveSuccess = "failure";
			e.printStackTrace();
		}finally{
			request.setAttribute("isSaveSuccess",isSaveSuccess);
		}

		return "returnZcManagePage";
	}
	
	/**
	 * 显示通过资产维护界面的增加按钮添加的物品
	 * @return
	 */
	public String displayAddGoods(){
		List<ZyZc> zyZcList = new ArrayList<ZyZc>();
		String zcId = request.getParameter("zcId");
//		String allIds = request.getParameter("allIds");
//		if(StringUtils.isNotEmpty(allIds)){
//			zcId += allIds;
//		}
		String [] IdArray = zcId.split(",");
		for(String id : IdArray){
			if(StringUtils.isNotEmpty(id)){
				zyZcList.add(zCQueryUCC.getZyzcByZcId(id));
			}
		}
		displayJSonString(zyZcList);
		return null;
	}
	
	/**
	 * 更新资产表的信息
	 * @return
	 */
	public String updateZcInfoToZyZc(){
		String zcId = request.getParameter("zcId");
		ZyZc zyZcFromTable = zCQueryUCC.getZyzcByZcId(zcId);
		String yjflmc = dicAppAssetTypeUCC.findYjFlMC(zyZc.getYjflbm());
		String ejflmc = dicAppAssetTypeUCC.findEjFlMC(zyZc.getEjflbm());
		String sjflmc = dicAppAssetTypeUCC.findSjFlMC(zyZc.getSjflbm());
		zyZcFromTable.setYjflbm(zyZc.getYjflbm());zyZcFromTable.setEjflbm(zyZc.getEjflbm());
		zyZcFromTable.setSjflbm(zyZc.getSjflbm());zyZcFromTable.setYjflmc(yjflmc);
		zyZcFromTable.setEjflmc(ejflmc);zyZcFromTable.setSjflmc(sjflmc);
		zyZcFromTable.setZcmc(zyZc.getZcmc()!=null?zyZc.getZcmc():null);
		zyZcFromTable.setGg(zyZc.getGg()!=null?zyZc.getGg():null);
		zyZcFromTable.setSl(zyZc.getSl()!=null?zyZc.getSl():null);
		zyZcFromTable.setJldw(zyZc.getJldw()!=null?zyZc.getJldw():null);
		zyZcFromTable.setBgdd(zyZc.getBgdd()!=null?zyZc.getBgdd():null);
		zyZcFromTable.setZtwz(zyZc.getZtwz()!=null?zyZc.getZtwz():null);
		zyZcFromTable.setDzyhdj(zyZc.getDzyhdj()!=null?zyZc.getDzyhdj():null);
		zyZcFromTable.setDzyhjg(zyZc.getDzyhjg()!=null?zyZc.getDzyhjg():null);
		zyZcFromTable.setFdjbh(zyZc.getFdjbh()!=null?zyZc.getFdjbh():null);
		zyZcFromTable.setCbrq(zyZc.getCbrq()!=null?zyZc.getCbrq():null);
		zyZcFromTable.setCpuxh(zyZc.getCpuxh()!=null?zyZc.getCpuxh():null);
		zyZcFromTable.setMemory(zyZc.getMemory()!=null?zyZc.getMemory():null);
		zyZcFromTable.setNzdisk(zyZc.getNzdisk()!=null?zyZc.getNzdisk():null);
		zyZcFromTable.setDisk(zyZc.getDisk()!=null?zyZc.getDisk():null);
		zyZcFromTable.setXtxsq(zyZc.getXtxsq()!=null?zyZc.getXtxsq():null);
		zyZcFromTable.setSszg(zyZc.getSszg()!=null?zyZc.getSszg():null);
		zyZcFromTable.setBz(zyZc.getBz()!=null?zyZc.getBz():null);
		zCQueryUCC.updateZyZc(zyZcFromTable);
		request.setAttribute("isSaveSuccess", "success");
		return "modGoodDetailPage";
	}
	
	/**
	 * 查看物品详细信息
	 * @return
	 */
	public String viewGoodDetail(){
		String zcId = request.getParameter("zcId");
		zyZc = zCQueryUCC.getZyzcByZcId(zcId);
		ZyKctz tzFromTzTable = zCQueryUCC.findTZById(zcId);
		ZyKctz tempTz = new ZyKctz();
		BeanUtils.copyProperties(tzFromTzTable, tempTz);
		if(!"是".equals(tempTz.getSfxj())){
			tempTz.setSfxj("否");
		}
		tz = tempTz;
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(zyZc.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(zyZc.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return "viewGoodDetailPage";
	}
	
	/**
	 * 修改物品详细信息
	 * @return
	 */
	public String modGoodDetail(){
		String zcId = request.getParameter("zcId");
		zyZc = zCQueryUCC.getZyzcByZcId(zcId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(zyZc.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(zyZc.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return "modGoodDetailPage";
	}
	
	/**
	 * 修改物品的详细信息
	 * @return
	 */
	public String modifyGoodDetail(){
		String zcId = request.getParameter("zcId");
		zyZc = zCQueryUCC.getZyzcByZcId(zcId);
		ZyKctz tzFromTzTable = zCQueryUCC.findTZById(zcId);
		ZyKctz tempTz = new ZyKctz();
		BeanUtils.copyProperties(tzFromTzTable, tempTz);
		if(!"是".equals(tempTz.getSfxj())){
			tempTz.setSfxj("否");
		}
		tz = tempTz;
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(zyZc.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(zyZc.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return "modifyGoodDetail";
	}
	
	/**
	 * 传进去一个List，转换成JSON字符串并显示
	 * @param <T>
	 * @param VOList
	 * @return
	 */
	private <T> String displayJSonString(List VOList){
		String josnStr = "";
		if(VOList != null){
			josnStr = BodyListToJSON.getJSON(VOList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 显示拼装好的JSON字符串
	 * @param JSONString
	 */
	private void displayJSonString(String JSONString){
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(JSONString);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 资产维护的修改功能
	 * @return
	 * @throws IOException 
	 */
	public String updZCAndsaveTZ() throws IOException{
		String zcId = request.getParameter("zcId");
		ZyZc zc = new ZyZc();
		ZyKctz kc = new ZyKctz();
		zc = zCQueryUCC.getZyzcByZcId(zcId);
		kc = zCQueryUCC.findTZById(zcId);
		zc.setYjflbm(zyZc.getYjflbm());
		zc.setEjflbm(zyZc.getEjflbm());
		zc.setSjflbm(zyZc.getSjflbm());
		zc.setZcmc(zyZc.getZcmc());
		zc.setGg(zyZc.getGg());
		zc.setZczt(zyZc.getZczt());
		zc.setJldw(zyZc.getJldw());
		zc.setSl(zyZc.getSl());
		zc.setDzyhdj(zyZc.getDzyhdj());
		zc.setDzyhjg(zyZc.getDzyhjg());
		zc.setFdjbh(zyZc.getFdjbh());
		zc.setCpuxh(zyZc.getCpuxh());
		zc.setMemory(zyZc.getMemory());
		zc.setDisk(zyZc.getDisk());
		zc.setNzdisk(zyZc.getNzdisk());
		zc.setXtxsq(zyZc.getXtxsq());
		zc.setSszg(zyZc.getSszg());
		zc.setCbrq(zyZc.getCbrq());
		zCQueryUCC.updateZyZc(zc);
		if(kc!=null){
			String kcId = kc.getKctzId();
			zCQueryUCC.updateTZ(kcId);
		}
		tz.getCksl();
		tz.setZcId(zyZc.getZcId());
		tz.setSfzxjl(1L);
		zCQueryUCC.saveTZ(tz);
		return "modifyGoodDetail";
	}
	
	/**
	 * 续保的查询
	 * @return
	 */
	public String query4xubao(){
		List<ZyZc> zcList = zCQueryUCC.query4xubao(queryPurVo,paginator,sheettype);
		displayJSonString(zcList);
		return null;
	}
	
	//--------------------------------Refactor End-----------------------------------

	public ZyZc getZyZc() {
		return zyZc;
	}

	public void setZyZc(ZyZc zyZc) {
		this.zyZc = zyZc;
	}

	public ZCQueryUCC getZCQueryUCC() {
		return zCQueryUCC;
	}

	public void setZCQueryUCC(ZCQueryUCC queryUCC) {
		zCQueryUCC = queryUCC;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public QueryPurchaseVo getQueryPurVo() {
		return queryPurVo;
	}

	public void setQueryPurVo(QueryPurchaseVo queryPurVo) {
		this.queryPurVo = queryPurVo;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public PurchaseGoodsQueryVO getPgqv() {
		return pgqv;
	}

	public void setPgqv(PurchaseGoodsQueryVO pgqv) {
		this.pgqv = pgqv;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getSyzt() {
		return syzt;
	}

	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}

	public ZyKctz getTz() {
		return tz;
	}

	public void setTz(ZyKctz tz) {
		this.tz = tz;
	}

	public String getExistBodyIdArr() {
		return existBodyIdArr;
	}

	public void setExistBodyIdArr(String existBodyIdArr) {
		this.existBodyIdArr = existBodyIdArr;
	}

	public ExchangeVO getExvo() {
		return exvo;
	}

	public void setExvo(ExchangeVO exvo) {
		this.exvo = exvo;
	}
	
}
