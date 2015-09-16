package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.vo.JyzcRiskVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

public class AssetRiskAction extends CommonAction {
	public JyzcRiskLsb jyzcRiskLsb;
	public JyzcRisk jyzcRisk;
	public String sheettype;
	private String sheettype2;//控制main 页面中输入框的控制 
	public String riskId;
	public String zcId;
	public String headId;
	// jyzcXxLsb临时表
	public JyzcXxLsb jyzcXxLsb;
	public Paginator paginator = new Paginator();
	@Autowired
	public IAssetUCC assetUCCImpl;
    @Autowired
    IUserUCC iUserUCCimpl;

    @Autowired 
	public ICodeGenerator iCodeGenerator;
	
	
	
	/**
	 * 生成风险编号
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
	 * 收回风险编号
	 * @return
	 * 
	 */
	public String regainNum() {
		String code = request.getParameter("code");
		 zcId = request.getParameter("zcId");
		String exist = "no";
		if(code!=null&&!"".equals(code)){
			exist = assetUCCImpl.fxbhExistyesORno(zcId,code);
		}
		if("no".equals(exist)){
			try {
				iCodeGenerator.disableCurrentCode("fxbh", code, "");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
    
	public String init() {
		jyzcRiskLsb =  new JyzcRiskLsb();
		jyzcRiskLsb.setZcId(zcId);
		//得到登录人的信息
		Long userId=UserThreadLocal.get().getUserTid();
		PTUserBO  userBo=iUserUCCimpl.getSingleById(userId);
		String userName=userBo.getUsername();
		//设置默认值
		jyzcRiskLsb.setLrr(userName);
		jyzcRiskLsb.setLrrq(new Date());
		return sheettype;
	}
	public String  modify() {
		String view = request.getParameter("view");
		sheettype2 = request.getParameter("sheettype2");
		riskId = (String) request.getAttribute("riskId");
		headId = request.getParameter("headId");
		jyzcRiskLsb = (JyzcRiskLsb) assetUCCImpl.getJyzcRiskLsbById(riskId);
		request.setAttribute("view", view);
		return sheettype;
	}
	public String  save() {
		sheettype2 = request.getParameter("sheettype2");
		if(riskId!=null&&!"".equals(riskId)){
			assetUCCImpl.update(jyzcRiskLsb);
		}else{
			assetUCCImpl.save(jyzcRiskLsb);
		}
		if("change".equals(sheettype2)){
			jyzcRisk = assetUCCImpl.getJyzcRiskByRiskId(jyzcRiskLsb.getFxbh());
			if(jyzcRisk!=null){
				assetUCCImpl.compareXxVsLsb(jyzcRisk, jyzcRiskLsb);
			}
		}
		riskId = jyzcRiskLsb.getId();
		request.setAttribute("riskId", riskId);
		return "tomodify";
	}
	public String delete(){
		riskId =request.getParameter("riskId");
		if (riskId.startsWith(",")) {
			riskId = riskId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] riskIds = null;
		riskIds = riskId.split(",");
		for(int i =0;i<riskIds.length;i++){
			jyzcRiskLsb = (JyzcRiskLsb) assetUCCImpl.getJyzcRiskLsbById(riskIds[i]);
			if(jyzcRiskLsb.getFxbh()!=null&&!"".equals(jyzcRiskLsb.getFxbh())){
				iCodeGenerator.disableCurrentCode("fxbh", jyzcRiskLsb.getFxbh(), "");
			}
			assetUCCImpl.delete(jyzcRiskLsb);
		}
		return null;
	}
	public String query4View() throws IOException {
		zcId = request.getParameter("zcId");
		String spzt = request.getParameter("spzt");
		List<JyzcRiskVO> list = null;
		if("pass".equals(spzt)){
			list = assetUCCImpl.getJyzcRiskByZcIdForView(zcId,paginator);
		}else{
			list = assetUCCImpl.getJyzcRiskLsbByZcIdForView(zcId,paginator);
		}
		 
		String bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
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

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public IAssetUCC getAssetUCCImpl() {
		return assetUCCImpl;
	}

	public void setAssetUCCImpl(IAssetUCC assetUCCImpl) {
		this.assetUCCImpl = assetUCCImpl;
	}


	public JyzcRiskLsb getJyzcRiskLsb() {
		return jyzcRiskLsb;
	}


	public void setJyzcRiskLsb(JyzcRiskLsb jyzcRiskLsb) {
		this.jyzcRiskLsb = jyzcRiskLsb;
	}


	public String getRiskId() {
		return riskId;
	}


	public void setRiskId(String riskId) {
		this.riskId = riskId;
	}


	public String getSheettype2() {
		return sheettype2;
	}


	public void setSheettype2(String sheettype2) {
		this.sheettype2 = sheettype2;
	}


	public JyzcXxLsb getJyzcXxLsb() {
		return jyzcXxLsb;
	}


	public void setJyzcXxLsb(JyzcXxLsb jyzcXxLsb) {
		this.jyzcXxLsb = jyzcXxLsb;
	}


	public JyzcRisk getJyzcRisk() {
		return jyzcRisk;
	}


	public void setJyzcRisk(JyzcRisk jyzcRisk) {
		this.jyzcRisk = jyzcRisk;
	}


	public Paginator getPaginator() {
		return paginator;
	}


	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}


	public String getHeadId() {
		return headId;
	}


	public void setHeadId(String headId) {
		this.headId = headId;
	}


	public IUserUCC getIUserUCCimpl() {
		return iUserUCCimpl;
	}


	public void setIUserUCCimpl(IUserUCC userUCCimpl) {
		iUserUCCimpl = userUCCimpl;
	}


	public ICodeGenerator getICodeGenerator() {
		return iCodeGenerator;
	}


	public void setICodeGenerator(ICodeGenerator codeGenerator) {
		iCodeGenerator = codeGenerator;
	}
}
