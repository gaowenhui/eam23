<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.tansun.rdp4j.workflow.common.vo.*"%>
<%
WorkflowVO vo = (WorkflowVO)request.getAttribute("workflowVO");
Set<String> outComes = (Set<String>)request.getAttribute("outComes");
String taskId = (String)request.getAttribute("taskId");
String taskName = (String)request.getAttribute("taskName");
String uperTaskID = (String)request.getAttribute("uperTaskID");
String uperTid = (String)request.getAttribute("uperTid");
String assigneeName = (String)request.getAttribute("assigneeName");
%>
