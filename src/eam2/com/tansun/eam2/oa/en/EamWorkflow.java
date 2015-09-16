package com.tansun.eam2.oa.en;

public class EamWorkflow implements java.io.Serializable{
	
	private static final long serialVersionUID = 264748490069984382L;
	private String OAmsgid;
	private String ngr;
	private String ngbm;
	private String ngrq;
	private String title;
	private String flowname;
	private String url;
	private String bz;
	private String blyjTitle;
	private String blyjWh;
	private String blyjNgr;
	private String blyjNgrq;
	private String blyjMkmc;
	private String blyjLcmc;
	public String getOAmsgid() {
		return OAmsgid;
	}
	public void setOAmsgid(String amsgid) {
		OAmsgid = amsgid;
	}
	public String getNgr() {
		return ngr;
	}
	public void setNgr(String ngr) {
		this.ngr = ngr;
	}
	public String getNgbm() {
		return ngbm;
	}
	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
	}
	public String getNgrq() {
		return ngrq;
	}
	public void setNgrq(String ngrq) {
		this.ngrq = ngrq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFlowname() {
		return flowname;
	}
	public void setFlowname(String flowname) {
		this.flowname = flowname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getBlyjTitle() {
		return blyjTitle;
	}
	public void setBlyjTitle(String blyjTitle) {
		this.blyjTitle = blyjTitle;
	}
	public String getBlyjWh() {
		return blyjWh;
	}
	public void setBlyjWh(String blyjWh) {
		this.blyjWh = blyjWh;
	}
	public String getBlyjNgr() {
		return blyjNgr;
	}
	public void setBlyjNgr(String blyjNgr) {
		this.blyjNgr = blyjNgr;
	}
	public String getBlyjNgrq() {
		return blyjNgrq;
	}
	public void setBlyjNgrq(String blyjNgrq) {
		this.blyjNgrq = blyjNgrq;
	}
	public String getBlyjMkmc() {
		return blyjMkmc;
	}
	public void setBlyjMkmc(String blyjMkmc) {
		this.blyjMkmc = blyjMkmc;
	}
	public String getBlyjLcmc() {
		return blyjLcmc;
	}
	public void setBlyjLcmc(String blyjLcmc) {
		this.blyjLcmc = blyjLcmc;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String toString(){
	    final String TAB = ",";
	    
	    String retValue = "";
	    
	    retValue = "CreateEamWorkflow:{"
	        + super.toString() + TAB
	        + "OAmsgid:" + this.OAmsgid + TAB
	        + "ngr:" + this.ngr + TAB
	        + "ngbm:" + this.ngbm + TAB
	        + "ngrq:" + this.ngrq + TAB
	        + "title:" + this.title + TAB
	        + "flowname:" + this.flowname + TAB
	        + "url:" + this.url + TAB
	        + "bz:" + this.bz + TAB
	        + "blyjTitle:" + this.blyjTitle + TAB
	        + "blyjWh:" + this.blyjWh + TAB
	        + "blyjNgr:" + this.blyjNgr + TAB
	        + "blyjNgrq:" + this.blyjNgrq + TAB
	        + "blyjMkmc:" + this.blyjMkmc + TAB
	        + "blyjLcmc:" + this.blyjLcmc
	        + " }";
	
	    return retValue;
	}
	
}
