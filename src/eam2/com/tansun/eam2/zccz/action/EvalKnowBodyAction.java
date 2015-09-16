package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.service.impl.SczckLSBUtil;
import com.tansun.eam2.zccz.ucc.ICzSczskUCC;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class EvalKnowBodyAction extends CommonAction {

    public String sheettype;	
    public String headId;
    public CzSczskBdxx  zskBdxx;
    public CzSczskLsb zskLsb;
    public String bdId;
    @Autowired
	public  ICzSczskUCC czSczskUCCImpl;
	private  SczckLSBUtil sczckLSBUtil;
	/**
	 * 保存表体
	 * @return
	 */
	public String saveBody() {
		czSczskUCCImpl.update(zskBdxx);
		return "modify";
	}

	
	/**
	 * 增加表体记录
	 * @return
	 */
	public String create() {
//		try{
//		String creatType = request.getParameter("creatType");
//		if("change".equals(creatType)){
//			sczckLSBUtil.generateChangeLSB(headId);
//		}else{
//			sczckLSBUtil.generateSPLSB(headId);
//		}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
		return null;
	}

	
	/**
	 * 删除表体记录
	 * @return
	 */
	public String deleteBody() {
		
		bdId= request.getParameter("bdId");
		if (bdId.startsWith(",")) {
			bdId = bdId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] bdIds = null;
		bdIds = bdId.split(",");
		for(int i =0;i<bdIds.length;i++){
			zskBdxx = (CzSczskBdxx) czSczskUCCImpl.findById(CzSczskBdxx.class,bdIds[i]);
			czSczskUCCImpl.delete(zskBdxx);
		}
		return null;
	}

	
	/**
	 * 修改表体记录入口
	 * @return
	 */
	public String modifyBody() {
		bdId= request.getParameter("bdId");
		zskBdxx = (CzSczskBdxx) czSczskUCCImpl.findById(CzSczskBdxx.class,bdId);
		return "modify";
	}
	/**
	 * 审批入口
	 * @return
	 */
	public String examineBody() {
		bdId= request.getParameter("bdId");
		zskBdxx = (CzSczskBdxx) czSczskUCCImpl.findById(CzSczskBdxx.class,bdId);
		return "examine";
	}
	/**
	 * 查看表体记录入口(只读)
	 * @return
	 */
	public String vidwBody() {
		return null;
	}
	/**
	 * 表体查询
	 * @return
	 * @throws IOException
	 */
	public String query4View() throws IOException {
		headId = request.getParameter("headId");
		List<CzSczskBdxx> list = czSczskUCCImpl.getCzSczskBdxxBycldId(headId);
		String bodyJSON = BodyListToJSON.getJSON(list, 1, 1, 1);
		System.out.println(list.size());
		System.out.println(bodyJSON);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}


	public String getSheettype() {
		return sheettype;
	}


	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}


	public String getHeadId() {
		return headId;
	}


	public void setHeadId(String headId) {
		this.headId = headId;
	}


	public CzSczskBdxx getZskBdxx() {
		return zskBdxx;
	}


	public void setZskBdxx(CzSczskBdxx zskBdxx) {
		this.zskBdxx = zskBdxx;
	}


	public String getBdId() {
		return bdId;
	}


	public void setBdId(String bdId) {
		this.bdId = bdId;
	}


	public ICzSczskUCC getCzSczskUCCImpl() {
		return czSczskUCCImpl;
	}


	public void setCzSczskUCCImpl(ICzSczskUCC czSczskUCCImpl) {
		this.czSczskUCCImpl = czSczskUCCImpl;
	}


	public SczckLSBUtil getSczckLSBUtil() {
		return sczckLSBUtil;
	}

	@Autowired
	public void setSczckLSBUtil(SczckLSBUtil sczckLSBUtil) {
		this.sczckLSBUtil = sczckLSBUtil;
	}


	public CzSczskLsb getZskLsb() {
		return zskLsb;
	}


	public void setZskLsb(CzSczskLsb zskLsb) {
		this.zskLsb = zskLsb;
	}


}
