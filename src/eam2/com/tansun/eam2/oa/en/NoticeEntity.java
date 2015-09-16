package com.tansun.eam2.oa.en;

public class NoticeEntity implements java.io.Serializable {
	private static final long serialVersionUID = 3528321668355461613L;
	private String lcid;
	private int lczt;
	private String ngyj;
	private String qfyj;
	private String hqyj;
	private String hgyj;
	private String jdyj;
	private String bz;
	public String getLcid() {
		return lcid;
	}
	public void setLcid(String lcid) {
		this.lcid = lcid;
	}
	public int getLczt() {
		return lczt;
	}
	public void setLczt(int lczt) {
		this.lczt = lczt;
	}
	public String getNgyj() {
		return ngyj;
	}
	public void setNgyj(String ngyj) {
		this.ngyj = ngyj;
	}
	public String getQfyj() {
		return qfyj;
	}
	public void setQfyj(String qfyj) {
		this.qfyj = qfyj;
	}
	public String getHqyj() {
		return hqyj;
	}
	public void setHqyj(String hqyj) {
		this.hqyj = hqyj;
	}
	public String getHgyj() {
		return hgyj;
	}
	public void setHgyj(String hgyj) {
		this.hgyj = hgyj;
	}
	public String getJdyj() {
		return jdyj;
	}
	public void setJdyj(String jdyj) {
		this.jdyj = jdyj;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}

	public String toString(){
	    final String TAB = ",";
	    
	    String retValue = "";
	    
	    retValue = "NoticeEntity:{"
	        + super.toString() + TAB
	        + "lcid:" + this.lcid + TAB
	        + "lczt:" + this.lczt + TAB
	        + "ngyj:" + this.ngyj + TAB
	        + "qfyj:" + this.qfyj + TAB
	        + "hqyj:" + this.hqyj + TAB
	        + "hgyj:" + this.hgyj + TAB
	        + "jdyj:" + this.jdyj + TAB
	        + "bz:" + this.bz + TAB
	        + " }";
	
	    return retValue;
	}
	
}
