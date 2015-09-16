package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.utils.QueryBody4ViewListToJSON;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.ZySheadVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;

/**
 * ZCDetailAction用来实现对自用资产信息的查询功能和选取功能
 * @author 穆占强
 * @date 2010-11-20
 */
//@Controller
//@Scope("prototype")
public class ZCManageHeadAction extends CommonAction {

	private ZyShead head;
	// 自用资产中的表单id
	private String headId = "";
	
	private ZySheadVO headVO;
	// 提交表单的部门ID
	private String deptId = "";
	// 自用资产中的单据类型
	private String sheettype = "";
	// 自用资产中的页面类型
	private String zcState = "";
	// 要删除的bodyID数
	private String delBodyIds = "";

	private Paginator paginator;

	private String lastTimePdpc;

	// 盘点信息表
	private PdxxVO pdxxVo;

	@Autowired
	private ZCManageHeadUCC zCManageHeadUCC;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCC;
	@Autowired
	private ToCheckUCC toCheckUCCimpl;
	@Autowired
	private ICodeGenerator iCodeGenerator;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
	private WorkflowUtil workflowutil;
	Logger log=Logger.getLogger(this.getClass());
	/**
	 * 新增一张单子,数据库中插入一条空记录,得到id,然后转到另一个入口去
	 * @return
	 */
	public String newHead() {
		head = new ZyShead();
		// 得到当前登陆人员
		head.setNgrbh(UserThreadLocal.get().getUserTidChar());
		head.setNgrmc(UserThreadLocal.get().getUsername());
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get().getUserTid());
		if(list!=null&&list.size()>0){
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
	
		
		head.setNgrq(DateUtils.formatDate(new Date(), "yyyy-MM-dd"));
		head.setSheetType(sheettype);
		
		if("tostock".equals(sheettype)){
			CaShead caShead = new CaShead();
			caShead.setZjfs("0");
			caShead.setBdlx("卡片新增");
			cardCommonUCCImpl.save(caShead);
			request.setAttribute("caSheadId", caShead.getId());
			head.setNgbmyj(caShead.getId().toString());
		}
		
		// 在数据库中插入一条空的head记录，得到处理单ID
		zCManageHeadUCC.newHead(head);
		
		request.setAttribute("headId", head.getSheadId());
		request.setAttribute("sheettype", sheettype);
		if("goodreturn".equals(sheettype)){
			return "goodreturn";
		} else if ("personal_comsuming".equals(sheettype) || "personal_borrow".equals(sheettype)) {
			return "modify";
		}
		return "tomodify";
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * @return
	 */
	public String modifyHead() {
		// 获得表头ID
		String sheadID = request.getAttribute("headId").toString();
		// 在数据库中检索出表头信息，返回到页面表头
		head = zCManageHeadUCC.readHead(sheadID);
		sheettype = head.getSheetType();
		if ("tocheckobject".equals(sheettype)
				|| "tocheckstock".equals(sheettype)) {
			creatPC(sheettype);
		}
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("userTid", head.getNgrbh());
		return sheettype;
	}

	/**
	 * 给盘点盘库审批生成批次号
	 */
	public String creatPC(String sheetType) {
		String pclx = "";
		if ("tocheckobject".equals(sheettype)) {
			pclx = "盘点";
		}else if("tocheckstock".equals(sheettype)){
			pclx = "盘库";
		}
		List<ZyPdxx> PdxxList = toCheckUCCimpl.queryPdxxWithPclx(pclx);
		Map<String, String> pdpcMap = new TreeMap<String, String>();
		for (ZyPdxx pdxx : PdxxList) {
			if (pdxx.getPdpc() != null && pdxx.getPdpc().contains(pclx)) {
				pdpcMap.put(pdxx.getPdpc(), pdxx.getPdpc());
			}
		}
		request.setAttribute("pdpcMap", pdpcMap);
		return null;
	}

	/**
	 * 选择不同的批次号时，从盘点信息表中查出数据在Jqgrid中显示
	 */
	public String jqgridTableRefresh() {
		if (pdxxVo != null) {
			if (StringUtils.isNotEmpty(lastTimePdpc)) {
				moidfyPdpc(lastTimePdpc, null);
			}
			moidfyPdpc(pdxxVo.getPdpc(), head.getSheadId());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print("ok");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

	/**
	 * 修改一个批次的sheadId
	 * @param Pdpc 盘点批次
	 * @param sheadId
	 * @return
	 */
	public String moidfyPdpc(String Pdpc, String sheadId) {
		List<ZyPdxx> PdxxList = toCheckUCCimpl.findZyPdxxWithPdpc(Pdpc);
		ZyPdxx currentPdxxRecord = null;
		for (Iterator<ZyPdxx> i = PdxxList.iterator(); i.hasNext();) {
			currentPdxxRecord = i.next();
			currentPdxxRecord.setSheadId(sheadId);
			toCheckUCCimpl.update(currentPdxxRecord);
		}
		return null;
	}

	/**
	 * 界面上有一个保存按钮,点击以后保存到数据库, 从request里面得到bo对象,然后更新到表头数据表去
	 * @return
	 */
	public String saveHead() {
		// 保存表头信息
//		String outCome = request.getParameter("outCome");
		zCManageHeadUCC.saveHead(head);
		request.setAttribute("headId", head.getSheadId());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
		if("goodreturn".equals(sheettype) 
				|| "personal_comsuming".equals(sheettype)
				|| "personal_borrow".equals(sheettype)){
			return "modify";
		}
		
		  // ====================编号作废所需参数
		String taskId = (String) request.getParameter("taskId");
		if (StringUtils.isNotEmpty(taskId)) {
			IUser user = UserThreadLocal.get();
			List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(user.getUserTid());
			PTDeptBO dept = null;
			if (list != null && list.size() > 0) {
				dept = list.get(0);
			}
			
			if(sheettype.equals("purchase")){
				workflowutil.putVariables(taskId, "codeType", "purchase");
			} else if (sheettype.equals("tostock")){
				workflowutil.putVariables(taskId, "codeType", "tostock");
			} else if (sheettype.equals("dept_comsuming")){
				workflowutil.putVariables(taskId, "codeType", "dept_comsuming");
			} else if (sheettype.equals("dept_borrow")){
				workflowutil.putVariables(taskId, "codeType", "dept_borrow");
			} else if (sheettype.equals("reborrow")){
				workflowutil.putVariables(taskId, "codeType", "reborrow");
			} else if (sheettype.equals("tocheckstock")){
				workflowutil.putVariables(taskId, "codeType", "tocheckstock");
			} else if (sheettype.equals("tocheckobject")){
				workflowutil.putVariables(taskId, "codeType", "tocheckobject");
			} else if (sheettype.equals("goodchange")){
				workflowutil.putVariables(taskId, "codeType", "goodchange");
			} else if (sheettype.equals("gooddeploy")){
				workflowutil.putVariables(taskId, "codeType", "gooddeploy");
			} else if (sheettype.equals("goodrenewal")){
				workflowutil.putVariables(taskId, "codeType", "goodrenewal");
			} else if (sheettype.equals("discard")){
				workflowutil.putVariables(taskId, "codeType", "discard");
			}
			
			workflowutil.putVariables(taskId, "generatedCode", head.getSheetId());
			workflowutil.putVariables(taskId, "deptid", head.getNgbmbh());
		}
		// ====================编号作废所需参数
		log.debug("------------------->"+ Thread.currentThread().getId());
		return "toWorkflow";
	}

	/**
	 * 删除此条表体记录
	 * @return
	 */
	public String deleteBody() {
		// 删除相应的表体，同时刷新页面内容
		String[] bodyIds = delBodyIds.split(",");
		zCManageHeadUCC.deleteBody(bodyIds);
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 删除盘点信息表中的记录
	 */
	public String delPdxxRecord() {
		String[] delIdArray = delBodyIds.split(",");
		toCheckUCCimpl.deleteBody(delIdArray);
		return null;
	}

	/**
	 * 资产归还，更新资产信息
	 * @return
	 */
	public String goodReturn() {
		// 保存表头信息
		zCManageHeadUCC.goodReturn(head);
		request.setAttribute("headId", head.getSheadId());
		return "goodreturn";
	}

	/**
	 * 得到当前表单下的表体信息 通用条件
	 */
	public String findBodyString() {
		headId = request.getAttribute("headId").toString();
		if ("goodchange".equals(sheettype)) {
			zcState = request.getParameter("zcState");
		}
		// 根据表头信息查找表体信息
		List<ZySbody> bodyList = zCManageBodyUCC.readBodyByHeadID(headId);
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
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 得到当前表单下的当前部门内表体信息 适用于领用，借用
	 * @return
	 */
	public String findDeptBodyString() {
		if ((deptId != null) && deptId.length() > 0) {
			// 查询出当前部门的领用，借用信息
			List<ZySbody> bodyList = zCManageHeadUCC.getBodyByDept(sheettype,
					deptId);
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
			String josnStr = QueryBody4ViewListToJSON.getJSON(zctzVOList, 1, 1,
					24);
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(josnStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 流程结束后将表单录入台账
	 * @return
	 */
	public String zcBodyToBook() {
		zCManageHeadUCC.zcBodyToBook(headId, sheettype);
		return null;
	}

	/**
	 * 流程结束后更新资产信息
	 * @return
	 */
	public String zcBodyToZc() {

		return null;
	}

	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(ZyShead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getTitle());
		//表单编号。
		todo.setSheetId(head.getSheetId());
		return todo;
	}

	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(ZyShead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getSheadId());
		draft.setHeadType(checkStyle(head.getSheetType()));
		draft.setTitle(head.getTitle());
		//拟稿部门
		if(StringUtils.isNotEmpty(head.getNgbmbh())&& !"null".equals(head.getNgbmbh())){
			draft.setDeptId(Long.parseLong(head.getNgbmbh()));
		}
		draft.setSubsystem(GlobalVariable.ASSET_FOR_USING);
		return draft;
	}

	/**
	 * 判断业务类型
	 * @param sheettype
	 * @return
	 */
	private String checkStyle(String sheettype){
		String stype = "";
		if(sheettype.equals("purchase")){
			stype = "资产采购";
		} else if (sheettype.equals("tostock")){
			stype = "资产入库";
		} else if (sheettype.equals("personal_comsuming")){
			stype = "个人领用";
		} else if (sheettype.equals("dept_comsuming")){
			stype = "部门领用";
		} else if (sheettype.equals("personal_borrow")){
			stype = "个人借用";
		} else if (sheettype.equals("dept_borrow")){
			stype = "部门借用";
		} else if (sheettype.equals("reborrow")){
			stype = "续借";
		} else if (sheettype.equals("tocheckstock")){
			stype = "盘库";
		} else if (sheettype.equals("tocheckobject")){
			stype = "盘点";
		} else if (sheettype.equals("goodchange")){
			stype = "物品更换";
		} else if (sheettype.equals("gooddeploy")){
			stype = "物品维修";
		} else if (sheettype.equals("goodrenewal")){
			stype = "物品续保";
		} else if (sheettype.equals("goodreturn")){
			stype = "物品归还";
		} else if (sheettype.equals("discard")){
			stype = "物品报废";
		}
		return stype;
	}

	//-------------------------------refactor start---------------------------
	/**
	 * 查询出head表中已办结的采购申请单，并且采购申请单中含有未入库的物品
	 */
	public String queryForHeadList() {
		List<ZyShead> headList = null;
		List<ZyShead> finalDisplayList = new ArrayList<ZyShead>();
		try{
			//符合查询条件的head列表（）
			headList = zCManageHeadUCC.obtainHeadList(headVO);
			String HeadIdStrWithWRKGoods = zCManageBodyUCC.obtainHeadIdStrWithWRKGoods();
			for(ZyShead oneHead : headList){
				if(HeadIdStrWithWRKGoods.contains(oneHead.getSheadId())){
					finalDisplayList.add(oneHead);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
//		String josnStr = GetJsonString.getJsonString(finalDisplayList);
		String josnStr = BodyListToJSON.getJSON(finalDisplayList, 1, 1, 10000);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 调用本方法生成表单编号
	 * @return
	 */
	public String generateSheetNum(){
		String sheetCode = "";
		head = zCManageHeadUCC.readHead(headId);
		if(StringUtils.isEmpty(head.getSheetId())){
			if(sheettype.equals("dept_borrow") || sheettype.equals("reborrow")||
					sheettype.equals("dept_comsuming") || sheettype.equals("goodchange")||
					sheettype.equals("gooddeploy")){
				sheetCode = iCodeGenerator.generateCurrentCode(sheettype,null,"");
			}else{
				sheetCode = iCodeGenerator.generateCurrentCode(sheettype, head.getNgbmbh(), head.getNgbmmc());
			}
			head.setSheetId(sheetCode);
			zCManageHeadUCC.updateHead(head);
		}else{
			sheetCode = head.getSheetId();
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(sheetCode);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String print(){
		request.setAttribute("filename1",request.getParameter("filename1"));
		this.zCManageHeadUCC.print(headId,request,response);
		return null;
	}
	
	/**
	 * 领用借用开启采购的单子
	 * @return
	 */
	public String newPurchaseHead(){
		String applyId = request.getParameter("applyId");
		String str = request.getParameter("str");
		head = new ZyShead();
		// 得到当前登陆人员
		head.setNgrbh(UserThreadLocal.get().getUserTidChar());
		head.setNgrmc(UserThreadLocal.get().getUsername());
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get().getUserTid());
		if(list!=null&&list.size()>0){
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		head.setNgrq(DateUtils.formatDate(new Date(), "yyyy-MM-dd"));
		head.setSheetType(sheettype);
		
		if("tostock".equals(sheettype)){
			CaShead caShead = new CaShead();
			caShead.setZjfs("0");
			caShead.setBdlx("卡片新增");
			cardCommonUCCImpl.save(caShead);
			request.setAttribute("caSheadId", caShead.getId());
			head.setNgbmyj(caShead.getId().toString());
		}
		
		// 在数据库中插入一条空的head记录，得到处理单ID
		zCManageHeadUCC.newHead(head);
		request.setAttribute("headId", head.getSheadId());
		request.setAttribute("sheettype", sheettype);
		if("goodreturn".equals(sheettype)){
			return "goodreturn";
		} else if ("personal_comsuming".equals(sheettype) || "personal_borrow".equals(sheettype)) {
			return "modify";
		}
		CommonAccording ca1 = zCManageHeadUCC.getBLYJByHeadId(head.getSheadId().toString(),applyId);
		cardCommonUCCImpl.saveCA(ca1);
//		zCManageBodyUCC.newPurchaseBody(headId, str);
		zCManageBodyUCC.newPurchaseBodyGetMoreInfo(head.getSheadId(),applyId,str);
		request.setAttribute("headId", head.getSheadId());
		request.setAttribute("sheettype", sheettype);
		return "tomodify";
	}
	
	
	
	/**
	 * 物品变更开启采购单子
	 * @return
	 */
	public String newPurchaseHead4exchange(){
		String applyId = request.getParameter("applyId");
		String bodyIds = request.getParameter("bodyIds");
		head = new ZyShead();
		// 得到当前登陆人员
		head.setNgrbh(UserThreadLocal.get().getUserTidChar());
		head.setNgrmc(UserThreadLocal.get().getUsername());
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get().getUserTid());
		if(list!=null&&list.size()>0){
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		head.setNgrq(DateUtils.formatDate(new Date(), "yyyy-MM-dd"));
		head.setSheetType(sheettype);
		
		if("tostock".equals(sheettype)){
			CaShead caShead = new CaShead();
			caShead.setZjfs("0");
			caShead.setBdlx("卡片新增");
			cardCommonUCCImpl.save(caShead);
			request.setAttribute("caSheadId", caShead.getId());
			head.setNgbmyj(caShead.getId().toString());
		}
		
		// 在数据库中插入一条空的head记录，得到处理单ID
		zCManageHeadUCC.newHead(head);
		request.setAttribute("headId", head.getSheadId());
		request.setAttribute("sheettype", sheettype);
		if("goodreturn".equals(sheettype)){
			return "goodreturn";
		} else if ("personal_comsuming".equals(sheettype) || "personal_borrow".equals(sheettype)) {
			return "modify";
		}
		CommonAccording ca1 = zCManageHeadUCC.getBLYJByHeadId(head.getSheadId().toString(),applyId);
		cardCommonUCCImpl.saveCA(ca1);
		zCManageBodyUCC.newPurchaseBody4exchange(head.getSheadId(),bodyIds);
		request.setAttribute("headId", head.getSheadId());
		request.setAttribute("sheettype", sheettype);
		return "tomodify";
	}

	//-------------------------------refactor end---------------------------

	// -------------------------------------------------------------
	// 下面的代码是程序自动生成的GetSet方法
	// -------------------------------------------------------------

	public ZyShead getHead() {
		return head;
	}

	public void setHead(ZyShead head) {
		this.head = head;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getDelBodyIds() {
		return delBodyIds;
	}

	public void setDelBodyIds(String delBodyIds) {
		this.delBodyIds = delBodyIds;
	}

	public String getZcState() {
		return zcState;
	}

	public void setZcState(String zcState) {
		this.zcState = zcState;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getLastTimePdpc() {
		return lastTimePdpc;
	}

	public void setLastTimePdpc(String lastTimePdpc) {
		this.lastTimePdpc = lastTimePdpc;
	}

	public ZySheadVO getHeadVO() {
		return headVO;
	}

	public void setHeadVO(ZySheadVO headVO) {
		this.headVO = headVO;
	}

	public PdxxVO getPdxxVo() {
		return pdxxVo;
	}

	public void setPdxxVo(PdxxVO pdxxVo) {
		this.pdxxVo = pdxxVo;
	}

}