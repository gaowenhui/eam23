package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.XWorkException;
import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzjLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwgLsb;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.JygdzcCommon;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.vo.AssetInfoVO;
import com.tansun.eam2.jygdzc.vo.HtViewVOZC;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzlBodyVO2;
import com.tansun.eam2.jygdzc.vo.WgHtViewVO;
import com.tansun.eam2.jygdzc.vo.ZulinFeiyongVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
/**
 * 合同Body信息 ContractManageBodyAction
 * 
 * @author lihuan
 * 
 */

public class ContractManageBodyAction extends CommonAction {
	public String sheettype;
	// JjzcHtZlwgLsb临时表
	public JjzcHtZlwgLsb jjzcHtZlwgLsb;
	// 正式表
	public JjzcHtZlwg jjzcHtZlwg;
	// 阶段租金 -----临时表
	public JjzcHtJdzjLsb jjzcHt;
	// 车险 和非车险要存的表 车险1:1 非车险n:1
	public JjzcHtBx jjzcHtBx;
	public String bmbh = "";
	// 接口
	@Autowired
	public IContractUCC contractUCCImpl;
	@Autowired
	public IUserUCC userUCCimpl;
	@Autowired
	public IAssetUCC assetUCCImpl;
	@Autowired
	PTTodoBS pTTodoBS;
	// 处理单
	public String headId;
	// 合同id
	public String htId;
	//用来判断是哪种操作业务
	public String bussiness;
	//用来判断显示在哪种情况下（info or change）
	public String sheettype2;
	public List<JjzcHtJdzjLsb> list = new ArrayList<JjzcHtJdzjLsb>();
	public List<HtViewVOZC> zcList = new ArrayList<HtViewVOZC>();
	//临时表id
	public  String lsbId;
	//分页器
	public Paginator paginator = new Paginator();

	@Autowired 
	public ICodeGenerator iCodeGenerator;
	
	//操作
	private String operate;
	//合同类型
	private String htlx;
	//判断业务类型
	private String ywlx;
	//是否为查看
	private String view;
	private String zcIds;
	private String message;
	private List jdzjList;
	private ZulinFeiyongVO feiyong;
	/**
	 * 生成处理单编号
	 * @return
	 * 
	 */
	public String createNum(){
		String code=request.getParameter("code");
		String bianhao = iCodeGenerator.generateCurrentCode(code, "", "");
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 回收合同编号
	 * @return
	 * 
	 */
	public String regainNum() {
		 String code = request.getParameter("code");
		 String  htbh = request.getParameter("htbh");
		 headId = request.getParameter("headId");
		 String exist = "no";
		 if(code!=null&&!"".equals(code)){
			exist = contractUCCImpl.codeExistyesORno(code,headId,htbh);
		 }
		 if("no".equals(exist)){
			iCodeGenerator.disableCurrentCode(code, htbh, "");
		 }
		
		return null;
	}
    
	
	/**
	 * 新增body入口 准备数据
	 * 
	 * @return
	 */
	public String newBody() {
		// 合同编码 是要给资产变动传值用的
		htId=request.getParameter("gr");
		jjzcHtZlwgLsb = new JjzcHtZlwgLsb();
		headId = request.getParameter("headId");
		// 设置录入人
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = userUCCimpl.getSingleById(userId);
		String userName = userBo.getUsername();
		// 录入人
		jjzcHtZlwgLsb.setLrr(userName);
		// 录入时间
		jjzcHtZlwgLsb.setLrrq(new Date());
		
		jjzcHtBx = new JjzcHtBx();
		//部门编号
		String bmbh = request.getParameter("bmbh");
		//切换页面--------根据sheettype 
		if(sheettype.equals("zulin")||sheettype.equals("weiguan")){
			 contractUCCImpl.saveJjzcHtZlwgLsb(jjzcHtZlwgLsb);
			 lsbId=jjzcHtZlwgLsb.getId();
			 request.setAttribute("htId", lsbId);
		}else if(sheettype.equals("chexian")||sheettype.equals("feichexian")){
			contractUCCImpl.saveJjzcHtBBxC(jjzcHtBx);
			 htId=jjzcHtBx.getId();
			 request.setAttribute("htId", htId);		
		}
		jjzcHtBx.setCldId(headId);
		jjzcHtZlwgLsb.setCldId(headId);
		request.setAttribute("headId", headId);
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("operate", operate);
		request.setAttribute("bmbh", bmbh);
		return "tomodify";
	}

	private void setJdyz(String htId) {
		//阶段租金
		String[] ksrq = request.getParameterValues("jjzcHtJdzj.ksrq");
		String[] jsrq = request.getParameterValues("jjzcHtJdzj.jsrq");
		String[] jzj = request.getParameterValues("jjzcHtJdzj.yzj");
		if (ksrq != null && ksrq.length > 0) {
			for (int i = 0; i < ksrq.length; i++) {
				JjzcHtJdzjLsb jjzcHtJdzj = new JjzcHtJdzjLsb();
				// 日期的需要转换 
				if(ksrq[i]!=null){
					jjzcHtJdzj.setJsrq(this.doConvertToDate(ksrq[i]));
				}
				if(jsrq[i]!=null){
					jjzcHtJdzj.setKsrq(this.doConvertToDate(jsrq[i]));
				}
				// 日期的需要转换 
				list.add(jjzcHtJdzj);
			}
		}
		contractUCCImpl.saveJyzchtJdzj(list);
	}

	/**
	 * 新增入口 准备数据---
	 * 
	 * @return
	 */
	public String saveBody() {
		String htIds = request.getParameter("htIds");
		String jwlx = request.getParameter("jwlx");

		if (bussiness.equals("")&&(jwlx.equals("1") || jwlx.equals("2"))) {
			headId = request.getParameter("headId");
			String[] htids = htIds.split(",");
			for (int i = 0; i < htids.length; i++) {
				jjzcHtZlwg = new JjzcHtZlwg();
				jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgById(htids[i]);
				jjzcHtZlwgLsb = contractUCCImpl.jjzcHtBx2Body(jjzcHtZlwg);
				//需要加一个字段来存放临时表与正式表之间的关联关系的
				
				jjzcHtZlwgLsb.setCldId(headId);
				contractUCCImpl.saveJjzcHtZlwgLsb(jjzcHtZlwgLsb);
			}
			return null;
		}
		// 看是新增还是查询
		if (bussiness.equals("addZW")) {
			if (JygdzcCommon.CONTRACT_WGHT.equals(jjzcHtZlwgLsb.getCHtlx())||
				JygdzcCommon.CONTRACT_ZLHT.equals(jjzcHtZlwgLsb.getCHtlx())) {
				if(JygdzcCommon.CONTRACT_ZLHT.equals(jjzcHtZlwgLsb.getCHtlx())){
					String [] ksrqs = request.getParameterValues("ksrq");
					String [] jsrqs = request.getParameterValues("jsrq");
					String [] yzjs = request.getParameterValues("yzj");
					this.contractUCCImpl.updateJdzjByHtId(jjzcHtZlwgLsb.getId(),ksrqs,jsrqs,yzjs);
					String wy = feiyong.getWuyefei();
					String sd = feiyong.getShuidianfei();
					String wx = feiyong.getWeixiufei();
					String tx = feiyong.getTongxunfei();
					String qt = feiyong.getQitafei();
					jjzcHtZlwgLsb.setZjsfhwyf(wy+","+sd+","+wx+","+tx+","+qt);
				}
				// 附加资产信息方面的值
				contractUCCImpl.updateJjzcHtZlwgLsb(jjzcHtZlwgLsb);
				if("change".equals(operate)){
					this.contractUCCImpl.saveRecordhistory(jjzcHtZlwgLsb);//对合同的变动信息进行记录
				}
				request.setAttribute("htId", jjzcHtZlwgLsb.getId());
			}
		} else if (bussiness.equals("addHT")) {
			if (JygdzcCommon.CONTRACT_CXHT.equals(jjzcHtBx.getHtlx())||
				JygdzcCommon.CONTRACT_FCXHT.equals(jjzcHtBx.getHtlx())) {
				// 附加资产信息方面的值
				contractUCCImpl.saveJjzcHtBBxC(jjzcHtBx);
				request.setAttribute("htId", jjzcHtBx.getId());
			}
		} else if (bussiness.equals("change")) {
			// 从合同查询查到一条到多条记录 --转到临时表里
			String gr = request.getParameter("htId");
			// 可能是多条的记录
			String[] grs;
			grs = gr.split(",");
			// 循环
			for (int i = 0; i < grs.length; i++) {
				if (!grs[i].equals("")) {
					contractUCCImpl.setValue(grs[i], headId);
				}
			}
		} else if (bussiness.equals("end")) {
			//
			// 从合同查询查到一条到多条记录 --转到临时表里
			String gr = request.getParameter("htId");
			// 可能是多条的记录
			String[] grs;
			grs = gr.split(",");
			// 循环
			for (int i = 0; i < grs.length; i++) {
				if (!grs[i].equals("")) {
					contractUCCImpl.setValue(grs[i], headId);
				}
			}
		}
		//String zcId = request.getParameter("zcId");
		
		// 根据id查到相应的数据
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", headId);
		request.setAttribute("message", "保存成功！");
		return "tomodify";
	}
	/**
	 * 查看 一条body信息
	 * 
	 * @return
	 */
	public String viewBody() { 
		htlx = request.getParameter("htlx");
		htId = request.getParameter("htId");
		headId = (String) request.getParameter("headId");
		view = "disabled";
		request.setAttribute("view", view);
		return sheettype;
	}
	/**
	 * 保存 主信息
	 * 
	 * @return
	 */
	public String modifyBody() {
		bmbh = (String)request.getAttribute("bmbh");
		operate = (String)request.getAttribute("operate");
		htId = (String) request.getAttribute("htId");
		// 取到request的值
		sheettype = (String) request.getAttribute("sheettype");
		headId = (String) request.getAttribute("headId");
		//切换页面--------根据sheettype 
		if("zulin".equals(sheettype)||"weiguan".equals(sheettype)){
			jjzcHtZlwgLsb =  contractUCCImpl.getJjzcHtZlwgLsbById(htId);
			jjzcHtZlwgLsb.setCldId(headId);
			if("zulin".equals(sheettype)){
				this.prepareFeiyong();
				jdzjList = this.contractUCCImpl.getJdzjList(htId);
			}
		}else if("chexian".equals(sheettype)||"feichexian".equals(sheettype)){
			jjzcHtBx = contractUCCImpl.getJjzcHtBxById(htId);
			jjzcHtBx.setCldId(headId);
		}
		
		//根据id找到对象
		
		String gr = request.getParameter("htId");
		String htlx = request.getParameter("htlx");
		
		if(gr != null && htlx!=null){
			//合同类型是3 或者 4的时候 从合同保险表里取数据
			if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)){
				jjzcHtZlwgLsb = contractUCCImpl.getJjzcHtZlwgLsbById(gr);
				sheettype = "weiguan";
			}else if(JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){
				jjzcHtZlwgLsb = contractUCCImpl.getJjzcHtZlwgLsbById(gr);
				sheettype = "zulin";
				this.prepareFeiyong();
				jdzjList = this.contractUCCImpl.getJdzjList(htId);
			}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){
				jjzcHtBx = contractUCCImpl.getByJjzcHtBxsId(gr);
				sheettype = "chexian";
			}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){
				jjzcHtBx = contractUCCImpl.getByJjzcHtBxsId(gr);
				sheettype = "feichexian";
			}
		}	
		if("zhongzhi".equals(sheettype)||"biandong".equals(sheettype)){   //add by lantianbo//终止合同或变动合同
			jjzcHtZlwgLsb = this.contractUCCImpl.getJjzcHtZlwgLsbById(gr);
			if("biandong".equals(sheettype)){
				htlx = jjzcHtZlwgLsb.getCHtlx();
				if(JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){
					sheettype = "zulin";
					this.prepareFeiyong();
					jdzjList = this.contractUCCImpl.getJdzjList(htId);
				}else if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)){
					jjzcHtZlwgLsb = contractUCCImpl.getJjzcHtZlwgLsbById(gr);
					sheettype = "weiguan";
				}
				ywlx = "change";
			}
		}
		message = (String) request.getAttribute("message");
		if("changeHistory".equals(sheettype)&&"changeHistoryInfo".equals(sheettype2)){
			sheettype = sheettype2;
		}
		return sheettype; 
	}
	public String intoBody(){
		operate = (String)request.getAttribute("operate");
	    htId = request.getParameter("htId");
	    htlx = request.getParameter("htlx");
		return sheettype;
	}
	//租赁合同里费用选项
	private void prepareFeiyong() {
		System.out.println("=============prepareFeiyong========================");
		String fy = jjzcHtZlwgLsb.getZjsfhwyf();
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

	/**
	 * 根据合同类型，合同id 查出合同关联的资产add by lantianbo 2010-12-28
	 * @return
	 */
	public String getZc4Ht(){
		String type = request.getParameter("type");
	try {
		if("pass".equals(type)){
			List<AssetInfoVO> assetInfoVOList= contractUCCImpl.getZc4HtInfo(htId,htlx);
			String bodyJSON = BodyListToJSON.getJSON(assetInfoVOList, 1,1,10000);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(bodyJSON);
		}else{
			String jsonStr = contractUCCImpl.getZc4Ht(htId,htlx);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据合同id，选择的资产id 删除资产与合同之间的关系
	 */
	public String deleteZc4Ht(){
		this.contractUCCImpl.deleteZc4Ht(htId,zcIds,htlx);
		return null;
	}
	
	/**
	 * 添加资产
	 * @return
	 */
	public String getZcList() {
//		String zcId = request.getParameter("zcId");
//		zcList = assetUCCImpl.getByCondition(zcId, paginator);
//		if(zcList != null){
//			request.setAttribute("zcList", zcList);
//			String bodyJSON = null;
//			bodyJSON = BodyListToJSON.getJSON(zcList, 1, 1, 1);
//			response.setCharacterEncoding("UTF-8");
//			try {
//				response.getWriter().print(bodyJSON);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		this.contractUCCImpl.queryZcList(htId,zcIds,htlx);
		return null;

	}

	/**
	 * 删除 一条/多条
	 * 
	 * @return
	 */
	public String deleteBody() {
		String gr = request.getParameter("htId");
		sheettype = request.getParameter("sheettype");
		headId = request.getParameter("headId");
		if(gr.startsWith(",")){
			gr = gr.substring(1);
		}
		String[] htIds = gr.split(",");
//		for (int i = 0; i < htIds.length; i++) {
//			if (htIds[i] != null && htIds[i] != "") {
//				contractUCCImpl.deleteJjzcHtZlwgLsb(htIds[i]);
//				contractUCCImpl.deleteJjzcHtBx(htIds[i]);
//			}
//		}
		contractUCCImpl.deleteBodys(htIds);
		return null;
	}

	public String updateBody(){
		//得到记录并且修改
		this.contractUCCImpl.zhongzhiContract(htId,jjzcHtZlwgLsb);
		request.setAttribute("sheettype",sheettype);
		//contractUCCImpl.getSingleAndUpdate(htId);
		request.setAttribute("message", "保存成功！");
		return "tomodify";
	}
	
	public String query4History(){
		String spzt = request.getParameter("spzt");
		htId = request.getParameter("htId");
		headId = request.getParameter("headId");
		String bodyJSON = null;
		List<Recordhistory> recordList = null;
		List<JyzcHtqsBody> jyzcHtqsBodyList = null;
		try {
			String type = request.getParameter("type");
			if ("changeHistory".equals(sheettype)) {
				if ("pass".equals(spzt)) {
					if("change".equals(type)){
						jjzcHtZlwgLsb =contractUCCImpl.getJjzcHtZlwgLsbById(htId);
						if(jjzcHtZlwgLsb!=null){
							recordList = contractUCCImpl.getRecordhistoryByhtbh(jjzcHtZlwgLsb.getHtbh());
						}
					}else{
						jjzcHtZlwg =contractUCCImpl.getJjzcHtZlwgById(htId);
						if(jjzcHtZlwg!=null){
							recordList = contractUCCImpl.getRecordhistoryByhtbh(jjzcHtZlwg.getHtbh());
						}
					}
				} else {
					recordList = contractUCCImpl.getRecordhistoryByhtId(htId, headId);
				}
				bodyJSON = BodyListToJSON.getJSON(recordList, 1,1,10000);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(bodyJSON);
			}else if("liquidate".equals(sheettype)){
				if("change".equals(type)){
					jjzcHtZlwgLsb =contractUCCImpl.getJjzcHtZlwgLsbById(htId);
					if(jjzcHtZlwgLsb!=null){
						jyzcHtqsBodyList = contractUCCImpl.getJyzcHtqsBodyByhtbh(jjzcHtZlwgLsb.getHtbh());
					}
				}else{
					jjzcHtZlwg =contractUCCImpl.getJjzcHtZlwgById(htId);
					if(jjzcHtZlwg!=null){
						jyzcHtqsBodyList = contractUCCImpl.getJyzcHtqsBodyByhtbh(jjzcHtZlwg.getHtbh());
					}
				}
				bodyJSON = BodyListToJSON.getJSON(jyzcHtqsBodyList, 1,1,10000);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(bodyJSON);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 根据查询值得到
	 * 
	 * @return
	 * @throws IOException
	 */
	public String query4View() throws IOException {
		try {
			headId = request.getParameter("headId");
			// 委管
			List<JyzlBodyVO2> assetList1 = contractUCCImpl .getJyzlBodyVO2ByCldId(headId);
			List<JyzlBodyVO> assetList2 = contractUCCImpl .getJyzlBodyVOByCldId(headId);
			List<WgHtViewVO> list = new ArrayList<WgHtViewVO>();
			if (assetList1 != null) {
				for (JyzlBodyVO2 jyzlBodyVO : assetList1) {
					WgHtViewVO ddd = new WgHtViewVO();
					ddd.setId(jyzlBodyVO.getId());
					ddd.setHtlx(jyzlBodyVO.getCHtlx());
					ddd.setHtbh(jyzlBodyVO.getHtbh());
					ddd.setHtzzrq(jyzlBodyVO.getHtzzrq());//modify by lantianbo
					ddd.setHtksrq(jyzlBodyVO.getHtqsrq());
					ddd.setHtdqrq(jyzlBodyVO.getHtdqrq());
					ddd.setZcbh(jyzlBodyVO.getZcbh());
					ddd.setZcmc(jyzlBodyVO.getZcmc());
					list.add(ddd);
				}
			}
			if (assetList2 != null) {
				for (JyzlBodyVO jyzlBodyVO : assetList2) {
					WgHtViewVO ddd = new WgHtViewVO();
					ddd.setId(jyzlBodyVO.getId());
					ddd.setHtlx(jyzlBodyVO.getHtlx());
					ddd.setHtbh(jyzlBodyVO.getHtbh());
					ddd.setHtzzrq(jyzlBodyVO.getHtdqrq());
					ddd.setHtksrq(jyzlBodyVO.getHtqsrq());
					ddd.setZcbh(jyzlBodyVO.getZcbh());
					ddd.setZcmc(jyzlBodyVO.getZcmc());
					list.add(ddd);
				}
			}

			String bodyJSON = null;
			bodyJSON = BodyListToJSON.getJSON(list, 1, 1, 10000);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(bodyJSON);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 向session里放值
	private void getDate(String headId) {
		// 根据headId 查找到所有的Body

	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public JjzcHtZlwgLsb getJjzcHtZlwgLsb() {
		return jjzcHtZlwgLsb;
	}

	public void setJjzcHtZlwgLsb(JjzcHtZlwgLsb jjzcHtZlwgLsb) {
		this.jjzcHtZlwgLsb = jjzcHtZlwgLsb;
	}

	public JjzcHtZlwg getJjzcHtZlwg() {
		return jjzcHtZlwg;
	}

	public void setJjzcHtZlwg(JjzcHtZlwg jjzcHtZlwg) {
		this.jjzcHtZlwg = jjzcHtZlwg;
	}

	public JjzcHtJdzjLsb getJjzcHt() {
		return jjzcHt;
	}

	public void setJjzcHt(JjzcHtJdzjLsb jjzcHt) {
		this.jjzcHt = jjzcHt;
	}

	public JjzcHtBx getJjzcHtBx() {
		return jjzcHtBx;
	}

	public void setJjzcHtBx(JjzcHtBx jjzcHtBx) {
		this.jjzcHtBx = jjzcHtBx;
	}

	public IContractUCC getContractUCCImpl() {
		return contractUCCImpl;
	}

	public void setContractUCCImpl(IContractUCC contractUCCImpl) {
		this.contractUCCImpl = contractUCCImpl;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getHtId() {
		return htId;
	}

	public void setHtId(String htId) {
		this.htId = htId;
	}
	
	// 时间转换器
	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd");
	private static final SimpleDateFormat sdf2 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	private Date doConvertToDate(Object value) {

		Date result = null;
		if (value instanceof String) {
			String valueStr = (String) value;
			try {
				if (valueStr.length() < 11) {
					result = sdf.parse(valueStr);
				} else {
					result = sdf2.parse(valueStr);
				}
			} catch (java.text.ParseException e) {
				throw new XWorkException("Could not parse date", e);
			}
		} else if (value instanceof Object[]) {
			Object[] array = (Object[]) value;
			if ((array != null) && (array.length >= 1)) {
				value = array[0];
				result = doConvertToDate(value);
			}
		} else if (Date.class.isAssignableFrom(value.getClass())) {
			result = (Date) value;
		}
		return result;
	}
	
	
	public String savebiandong(){
		contractUCCImpl.updateJjzcHtZlwgLsb(jjzcHtZlwgLsb);
		//产生变动临时表
		jjzcHtZlwg = (JjzcHtZlwg)request.getAttribute("zsb");
		contractUCCImpl.compareHtVsBody(jjzcHtZlwgLsb,jjzcHtZlwg);
		headId = (String) request.getParameter("headId");
		request.setAttribute("jjzcHtZlwgLsb",jjzcHtZlwgLsb);
		return "contractInfo";
	}
	public String modifyBodyLsb(){
		jjzcHtZlwgLsb = contractUCCImpl.getJjzcHtZlwgLsbById((String) request
				.getParameter("headId"));
		return "contractInfo";
	}
	

	/**
	 * 变动修改-显示资产信息
	 * @return
	 */
	public String getString1() {
		String htId = request.getParameter("htId");
		String josnStr = null;
		List<JyzcXx> list = contractUCCImpl.getJyzcXxByWgId(htId);
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(),
				paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	/**
	 * 变动修改-显示变动信息
	 * @return
	 */
	public String getString2() {
		String htId = request.getParameter("htId");
		String josnStr = null;
		List<Recordhistory> list = contractUCCImpl.getBianDongByHtId(htId);
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(),
				paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//合同的流程信息
	public String queryWorkFlow() {
		String josnStr = null;
		IUser user = UserThreadLocal.get();
		String htbh = "";
		if (user == null) {
			throw new RuntimeException("用户无效.");
		}
		String strTitle = request.getParameter("title");
		if ("change".equals(sheettype2)) {
			jjzcHtZlwgLsb = contractUCCImpl.getJjzcHtZlwgLsbById(htId);
			if(jjzcHtZlwgLsb!=null){
				htbh = jjzcHtZlwgLsb.getHtbh();
			}
		}else{
			jjzcHtZlwg = contractUCCImpl.getJjzcHtZlwgById(htId);
			if (jjzcHtZlwg != null) {
				htbh = jjzcHtZlwg.getHtbh();
			}
		}
		List<PTEnd> list = contractUCCImpl.findMyPTEndList_nopage(htbh, strTitle);
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
	/**
	 * 变动修改-显示清算信息
	 * @return
	 */
	public String getString3() {
		String htId = request.getParameter("htId");
		String josnStr = null;
		List<JjzcHtqsHead> list = contractUCCImpl.getQingSuanByHtId(htId);
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(),
				paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getHtlx() {
		return htlx;
	}
	public void setHtlx(String htlx) {
		this.htlx = htlx;
	}
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}
	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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


	public String getYwlx() {
		return ywlx;
	}


	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}


	public String getView() {
		return view;
	}


	public void setView(String view) {
		this.view = view;
	}


	public String getSheettype2() {
		return sheettype2;
	}


	public void setSheettype2(String sheettype2) {
		this.sheettype2 = sheettype2;
	}
}
