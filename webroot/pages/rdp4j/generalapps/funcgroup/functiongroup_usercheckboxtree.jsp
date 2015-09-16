<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="inc.jsp"%>
<%@page import="com.tansun.rdp4j.common.model.orm.bo.PTUserBO"%>
<%@page import="com.tansun.rdp4j.generalapps.user.vo.UserVO"%>


<%@ taglib uri="/struts-tags" prefix="s"%>


<%
	
	List<UserVO> list = (List<UserVO>)request.getAttribute("usersList");
%>
<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/resource/js/checkboxtree.js"></script>
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/resource/css/edittree.css">
		<link rel="stylesheet" type="text/css"
			href="/rdp4j/resource/js/jstree/tree_component.css">
		<script type="text/javascript"> 
function test() {
	alert("操作成功！");
	var deptid = "";
	var deptname = "";
 
	var checkIdObj = document.getElementsByName("node");
	for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			var values = checkIdObj(i).value;
			alert(values);
			var ids = values.substring(0, values.lastIndexOf("@"));
			var names = values.substring(values.lastIndexOf("@") + 1,
					values.length);
			alert(ids + "///" + names);
			deptid = deptid + "," + ids;
			deptname = deptname + "," + names;
		}
	}
}

function checkvalue(){
var checkIdObj = document.getElementsByName("node");
	for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			return true;
			form1.submit();
		}else{
			return false;
		}
	}
}
</script>
		<style>
a {
	font-size: 12px;
	font-family: Verdana;
	text-decoration: none;
	color: red
}
</style>
	</head>
	<body  class='body1' bgcolor="#F7F7F7">
		<form id='form1' name='form1' target='_parent'
			action='funcgroup_updateUserRole.do' method='post'>
			角色编号：
			<input type='text' name='tid' size='10' readonly='true' value='<%=request.getParameter("tid")%>'>
			<input type="submit" class='button1' value='确定'>
			<table class='tabletitle' cellspacing=1 cellpadding=1>
     
	     <th align="center" nowrap ><input type="checkbox" name="cheeck"
										onclick="checkAll(this.checked);" />
									全选</th>
	    
	     <th align="center">姓名</th>
	      <th align="center">部门</th>
	    </tr>
	    
	    <%
	    
	    for(int i=0;i<list.size();i++){
	   		UserVO user=(UserVO)list.get(i);
	   		com.tansun.rdp4j.common.model.orm.bo.PTDeptBO pdept =new com.tansun.rdp4j.common.model.orm.bo.PTDeptBO();
	  
	   		 
	   	%>
	   	  <tr>
        
         <td><input type="checkBox"   id="user<%=user.getUserid() %>"  name="userid"     value="<%=user.getUserid() %>"/></td>
		
		 <td> <%=user.getUsername()%>(<%=user.getUserid()%>)</td>
		   <td> <%=user.getDeptname()%>(<%=user.getDeptid()%>)</td>
		 </tr>
	   	<%
	    }
	     %>

     
  </table>
			
		</form>
	</BODY>
</HTML>
<SCRIPT language="javascript">   

function checkAll(value){
			var userids=document.getElementsByName("userid");
			for(i=0;i<userids.length;i++){
				userids[i].checked=value;
			}
		}
			 	
${strjschecktreeuser}
</SCRIPT>
