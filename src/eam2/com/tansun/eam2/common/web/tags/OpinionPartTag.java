package com.tansun.eam2.common.web.tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.web.components.OpinionPartComponent;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class OpinionPartTag extends OpinionTag{

	private static final long serialVersionUID = -5485092417017933489L;
	
	private String text;
	private String name;
	private String value;
	private String biaodanid;
	private String colspan;
	private String cols;
	private String rows;
	private String yjlx;
	private String leftTdStyle;
	private boolean isViewArea = true;
	
	public boolean isViewArea() {
		return isViewArea;
	}

	public void setViewArea(boolean isViewArea) {
		this.isViewArea = isViewArea;
	}

	public Component getBean(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		return new OpinionPartComponent(stack, request);
	}
	
	protected void populateParams() {
		super.populateParams();
		OpinionPartComponent opc = (OpinionPartComponent)component;
		opc.setText(text);
		opc.setName(name);
		opc.setValue(value);
		opc.setHeadid(biaodanid);
		opc.setColspan(colspan);
		opc.setStyle(getStyle());
		opc.setHeight(getHeight());
		opc.setCols(cols != null ? cols : "150");
		opc.setRows(rows != null ? rows : "4");
//		opc.setYjlx(yjlx);
		opc.setLeftTdStyle(leftTdStyle);
		opc.setViewArea(isViewArea);
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getBiaodanid() {
		return biaodanid;
	}

	public void setBiaodanid(String biaodanid) {
		this.biaodanid = biaodanid;
	}

	public String getColspan() {
		return colspan;
	}

	public void setColspan(String colspan) {
		this.colspan = colspan;
	}

	public String getCols() {
		return cols;
	}

	public void setCols(String cols) {
		this.cols = cols;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}
    /**
     * @deprecated
     * @return
     */
	public String getYjlx() {
		return yjlx;
	}

    /**
     * @deprecated
     * @param yjlx
     */
	public void setYjlx(String yjlx) {
		this.yjlx = yjlx;
	}

	public String getLeftTdStyle() {
		return leftTdStyle;
	}

	public void setLeftTdStyle(String leftTdStyle) {
		this.leftTdStyle = leftTdStyle;
	}
	
}
