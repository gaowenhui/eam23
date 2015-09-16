package com.tansun.eam2.common.web.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.web.components.TreeComponent;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class TreeTag extends ComponentTagSupport {

	private static final long serialVersionUID = 7589052560679213694L;

	private String id;
	
	private String imagePath;
	
	private String multipe = "false";
	
	private String style;
	
	private String skin = "csh_dhx_skyblue";
	
	private String threeState = "false";
	
	private String openTargetId = "0";
	
	private String treetype;
	
	private String nodevalue;
	
	private String path;
	
	private String width = "100%";
	
	private String height = "100%";
	
	private String dataUrl = "/iTreeData.jspa";
	
	private ValueStack stack;
	
	public String getDataUrl() {
		return dataUrl;
	}

	public void setDataUrl(String dataUrl) {
		this.dataUrl = dataUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getMultipe() {
		return multipe;
	}

	public void setMultipe(String multipe) {
		this.multipe = multipe;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getThreeState() {
		return threeState;
	}

	public void setThreeState(String threeState) {
		this.threeState = threeState;
	}

	public String getOpenTargetId() {
		return openTargetId;
	}

	public void setOpenTargetId(String openTargetId) {
		this.openTargetId = openTargetId;
	}

	public String getTreetype() {
		return treetype;
	}

	public void setTreetype(String treetype) {
		this.treetype = treetype;
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

	public String getNodevalue() {
		return nodevalue;
	}

	public void setNodevalue(String nodevalue) {
		this.nodevalue = nodevalue;
	}

	@Override
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		stack = arg0;
		return new TreeComponent(arg0);
	}
	
	protected void populateParams() {
		super.populateParams();
		String url = dataUrl;
		if(treetype != null){
			String t = treetype;
			if(treetype.startsWith("%{") && treetype.endsWith("}")){
				t =  stack.findString(treetype.substring(2, treetype.length() - 1));
			}else{
				t = stack.findString(treetype);
			}
			if(t == null || t.length() == 0){
				t = treetype;
			}
			url += "?treetype=" + t;
			if(nodevalue != null){
				String n = nodevalue;
				if(nodevalue.startsWith("%{") && nodevalue.endsWith("}")){
					n = stack.findString(nodevalue.substring(2, nodevalue.length() - 1));
				}else{
					n = stack.findString(nodevalue);
				}
				n = (n == null || n.length() == 0) ? nodevalue : n;
				url += "&notevalue=" + n;
				
			}
		}
//		if(url != null && url.length() > 0){
//			url = stack.findString(this.dataUrl);
//			url = (url == null || url.length() == 0) ? this.dataUrl : url;
//		}
		TreeComponent tree = (TreeComponent) component;
		tree.setId(id);
		tree.setImagePath(imagePath);
		tree.setDataUrl(url);
		tree.setWidth(width);
		tree.setHeight(height);
		tree.setPath(path);
		tree.setMultipe(multipe);
		tree.setThreeState(threeState);
		tree.setOpenTargetId(openTargetId);
		tree.setSkin(skin);
		tree.setStyle(style);
	}   
}
