<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>选择用户</title>
<script type="text/javascript">
  function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}
	function turnAdd(temp){
	    //看是否需要删除该用户在其他部门的信息
	     myForm.action="<%=request.getContextPath() %>/users/depUser_add.do";
	    //1state的值是 yes的话 
        //2state的值是 no的话 就需要 
		if(confirm("确认添加到该部门?")){
		  var flag=false;
		  var arr=document.getElementsByName("tids");
		  for(i=0;i<arr.length;i++){
		  if(arr(i).checked){
		 	flag=true;
			 break;
			 }
			}
			if(!flag){
			  alert("至少选择一个");
			  }else{
			  myForm.submit();		
			}
		}
		  	window.opener.location.href="<%=request.getContextPath()%>/users/depUser_toUsersInDep.do?dep.tid="+temp; 
	         window.close();
	}
	
	function queryDep(){
	  var userName=document.getElementById("userName").value;
	  myForm.action="<%=request.getContextPath()%>/users/depUser_getQueryUser.do?userName"+userName;
	  myForm.submit();
	  document.getElementById("userName").value=userName;
	}
	function clearValue(){
	   document.getElementById("userName").value="";
	    myForm.action="<%=request.getContextPath()%>/users/depUser_toUsersNotInDep.do";
	    myForm.submit();
	}
	
	
</script>
</head>
<body class="body1">
<form id="myForm" name="myForm" method="post" action="">
<input type="hidden" name="dep.tid" value="${depTid}"/>
   <table class='tabletitle' cellspacing=1 cellpadding=1>
   <tr height=25>
				<td class=formtitle colspan="4">
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：选择用户
				</td>
	</tr>
   
    <tr>
        <td colspan="4" align="left">
        根据名称查询：<input type="text" name="userName" id="userName" value="${userName}"/>
        <input type="button" class="button1"  value="查询"  onclick="queryDep();"/>
        <input type="button" class="button1" value="清除结果" onclick="clearValue();"/>
        </td>
      </tr>
     <tr><td colspan="5" align="center">未分配到该部门的人员</td></tr>
	     <tr>
	     <th align="center" >选择</th>
	     <th align="center">姓名</th>
	     <th align="center">保留人员在其他部门的信息</th>
	    </tr>
      <s:iterator value="usersList">
         <tr>
         <td><input type="checkBox" name="tids" value="<s:property value="tid"/>"/></td>
		 <td>&nbsp;<s:property value="username"/></td>
		 <td><input name="stat<s:property value='tid'/>"  type="radio" checked="checked" value="yes"/>是
		  <input name="stat<s:property value='tid'/>"  type="radio" value="no"/>否
		 </td>
		 </tr>
      </s:iterator>
      <tr>
        <td colspan="3"><input type="checkbox" name="cheeck" onclick="checkAll(this.checked);"/>
         <input type="button" class="button1" value="确定" onClick="turnAdd(${depTid});">
        </td>
      </tr>
  </table>
</form>
</body>
</html>