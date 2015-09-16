<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String yjflmc = request.getAttribute("yjflmc").toString();
	boolean show = false;
	if("计算机类固定资产".equals(yjflmc) || "非计算机类固定资产".equals(yjflmc)){
		show = true;
	}
%>
<html>
	<head>
		<title>物品详细信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript">
			$(function(){
				sheettype = $("#sheetType").val()
				if($("#sheetType").val()=="goodrenewal_view"){
					$("#tempName").append("出保日期");
					$("#tempText").append("<input type='text' name='vv.cbrq' readonly='true' class='input'/>");
				}else if($("#sheetType").val()=="tocheckobject_view" || 
						 $("#sheetType").val()=="tocheckstock_view"){
					$("#tempName").append("最近盘点日期：");
					$("#tempText").append("<input type='text' name='vv.zjpdrq' readonly='true' class='input'/>");
				}else if($("#sheetType").val()=="reborrow_view" ){
					$("#COB1,#COB2,#COB3,#COB4").attr("style","display: block");
				}
				
				if($("#ejflbm").val()=="31" && !(sheettype.indexOf("borrow") > 0) || 
					$("#ejflbm").val()=="32" && !(sheettype.indexOf("comsuming") > 0)){
					$("#cmpInfo1,#cmpInfo2,#cmpInfo3").attr("style","display: block")
				}
				
				if($("#ejflbm").val()=="128"){
					$("#tempName").append("发动机编号：");
					$("#tempText").append("<input type='text' name='vv.fdjbh' readonly='true' class='input'/>");
				}
			//添加按钮
				var buttonJSonString = '[{"buttonHandler":"viewPgInfo","buttonIcon":"icon-search","buttonText":"查看"}\
										]';
				addButtons($("#gview_evaluating_list > .ui-jqgrid-titlebar"),buttonJSonString);	
			<%
				if(show){
			%>
					document.getElementById("pgList").style.display = "block";
			<%
				}else {
			%>
				    document.getElementById("pgList").style.display = "none";
			<%
				}
			%>				
			});
			function viewPgInfo(){
				var gr = jQuery("#evaluating_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else{
						
				}
			}		
		</script>
	</head>
	<body>
		<s:form name="myform"  id="myform">
			<s:hidden name="sheettype" id="sheetType"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.yjflmc" readonly="true" id="yjflmc" cssClass="input"/>
					</td>
					<td class="td_zxy01">二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:hidden name="vv.ejflbm" id="ejflbm"/>
						<s:textfield name="vv.ejflmc" readonly="true" id="ejflmc" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.sjflmc" readonly="true" id="sjflmc" cssClass="input"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.zcmc" readonly="true" cssClass="input" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">规 格：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.gg" readonly="true" cssClass="input" id="gg"/>
					</td>
					<td class="td_zxy01">入库日期：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.rkrq" readonly="true" id="rkrq" cssClass="input"/>     
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">开始使用日期：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.kssyrq" readonly="true" id="kssyrq" cssClass="input"/>
					</td>
					<td class="td_zxy01">资产状态：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.zczt" readonly="true" id="zczt" cssClass="input"/>
					</td> 
				</tr>
				<tr id="NO1" style="display: none">
					<td class="td_zxy01">资产编号：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.zcbh" readonly="true" cssClass="input" id="zcbh"/>
					</td>
					<td class="td_zxy01">卡片编号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.kpbh" readonly="true" id="kpbh" cssClass="input"/>     
					</td> 
				</tr>
				<tr id="NO2" style="display: none">
					<td class="td_zxy01">条形码编号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.txmbh" readonly="true" id="txmbh" cssClass="input"/>
					</td>                                                                          
					<td class="td_zxy01">序列号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.xlh" readonly="true" id="xlh" cssClass="input"/>     
					</td>  
				</tr>
				<tr id="sl" style="display: none"> 
					<td class="td_zxy01">数 量：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.sl" readonly="true" cssClass="input" id="sl"/>
					</td>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.jldw" readonly="true" cssClass="input"/>
					</td>
				</tr>
				<tr id="price" style="display: none">
					<td class="td_zxy01">单 价(元)</td>
					<td class="td_zxy02">
						<s:textfield  name="vv.dzyhdj" readonly="true" cssClass="input" id="dzyhdj"/>
					</td>
					<td class="td_zxy01">金 额(元)：</td>
					<td class="td_zxy02">
						<s:textfield name="vv.dzyhjg" readonly="true" id="dzyhjg" readonly="true" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">预警库存数量：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.yjkcsl" readonly="true" id="yjkcsl" cssClass="input"/>     
					</td>                                                                          
					<td class="td_zxy01">编号粘贴位置：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.ztwz" readonly="true" id="ztwz" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">保管地点：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.bgdd" readonly="true" id="bgdd" cssClass="input"/>     
					</td> 
					<td class="td_zxy01">原系统录入人员：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.ylrr" readonly="true" id="ylrr" cssClass="input"/>
					</td>  
				</tr>
				<tr>
					<td class="td_zxy01">所属账管：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.sszg" readonly="true" id="sszg" cssClass="input"/>     
					</td>
					<td class="td_zxy01" id="tempName">&nbsp;</td>                                               
					<td class="td_zxy02" id="tempText">&nbsp;</td>                                                                                 
				</tr>
				
				<!-- computerInfo -->
				<tr id="cmpInfo1" style="display: none">
					<td class="td_zxy01">内存：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.memory" readonly="true" cssClass="input" id="memory"/>
					</td>                                                                          
					<td class="td_zxy01">硬盘：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.disk" readonly="true" id="disk" cssClass="input"/>     
					</td>
				</tr> 
				<tr id="cmpInfo2" style="display: none">                                                                         
					<td class="td_zxy01">内置硬盘：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.memory" readonly="true" id="memory" cssClass="input"/>
					</td>                                                                          
					<td class="td_zxy01">cpu型号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.cpuxh" readonly="true" id="cpuxh" cssClass="input"/>     
					</td>
				</tr> 
				<tr id="cmpInfo3" style="display: none"> 
					<td class="td_zxy01">系统显示器：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.xtxxq" readonly="true" id="xtxxq" cssClass="input"/>
					</td> 
					<td class="td_zxy01">&nbsp;</td>                                               
					<td class="td_zxy02">&nbsp;</td>                                                                         
				</tr>
				
				<!-- COB:ConsumingOrBorrow -->
				<tr id="COB1" style="display: none">                                                                                     
					<td class="td_zxy01">领用部门名称：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.lybmmc" readonly="true" cssClass="input" id="lybmmc"/>
					</td>                                                                          
					<td class="td_zxy01">领用人名称：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.lyrmc" readonly="true" id="lyrmc" cssClass="input"/>     
					</td>                                                                          
				</tr>
				<tr id="COB2" style="display: none">                                                                                     
					<td class="td_zxy01">借用人名称：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.jyrmc" readonly="true" cssClass="input" id="jyrmc"/>
					</td>                                                                          
					<td class="td_zxy01">领用日期：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.lyrq" readonly="true" id="lyrq" cssClass="input"/>     
					</td>                                                                          
				</tr>
				<tr id="COB3" style="display: none">                                                                                     
					<td class="td_zxy01">借用到期日期：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.jydqrq" readonly="true" id="jydqrq" cssClass="input"/>
					</td>                                                                          
					<td class="td_zxy01">单据类型：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="vv.djlx" readonly="true" id="djlx" cssClass="input"/>     
					</td>                                                                          
				</tr>
				<tr id="COB4" style="display: none">                                                                                     
					<td class="td_zxy01">单据号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="vv.djh" readonly="true" cssClass="input" id="djh"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>                                               
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>                                               
					<td class="td_zxy02" colspan="3" style="width:100%">                                                          
						<s:textfield name="vv.bz" readonly="true" id="bz" cssClass="input"/>     
					</td>                                                                          
				</tr>                                                                               
			</table>
			<div class="list" id="pgList">
		 		<table id="evaluating_list"></table>
		 	</div>
		</s:form>
	</body>
</html>
			<script type="text/javascript">
				jQuery("#evaluating_list").jqGrid({
					url:"<%=basePath%>zyzc/ZCManageBody_getPgxxByZcId.do",
					postData:{
						'zyzcId':'${vv.zcId}'
					},
					datatype:"json",
					colNames:['id','评估基准日期','评估值(元)','评估基准日账面价值(元)','净值(元)'],
					colModel:[	
						{name:'id',index:'id',width:200,hidden:true},
						{name:'pgjzr',index:'personNo',width:200},
						{name:'pingguzhi',index:'Name',width:200},
						{name:'jzrzmjz',index:'tel',align:"center",width:320},
						{name:'jingzhi',index:'duties',width:320}						
					],	
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption:'评估信息列表',
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