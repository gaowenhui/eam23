package com.tansun.eam2.common.workflow.counterSign.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tansun.rdp4j.common.model.orm.bo.PTRoleBO;

public class ETCounterSignParticipantBO extends
		com.tansun.rdp4j.common.web.vo.CommonBO implements java.io.Serializable {
	
	public long userId=0;
	public long countersignId=0;
	public long assignpersonId=0;
	public long assigntaskId=0;
	public String piId = "";
	public String taskId = "";
	public Date time = new Date();
	public int isFinished=0;
	public long assignParticipantId = 0;
	public List<PTRoleBO> roleList = new ArrayList();
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getCountersignId() {
		return countersignId;
	}
	public void setCountersignId(long countersignId) {
		this.countersignId = countersignId;
	}
	public long getAssignpersonId() {
		return assignpersonId;
	}
	public void setAssignpersonId(long assignpersonId) {
		this.assignpersonId = assignpersonId;
	}
	public long getAssigntaskId() {
		return assigntaskId;
	}
	public void setAssigntaskId(long assigntaskId) {
		this.assigntaskId = assigntaskId;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getPiId() {
		return piId;
	}
	public void setPiId(String piId) {
		this.piId = piId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public int getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(int isFinished) {
		this.isFinished = isFinished;
	}
	public long getAssignParticipantId() {
		return assignParticipantId;
	}
	public void setAssignParticipantId(long assignParticipantId) {
		this.assignParticipantId = assignParticipantId;
	}
	public List<PTRoleBO> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<PTRoleBO> roleList) {
		this.roleList = roleList;
	}
	
}
