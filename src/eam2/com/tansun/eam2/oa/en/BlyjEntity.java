package com.tansun.eam2.oa.en;

public class BlyjEntity implements java.io.Serializable {
	private static final long serialVersionUID = 3528321668355461613L;
	private String recid;
	private String title;
	private String source;
	private String url;
	private int totalnum;
	private String ngr;
	private String ngrq;
	public String getRecid() {
		return recid;
	}
	public void setRecid(String recid) {
		this.recid = recid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getTotalnum() {
		return totalnum;
	}
	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}
	public String getNgr() {
		return ngr;
	}
	public void setNgr(String ngr) {
		this.ngr = ngr;
	}
	public String getNgrq() {
		return ngrq;
	}
	public void setNgrq(String ngrq) {
		this.ngrq = ngrq;
	}

	public String toString(){
	    final String TAB = "####";
	    
	    String retValue = "";
	    
	    retValue = ""
	        + "recid=" + this.recid + TAB
	        + "title=" + this.title + TAB
	        + "source=" + this.source + TAB
	        + "url=" + this.url + TAB
	        + "totalnum=" + this.totalnum + TAB
	        + "ngr=" + this.ngr + TAB
	        + "ngrq=" + this.ngrq
	        + "";
	
	    return retValue;
	}
	
}
