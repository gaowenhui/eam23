<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = (String)request.getAttribute("head.id");
    List<CzStcztz> historyHeadList = (List<CzStcztz>)request.getAttribute("historyHeadList");
    CzStcztz head1 = (CzStcztz)request.getAttribute("head");
	String fenlei = request.getParameter("fenlei");
	String xmId = request.getParameter("xmId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>人员安置</title>
		<script type="text/javascript">
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
		$(function(){
			var hsitoryButtonHtml = 
			'<div id="historyMenu" style="width: 150px; display:none;">' +
			<%
				for(CzStcztz head : historyHeadList){
			%>
				'<div onClick="showBld(&quot;<%=head.getId() %>&quot;);return false;" >' + '<%=head.getCzxmmc() %>' + '</div>' + 
			<%}%>
			 '</div>';
			$("body").append(hsitoryButtonHtml);
			
			if($("#gszmnsfyysfzje").val() == '无'){
				$("#gszmnsfyysfzjeDiv").hide();
			}else{
				$("#gszmnsfyysfzjeDiv").show();
			}
			if($("#ryazfysfxjtdf").val() == '0'){
				$("#ryazfysfxjtdfDiv").hide();
			}else{
				$("#ryazfysfxjtdfDiv").show();
			}
			if($("#djtstyzr").val() == '无'){
				$("#fzjeDiv").hide();
			}else{
				$("#fzjeDiv").show();
			}
			
			jQuery("#xglc_reason_list").setGridWidth($("#personInfoTable").width());
			jQuery("#anzhiPerson").setGridWidth($("#personInfoTable").width());
			$(window).bind('resize', function(){
				jQuery("#xglc_reason_list").setGridWidth($("#personInfoTable").width());
				jQuery("#anzhiPerson").setGridWidth($("#personInfoTable").width());
			});
			setRenyuanInfo();
			//实体信息按钮
			var buttonsString0 = '[\
				{"buttonIcon":"icon-search","buttonText":"实体人员安置上会历史","buttonMenuId":"historyMenu"},\
				{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"},\
				{"buttonHandler":"disposationTrace1","buttonIcon":"icon-add","buttonText":"会后跟踪"}\
			]';
			addButtons(jQuery("#personInfo"),buttonsString0);
			
			var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_xglc_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			
			$(":checkbox").attr("disabled","disabled");
			$(":radio").attr("disabled","disabled");
			$(":text").attr("readonly","readonly");
			$("textarea").attr("readonly","readonly");
			$("select").attr("disabled","disabled");
		});
		function disposationTrace1(){
			var xmId = '<%=xmId%>';
			var stid = '<%=head1.getStid()%>';
			var zcCzfs = "";
			if( stid.length >0){
				iframe1.style.display = "block";
				zcCzfs = 'st4';
				var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds="+stid+"&xmIds="+xmId+"&zcCzfs="+zcCzfs;
				iframeSrc.window.location = url;
			}else alert("请选择要跟踪的记录");
			
		}
		function showBld(headId){
			window.open("<%=basePath %>zccz/bldAction_showStayazBLD.do?"
			+ "head.id=" + headId
			,"",winOpenStr);
		}
		
		function setRenyuanInfo(){
			$.post("<%=basePath %>zccz/personDealHead_setRyFyInfo.do",{
				"head.id" : '' + $("#id").val()
			},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				$("#azrs").val(returnObj.azrs);
				$("#azfy").val(returnObj.azfy);
			});
		}
		
		//查看实体信息
		function stView(){
			var stlx = $("#stlx").val();
			var stid = $("#stid").val();
			if(stlx == "1"){
				window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
			}
			if(stlx == "0" || stlx == "3"){
				window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
			}
		}
	</script>
	</head>

	<body>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">实体人员安置信息</div>
			<div id="personInfo" class="panel-tool"></div>
		</div>
		<table width="100%" id="personInfoTable" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01">资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:hidden id="stlx" name="head.stlx" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" input="true" readonly="true" />
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" input="true" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">对建投是否有负债：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="djtstyzr" onchange="showFzje(this)" name="head.djtstyzr" list="{'无','有'}" />
					<s:div id="fzjeDiv" cssStyle="display:none;">
						<s:textfield cssClass="input" id="fzje" name="head.fzje" />(元)
					</s:div>
					<script type="text/javascript">
						function showFzje(obj){
							if($(obj).val() == '无'){
								$("#fzjeDiv").hide();
							}else{
								$("#fzjeDiv").show();
							}
						}
					</script>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					人员安置费用是否需建投垫付：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" onchange="showDfje(this)" id="ryazfysfxjtdf" name="head.ryazfysfxjtdf" list="#{'0':'否','1':'是'}" />
					<s:div id="ryazfysfxjtdfDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="dfje" name="head.dfje" />(元)</s:div>
					<script type="text/javascript">
						function showDfje(obj){
							if($(obj).val() == '0'){
								$("#ryazfysfxjtdfDiv").hide();
							}else{
								$("#ryazfysfxjtdfDiv").show();
							}
						}
					</script>
				</td>
				<td class="td_zxy01">公司账面内是否有预计负债金额：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" list="{'无','有'}" onchange="showGszmnsfyysfzjeDiv(this)" id="gszmnsfyysfzje" name="head.gszmnsfyysfzje" />
					<s:div id="gszmnsfyysfzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="yjfzje" name="head.yjfzje"/>(元)</s:div>
					<script type="text/javascript">
						function showGszmnsfyysfzjeDiv(obj){
							if($(obj).val() == '无'){
								$("#gszmnsfyysfzjeDiv").hide();
							}else{
								$("#gszmnsfyysfzjeDiv").show();
							}
						}
					</script>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人数：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azrs" name="head.azrs" readonly="true" />
				</td>
				<td class="td_zxy01">
					安置总费用(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azfy" name="head.azfy" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置人数：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azrs" name="head.azrs" readonly="true" />
				</td>
				<td class="td_zxy01">
					安置总费用(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="azfy" name="head.azfy" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					处置申报方式：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					安置说明：
				</td>
				<td colspan="3" class="td_zxy02">
					<r:textarea cssClass="input2" rows="4" id="azsm" name="head.azsm" />
				</td>
			</tr>
		</table>
		<table id="anzhiPerson"></table>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"  >
 	<tr id="iframe1">
 		<td>
 			<iframe id="iframeSrc" frameBorder=0 height="400" width="100%" scrolling="no" src=""></iframe>
 		</td>
 	</tr>
 </table>
		<script type="text/javascript">
			jQuery("#anzhiPerson").jqGrid({
				url:"<%=basePath %>zccz/personDealBody_anzhiPerson.do",
				postData:{
					"body.cldId" : "<%=headId %>"
				},
				datatype: "json",
				colNames:['id','姓名','移动电话','固定电话','安置方式','安置费用'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'xingming',index:'xingming'},
					{name:'fyddh',index:'fyddh'},
					{name:'fgddh',index:'fgddh'},
					{name:'fazfs',index:'fazfs',editable:true},
					{name:'fazfy',index:'fazfy',editable:true}
				],
				autowidth:true,
				height:'auto',
				multiselect: true,
				caption: '本次安置人员',
				prmNames:{
					page:"paginator.currentPage",
					rows:"paginator.pageCount"
				},
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
	</body>
</html>
