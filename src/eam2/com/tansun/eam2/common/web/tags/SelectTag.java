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

public class SelectTag extends org.apache.struts2.views.jsp.ui.SelectTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2922842835714470758L;
	
	private HttpServletRequest request;
	
	public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
		request = req;
		return super.getBean(stack, req, res);		
	}

	private String parRefKey;
	private String parentId;

	protected void populateParams() {
		super.populateParams();
		
		Select select = ((Select) component);
		try {
			FormStateHelper.setComponentValue(select, select.getId());
		} catch (Exception e) {
			System.err.println("页面权限控制文件未正常加载。" + e.getMessage());
		}
		if (!StringUtils.isEmpty(parRefKey)) {
			select.setList(getReferenceList());
		}
	}
	
	private String getReferenceList() {

		PublicDao publicDao = (PublicDao) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("publicDao");
		StringBuffer sb = new StringBuffer();
		if(parentId == null){
			List<Map<String, Object>> list = publicDao.queryForList(
							"select t.*, t.rowid from CODE t where t.code_type=? order by t.order_number asc",
							new String[] { parRefKey });
			
			sb.append("#{");
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> haspmap = list.get(i);
				String strValue = (String) haspmap.get("code_key");
				String strName = (String) haspmap.get("code_value");
				sb.append("'" + strValue + "':'" + strName + "'");
				if (i != list.size() - 1) {
					sb.append(",");
				}
			}
			sb.append("}");
		}else{
			String pid = getFindParentId();
			List<Map<String, Object>> list = publicDao.queryForList(
					"select t.*, t.rowid from individualtree t where t.parentcategoryid=? order by t.nodeorder asc",
					new String[] {pid});
			sb.append("#{");
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> haspmap = list.get(i);
				String strValue = (String) haspmap.get("nodevalue");
				String strName = (String) haspmap.get("categoryname");
				sb.append("'" + strValue + "':'" + strName + "'");
				if (i != list.size() - 1) {
					sb.append(",");
				}
			}
			sb.append("}");
		}
		return sb.toString();
	}

	private String getFindParentId(){
		String n = parentId;
		if(parentId != null){
			if(parentId.startsWith("%{") && parentId.endsWith("}")){
				n = getStack().findString(parentId.substring(2, parentId.length() - 1));
			}else{
				n = getStack().findString(parentId);
			}
			if(n == null || n.length() == 0){
				n = parentId;
			}
		}
		return n;
	}
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void setParRefKey(String parRefKey) {
		this.parRefKey = parRefKey;
	}

	public String getParRefKey() {
		return parRefKey;
	}
}
