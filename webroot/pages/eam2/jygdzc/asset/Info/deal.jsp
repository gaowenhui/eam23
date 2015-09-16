<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程信息</title>
<script type="text/javascript">
	$(function(){
		if("change"=="${sheettype2}"){
			$("select,input").attr("disabled","disabled");
		}
		jQuery("#deal_list").setGridWidth($("#table").width());
		$(window).bind('resize', function(){
			jQuery("#deal_list").setGridWidth($("#table").width());
		});
		//页面刚加载时，设置表格的宽度
		//添加按钮  "#gview_list > .ui-jqgrid-titlebar
		var buttonxiangmuJSonString = '[{"buttonHandler":"disposationTrace","buttonIcon":"icon-edit","buttonText":"会后跟踪"}\
		]';
		addButtons(jQuery("#gview_deal_list > .ui-jqgrid-titlebar"),buttonxiangmuJSonString);
	});	
		function reloadGrida(){
			$("#deal_list").trigger("reloadGrid");
		}
		function disposationTrace(){
			var xmId = jQuery("#deal_list").jqGrid('getGridParam','selarrrow');
			var zcCzfs = "";
			if( xmId.length >0){
				for(var i = 0;i<xmId.length;i++){
					for(var j = 0;j<xmId.length;j++){
						var czfs1 = jQuery("#deal_list").getCell(xmId[i],'czfs');
						var czfs2 = jQuery("#deal_list").getCell(xmId[j],'czfs');
						if(czfs1!=czfs2){
							alert("不同的处置方式，不能一起跟踪!");
							return false;
						}
					}
				}
				iframe1.style.display = "block";
				var fenlei = jQuery("#deal_list").getCell(xmId[0],'fenlei');
				var czfs = jQuery("#deal_list").getCell(xmId[0],'czfs');
				if(czfs =='公开拍卖'){//处置方式为1的是公开拍卖
					zcCzfs = 'zc1';
				}else if(czfs =='交易所挂牌'){//处置方式为2的是交易所挂牌
					zcCzfs = 'zc2';
				}else if(czfs =='协议转让'){//处置方式为3协议转让
					zcCzfs = 'zc3';
				}else if(czfs =='拆迁'){//处置方式为4拆迁
					zcCzfs = 'zc4';
				}else {
					alert("该项目没有会后跟踪！");
					return false;
				} 
				var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?sheettype=change&zcIds=${zcId}&xmIds="+xmId+"&zcCzfs="+zcCzfs;
				iframeSrc.window.location = url;
			}else alert("请选择要跟踪的记录");
			
		}
</script>
</head>
<body>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>

<table  id="table" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table id="deal_list" align="center" ></table>
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
<script type="text/javascript">
	jQuery("#deal_list").jqGrid({
		url:'<%=request.getContextPath()%>/jygdzc/AssetManageBody_findCzXxList.do?sheettype2=change',
		postData:{'zcId'   : '${zcId}'},
		datatype: "json",
		mtype:"POST",
	   	colNames: ['id','fenlei','cldId', '处置项目名称', '项目状态', '处置方式', '会议次数', '审批委员', '主持人'],
		colModel: [
		   {name: 'id',index: 'id',align: "center",hidden:true },
		   {name: 'fenlei',index: 'id',align: "center",hidden:true }, 
		   {name: 'cldId',index: 'id',align: "center",hidden:true},
		 {name: 'czxmmc',align: "center",index: 'diqu'},
		 {name: 'zhuangtai',index: 'czfs',align: "center"},
		 {name: 'czfs',index: 'czfs',align: "center"},
		 {name: 'hycs',index: 'czfs',align: "center"},
		 {name: 'spwy',index: 'zxzt',align: "center"},
		 {name: 'zcr',index: 'cz',align: "center"}],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '处置项目信息',
		jsonReader : {
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
   </script>