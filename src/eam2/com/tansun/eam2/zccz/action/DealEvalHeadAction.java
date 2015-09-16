package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignParticipantBO;
import com.tansun.eam2.common.workflow.pgsc.service.ETPgscCounterSignBS;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IDealEvalHeadService;
import com.tansun.eam2.zccz.vo.PgscVO;
import com.tansun.eam2.zccz.vo.ScyjVo;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.vo.ETCommonOpinionVO;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
import com.tansun.rdp4j.workflow.task.service.PTCommonOpinionBS;

public class DealEvalHeadAction extends CommonAction {
	Log log = LogFactory.getLog(this.getClass());
	private String radioValue;
	private CzPgscZskwhCld head;
	private ScyjVo pgscYj;
	private PgscVO pgvo;
	private IUserUCC userUCC;
	private IDeptUCC deptUCC;
	private IDealEvalHeadService headService;
	@Autowired
	ETPgscCounterSignBS pgscCounterSignBS;
	@Autowired
	DeptBSimpl deptBSimpl;

	public ScyjVo getPgscYj() {
		return pgscYj;
	}

	public void setPgscYj(ScyjVo pgscYj) {
		this.pgscYj = pgscYj;
	}

	public CzPgscZskwhCld getHead() {
		return head;
	}

	/**
	 * 新建入口
	 * 
	 * @return
	 */
	public String newHead() {
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		Iterator<PTDeptBO> deptIte = deptUCC.getDeptByUserId(user.getTid())
				.iterator();
		// 如果head不为空，创建一个对象保存
		if (head == null) {
			head = new CzPgscZskwhCld();
			head.setNigaoren(String.valueOf(user.getTid()));
			head.setNigaorenxm(user.getUsername());
			head.setNgrq(new Date());
			head.setPgzz(0D);
			head.setZczmjz(0D);
			head.setZjfd(0D);
			head.setZjz(0D);
			head.setJzrzmjz(0D);
			head.setZczmyz(0D);
			head.setCldzt("0");
			if (deptIte.hasNext()) {
				PTDeptBO dept = deptIte.next();
				head.setNgbm(String.valueOf(dept.getRsvdNum1()));
				head.setNgbmmc(dept.getRsvdStr1());
			}
			head.setLxdh(user.getCellphone());
			head.setLssccs(0L);
			// 设置默认的办理部门为风险管理部
			head.setBlbm("风险管理部");
			head.setBlbmbh("11589");
			headService.newHead(head);
			request.setAttribute("headId", head.getId());
			request.getSession().setAttribute("zcczpgscclid", head.getId());
		}
		// request.setAttribute("head", head);
		request.setAttribute("user", user);
		return "tomodify";
	}

	// 保存head
	public String saveHead() {
		try {
			headService.updateHead(head);
			request.setAttribute("headId", head.getId());
			this.request.setAttribute(WorkflowAction.PT_DRAFT, this
					.headToPTDraft(head));
			this.request.setAttribute(WorkflowAction.PT_TODO, this
					.headToPTTodo(head));
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return "toWorkflow";
	}

	// 办结流程处理
	public String endHead() {
		try {
			headService.updateHead(head);
			// 把资产信息复制到资产评估信息表中
			headService.copyPgxx(head.getId());
			request.setAttribute("headId", head.getId());
			response.getWriter().print("SUCCESS_END");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	private PTTodo headToPTTodo(CzPgscZskwhCld head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		if (StringUtils.isNotEmpty(head.getBianhao()))
			todo.setSheetId(head.getBianhao());
		todo.setHeadType(ZcczCommon.PROCESS_NAME_PGSC);
		todo.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		return todo;
	}

	private PTDraft headToPTDraft(CzPgscZskwhCld head) {
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setTitle(head.getBiaoti());
		draft.setDeptId(Long.parseLong(head.getNgbm()));
		draft.setHeadType(ZcczCommon.PROCESS_NAME_PGSC);
		draft.setSubsystem(GlobalVariable.ASSET_DISPOSE_SUBSYSTEM);
		if (StringUtils.isNotEmpty(head.getNgbm()))
			draft.setDeptId(Long.parseLong(head.getNgbm()));
		return draft;
	}

	public String modifyHead() {
		String headId = (String) request.getAttribute("headId");
		String ishistory = "";
		if (StringUtils.isEmpty(headId))
			headId = request.getParameter("headId");
		if (headId.length() > 35) {
			String[] head = headId.split(",");
			headId = head[0];
			ishistory = head[1];
		}
		request.setAttribute("ishistory", ishistory);
		if (StringUtils.isNotEmpty(headId))
			head = headService.getHeadById(headId);
		// 如果评估资产类别为实体内资产，需要查询评估资产类别
		if (StringUtils.equals(head.getPgzclb(), "1")) {
			// 查询实体id
			String stId = headService.getStIdByCldId(head.getId());
			if (StringUtils.isNotEmpty(stId)) {
				String zixunType = headService.getStlxById(stId);
				request.setAttribute("zixunType", zixunType);
			}
		}
		request.getSession().setAttribute("zcczpgscclid", head.getId());
		request.setAttribute("userTid", head.getNigaoren());
		if ("true".equals(ishistory)) {
			List commonOpinionVOList = this.pgscCounterSignBS
					.findCommonOpinionVOList(headId,
							CommonGlobal.OPINION_YJYLX_MEETING, 0);
			List snedBackCommonOpinionVOList = this.pgscCounterSignBS
					.findCommonOpinionVOList(headId,
							CommonGlobal.OPINION_YJYLX_HQTH, 1);
			List finalCommonOpinionVOList = this.pgscCounterSignBS
					.findCommonOpinionVOList(headId,
							CommonGlobal.OPINION_YJYLX_HQZZ, 1);
			request.setAttribute("gcOpinionVOList", commonOpinionVOList);
			request.setAttribute("snedBackCommonOpinionVOList",
					snedBackCommonOpinionVOList);
			request.setAttribute("finalCommonOpinionVOList",
					finalCommonOpinionVOList);

			PTDeptBO dept = new PTDeptBO();
			if (commonOpinionVOList.size() > 0) {
				ETCommonOpinionVO op = (ETCommonOpinionVO) commonOpinionVOList
						.get(0);
				dept = op.getPTDeptBO();
			} else if (snedBackCommonOpinionVOList.size() > 0) {
				ETCommonOpinionVO op = (ETCommonOpinionVO) snedBackCommonOpinionVOList
						.get(0);
				dept = op.getPTDeptBO();
			} else if (finalCommonOpinionVOList.size() > 0) {
				ETCommonOpinionVO op = (ETCommonOpinionVO) finalCommonOpinionVOList
						.get(0);
				dept = op.getPTDeptBO();
			}
			request.setAttribute("dept", dept);
		}
		return "newHead";
	}

	public String updateJlxz() {
		try {
			String jlxz = request.getParameter("jlxz");
			String headId = request.getParameter("headId");
			headService.updateJlxz(headId, jlxz);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 取得head转换出来的Json串
	public String getHeadJson() {
		try {
			CzPgscZskwhCld cld = headService.getHeadById(head.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(JSONObject.fromObject(cld).toString());
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 显示办理单
	public String showBld() {
		if (head != null && StringUtils.isNotEmpty(head.getId()))
			head = headService.getHeadById(head.getId());
		return "showBld";
	}

	// 提交及查看审查意见
	public String editScyjSubmit() {
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		headService.getUserLX(pgscYj.getCldId(), String.valueOf(user.getTid()));// 得到当前用户的角色，来互相带意见
		radioValue = headService.findRadioValue(pgscYj.getCldId(), String
				.valueOf(user.getTid()));
		request.setAttribute("user", user);
		return "editScyj";
	}

	// 查看审查意见
	public String editScyjQuery() {
		IUser tuser = UserThreadLocal.get();
		PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
		radioValue = headService.findRadioValue(pgscYj.getCldId(), String
				.valueOf(user.getTid()));
		request.setAttribute("user", user);
		return "editScyj";
	}

	// 取得处理单对应的审查意见Json
	public String getMyScyjJson() {
		try {
			IUser tuser = UserThreadLocal.get();
			String returnJson = headService.getMyScyjJson(pgscYj.getCldId(),
					String.valueOf(tuser.getUserTid()));
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnJson);
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 取得已提交的审查意见Json
	public String getScyjSubmitJson() {
		try {
			String returnJson = headService
					.getSubmitScyjJson(pgscYj.getCldId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnJson);
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 保存审查意见
	public String submitScyj() {
		try {
			IUser tuser = UserThreadLocal.get();
			String adviceType = request.getParameter("adviceType");
			headService.submitScyj(pgscYj, String.valueOf(tuser.getUserTid()),
					adviceType);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 修改意见
	public String updateScyj() {
		try {
			if (pgscYj == null)
				pgscYj = new ScyjVo();
			pgscYj.setId(request.getParameter("id"));
			pgscYj.setScxmText(request.getParameter("scxmText"));
			pgscYj.setScydText(request.getParameter("scydText"));
			pgscYj.setJtyjText(request.getParameter("jtyjText"));
			headService.updateScyj(pgscYj);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 新增意见
	public String insertScjl() {
		try {
			IUser tuser = UserThreadLocal.get();
			PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
			headService.addScjl(pgscYj, user);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 从历史提交意见中选择几条为本次的意见
	public String selectScjl() {
		try {
			IUser tuser = UserThreadLocal.get();
			PTUserBO user = userUCC.getSingleById(tuser.getUserTid());
			String historyIds = request.getParameter("historyIds");
			headService.addScjl(pgscYj, user, historyIds);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 删除审查意见
	public String delScyj() {
		try {
			String ids = request.getParameter("ids");
			headService.delScyj(ids);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 生成表单编号
	public String generatorBianhao() {
		try {
			head = headService.getHeadById(head.getId());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(
					headService.generatorBianhao(head.getId(), head.getNgbm(),
							head.getNgbmmc()));
			// response.getWriter().print("编号");
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	/**
	 * 修改意见 add by 陈煜霄
	 * 
	 * @return
	 */
	public String editMessage1() {
		String yjId = request.getParameter("bodyId");
		String ydId = headService.findParentByChild(yjId);
		String xmId = headService.findParentByChild(ydId);
		String yjText = headService.findValueById(yjId);
		String ydText = headService.findValueById(ydId);
		String xmText = headService.findValueById(xmId);
		if (xmText == null || "null".equals(xmText) || xmText == "null") {
			xmText = "";
		}
		if (ydText == null || "null".equals(ydText) || ydText == "null") {
			ydText = "";
		}
		if (yjText == null || "null".equals(yjText) || yjText == "null") {
			yjText = "";
		}
		pgvo = new PgscVO();
		pgvo.setScxmId(xmId);
		pgvo.setScxmText(xmText);
		pgvo.setScydId(ydId);
		pgvo.setScydText(ydText);
		pgvo.setJtyjId(yjId);
		pgvo.setJtyjText(yjText);
		return "editMessage1";
	}

	public String updatePgsc() throws IOException {
		String yjId = request.getParameter("yjId");
		String ydId = request.getParameter("ydId");
		String xmId = request.getParameter("xmId");
		String yjText = request.getParameter("yjText");
		String ydText = request.getParameter("ydText");
		String xmText = request.getParameter("xmText");
		headService.updateValueById(yjId, yjText);
		headService.updateValueById(ydId, ydText);
		headService.updateValueById(xmId, xmText);
		request.setAttribute("message", "修改成功");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功");
		return null;
	}

	public void setHead(CzPgscZskwhCld head) {
		this.head = head;
	}

	@Autowired
	public void setHeadService(IDealEvalHeadService headService) {
		this.headService = headService;
	}

	@Autowired
	public void setUserUCC(IUserUCC userUCC) {
		this.userUCC = userUCC;
	}

	@Autowired
	public void setDeptUCC(IDeptUCC deptUCC) {
		this.deptUCC = deptUCC;
	}

	public PgscVO getPgvo() {
		return pgvo;
	}

	public void setPgvo(PgscVO pgvo) {
		this.pgvo = pgvo;
	}

	public String getRadioValue() {
		return radioValue;
	}

	public void setRadioValue(String radioValue) {
		this.radioValue = radioValue;
	}

}
