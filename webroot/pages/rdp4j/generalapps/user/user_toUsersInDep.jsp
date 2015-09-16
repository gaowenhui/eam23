<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  function checkAll(someSthing){
   //alert("aaaaa");
		var arr=document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked=someSthing;
		}
	}
	function turnDelete(depTid){
	alert(depTid);
        myForm.action="<%=request.getContextPath() %>/users/depUser_deleteUsers.do?depUser.deptId="+depTid;
		if(confirm("确认删除吗?")){
			var flag=false;
			var arr=document.getElementsByName("tids");
			alert(arr.length);
			for(i=0;i<arr.length;i++){
			
				if(arr(i).checked){
				alert("----"+arr(i));
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
	}
	 function turnToUsers(depTid){
	  window.open("<%=request.getContextPath()%>/users/depUser_toUsersNotInDep.do?dep.tid="+depTid,"","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=400,height=500")
	}
</script>
</head>
<body class="body1">
<form id="myForm" name="myForm" method="post" action="">
   <table class='tabletitle' cellspacing=1 cellpadding=1>
   <tr height=25>
				<td class=formtitle colspan="2">
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：所属人员信息
				</td>
	</tr>
     <tr><td colspan="2" align="center">已分配到该部门的人员</td></tr>
	     <tr>
	     <th align="center" >选择</th>
	     <th align="center">姓名</th>
	    </tr>
      <s:iterator value="usersList">
         <tr>
         <td><input type="checkBox" name="tids" value="<s:property value="tid"/>"/></td>
		 <td><s:property value="username"/></td>
		 </tr>
      </s:iterator>
      <tr>
        <td colspan="2"><input type="checkbox" name="cheeck" onclick="checkAll(this.checked);"/>
         <input type="button" class="button1" value="添加" onClick="turnToUsers(${depTid});">
          <input type="button" class="button1" value="删除" onClick="turnDelete(${depTid});">
          <input type="button" class="button1" value="返回" onClick="history.back();">
        </td>
      </tr>
  </table>
</form>
</body>
</html>