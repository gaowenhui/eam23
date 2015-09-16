package com.tansun.eam2.common.web.components;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.rdp4j.dynamicform.web.components.CommonComponentBean;

public class OpinionComponent extends CommonComponentBean {
	
	private String id;
	private String width;
	private String height;
	private String style;
	private String align;
    private String hasTitle;
	HttpServletRequest request;
	public OpinionComponent(ValueStack stack, HttpServletRequest req) {
		super(stack, req);
		this.request = req;
	}

	public boolean start(Writer writer) {
		boolean result =  true;
		try {
			writer.write(getTableHead());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public boolean end(Writer writer, String body) {
		boolean result = super.end(writer, body);
		try {
			writer.write("</table>\n");
            writer.write("</div>\n");
            writer.write("</div>\n");
            writer.write("</td></tr>\n");
            writer.write("</table>\n");
			String input = (String)request.getAttribute("BACK_OPERATION_IDS_TAG");
			if(input != null && input.length() > 0){
				writer.write("<input type=\"hidden\" id=\"BACK_OPERATION_IDS\" name=\"BACK_OPERATION_IDS\" value=\"" + input + "\" />");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	private String getTableHead() {
		StringBuffer sb = new StringBuffer();
		String h = "" ;
		if(height != null){
			h = " \" height=\"" + height;
		}
		String divId = getId() == null ? "OpinionDiv" : getId() + "Div";
		String tableStyle = "newTable";
		if(style != null && style.length() > 0)
			tableStyle = style;
		sb.append("<table width=\"" + width + h + "\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" >").append("\n");
		sb.append("<tr><td>");
        sb.append("<div id=\"").append(divId).append("\" class=\"ui-jqgrid-view ui-jqgrid ui-widget ui-widget-content ui-corner-all\" style=\"width:100%;\">").append("\n");
        sb.append("<div class=\"ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix\"><a href=\"javascript:changeDivStatus('").append(divId).append("')\" role=\"link\" class=\"ui-jqgrid-titlebar-close HeaderButton\" style=\"right: 0px;\"><span class=\"ui-icon ui-icon-circle-triangle-n\"></span></a><span class=\"ui-jqgrid-title\">审批信息</span></div>").append("\n");
        sb.append("<div class=\"ui-jqgrid-bdiv\">").append("\n");
		sb.append("<table width=\"" + width + h + "\" border=\"0\" class=\"" + tableStyle + "\" cellpadding=\"2\" cellspacing=\"0\" align=\"" + align + "\">").append("\n");
		sb.append("<input type=\"hidden\" name=\"OPINION_HAS_SAVE\" value=\"N\"/>").append("\n");
		return sb.toString();
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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
