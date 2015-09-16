package com.tansun.eam2.kpgl.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.eam2.kpgl.vo.CardListInfoVO;
import com.tansun.eam2.kpgl.vo.CardNameVO;
import com.tansun.eam2.kpgl.vo.CardQueryVO;
import com.tansun.eam2.zyzc.utils.GetJsonString;
import com.tansun.eam2.zyzc.vo.CardVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 
 * @author 陈煜霄
 * @date 2010-11-12 卡片查询,表体查询
 */
public class CardQueryAction extends CommonAction {

	private CardQueryVO queryVO;
	private Paginator paginator;
	private List cardTypeList;
	private LcCardtemp body;
	private CardNameVO bodyValue;
	private Cardinfo card;
	private String isQuery;
	private String[] firsts;
	public List firstBranchList;//一级分行集合
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	private String zcmc;
	private String zcbh;
	private String zczt;
	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZczt() {
		return zczt;
	}

	public void setZczt(String zczt) {
		this.zczt = zczt;
	}

	/**
	 * 进入查询页面并查询全部卡片信息
	 * 
	 * @return
	 */
	public String init() {
		String batch = request.getParameter("batch"); // 批量选择
		request.setAttribute("batch", batch);
		return "init";
	}

	/**
	 * 初始化高级查询入口
	 * 
	 * @return
	 */
	public String advancedInit() {
		return "advancedInit";
	}

	/**
	 * 卡片普通查询功能
	 * 
	 * @return
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new CardQueryVO();
		}
		String cardJSON = cardQueryUCCImpl.query(queryVO, paginator);
		// String cardJSON = "";
		//System.out.println(cardJSON);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardJSON);
		return null;
	}
	public String queryforAsset(){
		if (queryVO == null) {
			queryVO = new CardQueryVO();
		}
		try{
			List<CardListInfoVO> carList = cardQueryUCCImpl.queryforAsset(queryVO, paginator);
			String bodyJSON = BodyListToJSON.getJSON(carList, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			//System.out.println(carList.size());
			//System.out.println(bodyJSON);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 树，addby lantianbo 2010-11-22
	 * 
	 * @return
	 */
	public String tree() {
		String type4Card = request.getParameter("type4Card");
		String nodeValue = request.getParameter("nodeValue");
		String isCardType4Change = request.getParameter("isCardType4Change");
		request.setAttribute("isCardType4Change", isCardType4Change);// 卡片类型
		request.setAttribute("nodeValue", nodeValue);// 卡片类型
		request.setAttribute("type4Card", type4Card);// 弹出树的类型
		return "tree";
	}

	/**
	 * 卡片变动方式的不同对应查询页面的显示也不同
	 * 
	 * @return
	 */
	public String change() {
		String nodeValue = request.getParameter("nodeValue");
		Individualtree tree = cardQueryUCCImpl.getColoNizeValue(nodeValue);
		String colo = tree.getColonizevalue();
		colo = colo.substring(0, colo.length() - 1);
		String[] cateIds = colo.split(",");
		cardTypeList = cardQueryUCCImpl.getCardTypeList(cateIds);
		request.setAttribute("cardTypeFlag", "true");
		return "init";
	}

	/**
	 * 进入详卡片细信息页面
	 * 
	 * @return
	 */
	public String cardInfo() {
		String cardId = request.getParameter("cardId");
		String cardInfoType = request.getParameter("cardInfoType");
		String cardcode = request.getParameter("cardcode");
		if(cardcode!=null&&!"".equals(cardcode)){
			Cardinfo cardinfo = cardCommonUCCImpl.findCardinfoByCardCode(cardcode);
			if(cardinfo!=null){
				cardId = cardinfo.getId().toString();
			}
		}
		// Cardinfo card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
		// body = cardCommonUCCImpl.card2Body(card);
		request.setAttribute("cardId", cardId);
		return cardInfoType;
	}

	/**
	 * 显示卡片详细信息
	 * 
	 * @return
	 */
	public String cardType() {
		String cardType = "";
		String returnStr = "";
		String cardId = request.getParameter("cardId");
		if("true".equals(request.getParameter("isBody"))){
			String bodyId = request.getParameter("bodyId");
			body = cardCommonUCCImpl.findLcCardtempById(bodyId);
			cardType = body.getParentid().toString();// 卡片类型，根据这个跳转到相应的卡片修改类型页面
			if("1".equals(body.getSfzy())){
				ZyZc zc = new ZyZc();
				if(body.getZcid()!=null&&body.getZcid().length()>0){
					zc = cardCommonUCCImpl.findZyZcById(body.getZcid());
					zcmc = zc.getZcmc()==null?"":zc.getZcmc();
					zcbh = zc.getZcbh()==null?"":zc.getZcbh();
					//zczt = zc.getZczt();
					zczt = zc.getZczt()==null?"":zc.getZczt();
				}
				request.setAttribute("zcType", "zyzc");
				request.setAttribute("isAddModify", "true");
			}else{
				JyzcXx zc = new JyzcXx();
				if(body.getZcid()!=null){
					zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
					zcmc = zc.getZcmc()==null?"":zc.getZcmc();
					zcbh = zc.getZcbh()==null?"":zc.getZcbh();
					zczt = zc.getCZczc()==null?"":zc.getCZczc();
				}
				request.setAttribute("zcType", "jyzc");
				request.setAttribute("isAddModify", "true");
			}
		}else{
			card = cardCommonUCCImpl.findCardinfoByCardId(cardId);
			body = cardCommonUCCImpl.card2Body(card);// 把card信息转换成body
			cardType = card.getParentid().toString();// 卡片类型，根据这个跳转到相应的卡片修改类型页面
			request.setAttribute("cardId", card.getId());
			if("1".equals(body.getSfzy())){
				ZyZc zc = new ZyZc();
				if(body.getZcid()!=null&&body.getZcid().length()>0){
					zc = cardCommonUCCImpl.findZyZcById(body.getZcid());
					if(zc!=null){
						zcmc = zc.getZcmc()==null?"":zc.getZcmc();
						zcbh = zc.getZcbh()==null?"":zc.getZcbh();
						//zczt = zc.getZczt();
						zczt = zc.getZczt()==null?"":zc.getZczt();
					}
				}
				request.setAttribute("zcType", "zyzc");
				request.setAttribute("isAddModify", "true");
			}else{
				JyzcXx zc = new JyzcXx();
				if(body.getZcid()!=null){
					zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
					if(zc!=null){
						zcmc = zc.getZcmc()==null?"":zc.getZcmc();
						zcbh = zc.getZcbh()==null?"":zc.getZcbh();
						zczt = zc.getCZczc()==null?"":zc.getCZczc();
					}
				}
				request.setAttribute("zcType", "jyzc");
				request.setAttribute("isAddModify", "true");
			}
		}
		CardBodyAction bodyAction = new CardBodyAction();
		returnStr = bodyAction.chooseCardType(cardType);// 选择卡片类型
		bodyValue = new CardNameVO();
		bodyValue.setAddtypeValue(cardQueryUCCImpl.findCateNameByNodeValue(
				"addmethod", body.getAddtype()));
		bodyValue.setGlbmValue(cardQueryUCCImpl.findCateNameByNodeValue(
				"department", body.getGlbm()));
		bodyValue.setUsepartmentValue(cardQueryUCCImpl.findCateNameByNodeValue(
				"department", body.getUsepartment()));
		bodyValue.setUsestateValue(cardQueryUCCImpl.findCateNameByNodeValue(
				"userStatus", body.getUsestatus()));
		bodyValue.setTypecodeValue(cardQueryUCCImpl.findCateNameByNodeValue(
				"assetType", body.getTypecode()));
		request.setAttribute("isCardInfo", true);
		return returnStr;
	}
	/**
	 * 显示卡片修改详细信息
	 * 
	 * @return
	 */
	public String cardType1() {
		String bodyId = request.getParameter("bodyId");
		request.setAttribute("bodyId", bodyId);
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "cardModify";
	}
	
	/**
	 * 显示卡片修改的记录
	 * @return
	 */
	public String cardRecond(){
		String bodyId = request.getParameter("bodyId");
		request.setAttribute("bodyId", bodyId);
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "cardRecond";
	}
	/**
	 * 卡片新增表体查询经营固定资产新增列表
	 * 
	 * @return
	 */
	public String findAddBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardAddBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片新增表体查询自用资产新增列表
	 * @return
	 */
	public String findAddBody4ZyKp(){
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findAddBody4ZyKp(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 卡片减少表体查询
	 * 
	 * @return
	 */
	public String findReduceBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardReduceBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片减值表体查询
	 * 
	 * @return
	 */
	public String findDevalueBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardDevalueBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片变动表体查询
	 * 
	 * @return
	 */
	public String findChangeBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardChangeBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片调配表体查询
	 * 
	 * @return
	 */
	public String findAllocateBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardAllocateBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片修改表体查询
	 * 
	 * @return
	 */
	public String findModifyBodyAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findCardModifyBody(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片拆分前表体查询
	 * 
	 * @return
	 */
	public String findBeforeSplitAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findBeforeSplit(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片拆分后表体查询
	 * 
	 * @return
	 */
	public String findAfterSplitAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findAfterSplit(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片合并前表体查询
	 * 
	 * @return
	 */
	public String findBeforeMergeAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findBeforeMerge(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 卡片合并后表体查询
	 * 
	 * @return
	 */
	public String findAfterMergeAction() {
		try {
			String headId = request.getParameter("headId");
			String addJSON = cardQueryUCCImpl.findAfterMerge(headId);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(addJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getCode() {
		String headId = request.getParameter("headId");

		String code = cardQueryUCCImpl.queryCode(headId);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(code);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @author YanPeiLing 2011-1-8
	 * 根据caSheadId（对应lc_cardtemp表中KPXZID的字段）和sbodid（对应zy_Sbody表中的Sbody_id）
	 * 到这两张表中查询出数据保存到VO中显示在界面上
	 * @param caSheadId
	 * @param sbodyId
	 * @return
	 */
	public String obtainBody4ZyKp(){
		String sbodyId = request.getParameter("sbodyId");
		String headId = request.getParameter("headId");
		try{
			String caSheadIdAwalys = cardQueryUCCImpl.getcaSheadIdWithHeadId(headId);
			List<CardVO> CardVOList = cardQueryUCCImpl.obtainBody4ZyKp(caSheadIdAwalys, sbodyId);
			String jsonStr = GetJsonString.getJsonString(CardVOList);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @author YanPeiLing 2011-1-8
	 * 自用资产入库时调用本方法取得casheadId以保证casheadId不为空
	 * @return
	 * @throws IOException 
	 */
	public String getcaSheadIdWithHeadId() throws IOException{
		String headId = request.getParameter("headId");
		String casheadId = cardQueryUCCImpl.getcaSheadIdWithHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(casheadId);
		return null;
	}
	
	public String findRecordhistorys(){
		String cardId = request.getParameter("cardId");
		String s = this.cardQueryUCCImpl.findRecordhistorys(cardId, paginator);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String findRecordhistorys1(){
		String headId = request.getParameter("headId");
		String bodyId = request.getParameter("bodyId");
		String s = this.cardQueryUCCImpl.findRecordhistorys1(headId, bodyId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String findAsset(){
		String cardId = request.getParameter("cardId");
		String s = this.cardQueryUCCImpl.findAsset(cardId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String openFirst() {
		firstBranchList = cardQueryUCCImpl.findFirstBranch();
		return "openFirst";
	}

	public String firstBranchChoose() {
		String[] ids = firsts;
		return null;
	}
	
	/**
	 * 勾选导出
	 * 
	 * @return
	 * @throws IOException
	 */
	public String excelCheck() throws IOException {
		String params = request.getParameter("idStr");
		String json = cardQueryUCCImpl.excelCheck(params);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public CardQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(CardQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public List getCardTypeList() {
		return cardTypeList;
	}

	public void setCardTypeList(List cardTypeList) {
		this.cardTypeList = cardTypeList;
	}

	public LcCardtemp getBody() {
		return body;
	}

	public void setBody(LcCardtemp body) {
		this.body = body;
	}

	public CardNameVO getBodyValue() {
		return bodyValue;
	}

	public void setBodyValue(CardNameVO bodyValue) {
		this.bodyValue = bodyValue;
	}

	public String getIsQuery() {
		return isQuery;
	}

	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}

	public String[] getFirsts() {
		return firsts;
	}

	public void setFirsts(String[] firsts) {
		this.firsts = firsts;
	}

	public List getFirstBranchList() {
		return firstBranchList;
	}

	public void setFirstBranchList(List firstBranchList) {
		this.firstBranchList = firstBranchList;
	}
	
}
