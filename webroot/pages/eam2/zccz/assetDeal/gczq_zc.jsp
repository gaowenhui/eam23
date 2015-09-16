<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<%
	CzCztzfaXx disposeHead = (CzCztzfaXx)request.getAttribute("disposeHead");
	String fenlei = request.getParameter("fenlei");
	String xmId = request.getParameter("xmId");
	String bufenjiean=(String)request.getAttribute("bufenjiean");
%>
<html>
	<head>
    	<base href="<%=basePath %>" />
		<title>资产处置方案审批</title>
		<script type="text/javascript" language="JavaScript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				//设置资产grid宽度
				jQuery("#xglc_reason_list").setGridWidth($("#form").width());
				jQuery("#jygdzcList").setGridWidth($("#form").width());
				jQuery("#dczzcList").setGridWidth($("#form").width());
				jQuery("#stzcList").setGridWidth($("#form").width());
				jQuery("#entity_asset_list").setGridWidth($("#form").width());
				jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
				jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
				jQuery("#zqList").setGridWidth($("#form").width());
				$(window).bind('resize', function(){
					jQuery("#xglc_reason_list").setGridWidth($("#form").width());
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#dczzcList").setGridWidth($("#form").width());
					jQuery("#stzcList").setGridWidth($("#form").width());
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#entity_asset_list").setGridWidth($("#form").width());
					jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zqList").setGridWidth($("#form").width());
				});
				var buttonTraceJSonString1 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean1(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean1(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace1","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_jygdzcList > .ui-jqgrid-titlebar"),buttonTraceJSonString1);
				var buttonTraceJSonString2 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean2(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean2(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace2","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_dczzcList > .ui-jqgrid-titlebar"),buttonTraceJSonString2);
				var buttonTraceJSonString3 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean3(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean3(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace3","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_stzcList > .ui-jqgrid-titlebar"),buttonTraceJSonString3);
				var buttonTraceJSonString4 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean4(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean4(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace4","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_entity_asset_list > .ui-jqgrid-titlebar"),buttonTraceJSonString4);
				var buttonTraceJSonString5 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean5(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean5(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace5","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_loan_pledge_asset_list > .ui-jqgrid-titlebar"),buttonTraceJSonString5);
				var buttonTraceJSonString6 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean6(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean6(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace6","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_zyzc_asset_list > .ui-jqgrid-titlebar"),buttonTraceJSonString6);
				var buttonTraceJSonString7 = '[<%if("true".equals(bufenjiean)){%>{"buttonHandler":"bufenjiean7(0)","buttonIcon":"icon-add","buttonText":"取消结案"},{"buttonHandler":"bufenjiean7(1)","buttonIcon":"icon-add","buttonText":"选择结案"},<%}%>{"buttonHandler":"disposationTrace7","buttonIcon":"icon-add","buttonText":"会后跟踪"}]';
				addButtons(jQuery("#gview_zqList > .ui-jqgrid-titlebar"),buttonTraceJSonString7);
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_xglc_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			});
			function bufenjiean1(aaa){
				var list = "jygdzcList";
				var assetType = "0";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean2(aaa){
				var list = "dczzcList";
				var assetType = "5";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean3(aaa){
				var list = "stzcList";
				var assetType = "6";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean4(aaa){
				var list = "entity_asset_list";
				var assetType = "1";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean5(aaa){
				var list = "loan_pledge_asset_list";
				var assetType = "2";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean6(aaa){
				var list = "zyzc_asset_list";
				var assetType = "3";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function bufenjiean7(aaa){
				var list = "zqList";
				var assetType = "7";
				if("0"==aaa){
					quxiaojiean(list,assetType);
				}else if("1"==aaa){
					bufenjiean(list,assetType);
				}
			}
			function disposationTrace1(){
				var list = "jygdzcList";
				disposationTraceMain(list);
			}	
			function disposationTrace2(){
				var list = "dczzcList";
				disposationTraceMain(list);
			}	
			function disposationTrace3(){
				var list = "stzcList";
				disposationTraceMain(list);
			}	
			function disposationTrace4(){
				var list = "entity_asset_list";
				disposationTraceMain(list);
			}	
			function disposationTrace5(){
				var list = "loan_pledge_asset_list";
				disposationTraceMain(list);
			}	
			function disposationTrace6(){
				var list = "zyzc_asset_list";
				disposationTraceMain(list);
			}	
			function disposationTrace7(){
				var list = "zqList";
				disposationTraceMain(list);
			}	
			function bufenjiean(list,assetType){
				var zcIds = jQuery("#"+list).jqGrid('getGridParam','selarrrow');
				var xmId = '<%=(String)request.getAttribute("xmId")%>';
				var headId = '<%=(String)request.getAttribute("headId1")%>';
				if( zcIds.length == 1&&zcIds[0] =="" ){
					alert("没有可以选择的资产！");
				}else if(zcIds.length>=1){
					$.post("<%=request.getContextPath()%>/zccz/dealTrace1Head_bufenjiean.do",{
						"zcIds":""+zcIds,"xmIds":xmId,"zclb":assetType,"headId":headId
					},function(data){
						alert(data);
						reloadJqGrid();
						window.parent.opener.reloadJqGrid();
					});
				}else{
					alert("请选择资产!");
				}
			}
			function quxiaojiean(list,assetType){
				var zcIds = jQuery("#"+list).jqGrid('getGridParam','selarrrow');
				var xmId = '<%=(String)request.getAttribute("xmId")%>';
				var headId = '<%=(String)request.getAttribute("headId1")%>';
				if( zcIds.length == 1&&zcIds[0] =="" ){
					alert("没有可以选择的资产！");
				}else if(zcIds.length>=1){
					$.post("<%=request.getContextPath()%>/zccz/dealTrace1Head_quxiaojiean.do",{
						"zcIds":""+zcIds,"xmIds":xmId,"zclb":assetType,"headId":headId
					},function(data){
						alert(data);
						reloadJqGrid();
						window.parent.opener.reloadJqGrid();
					});
				}else{
					alert("请选择资产!");
				}
			}
			function reloadJqGrid(){
				jQuery("#jygdzcList").trigger("reloadGrid");
				jQuery("#dczzcList").trigger("reloadGrid");
				jQuery("#stzcList").trigger("reloadGrid");
				jQuery("#entity_asset_list").trigger("reloadGrid");
				jQuery("#loan_pledge_asset_list").trigger("reloadGrid");
				jQuery("#zyzc_asset_list").trigger("reloadGrid");
				jQuery("#zqList").trigger("reloadGrid");
			}
			function disposationTraceMain(list){
				var zcId = jQuery("#"+list).jqGrid('getGridParam','selarrrow');
				var zcCzfs = "";
				if( zcId.length >0){
					for(var i = 0;i<zcId.length;i++){
						for(var j = 0;j<zcId.length;j++){
							var czfs1 = jQuery("#"+list).getCell(zcId[i],'CCzfs');
							var czfs2 = jQuery("#"+list).getCell(zcId[j],'CCzfs');
							if(czfs1!=czfs2){
								alert("不同的处置方式，不能一起跟踪!");
								return false;
							}
						}
					}
					iframe1.style.display = "block";
					var czfs = jQuery("#"+list).getCell(zcId[0],'CCzfs');
					var xmId = '<%=xmId%>';
					if(czfs =='1'){//处置方式为1的是公开拍卖
						zcCzfs = 'zc1';
					}else if(czfs =='2'){//处置方式为2的是交易所挂牌
						zcCzfs = 'zc2';
					}else if(czfs =='3'){//处置方式为3协议转让
						zcCzfs = 'zc3';
					}else if(czfs =='4'){//处置方式为4拆迁
						zcCzfs = 'zc4';
					}else {
						alert("该项目没有会后跟踪！");
						return false;
					} 
					var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds="+zcId+"&xmIds="+xmId+"&zcCzfs="+zcCzfs;
					iframeSrc.window.location = url;
				}else alert("请选择要跟踪的记录");
			}	
			function lookdblclickAss(gr){
				var fsxxId = jQuery("#entity_asset_list").getCell(gr,"bstid");
				var zixunType = jQuery("#entity_asset_list").getCell(gr,"stlx");
				if("0" == zixunType || "3" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1);
				}else if("1" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1);
				}
			}
     	</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div id="form" style="width: 100%;">&nbsp;</div>
			<!--	经验性固定资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("0")?"block":"none"):"none" %>" id="jygdzcListDiv"><table id="jygdzcList"></table></div>
			<!--	待处置资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("5")?"block":"none"):"none" %>" id="dczzcListDiv"><table id="dczzcList"></table></div>
			<!--	受托资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("6")?"block":"none"):"none" %>" id="stzcListDiv"><table id="stzcList"></table></div>
			<!--	实体内资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("1")?"block":"none"):"none"%>" id="entity_asset"><table id="entity_asset_list"></table></div>
			<!--	委贷抵债物		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("2")?"block":"none"):"none" %>" id="loan_pledge_asset"><table id="loan_pledge_asset_list"></table></div>
			<!--	自用资产			-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("3")?"block":"none"):"none" %>" id="zyzc_asset"><table id="zyzc_asset_list"></table></div>
			<!--	债券		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("7")?"block":"none"):"none" %>" id="zqListDiv"><table id="zqList"></table></div>
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
<script type="text/javascript" language="javascript">
//--------------------------------------------------经营性固定资产------------------------------------------------------
		jQuery("#jygdzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"0"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}
			],
			height:'auto',
			rowNum:0,
			autowidth:true,
			onSelectRow: function(id){
				jQuery('#jygdzcList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#jygdzcList').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '经营性固定资产',
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#jygdzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#jygdzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------待处置资产------------------------------------------------------
		jQuery("#dczzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"5"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}								
			],
			height:'auto',
			onSelectRow: function(id){
				jQuery('#dczzcList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#dczzcList').jqGrid('saveRow',id);
				});
			},
			autowidth:true,
			rowNum:0,
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '待处置资产',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#dczzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#dczzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------受托资产------------------------------------------------------
		jQuery("#stzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"6"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}								
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			onSelectRow: function(id){
				jQuery('#stzcList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#stzcList').jqGrid('saveRow',id);
				});
			},
			multiselect: true,
			caption: '受托资产',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
//--------------------------------------------------实体内资产------------------------------------------------------
		jQuery("#entity_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"1"
			},
			colNames:['id','zcId','实体Id','实体类型','实体名称','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'bfsxxid',index:'bfsxxid',hidden:true},//实体附属信息id
				{name:'bstid',index:'bstid',hidden:true},
				{name:'stlx',index:'stlx',hidden:true},
				{name:'bstmc',index:'bstmc',sortable:false},
				{name:'bzcbh',index:'bzcbh',sortable:false},
				{name:'bzcmc',index:'bzcmc',sortable:false},
				{name:'entityAssetType',index:'entityAssetType',sortable:false},
				{name:'bsjzyr',index:'bsjzyr',sortable:false},
				{name:'bpgz',index:'bpgz',sortable:false},
				{name:'bcfwz',index:'bcfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			onSelectRow: function(id){
				jQuery('#entity_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#entity_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '实体内资产',
			toolbar: [false,"top"],
			ondblClickRow:function(rowid){
				lookdblclickAss(rowid);
			},
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#entity_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#entity_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
		jQuery("#loan_pledge_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"2"
			},
			colNames:['id','贷款账号','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'cdkzh',index:'cdkzh',hidden:true},
				{name:'czcbh',index:'czcbh',sortable:false},
				{name:'czcmc',index:'czcmc',sortable:false},
				{name:'czclx',index:'czclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			onSelectRow: function(id){
				jQuery('#loan_pledge_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#loan_pledge_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			caption: '委贷抵债物',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#loan_pledge_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#loan_pledge_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------自用资产------------------------------------------------------
		jQuery("#zyzc_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"4"
			},
			colNames:['id','zcid','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zyzcid',index:'zyzcid',hidden:true},
				{name:'zyzcbh',index:'zyzcbh',sortable:false},
				{name:'zyzcmc',index:'zyzcmc',sortable:false},
				{name:'zyzclx',index:'zyzclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}							
			],
			height:'auto',
			autowidth:true,
			multiselect: true,
			caption: '自用资产',
			onSelectRow: function(id){
				jQuery('#zyzc_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#zyzc_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			rowNum:0,
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#zyzc_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#zyzc_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------债券------------------------------------------------------		
	jQuery("#zqList").jqGrid({
		url:"<%=basePath%>zccz/assetDealBody_vidwBody.do",
		postData:{
			cldId:"<%=disposeHead.getId() %>",
			cscldid:"<%=disposeHead.getCscldid() %>",
			assetType:"7"
		},
		datatype: "json",
		multiselect:true,
		colNames:['id','债券id','项目名称','债券种类','债券名称','行名','到期日','处置方式','是否处置完毕'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'fzqId',index:'fzqId',hidden:true},
			{name:'fzqxmmc',index:'fzqxmmc',sortable:false},
			{name:'zqzlmc',index:'zqzlmc',sortable:false},
			{name:'zqmc',index:'zqmc',sortable:false},
			{name:'jhfhmc',index:'jhfhmc',sortable:false},
			{name:'dqr',index:'DQR',sortable:false},
			{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
					value:"${czfsJson}"
				},sortable:false
			},
			{name:'sfczwb',index:'sfczwb',sortable:false}
		],
		rownumbers:true,
		autowidth:true,
		onSelectRow: function(id){
			jQuery('#zqList').jqGrid('editRow',id,true);
			$("#" + id + "_CCzfs").change(function(){
				jQuery('#zqList').jqGrid('saveRow',id);
			});
		},
		editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
		rowNum:0,
		height:'auto',
		caption:'债券',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#zqList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#zqList").setGridHeight(0);
			}		
		},			
		shrinkToFit:false	
	});
</script>
