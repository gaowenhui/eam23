<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title></title>
		<%@ include file="/inc/header-standard.inc"%>

		<script type="text/javascript">
			function folding() {
				try {
					 parent.window.outerLayout.toggle('north');
				} catch (e) {
					parent.window.document.getElementById("topFrmTR").style.height = 0;
				}
			}
			function goHome() {
				try {
					//parent.mainFrm.window.location="portal/user_index.jsp";
					parent.mainFrm.window.location = "collect/index.jsp";
		
					//cms/common/content_frame.jsp?left=/cms/web/tree_column_info.jsp&right=/welcome.html
				} catch (e) {
				}
			}
		</script>
		<style>
/*－－内容通用型字体－－*/
.black {
	font-family: "宋体";
	font-size: 12px;
	font-weight: normal;
	color: #000000;
	text-decoration: none;
}

.black:link {
	font-family: "宋体";
	font-size: 12px;
	font-weight: normal;
	color: #000000;
	text-decoration: none;
}

.black:hover {
	font-family: "宋体";
	font-size: 12px;
	font-weight: normal;
	color: #215DC6;
	text-decoration: none;
}

/*－－头部背景样式－－*/
body {
	margin: 0px;
}

#topbg {
	background-image: url(< s : url value = "/resource/images/cms_top_bg.jpg"/ >)
		;
	background-repeat: repeat-x;
	height: 45px;
}

#toptu {
	background-image: url(< s : url value = "/resource/images/cms_top_tu.jpg"/ >)
		;
	background-repeat: no-repeat;
	height: 26px;
	background-position: right bottom;
	width: 34px;
}

#toptubg {
	background-image: url(< s : url value = "/resource/images/cms_top_tubg.jpg"/ >)
		;
	background-repeat: repeat-x;
	height: 26px;
	background-position: bottom;
}
</style>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" height="74" bgcolor="#FFFFFF">
			<tr>
				<td width="10" background="<%=basePath%>resource/images/top_r1_c1.jpg">
				</td>
				<td width="259" background="<%=basePath%>resource/images/top_r1_c2.jpg">
					<img src="<%=basePath%>resource/images/top_r1_c3.jpg" />
				</td>
				<td background="<%=basePath%>resource/images/top_r1_c1.jpg">
					<img src="<%=basePath%>resource/images/top_r1_c4.jpg" />
				</td>
				<td width="298" valign="top" background="<%=basePath%>resource/images/top_r1_c1.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="22" valign="top"
								background="<%=basePath%>resource/images/top_r1_c6.jpg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="22">
											<div align="right">
												<img src="<%=basePath%>resource/images/tubi_r2_c1.gif"
													width="14" height="13" />
											</div>
										</td>
										<td width="12%" class="bi">
											<div align="center">
												<a href="javascript:folding()" class="black" >隐藏</a>
											</div>
										</td>
										<td width="9%">
											<div align="right">
												<img src="<%=basePath%>resource/images/tubi_r1_c3.gif"
													width="14" height="16" />
											</div>
										</td>
										<td width="12%">
											<div align="center" class="bi">
												<a href="workflow/userTask_findTodoTasks.do" target='mainFrm' class="black">首页</a>
											</div>
										</td>
										<td width="9%">
											<div align="right">
												<img src="<%=basePath%>resource/images/tubi_r1_c5.gif"
													width="13" height="13" />
											</div>
										</td>
										<td width="24%" class="bi" style="cursor: hand;">
										<a href="workflow/userTask_findTodoTasks.do" target='mainFrm' class="black">修改密码</a>
											
										</td>
										<td width="9%">
											<div align="right">
												<img src="<%=basePath%>resource/images/tubi_r1_c7.jpg"
													width="15" height="14" />
											</div>
										</td>
										<td width="12%" class="bi">
											<div align="center">
												<a href="<s:url value="auth/auth_logout.do" />"
													target="_top" class="black">注销</a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>