package com.tansun.eam2.kpgl.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.kpgl.KpglCommon;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.RoleVO;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
public class CardHeadAction extends CommonAction {
	private CaShead head;
	private LcCardtemp body;
	private String sheetType;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
    private IUserUCC iUserUCCimpl;
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator iCodeGenerator;
	@Autowired
	private WorkflowUtil workflowutil;
	@Autowired
	private IAssetUCC assetUCCImpl;
	
	/**
	 * 进入卡片新增处理单页面
	 */
	public String newHead() {
		String sheetType = request.getParameter("sheetType");// sheetType为操作类型，根据操作类型进入不同处理单页面
		head = new CaShead();
		if ("add".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDADD);
		} else if ("reduce".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDREDUCE);
		} else if ("devalue".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDDEVALUE);
		} else if ("merge".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDMERGE);
		} else if ("split".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDSPLIT);
		} else if ("modify".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDMODIFY);
		} else if ("change".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDCHANGE);
		} else if ("allocate".equals(sheetType)) {
			head.setBdlx(KpglCommon.KP_CZTYPE_CARDALLOCATE);
		}
		
		//得到登录人的信息
		//设置默认值
		head.setNgrq(new Date());
		IUser user=UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(user.getUserTid());
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		List roleList = user.getRoleList();
		String isZuzhang = "false";
		if(roleList!=null){
			for(int i=0;i<roleList.size();i++){
				RoleVO role = (RoleVO) roleList.get(i);
				Long tid = role.getTid();
				if(tid==126l){
					isZuzhang = "true";//如果是组长，那么跳出
					break;
				}
			}
		}
		cardCommonUCCImpl.save(head);// 保存一条空数据，得到处理单ID
		// head.setNgr(ngr)
		request.setAttribute("isZuzhang", isZuzhang);
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", String.valueOf(head.getId()));
		request.setAttribute("sfzy", head.getZykpxz() == null ? "" : head.getZykpxz());
		request.setAttribute("zjfs", head.getZjfs() == null ? "" : head.getZjfs());
		return "tomodify";
	
	}

	/**
	 * 显示修改信息,
	 */
	public String modifyHead() {
		// 获得表头ID
		String headId = (String)request.getAttribute("headId");
		if(headId==null||"".equals(headId)){
			headId = request.getParameter("headId");
		}
		if(headId==null||"".equals(headId)||"null".equals(headId)){
			headId = request.getParameter("head.id");
		}
		// 在数据库中检索出表头信息，返回到页面表头
		head = cardCommonUCCImpl.findCaSheadById(headId);
		String bdlx = head.getBdlx();
		sheetType = this.getType(bdlx);
		request.setAttribute("headId", headId);
		request.setAttribute("userTid", String.valueOf(head.getNgr()));
		return sheetType;
	}

	/**
	 * 保存新增卡片处理单信息,表头
	 */
	public String saveHead() {
		String sheetType = request.getParameter("sheetType");
		String headId = String.valueOf(head.getId());
		CaShead head1 = cardCommonUCCImpl.findCaSheadById(headId);
		head1.setBianhao(head.getBianhao());
		head1.setBiaoti(head.getBiaoti());
		head1.setBz(head.getBz());
		head1.setKpblsm(head.getKpblsm());
		head1.setLxdh(head.getLxdh());
		if(head.getJhcd()!=null){
			head1.setJhcd(head.getJhcd());
		}
		if(head.getZjfs()!=null){
			head1.setZjfs(head.getZjfs());
		}
		if(head.getZykpxz()!=null){
			head1.setZykpxz(head.getZykpxz());
		}
		if(head.getBianhao()!=null){
			head1.setBianhao(head.getBianhao());
		}
		cardCommonUCCImpl.update(head1);

		this.request.setAttribute(WorkflowAction.PT_DRAFT, 
				this.headToPTDraft(head)
			);
		this.request.setAttribute(WorkflowAction.PT_TODO, 
			this.headToPTTodo(head)
			);
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", String.valueOf(head.getId()));
		request.setAttribute("sfzy", head.getZykpxz() == null ? "" : head.getZykpxz());
		request.setAttribute("zjfs", head.getZjfs() == null ? "" : head.getZjfs());
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		if(StringUtils.isNotEmpty(taskId)){
			// 取得当前用户
			IUser user=UserThreadLocal.get();
			//取得当前用户所在的所有部门
			List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
			PTDeptBO dept = null;
			if(list!=null&&list.size()>0){
	            dept = list.get(0);
			}
			String codeType = "";
			if (KpglCommon.KP_CZTYPE_CARDADD.equals(head.getBdlx())) {
				codeType="kpzj";
			} else if (KpglCommon.KP_CZTYPE_CARDREDUCE.equals(head.getBdlx())) {
				codeType="kpjs";
			} else if (KpglCommon.KP_CZTYPE_CARDDEVALUE.equals(head.getBdlx())) {
				codeType="kpjz";
			} else if (KpglCommon.KP_CZTYPE_CARDMERGE.equals(head.getBdlx())) {
				codeType="kphb";
			} else if (KpglCommon.KP_CZTYPE_CARDSPLIT.equals(head.getBdlx())) {
				codeType="kpcf";
			} else if (KpglCommon.KP_CZTYPE_CARDMODIFY.equals(head.getBdlx())) {
				codeType="kpxg";
			} else if (KpglCommon.KP_CZTYPE_CARDCHANGE.equals(head.getBdlx())) {
				codeType="kpbd";
			} else if (KpglCommon.KP_CZTYPE_CARDALLOCATE.equals(head.getBdlx())) {
				codeType="kptp";
			}
			workflowutil.putVariables(taskId, "codeType", codeType);
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", String.valueOf(head1.getNgbm()));
		}
		//====================编号作废所需参数
		return "toWorkflow";
	}

	/**
	 * 刷新新增卡片处理单信息,表头，暂时无用
	 */
	public String reloadHead() {
		String sheetType = request.getParameter("sheetType");
		String headId = request.getParameter("headId");
		head = cardCommonUCCImpl.findCaSheadById(headId);
		head.setNgrq(new Date());
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", headId);
		request.setAttribute("sfzy", head.getZykpxz() == null ? "" : head.getZykpxz());
		return sheetType;
	}

	/**
	 * 删除处理单信息,
	 */
	public String deleteHead() {
		String sheetType = request.getParameter("sheetType");
		cardCommonUCCImpl.delete(head);
		return sheetType;
	}

	/**
	 * 显示处理单信息,
	 */
	public String viewHead() {
		return "";
	}

	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CaShead head){
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		todo.setSheetId(head.getBianhao());
		todo.setSubsystem(GlobalVariable.CARD_SUBSYSTEM);
		return todo;
	}
	
	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CaShead head){
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId().toString());
		draft.setHeadType(head.getBdlx());
		draft.setTitle(head.getBiaoti());
		draft.setDeptId(head.getNgbm());
		draft.setSubsystem(GlobalVariable.CARD_SUBSYSTEM);
		return draft;
	}
	
	/**
	 * 获得表单类型
	 * @param bdlx
	 * @return
	 */
	private String getType(String bdlx){
		String sheetType = "";
		if(KpglCommon.KP_CZTYPE_CARDADD.equals(bdlx)){
			sheetType = "add";
		} if(KpglCommon.KP_CZTYPE_CARDREDUCE.equals(bdlx)){
			sheetType = "reduce";
		} if(KpglCommon.KP_CZTYPE_CARDDEVALUE.equals(bdlx)){
			sheetType = "devalue";
		} if(KpglCommon.KP_CZTYPE_CARDMERGE.equals(bdlx)){
			sheetType = "merge";
		} if(KpglCommon.KP_CZTYPE_CARDSPLIT.equals(bdlx)){
			sheetType = "split";
		} if(KpglCommon.KP_CZTYPE_CARDMODIFY.equals(bdlx)){
			sheetType = "modify";
		} if(KpglCommon.KP_CZTYPE_CARDCHANGE.equals(bdlx)){
			sheetType = "change";
		} if(KpglCommon.KP_CZTYPE_CARDALLOCATE.equals(bdlx)){
			sheetType = "allocate";
		} 
		return sheetType;
	}
	
	/**
	 * 经营固定资产盘点所用
	 * @return
	 */
	public String newCardReduce() {
		String cardIds = request.getParameter("cardIds");
		String zcCldId = request.getParameter("zcCldId");
		String sheetType = "reduce";// sheetType为操作类型，根据操作类型进入不同处理单页面
		head = new CaShead();
		head.setBdlx(KpglCommon.KP_CZTYPE_CARDREDUCE);
		// 得到登录人的信息
		// 设置默认值
		head.setNgrq(new Date());
		IUser user = UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(user.getUserTid());
		// 得到人所在部门
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(user.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbm(dept.getRsvdNum1());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		List roleList = user.getRoleList();
		String isZuzhang = "false";
		if (roleList != null) {
			for (int i = 0; i < roleList.size(); i++) {
				RoleVO role = (RoleVO) roleList.get(i);
				Long tid = role.getTid();
				if (tid == 126l) {
					isZuzhang = "true";// 如果是组长，那么跳出
					break;
				}
			}
		}
		cardCommonUCCImpl.save(head);// 保存一条空数据，得到处理单ID
		// head.setNgr(ngr)
		request.setAttribute("isZuzhang", isZuzhang);
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", String.valueOf(head.getId()));
		request.setAttribute("sfzy", head.getZykpxz() == null ? "" : head
				.getZykpxz());
		request.setAttribute("zjfs", head.getZjfs() == null ? "" : head
				.getZjfs());
		// cardCommonUCCImpl.saveBody4JYZCcheck(cardIds);
		String ids[] = cardIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			// 将card信息加入到body里部分字段要手动写
			Cardinfo card = cardCommonUCCImpl.findCardinfoByCardId(ids[i]);
			body = cardCommonUCCImpl.card2Body(card);
			body.setKpxzid(head.getId());
			body.setCardinfoid(ids[i]);
			cardCommonUCCImpl.save(body);
		}
		CommonAccording ca1 = assetUCCImpl.getBLYJByHeadId(head.getId().toString(),zcCldId);
		cardCommonUCCImpl.saveCA(ca1);
		return "tomodify";
	}
	public String newCardAdd(){
		String zcCldId = request.getParameter("zcCldId");
		head = new CaShead();
		head.setBdlx(KpglCommon.KP_CZTYPE_CARDADD);
		// 得到登录人的信息
		// 设置默认值
		head.setNgrq(new Date());
		IUser user = UserThreadLocal.get();
		head.setNgrmc(user.getUsername());
		head.setNgr(user.getUserTid());
		// 得到人所在部门
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(user.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbm(dept.getRsvdNum1());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		List roleList = user.getRoleList();
		String isZuzhang = "false";
		if (roleList != null) {
			for (int i = 0; i < roleList.size(); i++) {
				RoleVO role = (RoleVO) roleList.get(i);
				Long tid = role.getTid();
				if (tid == 126l) {
					isZuzhang = "true";// 如果是组长，那么跳出
					break;
				}
			}
		}
		sheetType = "add";
		cardCommonUCCImpl.save(head);// 保存一条空数据，得到处理单ID
		CommonAccording ca1 = assetUCCImpl.getBLYJByHeadId(head.getId().toString(),zcCldId);
		cardCommonUCCImpl.saveCA(ca1);
		request.setAttribute("isZuzhang", isZuzhang);
		request.setAttribute("sheetType", sheetType);
		request.setAttribute("headId", String.valueOf(head.getId()));
		request.setAttribute("sfzy", head.getZykpxz() == null ? "" : head
				.getZykpxz());
		request.setAttribute("zjfs", head.getZjfs() == null ? "" : head
				.getZjfs());
		return "tomodify";
	}
	/**
	 * 以下为用到的getter setter
	 * 
	 * @return
	 */
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

	public ICodeGenerator getICodeGenerator() {
		return iCodeGenerator;
	}

	public void setICodeGenerator(ICodeGenerator codeGenerator) {
		iCodeGenerator = codeGenerator;
	}

	public String getSheetType() {
		return sheetType;
	}

	public void setSheetType(String sheetType) {
		this.sheetType = sheetType;
	}

}