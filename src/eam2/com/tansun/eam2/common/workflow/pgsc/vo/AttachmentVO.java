package com.tansun.eam2.common.workflow.pgsc.vo;

public class AttachmentVO {
	private String id; // 编号
	private String bdid; // 表单id
	private String fjlx; // 附件类型（**附件） 表单通用附件
	private String fjbt; // 附件标题
	private String ywjm; // 源文件名
	private String wjlx; // 文件类型（后缀）
	private Long wjdx; // 文件大小
	private String scrid; // 上传人ID
	private String scrbh; // 上传人编号
	private String scsj; // 上传时间
	private String scbm; // 上传部门
	private Long del; // 删除状态
	private String swid; // 实物ID
	private String templateid; // 模板key,在spring配置文件中定义
	private String sortid; // 排序id
	private String zzfj;
	private String state;
	private String sessionid;

	public String getId() {
		return id;
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
		return fjlx;
	}

	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}

	public String getFjbt() {
		return fjbt;
	}

	public void setFjbt(String fjbt) {
		this.fjbt = fjbt;
	}

	public String getYwjm() {
		return ywjm;
	}

	public void setYwjm(String ywjm) {
		this.ywjm = ywjm;
	}

	public String getWjlx() {
		return wjlx;
	}

	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}

	public Long getWjdx() {
		return wjdx;
	}

	public void setWjdx(Long wjdx) {
		this.wjdx = wjdx;
	}

	public String getScrid() {
		return scrid;
	}

	public void setScrid(String scrid) {
		this.scrid = scrid;
	}

	public String getScrbh() {
		return scrbh;
	}

	public void setScrbh(String scrbh) {
		this.scrbh = scrbh;
	}

	public String getScsj() {
		return scsj;
	}

	public void setScsj(String scsj) {
		this.scsj = scsj;
	}

	public String getScbm() {
		return scbm;
	}

	public void setScbm(String scbm) {
		this.scbm = scbm;
	}

	public Long getDel() {
		return del;
	}

	public void setDel(Long del) {
		this.del = del;
	}

	public String getSwid() {
		return swid;
	}

	public void setSwid(String swid) {
		this.swid = swid;
	}

	public String getTemplateid() {
		return templateid;
	}

	public void setTemplateid(String templateid) {
		this.templateid = templateid;
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
