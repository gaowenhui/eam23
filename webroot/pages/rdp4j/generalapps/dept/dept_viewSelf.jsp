<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="r" uri="/rdp4j-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
<title>Insert title here</title>
<%@include file="dtree.jsp" %> 
<script type="text/javascript">
  function getUsers(tid){
    myForm.action="<%=request.getContextPath() %>/users/depUser_toUsersInDep.do?dep.tid="+tid;
    myForm.submit();
  }
  function alterDep(){
    myForm.action="<%=request.getContextPath() %>/dept/dept_alterDep.do";
    myForm.submit();
  }
  function addChild(tid){
    myForm.action="<%=request.getContextPath() %>/dept/dept_toAddChild.do?dep.parId="+tid;
    myForm.submit();
  }
  function toTrueUpdate(tid){
    myForm.action="<%=request.getContextPath()%>/dept/dept_toTrueUpdate.do?dep.tid="+tid;
    myForm.submit();
  }
  function splitDep(tid){
    myForm.action="<%=request.getContextPath()%>/dept/dept_splitDep.do?dep.tid="+tid;
    myForm.submit();
  }
  function combinationDep(tid){
    myForm.action="<%=request.getContextPath()%>/dept/dept_combinationDep.do?dep.tid="+tid;
    myForm.submit();
  }
</script>
</head>
<body class="body1">
<form name="myForm" action="" method="post">
  <table class='tabletitle' cellspacing=1 cellpadding=1>
    <tr height=25>
				<td class=formtitle colspan=2>
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：部门信息显示
				</td>
	</tr>
  
    <tr>
      <td colspan="2" align="center">组织机构信息</td>
    </tr>
     <tr> 
	  <td>机构名称</td>
	  <td><input type="text" name="dep.deptName" value='<s:property value="dep.deptName"/>' readonly="readonly"/></td>
	</tr>
    <tr>
	  <td>机构描述</td>
	  <td><input type="text" name="dep.deptDesc" value='<s:property value="dep.deptDesc"/>' readonly="readonly"/></td>
	</tr>
	  <tr>
	  <td>机构类别</td>
	  <td> 
	   
	   <r:select name="dep.deptTypeCd" list="#{}" id="dep.deptTypeCd" parRefKey="040"/>
		</td>
	 </tr>
	  <tr>
	  <td>排序值</td>
	  <td><select name="dep.sortOrder">
	     <option value='${dep.sortOrder}'>${dep.sortOrder}</option>
	     </select>
	  </td>
	</tr>
  </table>
  <table align="center" >
  <tr>
  <td>
  <input type="submit" class="button1" value="编辑" onclick="toTrueUpdate(<s:property value="dep.tid"/>);"/>
      <input type="submit" value="添加子节点" class="button1" onclick="addChild(<s:property value="dep.tid"/>);"/>
       <input type="button"  value="查看所属人员" class="button1" onclick="getUsers(<s:property value="dep.tid"/>);"/>
      <s:if test='stat=="拆分"'>
        <input type="submit" value="拆分该部门"  class="button1" onclick="splitDep(<s:property value="dep.tid"/>);"/>
      </s:if>
      <s:else>
       <input type="submit" value="合并部门" class="button1" onclick="combinationDep(<s:property value="dep.tid"/>);"/>
      </s:else>
      </td>
      </tr>
      </table>
     
</form>
</body>
</html>