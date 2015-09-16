<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String isAddXm = "false";
	String hyId = (String)request.getAttribute("hyId");
	String itemType = (String)request.getAttribute("itemType");
	if(!(hyId== null||"null".equals(hyId)||"".equals(hyId))){
		isAddXm = "true";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>安排审批待办</title>
	</head>
	<body>
		<table id="condition" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">申报日期：</td>
				<td class="td_zxy02">
					<s:textfield id="sbrq" name="czxmxx.sbrq"  size="50"/>
				</td>
				<td class="td_zxy01">处置项目名称：</td>
				<td class="td_zxy02"><s:textfield name="czxmxx.czxmmc" id="czxmmc" size="50"/></td>
				
			</tr>
			<tr>
				<td class="td_zxy01">受理序号：</td>
				<td class="td_zxy02"><s:textfield name="czxmxx.slxh" id="slxh" size="50"/></td>
				<td class="td_zxy01">汇报人：</td>
				<td class="td_zxy02"><s:textfield name="czxmxx.hbrxm" id="hbrxm" size="50"/></td>
			</tr>
			<tr>
				<td class="td_form01" colspan="4">
					<input type="button" value="查询" class="btn3_mouseover" onclick="chaxun();"/>
					<input type="button" value="重置" class="btn3_mouseover" onclick="reset();"/>
				</td>
			</tr>
			
		</table>
		<table id="purchase_list"> </table>
		<script type="text/javascript">
		
			function chaxun(){
				var sbrq = document.getElementById("sbrq").value;
				var czxmmc = document.getElementById("czxmmc").value;
				var slxh = document.getElementById("slxh").value;
				var hbrxm = document.getElementById("hbrxm").value;
				var url ="<%=basePath%>zccz/dealToDo_findZCXMs.do";
				jQuery("#purchase_list").setGridParam({
					postData:{
						"czxmxx.sbrq":''+sbrq,
						"czxmxx.czxmmc":''+czxmmc,
						"czxmxx.slxh":''+slxh,
						"czxmxx.hbrxm":''+hbrxm,
						"itemType":"<%=itemType%>"
					}
				}).trigger("reloadGrid");
			}
			function reset(){
				document.getElementById("sbrq").value = "";
				document.getElementById("czxmmc").value = "";
				document.getElementById("slxh").value = "";
				document.getElementById("hbrxm").value = "";
			}
			$("#sbrq").datebox({
				formatter:function(date){
					return formatDate(date);
				}
			});
		if(window.parent.clearPanelTool != undefined)
			window.parent.clearPanelTool();

		jQuery("#purchase_list").jqGrid({				
			url:"<%=basePath %>zccz/dealToDo_findZCXMs.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				"itemType" : "<%=itemType%>"
			},
		   	colNames:['id','处理单ID','申报日期','处置项目名称','受理序号','审批委员', '汇报人'],
			colModel:[
				{name:'id',index:'id',align:"center",hidden:true},
				{name:'cldId',index:'cldId',align:"center",hidden:true},
				{name:'sbrq',index:'sbrq',sorttype:"date"},
				{name:'czxmmc',index:'czxmmc',width:'400px'},
				{name:'slxh',index:'slxh'},
				{name:'spwy',index:'spwy'},
				{name:'hbrxm',index:'hbrxm'}
<!--			,{name:'dangqianhuanjie',index:'tache'} -->
				],
			rowNum:0,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption: '安排审批待办',
			ondblClickRow:function(gr){
				var id  = jQuery("#purchase_list").getCell(gr,'cldId');
				lookItemInfo(id);
			},
			jsonReader : {
				root:"rows",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}	
		});
		$(window).bind('resize', function(){
			jQuery("#purchase_list").setGridWidth($("#items").width());
		});
		$(document).ready(function(){	
			var isAddXm = "<%=isAddXm%>";
			if(isAddXm == "true"){
				var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-add","buttonText":"确定"}]';
			}else{
				var buttonJSonString = '[{"buttonHandler":"addhuiyi","buttonIcon":"icon-add","buttonText":"组织会议"}]';
			}
			addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonJSonString);
		});
		function addhuiyi(){
			var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
			if( gr.length == 1&&gr[0].length ==0 ){
				alert("没有可以选择的处置项目！");
			}else if(gr.length>0){
			<%if(StringUtils.equals("investment",itemType)){%>
				var addhuiyiurl = "<%=request.getContextPath()%>/zccz/dealToDo_addMeeting.do?pdk=cjtz_assetdisposalsubproc&itemType=<%=itemType%>&ids="+gr;
			<%}else{%>
				var addhuiyiurl = "<%=request.getContextPath()%>/zccz/dealToDo_addMeeting.do?pdk=zccz_assetdisposalsubproc&itemType=<%=itemType%>&ids="+gr;
			<%}%>
				//window.open(addhuiyiurl);
				window.location=addhuiyiurl;
			}else if(gr.length==0){
				alert("请选择处置项目!");
			}
		}
		function queding(){
			var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
			if( gr.length == 1&&gr[0].length ==0 ){
				alert("没有可以选择的处置项目！");
			}else if(gr.length>0){
				window.opener.callBackXm(gr);
				window.close();
			}else if(gr.length==0){
				alert("请选择处置项目!");
			}
		}
		function reloadJqGrid(){// 刷新
			jQuery("#purchase_list").trigger("reloadGrid");
		}
				
		function lookItemInfo(headId){
			var itemUrl = "<%=request.getContextPath()%>/zccz/xmshAction_modifyShInfo.do?headId=" + headId;
			window.open(itemUrl);
		}
		
		</script>
	</body>
</html>

