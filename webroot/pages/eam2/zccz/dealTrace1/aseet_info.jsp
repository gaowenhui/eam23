<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String zclb = (String)request.getAttribute("zclb");
	String cldId = (String)request.getAttribute("cldId");
	String itemId = (String)request.getAttribute("itemId");
%>
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>处置资产信息</title>
		<script type="text/javascript">
			$(function(){
				var buttonsString = '[\
						{"buttonHandler":"dealTrace","buttonIcon":"icon-redo","buttonText":"处置跟踪"}\
					]';		
				<%if("0".equals(zclb)){%>		
					addButtons(jQuery("#gview_asset_list > .ui-jqgrid-titlebar"),buttonsString);
				<%
				}else if("1".equals(zclb)){%>
					addButtons(jQuery("#gview_entity_asset_list > .ui-jqgrid-titlebar"),buttonsString);
				<%
				}else if("2".equals(zclb)){%>
					addButtons(jQuery("#gview_loan_pledge_asset_list > .ui-jqgrid-titlebar"),buttonsString);
				<%
				}
				%>
			});
			function dealTrace(){
				var selectedAsset = jQuery("#asset_list").jqGrid('getGridParam','selarrrow');
				if(selectedAsset.length > 1){
					alert("请选择一项资产进行跟踪!");
				}else{
					window.open("<%=basePath %>wnb/wnbList_init.do?zcId=" + selectedAsset + "&xmId=<%=itemId%>"); 
				}
			}
			
			function loadGrid(){
				var zclb = "<%=zclb %>";
				if(zclb == "0"){
					document.getElementById("fixed_asset").style.display  = "block";
					document.getElementById("entity_asset").style.display  = "none";
					document.getElementById("loan_pledge_asset").style.display  = "none";					
				}
				if(zclb == "1"){
					document.getElementById("fixed_asset").style.display  = "none";
					document.getElementById("entity_asset").style.display  = "block";
					document.getElementById("loan_pledge_asset").style.display  = "none";
				}
				if(zclb == "2"){
					document.getElementById("fixed_asset").style.display  = "none";
					document.getElementById("entity_asset").style.display  = "none";
					document.getElementById("loan_pledge_asset").style.display  = "block";				
				}
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="loadGrid()">
			<div style="display:block" id="fixed_asset">
				<table id="asset_list"></table>
			</div>
			<div style="display:none" id="entity_asset">
				<table id="entity_asset_list"></table>
			</div>
			<div style="display:none" id="loan_pledge_asset">
				<table id="loan_pledge_asset_list"></table>
			</div>			
	</body>
</html>
<script type="text/javascript" language="javascript">
//--------------------------------------------------经营性固定资产------------------------------------------------------
		jQuery("#asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=cldId %>",
				assetType:"0"
			},
			colNames:['id','经营固产ID','资产名称','主卡片编号','主卡片名称', '账面原值（万元）', '账面净值（万元）','评估价值（万元)','上会次数'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc'},
				{name:'azkpbh',index:'azkpbh'},
				{name:'azkpmc',index:'azkpmc'},
				{name:'zmyz',index:'zmyz',formatter:'number'},
				{name:'azmjz',index:'azmjz'},
				{name:'apgjz',index:'apgjz'},
				{name:'dqshcs',index:'dqshcs'}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '处置资产信息列表',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "1"
			}
		});
//--------------------------------------------------实体内资产------------------------------------------------------
		jQuery("#entity_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=cldId %>",
				assetType:"1"
			},
			colNames:['id','实体Id','实体名称','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'bstid',index:'bstid',hidden:true},
				{name:'bstmc',index:'bstmc'},
				{name:'bzcbh',index:'bzcbh'},
				{name:'bzcmc',index:'bzcmc'},
				{name:'entityAssetType',index:'entityAssetType'},
				{name:'bsjzyr',index:'bsjzyr'},
				{name:'bpgz',index:'bpgz'},
				{name:'bcfwz',index:'bcfwz'},
				{name:'dqshcs',index:'dqshcs'}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '处置资产信息列表',
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
			}
		});
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
		jQuery("#loan_pledge_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=cldId %>",
				assetType:"2"
			},
			colNames:['id','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'czcbh',index:'czcbh'},
				{name:'czcmc',index:'czcmc'},
				{name:'czclx',index:'czclx'},
				{name:'csjzyr',index:'csjzyr'},
				{name:'loanPledgePgjz',index:'loanPledgePgjz'},
				{name:'ccfwz',index:'ccfwz'},
				{name:'dqshcs',index:'dqshcs'}							
			],
			height:'auto',
			rowNum:0,
			autowidth:true,
			multiselect: true,
			caption: '处置资产信息列表',
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
			}
		});
</script>
