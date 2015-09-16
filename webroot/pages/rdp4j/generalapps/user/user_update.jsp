<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/My97DatePicker/WdatePicker.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
 function getFocus(){
  var txt1=document.getElementById("us.loginId");
//获得焦点
  txt1.focus();
 }
    function showDep(){
    var depIds=document.getElementById("depIds").value;
     var checkIdObj = document.getElementsByName("tids").value;
    var h=depIds.split(",");
	  window.open("<%=request.getContextPath()%>/dept/dept_toTree.do?checkDepId="+depIds,'_blank');
      }
 
</script>
</head>
<body class="body1">
<form action="<%=request.getContextPath()%>/users/users_trueUpdate.do" name="myForm" method="post">

<input type="hidden" name="us.tid" value='<s:property value="us.tid"/>' />
  <table class='tabletitle' cellspacing=1 cellpadding=1>
  <tr height=25>
				<td colspan="2" class=formtitle>
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：用户信息修改
				</td>
	</tr>
  
    <tr>
      <td colspan="2" align="center">用户信息修改</td>
    </tr>
    <tr>
	  <td>登录账号</td>
	  <td><input type="text" name="us.loginId" value='<s:property value="us.loginId"/>' /></td>
	</tr>
    <tr>
	  <td>用户名称</td>
	  <td><input type="text" name="us.username" value='<s:property value="us.username"/>' /></td>
	</tr>
	<tr>
	  <td>登录密码</td>
	  <td><input type="password" name="us.password" value='<s:property value="us.password"/>'  /></td>
	</tr>
	
	<tr>
	  <td>用户性别</td>
	  <td>
	  <select name="us.genderCd" >
	     <s:if test="us.genderCd==1">
	       <option value="1" selected="selected">男</option>
	       <option value="2" >女</option>
	    </s:if>
	    <s:else>
	    	<option value="1" >男</option>
	       <option value="2" selected="selected">女</option>
	    </s:else>
	  </select></td>
	</tr>
	
	<tr>
	  <td>人员状态</td>
	  <td>
	  <r:select name="us.statusCd" list="#{}" id="us.statusCd" parRefKey="041"/>
	  </td>
	</tr>
    <tr>
	  <td>排序</td>
	  <td>
	  	<select name="us.rsvdNum1">
		  <option value='${us.rsvdNum1}'>${us.rsvdNum1}</option>
										<% for(int i=1;i<100;i++){
										out.println("<option value='"+i+"'>"+i+"</option>");
										} %>
		</select></td>
	</tr>
	<tr>
	  <td>出生日期</td>
	  <td><input type="text" name="us.birthDate"  readonly="readonly" class="Wdate"
				onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"  value='<s:property value="us.birthDate"/>'/></td>
	</tr>
	<tr>
	  <td>证件号码:</td>
	  <td><input type="text" name="us.idNumber" value='<s:property value="us.idNumber"/>'/></td>
	</tr>
	<tr>
	  <td>电子邮件:</td>
	  <td><input type="text" name="us.email" value='<s:property value="us.email"/>'/></td>
	</tr>
	<tr>
	  <td>移动电话:</td>
	  <td><input type="text" name="us.cellphone" value='<s:property value="us.cellphone"/>'/></td>
	</tr>
	<tr>
	  <td>家庭电话:</td>
	  <td><input type="text" name="us.homePhone" value='<s:property value="us.homePhone"/>'/></td>
	</tr>
	
	<tr>
	  <td>办公电话:</td>
	  <td><input type="text" name="us.businessPhone" value='<s:property value="us.businessPhone"/>'/></td>
	</tr>
	<tr>
	  <td>家庭住址:</td>
	  <td><input type="text" name="us.address" value='<s:property value="us.address"/>'/></td>
	</tr>
	<tr>
	  <td>邮编:</td>
	  <td><input type="text" name="us.postcode" value='<s:property value="us.postcode"/>'/></td>
	</tr> 
	<tr>
	  <td>描述信息:</td>
	  <td align="left">
	  <s:textarea cols="60" rows="10" name="us.description"></s:textarea>
	  </td>
	</tr>
    <tr>
	  <td>分配部门</td>
	  <td>
	   <input type="hidden" id="depIds" name="depIds" value="${depTids}" />
	  <input type="text" name="deptname" id='deptname' value="${depNames}" size="50"/> 
	  <input type="button"  class="button1" value="请选择.." class="button1" onclick="showDep();"/>
	  </td>
	</tr>
	  <tr>
      <td colspan="2" align="center"><input type="submit" class="button1" value="修改"/>
      <input type="button" class="button1" value="返回" onclick="history.back();"/>
    </tr>
  </table>
</form>
</body>
</html>