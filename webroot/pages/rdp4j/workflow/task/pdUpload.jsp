<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>流程定义部署</title>
    <%@ include file="/inc/header-standard.inc"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function deploy(){
			if(confirm('确定要部署流程吗？')){
				f1.submit();
			}
		}
	</script>
  </head>
  
  <body class='body1'>
  <form name="f1" action="processDefinition/processDefinition_upload.do" method="post" enctype="multipart/form-data">
	<table align="center" class="tabletitle" cellSpacing="1" cellPadding="1">
			<tbody>
				<tr height="25">
					<th>当前位置：流程定义部署</th>
				</tr>
				<tr>
					<td valign="top">
						<table class="table1" cellSpacing="1" cellPadding="1" >
							<tr>
								<td nowrap>部署名称</td>
								<td nowrap colspan="5">
									<input class="text1" type="text" name="deployName" value=""/>
									<input class="button1" type="button" value="部署流程" onclick="deploy()"/>
								</td>
							</tr>
							<tr>
								<td nowrap>文件</td>
								<td nowrap><s:file label="文件" name="uploads" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
	</table>
  </form>
  </body>
</html>
