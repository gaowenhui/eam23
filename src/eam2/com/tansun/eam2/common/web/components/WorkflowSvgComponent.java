package com.tansun.eam2.common.web.components;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.components.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.workflow.trace.WorkflowStates;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTAbandon;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTTodo;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class WorkflowSvgComponent extends Component  {
	private String id;
	private String width;
	private String height;
	private String style;
	private String name;
	private String instanceid;
	private String insid;
    private String format;
    private String pdk;
	private HttpServletRequest request;
	private String path;
	public WorkflowSvgComponent(ValueStack stack, HttpServletRequest request) {
		super(stack);
		this.request = request;
	}

	public WorkflowStates getWorkflowStates() {
		return (WorkflowStates)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("workflowStates");
	}

	@Override
	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		try {
			width = (width == null || width.length() == 0) ? "100%" : width;
			height = (height == null || height.length() == 0) ? "100%" : height;
			writer.write("<table \"" + getId() + "Table\" >");
			StringBuffer sb = new StringBuffer();
			sb.append("<tr>").append("\n");
			getSVGXML(sb);
			writer.write(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private void getSVGXML(StringBuffer sb) {
		insid = this.findString(this.instanceid);
		String w = (width != null && width.length() > 0) ? width : "78%";
		insid = (insid == null || insid.length() == 0) ? instanceid : insid;
		path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        //pluginspage=\"" + path + "/ocx/SVGView.exe\"
		sb.append("<td width=\"" + w + "\">").append("\n");
        String fm = (format == null || format.length() == 0) ? "image" : "svg";
        if("svg".equals(fm)){
            sb.append("<embed id=\"" + getId() + "\" src=\"" + path + "/word.jspa?COMMAND=exportWorkflowSvg&pdk=" + pdk + "&instanceid=" + insid + "&format=" + fm + "\" width=\"100%\" height=\"100%\"   type=\"image/svg-xml\"  />").append("\n");
        }else{
            sb.append("<img src=\"" + path + "/word.jspa?COMMAND=exportWorkflowSvg&pdk=" + pdk + "&instanceid=" + insid + "&format=" + fm + "\" id=\"" + getId() + "\" />").append("\n");
        }
        sb.append("</td>").append("\n");
        sb.append("<td valign=\"top\">").append("\n");
        sb.append("<table class=\"newTable\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">").append("\n");
        sb.append("<tr>").append("\n");
//        sb.append("<td class=\"panel-header\">&nbsp;</td>)") ;
        sb.append("<td class=\"panel-header\" align=\"center\" >环节名称</td>").append("<td class=\"panel-header\" align=\"center\" >提交人</td>").append("<td class=\"panel-header\" align=\"center\" >提交部门</td>").append("<td class=\"panel-header\" align=\"center\" >提交时间</td>").append("<td class=\"panel-header\" align=\"center\" >状态</td>").append("\n");
        sb.append("</tr>").append("\n");
        if(!getEnd(sb) && !getAbandon(sb)){
        	getDid(sb);
			getTodo(sb);
        }
        sb.append("</table>").append("\n");
        sb.append("</td>").append("\n");
	}
	
	

	private boolean getTodo(StringBuffer sb) {
		boolean isTodo = true;
		List<PTTodo> todos = getWorkflowStates().getTodo(insid);
		for (PTTodo todo : todos) {
			sb.append("<tr>").append("\n");
//			sb.append("<td class=\"td_zxy04\" width=\"10\"><img src=\"" + path + "/resource/ProjectImages/up.gif\"/></td>");
			sb.append("<td class=\"td_zxy04\">" + todo.getTaskName() + "</td>").append("<td class=\"td_zxy04\">" + UserCache.getUsernameById(todo.getUserId()) + "</td>").append("<td class=\"td_zxy04\">" + getWorkflowStates().getDeptName(todo.getDeptId()) + "</td>").append("<td class=\"td_zxy04\">" + DateUtils.formatDate(todo.getCreateDate(), "yyyy-MM-dd HH:mm") + "</td>").append("<td class=\"td_zxy04\">待办</td>").append("\n");
			sb.append("</tr>").append("\n");
		}
		return isTodo;
	}

	private boolean getDid(StringBuffer sb) {
		boolean isDid = true;
		List<PTDid> dids = getWorkflowStates().getDid(insid);
		for (PTDid did : dids) {
			sb.append("<tr>").append("\n");
//			sb.append("<td class=\"td_zxy04\"  width=\"10\"><img src=\"" + path + "/resource/ProjectImages/up.gif\"/></td>");
			sb.append("<td class=\"td_zxy04\">" + did.getTaskName() + "</td>").append("<td class=\"td_zxy04\">" + UserCache.getUsernameById(did.getUserId()) + "</td>").append("<td class=\"td_zxy04\">" + getWorkflowStates().getDeptName(did.getDeptId()) + "</td>").append("<td class=\"td_zxy04\">" + DateUtils.formatDate(did.getCreateDate(), "yyyy-MM-dd HH:mm") + "</td>").append("<td class=\"td_zxy04\">已办</td>").append("\n");
			sb.append("</tr>").append("\n");
		}
		return isDid;
	}
	
	private void getDidHistory(StringBuffer sb, String status){
		List<PTDid> dids = getWorkflowStates().getDidHistory(insid);
		for (PTDid did : dids) {
			sb.append("<tr>").append("\n");
//			sb.append("<td class=\"td_zxy04\"  width=\"10\"><img src=\"" + path + "/resource/ProjectImages/up.gif\"/></td>");
			sb.append("<td class=\"td_zxy04\">" + did.getTaskName() + "</td>").append("<td class=\"td_zxy04\">" + UserCache.getUsernameById(did.getUserId()) + "</td>").append("<td class=\"td_zxy04\">" + getWorkflowStates().getDeptName(did.getDeptId()) + "</td>").append("<td class=\"td_zxy04\">" + DateUtils.formatDate(did.getCreateDate(), "yyyy-MM-dd HH:mm") + "</td>").append("<td class=\"td_zxy04\">" + status + "</td>").append("\n");
			sb.append("</tr>").append("\n");
		}
	}
	
	private boolean getAbandon(StringBuffer sb) {
		PTAbandon ab = getWorkflowStates().getAbandon(insid);
		boolean isAbandon = false;
		if(ab != null){
			isAbandon = true;
			getDidHistory(sb, "作废");
		}
		return isAbandon;
	}

	private boolean getEnd(StringBuffer sb) {
		PTEnd en = getWorkflowStates().getEnd(insid);
		boolean isEnd = false;
		if(en != null){
			isEnd = true;
			getDidHistory(sb, "办结");
		}
		return isEnd;
	}
	
	@Override
	public boolean end(Writer writer, String body) {
		try{
			writer.write("</tr>");
			writer.write("</table>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.end(writer, body);
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getPdk() {
        return pdk;
    }

    public void setPdk(String pdk) {
        this.pdk = pdk;
    }
	
}
