<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link href="<%=basePath%>resource/css/maincss.css" rel="stylesheet"
	type="text/css">

<body class='body1'>


	<script type="text/javascript">
	
	if('${errormsg}'=='密码修改成功！'){
		alert("${errormsg}");
		window.close();
	
	}
	</script>
	<form name="form1" action="<%=basePath%>eam2user/user_changepass.do"
		method='post'>
		<!-- <table align="center" cellspacing="1" cellpadding="1"
			class="tabletitle">
			<tr height="25">
				<td class="formtitle">
					&nbsp;
					<img src="/eam2/resource/images/dots1.gif">
					&nbsp;当前位置：修改密码
				</td>
			</tr>
			<tr>
				<td valign="top" align="center"> -->
					<table cellpadding=1 cellspacing=1 class="table1" align=center>
						<tr>
							<td>
								当前密码：
								<input type='password' name="oldpassword" value="${oldpassword}">
								<font color=red>${errormsg} </font>
								<br>
								确认密码：
								<input type='password' name="newpassword" value="${newpassword}">
								<br>
								重复密码：
								<input type='password' name="confirmpassword"
									value="${confirmpassword}">
								<br>
								<input type='button' value="修改密码" onclick="form1.submit()"
									class='button1'>

								<input type='button' value="重置" class='button1'
									onclick="window.location.href='<%=basePath%>eam2user/user_index.do'">
							</td>
						</tr>
					</table>
<!-- 				</td>
			</tr>
		</table> -->
	</form>
	<br>
</body>
</html>

