<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String zcIds = request.getParameter("zcIds");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>过户</title>
<script type="text/javascript">

$(document).ready(function(){
		if("change"=="${sheettype}"){
			$("select,input").attr("disabled","disabled");
		}else{
			var buttonJSonString1 = '[{"id":"add1","buttonHandler":"addFeiyong1","buttonIcon":"icon-add","buttonText":"增加"},\
									{"id":"edit1","buttonHandler":"editFeiyong1","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"id":"del1","buttonHandler":"delFeiyong1","buttonIcon":"icon-remove","buttonText":"删除"}]';
			addButtons($("#gview_shuishoujiaona > .ui-jqgrid-titlebar"),buttonJSonString1);
			var buttonJSonString2 = '[{"id":"add2","buttonHandler":"addFeiyong2","buttonIcon":"icon-add","buttonText":"增加"},\
									{"id":"edit2","buttonHandler":"editFeiyong2","buttonIcon":"icon-edit","buttonText":"修改"},\
									{"id":"del2","buttonHandler":"delFeiyong2","buttonIcon":"icon-remove","buttonText":"删除"}]';
			addButtons($("#gview_feiyongjiaona > .ui-jqgrid-titlebar"),buttonJSonString2);
			jQuery("#shuishoujiaona").setGridWidth($("#table").width());
			jQuery("#feiyongjiaona").setGridWidth($("#table").width());
			$(window).bind('resize', function(){
				jQuery("#shuishoujiaona").setGridWidth($("#table").width());
				jQuery("#feiyongjiaona").setGridWidth($("#table").width());
			});
		}
});
function addFeiyong1(){
	var trackId = document.getElementById("trackId").value;
	var url = '<%=request.getContextPath()%>/zccz/disposeTrack_newAdjunct.do?trackId='+trackId+"&fsxxlx=skjn&xmIds=${xmIds}&zcIds=${zcIds}&fysrmx.jieduan=guohushuikuan";
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
}

function editFeiyong1(){
	var gr = jQuery("#shuishoujiaona").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 && gr[0]!=null){
		var url = '<%=request.getContextPath()%>/zccz/disposeTrack_modifyAdjunct.do?adjuncts='+gr+'&fsxxlx=skjn';
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}

function delFeiyong1(){
	var adjuncts = jQuery("#shuishoujiaona").jqGrid('getGridParam','selarrrow');
	if (adjuncts.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var url ="<%=request.getContextPath()%>/zccz/disposeTrack_deleteAdjunct.do";
			$.post(url,{adjuncts:"" + adjuncts + "",fsxxlx:"skjn"}, function(data){
				jQuery("#shuishoujiaona").trigger("reloadGrid");
			});
		}
	}
}
function addFeiyong2(){
	var trackId = document.getElementById("trackId").value;
	var url = '<%=request.getContextPath()%>/zccz/disposeTrack_newAdjunct.do?trackId='+trackId+"&fsxxlx=fyjn&xmIds=${xmIds}&zcIds=${zcIds}&fysrmx.jieduan=guohufeiyong";
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
}

function editFeiyong2(){
	var gr = jQuery("#feiyongjiaona").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 && gr[0]!=null){
		var url = '<%=request.getContextPath()%>/zccz/disposeTrack_modifyAdjunct.do?adjuncts='+gr+'&fsxxlx=fyjn';
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}

function delFeiyong2(){
	var adjuncts = jQuery("#feiyongjiaona").jqGrid('getGridParam','selarrrow');
	if (adjuncts.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var url ="<%=request.getContextPath()%>/zccz/disposeTrack_deleteAdjunct.do";
			$.post(url,{adjuncts:"" + adjuncts + "",fsxxlx:"fyjn"}, function(data){
				jQuery("#feiyongjiaona").trigger("reloadGrid");
			});
		}
	}
}
function clickCheckBox(obj){
	var id = obj.id;
	var isChecked = obj.checked;
	if(isChecked){
		document.getElementById(id+'1').style.display = "block";
		document.getElementById(id+'2').innerText="是";
	}else{
		document.getElementById(id+'1').style.display = "none";
		document.getElementById(id+'2').innerText="否";
		var inputs = document.getElementById(id+'1').getElementsByTagName('input');
		for(var i=0;i<inputs.length;i++){
			document.getElementById(inputs[i].id).value="";
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
				document.getElementById(id+'2').innerText="是";
			}else{
				if(id=='sfwcgh'){
					document.getElementById(id+'2').innerText="否";				
				}
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
<%if(zcIds!=null&&zcIds.length()<=32){ %>
<table id="table" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
<s:hidden name="track.id" id="trackId"/>
<s:hidden name="track.czgzfs" id="czgzfs"/>
<s:hidden name="track.czgzhj"/>
<s:hidden name="track.xmid"/>
<s:hidden name="track.zcid"/>
<s:hidden name="czgzhj" value="%{#request.czgzhj}"/>
<s:hidden name="zcIds"/>
<s:hidden name="xmIds"/>
	<tr>
		<td class="td_zxy01">是否完成过户：</td>
		<td class="td_zxy02" nowrap="nowrap"><s:checkbox name="track.sfwcgh" id="sfwcgh"  onclick="clickCheckBox(this)"/>
		<span id="sfwcgh2"></span></td>
		
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
</table>
<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr id="sfwcgh1" style="display:none">
		<td align="right">
			<div >
				<table id="shuishoujiaona"></table>
			</div>
			<div >
				<table id="feiyongjiaona"></table>
			</div>	
        </td>
    </tr>
</table>
<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td align="right"><input type="button" value="确定" onclick="save(3);"/></td>
	</tr>
</table>

<script type="text/javascript">
	jQuery("#shuishoujiaona").jqGrid({
		url:"<%=basePath %>zccz/disposeTrack_findAdjuncts.do",
		postData:{
			"trackId" : document.getElementById("trackId").value,
			"fsxxlx":"skjn",
			"jieduan":"guohushuikuan",
			"xmIds":'${xmIds}',
			"zcIds":'${zcIds}'
		},
		datatype: "json",
		colNames:['id','税类名称','金额（元）'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'ghslmc',index:'slmc',editable:true},
			{name:'ghslje',index:'fyje',editable:true}							
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '税款缴纳',
		jsonReader : {
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	jQuery("#feiyongjiaona").jqGrid({
		url:"<%=basePath %>zccz/disposeTrack_findAdjuncts.do",
		postData:{
			"trackId" : document.getElementById("trackId").value,
			"fsxxlx":"fyjn",
			"jieduan":"guohufeiyong",
			"xmIds":'${xmIds}',
			"zcIds":'${zcIds}'
		},
		datatype: "json",
		colNames:['id','费用种类','金额（元）'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'ghfymc',index:'fyzl',editable:true},
			{name:'ghfyje',index:'fyje',editable:true}							
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '费用缴纳',
		jsonReader : {
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	// 刷新
	function reloadJqGrid(){
		jQuery("#feiyongjiaona").trigger("reloadGrid");
		jQuery("#shuishoujiaona").trigger("reloadGrid");
	}
</script>
<%}else{ %>
	<table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
		<tr>
			<td >选中多项资产时，不能录入信息，请选择一项资产，再录入信息！</td>
		</tr>
	</table>
<%} %>
</s:form>
</body>
</html>