package com.tansun.eam2.jygdzc.vo;

public class JBHCommonVO {

	private String jbhkey;
	private String jbhvalue;
	
	public String getJbhkey() {
		return jbhkey;
	}
	public void setJbhkey(String jbhkey) {
		this.jbhkey = jbhkey;
	}
	public String getJbhvalue() {
		return jbhvalue;
	}
	public void setJbhvalue(String jbhvalue) {
		this.jbhvalue = jbhvalue;
	}
	
	public JBHCommonVO(String jbhkey, String jbhvalue) {
		super();
		this.jbhkey = jbhkey;
		this.jbhvalue = jbhvalue;
	}
	
	public JBHCommonVO() {
	}
}
