package com.tansun.eam2.jygdzc.vo;


public class JyzcHtJdzjVO {
	//ID
	private String id;
	//合同ID
	private String htId;
	//开始日期
	private String ksrq;
	//结束日期
	private String jsrq;
	//变动
	private String biandong;
	//月租金
	private String yzj;
	
	public JyzcHtJdzjVO(String id, String htId, String ksrq, String jsrq,
			String biandong, String yzj) {
		super();
		this.id = id;
		this.htId = htId;
		this.ksrq = ksrq;
		this.jsrq = jsrq;
		this.biandong = biandong;
		this.yzj = yzj;
	}
	public JyzcHtJdzjVO() {
		super();
	}
	//月租金
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHtId() {
		return htId;
	}
	public void setHtId(String htId) {
		this.htId = htId;
	}
	public String getKsrq() {
		return ksrq;
	}
	public void setKsrq(String ksrq) {
		this.ksrq = ksrq;
	}
	public String getJsrq() {
		return jsrq;
	}
	public void setJsrq(String jsrq) {
		this.jsrq = jsrq;
	}
	public String getBiandong() {
		return biandong;
	}
	public void setBiandong(String biandong) {
		this.biandong = biandong;
	}
	public String getYzj() {
		return yzj;
	}
	public void setYzj(String yzj) {
		this.yzj = yzj;
	}
}
