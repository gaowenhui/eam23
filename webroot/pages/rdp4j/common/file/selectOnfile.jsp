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
%>


<SCRIPT LANGUAGE="JavaScript">
function getFileName(){
var filename=document.all.fileUpload.value;
var i=filename.lastIndexOf("\\")+1;
var j=filename.lastIndexOf(".");
filename=filename.substr(i,j-i);//
document.all.title.value =filename;
}
</SCRIPT>

<SCRIPT language=JavaScript type=text/JavaScript>
function confirm(){
	var gr = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
		if(gr == ''){
			alert("请选择要保存的记录!"); 		
		}else{
			var blyjurl ="<%=basePath%>file/according_addAccording.do?bdid=<%=bdid%>";
			$.post(blyjurl,{lcids:"" + gr + ""}, function(data){
				if(data == "success"){
					window.opener.reloadJqGrid();
					window.returnValue = "success";
					window.close();
				}
			});
		}
}
function query(){
		
		var gr = document.getElementById("title").value;
		var url1 = "<%=basePath%>blyj/according_queryWorkflow.do";
			jQuery("#file_list").setGridParam({url:url1 + "?title=" + gr}).trigger("reloadGrid");
	}


function upload(){
				if(myform.fileUpload.value==''){
					alert("请选择文件！");
				}else if(myform.title.value==''){
					alert("文件标题不能为空！");
				}else if(myform.bdid.value==''){
					//alert("表单编号未正确传递，请关闭窗口！");
					alert("表单编号未生成，请先保存表单！");
				}else{
					myform.submit();
				}
			}
function dele(){
		var gr = jQuery("#reason_list").jqGrid('getGridParam','selarrrow');
		alert(gr);
		if(gr.length > 1){
			alert('只能修改一条记录');
		}else if( gr.length == 1 ){
			alert(gr);
			myform.action='file/file_deleAttach.do?id='+gr;
			myform.submit();
		}else {
			alert("请选择要修改的记录");
		}
}

function alert(){
		var gr = jQuery("#reason_list").jqGrid('reloadGrid','selarrrow');
			alert(gr);
}
function download(){
	myform.action='<%=request.getContextPath()%>/file/file_download.do?id='+gr;
	myform.submit();
}
function submit(){
	myform.fileext=myform.fileUpload.value;
	myform.filenamemyform.fileUpload.value;
}
function choiceUser(taskId,outCome){
	var result = window.showModalDialog("index2.jsp","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	if(typeof(result)!='undefined'){
		alert(result);
		document.form1.taskId.value = taskId;
		document.form1.outCome.value = outCome;
		document.form1.userId.value = result;
		document.form1.submit();
	}
}
function closeWindow(){
	window.opener();
}
</SCRIPT>
</head>
	<body class='body1'>
		<br>
		<div align=center valign="middle">
			文件上传选择
		</div>
<s:form id="myform" name='myform' action="file_uploadAttach.do" method="post" enctype="multipart/form-data">
		<table class="newtable" align="center" width="95%" cellspacing="0 cellpadding="0">
		
				<tr>
					<td height="24" class="td_form01" style='width: 30%'>
						选择文件：
					</td>
					<td height="24" class="td_zxy02" style='width: 70%'>
						<s:file name="fileUpload" label="文件上传"  onchange="getFileName()"  style='width:80%' /> 
					</td>

				</tr>
				
				<tr>
					<td height="24" class="td_form01" style='width: 30%'>
						文件标题：
					</td>
					<td height="24" class="td_zxy02" style='width: 70%'>
						<s:textfield name="title" id="title" style='width:80%'  onkeydown="if(event.keyCode==13)return false;"/> 
					</td>

				</tr>
			<tr>
					<td height="24" colspan=2 class="td_zxy01" align='center'>
						<input type='hidden' name='fjlx' value='<%=request.getParameter("type") %>'>
						<input type='hidden' name='bdid' value='<%=request.getParameter("bdid")%>'>
						<input type="hidden" value="<%=request.getParameter("type") %>" name="type">
						<input name="button" type="button" value="　上传　" onclick='upload()' class='buttonface' />
						<input type="button" value="　关闭　" onclick=window.close() 	class='buttonface' />
				</td>
			</tr>
			
	
	</table>
<br>
</s:form>		