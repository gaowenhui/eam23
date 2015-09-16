<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/My97DatePicker/WdatePicker.js"></script>
<title>用户新增</title>
<%@ include file="/inc/header-standard.inc"%>
  <script type="text/javascript">
    function showDep(){
	  window.open("<%=request.getContextPath()%>/dept/dept_toTree.do",'','top=60,left=150,width=700,height=450,fullscreen=no,statusbar=no,titlebar=no,resizable=no,scrollbars=yes');
      }
      
      function doSubmit(){
      if(doValidate(myForm))
      {
      
         myForm.action="<%=request.getContextPath() %>/users/users_add.do";
         myForm.submit();
      }	 
}
  </script>
</head>
<body class='body1'>
  <s:form  name="myForm"  action="" method="post">
  <input type="hidden" id="depIds" name="depIds" />
<table class='tabletitle' cellspacing=1 cellpadding=1>
 <tr height=25>
				<td  class=formtitle colspan="2">
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
			   	&nbsp;
					当前位置：用户新增
				</td>
	</tr>
    <tr>
      <td  align="center"  colspan="2">新增用户信息</td>
    </tr>
     <tr>
	  <td>登录账号</td><td>
	  <input type="text" name="us.loginId"  class='text1' maxlength="50" vmode='not null'
										vdisp='登录账号' vtype='string' />							
										</td>
    <tr>
	  <td>用户名称</td><td>
	  <input type="text" name="us.username"  class='text1' maxlength="50" vmode='not null'
										vdisp='用户名称' vtype='string'/></td>
	</tr>
	<tr>
	  <td>登录密码</td><td>
	  <input type="password" name="us.password"  class='text1' maxlength="50" vmode='not null'
										vdisp='登录密码' vtype='string'/></td>
	</tr>
	
	<tr>
	  <td>用户性别</td><td>
	  <select name="us.genderCd" >
	    <option value="1">男</option>
	    <option value="2">女</option>
	  </select></td>
	</tr>
	<tr>
	  <td>用户状态</td><td>
      <r:select name="us.statusCd" list="#{}" id="us.statusCd" parRefKey="041"/>
	  </td>
	</tr>
	<tr>
	  <td>出生日期</td><td>
	  <input type="text" name="us.birthDate"  readonly="readonly" class="Wdate"
				onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></td>
	</tr>
	
	<tr>
	  <td>证件号码</td><td>
	  <input type="text" name="us.idNumber"  class='text1' maxlength="50" vmode=''
										vdisp='证件号码' vtype=''/></td>
	</tr>
	<tr>
	  <td>电子邮件</td><td>
	  <input type="text" name="us.email"  class='text1' maxlength="50" vmode=''
										vdisp='电子邮件' vtype='email'/></td>
	</tr>
	<tr>
	  <td>移动电话</td><td>
	  <input type="text" name="us.cellphone"  class='text1' maxlength="50" vmode=''
										vdisp='移动电话' vtype='mobiletel'/></td>
	</tr>
	<tr>
	  <td>家庭电话</td><td>
	  <input type="text" name="us.homePhone"  class='text1' maxlength="50" vmode=''
										vdisp='家庭电话' vtype='phone'/></td>
	</tr>
	
	<tr>
	  <td>办公电话</td><td>
	  <input type="text" name="us.businessPhone"  class='text1' maxlength="50" vmode=''
										vdisp='办公电话' vtype='phone'/></td>
	</tr>
	<tr>
	  <td>家庭住址</td><td>
	  <input type="text" name="us.address"  class='text1' maxlength="50" vmode=''
										vdisp='家庭住址' vtype='string'/></td>
	</tr>
	<tr>
	  <td>邮编</td><td>
	  <input type="text" name="us.postcode"  class='text1' maxlength="50" vmode=''
										vdisp='邮编' vtype='postcode'/></td>
	</tr> 
	<tr>
	  <td>描述信息</td><td>
	  <textarea rows="10" cols="30" name="us.description"  vmode=''
										vdisp='描述信息' vtype='string'></textarea>
	</tr> 
    <tr>
	  <td>分配部门</td><td><input type="text" name="deptname" id="deptname" size="30"/> 
	  <input type="button" class="button1" value="请选择.." onclick="showDep();"/>
	  </td>
	</tr>
	<tr>
      <td align="center" colspan="2"><input type="button" class="button1" value="保存" onclick="doSubmit();" />
      <input type="button" value="返回" class="button1" onclick="history.back();"/></td>
    </tr>
  </table>
</s:form>
</body>
</html>