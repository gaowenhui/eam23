<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = (String)request.getAttribute("headId");
	String fenlei = request.getParameter("fenlei");
	String xmId = request.getParameter("xmId");
	CzStcztz head = (CzStcztz)request.getAttribute("head");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>实体整体处置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				jQuery("#xglc_reason_list").setGridWidth($("#stInfo").width());
				jQuery("#claims_list").setGridWidth($("#stInfo").width());
				$(window).bind('resize', function(){
					jQuery("#xglc_reason_list").setGridWidth($("#stInfo").width());
					jQuery("#claims_list").setGridWidth($("#stInfo").width());
				});
				
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_xglc_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
				
				var buttonsStringmm = '[\
					{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"},\
					{"buttonHandler":"stMoneyXx","buttonIcon":"icon-search","buttonText":"实体资产处置信息"},\
					{"buttonHandler":"disposationTrace","buttonIcon":"icon-add","buttonText":"会后跟踪"}\
				]';
				addButtons(jQuery("#stInfoButton"),buttonsStringmm);
			});
			function disposationTrace(){
			var xmId = '<%=xmId%>';
			var stid = '<%=head.getStid()%>';
			var zcCzfs = "";
			if( stid.length >0){
				iframe1.style.display = "block";
				var czfs = '<%=head.getCCzfs()%>';
				if(czfs =='1'){//处置方式为1的是破产注销
					zcCzfs = 'st1';
				}else if(czfs =='2'){//处置方式为2的是清算注销
					zcCzfs = 'st2';
				}else if(czfs =='3'||czfs =='4'){//处置方式为3，4的是股权转让，债权转让
					zcCzfs = 'st3';
				}else {
					alert("该项目没有会后跟踪！");
					return false;
				} 
				var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds="+stid+"&xmIds="+xmId+"&zcCzfs="+zcCzfs;
				iframeSrc.window.location = url;
			}else alert("请选择要跟踪的记录");
			
		}
			function stMoneyXx(){
				$.post("<%=basePath %>zccz/entityDealHead_selectEDM.do",{
					"stid" :  "" + $("#stid").val()
				},function(returnStr){
					var returnArr = returnStr.split(",");
					alert("处置资产预计回收金额:" + returnArr[0] + "元\n"
					 + "实际回收金额:" + returnArr[1] + "元");
				});
			}
			
			function stView(){
				var stlx = "<%=head.getStlx()%>";
				var stid = "<%=head.getStid()%>";
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体信息</div>
			<div class="panel-tool" id="stInfoButton"></div>
		</div>
		<table class="newtable" id="stInfo" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" readonly="true" input="true"/>
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" readonly="true" input="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">账面资产总额(万元)：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcze" id="zmzcze" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">账面资产负债(万元)：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcfz" id="zmzcfz" cssClass="input" readonly="true" />
				</td>
			</tr>
		</table>
		<table id="claims_list"></table>
		<script type="text/javascript">
			jQuery("#claims_list").jqGrid({
				url:"<%=basePath %>zccz/entityDealHead_showDeptBodys.do",
				postData:{
					"head.id" : "<%=headId %>"
				},
				datatype: "json",
				colNames:['id','债务人名称','起始日期','终止日期','合同金额(元)','购入债权余额','本金(元)','利息(元)','担保类型','担保合同金额(元)','担保物类别','转让金额'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'zwrmc',index:'zwrmc'},
					{name:'htqsrq',index:'htqsrq'},
					{name:'htzzrq',index:'htzzrq'},
					{name:'htje',index:'htje'},
					{name:'grzye',index:'grzye'},
					{name:'bj',index:'bj'},
					{name:'lx',index:'lx'},
					{name:'dblxmc',index:'dblxmc'},
					{name:'dbhtje',index:'dbhtje'},
				    {name:'dbwzlbmc',index:'dbwzlbmc'},
				    {name:'zrje',index:'zrje',editable:true}
				],
				rownumbers:true,
				autowidth:true,
				height:'auto',
				rowNum:0,
				multiselect: true,
				caption: '债权信息',
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				}
		});
	</script>
	<br>
	<s:set name="biaodanid" value="xmId" />
	<s:set name="fenlei" value="fenlei" />
	<%@ include file="/inc/zcczAccording.inc"%>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"  >
 	<tr id="iframe1">
 		<td>
 			<iframe id="iframeSrc" frameBorder=0 height="400" width="100%" scrolling="no" src=""></iframe>
 		</td>
 	</tr>
 </table>
	</body>
</html>