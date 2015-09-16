package com.tansun.eam2.common.web.components;

import java.io.IOException;
import java.io.Writer;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class TreeComponent extends Component{
	
	private String id;
	
	private String imagePath;
	
	private String multipe;
	
	private String style;
	
	private String skin;
	
	private String threeState;
	
	private String openTargetId;
	
	private String width;
	
	private String path;
	
	private String height;
	
	private String dataUrl;
	
	public TreeComponent(ValueStack stack) {
		super(stack);
	}
	
	@Override
	public boolean start(Writer writer) {
		boolean result =  super.start(writer);
		try {
			writer.write(getDiv());
			writer.write(getScript());
		} catch (RuntimeException e) {
			throw new RuntimeException(e);
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}
		return result;
	}

	private String getScript() {
		StringBuffer script = new StringBuffer();
		script.append("<script type=\"text/javascript\">").append("\n");
		script.append("	var " + id + "Tree = new dhtmlXTreeObject(\"" + id + "\", \"" + width + "\", \"" + height + "\", \"0\");").append("\n");
		script.append("	" + id + "Tree.setSkin('" + skin + "');").append("\n");
		script.append("	" + id + "Tree.setImagePath(\"" + path + imagePath + "/\");").append("\n");
		script.append("	" + id + "Tree.loadXML(\"" + path + getDataUrl() + "\");").append("\n");
		script.append("	" + id + "Tree.openAllItems('" + openTargetId + "');").append("\n");
		script.append("	" + id + "Tree.enableCheckBoxes(" + multipe + ");").append("\n");
		if("true".equals(multipe)){
			script.append("	" + id + "Tree.enableThreeStateCheckboxes(" + threeState + ");").append("\n");
		}
		script.append("</script>");
		return script.toString();
	}
	
	private String getDiv() {
		String div = "<div id=\"" + id + "\" style=\"" + style + "\"></div>\n";
		return div;
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

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getDataUrl() {
		return dataUrl;
	}

	public void setDataUrl(String dataUrl) {
		this.dataUrl = dataUrl;
	}
	
}
