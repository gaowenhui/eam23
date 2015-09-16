package com.tansun.eam2.zccz.action;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.util.ESBBean;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.portal.PortalService;
import com.tansun.eam2.zccz.ucc.IApproveAdviceUCC;
import com.tansun.eam2.zccz.ucc.IAssetDealHeadUCC;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.eam2.zccz.vo.CztzfaXxVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTTodo;

public class ApproveAdviceAction extends CommonAction {

	private CzXmxxLsbVO xmxxLsb;
	private CzXmSpwYj czXmSpwYj;
	private CzStcztz head;
	private CztzfaXxVO disposeHead;
	private String hyId;
	private IUserUCC userUCC;
	private IApproveAdviceUCC appAdUCC;
	public IAssetDealHeadUCC assetDealHeadUCCImpl;
	@Autowired
	private IDealToDoUCC dealToDoUCC;
	@Autowired
	public void setAssetDealHeadUCCImpl(IAssetDealHeadUCC assetDealHeadUCCImpl) {
		this.assetDealHeadUCCImpl = assetDealHeadUCCImpl;
	}

	public CztzfaXxVO getDisposeHead() {
		return disposeHead;
	}

	public void setDisposeHead(CztzfaXxVO disposeHead) {
		this.disposeHead = disposeHead;
	}

	@Autowired
	public void setAppAdUCC(IApproveAdviceUCC appAdUCC) {
		this.appAdUCC = appAdUCC;
	}
	
	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}
	
	public CzXmSpwYj getCzXmSpwYj() {
		return czXmSpwYj;
	}
	public void setCzXmSpwYj(CzXmSpwYj czXmSpwYj) {
		this.czXmSpwYj = czXmSpwYj;
	}
	public CzXmxxLsbVO getXmxxLsb() {
		return xmxxLsb;
	}
	public void setXmxxLsb(CzXmxxLsbVO xmxxLsb) {
		this.xmxxLsb = xmxxLsb;
	}

	public CzStcztz getHead() {
		return head;
	}
	public void setHead(CzStcztz head) {
		this.head = head;
	}
	
	//意见表单
	public String adviceForm(){
		try{
			IUser iuser = UserThreadLocal.get();
			PTUserBO user = userUCC.getSingleById(iuser.getUserTid());
			czXmSpwYj = appAdUCC.getCzXmSpwYjByXmIdWyId(czXmSpwYj.getXmId(),String.valueOf(iuser.getUserTid()));
			hyId = request.getParameter("hyId");
			if(StringUtils.equals("0",czXmSpwYj.getSftjspyj())){
				czXmSpwYj.setTyyjsj(new Date());
			}
			request.setAttribute("user", user);
			request.setAttribute("czXmSpwYj", czXmSpwYj);
			xmxxLsb = appAdUCC.getXmxxByXmId(czXmSpwYj.getXmId());
			if(StringUtils.equals("3", xmxxLsb.getFenlei())){
				head = appAdUCC.getHeadByXiangmuId(czXmSpwYj.getXmId());
				return "stztczAdviceForm";
			}else if(StringUtils.equals("4", xmxxLsb.getFenlei())){
				head = appAdUCC.getHeadByXiangmuId(czXmSpwYj.getXmId());
				return "stayazAdviceForm";
			}else if(StringUtils.indexOfAny(xmxxLsb.getFenlei(), new String[]{"0","1","2","6","7","8","9","10"}) != -1){
				CzCztzfaXx temp = appAdUCC.getDisposeHeadByAdviceId(czXmSpwYj.getId());
				if(temp != null){
					disposeHead = assetDealHeadUCCImpl.findHeadVOById(temp.getId());
				}
				request.setAttribute("czfsJson", assetDealHeadUCCImpl.getCzfsJson());
				return "zcczAdviceForm";
			}else if(StringUtils.equals("5", xmxxLsb.getFenlei())){
				head = appAdUCC.getHeadByXiangmuId(czXmSpwYj.getXmId());
				return "cjtzAdviceForm";
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String submitAdvice(){
		try{
			String todoId = request.getParameter("todoId");
			PTTodo todo = null;
			if(!todoId.equals("")){
				todo = dealToDoUCC.getPTTodoById(todoId);
			}
			appAdUCC.update6Items(czXmSpwYj);
			if(appAdUCC.isAllYjTjInXm(czXmSpwYj.getId())){
				appAdUCC.todoToDid(todoId);
			}
			PortalService portal = new PortalService();
			String flag = "true";
			if(todo != null && "委员审批".equals(todo.getTaskName())){
				ESBBean esbBean = (ESBBean)SpringContextHelper.getBean("esbBean");
				portal.setPrefix(esbBean.getEsb());
				flag = esbBean.getMode();
				if(!"true".equals(flag)){
//					PTTodo todo = dealToDoUCC.getPTTodoById(todoId);
					if(todo != null){
						portal.completeTask(todo.getTaskId(), UserCache.getLoginId(todo.getUserId()));
//						todo.getUperTaskId(), UserCache.getLoginId(todo.getSendUserId())
					}
				}
			}
			
			response.getWriter().print("SUCCESS");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String showJibenxinxi(){
		IUser iuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(iuser.getUserTid());
		String xiangmuId = request.getParameter("itemId");
		String jibenxinxiType = request.getParameter("jibenxinxiType");
		head = appAdUCC.getHeadByXiangmuId(xiangmuId);
		CzCztzfaXx tempBO = appAdUCC.getDisposeHeadByXiangmuId(xiangmuId);
		if(tempBO != null){
			tempBO.copyVO(disposeHead);
		}
		request.setAttribute("user", user);
		if(StringUtils.equals("stztcz", jibenxinxiType)){
			return "stztczJibenxinxi";
		}else if(StringUtils.equals("stayaz", jibenxinxiType)){
			return "stayazJibenxinxi";
		}else if(StringUtils.equals("zccz", jibenxinxiType)){
			return "zcczJibenxinxi";
		}
		return null;
	}

	public IDealToDoUCC getDealToDoUCC() {
		return dealToDoUCC;
	}

	public void setDealToDoUCC(IDealToDoUCC dealToDoUCC) {
		this.dealToDoUCC = dealToDoUCC;
	}
}
