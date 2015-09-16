package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.ucc.ZCQueryUCC;
import com.tansun.eam2.zyzc.ucc.impl.ZCManageBodyUCCImpl;
import com.tansun.eam2.zyzc.utils.QueryBody4ViewListToJSON;
import com.tansun.eam2.zyzc.utils.UpdateZySbody;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.TokenVO;
import com.tansun.eam2.zyzc.vo.ViewVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * ZCDetailAction用来实现对自用资产信息的查询功能和选取功能
 * @author 穆占强
 * @date 2010-11-20
 */
//@Controller
//@Scope("prototype")
public class ZCManageBodyAction extends CommonAction  implements IExport{
	private ZySbody body;
	private ZyShead head;
	private ZyZc zyZc;
	// 自用资产中的单据类型
	private String sheettype = "";
	// 表体ID
	private String bodyId = "";
	
	// 采购单中选中的表体ID
	private String bodyIds = "";
	// 自用资产中的表单id
	private String headId = "";
	// 要修改的bodyID
	private String delBodyIds = "";
	private String saveSuccess = "";
	//使用状态
	private String syzt = "";
	private QueryPurchaseVo queryPurVo;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCC;
	@Autowired
	private DicAppAssetTypeUCC dicAppAssetTypeUCC;
	@Autowired
	private ZCManageHeadUCC zCManageHeadUCCimpl;
	@Autowired
	private ZCQueryUCC zCQueryUCCimpl;
	@Autowired
	private ToCheckUCC toCheckUCCimpl;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	private Paginator paginator;
	private String allHeadIds;
	private ViewVO vv;
	private TokenVO tvo;
	//生成卡片的资产的SbodyId
	private String cardId;
	private ZyPdxx pdxx;
	

	/**
	 * 不做其他操作,根据sheettyepe,分别转到不同的JSP表页面
	 */
	public String addBody() {
		// 得到资产的分类信息，传到页面显示
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}

	/**
	 * 保存数据，后台插入或更新
	 */
	public String saveBody() {
		// 将当前的表单ID放入表体中
		body.setSheadId(request.getParameter("headId"));
		// 获得当前表单的分类信息
		String yjflmc = "";
		String ejflmc = "";
		String sjflmc = "";
		if (body.getYjflbm() != null && body.getYjflbm().length() > 0
				&& body.getYjflbm().compareTo("0") > 0) {
			yjflmc = dicAppAssetTypeUCC.findDic1(body.getYjflbm()).getTypename();
		}
		if (body.getEjflbm() != null && body.getEjflbm().length() > 0
				&& body.getEjflbm().compareTo("0") > 0) {
			ejflmc = dicAppAssetTypeUCC.findDic2(body.getEjflbm()).getTypename();
		}
		if (body.getSjflbm() != null && body.getSjflbm().length() > 0
				&& body.getSjflbm().compareTo("0") > 0) {
			sjflmc = dicAppAssetTypeUCC.findDic3(body.getSjflbm()).getTypename();
		}
		body.setYjflmc(yjflmc);
		body.setEjflmc(ejflmc);
		body.setSjflmc(sjflmc);

		// 保存表体信息
		zCManageBodyUCC.saveBody(body);
		request.setAttribute("savebody", "success");
		return sheettype;
	}

	/**
	 * 保存选中的资产信息和表头信息至表体
	 */
	public String saveZcToBody() {
		String[] zcID = bodyIds.trim().split(",");
		headId = request.getParameter("headId");
		zCManageBodyUCC.saveZcToBody(zcID, headId);
		request.setAttribute("savebody", "success");
		return sheettype;
	}

	/**
	 * 从后台检索数据，刷新界面显示 根据sheettyepe,分别转到不同的JSP表页面
	 */
	public String modifyBody() {
		// 检索出相应的表体
		String sbodyId = request.getParameter("bodyId");
		body = zCManageBodyUCC.modifyBody(sbodyId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(body.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(body.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}

	/**
	 * 从后台检索数据，刷新界面显示。 但处于只读状态，不可修改
	 */
	public String viewBody() {
		// 检索出相应的表体
		String sbodyId = request.getParameter("bodyId");
		body = zCManageBodyUCC.modifyBody(sbodyId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(body.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(body.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		body = zCManageBodyUCC.viewBody(sbodyId);

		return sheettype;
	}

	/**
	 * 初始化采购物品查询页面
	 */
	public String initQurey() {
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return sheettype;
	}

	/**
	 * 资产查询分类的联动
	 */
	public String findFl() {
		String yjflbm = "";
		String ejflbm = "";
		if (queryPurVo != null) {
			yjflbm = queryPurVo.getYjflbm();
			ejflbm = queryPurVo.getEjflbm();
		} else if (body != null) {
			yjflbm = body.getYjflbm();
			ejflbm = body.getEjflbm();
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
		return sheettype;
	}

	/**
	 * 查询采购单物品
	 */
	public String queryBody() {
		List<ZySbody> bodyList = zCManageBodyUCC.queryBodyByVo(queryPurVo, "purchase");
		// 将得到的表体信息存入页面的显示的VO中
		List<QueryBody4View> zctzVOList = new ArrayList<QueryBody4View>();
		Iterator<ZySbody> iterater = bodyList.iterator();
		while (iterater.hasNext()) {
			ZySbody zySbody = (ZySbody) iterater.next();
			QueryBody4View queryBody = new QueryBody4View();
			BeanUtils.copyProperties(zySbody, queryBody);
			zctzVOList.add(queryBody);
		}
		// 将页面显示的VO转换成JSON串，传送到页面
		String josnStr = QueryBody4ViewListToJSON.getJSON(zctzVOList, 1, 1, 24);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将选中的采购表体数据存放入入库单中
	 */
	public String saveBodyToBody() {
		String[] bids = bodyIds.split(",");
		zCManageBodyUCC.saveBodyToBody(bids, headId);
		request.setAttribute("savebody", "success");
		return sheettype;
	}
	
	//--------------------------------Refactor Start---------------------------------
	/**
	 * 供在采购中增加其他资产使用,只增加到body表中，除了在页面中所填的信息外，
	 * 在这里再补充填入到body表中一些字段，不保存到资产表中
	 */
	public String saveOtherGoodToBody() {
		String yjflmc ="";
		String ejflmc ="";
		String sjflmc ="";
		if (StringUtils.isNotEmpty(body.getYjflbm())&& body.getYjflbm().compareTo("0") > 0) {
			 yjflmc = dicAppAssetTypeUCC.findDic1(body.getYjflbm()).getTypename();
		}
		if (StringUtils.isNotEmpty(body.getEjflbm())&& body.getEjflbm().compareTo("0") > 0) {
			ejflmc = dicAppAssetTypeUCC.findDic2(body.getEjflbm()).getTypename();
		}
		if (StringUtils.isNotEmpty(body.getSjflbm())&& body.getSjflbm().compareTo("0") > 0) {
			sjflmc = dicAppAssetTypeUCC.findDic3(body.getSjflbm()).getTypename();
		}
		body.setSheadId(headId);
		body.setYjflmc(yjflmc);
		body.setEjflmc(ejflmc);
		body.setSjflmc(sjflmc);
		if("addOtherGoods".equals(sheettype)){
			body.setWrksl(body.getSl().longValue());
		}
//		ZySbody body4Save = body;
//		for(int i = 0; i < body.getSl().intValue(); i++){
//			body4Save.setSl(1D);
//			zCManageBodyUCC.saveBody(body4Save);
//		}
		if(body!=null&&body.getSszg()!=null){
			if(body.getSszg().startsWith(",")){
				body.setSszg(body.getSszg().substring(1));
			}
		}
		zCManageBodyUCC.saveBody(body);
		saveSuccess = "saveSuccess";
		return sheettype;
	}
	
	/**
	 * 根据SbodyId到body表中查找该资产的一级分类名称，供入库申请增加卡片时使用，如果一级分类名称时固定资产，
	 * 返回success（可以生成卡片），否则，返回failure（不可以生成卡片）
	 * @return
	 * @throws IOException 
	 */
	public String getYjflmcBySbodyId() throws IOException{
		String sbodyId = request.getParameter("sbodyId");
		ZySbody zySbody = zCManageBodyUCC.findBody(sbodyId);
		response.setCharacterEncoding("UTF-8");
		if(zySbody.getYjflmc().contains("固定资产")){
			response.getWriter().print("success");
		}else{
			response.getWriter().print("failure");
		}
		return null;
	}
	
	/**
	 * 根据选择的采购单Id到body表中查询出未入库的物品，复制一份到body表中，同时复制的记录的
	 * shead_Id字段设置为stockId，保证各个环节jqgrid都能取得该值
	 * @return
	 */
	public String copyBodyListToBody(){
		String headIds = request.getParameter("headIds");
		String stockId = request.getParameter("stockId");
		String cgBodyIds = request.getParameter("cgBodyIds");
		String[] headIdArray = headIds.split(",");
//		String [] tempCgBodyIdArr = cgBodyIds.split(",");
//		String [] finalCgBodyIdArr = null;
//		String finalCgBodyIdArrStr = "";
//		StringBuffer cgdBodyIdStrBuf = new StringBuffer();
//		for(String tempCgdBodyId : tempCgBodyIdArr){
//			if(!finalCgBodyIdArrStr.contains(tempCgdBodyId)){
//				cgdBodyIdStrBuf.append(tempCgdBodyId + ",");
//			}
//		}
//		cgBodyIds = cgdBodyIdStrBuf.toString();
//		finalCgBodyIdArr = cgBodyIds.split(",");
		zCManageBodyUCC.copyBodyListToBody(stockId, headIdArray,cgBodyIds);
		return null;
	}
	
	/**
	 * 根据资产Id到资产表中查询出数据，并加上headId存到body表中,验证Id是否为空在ZCManageBodyBSImpl中
	 */
	public String saveZcListToBody() {
		String [] ids = delBodyIds.split(",");
		String unionIds = request.getParameter("unionIds");
		String [] unionIdArr = null;
		if(StringUtils.isNotEmpty(unionIds)){
			unionIds = unionIds.replaceAll(",", "");
			unionIdArr = unionIds.split("aa");
		}
		
		int sl = 1;
//		if(StringUtils.isNotEmpty(request.getParameter("sl"))){
//			sl = Integer.parseInt(request.getParameter("sl"));
//		}
		String [] headIdArr = {head.getSheadId()};
		String beforeBodyId = request.getParameter("beforeBodyId");
		String dic3_id = request.getParameter("dic3_id");
		String pdpc = request.getParameter("pdpc");
		if("purchase".equals(sheettype)){
			//采购的时候查询出资产表中的数据中的一些数据到body表中，不需要全部拷到body表中
			zCManageBodyUCC.saveZcFieldToBody(ids, head.getSheadId());
		}else if("purchase_list".equals(sheettype)){
			zCManageBodyUCC.saveZcInfoFromDicTableToBody(dic3_id,head.getSheadId());
		}else if("goodchange".equals(sheettype)){
			if(StringUtils.isNotEmpty(beforeBodyId)){
				zCManageBodyUCC.saveZcToBody(ids,headIdArr,syzt,beforeBodyId);
			}else{
				zCManageBodyUCC.saveZcToBody(ids, headIdArr, syzt);
			}
//			zCManageBodyUCC.saveZcToBody(ids,headId);
		}else if("reborrow".equals(sheettype)){
			zCManageBodyUCC.saveZcToBody(ids,headIdArr);
		}else if(sheettype.contains("borrow")||sheettype.contains("comsuming")){
			String [] ngrInfo = new String [5];
			ngrInfo[0] = request.getParameter("sqrmc");
			ngrInfo[1] = request.getParameter("sqrid");
			ngrInfo[2] = request.getParameter("sqbmmc");
			ngrInfo[3] = request.getParameter("sqbmid");
			ngrInfo[4] = request.getParameter("jylyrq");
			zCManageBodyUCC.saveZcToBody(unionIdArr, head.getSheadId(),ngrInfo,sl);
		}else if("tostock".equals(sheettype)){
			zCManageBodyUCC.updateStockGoodsBody(ids, head.getSheadId());
		}else if("tocheckstockadd".equals(sheettype) || "tocheckObjectadd".equals(sheettype)){
			zCManageBodyUCC.saveZcInfoFromDicTableToPdxx(dic3_id,head.getSheadId(),pdpc);
		}else{
			zCManageBodyUCC.saveZcToBody(ids, head.getSheadId());
		}
		return null;
	}
	
	public String getAlreadyXJDataIdStr(){
		String dataIds = request.getParameter("dataIds");
		String [] dataIdArr = dataIds.split(",");
		StringBuffer sb = new StringBuffer();
		for(String dataId : dataIdArr){
			if(StringUtils.isNotEmpty(dataId)){
				ZySbody body = zCManageBodyUCC.findBody(dataId);
				if(zCManageBodyUCC.isZCSfxj(body.getZcId())){
					sb.append(dataId);
					sb.append(">#,#<");
				}
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 当个人领用、借用点击保存按钮时，调用本方法，更新个人领用借用表单的状态为进行中
	 * @return
	 */
	public String updateZySheadBDZT(){
		String isSubmitSuccess = "";
		try{
			ZyShead Head4Update = zCManageHeadUCCimpl.readHead(headId);
			Head4Update.setBdzt("进行中");
			zCManageHeadUCCimpl.updateHead(Head4Update);
			isSubmitSuccess = "ok";
			
			List<ZySbody> personalList = zCManageBodyUCC.readBodyByHeadID(headId);
			for(ZySbody body : personalList){
				int wrksl = (body.getWrksl()).intValue();
				String [] ignoreProperties = {"sbodyId"};
				if(body.getYjflmc().contains("固定资产")){
					while(wrksl > 0){
						ZySbody tempBody = new ZySbody();
						BeanUtils.copyProperties(body, tempBody, ignoreProperties);
						tempBody.setSheadId(headId);
						tempBody.setZcbh("");
						tempBody.setWrksl(1L);
						tempBody.setSl(1D);
						tempBody.setJe(body.getDj());
						tempBody.setGrsqdbodyid(body.getSbodyId());
						tempBody.setTxmbh("");
						zCManageBodyUCC.saveBody(tempBody);
						wrksl--;
					}
				}else if(body.getYjflmc().contains("易耗品")|| 
						body.getYjflmc().contains("低值品")){
					ZySbody tempBody = new ZySbody();
					BeanUtils.copyProperties(body, tempBody, ignoreProperties);
					tempBody.setSheadId(headId);
					tempBody.setGrsqdbodyid(body.getSbodyId());
					zCManageBodyUCC.saveBody(tempBody);
				}
//				String [] bodyIds = new String[1];
//				zCManageBodyUCC.deleteBody(bodyIds);asdf
			}
		}catch(Exception e){
			e.printStackTrace();
			isSubmitSuccess = "error";
		}finally{
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(isSubmitSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return null;
	}
	
	/**
	 * 根据客户端传过来的allHeadIds是否为空，执行不同的查询，处理单中所有的jqgrid显示都要调用这个方法
	 * 如果allHeadIds为空，则只根据该表单Id执行查询,allHeadIds主要时针对采购物品入库的情况
	 * 如果allHeadIds不为空，则根据该表单Id和传过来的Id执行所有查询
	 * @deprecated
	 */
	public String displayBodyListWithHeadId(){
		List<ZySbody> bodyListForStock = new ArrayList<ZySbody>();
		if(StringUtils.isEmpty(allHeadIds)){
			bodyListForStock = zCManageBodyUCC.readBodyByHeadID(head.getSheadId());
		}else if(StringUtils.isNotEmpty(allHeadIds)){
			allHeadIds = allHeadIds + "," +head.getSheadId();
			String [] headIds =  allHeadIds.split(",");
			List<ZySbody> tempList = null;
			try{
				for(String headId : headIds){
					if(StringUtils.isNotEmpty(headId)){
						tempList = zCManageBodyUCC.readBodyByHeadID(headId);
						for(ZySbody body : tempList){
							if(body != null){
								bodyListForStock.add(body);
							}
						}
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}	
		}
//		String josnStr = GetJsonString.getJsonString(bodyListForStock);
		String josnStr = BodyListToJSON.getJSON(bodyListForStock, 1, 1, 1000000);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据客户端传过来的allHeadIds是否为空，执行不同的查询，处理单中所有的jqgrid显示都要调用这个方法
	 * 如果allHeadIds为空，则只根据该表单Id执行查询
	 * 如果allHeadIds不为空，则根据该表单Id和传过来的Id执行所有查询
	 */
	public String displayBodyListWithHeadIdAndPager(){
		PageableList pageableList;
		List<ZySbody> bodyListForStock = new ArrayList<ZySbody>();
		String josnStr = null;
		if(StringUtils.isEmpty(allHeadIds)){
			if("goodchange".equals(sheettype)){
				pageableList = zCManageBodyUCC.readBodyByHeadIDAndPager(head.getSheadId(), paginator, syzt);
//				pageableList = zCManageBodyUCC.readBodyByHeadIDAndPager(head.getSheadId(), paginator);
			}else if("tostock".equals(sheettype)){
				pageableList = zCManageBodyUCC.readWithoutZcIdBodyByHeadIDAndPager(head.getSheadId(),paginator);
				List<ZySbody> tempList = (List<ZySbody>)pageableList.getResults();
				Map<String, ZySbody> map = new HashMap<String, ZySbody>();
				for(ZySbody body : tempList){
					if(body != null){
						if(body != null){
							String key = body.getJldw() + body.getSjflmc();
							//如果key存在，数量进行累加
							if(map.containsKey(key)){
								double count = map.get(key).getSl() + body.getSl();
								if(body.getJe() != null && map.get(key).getJe() != null){
									double totalMon = map.get(key).getJe() + body.getJe();
									body.setTotalJe(totalMon);
								}
								body.setTotalSl(count);
								map.put(key, body);
							} else {//如果key不存在，放进初始值
								//设置汇总数量和汇总金额
								body.setTotalSl(body.getSl());
								body.setTotalJe(body.getJe());
								map.put(key, body);
							}
						}
						
					}
				}				
				//把map中所有的value放进集合中
				bodyListForStock.addAll(map.values());
				pageableList.setResults(bodyListForStock);
			}else{
				pageableList = zCManageBodyUCC.readBodyByHeadIDAndPager(head.getSheadId(),paginator);
			}
			josnStr = BodyListToJSON.getJSON(pageableList.getResults(), paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}else if(StringUtils.isNotEmpty(allHeadIds)){
			allHeadIds = allHeadIds + "," +head.getSheadId();
			String [] headIds =  allHeadIds.split(",");
			try{
				for(String headId : headIds){
					if(StringUtils.isNotEmpty(headId)){
						pageableList = zCManageBodyUCC.readBodyByHeadIDAndPager(headId,paginator);
						List<ZySbody> tempList = (List<ZySbody>)pageableList.getResults();
						for(ZySbody body : tempList){
							if(body != null){
								bodyListForStock.add(body);
							}
						}
					}
				}
				josnStr = BodyListToJSON.getJSON(bodyListForStock, paginator.getPageCount(), 
						paginator.getCurrentPage(), paginator.getCount());
			}catch(Exception e){
				e.printStackTrace();
			}	
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
	 * 根据客户端传过来的表单ID到后台查询数据显示在页面上
	 * @return
	 */
	public String displayByheadIds(){
		String [] headIds = allHeadIds.split(",");
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		List<ZySbody> finalBodyList = new ArrayList<ZySbody>();
		for(String headId : headIds){
			if(StringUtils.isNotEmpty(headId)){
				//用更好的方法只查出该未入库的物品
				bodyList = zCManageBodyUCC.readBodyByHeadID(headId);
			}
			for(ZySbody body : bodyList){
				if(body.getWrksl() != 0){
					finalBodyList.add(body);
				}
			}
		}
		String jsonStr = BodyListToJSON.getJSON(finalBodyList, 1, 1, 1);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 个人领用借用初始化
	 * @return
	 */
	public String initPersonalConsumingOrBorrow(){
//		String ngbmbh = request.getParameter("ngbmbh");
//		String sheettype = request.getParameter("sheettype");
//		request.setAttribute("ngbmbh", ngbmbh);
		//request.setAttribute("sheettype", sheettype);
		if(sheettype.contains("comsuming")){
			return "personalComsumingPage";
		}else{
			return "personBorrowPage";
		}
		
	}
	
	/**
	 * 在部门领用或借用申请表单页面点击增加个人到后台查询相关数据
	 * @return
	 */
	public String displayPersonalConsumingOrBorrow(){
		String ngbmbh = request.getParameter("ngbmbh");
		String grsqdBodyId = request.getParameter("grsqdBodyId");
		try{
			List<ZySbody> personalList = zCManageHeadUCCimpl.getBodyByDeptWithoutGRSQDBodyId(sheettype,ngbmbh,paginator);
			for(int i = personalList.size()-1; i >= 0; i--){
				if(StringUtils.isNotEmpty(grsqdBodyId) && 
						!"null".equals(grsqdBodyId) &&
						grsqdBodyId.contains(personalList.get(i).getSbodyId())){
					personalList.remove(i);
				}
			}
			displayJSonString(personalList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 当借用物品时，在前台资产为低值易耗品是的一条数据表示的数量不是1，但是存储到数据库中的数量是一条数据
	 * 一条记录，不论这条数据是不是低值易耗品，因此当资产是低值易耗品且其数量不是一的时候向后台存储的时候
	 * 需要将其分开
	 * @return
	 */
	public String splitZc4ConAndBor(){
		String splitSuccess = "";
		try{
			String sl = request.getParameter("sl");
			String bodyId = request.getParameter("bodyId");
			String jydqrq = request.getParameter("jydqrq");
			String jyts = request.getParameter("jyts");
			splitSuccess = "ok";
			zCManageBodyUCC.splitZc4ConAndBor(bodyId,sl,jydqrq,jyts);
		}catch(Exception e){
			splitSuccess = "failure";
			e.printStackTrace();
		}finally{
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(splitSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 根据资产ID查询其各级分类编码，然后按规则生成一个资产编号
	 * @return
	 */
	public String gernerZcIdByZcbh(){
		String zcbh = request.getParameter("zcbh");
		String bodyId = request.getParameter("bodyId");
		String isGerneSuccess = "Yes";
		if(zcbh == null || zcbh == "0"){
			return null;
		}else{
			try{
				zCManageBodyUCC.gernerZcIdByZcbh(bodyId,zcbh);
				isGerneSuccess = "Yes";
			}catch(Exception e){
				isGerneSuccess = "No";
				e.printStackTrace();
			}finally{
				response.setCharacterEncoding("UTF-8");
				try {
					response.getWriter().print(isGerneSuccess);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 领用借用时如果是固定资产，需要在账管处理环节为其指定一个资产编号，
	 * 这里根据传到后台的分类编码到数据库中查询所有在库物品的资产编号
	 * 组成TreeMap传到JSP页面
	 * @return
	 */
	public String generZcbhTreeMap(){
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		String sjflbm = request.getParameter("sjflbm");
		String zcbhExitThisPage = request.getParameter("zcbhExitThisPage");
		String [] flbm = {yjflbm,ejflbm,sjflbm,};
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'ejfls':[");
			TreeMap<String,String> zcbhMap = zCManageBodyUCC.getZcbhInStock(flbm,zcbhExitThisPage);
			for(Map.Entry<String, String> entry : zcbhMap.entrySet()){
				returnStr.append("{'zcbhKey':'" + entry.getKey() + "','zcbhValue':'" + entry.getValue() + "'},");
			}
			if(zcbhMap.size() != 0){
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
	 * 把个人申请拷贝一份到body表中
	 * @return
	 */
	public String copyPersonalApplyToBody(){
		String bodyIds = request.getParameter("bodyIds");
		String headId = request.getParameter("headId");
		zCManageBodyUCC.copyPersonalBodyToDeptBody(bodyIds,headId);
//		List<ZySbody> personalList = zCManageHeadUCCimpl.getBodyByDept(sheettype,head.getNgbmbh());
//		try{
//			for(int i = 0;i < personalList.size(); i++){
//				if(StringUtils.isEmpty(personalList.get(i).getGrsqdbodyid())){
//					personalList.remove(personalList.remove(i));
//				}
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//		String [] ignoreProperties = {"sbodyId"};
//		for(ZySbody body : personalList){
//			ZySbody tempBody = new ZySbody();
//			BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//			tempBody.setSheadId(head.getSheadId());
//			zCManageBodyUCC.saveBody(tempBody);
//		}
		return null;
	}
	
	/**
	 * 得到当前表单下的当前部门内表体信息 适用于领用，借用
	 */
	public String displayBodyListForBorrowOrConsuming() {
//		try{
//			for(ZySbody body : personalList){
//				int wrksl = (body.getWrksl()).intValue();
//				String [] ignoreProperties = {"sbodyId"};
//				if(zCManageBodyUCC.obtainCopyRecordNum(body.getSbodyId()) < 
//						body.getWrksl().intValue()){
//					
//					adsfad
//					
//					if(body.getYjflmc().contains("固定资产") || body.getYjflmc().contains("低值品")){
//						while(wrksl > 0){
//							ZySbody tempBody = new ZySbody();
//							BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//							tempBody.setSheadId(head.getSheadId());
//							tempBody.setZcbh("");
//							tempBody.setWrksl(1L);
//							tempBody.setSl(1D);
//							tempBody.setJe(body.getDj());
//							tempBody.setGrsqdbodyid(body.getSbodyId());
//							tempBody.setTxmbh("");
//							zCManageBodyUCC.saveBody(tempBody);
//							wrksl--;
//						}
//					}else if("易耗品".contains(body.getYjflmc())){
//						ZySbody tempBody = new ZySbody();
//						BeanUtils.copyProperties(body, tempBody, ignoreProperties);
//						tempBody.setSheadId(head.getSheadId());
//						tempBody.setCgdbodyid(body.getSbodyId());
//						zCManageBodyUCC.saveBody(tempBody);
//					}
//				}
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		//查询部门领用或借用的物品
		List<ZySbody> deptbodyList = zCManageBodyUCC.readBodiesByHeadID(head.getSheadId());
//		deptbodyList.addAll(personalList);
		displayJSonString(deptbodyList);
		return null;
	}
	
	/**
	 * 删除此条表体记录
	 */
	public String deleteBody() {
//		String delCardBodyIds = request.getParameter("delCardBodyIds");
//		String sheetType = request.getParameter("sheettype");
//		if("tostock".equals(sheetType) && StringUtils.isNotEmpty(delCardBodyIds)){
//			cardCommonUCCImpl.delete(delCardBodyIds.split(","));
//		}
		String[] bodyIds = delBodyIds.split(",");
		zCManageBodyUCC.deleteBody(bodyIds);
		return null;
	}
	 
	
	/**
	 * 从后台检索数据，刷新界面显示 根据sheettype,分别转到不同的JSP表页面
	 */
	public String modBody() {
		body = zCManageBodyUCC.modifyBody(bodyId);
		String nodeName = request.getParameter("nodeName");
		String sfxj = request.getParameter("sfxj");
		String zksl = request.getParameter("zksl");
		String displayFpslOrNOt = request.getParameter("displayFpslOrNOt");
		String displayOrNot = request.getParameter("displayOrNot");
		String zcSLTPTK = request.getParameter("zcSLTPTK");
		String zcbhExitThisPage = request.getParameter("zcbhExitThisPage");
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(body.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(body.getEjflbm());
		request.setAttribute("yjflbm", body.getYjflbm());
		request.setAttribute("ejflbm", body.getEjflbm());
		request.setAttribute("sjflbm", body.getSjflbm());
		request.setAttribute("sfxj", sfxj);
		request.setAttribute("zksl", zksl);
		request.setAttribute("zcSLTPTK", zcSLTPTK);
		request.setAttribute("zcbhExitThisPage", zcbhExitThisPage);
		request.setAttribute("displayFpslOrNOt", displayFpslOrNOt);
		request.setAttribute("displayOrNot", displayOrNot);
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		request.setAttribute("nodeName", nodeName);
		return sheettype;
	}
	/**统一分配，更新zy_sbody数据
	 * 
	 * 
	 */
	public String fenpei(){
		String sbodyId = request.getParameter("bodyId");
		zCManageBodyUCC.updatBZ3(sbodyId);
		saveSuccess = "saveSuccess";
		return null;
	}
	
	
	/**
	 * 更新一条记录
	 */
	public String updateBody(){
		ZySbody bodyForUpdate = zCManageBodyUCC.modifyBody(body.getSbodyId());
		bodyForUpdate = UpdateZySbody.obtainUpdateBody(body, bodyForUpdate);
		zCManageBodyUCC.updateBody(bodyForUpdate);
		saveSuccess = "saveSuccess";
		return sheettype;
	}
	
	/**
	 * 批量更新多条记录
	 */
	public String batUpdateBody(){
		String [] modIdArray = bodyIds.split(",");
		ZySbody bodyForUpdate = null;
		for(String modId : modIdArray){
			if(StringUtils.isNotEmpty(modId)){
				bodyForUpdate = zCManageBodyUCC.modifyBody(modId);
				bodyForUpdate.setSl(body.getSl());
				bodyForUpdate.setBz1(body.getBz1());
				zCManageBodyUCC.updateBody(bodyForUpdate);
			}
		}
		saveSuccess = "saveSuccess";
		return sheettype;
	}
	
	/**
	 * 根据bodyId从body表中查找要查看的记录并传输到查看页面
	 * @return
	 */
	public String viewGoodDetail(){
		String sbodyId = request.getParameter("bodyId");
		String sfxj = request.getParameter("sfxj");
		String zcId = "";
		//zcBook_swtz_view--实物台账
		if("tocheckstock_view".equals(sheettype) || "tocheckobject_view".equals(sheettype)){
			ZyPdxx pdxx = toCheckUCCimpl.findZyPdxxWithID(sbodyId);
			zcId = pdxx.getId();
		}else if("zcBook_kctz_view".equals(sheettype) || 
				"zcBook_swtz_view".equals(sheettype) ||
				"zcBook_lowValue_view".equals(sheettype)||
				"zcBook_consuming_view".equals(sheettype)){
			zcId = sbodyId;
		}else {
			body = zCManageBodyUCC.modifyBody(sbodyId);
			zcId = body.getZcId();
		}
		
		if("purchase_view".equals(sheettype)){
			body = zCManageBodyUCC.modifyBody(sbodyId);
		}else if("tostock_view".equals(sheettype)){
			if(StringUtils.isNotEmpty(zcId)){
				vv = zCManageBodyUCC.createViewVOZcId(zcId);
			}else{
				body = zCManageBodyUCC.modifyBody(sbodyId);
			}
		}else if("tocheckstock_view".equals(sheettype) || "tocheckobject_view".equals(sheettype)){
			pdxx = toCheckUCCimpl.findZyPdxxWithID(zcId);
		}else{
			vv = zCManageBodyUCC.createViewVOZcId(zcId);
		}
		request.setAttribute("yjflmc",vv.getYjflmc());
		request.setAttribute("sfxj", sfxj);
		if("purchase_view".equals(sheettype) || "tostock_view".equals(sheettype)){
			return sheettype + "_body";
		}else{
			return sheettype;
		}
	}
	
	/**
	 * 流程办结按钮调用，当返回值为3（数据已办结）时返回值为ok，保存发生错误时返回error
	 * 根据headId查看该表单是否已经办结，如果已经办结，直接返回，否则，存取信息到台账表
	 * 如果是入库，到head表中查询出已经办结的采购表单
	 */
	@SuppressWarnings("finally")
	public String finishWork(){
		ZyShead headForFinish = null;
		String isOperateSuccess = "";
		cardId = request.getParameter("cardId");
		headForFinish = zCManageHeadUCCimpl.readHead(headId);
		if("3".equals(headForFinish.getBdzt()) || "数据已办结".equals(headForFinish.getBdzt())){
			isOperateSuccess = "ok";
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(isOperateSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try{
				saveInfoToKCtz();
				isOperateSuccess = "ok";
			}catch(Exception e){
				isOperateSuccess = "error";
				e.printStackTrace();
			}finally{
				if("ok".equals(isOperateSuccess)){
					headForFinish = zCManageHeadUCCimpl.readHead(headId);
					headForFinish.setBdzt("数据已办结");
					zCManageHeadUCCimpl.updateHead(headForFinish);
				}
				response.setCharacterEncoding("UTF-8");
				try {
					response.getWriter().print(isOperateSuccess);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 报废的办结
	 * @return
	 * @throws IOException 
	 */
	public String finishWork4Discard() throws IOException{
		String headId = request.getParameter("headId");
		cardId = request.getParameter("cardId");
		ZyShead head = zCManageHeadUCCimpl.readHead(headId);
		String bodyIds = zCManageBodyUCC.findBodyByHeadId(headId);
		bodyIds = bodyIds.substring(0, bodyIds.length() - 1);
		String[] ids = bodyIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			ZySbody body = zCManageBodyUCC.findBody(ids[i]);
			ZyZc zc = zCQueryUCCimpl.getZyzcByZcId(body.getZcId());
			zc.setZczt("报废");
			zCQueryUCCimpl.updateZyZc(zc);
			ZyKctz tzOld = zCQueryUCCimpl.findTZById(zc.getZcId());
			ZyKctz tzNew = new ZyKctz();
			if(tzOld != null){
				zCQueryUCCimpl.updateTZ(tzOld.getKctzId());
				BeanUtils.copyProperties(tzOld, tzNew);
			}
			tzNew.setZcId(body.getZcId());
			tzNew.setRq(new Date());
			tzNew.setRksl(0.0);
			tzNew.setCksl(0.0);
			tzNew.setKcsl(body.getSl());
			tzNew.setDjlx("discard");
			tzNew.setDjh(head.getSheetId());
			tzNew.setSfzxjl(1L);
			tzNew.setTzzt("报废");
			tzNew.setBdyy(head.getYtxq());
			tzNew.setBz(head.getYtxq());
			zCQueryUCCimpl.saveTZ(tzNew);
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}
	
	/**
	 * 领用的时候流程办结
	 * @return
	 */
	public String finishWork4Consuming(){
		String headId = request.getParameter("headId");
		ZyShead head = zCManageHeadUCCimpl.readHead(headId);
		String bodyIds = zCManageBodyUCC.findBodyByHeadId(headId);
		String [] bodyIdArr = bodyIds.split(",");
		String isBjSuccess = "no";
		try{
			for (int i = 0; i < bodyIdArr.length; i++){
				ZySbody body = zCManageBodyUCC.findBody(bodyIdArr[i]);
				String grsqdbodyid = body.getGrsqdbodyid();
				//设置个人申请单的表单状态
				if(StringUtils.isNotEmpty(grsqdbodyid)){
					ZySbody grsqdbody = zCManageBodyUCC.findBody(grsqdbodyid);
					String grsqdheadId = grsqdbody.getSheadId();
					String [] grsqdbodyIdArr = {grsqdbody.getSbodyId()};
					zCManageBodyUCC.deleteBody(grsqdbodyIdArr);
					zCManageBodyUCC.changeZySheadBdzt(grsqdheadId);
				}
				
				if(body.getYjflmc().contains("易耗品") ||body.getYjflmc().contains("低值品")){
					int dzyhpsl = 0;
					if(StringUtils.isNotEmpty(body.getBz3()) && !"null".equals(body.getBz3())){
						dzyhpsl = Integer.parseInt(body.getBz3());
					}
					List<ZyZc> zcList = zCManageBodyUCC.ObtainDZYhpZcList(body.getYjflbm(),body.getEjflbm(),body.getSjflbm());
					for(int j = 0; j < dzyhpsl; j++){
						ZyZc zc = zcList.get(j);
						zc.setBgdd(body.getSqrmc());
						zc.setZjxgsj(new Date());
						zc.setZczt("领用");
						zCQueryUCCimpl.updateZyZc(zc);
						ZyKctz kctz = new ZyKctz();
						kctz.setZcId(zc.getZcId());
						kctz.setRq(new Date());
						kctz.setRksl(0D);
						kctz.setCksl(1D);
						kctz.setKcsl(0D);
						kctz.setLybmbm(body.getSqbmid());
						kctz.setLybmmc(body.getSqbmmc());
						kctz.setLyrbh(body.getSqrid());
						kctz.setLyrmc(body.getSqrmc());
						kctz.setLyrq(body.getJylyrq());
						kctz.setDjlx("dept_comsuming");
						kctz.setDjh(head.getSheetId());
						kctz.setSfzxjl(1L);
						kctz.setTzzt("领用");
						zCManageBodyUCC.sfzxjl(zc.getZcId());
						zCQueryUCCimpl.saveTZ(kctz);
					}
				}else{
					ZyZc zc = zCManageBodyUCC.obtainZyZcByZcId(body.getZcId());
					zc.setBgdd(body.getSqrmc());
					zc.setZjxgsj(new Date());
					zc.setZczt("领用");
					zCQueryUCCimpl.updateZyZc(zc);
					ZyKctz kctz = new ZyKctz();
					kctz.setZcId(zc.getZcId());
					kctz.setRq(new Date());
					kctz.setRksl(0D);
					kctz.setCksl(1D);
					kctz.setKcsl(0D);
					kctz.setLybmbm(body.getSqbmid());
					kctz.setLybmmc(body.getSqbmmc());
					kctz.setLyrbh(body.getSqrid());
					kctz.setLyrmc(body.getSqrmc());
					kctz.setLyrq(body.getJylyrq());
					kctz.setDjlx("dept_comsuming");
					kctz.setDjh(head.getSheetId());
					kctz.setSfzxjl(1L);
					kctz.setTzzt("领用");
					zCManageBodyUCC.sfzxjl(zc.getZcId());
					zCQueryUCCimpl.saveTZ(kctz);
				}
			}
			head.setBdzt("数据已办结");
			zCManageHeadUCCimpl.updateHead(head);
			isBjSuccess = "ok";
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(isBjSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 部门借用流程办结
	 * @return
	 */
	public String finishWork4Borrow(){
		String headId = request.getParameter("headId");
		ZyShead head = zCManageHeadUCCimpl.readHead(headId);
		String bodyIds = zCManageBodyUCC.findBodyByHeadId(headId);
		String [] bodyIdArr = bodyIds.split(",");
		String isBjSuccess = "no";
		try{
			for (int i = 0; i < bodyIdArr.length; i++){
				ZySbody body = zCManageBodyUCC.findBody(bodyIdArr[i]);
				String grsqdbodyid = body.getGrsqdbodyid();
				//设置个人申请单的表单状态
				if(StringUtils.isNotEmpty(grsqdbodyid)){
					ZySbody grsqdbody = zCManageBodyUCC.findBody(grsqdbodyid);
					String grsqdheadId = grsqdbody.getSheadId();
					String [] grsqdbodyIdArr = {grsqdbody.getSbodyId()};
					zCManageBodyUCC.deleteBody(grsqdbodyIdArr);
					zCManageBodyUCC.changeZySheadBdzt(grsqdheadId);
				}
				
				if(body.getYjflmc().contains("易耗品") ||body.getYjflmc().contains("低值品")){
//					int dzyhpsl = body.getSl().intValue();
					int dzyhpsl = 0;
					if(StringUtils.isNotEmpty(body.getBz3()) && !"null".equals(body.getBz3())){
						dzyhpsl = Integer.parseInt(body.getBz3());
					}
					List<ZyZc> zcList = zCManageBodyUCC.ObtainDZYhpZcList(body.getYjflbm(),body.getEjflbm(),body.getSjflbm());
					for(int j = 0; j < dzyhpsl; j++){
						ZyZc zc = zcList.get(j);
						zc.setBgdd(body.getSqrmc());
						zc.setZjxgsj(new Date());
						zc.setZczt("借用");
						zCQueryUCCimpl.updateZyZc(zc);
						ZyKctz kctz = new ZyKctz();
						kctz.setZcId(zc.getZcId());
						kctz.setRq(new Date());
						kctz.setRksl(0D);
						kctz.setCksl(1D);
						kctz.setKcsl(0D);
						kctz.setJybmbm(body.getSqbmid());
						kctz.setJybmmc(body.getSqbmmc());
						kctz.setLyrbh(body.getSqrid());
						kctz.setLyrmc(body.getSqrmc());
						kctz.setLyrq(body.getJylyrq());
						kctz.setJydqrq(body.getJylyrq());
						kctz.setDjlx("dept_borrow");
						kctz.setDjh(head.getSheetId());
						kctz.setSfzxjl(1L);
						kctz.setTzzt("借用");
						zCManageBodyUCC.sfzxjl(zc.getZcId());
						zCQueryUCCimpl.saveTZ(kctz);
					}
				}else{
					ZyZc zc = zCManageBodyUCC.obtainZyZcByZcId(body.getZcId());
					zc.setBgdd(body.getSqrmc());
					zc.setZjxgsj(new Date());
					zc.setZczt("借用");
					zCQueryUCCimpl.updateZyZc(zc);
					ZyKctz kctz = new ZyKctz();
					kctz.setZcId(zc.getZcId());
					kctz.setRq(new Date());
					kctz.setRksl(0D);
					kctz.setCksl(1D);
					kctz.setKcsl(0D);
					kctz.setJybmbm(body.getSqbmid());
					kctz.setJybmmc(body.getSqbmmc());
					kctz.setLyrbh(body.getSqrid());
					kctz.setLyrmc(body.getSqrmc());
					kctz.setLyrq(body.getJylyrq());
					kctz.setJydqrq(body.getJylyrq());
					kctz.setDjlx("dept_borrow");
					kctz.setDjh(head.getSheetId());
					kctz.setSfzxjl(1L);
					kctz.setTzzt("借用");
					zCManageBodyUCC.sfzxjl(zc.getZcId());
					zCQueryUCCimpl.saveTZ(kctz);
				}
			}
			head.setBdzt("数据已办结");
			zCManageHeadUCCimpl.updateHead(head);
			isBjSuccess = "ok";
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(isBjSuccess);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 如果是采购单和续保，采用此方法办结
	 * 对采购单，更新body表的中对应记录的采购日期，更新head表的表单状态字段
	 * 另外还有盘库审批tocheckstock，盘点审批tocheckobject，需要做判断后分别实现更改表中那些字段
	 * @return
	 */
	public String finishWorkNotSaveToKctz(){
		ZyShead headForFinish = null;
		List<ZySbody> bodyList = new ArrayList<ZySbody>();
		String isOperateSuccess = "";
		String pc = request.getParameter("pc");
		if("purchase".equals(sheettype)){
			try{
				bodyList = zCManageBodyUCC.readBodyByHeadID(headId);
				for(ZySbody body : bodyList){
					body.setCgrq(new Date());
					zCManageBodyUCC.updateBody(body);
				}
				headForFinish = zCManageHeadUCCimpl.readHead(headId);
				headForFinish.setBdzt("数据已办结");
				zCManageHeadUCCimpl.updateHead(headForFinish);
				isOperateSuccess = "ok";
			}catch(Exception e){
				isOperateSuccess = "error";
				e.printStackTrace();
			}finally{
				response.setCharacterEncoding("UTF-8");
				try {
					response.getWriter().print(isOperateSuccess);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else if("tocheckobject".equals(sheettype) || "tocheckstock".equals(sheettype)){
			try{
				headForFinish = zCManageHeadUCCimpl.readHead(headId);
				headForFinish.setBdzt("数据已办结");
				zCManageHeadUCCimpl.updateHead(headForFinish);
				toCheckUCCimpl.deleteRedundancyDataFromPdxx(headId,pc);
				isOperateSuccess = "ok";
			}catch(Exception e){
				isOperateSuccess = "error";
				e.printStackTrace();
			}finally{
				response.setCharacterEncoding("UTF-8");
				try {
					response.getWriter().print(isOperateSuccess);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 办结时保存一些信息到台账表中
	 * @return
	 */
	public String saveInfoToKCtz(){
		String [] bodyIdsForTZ = zCManageBodyUCC.obtainBodyIdBySheadId(headId);
		String [] AllbodyIds = null;
//		String ngbmbm = request.getParameter("ngbmbm");
//		if("dept_borrow".equals(sheettype) || "dept_comsuming".equals(sheettype)){
//			List<ZySbody> bodyList = zCManageHeadUCCimpl.getBodyByDept(sheettype,ngbmbm);
//			AllbodyIds = new String[bodyList.size() + bodyIdsForTZ.length];
//			int i = 0;
//			for(ZySbody body : bodyList){
//				AllbodyIds[i] = body.getSbodyId();
//				i++;
//			}
//			int k = 0;
//			for(int j = bodyList.size(); j < AllbodyIds.length; j++){
//				AllbodyIds[j] = bodyIdsForTZ[k];
//				k++;
//			}
//		}
		if(AllbodyIds != null){
			changeKctz(AllbodyIds);
		}else{
			changeKctz(bodyIdsForTZ);
		}
		return null;
	}
	
	/**
	 * 根据不同的业务保存数据到台账表中，如果是入库，还需要拷贝一些字段的值到资产表中，把保存后的资产的Id值
	 * 查出来更新到body表中的资产Id字段
	 * @param idArrayForChangeTZ，同一个表单下的SbodyId
	 * @return
	 */
	private String changeKctz(String [] idArrayForChangeTZ){
		String [] bodyIdArr = null;
		if("tostock".equals(sheettype)){
			ZySbody body = null;
			for(String bodyId : idArrayForChangeTZ){
				if(StringUtils.isNotEmpty(bodyId)){
					body = zCManageBodyUCC.findBody(bodyId);
					String [] ignoreProperties = {"sbodyId","cgdbodyid"};
					//按照入库物品数量循环
					for(int i = 0; i < body.getSl(); i++){
						ZyZc zyzc = new ZyZc();
						ZySbody tempBody = new ZySbody();
						BeanUtils.copyProperties(body,tempBody,ignoreProperties);
						tempBody.setSl(1D);
						tempBody.setWrksl(1L);
						//把body表中的和zy_sbody资产表中对应的字段拷贝到资产表中
						zyzc = zCManageBodyUCC.copyPropertiesForStock(tempBody, zyzc);
						
						//生成资产编号，并存到数据库中
						zyzc.setZcbh(zCManageBodyUCC.generalKpbh(body.getYjflbm(),body.getEjflbm()));
						
						zCQueryUCCimpl.saveZyZc(zyzc);
						tempBody.setZcId(zyzc.getZcId());
						zCManageBodyUCC.saveBody(tempBody);
					}
					if(StringUtils.isNotEmpty(body.getCgdbodyid())){
						//入库时对相应的资产的未入库数量做相应的修改，防止一个物品多次入库
						//台账环节不需要对未入库数量做修改
						ZySbody cgBody = zCManageBodyUCC.findBody(body.getCgdbodyid());
						Double sl = cgBody.getSl() - body.getSl();
						//cgBody.setSl(sl);
						cgBody.setWrksl(((Double)sl).longValue());
						//cgBody.setJe(sl * cgBody.getDj());
						zCManageBodyUCC.updateBody(cgBody);
					}
				}
			}
			bodyIdArr = zCManageBodyUCC.obtainBodyIdBySheadIdWithoutCGDBodyId(headId);
		}
		List<ZySbody> bodyList = null;
		if("goodchange".equals(sheettype)){
			bodyList = zCManageBodyUCC.obtainBodyListByBodyIds(idArrayForChangeTZ,"");
		}else if("tostock".equals(sheettype)){
			bodyList = zCManageBodyUCC.obtainBodyListByBodyIds(bodyIdArr);
		}else{
			bodyList = zCManageBodyUCC.obtainBodyListByBodyIds(idArrayForChangeTZ);
		}
		List<ZyKctz> kctzList = zCManageBodyUCC.obtainKctzListByBodyList(bodyList);
		zCManageBodyUCC.saveKctzListToKctz(kctzList);
		
		return null;
	}
	
	//入库列表增加
	public String query4StockBodyListAndPager(){
		String sheadId = request.getParameter("sheadId");
		String existBodyIdArr = request.getParameter("existBodyIdArr");
		List<ZySbody> bodyList = 
			zCManageBodyUCC.query4StockBodyListAndPager(paginator,sheadId,existBodyIdArr);
		if(bodyList == null){
			String josnStr = "{\"total\" : \"0\",\"page\" : \"0\",\"records\" : \"0\",\"rows\" : []}";
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(josnStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			displayJSonString(bodyList);
		}
		return null;
	}
	
	
//	private String changeKctz(String [] idArrayForChangeTZ){
//		if("tostock".equals(sheettype)){
//			String stockHeadId = request.getParameter("headId");
//			String caSheadId = cardQueryUCCImpl.getcaSheadIdWithHeadId(headId);
//			Map<String, String> lcCardtempMap = new HashMap<String, String>();
//			ZySbody body = null;
//			ZyZc zyzc = new ZyZc();
//			for(String bodyId : idArrayForChangeTZ){
//				if(StringUtils.isNotEmpty(bodyId)){
//					body = zCManageBodyUCC.findBody(bodyId);
//					
//					//如果要入库的物品是易耗品，则不是在资产表中直接添加一条记录，而是找到该资产分类修改其数量
//					if(body.getYjflmc().contains("易耗品")){
//						String zcId = zCManageBodyUCC.obtainZyZcByFLBM(body.getYjflbm(),body.getEjflbm(),body.getSjflbm());
//						body.setZcId(zcId);
//						zCManageBodyUCC.updateBody(body);
//					}else{
//						zyzc = zCManageBodyUCC.copyPropertiesForStock(body, zyzc);
//						//如果卡片ID字符串中包含该bodyId，则说明该资产已经生成卡片
//						if(cardId != null && cardId.contains(bodyId)){
//							zyzc.setSfsckp("是");
//						}
//						//保存卡片编号
//						String cardNum =zCManageBodyUCC.obtainIdWithZcIdAndHeadId(bodyId, caSheadId);
//						zyzc.setKpbh(cardNum);
//						zCQueryUCCimpl.saveZyZc(zyzc);
//						body.setZcId(zyzc.getZcId());
//						zCManageBodyUCC.updateBody(body);
//						
//						//卡片从临时表保存到cardInfo表时使用
//						lcCardtempMap.put(bodyId, zyzc.getZcId());
//					}
//				}
//			}
//			//从临时表中拷贝对象到CardInfo对象，更改其资产Id后保存到cardInfo表中
//			for(Map.Entry<String, String> entry : lcCardtempMap.entrySet()){
//				Cardinfo cardInfo = new Cardinfo();
//				LcCardtemp lcCardtemp = cardQueryUCCImpl.obtainLcCardtemp4ZyKp(caSheadId, entry.getKey());
//				if(lcCardtemp != null){
//					BeanUtils.copyProperties(lcCardtemp, cardInfo);
//					cardInfo.setZcid(entry.getValue());
//					zCManageBodyUCC.saveCommonBO(cardInfo);
//				}
//			}
//		}
//		List<ZySbody> bodyList = null;
//		if("goodchange".equals(sheettype)){
//			bodyList = zCManageBodyUCC.obtainBodyListByBodyIds(idArrayForChangeTZ,"");
//		}else{
//			bodyList = zCManageBodyUCC.obtainBodyListByBodyIds(idArrayForChangeTZ);
//		}
//		List<ZyKctz> kctzList = zCManageBodyUCC.obtainKctzListByBodyList(bodyList);
//		zCManageBodyUCC.saveKctzListToKctz(kctzList);
//		
//		return null;
//	}
	
	/**
	 * 令牌查询时从左边的菜单点击时初始化查询页面
	 */
	public String tokenQueryInit(){
		return "tokenQuery";
	}
	
	/**
	 * 根据传过来的查询条件查询令牌信息
	 * @return
	 */
	public String tokenQuery(){
		List<TokenVO> tvoList = new ArrayList<TokenVO>();
		String [] tokenQueryCondit = new String[2];
		tokenQueryCondit[0] = queryPurVo.getLph();
		tokenQueryCondit[1] = queryPurVo.getLpdlm();
		tvoList = zCManageBodyUCC.obatainTokenInfo(tokenQueryCondit);
		displayJSonString(tvoList);
		return null;
	}
	
	/**
	 * Excel导出
	 */
	public String exportexcel() throws Exception {
		String josnStr = null;
		List<TokenVO> tvoList = new ArrayList<TokenVO>();
		String [] tokenQueryCondit = new String[2];
		tokenQueryCondit[0] = queryPurVo.getLph();
		tokenQueryCondit[1] = queryPurVo.getLpdlm();
		if(zCManageBodyUCC == null){
			zCManageBodyUCC=(ZCManageBodyUCCImpl)SpringContextHelper.getBean(ZCManageBodyUCCImpl.class);
		}
		tvoList = zCManageBodyUCC.obatainTokenInfo(tokenQueryCondit);
		josnStr = BodyListToJSON.getJSON(tvoList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		return josnStr;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryPurVo = (QueryPurchaseVo)excelVO;
	}
	
	/**
	 * 根据资产Id和caSheadId到LcCardtemp表中查询出id（主键）
	 * @param zcId
	 * @param caSheadId
	 * @return
	 */
	public String obtainIdWithZcIdAndHeadId() throws IOException{
		String zcId =  request.getParameter("zcId");
		String caSheadId = request.getParameter("caSheadId");
		String idStr = zCManageBodyUCC.obtainIdWithZcIdAndHeadId(zcId,caSheadId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(idStr);
		return null;
	}
	
	/**
	 * 根据headId到盘点信息表中查找该Id下的所有记录
	 * @param headId
	 * @return
	 */
	public String displayStockGrid() throws IOException{
		String headId =  request.getParameter("headId");
		List<ZyPdxx> pdxxList = null;
		String josnStr = zCManageBodyUCC.obtainPdxxListWithHeadId(headId,paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(josnStr);
		return null;
	}
	
	/**
	 * 传进去一个List，转换成JSON字符串并显示
	 * @param <T>
	 * @param VOList
	 * @return
	 */
	private <T> String displayJSonString(List<T> VOList){
		String josnStr = BodyListToJSON.getJSON(VOList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private <T> String displayJSonString(List<T> VOList,String headId){
		String josnStr = BodyListToJSON.getJSON(VOList, 1, 1, 10000);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String searchDetail(){
		body = zCManageBodyUCC.modifyBody(bodyId);
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(body.getYjflbm());
		Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(body.getEjflbm());
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return "searchDetail";
	}
	
	/**
	 * 物品续保办结
	 * @return
	 * @throws IOException 
	 */
	public String overWork() throws IOException {
		String headId = request.getParameter("headId");
		String sheetType = request.getParameter("sheettype");
		String bodyIds = zCManageBodyUCC.findBodyByHeadId(headId);
		bodyIds = bodyIds.substring(0, bodyIds.length() - 1);
		String[] ids = bodyIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			ZySbody body = zCManageBodyUCC.findBody(ids[i]);
			ZyZc zc = zCQueryUCCimpl.getZyzcByZcId(body.getZcId());
			zc.setCbrq(body.getXxbrq());
			zc.setBxfws(body.getBxfws());
			zCQueryUCCimpl.updateZyZc(zc);
			ZyKctz tz = zCQueryUCCimpl.findTZById(body.getZcId());
			if(tz!=null){
				tz.setSfzxjl(0L);
				zCQueryUCCimpl.updateTZ(tz.getKctzId());
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("ok");
			}else{
				ZyKctz kc = new ZyKctz();
				kc.setZcId(zc.getZcId());
				kc.setSfzxjl(1L);
				kc.setDjlx(sheetType);
				kc.setRq(new Date());
				zCQueryUCCimpl.saveTZ(kc);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("ok");
			}
		}
		return null;
	}
	
	/**
	 * 根据bodyId到zy_sbody表中查找该资产的资产ID
	 * @return
	 */
	public String getZcIdWithSbodyId(){
		String bodyIdStr = request.getParameter("bodyIdStr");
		String [] bodyIdArr = bodyIdStr.split(",");
		StringBuffer sb = new StringBuffer();
		for(String bodyId : bodyIdArr){
			if(StringUtils.isNotEmpty(bodyId)){
				String zcId = zCManageBodyUCC.findBody(bodyId).getZcId();
				if(!sb.toString().contains(zcId)){
					sb.append(zcId);
					sb.append(">##<");
				}
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(sb.toString().substring(0, sb.toString().length()-4));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 通过bodyId到zy_sbody表中查找该资产的数量
	 * @return
	 */
	public String getSlBySbodyId(){
		String bodyIdStr = request.getParameter("bodyIdStr");
		String [] bodyIdArr = bodyIdStr.split(",");
		StringBuffer sb = new StringBuffer();
		for(String bodyId : bodyIdArr){
			if(StringUtils.isNotEmpty(bodyId)){
				sb.append(zCManageBodyUCC.getBodyIdAndSL(zCManageBodyUCC.findBody(bodyId)));
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(sb.toString().substring(0, sb.toString().length()-6));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getPgxxByZcId(){
		String zyzcId = request.getParameter("zyzcId");
		List<ZcPgXx> bodyList = zCManageBodyUCC.getPgxxByZcId(zyzcId);
		String returnStr = BodyListToJSON.getJSON(bodyList, 1000, 0, 10000);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(returnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//--------------------------------Refactor End-----------------------------------
	
	// -------------------------------------------------------------
	// 下面的代码是程序自动生成的GetSet方法
	// -------------------------------------------------------------

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public ZyZc getZyZc() {
		return zyZc;
	}

	public void setZyZc(ZyZc zyZc) {
		this.zyZc = zyZc;
	}

	public ZCManageBodyUCC getZCManageBodyUCC() {
		return zCManageBodyUCC;
	}

	public void setZCManageBodyUCC(ZCManageBodyUCC manageBodyUCC) {
		zCManageBodyUCC = manageBodyUCC;
	}

	public ZySbody getBody() {
		return body;
	}

	public void setBody(ZySbody body) {
		this.body = body;
	}

	public ZyShead getHead() {
		return head;
	}

	public void setHead(ZyShead head) {
		this.head = head;
	}

	public QueryPurchaseVo getQueryPurVo() {
		return queryPurVo;
	}

	public void setQueryPurVo(QueryPurchaseVo queryPurVo) {
		this.queryPurVo = queryPurVo;
	}

	public String getBodyIds() {
		return bodyIds;
	}

	public void setBodyIds(String bodyIds) {
		this.bodyIds = bodyIds;
	}

	public String getBodyId() {
		return bodyId;
	}

	public void setBodyId(String bodyId) {
		this.bodyId = bodyId;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getDelBodyIds() {
		return delBodyIds;
	}

	public void setDelBodyIds(String delBodyIds) {
		this.delBodyIds = delBodyIds;
	}

	public String getSaveSuccess() {
		return saveSuccess;
	}

	public void setSaveSuccess(String saveSuccess) {
		this.saveSuccess = saveSuccess;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getAllHeadIds() {
		return allHeadIds;
	}

	public void setAllHeadIds(String allHeadIds) {
		this.allHeadIds = allHeadIds;
	}

	public ViewVO getVv() {
		return vv;
	}

	public void setVv(ViewVO vv) {
		this.vv = vv;
	}

	public TokenVO getTvo() {
		return tvo;
	}

	public void setTvo(TokenVO tvo) {
		this.tvo = tvo;
	}

	public String getSyzt() {
		return syzt;
	}

	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}

	public ZyPdxx getPdxx() {
		return pdxx;
	}

	public void setPdxx(ZyPdxx pdxx) {
		this.pdxx = pdxx;
	}

}