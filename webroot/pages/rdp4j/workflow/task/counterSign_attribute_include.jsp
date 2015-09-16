<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.Set"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.model.*"%>
<%@ page language="java" import="com.tansun.eam2.common.workflow.counterSign.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.model.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%@ page language="java" import="java.text.*"%>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String isDid = (String)request.getAttribute("isDid");
	PTDeptBO dept = (PTDeptBO)request.getAttribute("dept");
	String taskId = (String)request.getAttribute("taskId");
	String taskName = (String)request.getAttribute("taskName");
	String assignName = (String)request.getAttribute("assignName");
	List participantVOList = (List)request.getAttribute("participantVOList");
	ETCounterSignBO counterSign = (ETCounterSignBO)request.getAttribute("counterSign");
	boolean isInCounterSign = false;
	if(counterSign!=null) isInCounterSign=true;
	ETCounterSignParticipantBO assignParticipant = (ETCounterSignParticipantBO)request.getAttribute("assignParticipant");
	List gcOpinionVOList = (List)request.getAttribute("gcOpinionVOList");
	if(gcOpinionVOList==null){gcOpinionVOList=new ArrayList();}
	List snedBackCommonOpinionVOList = (List)request.getAttribute("snedBackCommonOpinionVOList");
	if(snedBackCommonOpinionVOList==null){snedBackCommonOpinionVOList=new ArrayList();}
	List finalCommonOpinionVOList = (List)request.getAttribute("finalCommonOpinionVOList");
	if(finalCommonOpinionVOList==null){finalCommonOpinionVOList=new ArrayList();}
	String userType = "";
	List<PTRoleBO> roleList = new ArrayList<PTRoleBO>();
	if(isInCounterSign) roleList = assignParticipant.getRoleList();
	for(PTRoleBO role:roleList){
		if(role.getTid()==(long)107){
			userType = "ZH";
			break;
		}
		if(role.getTid()==(long)96||role.getTid()==(long)176){
			userType = "BMLD";
			break;
		}
		if(role.getTid()==(long)125){
			userType = "JBR";
			break;
		}
		if(role.getTid()==(long)126){
			userType = "ZZ";
			break;
		}
	}
%>
