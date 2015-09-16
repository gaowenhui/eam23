<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/zccz/checkJS.inc" %>
<%
String zcIds = request.getParameter("zcIds");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>执行情况</title>
<script type="text/javascript">
$(document).ready(function(){
	if("change"=="${sheettype}"){
			$("select,input").attr("disabled","disabled");
	}else{
		var buttonJSonString2 = '[{"id":"add2","buttonHandler":"addFeiyong1","buttonIcon":"icon-add","buttonText":"增加"},\
								{"id":"edit2","buttonHandler":"editFeiyong1","buttonIcon":"icon-edit","buttonText":"修改"},\
								{"id":"del2","buttonHandler":"delFeiyong1","buttonIcon":"icon-remove","buttonText":"删除"}]';
		addButtons($("#gview_zhixingqingkuang > .ui-jqgrid-titlebar"),buttonJSonString2);
	}
	jQuery("#zhixingqingkuang").setGridWidth($("#table").width());
	$(window).bind('resize', function(){
		jQuery("#zhixingqingkuang").setGridWidth($("#table").width());
	});
});
function addFeiyong1(){
	var trackId = document.getElementById("trackId").value;
	var url = '<%=request.getContextPath()%>/zccz/disposeTrack_newAdjunct.do?trackId='+trackId+"&fsxxlx=zxqk&xmIds=${xmIds}&zcIds=${zcIds}&fysrmx.jieduan=chuzhihuikuan";
	url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
	var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
}

function editFeiyong1(){
	var gr = jQuery("#zhixingqingkuang").jqGrid('getGridParam','selarrrow');
	if(gr.length > 1){
		alert('只能修改一条记录');
	}else if( gr.length == 1 && gr[0]!=null){
		var url = '<%=request.getContextPath()%>/zccz/disposeTrack_modifyAdjunct.do?adjuncts='+gr+'&fsxxlx=zxqk';
		url = url  + "&id=" + new Date();//这个id使每次的url不同，是防止缓存加的时间参数，
		var _g_privateDialogFeatures = 'dialogHeight:400px;dialogWidth:500px, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no';
	window.showModalDialog(url,window,_g_privateDialogFeatures);
	}else alert("请选择要修改的记录");
}

function delFeiyong1(){
	var adjuncts = jQuery("#zhixingqingkuang").jqGrid('getGridParam','selarrrow');
	if (adjuncts.length == 0){
		alert("请选择要删除的记录!");
	}else{	
		if(confirm("确认删除？")){
			var url ="<%=request.getContextPath()%>/zccz/disposeTrack_deleteAdjunct.do";
			$.post(url,{adjuncts:"" + adjuncts + ""}, function(data){
				jQuery("#zhixingqingkuang").trigger("reloadGrid");
			});
		}
	}
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
<s:set name="biaodanid" value="track.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<td colspan="4">
		<div>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
				<tr>
					<td colspan="4">
						<div>
							<table id="zhixingqingkuang"></table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</td>
</table>
<script type="text/javascript">
	jQuery("#zhixingqingkuang").jqGrid({
		url:"<%=basePath %>zccz/disposeTrack_findAdjuncts.do",
		postData:{
			"trackId" : document.getElementById("trackId").value,
			"fsxxlx":"zxqk",
			"xmIds":'${xmIds}',
			"zcIds":'${zcIds}'
		},
		datatype: "json",
		colNames:['id','执行情况','录入日期','录入人'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'zxqk',index:'fyzl',editable:true},
			{name:'lrrq',index:'fyje',editable:true},
			{name:'lrr',index:'fyzl',editable:true}
		],
		autowidth:true,
		height:'auto',
		multiselect: true,
		caption: '执行情况',
		jsonReader : {
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	// 刷新
	function reloadJqGrid(){
		jQuery("#zhixingqingkuang").trigger("reloadGrid");
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