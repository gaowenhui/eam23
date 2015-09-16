package com.tansun.eam2.common.workflow.counterSign.action;

import java.io.IOException;
import java.math.*;

import com.tansun.eam2.common.util.CounterListToJSON;
import com.tansun.eam2.common.workflow.counterSign.service.ETCounterSignBS;
import com.tansun.eam2.common.workflow.counterSign.service.StartCounterSignBS;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.DeptVO;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 启动多部门会签的Action方法
 * 
 * @author Administrator
 * 
 */
//@Controller("StartCounterSignAction")
//@Scope("prototype")
public class StartCounterSignAction extends CommonAction {

	public List selectList;
	public String tids[];
	public String bizPiId = "";	//父流程编号
	public String sHEETID = "";	//对应单据ID
	public String sHEET_TYPE = ""; //对应单据类型
	public String selectedDept = ""; //传入的参数中已经选定的部门编号,用逗号分割
	public String dept_user = "";
	public String pdk = "";
	public String resultUrl = "";
	public String counterSignTitle = "";
	public String actionName = "";
	public String namespace = "";
	public String counterSignUrl = "";
	public String headId = "";
	public String taskId = "";
	@Autowired
	StartCounterSignBS startCounterSignBS;
	@Autowired
	ETCounterSignBS eTCounterSignBS;
	@Autowired
	PTTodoBS todoBS;
	@Autowired
	DeptBSimpl dept;

	/**
	 * 选择要进行会签的部门和人员 在初始状态下进入,从系统中检索可选的部门及部门对应的综合,供用户选择以启动部门的会签流程. 入口参数定义:
	 * sheetid 表单号 lcmc 业务类型名称 lcid 主流程的流程ID,对应PTTO表中的PROC_INST_ID depts
	 * 已经选定的会签部门列表,用|分割传递过来. 根据这两个字段信息,从后台的会签单中进行检索,以过滤已经包含其中的部门,避免重复选取.
	 * 已经选中的部门和人员要用勾选来显示.
	 * 
	 * @return
	 */
	public String init() {
		// 计算得到一级部门和所对应的综合处理员
		String dept[] = new String[0];
		if (selectedDept!=null){
			dept = selectedDept.split(",");//按照,进行分割
		}
		
		String hqbmids = request.getParameter("hqbmids");
		selectList = startCounterSignBS.getDeptAndPersonListAll(this.bizPiId, hqbmids, getUserDepts());
		int i = 0;
		for (i = 0; i < selectList.size(); i++) {
			Map m = (Map) selectList.get(i);
			BigDecimal deptid = (BigDecimal) m.get("deptid");
			BigDecimal userid = (BigDecimal) m.get("userid");
			m.put("selectvalue", deptid.toString() + "_" + userid.toString());
			if (((String)m.get("ischeck")).equals("0")){
				m.put("isselected", "checked");
				m.put("isdisabled", "disabled");
			}else{
				m.put("isselected", "");
				m.put("isdisabled", "");
			}
		}
		return "init";
	}
	
	/**
	 * 根据部门id获得部门id和部门对应的人员
	 * @return
	 */
	public String getDeptUser(){
		StringBuffer sb = new StringBuffer();
		String hqbmids = request.getParameter("blbmbh");
		selectList = startCounterSignBS.getDeptUser(hqbmids);
		int i = 0;
		for (i = 0; i < selectList.size(); i++) {
			Map m = (Map) selectList.get(i);
			BigDecimal deptid = (BigDecimal) m.get("deptid");
			BigDecimal userid = (BigDecimal) m.get("userid");
			sb.append(deptid.toString() + "_" + userid.toString());
			sb.append(",");
		}
		String depts = (sb == null || sb.toString().length() == 0) ? "" : sb.toString();
		
		try {
			if(depts != null && !depts.equals("")){
				depts = depts.substring(0, depts.length() - 1);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(depts);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获得当前用户所在部门
	 * @return
	 */
	private String[] getUserDepts(){
		List<DeptVO> deptlist = UserThreadLocal.get().getDeptList();
		String[] deptIds = new String[deptlist.size()];
		for(int i = 0; i < deptlist.size(); i++){
			DeptVO deptVO = deptlist.get(i);
			if(deptVO.getTid()==113){
				deptIds[i] = "113";
			}else{
				deptIds[i] = startCounterSignBS.getParDept(String.valueOf(deptVO.getTid()));
			}
		}
		return deptIds;
	}
	
	/**
	 * 进入会签查询页面
	 * @return
	 */
	public String query(){
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "query";
	}
	
	/**
	 * 进入会签查询页面
	 * @return
	 */
	public String query2(){
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "query2";
	}
	
	/**
	 * 查询当前的会签部门
	 * @return
	 */
	public String meetingDept(){
		// 计算得到一级部门和所对应的综合处理员
		String headId = request.getParameter("headId");
		String status = request.getParameter("status");
		selectList = startCounterSignBS.getMeetingDetail(headId, status);
		// 将页面显示的VO转换成JSON串，传送到页面
		String josnStr = CounterListToJSON.getJSON(selectList, 1, 1, 24);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 判断字符是否在数组之中
	 * @param s1
	 * @param d
	 * @return
	 */
	private boolean isInArray(String s1,String d[]){
		int i=0;
		for(i=0;i<d.length;i++){
			if (s1.equals(d[i])){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 根据传入的参数来启动会签流程
	 * 
	 * @return
	 */
	public String start() {
		// 得到从界面传过来的多选参数
		String url = "countersign/countersign_todo.do";
		String[] detpids = getUserDepts();
		this.headId = request.getParameter("headId");
		if (dept_user != null&&!dept_user.equals("")) {
			// 查找已经会签的部门和尚未会签的部门
			selectList = startCounterSignBS.getDeptAndPersonList(this.bizPiId, detpids);
			String dept[] = new String[selectList.size()];
			for(int i = 0, j=0; i < selectList.size(); i++){
				Map m = (Map) selectList.get(i);
				if (((String)m.get("ischeck")).equals("1")){
					dept[j] = ((BigDecimal) m.get("deptid")).toString();
					j++;
				}
			}
			String assign,deptId;
			this.tids = dept_user.split(",");
			PTTodo bizTodo = todoBS.findPTTodoByTaskId(this.taskId);
			// 把新增的会签部门启动会签
			for (int i=0;i<tids.length;i++) {
				String dd[]= tids[i].split("_"); //传入数据使用下划线进行分割
				assign = dd[1];	//综合的编号
				deptId = dd[0];	//部门的编号
				//调用会签的Service,逐一启动会签流程
				if(isInArray(deptId, dept)){
					this.eTCounterSignBS.startCounterSign(
						this.pdk,this.bizPiId, this.counterSignTitle, 
						Long.parseLong(assign), Long.parseLong(deptId), 
						UserThreadLocal.get().getUserTid(),Long.parseLong(this.taskId),
						0, bizTodo.getDraftUserId(),
						new Date(), url,this.counterSignUrl,this.headId
					);
				}
			}
		}
//		selectList = null;
//		selectList = startCounterSignBS.getDeptAndPersonList(this.bizPiId, detpids);
		String depts = getDept(dept_user);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(depts);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获得当前会签部门的部门ID和部门名称
	 * @param list
	 * @return
	 */
	private String getDept(List list){
		StringBuffer deptIds = new StringBuffer();
		StringBuffer deptNames = new StringBuffer();
		
		for(int i = 0; i < list.size(); i++){
			Map m = (Map) list.get(i);
			if (((String)m.get("ischeck")).equals("0")){
				deptIds.append(m.get("DEPTID"));
				deptIds.append(",");
				deptNames.append(m.get("DEPTNAME"));
				deptNames.append(",");
			}
		}
		String deptId = "";
		String deptName = "";
		if(deptIds != null && deptIds.length() > 0){
			deptId = deptIds.substring(0, deptIds.length()-1);
		}
		if(deptNames != null && deptNames.length() > 0){
			deptName = deptNames.substring(0, deptNames.length()-1);
		}
		
		return deptId + "_" + deptName;
	}

	/**
	 * 获得当前会签部门的部门ID和部门名称
	 * @param list
	 * @return
	 */
	private String getDept(String dept_user){
		StringBuffer deptIds = new StringBuffer();
		StringBuffer deptNames = new StringBuffer();
		if(dept_user == null || dept_user.equals("")){
			return "";
		}else{
			this.tids = dept_user.trim().split(",");
			// 把新增的会签部门启动会签
			for (int i=0;i<tids.length;i++) {
				if(tids[i] != null && !tids[i].equals("")){
					String dd[]= tids[i].split("_"); //传入数据使用下划线进行分割
					deptIds.append(dd[0]);
					deptIds.append(",");
					PTDeptBO deptbo = dept.getSingleById(Long.parseLong(dd[0].trim()));
					deptNames.append(deptbo.getDeptName());
					deptNames.append(",");
				}
				
			}
			
			String deptId = "";
			String deptName = "";
			if(deptIds != null && deptIds.length() > 0){
				deptId = deptIds.substring(0, deptIds.length()-1);
			}
			if(deptNames != null && deptNames.length() > 0){
				deptName = deptNames.substring(0, deptNames.length()-1);
			}
			
			return deptId + "_" + deptName;
		}
	}

	public List getSelectList() {
		return selectList;
	}

	public void setSelectList(List selectList) {
		this.selectList = selectList;
	}

	public String[] getTids() {
		return tids;
	}

	public void setTids(String[] tids) {
		this.tids = tids;
	}

	public String getBizPiId() {
		return bizPiId;
	}

	public void setBizPiId(String bizPiId) {
		this.bizPiId = bizPiId;
	}

	public String getSelectedDept() {
		return selectedDept;
	}

	public void setSelectedDept(String selectedDept) {
		this.selectedDept = selectedDept;
	}

	public String getDept_user() {
		return dept_user;
	}

	public void setDept_user(String dept_user) {
		this.dept_user = dept_user;
	}

	public String getPdk() {
		return pdk;
	}

	public void setPdk(String pdk) {
		this.pdk = pdk;
	}

	public String getResultUrl() {
		return resultUrl;
	}

	public void setResultUrl(String resultUrl) {
		this.resultUrl = resultUrl;
	}

	public String getCounterSignTitle() {
		return counterSignTitle;
	}

	public void setCounterSignTitle(String counterSignTitle) {
		this.counterSignTitle = counterSignTitle;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	public String getCounterSignUrl() {
		return counterSignUrl;
	}

	public void setCounterSignUrl(String counterSignUrl) {
		this.counterSignUrl = counterSignUrl;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public StartCounterSignBS getStartCounterSignBS() {
		return startCounterSignBS;
	}

	public void setStartCounterSignBS(StartCounterSignBS startCounterSignBS) {
		this.startCounterSignBS = startCounterSignBS;
	}

	public ETCounterSignBS getETCounterSignBS() {
		return eTCounterSignBS;
	}

	public void setETCounterSignBS(ETCounterSignBS counterSignBS) {
		eTCounterSignBS = counterSignBS;
	}

	public PTTodoBS getTodoBS() {
		return todoBS;
	}

	public void setTodoBS(PTTodoBS todoBS) {
		this.todoBS = todoBS;
	}
}
