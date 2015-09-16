package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.ucc.IAssetDealBodyUCC;
import com.tansun.eam2.zccz.ucc.IDealToDoUCC;
import com.tansun.eam2.zccz.ucc.IDealTrace1HeadUCC;
import com.tansun.eam2.zccz.ucc.IItemShUCC;
import com.tansun.eam2.zccz.vo.CzXmSpwYjVO;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
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

public class DealTrace1HeadAction extends CommonAction {

	private String xmlx;
	private String xmIds;
	private String zcIds;
	private String zclb;
	private DealQueryVo vo;
	private Paginator paginator;
	private CzXmjaHead head;
	private CzXmjaBody body;
	private String headId;
	private String message;
	private CzXmxxLsbVO xmXXVO;
	private String isgdzccz;
	private String bufenjiean;
	
	@Autowired
	private IDealTrace1HeadUCC ucc;
	@Autowired
	private IDealToDoUCC toDoUCC;
	@Autowired
	private IAssetDealBodyUCC assetDealBodyUCCImpl;
	@Autowired
	private IItemShUCC itemShUCCImpl;
	@Autowired
	IDeptUCC deptUCCimpl;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private WorkflowUtil workflowutil;	
	private List<CzXmSpwYjVO> finalList = new ArrayList<CzXmSpwYjVO>();
	
	public String getFenlei() {
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	public List<CzXmSpwYjVO> getFinalList() {
		return finalList;
	}

	public void setFinalList(List<CzXmSpwYjVO> finalList) {
		this.finalList = finalList;
	}

	/**
	 * 新建入口
	 * @return
	 */
	public String newHead() {
		String isFxglb = "false";
		IUser user=UserThreadLocal.get();
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
           Long id = dept.getTid();
           if(id==11302){
        	   isFxglb = "true";
           }
		}
		headId = "";
		request.setAttribute("isFxglb", isFxglb);
		return "newHead";
	}

	/**
	 * 查询列表json字符串
	 * @return
	 */
	public String dealQuery(){
		try {
			String str = ucc.getQueryJSONStr(vo,paginator);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 进入申请结案处理单页面
	 * @return
	 */
	public String addHead (){
		head = new CzXmjaHead();
		IUser user=UserThreadLocal.get();
		head.setNigaorenxm(user.getUsername());
		head.setNigaoren(String.valueOf(user.getUserTid()));
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		
		head.setNgrq(new Date());
		head.setLcmc("申请结案");
		if("true".equals(isgdzccz)){
			head.setJaxmlx("0");//设置项目结案类型为通用资产处置
		}else{
			head.setJaxmlx("1");//设置项目结案类型为实体处置
		}
		toDoUCC.save(head);
		if(xmIds!=null&&xmIds.length()>0){
			if(xmIds.startsWith(",")){
				xmIds = xmIds.substring(1);
			}
			String [] xmids1 = xmIds.split(",");
			ucc.saveXm2Cld(head.getId(), xmids1);//modify by lantianbo
//			if(xmids1.length>0){
//				for (int i = 0; i < xmids1.length; i++) {
//					CzXmXx xx = new CzXmXx();
//					String xmId = xmids1[i];
//					xx = ucc.findCzXmXxById(xmId);
//					xx.setJacldId(head.getId());
//					toDoUCC.update(xx);
//					
//				}
//			}
		}
		request.setAttribute("headId", head.getId());
		return "tomodify";
	}
	
	public String modifyHead(){
		headId = (String) request.getAttribute("headId");
		head = this.ucc.getCzXmjaHeadById(headId);
		request.setAttribute("userTid", head.getNigaoren());
		return "addHead";
	}
	
	/**
	 * 保存处理单信息
	 * @return
	 */
	public String saveHead(){
		toDoUCC.update(head);
		request.setAttribute("headId", head.getId());
		this.request.setAttribute(WorkflowAction.PT_DRAFT, this
				.headToPTDraft(head));
		this.request.setAttribute(WorkflowAction.PT_TODO, this
				.headToPTTodo(head));
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
			workflowutil.putVariables(taskId, "codeType", "zcczja");
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", String.valueOf(dept.getTid()));
		}
		//====================编号作废所需参数
		return "toWorkflow";
	}

	/**
	 * 添加到待办
	 * @param head
	 * @return
	 */
	private PTTodo headToPTTodo(CzXmjaHead head) {
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		todo.setSheetId(head.getBianhao());
		return todo;
	}

	/**
	 * 添加到草稿
	 * @param head
	 * @return
	 */
	private PTDraft headToPTDraft(CzXmjaHead head) {
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		if(StringUtils.isNotEmpty(head.getNgbm()))
			draft.setHeadType(head.getLcmc());
		draft.setDeptId(Long.parseLong(head.getNgbm()));
		draft.setTitle(head.getBiaoti());
		draft.setSubsystem(GlobalVariable.ASSET_FOR_USING);
		return draft;
	}
	
	/**
	 * 处理单列表json字符串
	 * @return
	 */
	public String findCzXmByCldId(){
		String str = ucc.findCzXmByCldId(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 处理单下 删除处置项目
	 * @return
	 */
	public String delXm(){
		String ids = request.getParameter("ids");//得到选择的处置项目，
		String cldId = request.getParameter("cldId");
		if(ids.startsWith(",")){
			ids = ids.substring(1);
		}
		String[] xmIds = ids.split(",");
		ucc.deleteCzxm(cldId,xmIds);
		return null;
	}
	/**
	 * 进入增加项目页面
	 * @return
	 */
	public String addXm() {
		String isAdd = request.getParameter("isAdd");
		request.setAttribute("isAdd", isAdd);
		return "newHead";
	}
	
	/**
	 * 在结案处理单页面打开编辑项目页面
	 * @return
	 */
	public String editXm(){
		String isLook = request.getParameter("isLook");
		body = this.ucc.findCzXmjaBodyByXmIdAndCldId(xmIds,headId);
		request.setAttribute("isLook", isLook);
		return "editXm";
	}
	
	/**
	 * 结案处理单项目弹出编辑页面更新数据
	 * @return
	 */
	public String updateBody(){
		CzXmjaBody body1 = this.ucc.findCzXmjaBodyByXmIdAndCldId(body.getXmId(),body.getCldId());
		body1.setBeizhu(body.getBeizhu());
		body1.setXyqssj(body.getXyqssj());
		body1.setFysfjq(body.getFysfjq());
		body1.setSfyylwt(body.getSfyylwt());
		this.toDoUCC.update(body1);
		message="保存成功！";
		return "editXm";
	}
	
	/**
	 * 关联处理单和项目
	 * @return
	 */
	public String saveXm(){
		String ids = request.getParameter("ids");
		String[] xmIds = ids.split(",");
		ucc.saveXm2Cld(headId ,xmIds);
		return null;
	}
	
	/**
	 * 编辑处置项目
	 * @return
	 */
	public String editCzXm(){
		String xmId = request.getParameter("xmId");
		String sfqszczrxy = request.getParameter("sfqszczrxy");
		String kpsfjs = request.getParameter("kpsfjs");
		//CzXmXx xx = this.ucc.findCzXmXxById(xmId);
		body = new CzXmjaBody();
		body.setCldId(headId);
		body.setXmId(xmId);
		body.setKpsfjs(kpsfjs);
		body.setSfqsxy(sfqszczrxy);
		this.ucc.update(body,"1");
		return null;
	}
	
	//根据处置项目信息表ID查询处置项目信息
	public String viewItemInfo(){
		String itemId = this.request.getParameter("itemId");
		request.setAttribute("itemId", itemId);
		//根据处置项目id查询处置项目
		CzXmXx czXmXx = this.ucc.findCzXmXxById(itemId);
		
		//根据处置项目的分类查找不同的处置资产信息
		String itemType = czXmXx.getFenlei();
		request.setAttribute("itemType", itemType);
		request.setAttribute("cldId", czXmXx.getCldId());
		/*
		 * 分类  0：经营性固产处置
				1：实体内资产
				2：委贷抵债物
				3：实体整体处置
				4：实体人员安置
				5：承继投资
		 */
		if(StringUtils.indexOfAny(itemType,  new String[]{"0","1","2","6","7","8","9"}) != -1){
			//根据处理单id查询处理单信息
			CzCztzfaXx cldInfo = ucc.findCldById(czXmXx.getCldId());
			//设置处置资产类别进行页面展示
			request.setAttribute("zclb", cldInfo.getZclb());
		}
		return "disposeItemInfo";
	}
	
	//根据处置项目信息临时表ID查询处置项目信息
	public String viewCzItemInfo(){
		//处置项目信息临时表Id
		String itemLsbId = this.request.getParameter("itemLsbId");
		String flag = this.request.getParameter("flag");
		//根据处置项目信息临时表Id查询处置项目信息
		CzXmxxLsb xmLsb = this.ucc.findCzXmXxLSBById(itemLsbId);
		request.setAttribute("itemId", itemLsbId);
		request.setAttribute("itemType", xmLsb.getFenlei());
		request.setAttribute("cldId", xmLsb.getCldId());
		request.setAttribute("flag",flag);
		return "disposeItemInfo";
	}
	
	private String fenlei;
	
	public String viewItemFeiyongInfo(){
		xmIds = request.getParameter("itemId");
		String flag = this.request.getParameter("flag");
		if(StringUtils.equals(flag,"disposeItemInfo" )){
			//根据处置项目临时表Id，查询处置项目信息表Id
			xmIds = this.ucc.findCzXmxxIdByLsbId(xmIds);
		}
		fenlei = "feiyong";
		request.setAttribute("itemId", xmIds);
		request.setAttribute("fenlei", fenlei);
		return "viewItemFeiyongInfo";
	}
	
	//打印跟踪费用Json串
	public String genzongFeiyong(){
		try{
			response.setCharacterEncoding("UTF-8");
			String xmId = request.getParameter("xmId");
			String returnStr = ucc.getGenzongFeiyong(xmIds);
			response.getWriter().print(returnStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//打印回款Json串
	public String huikuan(){
		try{
			response.setCharacterEncoding("UTF-8");
			String xmId = request.getParameter("xmId");
			String returnStr = ucc.getHuikuan(xmId);
			response.getWriter().print(returnStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//更新实际支出
	public String updateSjzc(){
		String id = request.getParameter("id");
		Double sjzc = Double.parseDouble(request.getParameter("sjzc"));
		ucc.updateSjzc(id, sjzc);
		return null;
	}
	
	public String viewItemAssetInfo(){
		request.setAttribute("cldId", request.getParameter("cldId"));
		request.setAttribute("zclb", request.getParameter("zclb"));
		request.setAttribute("itemId", request.getParameter("itemId"));
		return "viewItemAssetInfo";
	}
	
	//查询资产处置处理单
	public String viewZcczCldInfo(){
		String cldId = request.getParameter("cldId");
		CzCztzfaXx disposeHead = ucc.findCldById(cldId);
		request.setAttribute("disposeHead", disposeHead);
		return "zcczCld";
	}
	//查询项目上会信息界面（临时表）
	public String viewMeetingLSBInfo(){
		String itemId = request.getParameter("itemId");
//		CzXmxxLsb xmXx = ucc.findCzXmXxLSBById(itemId);
		if(!("").equals(itemId)){
			//处置项目临时表id
//			String itemLsbId = xmXx.getXmlsb();
			
			//根据处置项目信息临时表id查询项目信息
			 xmXXVO = itemShUCCImpl.findCzXmxxById(itemId);
			//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
			List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemId);
			String spwys = "";
			String spzcr = "";
			for(CzXmSpwYj temp : list){
				if(StringUtils.equals(temp.getSfwzcr(),ZcczCommon.DEALTODO_SPWY)){
					spwys += temp.getSpwyxm() + ",";
				}else if(StringUtils.equals(temp.getSfwzcr(), ZcczCommon.DEALTODO_ZCR))
					spzcr += temp.getSpwyxm();
			}
			//审批委员
			if(("").equals(spwys)){
				xmXXVO.setSpwys("");
			}else{
				xmXXVO.setSpwys(spwys.substring(0, spwys.lastIndexOf(",")));
			}
			//审批主持人
			xmXXVO.setSpzcr(spzcr);
			//根据会议信息Id，获得会议信息
			CzHyxx hyxx = this.itemShUCCImpl.findHyxxById(xmXXVO.getHyId());
			if(hyxx != null){
				xmXXVO.setHycs(hyxx.getHycs());
				//审批时间
				xmXXVO.setSpsj(hyxx.getSpsj());
				//审批方式
				if(StringUtils.equals(hyxx.getCSpfs(), "1")){
					xmXXVO.setCSpfs("会议");
				}else if(StringUtils.equals(hyxx.getCSpfs(), "2")){
					xmXXVO.setCSpfs("会签");
				}
			}
		}
		return "itemShxx";
	}
	//查询项目上会信息页面
	public String viewMeetingInfo(){
		String itemId = request.getParameter("itemId");
		String flag = request.getParameter("flag");
		String itemLsbId = null;
		if(StringUtils.equals("disposeItemInfo", flag)){
			itemLsbId = itemId;
		}else{
			CzXmXx xmXx = ucc.findCzXmXxById(itemId);
			//处置项目临时表id
			itemLsbId = xmXx.getXmlsb();
		}
		//根据处置项目信息临时表id查询项目信息
		 xmXXVO = itemShUCCImpl.findCzXmxxById(itemLsbId);
		//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
		List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemLsbId);
		String spwys = "";
		String spzcr = "";
		for(CzXmSpwYj temp : list){
			if(StringUtils.equals(temp.getSfwzcr(),ZcczCommon.DEALTODO_SPWY)){
				spwys += temp.getSpwyxm() + ",";
			}else if(StringUtils.equals(temp.getSfwzcr(), ZcczCommon.DEALTODO_ZCR))
				spzcr += temp.getSpwyxm();
		}
		//审批委员
		if(spwys!=null&&spwys.length()>0){
			if(spwys.endsWith(",")){
				spwys = spwys.substring(0,spwys.length()-1);
			}
		}
		xmXXVO.setSpwys(spwys);
		//审批主持人
		xmXXVO.setSpzcr(spzcr);
		//根据会议信息Id，获得会议信息
		CzHyxx hyxx = this.itemShUCCImpl.findHyxxById(xmXXVO.getHyId());
		if(hyxx != null){
			xmXXVO.setHycs(hyxx.getHycs());
			//审批时间
			xmXXVO.setSpsj(hyxx.getSpsj());
			//审批方式
			if(StringUtils.equals(hyxx.getCSpfs(), "1")){
				xmXXVO.setCSpfs("会议");
			}else if(StringUtils.equals(hyxx.getCSpfs(), "2")){
				xmXXVO.setCSpfs("会签");
			}
		}
		
		return "itemShxx";
	}
	//查询项目意见汇总页面临时表
	public String viewSummaryLSBInfo(){
		String itemId = request.getParameter("itemId");
		//根据处置项目id获取处置项目信息
		if(!("").equals(itemId)){
			//根据处置项目信息临时表id查询项目信息
			xmXXVO = itemShUCCImpl.findCzXmxxById(itemId);
			//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
			List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemId);
			Long agreeCount = 0l;
			Long disagreeCount = 0l;
			if(list != null && list.size() > 0){
				for(CzXmSpwYj temp:list){
					CzXmSpwYjVO tempVO = new CzXmSpwYjVO();
					tempVO.copyProperties(temp);
					if(ZcczCommon.DEALTODO_SPWY.equals(temp.getSfwzcr()))
						tempVO.setPersonType("审批委员");
					else if(ZcczCommon.DEALTODO_ZCR.equals(temp.getSfwzcr()))
						tempVO.setPersonType("审批主持人");
					if(temp.getButongyi() == 1){
						tempVO.setDisagreeStr("不同意");
						disagreeCount += 1;
					}
					if(temp.getTongyi() == 1){
						tempVO.setAgreeStr("同意");
						agreeCount += 1;
					}
					xmXXVO.setAgreeCount(agreeCount);
					xmXXVO.setDisagreeCount(disagreeCount);
					finalList.add(tempVO);
				}
			}
		}
		return "summary";
	}
	//查询项目意见汇总页面
	public String viewSummaryInfo(){
		String itemId = request.getParameter("itemId");
		String flag = request.getParameter("flag");
		String itemLsbId = null;
		if(StringUtils.equals("disposeItemInfo", flag)){
			itemLsbId = itemId;
		}else{
			//根据处置项目id获取处置项目信息
			CzXmXx xmXx = ucc.findCzXmXxById(itemId);
			//处置项目临时表id
			itemLsbId = xmXx.getXmlsb();
		}		
		//根据处置项目信息临时表id查询项目信息
		xmXXVO = itemShUCCImpl.findCzXmxxById(itemLsbId);
		//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
		List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemLsbId);
		Long agreeCount = 0l;
		Long disagreeCount = 0l;
		if(list != null && list.size() > 0){
			for(CzXmSpwYj temp:list){
				CzXmSpwYjVO tempVO = new CzXmSpwYjVO();
				tempVO.copyProperties(temp);
				if(ZcczCommon.DEALTODO_SPWY.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批委员");
				else if(ZcczCommon.DEALTODO_ZCR.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批主持人");
				if(temp.getButongyi() != null && temp.getButongyi() == 1){
					tempVO.setDisagreeStr("不同意");
					disagreeCount += 1;
				}
				if(temp.getTongyi() !=null && temp.getTongyi() == 1){
					tempVO.setAgreeStr("同意");
					agreeCount += 1;
				}
				xmXXVO.setAgreeCount(agreeCount);
				xmXXVO.setDisagreeCount(disagreeCount);
				finalList.add(tempVO);
			}
		}
		return "summary";
	}


	//主持人查询项目意见汇总页面
	public String viewSummaryInfo2(){
		String cldId = request.getParameter("cldId");
		//处置项目临时表id
		String itemLsbId = this.ucc.findCzXmLsbByCldId(cldId);
		//根据处置项目信息临时表id查询项目信息
		xmXXVO = itemShUCCImpl.findCzXmxxById(itemLsbId);
		//根据处置项目临时表id，在项目审批委员意见信息CZ_XM_SPW_YJ表中查询审批委意见
		List<CzXmSpwYj> list = this.itemShUCCImpl.findYjByItemId(itemLsbId);
		Long agreeCount = 0l;
		Long disagreeCount = 0l;
		if(list != null && list.size() > 0){
			for(CzXmSpwYj temp:list){
				CzXmSpwYjVO tempVO = new CzXmSpwYjVO();
				tempVO.copyProperties(temp);
				if(ZcczCommon.DEALTODO_SPWY.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批委员");
				else if(ZcczCommon.DEALTODO_ZCR.equals(temp.getSfwzcr()))
					tempVO.setPersonType("审批主持人");
				if(temp.getButongyi() != null && temp.getButongyi() == 1){
					tempVO.setDisagreeStr("不同意");
					disagreeCount += 1;
				}
				if(temp.getTongyi() !=null && temp.getTongyi() == 1){
					tempVO.setAgreeStr("同意");
					agreeCount += 1;
				}
				xmXXVO.setAgreeCount(agreeCount);
				xmXXVO.setDisagreeCount(disagreeCount);
				finalList.add(tempVO);
			}
		}
		return "summary2";
	}

	public String getCode() {
		String headId = request.getParameter("headId");
		head = this.ucc.getCzXmjaHeadById(headId);
		String code = codeGenerator.generateCurrentCode("zcczja", String.valueOf(head.getNgbm()), head.getNgbmmc());
		head.setBianhao(code);
		this.toDoUCC.update(head);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(code);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 流程办结
	 * @return
	 */
	public String banjie(){
		String result = this.ucc.banjie(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * //全部办结
	 */
	public String quanbujiean(){
		String result = ucc.quanbujiean(headId,xmIds);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//查看会议纪要
	public String look_oa(){
		String itemId = request.getParameter("itemId");
		String url = ucc.look_oa(itemId);
		try {
			response.setCharacterEncoding("UTF-8");
			if(url == null){
				response.getWriter().write("");
			}else{
				response.getWriter().write(url);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * //部分办结
	 */
	public String bufenjiean(){
		String result = ucc.bufenjiean(headId,xmIds,zcIds,zclb);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * //取消结案
	 */
	public String quxiaojiean(){
		String result = ucc.quxiaojiean(headId,xmIds,zcIds,zclb);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getXmlx() {
		return xmlx;
	}


	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}

	public DealQueryVo getVo() {
		return vo;
	}

	public void setVo(DealQueryVo vo) {
		this.vo = vo;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public CzXmjaHead getHead() {
		return head;
	}

	public void setHead(CzXmjaHead head) {
		this.head = head;
	}

	public String getXmIds() {
		return xmIds;
	}

	public void setXmIds(String xmIds) {
		this.xmIds = xmIds;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public IAssetDealBodyUCC getAssetDealBodyUCCImpl() {
		return assetDealBodyUCCImpl;
	}

	public void setAssetDealBodyUCCImpl(IAssetDealBodyUCC assetDealBodyUCCImpl) {
		this.assetDealBodyUCCImpl = assetDealBodyUCCImpl;
	}

	public IItemShUCC getItemShUCCImpl() {
		return itemShUCCImpl;
	}

	public void setItemShUCCImpl(IItemShUCC itemShUCCImpl) {
		this.itemShUCCImpl = itemShUCCImpl;
	}

	public CzXmjaBody getBody() {
		return body;
	}

	public void setBody(CzXmjaBody body) {
		this.body = body;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public CzXmxxLsbVO getXmXXVO() {
		return xmXXVO;
	}

	public void setXmXXVO(CzXmxxLsbVO xmXXVO) {
		this.xmXXVO = xmXXVO;
	}

	public String getIsgdzccz() {
		return isgdzccz;
	}

	public void setIsgdzccz(String isgdzccz) {
		this.isgdzccz = isgdzccz;
	}

	public String getBufenjiean() {
		return bufenjiean;
	}

	public void setBufenjiean(String bufenjiean) {
		this.bufenjiean = bufenjiean;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}

	public String getZclb() {
		return zclb;
	}

	public void setZclb(String zclb) {
		this.zclb = zclb;
	}
}
