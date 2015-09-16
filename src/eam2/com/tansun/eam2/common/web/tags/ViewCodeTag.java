package com.tansun.eam2.common.web.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.web.components.ViewCodeComponent;
import com.tansun.rdp4j.dynamicform.web.views.jsp.CommonStruts2Tag;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class ViewCodeTag  extends CommonStruts2Tag {
	
	private static final long serialVersionUID = 3559059698574012296L;
	
	private String codeKey;
	private String name;
	private String codeType;
	private String style;
	private boolean readonly;
	private boolean isInput = true;
	
	public boolean isReadonly() {
		return readonly;
	}

	public void setReadonly(boolean readonly) {
		this.readonly = readonly;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		return new ViewCodeComponent(stack, request);
	}

	@Override
	protected void populateParams() {
		super.populateParams();
		ViewCodeComponent vcc = (ViewCodeComponent)component;
		vcc.setId(getId());
		vcc.setName(name);
		vcc.setCodeKey(codeKey);
		vcc.setCodeType(codeType);
		vcc.setInput(isInput);
		vcc.setStyle(style);
		vcc.setReadonly(readonly);
	}

	public String getCodeKey() {
		return codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public boolean isInput() {
		return isInput;
	}

	public void setInput(boolean isInput) {
		this.isInput = isInput;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
