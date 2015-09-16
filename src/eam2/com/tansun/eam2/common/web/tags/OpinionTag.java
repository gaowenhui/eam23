package com.tansun.eam2.common.web.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.web.components.OpinionComponent;
import com.tansun.rdp4j.dynamicform.web.views.jsp.CommonStruts2Tag;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class OpinionTag extends CommonStruts2Tag{
	
	private static final long serialVersionUID = -3742987234304620586L;
	
	private String width;
	private String height;
	private String style;
	private String align;
    private String hasTitle;
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		return new OpinionComponent(stack, request);
	}

	protected void populateParams() {
		super.populateParams();
		OpinionComponent odc = (OpinionComponent)component;
		odc.setWidth(width != null ? width : "100%");
		odc.setHeight(height);
		odc.setStyle(style != null ? style : "newTable");
		odc.setAlign(align != null ? align : "center");
	    odc.setHasTitle(hasTitle != null ? hasTitle : "true");
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

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

    public String getHasTitle() {
        return hasTitle;
    }

    public void setHasTitle(String hasTitle) {
        this.hasTitle = hasTitle;
    }

}
