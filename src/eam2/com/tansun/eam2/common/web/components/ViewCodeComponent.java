package com.tansun.eam2.common.web.components;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.dynamicform.web.components.CommonComponentBean;

public class ViewCodeComponent extends CommonComponentBean {

	private String codeKey;
	private String name;
	private boolean readonly = false;
	private String codeType;
	private boolean isInput = true;
	private String style;
	private ValueStack stack;
	private HttpServletRequest request;
	public boolean isReadonly() {
		return readonly;
	}

	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}

	public String getStyle() {
		style = StringUtils.isEmpty(style) ? "" : style;
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public ViewCodeComponent(ValueStack stack, HttpServletRequest req) {
		super(stack, req);
		this.stack = stack;
		this.request = req;
	}

	@Override
	public boolean start(Writer writer) {
		try {
			writer.write(getReferenceList());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.start(writer);
	}
	
	
	private String getReferenceList() {

		PublicDao publicDao = (PublicDao) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("publicDao");
		StringBuffer sb = new StringBuffer();
		if(codeKey != null){
			String codeKeynew = getCodeKeyOgnl(codeKey);
			List<Map<String, Object>> list = publicDao.queryForList(
							"select t.code_key, t.code_name, t.code_value, t.code_type from CODE t where t.code_type=? and t.code_key=? ",
							new String[] { codeType, codeKeynew });
			
			sb.append("");
			String strValue = "";
			String strKey = "";
			if(list != null && list.size() > 0){
				Map<String, Object> haspmap = list.get(0);
				strKey = (String) haspmap.get("code_key");
				strValue = (String) haspmap.get("code_value");
				if(isInput){
					sb.append("<input type=\"text\" readonly=\"" + (isReadonly()?"\"readonly\"":"") + "\" class=\"" + getStyle() + "\" id=\"" + getId() + "\" name=\"" + (name != null && name.length() > 0 ? name : strKey) + "\" value=\"" + strValue + "\" />");
				}else{
					sb.append(strValue);
				}
			}else{
				if(isInput){
					sb.append("<input type=\"text\" readonly=\"" + (isReadonly()?"\"readonly\"":"") + "\" class=\"" + getStyle() + "\" id=\"" + getId() + "\" name=\"" + (name != null && name.length() > 0 ? name : strKey) + "\" value=\"" + strValue + "\" />");
				}else{
					sb.append(strValue);
				}
			}
			sb.append("\n");
		}
		return sb.toString();
	}

	private String getCodeKeyOgnl(String codeKey2) {
		String value = codeKey2;
		if(codeKey2.startsWith("%{") && codeKey2.endsWith("}")){
			value = stack.findString(codeKey2.substring(2, codeKey2.length() - 1));
		}else{
			value = stack.findString(codeKey2);
		}
		if(value == null || value.length() == 0){
			value = codeKey2;
		}
		return value;
	}

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public boolean isInput() {
		return isInput;
	}

	public void setInput(boolean isInput) {
		this.isInput = isInput;
	}
	
	
}
