<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>解除劳动合同</title>
<script type="text/javascript">
$(document).ready(function(){
	var buttonJSonString2 = '[{"id":"add2","buttonHandler":"addFeiyong1","buttonIcon":"icon-ok","buttonText":"操作"}]';
	addButtons($("#gview_jiechulaodonghetong > .ui-jqgrid-titlebar"),buttonJSonString2);
	jQuery("#jiechulaodonghetong").setGridWidth($("#table").width());
	$(window).bind('resize', function(){
		jQuery("#jiechulaodonghetong").setGridWidth($("#table").width());
	});
});
function addFeiyong1(){
	var gr = jQuery("#jiechulaodonghetong").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 && gr[0]!=null){
		var trackId = document.getElementById("trackId").value;
		var url = '<%=request.getContextPath()%>/zccz/disposeTrack_newAdjunct.do?trackId='+trackId+"&fsxxlx=jcldht&azryId="+gr;
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}

function clickCheckBox(obj){
	var id = obj.id;
	var isChecked = obj.checked;
	if(isChecked){
		document.getElementById(id+'1').style.display = "block";
	}else{
		document.getElementById(id+'1').style.display = "none";
		var inputs = document.getElementById(id+'1').getElementsByTagName('input');
		for(var i=0;i<inputs.length;i++){
			if(inputs[i].type=="text"){
				document.getElementById(inputs[i].id).value="";
			}
		}
		var textareas = document.getElementById(id+'1').getElementsByTagName('textarea');
		for(var j=0;j<textareas.length;j++){
			document.getElementById(textareas[j].id).value="";
		}
	}
}			
$(function(){
//document.getElementById("gkpmsfzjtzjk").checked = true;
	var s = document.getElementsByTagName("input");
	for(var i=0;i<s.length;i++){
		var type = s[i].type;
		if(type =="checkbox"){
			var isChecked = s[i].checked;
			var id = s[i].id;
			if(isChecked){
				document.getElementById(id+'1').style.display = "block";
			}
		}
	}
});	
function save(){
	var url = "<%=request.getContextPath()%>/zccz/disposeTrack_saveTrack.do";
	myform.action = url;
	myform.submit();
}	
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form name="myform">
<table id="table" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
<s:hidden name="track.id" id="trackId"/>
<s:hidden name="track.czgzfs" id="czgzfs"/>
<s:hidden name="track.czgzhj"/>
<s:hidden name="track.xmid"/>
<s:hidden name="track.zcid"/>
<s:hidden name="czgzhj" value="%{#request.czgzhj}"/>
<s:hidden name="zcIds"/>
<s:hidden name="xmIds"/>
<s:set name="biaodanid" value="track.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
</table>
<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<div >
				<table id="jiechulaodonghetong"></table>
			</div>	
        </td>
    </tr>
</table>
<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td align="right"><input type="button" value="确定" onclick="save();"/></td>
	</tr>
</table>
</s:form>
</body>
</html>
<script type="text/javascript">
	jQuery("#jiechulaodonghetong").jqGrid({
		url:"<%=basePath %>zccz/disposeTrack_findAdjuncts1.do",
		postData:{
			"trackId" : document.getElementById("trackId").value,
			"xmIds":document.getElementById("xmIds").value,
			"zcIds":document.getElementById("zcIds").value,
			"fsxxlx":"jcldht"
		},
		datatype: "json",
		colNames:['id','姓名','移动电话','固定电话','安置方式','安置费用','实际安置费用','是否签署安置协议'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'xingming',index:'fyzl',editable:true},
			{name:'fyddh',index:'fyje',editable:true},
			{name:'fgddh',index:'fyzl',editable:true},
			{name:'fazfs',index:'fyje',editable:true},
			{name:'fazfy',index:'fyzl',editable:true},
			{name:'fsjazfy',index:'fyzl',editable:true},
			{name:'azrysfqsazxy',index:'fyzl',editable:true}					
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '解除劳动合同',
		jsonReader : {
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	// 刷新
	function reloadJqGrid(){
		jQuery("#jiechulaodonghetong").trigger("reloadGrid");
	}
</script>