package com.tansun.eam.quequan.vo;

public class TaskHistoryVo  extends com.tansun.rdp4j.common.web.vo.CommonBO implements
java.io.Serializable {
	String processId;
	String taskId;
	String taskName;
	String userName;
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
