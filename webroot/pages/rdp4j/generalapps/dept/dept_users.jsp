<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.tansun.rdp4j.common.model.orm.bo.*"%>
<%@page import="com.tansun.rdp4j.workflow.task.action.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/inc/header-standard.inc"%>
<%
	String multiple = (String)request.getAttribute(WorkflowAction.MULTIPLE);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>roleedit.html</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css"	type="text/css">
		<script type="text/javascript">
		function mySwitchAdd(ObjSource,ObjTarget,isMultiple){
		  for(var i=0;i<ObjSource.length;i++){
			  if(ObjSource.options[i].selected){
				    // 支持多选
				    var opt=document.createElement("OPTION");
				   if(isMultiple=='true'){
				   		opt.value=ObjSource.options[i].value;
				     	opt.text=ObjSource.options[i].text;
				     	ObjTarget.add(opt);
				     	ObjSource.options.remove(i--);
				   }else{
				   		var m =  document.all("Target").options.length;
				   		var tmpOpt;
				   		if(m>0){
				   			tmpOpt = ObjTarget.options[0];
				   		}
				   		clearOptions(ObjTarget);
					   opt.value=ObjSource.options[i].value;
				    	opt.text=ObjSource.options[i].text;
				     	ObjTarget.add(opt);
				     	ObjSource.options.remove(i--);
				     	if(m>0){
				     		ObjSource.add(tmpOpt);
				     	}
				   }
		  		}
		 }
	   }
	   	
	   function clearOptions(selObj){
	   	while(selObj.length>0){
	   		selObj.options.remove(0);
	   	}
	   }
	   function mySwitchDelete(ObjSource,ObjTarget,isMultiple){
		  for(var i=0;i<ObjSource.length;i++){
			  if(ObjSource.options[i].selected){
				  var opt=document.createElement("OPTION");
				     opt.value=ObjSource.options[i].value;
				     opt.text=ObjSource.options[i].text;
				     ObjTarget.add(opt);
				     ObjSource.options.remove(i--);
		  	}
		 }
	   }

	function addUser(){
	//提交用户 添加到下一步提交人 
	//TODO
	 var m = document.all("Target").options.length;
	var tids= document.myForm.deptId.value;
	var users = "";
	for(var i=0;i<m;i++){
	 users=users+","+document.all("Target").options[i].value;
	}
	if(users!=""){
	  window.returnValue=tids+users;
	  window.close();
	}
	alert('请选择用户！');
	//是否是会签 返回 部门id和userId
	}
	</script>
	</head>
	<body class="body1">
	<form action="" name="myForm" method="post"  >
<%
	String selectedDeptId= (String)request.getAttribute("selectedDeptId");
	System.out.println("selectedDeptId="+selectedDeptId);
%>
	<input type="hidden" name="deptId" id="deptId" value="<%=selectedDeptId%>">
	<input type="hidden" name="taskId">
	<input type="hidden" name="outCome">
		<table align="center" cellspacing="1" cellpadding="1" class="tabletitle" height="420pt">
			
			<tr>
				<td valign="top" align="center">
					
						<table cellPadding=0 cellSpacing=1  class="table1" >
							<tr>
								<td width="60%" valign="top" align="center" height="420pt">
								
		<table align="center" cellspacing="1" cellpadding="1" 	class="tabletitle" height="100%">
		<tr>
			            <td width="40%" align="center">待选择用户</td>
			            <td width="10%" align="center" nowrap>操作</td>
                        <td width="40%" align="center">已选择用户</td>
		</tr>
		<tr>
			<td align=center>
				<select name="Source"  style="width:80%"   size='30' multiple="multiple" ondblclick="mySwitchAdd(document.all.Source,document.all.Target,'<%=multiple%>');">
		   <%
		   List<PTUserBO> userList=(List<PTUserBO>)request.getAttribute("userList");
						for (PTUserBO bo:userList) {	
					%>
					<%
						out.println("<option value= '" + bo.getTid()+ "'>");
							out.println(bo.getUsername());
							if(bo.getStatusCd().equals("041001")){
							 out.println("&nbsp;");
							}else{
							 out.println("&nbsp;");
							 //
							 out.println("<font color='red'>请假中</font>");
							}
							
							out.println("</option>");
							
						}
					%>
	
	    	</select>
			</td>
			<td><br>
				<input type="button" value="添加" class="button1" onClick="mySwitchAdd(document.all.Source,document.all.Target,'<%=multiple%>');"><br><br>
				<input type="button" value="删除" class="button1" onClick="mySwitchDelete(document.all.Target,document.all.Source,'<%=multiple%>');"><br><br>
			</td>
			<td align="center">
				<select name="Target"  style="width:80%" size='30' multiple="multiple" ondblclick="mySwitchDelete(document.all.Target,document.all.Source,'<%=multiple%>');">
				</select>
			</td>
		</tr>
		<tr><td align="center" colspan="3">
	   <input type="button" class="button1" value="确定" onclick="addUser();">&nbsp;&nbsp;
	   <input type="button" class="button1" value="取消"  onclick="window.close();">
	 </td></tr>		
	</table>							
	</table>
	</td>
	</tr>
	</table>
	</form>
	</body>
</html>