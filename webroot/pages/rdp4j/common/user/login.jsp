<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<style type="text/css">
			<!--
			body {
				margin-left: 0px;
				margin-top: 0px;
				margin-right: 0px;
				margin-bottom: 0px;
			}
			.bi {
				font-size: 12px;
				color: #003399;
			}
			-->
		</style>
		<base href="<%=basePath%>">
		<title>快速开发平台登录页面</title>
		<%@ include file="/inc/header-standard.inc"%>
		
		<script type="text/javascript">
			function formSubmit(){
				document.getElementById("formSib").click();
			}
		</script>
        <script language="javascript" for="document" event="onkeydown"> 
           if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='') 
           myForm.submit();
         </script>

		
	</head>

<body>
	<s:form action="auth/auth_login.do" method="post" id="Login" name="myForm">
		<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
			    <td height="600" valign="top" background="<%=basePath %>resource/images/login_r1_c1.jpg">
			    	<table width="1000" border="0" cellspacing="0" cellpadding="0">
				      	<tr>
				        	<td width="112" height="185">&nbsp;</td>
				        	<td width="888" valign="bottom"><img src="<%=basePath %>resource/images/login_r2_c3.jpg" width="449" height="94" /></td>
				      	</tr>
			    	</table>
			      	<table width="1000" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			          		<td width="113" height="67">&nbsp;</td>
			         		<td width="887"><img src="<%=basePath %>resource/images/login_r3_c3.jpg" width="779" height="254" /></td>
			        	</tr>
			      	</table>
			      	<table width="1000" border="0" cellspacing="0" cellpadding="0">
			        	<tr>
			          		<td width="238" height="59">&nbsp;</td>
			          		<td width="396" class="bi">
								用户名：<input name="loginId"  type="text" class="input" size="15" style="height:20px"/> 　　
          						密码：<input name="passwd" type="password" class="input" size="15" style="height:20px" />　
			          		</td>
			          		<td width="366">
			          			<img src="<%=basePath %>resource/images/login_r5_c5.jpg" style="cursor:pointer" width="49" height="22" onclick="formSubmit();" />
			          		</td>
			        	</tr>
			      	</table>
			    	<br />
			    </td>
			</tr>
		</table>
		<div style="display:none">
		<input type="submit" id="formSib">
		</div>
	</s:form>
</body>
</html>
