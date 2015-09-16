package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.ucc.ILiquidateUCC;
import com.tansun.eam2.jygdzc.ucc.impl.ContractUCCImpl;
import com.tansun.eam2.jygdzc.vo.ClearQueryVO;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxHtView;
import com.tansun.eam2.jygdzc.vo.JjzcHtBxQueryVO;
import com.tansun.eam2.jygdzc.vo.ZulinFeiyongVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 * @author lihuan
 * 
 */

public class ContractQueryAction extends CommonAction implements IExport {
	public JjzcHtBxQueryVO queryVO;
	public String sheettype;
	public String zcId;
	//是否为填写实收
	public String edit;
	// 合同id
	public String htId;
	//合同类型
	private String htlx;
	//JyzcXx资产表
	public JyzcXx jyzcXx;
	private List jdzjList;
	private ZulinFeiyongVO feiyong;
	public Paginator paginator ;
	@Autowired
	public IContractUCC contractUCCImpl;
	@Autowired
	public IAssetUCC assetUCCImpl;
	@Autowired
	public ILiquidateUCC liquidateUCCimpl;
	public JjzcHtZlwg jjzcHtZlwg;
	public JjzcHtBx jjzcHtBx;
	 @Autowired
	public IDeptUCC iDeptUCCImpl;

	public String init() {
		String contractType = request.getParameter("contractType");
		request.setAttribute("contractType", contractType);
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		String returnValue = request.getParameter("returnValue");
		request.setAttribute("returnValue", returnValue);
		String purchaseParam = request.getParameter("purchaseParam");
		request.setAttribute("purchaseParam", purchaseParam);
		return sheettype;
	}

	public String query() throws IOException {
		@SuppressWarnings("unused")
		List<JjzcHtBxHtView> jjzcHtBxHtViewList=new ArrayList<JjzcHtBxHtView>();
		if(queryVO==null){
			queryVO = new JjzcHtBxQueryVO();
		}
		IUser user = UserThreadLocal.get();
	    List<PTDeptBO> listuser = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
	    if(listuser != null && listuser.size()>0){
	    	for(int i=0;i<listuser.size();i++){
	    		PTDeptBO dept = listuser.get(i);
	    		//如果是代理机构，一级委托管理机构下属的尸体
	    		if(dept.getRsvdNum1()!=null && "11262".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCerwtjg(String.valueOf(dept.getTid()));
	    		}else if(dept.getRsvdNum1()!=null && "113".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCyjwtjg("113");
	    		}
	    	}
	    }
	    String bodyJSON=contractUCCImpl.getJjzcHtBxHtViewByCondition(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
 		return null;
	}
	
	public String query4Elect() throws IOException {
		String params = request.getParameter("idStr");
		@SuppressWarnings("unused")
		List<JjzcHtBxHtView> jjzcHtBxHtViewList=new ArrayList<JjzcHtBxHtView>();
		String bodyJSON =null;
		if(queryVO==null){
			queryVO = new JjzcHtBxQueryVO();
		}
		IUser user = UserThreadLocal.get();
	    List<PTDeptBO> listuser = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
	    if(listuser != null && listuser.size()>0){
	    	for(int i=0;i<listuser.size();i++){
	    		PTDeptBO dept = listuser.get(i);
	    		//如果是代理机构，一级委托管理机构下属的尸体
	    		if(dept.getRsvdNum1()!=null && "11262".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCerwtjg(String.valueOf(dept.getTid()));
	    		}else if(dept.getRsvdNum1()!=null && "113".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCyjwtjg("113");
	    		}
	    	}
	    }
		//资产查询
		jjzcHtBxHtViewList=contractUCCImpl.getJjzcHtBxHtViewByCondition(queryVO,params);
		try{
			bodyJSON = BodyListToJSON.getJSON(jjzcHtBxHtViewList, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}catch(Exception e){ 
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	
	
	/**
	 * add by lantianbo 委管租赁合同查询
	 * @return
	 * @throws IOException 
	 */
	public String query1() throws IOException {
		String htlx = request.getParameter("contractType");//合同类型1为委管，2为租赁
		if(queryVO==null){
			queryVO = new JjzcHtBxQueryVO();
		}
		IUser user = UserThreadLocal.get();
	    List<PTDeptBO> listuser = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
	    if(listuser != null && listuser.size()>0){
	    	for(int i=0;i<listuser.size();i++){
	    		PTDeptBO dept = listuser.get(i);
	    		//如果是代理机构，一级委托管理机构下属的尸体
	    		if(dept.getRsvdNum1()!=null && "11262".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCerwtjg(String.valueOf(dept.getTid()));
	    		}else if(dept.getRsvdNum1()!=null && "113".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCyjwtjg("113");
	    		}
	    	}
	    }
		String bodyJSON = contractUCCImpl.getJjzcHtBxHtViewByCondition(htlx,queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	
	/**
	 * 展现选择的合同列表
	 * @return
	 */
	public String list(){
		edit = request.getParameter("edit");
		String ids = request.getParameter("ids");
		String headId = request.getParameter("headId");
		String[] htIds = null;
		if("edit".equals(edit)){
			List list = liquidateUCCimpl.getBodyListByHeadId(headId, paginator);
			sheettype = "modifyDetail";
			if(list!=null&&list.size()>0){
				 htIds = new String[list.size()];
				for(int i=0;i<list.size();i++){
					JyzcHtqsBody jyzcHtqsBody = (JyzcHtqsBody) list.get(i);
					String htId = jyzcHtqsBody.getHtId();
					htIds[i]=htId;
				}
			}
		}else{
			if(ids!=null){
				if(ids.startsWith(",")){
					ids = ids.substring(1);
				}
				sheettype="list";
			}
			 htIds = ids.split(",");
		}
		String htlx = request.getParameter("htlx");
		List list = this.contractUCCImpl.queryChooseHtListByIds(htIds,headId);
		request.setAttribute("list", list);
		request.setAttribute("headId",headId);
		request.setAttribute("htlx", htlx);
		return sheettype;
	}
	
	/**
	 * 展现选择的合同列表,清算查询里的录入实收页面
	 * @return
	 */
	public String list1(){
		edit = request.getParameter("edit");
		String ids = request.getParameter("ids");
		String headId = request.getParameter("headId");
		JjzcHtqsHead head = this.contractUCCImpl.getJjzcHtqsHeadById(headId);
		String[] htIds = null;
//		List list = liquidateUCCimpl.getBodyListByHeadId(headId, paginator);
		sheettype = "modifyDetail";
//		if(list!=null&&list.size()>0){
//			 htIds = new String[list.size()];
//			for(int i=0;i<list.size();i++){
//				JyzcHtqsBody jyzcHtqsBody = (JyzcHtqsBody) list.get(i);
//				String htId = jyzcHtqsBody.getHtId();
//				htIds[i]=htId;
//			}
//		}
		if("weiguan".equals(request.getParameter("qslx"))){
			sheettype = "modifyDetail1";
		}
		String htlx = request.getParameter("htlx");
		List list = this.contractUCCImpl.queryChooseHtListByIds1(htIds,headId);
		request.setAttribute("list", list);
		request.setAttribute("headId",headId);
		request.setAttribute("htlx", htlx);
		request.setAttribute("edit", edit);
		request.setAttribute("qspc", head.getQspc());
		return sheettype;
	}
	
	public String viewBody() { 
		System.out.println("==========================================================================");
		htlx = request.getParameter("htlx");
		htId = request.getParameter("htId");
		return sheettype;
	}
	public String getDetail(){
		String htId = request.getParameter("htId");
		String htlx = request.getParameter("htlx");
		try {
			htlx = java.net.URLDecoder.decode(htlx,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String returnValue = "";
		//根据htId得到一条合同的记录 
		//根据returnValue的值不同返回相应的页面
		if(htlx.equals("1")){
			jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgById(htId);
			returnValue = "weiguanInfo";
		}else if(htlx.equals("2")){
			jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgById(htId);
			this.prepareFeiyong();
			jdzjList = this.contractUCCImpl.getzsbJdzjList(htId);
			returnValue = "zulinInfo";
		}else if(htlx.equals("3")){
			jjzcHtBx = contractUCCImpl.getByJjzcHtBxsId(htId);
			returnValue = "chexianInfo";
		}if(htlx.equals("4")){
			jjzcHtBx = contractUCCImpl.getByJjzcHtBxsId(htId);
			returnValue = "feichexianInfo";
		}
		
		return returnValue;
	}
	private void prepareFeiyong() {
		System.out.println("=============prepareFeiyong========================");
		String fy = jjzcHtZlwg.getZjsfhwyf();
		System.out.println("====================================="+fy);
		if(fy!=null&&fy.length()>1){
			String []fys = fy.split(",");
			if(feiyong ==null){
				feiyong = new ZulinFeiyongVO();
			}
			feiyong.setWuyefei(fys[0]);
			feiyong.setShuidianfei(fys[1]);
			feiyong.setWeixiufei(fys[2]);
			feiyong.setTongxunfei(fys[3]);
			feiyong.setQitafei(fys[4]);
		}
	}

	public String  toView(){
		
		return sheettype;
	}
	
	
	/**
	 * 根据清算截止日期，得到应收租金
	 * @return
	 */
	public String getSszj(){
		String headId = request.getParameter("headId");
		String htbh = request.getParameter("htbh");
		String bodyId = request.getParameter("bodyId");
		String qsjzrq = request.getParameter("qsjzrq");
		
		String s = this.contractUCCImpl.getSszj(headId,htbh,bodyId,qsjzrq);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
		}
		return null;
	}
	/**
	 * 页面点击确定后，保存信息，应收租金,实收租金,清算截至日期
	 * @return
	 */
	public String saveSszj(){
		String [] qsjzrqs = request.getParameterValues("qsjzrq");
		String [] yszjs = request.getParameterValues("yszj");
		String [] sszjs = request.getParameterValues("sszj");
		String [] bodyIds = request.getParameterValues("bodyId");
		
		this.contractUCCImpl.saveSszj(qsjzrqs, yszjs, sszjs,bodyIds);
		request.setAttribute("message", "保存成功！");
		return "list";
	}
	
	/**
	 * 页面点击确定后，保存信息，应收租金,清算截至日期
	 * @return
	 */
	public String updateInfoToBody(){
		String [] qsjzrqs = request.getParameterValues("qsjzrq");
		String [] yszjs = request.getParameterValues("yszj");
		String [] bodyIds = request.getParameterValues("bodyId");
		String [] tzyy = request.getParameterValues("tzyy");
		String [] xghyszj = request.getParameterValues("xghyszj");
		String [] qstzje = request.getParameterValues("qstzje");
		String [] qsksrq = request.getParameterValues("qsksrq");
		String headId = request.getParameter("headId");
		String [] htbh = request.getParameterValues("htbh");
		String [] mzq = request.getParameterValues("mzq");
		this.contractUCCImpl.updateInfoToBody(headId,qsjzrqs,yszjs,qstzje,xghyszj,tzyy,htbh,qsksrq,bodyIds,mzq);
		request.setAttribute("message", "保存成功！");
		return "list";
	}
	
	/**
	 * 页面点击确定后，保存信息，
	 * @return
	 */
	public String updateInfoToBody1(){
		String [] bodyIds = request.getParameterValues("bodyId");
		String [] sszjs = request.getParameterValues("sszj");
		String [] bcbdjes = request.getParameterValues("bcbdje");
		String [] scbdjes = request.getParameterValues("scbdje");
		String [] bdyys = request.getParameterValues("bdyy");
		String headId = request.getParameter("headId");
		this.contractUCCImpl.updateInfoToBody1(headId,sszjs,bcbdjes,scbdjes,bdyys,bodyIds);
		request.setAttribute("message", "保存成功！");
		return "modifyDetail";
	}
	
	public String query4View() throws IOException {
		String contractType = request.getParameter("contractType");
		zcId = request.getParameter("zcId");
		String sheettype2 = request.getParameter("sheettype2");
		if("change".equals(sheettype)){
			jyzcXx  =assetUCCImpl.getJyzcXxByzclsbId(zcId);
			if(jyzcXx!=null){
				zcId = jyzcXx.getId();
			}
		}
		List<JjzcHtZlwg> jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgByzcIdandzcLx(zcId, contractType);
		System.out.println(jjzcHtZlwg.size());
		String bodyJSON = BodyListToJSON.getJSON(jjzcHtZlwg, 2, 1, 24);
		System.out.println(bodyJSON);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String query4Asset() throws IOException {
		String contractType = request.getParameter("contractType");
		zcId = request.getParameter("zcId");
		String sheettype2 = request.getParameter("sheettype2");
		if("change".equals(sheettype2)){
			jyzcXx  =assetUCCImpl.getJyzcXxByzclsbId(zcId);
			if(jyzcXx!=null){
				zcId = jyzcXx.getId();
			}
		}
		List<JjzcHtZlwg> jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgByzcIdandzcLxforAsset(zcId, contractType);
		System.out.println(jjzcHtZlwg.size());
		String bodyJSON = BodyListToJSON.getJSON(jjzcHtZlwg, 2, 1, 24);
		System.out.println(bodyJSON);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String delete(){
		String ids = request.getParameter("ids");
		if(ids!=null&&ids.length()>0){
			this.contractUCCImpl.deleteBody(ids);
		}
		return null;
	}
	public String update(){
		String id = request.getParameter("id");
		ClearQueryVO vo = this.contractUCCImpl.getClearQueryVOById(id);
		List list = new ArrayList();
		list.add(vo);
		request.setAttribute("list", list);
		request.setAttribute("isModify", "true");
		return "list";
	}
	public String look(){
		String id = request.getParameter("id");
		ClearQueryVO vo = this.contractUCCImpl.getClearQueryVOById(id);
		List list = new ArrayList();
		list.add(vo);
		request.setAttribute("list", list);
		request.setAttribute("isLook", "true");
		return "list";
	}
	
	public String selectinit() {
		return "selectinit";
	}

	public String validateHt(){
		
		String headId = (String)request.getParameter("headId");
		String htIds = (String)request.getParameter("htIds");
		String vaht = this.contractUCCImpl.validateHt(headId,htIds); 
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(vaht);
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

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public IContractUCC getContractUCCImpl() {
		return contractUCCImpl;
	}

	public void setContractUCCImpl(IContractUCC contractUCCImpl) {
		this.contractUCCImpl = contractUCCImpl;
	}

	public JjzcHtBxQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(JjzcHtBxQueryVO queryVO) {
		this.queryVO = queryVO;
	}



	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getHtId() {
		return htId;
	}

	public void setHtId(String htId) {
		this.htId = htId;
	}

	public String getHtlx() {
		return htlx;
	}

	public void setHtlx(String htlx) {
		this.htlx = htlx;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}
	

	public String flow(){
		String sheettype2 = request.getParameter("sheettype2");
		if("change".equals(sheettype2)){
			return "flow";
		}else{
			return "flow1";
		}
		
	}
	
	public String queryWorkFlow() {
		String josnStr = null;
		IUser user = UserThreadLocal.get();
		if (user == null) {
			throw new RuntimeException("用户无效.");
		}
		String strTitle = request.getParameter("title");
		String strHtId=request.getParameter("htId");
		List<PTEnd> list = contractUCCImpl.findMyPTEndList_nopage(strHtId, strTitle);
		System.out.println("根据合同编号查找"+"\n\n\n\n\n\n\n\n\n\n\n\n"+strHtId+"\n\n\n\n\n\n\n");
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(),
				paginator.getCurrentPage(), list.size());
		josnStr = generateUrl(josnStr);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String generateUrl(String jsonString) {
		JSONObject data = JSONObject.fromObject(jsonString);
		if (data != null) {
			JSONArray rows = data.getJSONArray("rows");
			for (Object object : rows.toArray()) {
				try {
					String userId = PropertyUtils.getProperty(object, "userId")
							.toString();
					String userName = pTTodoBS
							.getUserNameById(new Long(userId));
					PropertyUtils.setProperty(object, "userId", userName);
				} catch (IllegalAccessException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				} catch (InvocationTargetException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				} catch (NoSuchMethodException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				}
			}
		}
		return data.toString();
	}
	
	@Autowired
	PTTodoBS pTTodoBS;

	public PTTodoBS getPTTodoBS() {
		return pTTodoBS;
	}

	public void setPTTodoBS(PTTodoBS todoBS) {
		pTTodoBS = todoBS;
	}

	public List getJdzjList() {
		return jdzjList;
	}

	public void setJdzjList(List jdzjList) {
		this.jdzjList = jdzjList;
	}

	public ZulinFeiyongVO getFeiyong() {
		return feiyong;
	}

	public void setFeiyong(ZulinFeiyongVO feiyong) {
		this.feiyong = feiyong;
	}
	
	public String exportexcel() throws Exception {
		if(queryVO==null){
			queryVO = new JjzcHtBxQueryVO();
		}else{
			if("Thu Jan 01 00:00:00 CST 1970".equals(queryVO.getBeginTime1().toString())){
				queryVO.setBeginTime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(queryVO.getBeginTime2().toString())){
				queryVO.setBeginTime2(null);
			}
			if("Thu Jan 01 00:00:00 CST 1970".equals(queryVO.getEndTime1().toString())){
				queryVO.setEndTime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(queryVO.getEndTime2().toString())){
				queryVO.setEndTime2(null);
			}
		}
		IUser user = UserThreadLocal.get();
	    List<PTDeptBO> listuser = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
	    if(listuser != null && listuser.size()>0){
	    	for(int i=0;i<listuser.size();i++){
	    		PTDeptBO dept = listuser.get(i);
	    		//如果是代理机构，一级委托管理机构下属的尸体
	    		if(dept.getRsvdNum1()!=null && "11262".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCerwtjg(String.valueOf(dept.getTid()));
	    		}else if(dept.getRsvdNum1()!=null && "113".equals(dept.getRsvdNum1().toString())){
	    			queryVO.setCyjwtjg("113");
	    		}
	    	}
	    }
	   
		if(contractUCCImpl==null){
			contractUCCImpl=(IContractUCC)SpringContextHelper.getBean(ContractUCCImpl.class);
		}
		String bodyJSON ="";
		bodyJSON=contractUCCImpl.getJjzcHtBxHtViewByCondition(queryVO, paginator);
 		return bodyJSON;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.queryVO = (JjzcHtBxQueryVO)excelVO;
	}
}
