package com.tansun.eam2.oa.en;

public class EamResult implements java.io.Serializable{
	public static final String STATUS_CODE_OK = "OK";
	public static final String STATUS_CODE_ERROR = "ERROR";
	public static final String ERRORINFO_NORMAL = "0";
	public static final String ERRORINFO_ERROR = "ERROR";
	private static final long serialVersionUID = -3995502075359193188L;
	private String status;
	private String errorinfo;
	private String url;
	private String lcid;
	private String dqhj;
	private String dqr;
	private String statuinfo;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getErrorinfo() {
		return errorinfo;
	}
	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLcid() {
		return lcid;
	}
	public void setLcid(String lcid) {
		this.lcid = lcid;
	}
	
	
	public String getDqhj() {
		return dqhj;
	}
	public void setDqhj(String dqhj) {
		this.dqhj = dqhj;
	}
	public String getDqr() {
		return dqr;
	}
	public void setDqr(String dqr) {
		this.dqr = dqr;
	}
	public String getStatuinfo() {
		return statuinfo;
	}
	public void setStatuinfo(String statuinfo) {
		this.statuinfo = statuinfo;
	}

	public String toString(){
	    final String TAB = ",";
	    
	    String retValue = "";
	    
	    retValue = "EamResult:{"
	        + super.toString() + TAB
	        + "status:" + this.status + TAB
	        + "errorinfo:" + this.errorinfo + TAB
	        + "url:" + this.url + TAB
	        + "lcid:" + this.lcid + TAB
	        + "dqhj:" + this.dqhj + TAB
	        + "dqr:" + this.dqr + TAB
	        + "statuinfo:" + this.statuinfo + TAB
	        + " }";
	
	    return retValue;
	}

	public String toFinishEAMFlow(){
		return "status=" + this.status + "####errorinfo=" + this.errorinfo;
	}
	
	public String toStartEAMFlow(){
		return "status=" + this.status + "####errorinfo=" + this.errorinfo + "####lcid=" + this.lcid + "####url=" + this.url;
	}
	public String toQueryEAMFlow() {
		return "status=" + this.status + "####errorinfo=" + this.errorinfo + "####dqhj=" + this.dqhj + "####dqr=" + this.dqr + "####statuinfo=" + this.statuinfo;
	}
}
