package com.tansun.eam2.common.web.tags;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.dynamicform.web.components.CommonComponentBean;
import com.tansun.rdp4j.dynamicform.web.views.jsp.CommonStruts2Tag;
import com.tansun.rdp4j.file.FileCommon;

public class CounterSignTag extends CommonStruts2Tag implements
		ServletRequestAware, ServletContextAware, FileCommon {
	private static final long serialVersionUID = 1L;
	private static HttpServletRequest request;
	private ServletContext application;
	private ServletContext context;
	private String biaodanId;
	private String isJianTou;

	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new CounterSign(arg0, arg1, arg2);
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	protected void populateParams() {
		super.populateParams();
		CounterSign CounterSign = (CounterSign) component;
		CounterSign.setBiaodanId(biaodanId);
		CounterSign.setIsJianTou(isJianTou);
	}

	public String getBiaodanId() {
		return biaodanId;
	}

	public void setBiaodanId(String biaodanId) {
		this.biaodanId = biaodanId;
	}

	public String getIsJianTou() {
		return isJianTou;
	}

	public void setIsJianTou(String isJianTou) {
		this.isJianTou = isJianTou;
	}
}

class CounterSign extends CommonComponentBean {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String biaodanId;
	private String isJianTou;

	public CounterSign(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack, request);
		this.request = request;
		this.response = response;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getBiaodanId() {
		return biaodanId;
	}

	public void setBiaodanId(String biaodanId) {
		this.biaodanId = biaodanId;
	}

	@Override
	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		String headId=getBiandanID(biaodanId);
		StringBuffer stringbuffer = new StringBuffer();
		stringbuffer.append("\n<!---会签部门控件开始--->\n");
		stringbuffer.append("\n<!---表单ID:" + getBiandanID(biaodanId) + "--->\n");
		stringbuffer.append(getCounterSignDept(headId,0,isJianTou)+"\n");
		stringbuffer.append("<br>\n");
		stringbuffer.append(getCounterSignDept(headId,1,isJianTou)+"\n");
		stringbuffer.append("\n<!---会签部门控件结束--->\n");
		try {
			writer.write(stringbuffer.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	private String getCounterSignDept(String headId,int iType,String isJianTou) {
		StringBuffer stringbuffer=new StringBuffer();
		PublicDao publicDao = (PublicDao) SpringContextHelper
		.getBean("publicDao");
		List<PTDeptBO> list =new ArrayList();
		List params=new ArrayList();
		params.add(headId);
		params.add(iType);
		if("Y".equals(isJianTou)){//
			list=(List<PTDeptBO>) publicDao.find("select d from ETCounterSignBO o,PTDeptBO d  where d.tid=o.deptId and d.parId='10775' and  o.headId=? and o.isFinished = ? ", params);	
		}else if("N".equals(isJianTou)){//建银投资实业有限责任公司
			list=(List<PTDeptBO>) publicDao.find("select d from ETCounterSignBO o,PTDeptBO d  where d.tid=o.deptId and d.parId='113' and  o.headId=? and o.isFinished = ? ", params);
		}else{
			list=(List<PTDeptBO>) publicDao.find("select d from ETCounterSignBO o,PTDeptBO d  where d.tid=o.deptId and d.parId='10775' and  o.headId=? and o.isFinished = ? ", params);
		}
		
		for(PTDeptBO dept:list){
			stringbuffer.append(dept.getDeptName()+";");
		}
		String lable=(iType==0)?"正在办理的部门：":"办理完成的部门：";
		return "<div class='huiqianDept'>"+lable +stringbuffer.toString()+"</div>";
	}


	public String getBiandanID(String biaodanid) {
		if (biaodanid != null && biaodanid.length() != 0) {
			String n = biaodanid;
			if (biaodanid.startsWith("%{") && biaodanid.endsWith("}")) {
				n = stack.findString(biaodanid.substring(2,
						biaodanid.length() - 1));
			} else {
				n = stack.findString(biaodanid);
			}
			if (n == null || n.length() == 0) {
				n = biaodanid;
			}
			return n;
		}
		return biaodanid;
	}

	public String getIsJianTou() {
		return isJianTou;
	}

	public void setIsJianTou(String isJianTou) {
		this.isJianTou = isJianTou;
	}
}