package com.tansun.eam2.common.workflow.pgsc.model;

import java.util.Date;

public class ETCounterSignBO extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {
	public String title = "";
	public long deptId = 0;
	public long assignId = 0;
	public String piId = "";
	public int isFinished=0;
	public Date creatTime = new Date();
	public String bizPiId = "";
	public String headType = "";
	public String headId = "";
	public String url = "";
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getDeptId() {
		return deptId;
	}

	public void setDeptId(long deptId) {
		this.deptId = deptId;
	}

	public long getAssignId() {
		return assignId;
	}

	public void setAssignId(long assignId) {
		this.assignId = assignId;
	}

	public String getPiId() {
		return piId;
	}

	public void setPiId(String piId) {
		this.piId = piId;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getIsFinished() {
		return isFinished;
	}

	public void setIsFinished(int isFinished) {
		this.isFinished = isFinished;
	}

	public String getBizPiId() {
		return bizPiId;
	}

	public void setBizPiId(String bizPiId) {
		this.bizPiId = bizPiId;
	}

	public String getHeadType() {
		return headType;
	}

	public void setHeadType(String headType) {
		this.headType = headType;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
