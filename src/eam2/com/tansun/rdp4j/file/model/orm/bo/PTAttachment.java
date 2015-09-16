package com.tansun.rdp4j.file.model.orm.bo;

import net.sf.json.JSONString;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * PTAttachment entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class PTAttachment extends CommonBO  implements java.io.Serializable,JSONString {

	// Fields

	private String id;      // 编号		
	private String bdid;	//表单id
	private String fjlx;	//附件类型（**附件） 表单通用附件
	private String fjbt;	//附件标题
	private String ywjm;	//源文件名
	private String wjlx;	//文件类型（后缀）
	private Long wjdx;		//文件大小
	private String scrid;	//上传人ID
	private String scrbh;	//上传人编号
	private String scsj;	//上传时间
	private String scbm;	//上传部门
	private Long del;		//删除状态
	private String swid;	//实物ID
	private String templateid; //模板key,在spring配置文件中定义
	private String sortid; //排序id
	private String zzfj ; 
	private String state;
	private String sessionid;
	
	private PTAttachmentBlob blob;

	// Constructors

	/** default constructor */
	public PTAttachment() {
	}

	/** minimal constructor */
	public PTAttachment(String id) {
		this.id = id;
	}
	
	/** full constructor */
	public PTAttachment(String id, String bdid, 
			String fjlx, String fjbt, String ywjm, String wjlx, Long wjdx,
			String scrid, String scrbh, String scsj, String scbm, Long del, String templateid,String sortid,String zzfj,String sessionid) {
		this.id = id;
		this.bdid = bdid;
		this.fjlx = fjlx;
		this.fjbt = fjbt;
		this.ywjm = ywjm;
		this.wjlx = wjlx;
		this.wjdx = wjdx;
		this.scrid = scrid;
		this.scrbh = scrbh;
		this.scsj = scsj;
		this.scbm = scbm;
		this.del = del;
		this.templateid = templateid;
		this.sortid=sortid;
		this.zzfj=zzfj;
		this.sessionid=sessionid;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBdid() {
		return bdid;
	}

	public void setBdid(String bdid) {
		this.bdid = bdid;
	}

	public String getFjlx() {
		return this.fjlx;
	}

	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}

	public String getFjbt() {
		return this.fjbt;
	}

	public void setFjbt(String fjbt) {
		this.fjbt = fjbt;
	}

	public String getYwjm() {
		return this.ywjm;
	}

	public void setYwjm(String ywjm) {
		this.ywjm = ywjm;
	}

	public String getWjlx() {
		return this.wjlx;
	}

	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}

	public Long getWjdx() {
		return this.wjdx;
	}

	public void setWjdx(Long wjdx) {
		this.wjdx = wjdx;
	}

	public String getScrid() {
		return this.scrid;
	}

	public void setScrid(String scrid) {
		this.scrid = scrid;
	}

	public String getScrbh() {
		return this.scrbh;
	}

	public void setScrbh(String scrbh) {
		this.scrbh = scrbh;
	}

	public String getScsj() {
		return this.scsj;
	}

	public void setScsj(String scsj) {
		this.scsj = scsj;
	}

	public String getScbm() {
		return this.scbm;
	}

	public void setScbm(String scbm) {
		this.scbm = scbm;
	}

	public Long getDel() {
		return this.del;
	}

	public void setDel(Long del) {
		this.del = del;
	}

	public PTAttachmentBlob getBlob() {
		return blob;
	}

	public void setBlob(PTAttachmentBlob blob) {
		this.blob = blob;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSwid() {
		return swid;
	}

	public void setSwid(String swid) {
		this.swid = swid;
	}

	public String toJSONString() {
		
		return null;
	}

	public String getTemplateid() {
		return templateid;
	}

	public void setTemplateid(String templateid) {
		this.templateid = templateid;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString(){
	    final String TAB = ",";
	    String retValue = "";
	    retValue = "PTAttachment:{"
	        + super.toString() + TAB
	        + "id:" + this.id + TAB
	        + "bdid:" + this.bdid + TAB
	        + "fjlx:" + this.fjlx + TAB
	        + "fjbt:" + this.fjbt + TAB
	        + "ywjm:" + this.ywjm + TAB
	        + "wjlx:" + this.wjlx + TAB
	        + "wjdx:" + this.wjdx + TAB
	        + "scrid:" + this.scrid + TAB
	        + "scrbh:" + this.scrbh + TAB
	        + "scsj:" + this.scsj + TAB
	        + "scbm:" + this.scbm + TAB
	        + "del:" + this.del + TAB
	        + "swid:" + this.swid + TAB
	        + "zzfj:" + this.zzfj + TAB
	        + "templateid:" + this.templateid
	        + " }";
	    return retValue;
	}

	public String getSortid() {
		return sortid;
	}

	public void setSortid(String sortid) {
		this.sortid = sortid;
	}

	public String getZzfj() {
		return zzfj;
	}

	public void setZzfj(String zzfj) {
		this.zzfj = zzfj;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	
}