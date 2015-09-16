<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>文件选择</title>
		<%
			String bdid = (String) request.getAttribute("bdid");
			String fjlx = (String) request.getParameter("type");
		%>
		<SCRIPT language=JavaScript type=text/JavaScript>
			function upload(){
				if(myform.fileUpload.value==''){
					alert("请选择文件！");
				}else if(myform.title.value==''){
					alert("文件标题不能为空！");
				}else if(myform.bdid.value==''){
					alert("表单编号未生成，请先保存表单！");
				}else{
					myform.submit();
				}
			}
</SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
function getFileName(){
var filename=document.all.fileUpload.value;
var i=filename.lastIndexOf("\\")+1;
var j=filename.lastIndexOf(".");
filename=filename.substr(i,j-i);//
document.all.title.value =filename;
}
</SCRIPT>
	</head>
	<body class='body1'>
		<br>
		<div align=center valign="middle">
			文件上传选择
		</div>
		<s:form id="myform" name='myform' action="file_uploadAttach.do"
			method="post" enctype="multipart/form-data">
			<table class="newtable" align="center" width="95%"
				cellspacing="0
				cellpadding="0">
				<tr>
					<td height="24" class="td_form01" style='width: 30%'>
						选择文件：
					</td>
					<td height="24" class="td_zxy02" style='width: 70%'>
						<s:file name="fileUpload" label="文件上传" onchange="getFileName()"
							style='width:80%' class='buttonface' />
					</td>

				</tr>
				<tr>
					<td height="24" class="td_form01">
						文件标题：
					</td>
					<td height="24" class="td_zxy02">
						<s:textfield name="title" id="title" style='width:80%'   onkeydown="if(event.keyCode==13)return false;"/> 
						<input type='hidden' name='bdid'
							value='<%=request.getParameter("bdid")%>'>
						<input type='hidden' name='type' value='1'>
						<input type='hidden' name='fjlx' value='<%=fjlx%>'>
					</td>
				</tr>
				<tr>
					<td height="24" colspan=2 class="td_zxy01" align='center'>
						<input type="button" value="　上传　" onclick="upload();"
							class='buttonface' />
						<input type="button" value="　关闭　" onclick=window.close()
							class='buttonface' />
					</td>
				</tr>
			</table>
			<br>
		</s:form>
	</body>
</html>