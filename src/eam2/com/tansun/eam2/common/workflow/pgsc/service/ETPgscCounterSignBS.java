package com.tansun.eam2.common.workflow.pgsc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jbpm.api.task.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignBO;
import com.tansun.eam2.common.workflow.counterSign.model.ETCounterSignParticipantBO;
import com.tansun.eam2.common.workflow.counterSign.vo.ETCounterSignParticipantVO;
import com.tansun.eam2.common.workflow.counterSign.vo.UnfinishedCounterSignVO;
import com.tansun.eam2.zccz.service.IPgscWfBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTRoleBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.privileges.service.impl.FunctionRoleBSimpl;
import com.tansun.rdp4j.generalapps.user.service.impl.UserBSimpl;
import com.tansun.rdp4j.generalapps.user.vo.UserRoleVO;
import com.tansun.rdp4j.generalapps.user.vo.UserRolesListVO;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.common.vo.ETCommonOpinionVO;
import com.tansun.rdp4j.workflow.task.service.PTCommonOpinionBS;
import com.tansun.rdp4j.workflow.task.service.PTDidBS;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

@Service
public class ETPgscCounterSignBS {
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
	private IPgscWfBS pgscBs;

	public void save(ETCounterSignBO eTCounterSignBO) {
		this.publicDao.save(eTCounterSignBO);
	}

	public void startCounterSign(String pdName, String bizPiId, String title,
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
		pTTodo.setTitle(title);
		pTTodo.setUserId(assign);
		pTTodo.setSendUserId(UserThreadLocal.get().getUserTid());
		pTTodo.setTaskId(task.getId());
		pTTodo.setProcInstId(piId);
		pTTodo.setProcInstName(pdName);
		pTTodo.setTaskName(task.getName());
		// pTTodo.setHeadId("" + eTCounterSignBO.getTid());
		pTTodo.setHeadId(headId);
		pTTodo.setDraftUserId(draftUserId);
		pTTodo.setDraftDate(draftDate);
		pTTodo.setUrl(url);
		this.pTTodoBS.saveOrUpdate(pTTodo);

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
		
		PTDid did = this.pTDidBS.findPTDidByTaskId(taskId);
		List commonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOListByCldId(did.getHeadId(),
						CommonGlobal.OPINION_YJYLX_MEETING, 0);
		List snedBackCommonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOListByCldId(did.getHeadId(),
						CommonGlobal.OPINION_YJYLX_HQTH, 1);
		List finalCommonOpinionVOList = this.commonOpinionBS
				.findCommonOpinionVOListByCldId(did.getHeadId(),
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

	public List findtaskListBytaskId(String taskId) {
		StringBuffer hql = new StringBuffer();
		List param = new ArrayList();
		param.add(taskId);
		hql
				.append("Select  O.taskId FROM ETCounterSignParticipantBO O where O.countersignId = (select b.countersignId from ETCounterSignParticipantBO b where b.taskId = ?)");
		List list = this.publicDao.find(hql.toString(), param);
		return list;
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

	// public ETCounterSignParticipantBO findParticipantByTaskId(String taskId)
	// {
	// List params = new ArrayList();
	// params.add(taskId);
	// StringBuffer hql = new StringBuffer();
	// hql.append("FROM ETCounterSignParticipantBO O where O.taskId=?");
	// ETCounterSignParticipantBO cpBO = (ETCounterSignParticipantBO)
	// this.publicDao.findSingleResult(hql
	// .toString(), params);
	// List<PTRoleBO> list =
	// this.functionRoleBSimpl.getByUserId(cpBO.getUserId());
	// cpBO.setRoleList(list);
	// return cpBO;
	// }

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
		if (cpBO == null) {
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
		// for (int i = 0; i < users.length; i++) {
		// this.startCounterSignParticipant(users[i], counterSignId,
		// assignParticipantId, taskId, newParticipantTaskUrl, pdName);
		// }
		return this.completeAddParticipantTask("" + taskId, outCome,
				nextTaskUrl);
	}

	public PTTodo startCounterSignParticipant(String userId,
			long counterSignId, long assignParticipantId, long taskId,
			String newParticipantTaskUrl, String pdName) {
		String piId = this.workflowutil.startLastVersionPIByPDName(pdName,
				userId);
		String newTaskId = this.workflowutil.getTask(piId).getId();
		String taskName = this.workflowutil.getTaskName(newTaskId);
		PTTodo pTTodo = this.pTTodoBS.findPTTodoByTaskId("" + taskId);
		Long deptId = pTTodo.getDeptId();
		PTTodo newPTTodo = pTTodo.clone();
		newPTTodo.setDeptId(deptId);
		newPTTodo.setTid((long) 0);
		newPTTodo.setUserId(Long.parseLong(userId));
		newPTTodo.setProcInstId(piId);
		newPTTodo.setProcInstName(pdName);
		newPTTodo.setTaskId(newTaskId);
		newPTTodo.setTaskName(taskName);
		newPTTodo.setUrl(newParticipantTaskUrl);
		newPTTodo.setIsRead("0");
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
				nextAssignId, nextTaskUrl, "", "");
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
			Long deptId = pTTodo.getDeptId();
			PTTodo newPTTodo = pTTodo.clone();
			newPTTodo.setDeptId(deptId);
			newPTTodo.setCreateDate(new Date());
			newPTTodo.setUrl(nextTaskUrl);
			newPTTodo.setTaskId(newTaskId);
			newPTTodo.setTaskName(newTaskName);
			this.pTTodoBS.saveOrUpdate(newPTTodo);
			return newTaskId;
		}
		return "";
	}

	public PTTodo editPortal(String taskId, String newTaskId) {
		PTTodo pTTodo = this.pTTodoBS.findPTTodoByTaskId(newTaskId);
		return pTTodo;
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
			// List didList = this.pTDidBS.findDidListByPiId(pTTodo
			// .getProcInstId());
			// for (int i = 0; i < didList.size(); i++) {
			// pTDid = (PTDid) didList.get(i);
			// PTEnd pTEnd = this.pTEndBS.findPTEndByUserPi(pTDid.getUserId(),
			// pTDid.getProcInstId());
			// if (pTEnd == null) {
			// pTEnd = pTDid.toPTEnd();
			// pTEnd.setUrl(endUrl);
			// this.pTEndBS.SaveOrUpdate(pTEnd);
			// }
			// pTDid.setStatu("0");
			// this.pTDidBS.saveOrUpdate(pTDid);
			// }
			return "";
		}
	}

	public String commitZHGCContent(String taskId, String outCome,
			String content, int contentSetTpye, String nextTaskUrl,
			String didUrl, String headId) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if (participantBO.isFinished == 1) {
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if (counterSign.isFinished == 1) {
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
		commonOpinion.setBdid(headId);
		this.commonOpinionBS.saveOrUpdate(commonOpinion);
		String newTaskId = this.completeTaskWithOutEnd(taskId, outCome, userId,
				nextTaskUrl, didUrl, "");
		participantBO.setTaskId(newTaskId);
		this.publicDao.saveOrUpdate(participantBO);
		pgscBs.setPgscjlYtj(counterSign.headId, userId);
		return newTaskId;
	}

	public String commitJBGCContent(String taskId, String outCome,
			String content, int contentSetTpye, String nextTaskUrl,
			String didUrl, String headId) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if (participantBO.isFinished == 1) {
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if (counterSign.isFinished == 1) {
			return null;
		}
		if (content != null && !content.equals("")) {
			PTCommonOpinionBO commonOpinion = new PTCommonOpinionBO();
			commonOpinion.setCountersignId(participantBO.getCountersignId());
			commonOpinion.setTaskId(taskId);
			commonOpinion.setYjbm(counterSign.getDeptId());
			commonOpinion.setParticipantId(participantBO.getTid());
			commonOpinion.setTjr(userId);
			commonOpinion.setYjnr(content);
			commonOpinion.setYjylx(contentSetTpye);
			commonOpinion.setYjlx(new Integer(
					CommonGlobal.OPINION_YJYLX_MEETING));
			commonOpinion.setZzyj(0);
			commonOpinion.setBdid(headId);
			this.commonOpinionBS.saveOrUpdate(commonOpinion);
		}
		String newTaskId = this.completeTaskWithEnd(taskId, outCome, userId,
				nextTaskUrl, didUrl, "");
		participantBO.setIsFinished(1);
		this.publicDao.saveOrUpdate(participantBO);
		pgscBs.setPgscjlYtj(counterSign.headId, userId);
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

	//提交最终意见
	public String commitFinalContent(String taskId, String outCome,
			String content, int contentSetTpye, int contentTpye, String didUrl,
			String headId) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if (participantBO.isFinished == 1) {
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if (counterSign.isFinished == 1) {
			return null;
		}
		List participantList = this.findParticipantsByCounterSignId(counterSign
				.getTid());
		for (int i = 0; i < participantList.size(); i++) {
			ETCounterSignParticipantBO participant = (ETCounterSignParticipantBO) participantList
					.get(i);
			if (participantBO.getTid().equals(participant.getTid())) {
				continue;
			}
			this.finishParticipant(participant, outCome, didUrl);
		}
		// 取得用户的角色信息
		UserRoleVO vo = userBSimpl
				.getUserRoleVOByUserId(Long.parseLong(userId));
		List<UserRolesListVO> voList = vo.getUserRoleList();
		for (UserRolesListVO userRole : voList) {
			// 判断是不是部门领导
			if (userRole.getTid() == 96L) {
				// 是部门领导,拷贝未提交的意见到知识库
				pgscBs.copyYjToZSK(counterSign.getHeadId(), userId);
				break;
			}
		}
		// 设置为已提交
		pgscBs.setPgscjlYtj(counterSign.getHeadId(), userId);
		// 提交最终意见的时候不需要拷贝意见
		return this.finishContentParticipant(participantBO, content,
				contentSetTpye, contentTpye, outCome, didUrl, headId);
	}

	public String commitZHFinalContent(String taskId, String outCome,
			String content, int contentSetTpye, int contentTpye, String didUrl,
			String headId) {
		String userId = "" + UserThreadLocal.get().getUserTid();
		ETCounterSignParticipantBO participantBO = this
				.findParticipantByTodoTaskId(taskId);
		if (participantBO.isFinished == 1) {
			return null;
		}
		ETCounterSignBO counterSign = this.findCounterSignByTid(participantBO
				.getCountersignId());
		if (counterSign.isFinished == 1) {
			return null;
		}
		List participantList = this.findParticipantsByCounterSignId(counterSign
				.getTid());
		for (int i = 0; i < participantList.size(); i++) {
			ETCounterSignParticipantBO participant = (ETCounterSignParticipantBO) participantList
					.get(i);
			if (participantBO.getTid().equals(participant.getTid())) {
				continue;
			}
			this.finishParticipant(participant, outCome, didUrl);
		}
		// 取得用户的角色信息
		UserRoleVO vo = userBSimpl
				.getUserRoleVOByUserId(Long.parseLong(userId));
		List<UserRolesListVO> voList = vo.getUserRoleList();
		// for(UserRolesListVO userRole : voList){
		// //判断是不是部门领导
		// if(userRole.getTid() == 96L){
		// //是部门领导,拷贝未提交的意见到知识库
		// pgscBs.copyYjToZSK(counterSign.getHeadId(), userId);
		// break;
		// }
		// }
		// 设置为已提交
		pgscBs.setPgscjlYtj(counterSign.getHeadId(), userId);
		// if(StringUtils.equals(String.valueOf(CommonGlobal.OPINION_YJYLX_HQTH),
		// String.valueOf(contentSetTpye))){
		// 为退回拷贝预留位置
		// }
		return this.finishContentParticipant(participantBO, content,
				contentSetTpye, contentTpye, outCome, didUrl, headId);
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
	 * 提交退回意见或者最终意见时候拷贝一份历史记录
	 * 
	 * @param headId
	 */
	public String copyTheOldBLD(String headId) {
		CzPgscZskwhCld pgsc = publicDao.findById(CzPgscZskwhCld.class, headId);
		CzPgscZskwhCld pgscnew = new CzPgscZskwhCld();
		
		String[] ignoreStr = new String[]{"id"};
		//新拷贝一份作为历史
		BeanUtils.copyProperties(pgsc, pgscnew,ignoreStr);
		publicDao.save(pgscnew);
		//修改旧记录中的上次审查处理单id
		pgsc.setScsccldId(pgscnew.getId());
		publicDao.update(pgsc);
		
		/*
		if (pgsc.getScsccldId() != null) { // 如果有历史记录
			BeanUtils.copyProperties(pgsc, pgscnew);
			pgscnew.setId(null);
			pgscnew.setScsccldId(pgsc.getScsccldId());
			publicDao.save(pgscnew);
			pgsc.setScsccldId(pgscnew.getId());
		} else { // 第一次保存历史记录的时候
			BeanUtils.copyProperties(pgsc, pgscnew);
			pgscnew.setId(null);
			publicDao.save(pgscnew);
			pgsc.setScsccldId(pgscnew.getId());
			publicDao.update(pgsc);
		}
		*/
		
		// 拷贝表体
		List listbody = publicDao
				.find("from CzPgxxLsb o where o.czpgscclid = '" + headId + "'");
		for (int i = 0; i < listbody.size(); i++) {
			CzPgxxLsb lsb = (CzPgxxLsb) listbody.get(i);
			CzPgxxLsb lsbnew = new CzPgxxLsb();
			BeanUtils.copyProperties(lsb, lsbnew,ignoreStr);
			lsbnew.setCzpgscclid(pgscnew.getId());
			publicDao.save(lsbnew);
		}
		//拷贝意见
		List listopin = publicDao
				.find("from PTCommonOpinionBO o where o.bdid = '" + headId
						+ "' and (o.yjylx = '0' or o.countersignId is not null)");
		for (int j = 0; j < listopin.size(); j++) {
			PTCommonOpinionBO ptbo = (PTCommonOpinionBO) listopin.get(j);
			//需要复制一份，表单id为作为历史的表单id	
			PTCommonOpinionBO ptbonew = new PTCommonOpinionBO();
			BeanUtils.copyProperties(ptbo, ptbonew,ignoreStr);
			ptbonew.setBdid(pgscnew.getId());
			publicDao.save(ptbonew);
			//如果是评估审查的意见，直接修改为作为历史的表单id
			if (ptbo.getCountersignId() != null) {
				ptbo.setCountersignId(null);
				publicDao.update(ptbo);
			}
		}
		// 拷贝办理依据
		List listblyj = publicDao
				.find("from CommonAccording o where o.bdid = '" + headId + "'");
		for (int m = 0; m < listblyj.size(); m++) {
			CommonAccording accord = (CommonAccording) listblyj.get(m);
			CommonAccording accordnew = new CommonAccording();
			BeanUtils.copyProperties(accord, accordnew);
			accordnew.setId(null);
			accordnew.setBdid(pgscnew.getId());
			publicDao.save(accordnew);
		}
		// 拷贝附件
		String hql = "select o from PTAttachment o where o.bdid = '" + headId
				+ "' ";
		List listattm = publicDao.find(hql);
		for (int n = 0; n < listattm.size(); n++) {
			PTAttachment attm = (PTAttachment) listattm.get(n);
			PTAttachmentBlob blob = (PTAttachmentBlob) publicDao.findById(
					PTAttachmentBlob.class, attm.getId());
			PTAttachment attmnew = new PTAttachment();
			attmnew.setBdid(pgscnew.getId());
			attmnew.setFjbt(attm.getFjbt());
			attmnew.setFjlx(attm.getFjlx());
			attmnew.setState(attm.getState());
			attmnew.setYwjm(attm.getYwjm());
			attmnew.setTemplateid(attm.getTemplateid());
			attmnew.setDel(attm.getDel());
			attmnew.setScrbh(attm.getScrbh());
			attmnew.setScbm(attm.getScbm());
			attmnew.setScrid(attm.getScrid());
			attmnew.setSwid(attm.getSwid());
			attmnew.setZzfj(attm.getZzfj());
			PTAttachmentBlob blobNew = new PTAttachmentBlob();
			blobNew.setContent(blob.getContent());
			attmnew.setBlob(blobNew);
			publicDao.save(attmnew);
		}
		// 审批结论
		List listscjl = publicDao.find("from CzPgscJl o where o.cldId = '"
				+ headId + "'");
		for (int k = 0; k < listscjl.size(); k++) {
			CzPgscJl jl = (CzPgscJl) listscjl.get(k);
			jl.setCldId(pgscnew.getId());
			publicDao.update(jl);
		}
		return pgscnew.getId();
	}

	public List findCommonOpinionVOList(String headId, int opinionYjylxMeeting,
			int zzyj) {
		List commonOpinionBOList = this.findCommonOpinionBOList(headId,
				opinionYjylxMeeting, zzyj);
		List commonOpinionVOList = new ArrayList();
		for (int i = 0; i < commonOpinionBOList.size(); i++) {
			PTCommonOpinionBO commonOpinionBO = (PTCommonOpinionBO) commonOpinionBOList
					.get(i);
			ETCommonOpinionVO vo = new ETCommonOpinionVO();
			vo.setCommonOpinion(commonOpinionBO);
			PTUserBO user = this.userBSimpl.getUserBO(Long
					.parseLong(commonOpinionBO.getTjr()));
			vo.setUserBO(user);
			PTDeptBO pTDeptBO = this.deptBSimpl.getSingleById(commonOpinionBO
					.getYjbm());
			vo.setPTDeptBO(pTDeptBO);
			commonOpinionVOList.add(vo);
		}
		return commonOpinionVOList;
	}

	public List findCommonOpinionBOList(String headId, int opinionYjylxMeeting,
			int zzyj) {
		List param = new ArrayList();
		param.add(headId);
		param.add(opinionYjylxMeeting);
		param.add(zzyj);
		StringBuffer hql = new StringBuffer();
		hql
				.append("FROM PTCommonOpinionBO O WHERE O.bdid=? AND O.yjylx=? AND O.zzyj=?");
		hql.append(" ORDER BY O.tjrq DESC");
		return this.publicDao.find(hql.toString(), param);
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

	
	public void updateDidBdId(String headId,String historyId,String blbm){
		String sql = "update p_t_did set head_id = '"+historyId+"' where " +
				"head_id = '"+headId+"' and taskname = '评估审查办理'";
		publicDao.getJdbcTemplate().execute(sql);
	}

	public Boolean  HavePgscCountersign(String headId ,Long userId  ){
		List param = new ArrayList();
		param.add(headId);
		param.add(userId);
		StringBuffer hql = new StringBuffer();
		hql.append("FROM PTTodo O WHERE O.statu='1' AND O.headId=? AND O.userId!=? AND O.procInstName='pgscCountersign'");
		List list = this.publicDao.find(hql.toString(), param);
		if(list!=null&&list.size()>0){
			return true;
		}else{
			return false ;
		}
	}
	public PTTodo  nowPgscCountersign(String headId ,Long userId  ){
		List param = new ArrayList();
		param.add(headId);
		param.add(userId);
		StringBuffer hql = new StringBuffer();
		hql.append("FROM PTTodo O WHERE O.statu='1' AND O.headId=? AND O.userId=? AND O.procInstName='pgscCountersign'");
		List list = this.publicDao.find(hql.toString(), param);
		if(list!=null&&list.size()==1){
			return (PTTodo) list.get(0);
		}else{
			return null ;
		}
	}
	public PTTodo  nowPgscToDo(String headId  ){
		List param = new ArrayList();
		param.add(headId);
		StringBuffer hql = new StringBuffer();
		hql.append("FROM PTTodo O WHERE O.statu='1' AND O.headId=?  AND O.procInstName='zccz_pgsc'");
		List list = this.publicDao.find(hql.toString(), param);
		if(list!=null&&list.size()==1){
			return (PTTodo) list.get(0);
		}else{
			return null ;
		}
	}

}
