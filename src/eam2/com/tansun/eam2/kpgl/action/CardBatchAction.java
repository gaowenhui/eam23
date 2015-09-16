package com.tansun.eam2.kpgl.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class CardBatchAction extends CommonAction {

	private Cardinfo card;
	private CaShead head;
	private LcCardtemp body;
	private Recordhistory record;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;

	/**
	 * 批量选择卡片减少
	 * 
	 * @return
	 * @throws IOException
	 */
	public String chooseReduceBatch() throws IOException {
		String reduceCheck = "";
		String cardIds = request.getParameter("cardIds");
		String headId = request.getParameter("headId");
		if (cardIds.startsWith(",")) {
			cardIds = cardIds.substring(1);
		}
		String[] Ids = cardIds.split(",");
		for (int i = 0; i < Ids.length; i++) {
			card = cardCommonUCCImpl.findCardinfoByCardId(Ids[i]);
			if("03".equals(card.getState())){
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("退役卡片不能选择");
				return null;
			}
			body = cardCommonUCCImpl.card2Body(card);
			body.setKpxzid(Long.parseLong(headId));
			body.setCardinfoid(String.valueOf(card.getId()));
			if ("0".equals(body.getSfzy().trim())) {
				JyzcXx zc = new JyzcXx();
				zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
				if(zc!=null){
					if ("1".equals(zc.getZlzt()) || "3".equals(zc.getCZczc())
							|| "4".equals(zc.getCZczc())
							|| "5".equals(zc.getCZczc())) {
						reduceCheck = reduceCheck + card.getId() + ",";
					} else {
						cardCommonUCCImpl.save(body);
					}
				}else {
					cardCommonUCCImpl.save(body);
				}
				
			}else{
				ZyZc zc = new ZyZc();
				zc = cardCommonUCCImpl.findZyZcById(body.getZcid());
				if(zc!=null){
					if ("1".equals(zc.getZczt()) || "3".equals(zc.getZczt())
							|| "4".equals(zc.getZczt())
							|| "5".equals(zc.getZczt())) {
						reduceCheck = reduceCheck + card.getId() + ",";
					} else {
						cardCommonUCCImpl.save(body);
					}
				}else {
					cardCommonUCCImpl.save(body);
				}
			}
		}
		if (!"".equals(reduceCheck)) {
			reduceCheck = "编号为" + reduceCheck + "的卡片无法减少或修改";
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reduceCheck + "=OK");
		return null;
	}

	/**
	 * 打开卡片减少批量操作页面
	 * 
	 * @return
	 */
	public String openReduceOperate() {
		String bodyIds = request.getParameter("bodyIds");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		request.setAttribute("bodyIds", bodyIds);
		return "batchReduce";
	}

	/**
	 * 批量减少操作
	 * 
	 * @return
	 * @throws IOException
	 */
	public String operateReduceBatch() throws IOException {
		String dealmethod = request.getParameter("dealmethod");
		String changereason = request.getParameter("changereason");
		String bodyIds = request.getParameter("bodyIds");
		String[] Ids = bodyIds.split(",");
		for (int i = 0; i < Ids.length; i++) {
			body = cardCommonUCCImpl.findLcCardtempById(Ids[i]);
			body.setChangereason(changereason);
			body.setDealmethod(dealmethod);
			cardCommonUCCImpl.update(body);
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("修改成功");
		return null;
	}

	/**
	 * 批量选择要减值的卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String chooseDevalueBatch() throws IOException {
		String reduceCheck = "";
		String cardIds = request.getParameter("cardIds");
		String headId = request.getParameter("headId");
		if (cardIds.startsWith(",")) {
			cardIds = cardIds.substring(1);
		}
		String[] Ids = cardIds.split(",");
		for (int i = 0; i < Ids.length; i++) {
			String bodyId = "";
			card = cardCommonUCCImpl.findCardinfoByCardId(Ids[i]);
			if("03".equals(card.getState())){
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("退役卡片不能选择");
				return null;
			}
			body = cardCommonUCCImpl.card2Body(card);
			body.setKpxzid(Long.parseLong(headId));
			body.setCardinfoid(String.valueOf(card.getId()));
			if ("0".equals(body.getSfzy().trim())) {
				JyzcXx zc = new JyzcXx();
				zc = cardCommonUCCImpl.findJyzcXxByZcId(body.getZcid());
				if(zc!=null){
					if ("3".equals(zc.getCZczc()) || "4".equals(zc.getCZczc())
							|| "5".equals(zc.getCZczc())) {
						reduceCheck = reduceCheck + body.getCardinfoid() + ",";
					} else {
						bodyId = cardCommonUCCImpl.saveBody(body).toString();
					}
				}else {
					bodyId = cardCommonUCCImpl.saveBody(body).toString();
				}
					
				if (!"".equals(bodyId)) {
					head = cardCommonUCCImpl.findCaSheadById(headId);
					record = new Recordhistory();
					record.setZcId(bodyId);
					record.setPkId(body.getKpxzid().toString());
					record.setBefore(String.valueOf(body.getJzzb()
							- body.getBcjt()));
					record.setAfter(body.getJzzb().toString());
					record.setChangetype("卡片减值");
					record.setZcType("card");
					record.setName("减值准备");
					record.setChangeinfoid(body.getCardinfoid());
					record.setChangestate("01");
					record.setWfCode(head.getWfconfigCode());// 流程
					record.setChangedate(head.getNgrq());
					cardCommonUCCImpl.saveRecord(record);
				}
			}else{
				reduceCheck = "自用资产卡片不能减值！";
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(reduceCheck);
				return null;
			}
		}
		if (!"".equals(reduceCheck)) {
			reduceCheck = "编号为" + reduceCheck + "的卡片无法减值";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(reduceCheck);
			return null;
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(reduceCheck + "保存成功");
		return null;
	}
	
	/**
	 * 卡片变动批量选择回调方法
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String chooseChangeBatch() throws IOException {
		String cardIds = request.getParameter("cardIds");
		String headId = request.getParameter("headId");
		String s = cardCommonUCCImpl.chooseChangeBatch(headId,cardIds);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(s);
		return null;
	}
	
	/**
	 * 打开卡片变动批量操作页面
	 * 
	 * @return
	 */
	public String openChangeOperate() {
		String bodyIds = request.getParameter("bodyIds");
		String headId = request.getParameter("headId");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		request.setAttribute("headId", headId);
		request.setAttribute("bodyIds", bodyIds);
		request.setAttribute("isBatch", "true");
		return "batchChange";
	}

	/**
	 * 批量变动
	 * @return
	 */
	public String operateChanageBatch(){
		String changeway 	= request.getParameter("changeway");	//取得变动方式的id，取的应该是INDIVIDUALTREE表的id
		String changereason = request.getParameter("changereason");	//取得变动原因
		String changeValue 	= request.getParameter("changeValue");	//取得变动后的值
		String isProportion = request.getParameter("isProportion");
		String bodyIds 	= request.getParameter("bodyIds");	//
		String headId = request.getParameter("headId");
		cardCommonUCCImpl.operateChanageBatch(changeway,changereason,changeValue,bodyIds,headId,isProportion);
		request.setAttribute("message", "操作成功！");
		return "batchChange";
	}
	
	public Cardinfo getCard() {
		return card;
	}

	public void setCard(Cardinfo card) {
		this.card = card;
	}

	public CaShead getHead() {
		return head;
	}

	public void setHead(CaShead head) {
		this.head = head;
	}

	public LcCardtemp getBody() {
		return body;
	}

	public void setBody(LcCardtemp body) {
		this.body = body;
	}

	public Recordhistory getRecord() {
		return record;
	}

	public void setRecord(Recordhistory record) {
		this.record = record;
	}

}
