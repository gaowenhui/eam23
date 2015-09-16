<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>清算</title>
<script type="text/javascript">
$(document).ready(function(){
	var buttonJSonString2 = '[{"id":"add2","buttonHandler":"addFeiyong1","buttonIcon":"icon-add","buttonText":"增加"},\
							{"id":"edit2","buttonHandler":"editFeiyong1","buttonIcon":"icon-edit","buttonText":"修改"},\
							{"id":"del2","buttonHandler":"delFeiyong1","buttonIcon":"icon-remove","buttonText":"删除"}]';
	addButtons($("#gview_qinsuanxiaozu > .ui-jqgrid-titlebar"),buttonJSonString2);
	jQuery("#qinsuanxiaozu").setGridWidth($("#table").width());
	$(window).bind('resize', function(){
		jQuery("#qinsuanxiaozu").setGridWidth($("#table").width());
	});
});
function addFeiyong1(){
	var trackId = document.getElementById("trackId").value;
	var url = '<%=request.getContextPath()%>/zccz/disposeTrack_newAdjunct.do?trackId='+trackId+"&fsxxlx=qsxz";
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
}

function editFeiyong1(){
	var gr = jQuery("#qinsuanxiaozu").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 && gr[0]!=null){
		var url = '<%=request.getContextPath()%>/zccz/disposeTrack_modifyAdjunct.do?adjuncts='+gr;
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}

function delFeiyong1(){
	var adjuncts = jQuery("#qinsuanxiaozu").jqGrid('getGridParam','selarrrow');
	if (adjuncts.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var url ="<%=request.getContextPath()%>/zccz/disposeTrack_deleteAdjunct.do";
			$.post(url,{adjuncts:"" + adjuncts + ""}, function(data){
				jQuery("#qinsuanxiaozu").trigger("reloadGrid");
			});
		}
	}
}
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
	<tr>
		<td class="td_zxy01">审计机构名称：</td>
		<td class="td_zxy02"><s:textfield name="track.zxsjjgmc" id="zxsjjgmc" cssClass="input" maxlength="50"  size="30" /></td>
		<td class="td_zxy01">&nbsp;</td>
		<td class="td_zxy02">&nbsp;</td>
	</tr>
	<tr>
	<td class="td_zxy01">合同：</td>
		<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="qszxht" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">审计报告：</td>
		<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="qszxsjbg" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">债权清偿情况：</td>
		<td class="td_zxy02" colspan="3"><s:textarea name="track.zxzqqcqk" id="zxzqqcqk" cssClass="input"  rows="3" /></td>
	</tr>
	<tr>
		<td class="td_zxy01">清算分配方案：</td>
		<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="qszxfpfa" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
	</tr>
	<tr>
		<td colspan="4">
			<div>
				<table id="qinsuanxiaozu"></table>
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
	jQuery("#qinsuanxiaozu").jqGrid({
		url:"<%=basePath %>zccz/disposeTrack_findAdjuncts.do",
		postData:{
			"trackId" : document.getElementById("trackId").value,
			"fsxxlx":"qsxz"
		},
		datatype: "json",
		colNames:['id','姓名','联系方式','工作单位'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'qsxzryxm',index:'qsxzryxm',editable:true},
			{name:'qsxzrylxfs',index:'qsxzrylxfs',editable:true},
			{name:'qsxzrygzdw',index:'qsxzrygzdw',editable:true}						
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '清算小组列表',
		jsonReader : {
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	// 刷新
	function reloadJqGrid(){
		jQuery("#qinsuanxiaozu").trigger("reloadGrid");
	}
</script>