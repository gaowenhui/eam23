<%@page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
		<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
		jQuery("#purchaselist").setGridWidth($("#table").width());
	    $(window).bind('resize', function(){
			jQuery("#purchaselist").setGridWidth($("#table").width());
		});
		var buttonTraceJSonString1 = '[{"buttonHandler":"disposationTraceMain","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
		addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonTraceJSonString1);
       });
       
       function disposationTraceMain(){
     		var zcId = "${zcId}"; 
			var xmId = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
			var zcCzfs = "zxqk";
			if( xmId.length==1&&xmId[0]!=""){
				iframe1.style.display = "block";
				var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds="+zcId+"&xmIds="+xmId+"&zcCzfs="+zcCzfs;
				iframeSrc.window.location = url;
			}else alert("请选择一条要跟踪的记录");
		}	
</SCRIPT>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form id="myform" name="myform" action="">
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">
							<table id="purchaselist"> </table>
							<div id="pgtoolbar1"> </div>
						</td>
					</tr>
				</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"  >
 	<tr id="iframe1">
 		<td>
 			<iframe id="iframeSrc" frameBorder=0 height="400" width="100%" scrolling="no" src=""></iframe>
 		</td>
 	</tr>
 </table>
</s:form>
</body>
</html>
<script type="text/javascript">
jQuery("#purchaselist").jqGrid({				
	url:'<%=basePath%>cjtz/dealTrace2_zxqk4Date.do?zcId=${zcId}&zclb=${zclb}',
	datatype: "json",
	mtype:"POST",
   	colNames: ['xmId','编号', '处置项目名称','业务类型','拟稿部门', '拟稿人', 
   	'项目状态','会议纪要签发日期','最新更新日期'],
	colModel: [
		{name: 'xmId',index: 'xmId',align: "center"}, 
		{name: 'bh',index: 'bh',align: "center"}, 
		{name: 'czxmmc',index: 'czxmmc',align: "center"}, 
		{name: 'ywlx',index: 'ywlx',align: "center"}, 
		{name: 'ngbmmc',index: 'ngbm',align: "center"}, 
		{name: 'ngrmc',index: 'ngrmc',align: "center"}, 
		{name: 'xmzt',index: 'xmzt',align: "center"}, 
		{name: 'hyjyqfrq',index: 'hyjyqfrq',align: "center"}, 
		{name: 'zxgxrq',index: 'zxgxrq',align: "center"}
		],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	rowNum:0,
	height:'auto',
	viewrecords:true,
	caption: '结案项目列表（单位：元）',
	jsonReader : {
		root:"rows",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#purchaselist").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#purchaselist").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
</script>
