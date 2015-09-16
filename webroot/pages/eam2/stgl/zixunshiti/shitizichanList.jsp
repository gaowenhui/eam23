<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = (String)request.getAttribute("stid");
	String ispgsc = (String)request.getAttribute("ispgsc");
	String id = (String)request.getAttribute("id");
	String ctlButton = (String)request.getAttribute("ctlButton");
	String assetType = (String)request.getAttribute("assetType");
	String zcczCldId = (String)request.getAttribute("zcczCldId");
	String look = (String)request.getAttribute("look"); 			//查看标志
	String zcczpg = (String)request.getAttribute("zcczpg");			//自用资产评估
	//chenyuxiao start
	String loansId = (String)request.getAttribute("loansId");
	String loansNo = "";
	if(loansId!=null&&!"".equals("loansId")){
		loansNo = loansId;
	}
	String option = request.getParameter("option");
	String optionType = request.getParameter("optionType");
	// chenyuxiao end
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>实体资产信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	
	function reloadGrid(id){
		if(id == "cash"){
			jQuery("#cash_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "land"){
			jQuery("#land_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "house"){
			jQuery("#house_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "machine"){
			jQuery("#machine_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "traffic"){
			jQuery("#traffic_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "invest"){
			jQuery("#invest_list").setGridParam({
			}).trigger("reloadGrid");
		}else if(id == "other"){
			jQuery("#otherasset_list").setGridParam({
			}).trigger("reloadGrid");
		}
	}
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
			$(document).ready(function(){
			<%if("1".equals(look)){%>
					//金额添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss1","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_cash_list> .ui-jqgrid-titlebar"),buttonJSonString);
					//土地添加按钮
					var buttonJSonString2 = '[{"buttonHandler":"lookAss2","buttonIcon":"icon-search","buttonText":"查看"}]';
						addButtons(jQuery("#gview_land_list> .ui-jqgrid-titlebar"),buttonJSonString2);
					//房屋添加按钮
					var buttonJSonString3 = '[{"buttonHandler":"lookAss3","buttonIcon":"icon-search","buttonText":"查看"}]';
						addButtons(jQuery("#gview_house_list> .ui-jqgrid-titlebar"),buttonJSonString3);
						//添加按钮  机械
					var buttonJSonString4 = '[{"buttonHandler":"lookAss4","buttonIcon":"icon-search","buttonText":"查看"}]';
						addButtons(jQuery("#gview_machine_list> .ui-jqgrid-titlebar"),buttonJSonString4);
					//交通添加按钮
					var buttonJSonString5 = '[{"buttonHandler":"lookAss5","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_traffic_list> .ui-jqgrid-titlebar"),buttonJSonString5);
					// 对外投资添加按钮
					var buttonJSonString6 = '[{"buttonHandler":"lookAss6","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_invest_list> .ui-jqgrid-titlebar"),buttonJSonString6);
					//其他添加按钮
					var buttonJSonString7 = '[{"buttonHandler":"lookAss7","buttonIcon":"icon-search","buttonText":"查看"}]';
					addButtons(jQuery("#gview_otherasset_list> .ui-jqgrid-titlebar"),buttonJSonString7);
				<%}else{%>	
					//金额添加按钮
					var buttonJSonString = '[{"buttonHandler":"lookAss1","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"cashAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"cashModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											 {"buttonHandler":"cashDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_cash_list> .ui-jqgrid-titlebar"),buttonJSonString);
					//土地添加按钮
					var buttonJSonString2 = '[{"buttonHandler":"lookAss2","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"landAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"landModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											 {"buttonHandler":"landDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											 ]';
						addButtons(jQuery("#gview_land_list> .ui-jqgrid-titlebar"),buttonJSonString2);
					//房屋添加按钮
					var buttonJSonString3 = '[{"buttonHandler":"lookAss3","buttonIcon":"icon-search","buttonText":"查看"},\
											  {"buttonHandler":"houseAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											  {"buttonHandler":"houseModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											  {"buttonHandler":"houseDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											 ]';
						addButtons(jQuery("#gview_house_list> .ui-jqgrid-titlebar"),buttonJSonString3);
					//添加按钮  机械
					var buttonJSonString4 = '[{"buttonHandler":"lookAss4","buttonIcon":"icon-search","buttonText":"查看"},\
											  {"buttonHandler":"machineAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											  {"buttonHandler":"machineModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											  {"buttonHandler":"machineDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											 ]';
						addButtons(jQuery("#gview_machine_list> .ui-jqgrid-titlebar"),buttonJSonString4);
					//交通添加按钮
					var buttonJSonString5 = '[{"buttonHandler":"lookAss5","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"trafficAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"trafficModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"trafficDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_traffic_list> .ui-jqgrid-titlebar"),buttonJSonString5);
					// 对外投资添加按钮
					var buttonJSonString6 = '[{"buttonHandler":"lookAss6","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"investAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"investModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											{"buttonHandler":"investDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_invest_list> .ui-jqgrid-titlebar"),buttonJSonString6);
					//其他添加按钮
					var buttonJSonString7 = '[{"buttonHandler":"lookAss7","buttonIcon":"icon-search","buttonText":"查看"},\
											 {"buttonHandler":"otherAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
											 {"buttonHandler":"otherModifyAss","buttonIcon":"icon-edit","buttonText":"修改"},\
											 {"buttonHandler":"otherDelAss","buttonIcon":"icon-remove","buttonText":"删除"}\
											]';
					addButtons(jQuery("#gview_otherasset_list> .ui-jqgrid-titlebar"),buttonJSonString7);
				<%}%>	
					});
					
					
					
					function lookAss1(){
						var gr = jQuery("#cash_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
 						if(gr.length == 0){
 							alert("请选择要查看的记录")
 						}else if (gr.length > 1){
 							alert("只能选择一条要查看的记录")
 						}else{
							window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+6+'&look='+1,'金额',winVar);
						}
					}
				
				
					function cashAddAss(){
						var id = document.getElementById("id").value;
						var stid = '<%=stid%>';
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var ispgsc = '<%=ispgsc%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+6+'&newAdd='+1+'&loansId='+loansId+'ispgsc='+ispgsc,'金额',winVar);
					}
			
					function cashModifyAss(){
						var gr = jQuery("#cash_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						var ispgsc = '<%=ispgsc%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+6+'&ispgsc='+ispgsc,'金额',winVar);
						}
					}
					
					function cashDelAss(){
					
						var gr = jQuery("#cash_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#cash_list").trigger("reloadGrid");
								});
							}
						}else{
							alert("请选择要删除的记录!"); 		
							}
					} 
		function chooseAssetForDispose(){
			var assetType = "<%=assetType%>";
			var cldId = "<%=zcczCldId%>";
			var cashList = jQuery("#cash_list").jqGrid('getGridParam','selarrrow');
			if(cashList.length > 0){
				alert("现金无需进行处置，请重新选择!");
				return;
			}
			var landList = jQuery("#land_list").jqGrid('getGridParam','selarrrow');
			var houseList = jQuery("#house_list").jqGrid('getGridParam','selarrrow');
			var machineList = jQuery("#machine_list").jqGrid('getGridParam','selarrrow');
			var trafficList = jQuery("#traffic_list").jqGrid('getGridParam','selarrrow');
			var investList = jQuery("#invest_list").jqGrid('getGridParam','selarrrow');
			if(investList.length > 0){
				alert("对外投资无需进行处置，请重新选择!");
				return;
			}
			var otherassetList = jQuery("#otherasset_list").jqGrid('getGridParam','selarrrow');
			if("CJTZ" == "<%=option%>"){
				if("STLZC" == "<%=optionType%>"){
					window.parent.opener.parent.addStlZc("<%=stid%>","<%=optionType%>",
						landList,houseList,machineList,trafficList,otherassetList
					);
				}else if("WDDZW" == "<%=optionType%>"){
					window.parent.opener.parent.addStlZc("<%=loansId%>","<%=optionType%>",
						landList,houseList,machineList,trafficList,otherassetList
					);
				}
				window.parent.opener.close();
				window.parent.close();
			}else{
				$.post("<%=request.getContextPath()%>/zccz/assetDealBody_addBody.do",{
					"landIds":"" + landList,
					"houseIds":"" + houseList,
					"machineIds":"" + machineList,
					"trafficIds":"" + trafficList,
					"otherAssetIds":"" + otherassetList,
					"stid":"<%=stid%>",
					"loansNo":"<%=loansNo%>",
					"assetType":"<%=assetType%>",
					"cldId":"<%=zcczCldId%>"
				},function(returnStr){
					if("success" == returnStr){
						if('<%=assetType%>' == "0"){
							window.parent.opener.opener.reloadAssetGrid("0");
						}
						if('<%=assetType%>' == "2"){
							window.parent.opener.opener.reloadAssetGrid("2");
						}	
						if('<%=assetType%>' == "1"){			//add by lantianbo
							window.parent.opener.opener.reloadAssetGrid("1");
						}				
						window.parent.opener.close();
						window.parent.close();
					}else{
						alert("保存失败！");
					}
	
				});
			}
		}			
		
		//Added by liubeibei.Use for choosing entity asset.
		function ctlButton(){
			var entityCldId = "<%=ctlButton%>";
			var zcczpg = "<%=zcczpg%>";
			if(entityCldId == "show" && zcczpg != "1"){
				document.getElementById("useforzzcz").style.display = "block";
			}
		}	
	</script>
  </head>
<body onload="ctlButton()">
<div id="widthRule_cash">&nbsp;</div>	
<s:hidden id="id" name="sf.id"></s:hidden>
<s:hidden id="stid" name="sf.stid"></s:hidden>
<%if("show".equals(ctlButton)){ %>
	<s:hidden name="%{#request.assetType}"/>
	<input type="button" value="选择处置" onclick="chooseAssetForDispose();" id="useforzzcz"/>
<%} %>
<table id="cash_list"> </table>
<br/>
<script type="text/javascript">

		var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";			
				jQuery("#cash_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':6,'loansId':""+'<%=loansNo%>'+""},
					datatype: "json",
					colNames:['id','现金编号','金额(元)','账户','账户名称'],
					colModel:[	
						{name:'id',index:'amount', editable: false,hidden:true},
						{name:'hxjbh',index:'amount', editable: false},
						{name:'hjine',index:'amount', editable: false},
						{name:'hzhanghu',index:'account', editable: false},
						{name:'hzhmc',index:'accountTitle', editable: false}						
					],
					editurl:"entity-info-alter.html",
					pager:'pgtoolbarotherasset',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'现金',
							toolbar:[false,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
				jQuery("#cash_list").setGridWidth($("#widthRule_cash").width());		
				$(window).bind('resize', function() {  
						jQuery("#cash_list").setGridWidth($("#widthRule_cash").width()); 
					}); 
</script>

<table id="land_list"> </table>

<br/>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";

					//土地查看信息
					function lookAss2(){
						var gr = jQuery("#land_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
							window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+7+'&look=1'+'&zcczpg='+'<%=zcczpg%>','',winVar);
						}
					}
				
				
					function landAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+7+'&newAdd='+1+'&loansId='+loansId+'&zcczpg='+'<%=zcczpg%>'+'ispgsc='+'<%=ispgsc%>','',winVar);
					}
			
					function landModifyAss(){
					
						var gr = jQuery("#land_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+7+'&zcczpg='+'<%=zcczpg%>'+'&ispgsc='+'<%=ispgsc%>','',winVar);
						}
					}
					
					function landDelAss(){
					
						var gr = jQuery("#land_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#land_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 


				jQuery("#land_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':7,'loansId':'<%=loansNo%>'},
					datatype: "json",
					colNames:['id','土地编号','土地名称','土地取得方式','实际占有人','《土地使用权证》','《土地使用权证》没有及下落不明的原因','是否抵押','抵押情况介绍','面积（平方米）','土地使用权人','土地描述'],
					colModel:[	
						{name:'id',index:'landName', editable: false,hidden:true},
						{name:'jtdbh',index:'landName', editable: false},
						{name:'jtdmc',index:'landName', editable: false},
						{name:'jtdqdfs',index:'gainMethod', editable: false},
						{name:'jsjzyr',index:'holder', editable: false},
						{name:'jtdsyqz',index:'useCard',editable: false,edittype:"select",editoptions:{value:"1:有;2:无;3:下落不明"},hidden:true},
						{name:'jxlbmyy',index:'', editable: false,hidden:true},
						{name:'jtdsfdy',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;0:否"},hidden:true},
						{name:'jtddyqkjs',index:'pledgeDes', editable: false,hidden:true},	
						{name:'jtdmj',index:'acreage', editable: false,hidden:true},	
						{name:'jtdsyqr',index:'rightOfUse', editable: false},	
						{name:'jtdms',index:'landDes', editable: false }										
					],
					editurl:"entity-info-alter.html",
					pager:'pgtoolbarotherasset',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'土地',
							toolbar:[false,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
				jQuery("#land_list").setGridWidth($("#widthRule_cash").width());		
				$(window).bind('resize', function() {  
						jQuery("#land_list").setGridWidth($("#widthRule_cash").width()); 
					});  
						
</script>


<table id="house_list"> </table>
<br/>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";

					function lookAss3(){
						var gr = jQuery("#house_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+8+'&look='+1,'房屋',winVar);
						}
					}
					
					function houseAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var stid = '<%=stid%>';
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+8+'&newAdd='+1+'&loansId='+loansId+'&zcczpg='+'<%=zcczpg%>'+'ispgsc='+'<%=ispgsc%>','房屋',winVar);
					}
			
					function houseModifyAss(){
					
						var gr = jQuery("#house_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+8+'&zcczpg='+'<%=zcczpg%>'+'&ispgsc='+'<%=ispgsc%>','房屋',winVar);
						}
					}
					
					function houseDelAss(){
					
						var gr = jQuery("#house_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#house_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 

				jQuery("#house_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':8,'loansId':'<%=loansNo%>'},
					datatype: "json",
					colNames:['id','房屋编号','房屋名称','地址','房屋所有权人','实际占有人','《房屋使用权证》','《房屋所有权证》没有及下落不明的原因','是否抵押','抵押情况介绍','面积（平方米）','房屋使用权人','房屋描述'],
					colModel:[	
						{name:'id',index:'adress', editable: false,hidden:true},
						{name:'kfwbh',index:'adress', editable: false},
						{name:'kfwmc',index:'kfwmc', editable: false},
						{name:'kfwdz',index:'adress', editable: false},
						{name:'kfwsyqr',index:'gainMethod', editable: false},
						{name:'kfwsjzyr',index:'actulHolder', editable: false},
						{name:'kywfwsyqz',index:'useCard',editable: false,edittype:"select",editoptions:{value:"1:有;2:无;3:下落不明"},hidden:true},
						{name:'kxlbmyy',index:'', editable: false,hidden:true},
						{name:'ksfdy',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"},hidden:true},	
						{name:'kdyqk',index:'', editable: false,hidden:true},
						{name:'kfwmj',index:'acreage', editable: false,hidden:true},	
						{name:'ksyqr',index:'rightOfUse', editable: false},	
						{name:'kfwms',index:'houseDes', editable: false,hidden:true}											
					],
					editurl:"entity-info-alter.html",
					pager:'pgtoolbarotherasset',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'房屋',
					toolbar:[false,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			jQuery("#house_list").setGridWidth($("#widthRule_cash").width());		
			$(window).bind('resize', function() {  
					jQuery("#house_list").setGridWidth($("#widthRule_cash").width()); 
				});
</script>


<table id="machine_list"> </table>
<br/>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
					
					function lookAss4(){
						var gr = jQuery("#machine_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+9+'&look='+1+'&zcczpg='+'<%=zcczpg%>','机器设备',winVar);
						}
					}
				
				
					function machineAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+9+'&newAdd='+1+'&loansId='+loansId+'&zcczpg='+'<%=zcczpg%>'+'ispgsc='+'<%=ispgsc%>','机器设备',winVar);
					}
					
					function machineModifyAss(){
						var gr = jQuery("#machine_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+9+'&zcczpg='+'<%=zcczpg%>'+'&ispgsc='+'<%=ispgsc%>','机器设备',winVar);
						}
					}
					
					function machineDelAss(){
						var gr = jQuery("#machine_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#machine_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 


				jQuery("#machine_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':9,'loansId':'<%=loansNo%>'},
					datatype: "json",
					colNames:['id','机器设备编号','名称','存放何处','权属','实际占有人','抵押','抵押情况介绍','机器设备描述'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'msbbh',index:'name', editable: false},
						{name:'msbmc',index:'name', editable: false},
						{name:'msbcfwz',index:'where', editable: false},
						{name:'msbqs',index:'ownership', editable: false},
						{name:'msbsjzyr',index:'actulHolder', editable: false},
						{name:'msbsfdy',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"},hidden:true},	
						{name:'msbdyjs',index:'', editable: false,hidden:true},	
						{name:'msbms',index:'machineDes', editable: false,hidden:true}									
					],
					editurl:"entity-info-alter.html",
					pager:'pgtoolbarotherasset',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'机器设备',
					toolbar:[false,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			jQuery("#machine_list").setGridWidth($("#widthRule_cash").width());		
			$(window).bind('resize', function() {  
					jQuery("#machine_list").setGridWidth($("#widthRule_cash").width()); 
				});
</script>



<table id="traffic_list"> </table>
<br/>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
					
					function lookAss5(){
					
						var gr = jQuery("#traffic_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+10+'&look='+1+'&zcczpg='+'<%=zcczpg%>','交通工具',winVar);
						}
					}
					
				
					function trafficAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+10+'&newAdd='+1+'&loansId='+loansId+'&zcczpg='+'<%=zcczpg%>'+'ispgsc='+'<%=ispgsc%>','交通工具',winVar);
					}
			
					function trafficModifyAss(){
						var gr = jQuery("#traffic_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+10+'&zcczpg='+'<%=zcczpg%>'+'&ispgsc='+'<%=ispgsc%>','交通工具',winVar);
						}
					}
					
					function trafficDelAss(){
					
						var gr = jQuery("#traffic_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#traffic_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 
			
				jQuery("#traffic_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':10,'loansId':'<%=loansNo%>'},
					datatype: "json",	
					colNames:['id','交通工具编号','车牌号','存放何处','权属','实际占有人','是否抵押','抵押情况介绍','机器设备描述'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'ljtgjbh',index:'name', editable: false},
						{name:'lcph',index:'name', editable: false},
						{name:'ljtgjcfwz',index:'where', editable: false},
						{name:'lqs',index:'ownership', editable: false},
						{name:'lsjzyr',index:'actulHolder', editable: false},
						{name:'lsfdy',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"},hidden:true},	
						{name:'ldyjs',index:'ldyjs', editable: false,hidden:true},	
						{name:'ljtgjms',index:'machineDes', editable: false,hidden:true}								
					],
					editurl:"entity-info-alter.html",
					pager:'pgtoolbarotherasset',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'交通运输',
					toolbar:[false,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			jQuery("#traffic_list").setGridWidth($("#widthRule_cash").width());		
			$(window).bind('resize', function() {  
					jQuery("#traffic_list").setGridWidth($("#widthRule_cash").width()); 
				});
</script>


<table id="invest_list"> </table>
<br/>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
				
					function lookAss6(){
						var gr = jQuery("#invest_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+11+'&look='+1+'&zcczpg='+'<%=zcczpg%>','',winVar);
						}
					}
				
				
					function investAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+11+'&newAdd='+1+'&loansId='+loansId+'ispgsc='+'<%=ispgsc%>'+'&zcczpg='+'<%=zcczpg%>','',winVar);
					}
			
					function investModifyAss(){
					
						var gr = jQuery("#invest_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+11+'&ispgsc='+'<%=ispgsc%>'+'&zcczpg='+'<%=zcczpg%>','',winVar);
						}
					}
					
					function investDelAss(){
					
						var gr = jQuery("#invest_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#invest_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 
				jQuery("#invest_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':11,'loansId':'<%=loansNo%>'},
					datatype: "json",	
					colNames:['id','对外投资编号','被投资企业名称','投资额（元）','投资方式','投资情况描述'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'ndwtzbh',index:'name', editable: false},
						{name:'nbtqymc',index:'name', editable: false},
						{name:'ntze',index:'account', editable: false},
						{name:'ntzfs',index:'investWay', editable: false},
						{name:'ntzqkms',index:'investDes', editable: false}],
							editurl:"entity-info-alter.html",
							pager:'pgtoolbarotherasset',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'对外投资',
							toolbar:[false,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
					jQuery("#invest_list").setGridWidth($("#widthRule_cash").width());		
					$(window).bind('resize', function() {  
							jQuery("#invest_list").setGridWidth($("#widthRule_cash").width()); 
						});
</script>

<table id="otherasset_list"> </table>
<script type="text/javascript">
var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
					
					function lookAss7(){
						var gr = jQuery("#otherasset_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要查看的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要查看的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+12+'&look='+1+'&zcczpg='+'<%=zcczpg%>','其他资产',winVar);
						}
					}
				
					function otherAddAss(){
		//				cash_information.style.display=cash_information.style.display=='none'?'block':'none';
						var id = document.getElementById("id").value;
						var loansId = '<%=loansNo%>';//chenyuxiao add
						var stid = '<%=stid%>';
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+id+'&fslx='+3+'&stid='+stid+'&pop='+12+'&newAdd='+1+'&loansId='+loansId+'&zcczpg='+'<%=zcczpg%>'+'ispgsc='+'<%=ispgsc%>','其他资产',winVar);
					}
			
					function otherModifyAss(){
					
						var gr = jQuery("#otherasset_list").jqGrid('getGridParam','selarrrow');
						var id = '<%=id%>';
						document.getElementById('id').value = gr ;
						var rdBasicWidth = "500px";
						var rdBasicHeight = "400px";
						var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
						if(gr.length == 0){
							alert("请选择要修改的记录")
						}else if (gr.length > 1){
							alert("只能选择一条要修改的记录")
						}else{
			//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
						window.open('weihu_newPopList.do?id='+gr+'&fslx='+3+'&stid='+stid+'&pop='+12+'&zcczpg='+'<%=zcczpg%>'+'&ispgsc='+'<%=ispgsc%>','其他资产',winVar);
						}
					}
					
					function otherDelAss(){
					
						var gr = jQuery("#otherasset_list").jqGrid('getGridParam','selarrrow');
						if( gr.length > 0 ) {
							if(confirm("确认删除！")){
								$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
									"fsxxIds":"" + gr
								},function(returnStr){
									alert(returnStr);
									$("#otherasset_list").trigger("reloadGrid");
								});
							}
						}
						
						else{
							alert("请选择要删除的记录!"); 		
							}
					} 


				jQuery("#otherasset_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':3,'stid':'<%=stid%>','id':'<%=id%>','pop':12,'loansId':'<%=loansNo%>'},
					datatype: "json",	
					colNames:['id','其他资产编号','名称','存放何处','权属','实际占有人','是否抵押','抵押情况介绍','其他资产描述'],
					colModel:[	
						{name:'id',index:'name', editable: false,hidden:true},
						{name:'pqtzcbh',index:'name', editable: false},
						{name:'pqtzcmc',index:'name', editable: false},
						{name:'pqtzccfwz',index:'where', editable: false},
						{name:'pqtzcqs',index:'ownership', editable: false},
						{name:'pqtzcsjzyr',index:'actulHolder', editable: false,hidden:true},
						{name:'pqtzcsfdy',index:'pledge', editable: false,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'pdyjs',index:'', editable: false,hidden:true},	
						{name:'pzcms',index:'otherassetDes', editable: false,hidden:true,hidden:true}											
					],
							editurl:"entity-info-alter.html",
							pager:'pgtoolbarotherasset',
							multiselect:true,
							rownumbers:true,
							autowidth:true,
							height:'auto',
							viewrecords:true,
							prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
							caption:'其他资产',
							toolbar:[false,"top"],
							jsonReader : {
								root:"rows",
								page: "page",
								total: "total",
								records: "records",
								repeatitems: false,
								id: "0"
							}
						});
					jQuery("#otherasset_list").setGridWidth($("#widthRule_cash").width());		
					$(window).bind('resize', function() {  
							jQuery("#otherasset_list").setGridWidth($("#widthRule_cash").width()); 
						});
	</script>
  </body>
</html>
