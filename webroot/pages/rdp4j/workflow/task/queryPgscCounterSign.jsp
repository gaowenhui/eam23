<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<% String headId = (String)request.getAttribute("headId"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>办理的部门查询</title>

	</head>

	<body >
		<s:form id="myform" name="myform">
			<br/>
			<div align="center"><span class="STYLE1">办理情况查询</span></div>
			<br/>
			<br/>
			<br/>
			<table id="unfinishmeetingList"></table>
			<div id="pgtoolbar"></div>
			<br/>
			<table id="finishmeetingList"></table>
			<div id="pgtoolbar"></div>
			<script type="text/javascript">
	            jQuery("#unfinishmeetingList").jqGrid({
		           	url:"<%=basePath%>countersign/startcountersign_meetingDept.do",
			        postData:{headId : "<%=headId%>", status : '0'},
		           	datatype:"json",
		            colNames:['创建时间','标题','部门名称','综合员姓名'],
		            colModel: [
						{name:'createtime',index:'createtime'},
						{name:'title',index:'title'},
						{name:'deptname',index:'deptname'},
						{name:'username',index:'username'}
					],
					rownumbers:true,
		            height:'auto',
		            autowidth:true,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		            multiselect:false,
		            caption: '未完成办理部门',
		            jsonReader: {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems:false,
						id: "0"
				    }
	         	});
			</script>
			<script type="text/javascript">
	            jQuery("#finishmeetingList").jqGrid({
		           	url:"<%=basePath%>countersign/startcountersign_meetingDept.do",
			        postData:{headId : "<%=headId%>", status : '1'},
		           	datatype:"json",
		            colNames:['创建时间','标题','部门名称','综合员姓名'],
		            colModel: [
						{name:'createtime',index:'createtime'},
						{name:'title',index:'title'},
						{name:'deptname',index:'deptname'},
						{name:'username',index:'username'}
					],
					rownumbers:true,
		            height:'auto',
		            autowidth:true,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		            multiselect:false,
		            caption: '已完成办理部门',
		            jsonReader: {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems:false,
						id: "0"
				   }
	         	});
			</script>
		</s:form>
	</body>
</html>
