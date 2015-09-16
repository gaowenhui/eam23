package com.tansun.eam2.common.web.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.web.components.WorkflowSvgComponent;

public class WorkflowTraceTag extends ComponentTagSupport{
	private String width;
	private String height;
	private String style;
	private String name;
	private String instanceid;
    private String pdk;
    private String format;
	private static final long serialVersionUID = 302467709830735279L;
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		return new WorkflowSvgComponent(stack, request);
	}

	protected void populateParams() {
		super.populateParams();
		WorkflowSvgComponent odc = (WorkflowSvgComponent)component;
		odc.setWidth(width);
		odc.setHeight(height);
		odc.setName(name);
		odc.setInstanceid(instanceid);
		odc.setStyle(style);
		odc.setId(this.getId());
        odc.setFormat(format);
        odc.setPdk(pdk);
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInstanceid() {
		return instanceid;
	}

	public void setInstanceid(String instanceid) {
		this.instanceid = instanceid;
	}

    public void setFormat(String format) {
        this.format = format;
    }

    public String getFormat() {
        return format;
    }

    public void setPdk(String pdk) {
        this.pdk = pdk;
    }

    public String getPdk() {
        return pdk;
    }

}
