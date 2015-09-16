package com.tansun.eam2.zccz.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHgshXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.zccz.ucc.IAssetDealHeadUCC;
import com.tansun.eam2.zccz.ucc.IBldService;
import com.tansun.eam2.zccz.ucc.IEntityDealHeadService;
import com.tansun.eam2.zccz.vo.CztzfaXxVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

public class BLDAction extends CommonAction {

	private CzHgshXx advice;
	private CzStcztz head;
	private CztzfaXxVO disposeHead;
	
	private IEntityDealHeadService headService;
	private IBldService bldService;
	private IUserUCC userUCC;
	private IAssetDealHeadUCC headUCC;
	@Autowired
	private IAssetDealHeadUCC iAssetDealHeadUCC;

	public IAssetDealHeadUCC getIAssetDealHeadUCC() {
		return iAssetDealHeadUCC;
	}

	public void setIAssetDealHeadUCC(IAssetDealHeadUCC assetDealHeadUCC) {
		iAssetDealHeadUCC = assetDealHeadUCC;
	}

	@Autowired
	public void setHeadUCC(IAssetDealHeadUCC headUCC) {
		this.headUCC = headUCC;
	}
	
	@Autowired
	public void setBldService(IBldService bldService) {
		this.bldService = bldService;
	}

	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	@Autowired
	public void setHeadService(IEntityDealHeadService headService) {
		this.headService = headService;
	}

	public void setAdvice(CzHgshXx advice) {
		this.advice = advice;
	}

	public void setHead(CzStcztz head) {
		this.head = head;
	}

	public CzHgshXx getAdvice() {
		return advice;
	}

	public CzStcztz getHead() {
		return head;
	}

	//打开实体整体处置办理单
	public String showStztczBLD(){
		List<CzStcztz> historyHeadList = new ArrayList<CzStcztz>();
		PTUserBO user = userUCC.getSingleById(UserThreadLocal.get().getUserTid());
		String headId = (String)request.getAttribute("headId");
		if(StringUtils.isNotEmpty(headId)){
			head = headService.viewDraft(headId);
			historyHeadList = headService.getHisttoryHeadList(head.getId(),head.getBianhao());
		}else if(head != null){
			head = headService.viewDraft(head.getId());
			historyHeadList = headService.getHisttoryHeadList(head.getId(),head.getBianhao());
		}
		request.setAttribute("user", user);
		request.setAttribute("bldType", "stztcz");
		request.setAttribute("historyHeadList", historyHeadList);
		request.setAttribute("fblsjStr", head.getFblsjStr());
		return "showStztczBLD";
	}
	
	//打开实体人员安置办理单
	public String showStayazBLD(){
		List<CzStcztz> historyHeadList = new ArrayList<CzStcztz>();
		PTUserBO user = userUCC.getSingleById(UserThreadLocal.get().getUserTid());
		String headId = (String)request.getAttribute("headId");
		if(StringUtils.isNotEmpty(headId)){
			head = headService.viewDraft(headId);
			historyHeadList = headService.getHisttoryHeadList(head.getId(),head.getBianhao());
		}else if(head != null){
			head = headService.viewDraft(head.getId());
			historyHeadList = headService.getHisttoryHeadList(head.getId(),head.getBianhao());
		}
		request.setAttribute("user", user);
		request.setAttribute("bldType", "stayaz");
		request.setAttribute("historyHeadList", historyHeadList);
		request.setAttribute("fblsjStr", head.getFblsjStr());
		return "showStayazBLD";
	}
	
	//打开资产处置办理单
	public String showZcczBLD(){
		//办理历史
		List<CzCztzfaXx> historyHeadList = new ArrayList<CzCztzfaXx>();
		PTUserBO user = userUCC.getSingleById(UserThreadLocal.get().getUserTid());
		String headId = (String)request.getAttribute("headId");
		if(StringUtils.isEmpty(headId))
			headId = request.getParameter("headId");
		if(StringUtils.isNotEmpty(headId)){
			this.disposeHead = headUCC.findHeadVOById(headId);
			historyHeadList = iAssetDealHeadUCC.findHistoryBlInfo(disposeHead.getId());
		}
		if (disposeHead != null) {
			request.setAttribute("zclbList", disposeHead.getZclbList());
		}
		if(StringUtils.isNotEmpty(disposeHead.getZclb())){
			if(",".equals(disposeHead.getZclb().charAt(disposeHead.getZclb().length()-1))){
				disposeHead.setZclb(disposeHead.getZclb().substring(0, disposeHead.getZclb().length()-1));
			}
		}
		request.setAttribute("user", user);
		request.setAttribute("bldType", "zccz");
		request.setAttribute("disposeHead", disposeHead);
		request.setAttribute("historyHeadList", historyHeadList);
		request.setAttribute("fblsjStr", disposeHead.getFblsjStr());
		request.setAttribute("czfsJson", headUCC.getCzfsJson());
		return "showZcczBLD";
	}
	
	public String openAdvice(){
		String zcczlb = request.getParameter("zcczlb");
		try{
			if(StringUtils.equals(zcczlb, "zccz")){
				//查询CzCztzfaXx对象
				disposeHead = headUCC.findHeadVOById(head.getId());
				request.setAttribute("xmmc", disposeHead.getCztzxmmc());
			}else{
				head = headService.viewDraft(head.getId());
				request.setAttribute("xmmc", head.getCzxmmc());
			}
			advice = bldService.viewAdvice(head.getId());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "openAdvice";
	}
	
	public String saveAdvice(){
		try{
			bldService.saveAdvice(advice);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public CztzfaXxVO getDisposeHead() {
		return disposeHead;
	}

	public void setDisposeHead(CztzfaXxVO disposeHead) {
		this.disposeHead = disposeHead;
	}
}
