package com.tansun.eam2.common.workflow.pgsc.action;

import java.io.IOException;
import java.math.*;

import com.tansun.eam2.common.util.CounterListToJSON;
import com.tansun.eam2.common.workflow.counterSign.service.ETCounterSignBS;
import com.tansun.eam2.common.workflow.counterSign.service.StartCounterSignBS;
import com.tansun.eam2.zccz.service.IPgscWfBS;
import com.tansun.eam2.zyzc.utils.QueryBody4ViewListToJSON;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.DeptVO;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 启动多部门会签的Action方法
 * 
 * @author Administrator
 * 
 */
//@Controller("pgscStartCounterSignAction")
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
	public final static String DEPT_LIST = "deptList";
	public final static String ROLE_LIST = "roleList";
	public final static String USER_LIST = "userList";
	@Autowired
	StartCounterSignBS startCounterSignBS;
	@Autowired
	ETCounterSignBS eTCounterSignBS;
	@Autowired
	PTTodoBS todoBS;
	@Autowired
	DeptBSimpl deptBSimpl;
	private IPgscWfBS pgscBS;
	
	@Autowired
	public void setPgscBS(IPgscWfBS pgscBS) {
		this.pgscBS = pgscBS;
	}
	public String getParticipationList(){
		HttpSession session1 = ServletActionContext.getRequest().getSession();
		session1.setAttribute(this.USER_LIST, "");
		session1.setAttribute(this.ROLE_LIST, "");
		session1.setAttribute(this.DEPT_LIST, "");
		session1.setAttribute(WorkflowAction.COUNTERSIGN_ID, "");
		session1.setAttribute(WorkflowAction.IF_COUNTERSIGN, WorkflowAction.ISNOT_COUNTERSIGN);
		session1.setAttribute(WorkflowAction.MULTIPLE, "false");
		return "getParticipationListResult";
	}
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
	 * 获得当前用户所在部门
	 * @return
	 */
	private String[] getUserDepts(){
		List<DeptVO> deptlist = UserThreadLocal.get().getDeptList();
		String[] deptIds = new String[deptlist.size()];
		for(int i = 0; i < deptlist.size(); i++){
			DeptVO deptVO = deptlist.get(i);
			deptIds[i] = startCounterSignBS.getParDept(String.valueOf(deptVO.getTid()));
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
		String url = "pgscCountersign/pgscCountersign_todo.do";
		this.headId = request.getParameter("headId");
		PTTodo bizTodo = todoBS.findPTTodoByTaskId(this.taskId);
		this.tids = dept_user.split(",");
		String assign = this.tids[1];	//综合的编号
		String deptId = this.tids[0];	//部门的编号
		ArrayList<PTDeptBO> deptList = this.getParentDeptListByDeptId(Long.parseLong(deptId));
		if(deptList.size()>=2){
			PTDeptBO parentDept = deptList.get(1);
			deptId = ""+parentDept.getTid();
		}
		this.eTCounterSignBS.startCounterSign(
			this.pdk,this.bizPiId, this.counterSignTitle, 
			Long.parseLong(assign), Long.parseLong(deptId), 
			UserThreadLocal.get().getUserTid(),Long.parseLong(this.taskId),
			0, bizTodo.getDraftUserId(),
			new Date(), url,this.counterSignUrl,this.headId
		);
		if(StringUtils.isNotEmpty(headId))
			pgscBS.pgscCsj1(headId);
		//删除新的办理单上的办理部门意见，意见域类型为1和7的保留。
		eTCounterSignBS.deleOpinions(headId, deptId);
		return "startResult";
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
	
	public ArrayList<PTDeptBO> getParentDeptListByDeptId(Long deptId){
		PTDeptBO dept = deptBSimpl.getSingleById(deptId);
		ArrayList<PTDeptBO> deptList = new ArrayList<PTDeptBO>();
		if(dept.getParId()==1) {
			deptList.add(dept);
		}else{
			deptList.addAll(getParentDeptListByDeptId(dept.getParId()));
			deptList.add(dept);
		}
		return deptList;
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
	public DeptBSimpl getDeptBSimpl() {
		return deptBSimpl;
	}
	public void setDeptBSimpl(DeptBSimpl deptBSimpl) {
		this.deptBSimpl = deptBSimpl;
	}
	public IPgscWfBS getPgscBS() {
		return pgscBS;
	}
}
