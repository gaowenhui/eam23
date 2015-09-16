package com.tansun.eam2.common.web.tags;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.components.Component;
import org.apache.struts2.components.Select;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.dynamicform.util.FormStateHelper;

public class DeptTag extends org.apache.struts2.views.jsp.ui.SelectTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4245179616755857589L;
	/**
	 * 
	 */
	
	private HttpServletRequest request;
	
	public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
		request = req;
		return super.getBean(stack, req, res);		
	}

	private String userTid;
	protected void populateParams() {
		super.populateParams();
		
		Select select = ((Select) component);
		try {
			FormStateHelper.setComponentValue(select, select.getId());
		} catch (Exception e) {
			System.err.println("页面权限控制文件未正常加载。" + e.getMessage());
		}
		if (!StringUtils.isEmpty(userTid)) {
			select.setList(getReferenceList());
		}
	}
	
	private String getReferenceList() {
		
		PublicDao publicDao = (PublicDao) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("publicDao");
		//String userTid1 = getCodeKeyOgnl(userTid);
		StringBuffer sb = new StringBuffer();
			if(userTid!=null&&!"".equals(userTid)){
				List<Map<String, Object>> list = publicDao.queryForList(
						"select t.RSVD_NUM1, t.RSVD_STR1 from p_t_dept t where t.tid in(select a.DEPT_ID from P_T_USER_L_DEPT a where a.USER_ID = ?)  and t.DEL_FLAG_CD ='002002' order by t.tid asc",
						new String[] { userTid });
				sb.append("#{");
				if(list!=null &&list.size()>0){
					for (int i = 0; i < list.size(); i++) {
						Map<String, Object> haspmap = list.get(i);
						String tid = haspmap.get("RSVD_NUM1").toString();
						String dept_name = (String) haspmap.get("RSVD_STR1");
						sb.append("'" + tid + "':'" + dept_name + "'");
						if (i != list.size() - 1) {
							sb.append(",");
						}
					}
				}
				sb.append("}");
			}	
		return sb.toString();
	}
	public String getUserTid() {
		return userTid;
	}

	public void setUserTid(String userTid) {
		this.userTid = userTid;
	}


}
