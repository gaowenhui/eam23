package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * 生成卡片台账
 * @author lantb
 *
 */
public class ERPCreateBook4CardAction extends CommonAction{
	
	private CaShead 	head;//处理单表头信息
	private LcCardtemp 	body;//卡片临时表信息
	private Cardinfo 	card;//卡片表信息
	private String 		bdlx;//表单类型
	private String		headId;//表单ID
	@Autowired
	private PTTodoBS ptBs;  
	@Autowired
	private WorkflowBS workflowBS;
	@Autowired
	private IERPCommonUCC erpCommonUCC;			//erp相关
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	
	public String requestExecute() {
		String ErpMessage = "";//发送erp后返回消息
		//Add by YanPeiLing 2011-1-12 start
		String isStock = request.getParameter("isStock");//是否是自用资产入库
		if("Yes".equals(isStock)){
			headId = cardQueryUCCImpl.getcaSheadIdWithHeadId(headId);
		}
		//Add by YanPeiLing 2011-1-12 end
		if(headId!=null && headId.length()>0){
			ErpMessage = erpCommonUCC.book4CardById(headId);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(ErpMessage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//***********以下为getter、setter*****************
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

	public Cardinfo getCard() {
		return card;
	}

	public void setCard(Cardinfo card) {
		this.card = card;
	}

	public String getBdlx() {
		return bdlx;
	}

	public void setBdlx(String bdlx) {
		this.bdlx = bdlx;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}
}
