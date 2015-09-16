package com.tansun.eam2.common.workflow.counterSign.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jbpm.api.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignParticipantBO;
import com.tansun.eam2.common.workflow.counterSign.vo.ETCounterSignParticipantVO;
import com.tansun.eam2.common.workflow.counterSign.vo.UnfinishedCounterSignVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTRoleBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.privileges.service.impl.FunctionRoleBSimpl;
import com.tansun.rdp4j.generalapps.user.service.impl.UserBSimpl;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.PTCommonOpinionBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

@Service
public class ETCounterSignBS {
	@Autowired
	PublicDao publicDao;
	@Autowired
	WorkflowUtil workflowutil;
	@Autowired
	PTTodoBS pTTodoBS;
	@Autowired
	PTDidBS pTDidBS;
	@Autowired
	PTEndBS pTEndBS;
	@Autowired
	UserBSimpl userBSimpl;
	@Autowired
	DeptBSimpl deptBSimpl;
	@Autowired
	PTCommonOpinionBS commonOpinionBS;
	@Autowired
	FunctionRoleBSimpl functionRoleBSimpl;
	@Autowired
	PTMessageBS messageBS;
	public void save(ETCounterSignBO eTCounterSignBO) {
		this.publicDao.save(eTCounterSignBO);
	}

	public PTTodo startCounterSign(String pdName, String bizPiId, String title,
			long assign, long deptId, long assignpersonId, long assigntaskId,
			long countersignId, long draftUserId, Date draftDate, String url,
			String counterSignUrl, String headId) {

		String piId = workflowutil.startLastVersionPIByPDName(pdName, ""
				+ assign);
		Task task = this.workflowutil.getTask(piId);

		ETCounterSignBO eTCounterSignBO = new ETCounterSignBO();
		eTCounterSignBO.setDeptId(deptId);
		eTCounterSignBO.setAssignId(assign);
		eTCounterSignBO.setPiId(piId);
		eTCounterSignBO.setBizPiId(bizPiId);
		eTCounterSignBO.setTitle(title);
		eTCounterSignBO.setUrl(counterSignUrl);
		eTCounterSignBO.setHeadId(headId);
		this.save(eTCounterSignBO);

		ETCounterSignParticipantBO eTCounterSignParticipantBO = new ETCounterSignParticipantBO();
		eTCounterSignParticipantBO.setUserId(assign);
		eTCounterSignParticipantBO.setAssignpersonId(assignpersonId);
		eTCounterSignParticipantBO.setAssigntaskId(assigntaskId);
		eTCounterSignParticipantBO.setCountersignId(eTCounterSignBO.getTid());
		eTCounterSignParticipantBO.setTaskId(task.getId());
		eTCounterSignParticipantBO.setPiId(piId);
		this.publicDao.saveOrUpdate(eTCounterSignParticipantBO);
		PTTodo pTTodo = new PTTodo();
		PTTodo pTTodo1 = this.pTTodoBS.findPTTodoByTaskId(String.valueOf(assigntaskId));
		List<PTDeptBO> PTDeptBOList = deptBSimpl.getDeptByUserId(assign);
		if(PTDeptBOList.size()>0){
			pTTodo.setDeptId(PTDeptBOList.get(0).getTid());
		}
		pTTodo.setTitle(title);
		pTTodo.setUserId(assign);
		pTTodo.setSendUserId(UserThreadLocal.get().getUserTid());
		pTTodo.setTaskId(task.getId());
		pTTodo.setProcInstId(piId);
		pTTodo.setProcInstName(pdName);
		pTTodo.setTaskName(task.getName());
		pTTodo.setDraftDeptId(pTTodo1.getDraftDeptId());
		pTTodo.setHeadType(pTTodo1.getHeadType());
		// pTTodo.setHeadId("" + eTCounterSignBO.getTid());
		CzPgscZskwhCld czPgscZskwhCld = publicDao.findById(CzPgscZskwhCld.class, headId);
		if(czPgscZskwhCld!=null&&czPgscZskwhCld.getBianhao()!=null){
			pTTodo.setSheetId(czPgscZskwhCld.getBianhao());
		}
		pTTodo.setHeadId(headId);
		pTTodo.setDraftUserId(draftUserId);
		pTTodo.setDraftDate(draftDate);
		pTTodo.setUrl(url);
		this.pTTodoBS.saveOrUpdate(pTTodo);
		return pTTodo; 
	}

	/**
	 * 从已办入口检索相关数据
	 * 
	 * @param taskId
	 * @param request
	 */
	public void toDid(String taskId, HttpServletRequest request) {
		ETCounterSignParticipantBO participant = this
				.findParticipantByDidTaskId(taskId);
		ETCounterSignBO counterSign = this.findCounterSignByTid(participant
				.getCountersignId());
		PTUserBO assign = this.userBSimpl.getUserBO(participant.getUserId());
		// PTUserBO zhBO = this.userBSimpl.getUserBO(zhParticipant.getUserId());
		String taskName = "";
		PTDeptBO dept = this.deptBSimpl.getSingleById(counterSign.getDeptId());
		request.setAttribute("dept", dept);
		// request.setAttribute("zhName", zhBO.getUsername());
		request.setAttribute("taskId", taskId);
		request.setAttribute("taskName", taskName);
		request.setAttribute("assignName", assign.getUsername());
		request.setAttribute("counterSign", counterSign);

		List participantList = this.findParticipantsByCounterSignId(counterSign
				.getTid());
		List participantVOList = new ArrayList();
		for (int i = 0; i < participantList.size(); i++) {
			ETCounterSignParticipantBO participantBO = (ETCounterSignParticipantBO) participantList
					.get(i);
			ETCounterSignParticipantVO participantVO = new ETCounterSignParticipantVO();
			participantVO.setParticipantBO(participantBO);
			participantVO.setUserBO(this.userBSimpl.getSingleById(participantBO
					.getUserId()));
			if (participantBO.getAssignpersonId() > 0)
				participantVO.setAssignBO(this.userBSimpl
						.getSingleById(participantBO.getAssignpersonId()));
			participantVOList.add(participantVO);
		}
		List commonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOList(counterSign.getTid(),
						CommonGlobal.OPINION_YJYLX_MEETING, 0);
		List snedBackCommonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOList(counterSign.getTid(),
						CommonGlobal.OPINION_YJYLX_HQTH, 1);
		List finalCommonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOList(counterSign.getTid(),
						CommonGlobal.OPINION_YJYLX_HQZZ, 1);
		request.setAttribute("gcOpinionVOList", commonOpinionVOList);
		request.setAttribute("snedBackCommonOpinionVOList",
				snedBackCommonOpinionVOList);
		request.setAttribute("finalCommonOpinionVOList",
				finalCommonOpinionVOList);
		request.setAttribute("participantVOList", participantVOList);
		request.setAttribute("assignParticipant", participant);
	}

	/**
	 * 从待办入口检索相关数据
	 * 
	 * @param taskId
	 * @param request
	 */
	public PTTodo todo(String taskId, HttpServletRequest request) {
		ETCounterSignParticipantBO participant = this
				.findParticipantByTodoTaskId(taskId);
		ETCounterSignBO counterSign = this.findCounterSignByTid(participant
				.getCountersignId());
		// String piId = this.workflowutil.findPIIdByTaskId(taskId);
		// Map params = new HashMap();
		// params.put("piId", counterSign.getPiId());
		// ETCounterSignParticipantBO zhParticipant =
		// (ETCounterSignParticipantBO)this.findSingleResult(
		// "ETCounterSignParticipantBO",params
		// );
		pTTodoBS.setTodoRead(taskId);
		initTaskInfo(participant, new ETCounterSignParticipantBO(), taskId,
				counterSign, request);
		return this.pTTodoBS.findPTTodoByTaskId(taskId);
	}

	private void initTaskInfo(ETCounterSignParticipantBO participant,
			ETCounterSignParticipantBO zhParticipant, String taskId,
			ETCounterSignBO counterSign, HttpServletRequest request) {
		PTUserBO assign = this.userBSimpl.getUserBO(participant.getUserId());
		// PTUserBO zhBO = this.userBSimpl.getUserBO(zhParticipant.getUserId());
		String taskName = this.workflowutil.getTaskName(taskId);
		PTDeptBO dept = this.deptBSimpl.getSingleById(counterSign.getDeptId());
		request.setAttribute("dept", dept);
		// request.setAttribute("zhName", zhBO.getUsername());
		request.setAttribute("taskId", taskId);
		request.setAttribute("taskName", taskName);
		request.setAttribute("assignName", assign.getUsername());
		request.setAttribute("counterSign", counterSign);

		List participantList = this.findParticipantsByCounterSignId(counterSign
				.getTid());
		List participantVOList = new ArrayList();
		for (int i = 0; i < participantList.size(); i++) {
			ETCounterSignParticipantBO participantBO = (ETCounterSignParticipantBO) participantList
					.get(i);
			ETCounterSignParticipantVO participantVO = new ETCounterSignParticipantVO();
			participantVO.setParticipantBO(participantBO);
			participantVO.setUserBO(this.userBSimpl.getSingleById(participantBO
					.getUserId()));
			if (participantBO.getAssignpersonId() > 0)
				participantVO.setAssignBO(this.userBSimpl
						.getSingleById(participantBO.getAssignpersonId()));
			participantVOList.add(participantVO);
		}
		List commonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOList(counterSign.getTid(),
						CommonGlobal.OPINION_YJYLX_MEETING, 0);
		request.setAttribute("gcOpinionVOList", commonOpinionVOList);
		request.setAttribute("participantVOList", participantVOList);
		request.setAttribute("assignParticipant", participant);
	}

	public List findParticipantsByCounterSignId(long counterSignId) {
		Map params = new HashMap();
		params.put("countersignId", counterSignId);
		params.put("isFinished", 0);
		return this.findList("ETCounterSignParticipantBO", params);
	}

	public List findList(String className, Map params) {
		List hParams = new ArrayList();
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ").append(className).append(" O WHERE 1=1 ");
		Iterator it = params.keySet().iterator();
		for (; it.hasNext();) {
			String key = (String) it.next();
			Object value = params.get(key);
			hql.append(" AND O.").append(key).append("=?");
			hParams.add(value);
		}
		return this.publicDao.find(hql.toString(), hParams);
	}

	public StringBuffer findHQL(String className, Map params) {
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ").append(className).append(" O WHERE 1=1 ");
		Iterator it = params.keySet().iterator();
		for (; it.hasNext();) {
			String key = (String) it.next();
			Object value = params.get(key);
			hql.append(" AND O.").append(key).append("='").append(value)
					.append("'");
		}
		return hql;
	}

	public Object findSingleResult(String className, Map params) {
		List hParams = new ArrayList();
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ").append(className).append(" O WHERE 1=1");
		Iterator it = params.keySet().iterator();
		for (; it.hasNext();) {
			String key = (String) it.next();
			String value = (String) params.get(key);
			hql.append(" AND O.").append(key).append("=?");
			hParams.add(value);
		}
		return this.publicDao.findSingleResult(hql.toString(), hParams);
	}

	public ETCounterSignBO findCounterSignByTid(long tid) {
		List params = new ArrayList();
		params.add(tid);
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ETCounterSignBO O where O.tid=?");
		return (ETCounterSignBO) this.publicDao.findSingleResult(
				hql.toString(), params);
	}
	
	public ETCounterSignParticipantBO findParticipantByDidTaskId(String taskId) {
		PTDid did = this.pTDidBS.findPTDidByTaskId(taskId);
		List params = new ArrayList();
		params.add(did.getProcInstId());
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ETCounterSignParticipantBO O where O.piId=?");
		ETCounterSignParticipantBO cpBO = (ETCounterSignParticipantBO) this.publicDao
				.findSingleResult(hql.toString(), params);
		List<PTRoleBO> list = this.functionRoleBSimpl.getByUserId(cpBO
				.getUserId());
		cpBO.setRoleList(list);
		return cpBO;
	}
	
	public ETCounterSignParticipantBO findParticipantByTodoTaskId(String taskId) {
		List params = new ArrayList();
		params.add(taskId);
		StringBuffer hql = new StringBuffer();
		hql.append("FROM ETCounterSignParticipantBO O where O.taskId=?");
		ETCounterSignParticipantBO cpBO = (ETCounterSignParticipantBO) this.publicDao
				.findSingleResult(hql.toString(), params);
		if(cpBO==null){
			return null;
		}
		List<PTRoleBO> list = this.functionRoleBSimpl.getByUserId(cpBO
				.getUserId());
		cpBO.setRoleList(list);
		return cpBO;
	}

	public void initParticipants(long counterSignId, String deptId,
			HttpServletRequest request) {
		List participantList = this
				.findParticipantsByCounterSignId(counterSignId);
		ETCounterSignBO counterSign = this.findCounterSignByTid(counterSignId);
		PTDeptBO dept = this.deptBSimpl.getSingleById(counterSign.getDeptId());
		List userList = this.userBSimpl.getUsersInDep(counterSign.getDeptId());
		List unParticipantList = new ArrayList();
		for (int n = 0; n < userList.size(); n++) {
			PTUserBO userBO = (PTUserBO) userList.get(n);
			boolean isExist = false;
			for (int i = 0; i < participantList.size(); i++) {
				ETCounterSignParticipantBO participantBO = (ETCounterSignParticipantBO) participantList
						.get(i);
				if (userBO.getTid() == participantBO.getUserId())
					isExist = true;
			}
			if (!isExist) {
				unParticipantList.add(userBO);
			}
		}
		request.setAttribute("unParticipantList", unParticipantList);
		request.setAttribute("deptName", dept.getDeptName());
	}

	public String newInitParticipants(long counterSignId, String deptId) {
		ETCounterSignBO counterSign = this.findCounterSignByTid(counterSignId);
		PTDeptBO dept = this.deptBSimpl.getSingleById(counterSign.getDeptId());
		return this.getDeptIdListStr(dept.getTid());
	}

	public String getDeptIdListStr(Long depId) {
		String result = "" + this.deptBSimpl.getSingleById(depId).getTid();
		List<PTDeptBO> children = this.deptBSimpl.getAllChildrens(depId);
		if (children != null) {
			for (PTDeptBO child : children) {
				result += "," + this.getDeptIdListStr(child.getTid());
			}
		}
		return result;
	}

	public String addCounterSignParticipants(long counterSignId,
			long assignParticipantId, String[] users, long taskId,
			String outCome, String nextTaskUrl, String newParticipantTaskUrl,
			String pdName) {
	//	for (int i = 0; i < users.length; i++) {
	//		this.startCounterSignParticipant(users[i], counterSignId,
	//				assignParticipantId, taskId, newParticipantTaskUrl, pdName);
	//	}
		return this.completeAddParticipantTask("" + taskId, outCome,
				nextTaskUrl);
	}

	public PTTodo startCounterSignParticipant(String userId, long counterSignId,
			long assignParticipantId, long taskId,
			String newParticipantTaskUrl, String pdName) {
		String piId = this.workflowutil.startLastVersionPIByPDName(pdName,
				userId);
		String newTaskId = this.workflowutil.getTask(piId).getId();
		String taskName = this.workflowutil.getTaskName(newTaskId);
		PTTodo pTTodo = this.pTTodoBS.findPTTodoByTaskId("" + taskId);
		Long deptId = pTTodo.getDeptId();
		PTTodo newPTTodo = pTTodo.clone();
		newPTTodo.setTid((long) 0);
		newPTTodo.setUserId(Long.parseLong(userId));
		newPTTodo.setProcInstId(piId);
		newPTTodo.setProcInstName(pdName);
		newPTTodo.setTaskId(newTaskId);
		newPTTodo.setTaskName(taskName);
		newPTTodo.setUrl(newParticipantTaskUrl);
		newPTTodo.setIsRead("0");
		newPTTodo.setDeptId(deptId);
		this.pTTodoBS.saveOrUpdate(newPTTodo);

		ETCounterSignParticipantBO participantBO = new ETCounterSignParticipantBO();
		participantBO.setUserId(Long.parseLong(userId));
		participantBO.setAssignpersonId(UserThreadLocal.get().getUserTid());
		participantBO.setCountersignId(counterSignId);
		participantBO.setAssigntaskId(taskId);
		participantBO.setPiId(piId);
		participantBO.setTaskId(newTaskId);
		participantBO.setAssignParticipantId(assignParticipantId);
		this.publicDao.saveOrUpdate(participantBO);
		return newPTTodo;
	}

	private String completeAddParticipantTask(String taskId, String outCome,
			String nextTaskUrl) {
		String nextAssignId = "" + UserThreadLocal.get().getUserTid();
		String newTaskId = this.completeTaskWithOutEnd(taskId, outCome,
				nextAssignId, nextTaskUrl, "countersign/countersign_toDid.do", "");
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		participantBO.setTaskId(newTaskId);
		this.publicDao.saveOrUpdate(participantBO);
		return newTaskId;
	}

	public String completeTaskWithOutEnd(String taskId, String outCome,
			String nextAssignId, String nextTaskUrl, String didUrl,
			String endUrl) {
		PTTodo pTTodo = this.pTTodoBS.findPTTodoByTaskId(taskId);
		PTDid pTDid = pTTodo.toPTDid();
		pTDid.setSendUserId(Long.parseLong(nextAssignId));
		pTDid.setUrl(didUrl);
		this.pTDidBS.saveOrUpdate(pTDid);
		this.pTTodoBS.finishTodo(taskId);
		String newTaskId = this.workflowutil.completeTask(taskId, outCome,
				nextAssignId);
		if (!newTaskId.equals("")) {
			String newTaskName = this.workflowutil.getTaskName(newTaskId);
			PTTodo newPTTodo = pTTodo.clone();
			Long deptId = pTTodo.getDeptId();
			newPTTodo.setDeptId(deptId);
			newPTTodo.setCreateDate(new Date());
			newPTTodo.setUrl(nextTaskUrl);
			newPTTodo.setTaskId(newTaskId);
			newPTTodo.setTaskName(newTaskName);
			newPTTodo.setDeptId(deptId);
			this.pTTodoBS.saveOrUpdate(newPTTodo);
			return newTaskId;
		}
		return "";
	}

	public String completeTaskWithEnd(String taskId, String outCome,
			String nextAssignId, String nextTaskUrl, String didUrl,
			String endUrl) {
		PTTodo pTTodo = this.pTTodoBS.findPTTodoByTaskId(taskId);
		this.pTTodoBS.finishTodo(taskId);
		PTDid pTDid = pTTodo.toPTDid();
		pTDid.setSendUserId(Long.parseLong(nextAssignId));
		pTDid.setUrl(didUrl);
		this.pTDidBS.saveOrUpdate(pTDid);
		String newTaskId = this.workflowutil.completeTask(taskId, outCome,
				nextAssignId);
		if (!(newTaskId.equals(""))) {
			String newTaskName = this.workflowutil.getTaskName(newTaskId);
			PTTodo newPTTodo = pTTodo.clone();
			newPTTodo.setCreateDate(new Date());
			newPTTodo.setUrl(nextTaskUrl);
			newPTTodo.setTaskId(newTaskId);
			newPTTodo.setTaskName(newTaskName);
			this.pTTodoBS.saveOrUpdate(newPTTodo);
			return newTaskId;
		} else {
//			List didList = this.pTDidBS.findDidListByPiId(pTTodo
//					.getProcInstId());
//			for (int i = 0; i < didList.size(); i++) {
//				pTDid = (PTDid) didList.get(i);
//				PTEnd pTEnd = this.pTEndBS.findPTEndByUserPi(pTDid.getUserId(),
//						pTDid.getProcInstId());
//				if (pTEnd == null) {
//					pTEnd = pTDid.toPTEnd();
//					pTEnd.setUrl(endUrl);
//					this.pTEndBS.SaveOrUpdate(pTEnd);
//				}
//				pTDid.setStatu("0");
//				this.pTDidBS.saveOrUpdate(pTDid);
//			}
			return "";
		}
	}

	public String commitZHGCContent(String taskId, String outCome,
			String content, int contentSetTpye, String nextTaskUrl,
			String didUrl) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if(participantBO.isFinished==1){
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if(counterSign.isFinished==1){
			return null;
		}
		PTCommonOpinionBO commonOpinion = new PTCommonOpinionBO();
		commonOpinion.setCountersignId(participantBO.getCountersignId());
		commonOpinion.setTaskId(taskId);
		commonOpinion.setYjbm(counterSign.getDeptId());
		commonOpinion.setParticipantId(participantBO.getTid());
		commonOpinion.setTjr(userId);
		commonOpinion.setYjnr(content);
		commonOpinion.setYjylx(contentSetTpye);
		commonOpinion.setYjlx(new Integer(CommonGlobal.OPINION_YJYLX_MEETING));
		commonOpinion.setZzyj(0);
		this.commonOpinionBS.saveOrUpdate(commonOpinion);
		String newTaskId = this.completeTaskWithOutEnd(taskId, outCome, userId,
				nextTaskUrl, didUrl, "");
		participantBO.setTaskId(newTaskId);
		this.publicDao.saveOrUpdate(participantBO);
		return newTaskId;
	}

	public String commitJBGCContent(String taskId, String outCome,
			String content, int contentSetTpye, String nextTaskUrl,
			String didUrl) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if(participantBO.isFinished==1){
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if(counterSign.isFinished==1){
			return null;
		}
		if(content!=null&&!content.equals("")){
			PTCommonOpinionBO commonOpinion = new PTCommonOpinionBO();
			commonOpinion.setCountersignId(participantBO.getCountersignId());
			commonOpinion.setTaskId(taskId);
			commonOpinion.setYjbm(counterSign.getDeptId());
			commonOpinion.setParticipantId(participantBO.getTid());
			commonOpinion.setTjr(userId);
			commonOpinion.setYjnr(content);
			commonOpinion.setYjylx(contentSetTpye);
			commonOpinion.setYjlx(new Integer(CommonGlobal.OPINION_YJYLX_MEETING));
			commonOpinion.setZzyj(0);
			this.commonOpinionBS.saveOrUpdate(commonOpinion);
		}
		String newTaskId = this.completeTaskWithEnd(taskId, outCome, userId,
				nextTaskUrl, didUrl, "");
		participantBO.setIsFinished(1);
		this.publicDao.saveOrUpdate(participantBO);
		return newTaskId;
	}

	public PTCommonOpinionBO commitContent(ETCounterSignBO counterSign,
			ETCounterSignParticipantBO participantBO, String content,
			int contentSetTpye, int contentType, int zzyj, String headId) {
		PTCommonOpinionBO commonOpinion = new PTCommonOpinionBO();
		commonOpinion.setCountersignId(participantBO.getCountersignId());
		commonOpinion.setTaskId(participantBO.getTaskId());
		commonOpinion.setBdid(headId);
		commonOpinion.setYjbm(counterSign.getDeptId());
		commonOpinion.setParticipantId(participantBO.getTid());
		commonOpinion.setTjr("" + participantBO.getUserId());
		commonOpinion.setYjnr(content);
		commonOpinion.setYjylx(contentSetTpye);
		commonOpinion.setYjlx(contentType);
		commonOpinion.setZzyj(zzyj);
		this.commonOpinionBS.saveOrUpdate(commonOpinion);
		return commonOpinion.clone();
	}

	public String finishContentParticipant(
			ETCounterSignParticipantBO participantBO, String content,
			int contentSetType, int contentType, String outCome, String didUrl,
			String headId) {
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		PTCommonOpinionBO newBo = this.commitContent(counterSign,
				participantBO, content, contentSetType, contentType, 1, headId);
		newBo.setYjylx((int) CommonGlobal.OPINION_YJYLX_MEETING_DEPT);
		// newBo.setYjlx((int)CommonGlobal.OPINION_YJLX_FINAL);
		this.publicDao.saveOrUpdate(newBo);
		String taskId = participantBO.getTaskId();
		participantBO.setIsFinished(1);
		counterSign.setIsFinished(1);
		this.publicDao.saveOrUpdate(participantBO);
		this.publicDao.saveOrUpdate(counterSign);
		// 对于completTaskWithOutEnd的调用将发生错误
		// 因为对方需要考虑将第三个参数设定为执行人,从而产生异常
		// 通过给一个0的方式来避免错误.
		return this.completeTaskWithEnd(taskId, outCome, "0", "", didUrl, "");
	}

	public String commitFinalContent(String taskId, String outCome,
			String content, int contentSetTpye, int contentTpye, String didUrl,
			String headId) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if(participantBO.isFinished==1){
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if(counterSign.isFinished==1){
			return null;
		}
		List participantList = this.findParticipantsByCounterSignId(counterSign
				.getTid());
		List didUserIdList = new ArrayList();
		for (int i = 0; i < participantList.size(); i++) {
			ETCounterSignParticipantBO participant = (ETCounterSignParticipantBO) participantList
					.get(i);
			if (participantBO.getTid().equals(participant.getTid())) {
				continue;
			}
			this.finishParticipant(participant, outCome, didUrl);
			didUserIdList.add(participant.getUserId());
		}
		this.sendMsg(didUserIdList, UserThreadLocal.get().getUserTid(), counterSign.title+" 已提交最终意见", "", "");
		this.setBizTodoUnreadCounterSign(counterSign.getBizPiId());
		return this.finishContentParticipant(participantBO, content,
				contentSetTpye, contentTpye, outCome, didUrl, headId);
	}
	
	private void sendMsg(List didUserIdList,long sender,String msg,String url,String param){
		for(int i=0;i<didUserIdList.size();i++){
			long userId = (Long)didUserIdList.get(i);
			PTMessage message = new PTMessage();
			message.setSendUserId(sender);
			message.setUserId(userId);
			message.setMessage(msg);
			message.setUrl(url);
			message.setParam(param);
			message.setType("3");
			this.messageBS.SaveOrUpdate(message);
		}
	}
	
	public void setBizTodoUnreadCounterSign(String piId){
		List todoList = this.pTTodoBS.findTodoListByPiId(piId);
		for(int i=0;i<todoList.size();i++){
			PTTodo todo = (PTTodo)todoList.get(i);
			todo.setHasUnreadCounterSign("1");
			this.pTTodoBS.saveOrUpdate(todo);
		}
	}
	public String finishParticipant(ETCounterSignParticipantBO participantBO,
			String outCome, String didUrl) {
		participantBO.setIsFinished(1);
		this.publicDao.saveOrUpdate(participantBO);
		// 更改调用参数,原来传入"",现在改为"0"
		return this.completeTaskWithOutEnd(participantBO.getTaskId(), outCome,
				"0", "", didUrl, "");
	}

	public void counterSignList(String bizPiId, HttpServletRequest request) {
		List unfinishedList = this.findCounterSignUnfinished(bizPiId);
		request.setAttribute("unfinishedList", unfinishedList);
	}

	/**
	 * 得到未结束的会签
	 * 
	 * @return
	 */
	public List findCounterSignUnfinished(String bizPiId) {
		Map params = new HashMap();
		params.put("isFinished", 0);
		params.put("bizPiId", bizPiId);
		StringBuffer hql = this.findHQL("ETCounterSignBO", params);
		hql.append(" order by O.creatTime desc");
		List unfinishedCounterSignList = this.publicDao.find(hql.toString());
		List unfinishedCounterSignVOList = new ArrayList();
		for (int i = 0; i < unfinishedCounterSignList.size(); i++) {
			ETCounterSignBO counterSign = (ETCounterSignBO) unfinishedCounterSignList
					.get(i);
			PTDeptBO dept = this.deptBSimpl.getSingleById(counterSign
					.getDeptId());
			UnfinishedCounterSignVO vo = new UnfinishedCounterSignVO();
			vo.setETCounterSignBO(counterSign);
			vo.setPTDeptBO(dept);
			unfinishedCounterSignVOList.add(vo);
		}
		return unfinishedCounterSignVOList;
	}

	/**
	 * 获得当前表单的正在会签的个数
	 * 
	 * @param headId
	 * @return
	 */
	public String findCounter(String headId) {
		String preparSQL = "select to_char(count(*)) COUNTER "
				+ "	from e_t_countersign t " + "	where t.isfinished = '0' "
				+ "		and t.headid = '" + headId + "'";
		List list = publicDao.queryForList(preparSQL, new ArrayList());
		Map map = (Map) list.get(0);
		return (String) map.get("COUNTER");
	}
	
	public void deleOpinions(String headId,String deptId){
		String sql = "delete from p_t_common_opinion t where bdid = '" + headId + 
						"' and t.yjbm = '" + deptId + "' and t.yjylx != '1'";
		publicDao.getJdbcTemplate().execute(sql);
	}
	// public List findCounterSignUnfinishedDeptList(String bizPiId){
	// List deptList = new ArrayList();
	// List<UnfinishedCounterSignVO> unfinishedCounterSignVOList =
	// this.findCounterSignUnfinished(bizPiId);
	// for(UnfinishedCounterSignVO vo:unfinishedCounterSignVOList){
	// deptList.add(vo.getPTDeptBO());
	// }
	// return deptList;
	// }
	// public String findUnCounterSignDeptZHList(String bizPiId) {
	// List counterSignDeptList =
	// this.findCounterSignUnfinishedDeptList(bizPiId);
	// List deptList = this.deptBSimpl.getAllChildrens((long)10775);
	// }
}
