package com.tansun.eam2.zccz.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.ucc.IItemShUCC;
import com.tansun.eam2.zccz.vo.CzXmSpwYjVO;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.common.vo.WorkflowVO;

public class XmshAction extends CommonAction {

	private CzXmxxLsbVO xmXXVO = new CzXmxxLsbVO();
	// 处置项目信息临时表id
	private String itemId;

	private CzCztzfaXx czCztzfaXx;

	private List<CzXmSpwYjVO> finalList = new ArrayList<CzXmSpwYjVO>();

	private PTUserBO user;

	@Autowired
	private IDealToDoUCC iDealToDoUCC;

	@Autowired
	private IItemShUCC itemShUCCImpl;

	@Autowired
	private IUserUCC userUCC;

	@Autowired
	private IDeptUCC deptUCC;

	private WorkflowUtil wf;

	/**
	 * 保存项目上会信息
	 * 
	 * @return
	 */
	public String saveItemMeetingInfo() {
		// 保存上会信息
		itemShUCCImpl.saveCzXmxxLsb(xmXXVO);
		System.out.println("XmshAction.saveItemMeetingInfo....Result:"
				+ request.getParameter("result"));
		return "toWorkflow";
	}

	public String openIndexPage() {
		IUser tuser = UserThreadLocal.get();
		user = userUCC.getSingleById(tuser.getUserTid());
		request.setAttribute("user", user);
		String headId = (String) this.request.getAttribute("headId");
		// 根据处理单id查询项目id
		String itemId = this.itemShUCCImpl.findItemIdByCldId(headId);
		request.setAttribute("itemId", itemId);
		request.setAttribute("headId", headId);
		request.setAttribute("user", user);
		return "xmIndex";
	}

	// 查询上会信息
	public String modifyShInfo() {
		try {
			IUser tuser = UserThreadLocal.get();
			user = userUCC.getSingleById(tuser.getUserTid());
			String headId = (String) this.request.getAttribute("headId");
			if (StringUtils.isEmpty(headId))
				headId = request.getParameter("headId");
			// 根据处理单id查询项目id
			String itemId = this.itemShUCCImpl.findItemIdByCldId(headId);
			CzXmxxLsb czXmxxLsb = itemShUCCImpl.findCzXmxxById(itemId);
			request.setAttribute("fenlei", czXmxxLsb.getFenlei());
			String hyid = czXmxxLsb.getHyId();
			xmXXVO.copyProperties(czXmxxLsb);
			// 根据处理单id查询审批委员
			List<CzXmSpwYj> list = this.iDealToDoUCC.findSpwyByLsbId(itemId,
					ZcczCommon.DEALTODO_SPWY);
			List<CzXmSpwYj> list1 = this.iDealToDoUCC.findSpwyByLsbId(itemId,
					ZcczCommon.DEALTODO_ZCR);
			String spwyStr = "";
			String spwyIdStr = "";
			String spzcrStr = "";
			String spzcrIdStr = "";
			for (CzXmSpwYj spwyTemp : list) {
				spwyStr += spwyTemp.getSpwyxm() + ",";
				spwyIdStr += spwyTemp.getSpwy() + ",";
			}
			for (CzXmSpwYj spzcrTemp : list1) {
				spzcrStr += spzcrTemp.getSpwyxm() + ",";
				spzcrIdStr += spzcrTemp.getSpwy() + ",";
			}
			if (StringUtils.isNotEmpty(spwyStr)) {
				spwyStr = spwyStr.substring(0, spwyStr.length() - 1);
				spwyIdStr = spwyIdStr.substring(0, spwyIdStr.length() - 1);
			}
			if (StringUtils.isNotEmpty(spzcrStr)) {
				spzcrStr = spzcrStr.substring(0, spzcrStr.length() - 1);
				spzcrIdStr = spzcrIdStr.substring(0, spzcrIdStr.length() - 1);
			}
			xmXXVO.setSpwys(spwyStr);
			xmXXVO.setSpwyId(spwyIdStr);
			xmXXVO.setSpzcr(spzcrStr);
			xmXXVO.setSpzcrId(spzcrIdStr);
			request.setAttribute("itemId", itemId);
			request.setAttribute("headId", headId);
			request.setAttribute("user", user);
			CzHyxx hy = iDealToDoUCC.findHyxxById(hyid);
			xmXXVO.setSpsj(hy.getSpsj());
			xmXXVO.setHycs(hy.getHycs());
			xmXXVO.setCSpfs(hy.getCSpfs());
		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error(e.fillInStackTrace());
			}
		}
		return "xmIndex";
	}

	/**
	 * 查询项目上会信息
	 * 
	 * @return
	 */
	public String viewItemMeetingInfo() {
		String headId = this.request.getParameter("headId");
		// 根据处置项目信息临时表id查询项目信息
		String itemId = this.itemShUCCImpl.findItemIdByCldId(headId);
		xmXXVO = itemShUCCImpl.findCzXmxxById(itemId);
		if (xmXXVO.getYjhzr() == null) {
			// 意见汇总人默认为是当前登录人
			xmXXVO.setYjhzr((user.getTid()).toString());
			xmXXVO.setYjhzrxm(user.getUsername());
		}
		return "viewItemMeetingInfo";
	}

	public String updateCzXmxxLsbById() {
		String id = request.getParameter("id");
		itemShUCCImpl.updateCzXmxxLsbById(id);
		return null;
	}

	public String viewSummarySuggestions() {
		String headId = (String) this.request.getAttribute("headId");
		if (StringUtils.isEmpty(headId))
			headId = request.getParameter("headId");
		// 根据处理单id查询项目id
		String itemId = this.itemShUCCImpl.findItemIdByCldId(headId);
		// 根据处置项目信息临时表id查询项目信息
		xmXXVO = itemShUCCImpl.findCzXmxxById(itemId);
		// CommonBO bo = itemShUCCImpl.getHeadByIdAndFeilei(headId,
		// xmXXVO.getFenlei());
		// 根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
		List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemId);
		Long agreeCount = 0l;
		Long disagreeCount = 0l;
		if (list != null && list.size() > 0) {
			for (CzXmSpwYj temp : list) {
				CzXmSpwYjVO tempVO = new CzXmSpwYjVO();
				tempVO.copyProperties(temp);
				if (ZcczCommon.DEALTODO_SPWY.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批委员");
				else if (ZcczCommon.DEALTODO_ZCR.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批主持人");
				if (temp.getButongyi() != null && temp.getButongyi() == 1) {
					tempVO.setDisagreeStr("不同意");
					disagreeCount += 1;
				}
				if (temp.getTongyi() != null && temp.getTongyi() == 1) {
					tempVO.setAgreeStr("同意");
					agreeCount += 1;
				}
				xmXXVO.setAgreeCount(agreeCount);
				xmXXVO.setDisagreeCount(disagreeCount);
				finalList.add(tempVO);
			}
			// 承继投资设定审批结论
			WorkflowVO workflowVO = (WorkflowVO) request
					.getAttribute("workflowVO");
			if (StringUtils.equals(workflowVO.pdk, "cjtz_shenpi")) {
				if ((agreeCount - disagreeCount) > disagreeCount && // 同意人数超过2/3
						(itemShUCCImpl.getTzwyCount() - agreeCount) < agreeCount) {// 并且同意人数超过所有审批委员的1/2
					xmXXVO.setSpjl("1");
				} else {
					xmXXVO.setSpjl("0");
				}
			}
			// 承继投资设定审批结论
		}
		request.setAttribute("itemId", itemId);
		return "summarySuggestions";
	}

	public String saveSummarySuggestions() {
		String taskId = (String) request.getParameter("taskId");
		CzXmxxLsb xXBO = itemShUCCImpl.findCzXmxxLsbById(xmXXVO.getId());
		xXBO.setSpjl(xmXXVO.getSpjl());
		xXBO.setSfba(xmXXVO.getSfba());
		xXBO.setCzsx(xmXXVO.getCzsx());
		this.itemShUCCImpl.saveSummarySugg(xXBO);
		if (StringUtils.isNotEmpty(taskId)) {
			wf.putVariables(taskId, "xmId", xXBO.getId());
			wf.putVariables(taskId, "headId", xXBO.getCldId());
		}
		return "toWorkflow";
	}

	public String endSummarySuggestions() {
		try {
			String taskId = (String) request.getParameter("taskId");
			CzXmxxLsb xXBO = itemShUCCImpl.findCzXmxxLsbById(xmXXVO.getId());
			xXBO.setSpjl(xmXXVO.getSpjl());
			xXBO.setSfba(xmXXVO.getSfba());
			xXBO.setZhuangtai("7");
			this.itemShUCCImpl.saveSummarySugg(xXBO);
			itemShUCCImpl.updateScheadId(xXBO);
			if (StringUtils.isNotEmpty(taskId))
				wf.putVariables(taskId, "xmId", xXBO.getId());
			response.getWriter().print("SUCCESS_END");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 查看项目信息，包括处置的资产和处置项目
	public String viewItemAndAsset() {
		String cldId = (String) request.getParameter("cldId");
		String itemType = (String) request.getParameter("itemType");
		request.setAttribute("cldId", cldId);
		request.setAttribute("itemType", itemType);
		// 实体整体处置
		if (StringUtils.equals(itemType, ZcczCommon.ITEM_FOR_ENTITY)) {

		} else if (StringUtils.equals(itemType,
				ZcczCommon.ITEM_FOR_ENTITY_PERSON)) {

		} else {

		}
		return "";
	}

	public CzXmxxLsbVO getXmXXVO() {
		return xmXXVO;
	}

	public void setXmXXVO(CzXmxxLsbVO xmXXVO) {
		this.xmXXVO = xmXXVO;
	}

	public CzCztzfaXx getCzCztzfaXx() {
		return czCztzfaXx;
	}

	public void setCzCztzfaXx(CzCztzfaXx czCztzfaXx) {
		this.czCztzfaXx = czCztzfaXx;
	}

	public IItemShUCC getItemShUCCImpl() {
		return itemShUCCImpl;
	}

	public void setItemShUCCImpl(IItemShUCC itemShUCCImpl) {
		this.itemShUCCImpl = itemShUCCImpl;
	}

	public IUserUCC getUserUCC() {
		return userUCC;
	}

	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	public IDeptUCC getDeptUCC() {
		return deptUCC;
	}

	public void setDeptUCC(IDeptUCC deptUCC) {
		this.deptUCC = deptUCC;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public List<CzXmSpwYjVO> getFinalList() {
		return finalList;
	}

	public void setFinalList(List<CzXmSpwYjVO> finalList) {
		this.finalList = finalList;
	}

	@Autowired
	public void setWf(WorkflowUtil wf) {
		this.wf = wf;
	}

	public IDealToDoUCC getIDealToDoUCC() {
		return iDealToDoUCC;
	}

	public void setIDealToDoUCC(IDealToDoUCC dealToDoUCC) {
		iDealToDoUCC = dealToDoUCC;
	}

}
