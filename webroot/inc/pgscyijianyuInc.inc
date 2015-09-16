<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
if(isInCounterSign){
%>
<e:pc id="editScyj">
	<tr>
		<td class="td_zxy01" colspan="2" id="headButton" height="45"></td>
	</tr>
</e:pc>
	<tr>
		<td class="td_zxy01" norawp>最终意见：</td>
		<td class="td_zxy03">
<%
boolean isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="finalContent" rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
	}
}
for(int i=0;i<finalCommonOpinionVOList.size();i++){
	isDisplay = true;
	ETCommonOpinionVO vo = (ETCommonOpinionVO)finalCommonOpinionVOList.get(i);
	PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
	PTUserBO user = vo.getUserBO();
%>
			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
				<tr height="20">
							<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
						</tr>
						<tr height="20">
							<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr height="20">
					<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</table><br/><br/>
<%
}
if(!isDisplay){
%>
	<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01" norawp>过程意见：</td>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	isDisplay = true;
%>
			<textarea name="content"  rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
}
for(int i=0;i<gcOpinionVOList.size();i++){
	isDisplay = true;
	ETCommonOpinionVO vo = (ETCommonOpinionVO)gcOpinionVOList.get(i);
	PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
	PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
				<tr height="20">
  					<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr height="20">
  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr height="20">
					<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
  			</table><br/><br/>
<%
}
if(!isDisplay){
%>
	<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01" norawp>退回意见：</td>
		<td class="td_zxy03">
<%
isDisplay = false;
if(isDid==null||!(isDid.equals("yes"))){
	if(userType.equals("ZH")||userType.equals("BMLD")){
		isDisplay = true;
%>
			<textarea name="sendBackContent"  rows="4" style="background-color:#ffffff;width: 94%;" readonly="true" style= "BORDER-BOTTOM:   0px   solid;   BORDER-LEFT:   0px   solid;   BORDER-RIGHT:   0px   solid;   BORDER-TOP:   0px   solid; "></textarea>
<%
	}else{
		request.setAttribute("isDid","Y");//文件拖拽控制
	}
}else{
		request.setAttribute("isDid","Y");//文件拖拽控制
}
for(int i=0;i<snedBackCommonOpinionVOList.size();i++){
	isDisplay = true;
	ETCommonOpinionVO vo = (ETCommonOpinionVO)snedBackCommonOpinionVOList.get(i);
	PTCommonOpinionBO commonOpinionBO = vo.getCommonOpinion();
	PTUserBO user = vo.getUserBO();
%>
  			<table class='tabletitle' cellspacing=0 cellpadding=0 width="100%">
				<tr height="20">
  					<td align="left" norawp>&nbsp;&nbsp;<%=commonOpinionBO.getYjnr()%></td>
  				</tr>
  				<tr height="20">
  					<td align="right"><%=dept.getDeptName()%>&nbsp;&nbsp;<%=user.getUsername()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
  				<tr height="20">
					<td bgcolor="#E4F8F8" align="right"><%=sf.format(commonOpinionBO.getTjrq())%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
  			</table><br/><br/>
<%
}
if(!isDisplay){
%>
  			<br/><br/><br/><br/><br/><br/>
<%
}
%>
		</td>
	</tr>
<%
}
%>


<script type="text/javascript">	
	
	$(document).ready(function(){
		var buttonFileJSonString = '[{"buttonHandler":"addFileAss_huiqian","buttonIcon":"icon-add","buttonText":"增加"},\
												{"buttonHandler":"delFileAss_huiqian","buttonIcon":"icon-remove","buttonText":"删除"}]';
		addButtons(jQuery("#gview_file_huiqianlist > .ui-jqgrid-titlebar"),buttonFileJSonString);
	});
																																																																																			
	function clearPanelTool(){
		//iframe 页面调用 window.parent.clearPanelTool();
		//无此方法会报js错误
	}
    function openTreeByType(){//打开树，根据类型打开类型  
		var url = basePathJs + "chooseHqbm.do?option=pgsc&multi=false&deptType=0&ids=" + document.getElementById("blbmbh").value;
		var _g_privateDialogFeatures = 'height=600, width=400,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		alert(url);
		window.open(url,'',_g_privateDialogFeatures);
    }
   	function getCallBack4Tree(ids,value){
		document.getElementById("blbm").value = value;
		document.getElementById("blbmbh").value = ids;
  	}
  	
  	jQuery("#assetList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"0"
		},
		colNames:['id','zcid','资产名称','资产所在省份','主卡片编号','资产类别','账面价值','账面原值','基准日账面价值','评估值','增减值','增减幅度(%)','处置方式','评估方法','价值类型'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zcid',index:'zcid',hidden:true},
			{name:'zcmc',index:'zcmc'},	
			{name:'sfmc',index:'sfmc'},
			{name:'zkpbh',index:'zkpbh'},
			{name:'zclb',index:'zclb'},
			{name:'zczmjz',index:'zczmjz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 4, defaultValue: "0.0000"}},
			{name:'zcybyz',index:'zcybyz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 4, defaultValue: "0.0000"}},
			{name:'jzrzmjz',index:'jzrzmjz',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 4, defaultValue: "0.0000"}},
			{name:'pingguzhi',index:'pingguzhi',align:"right", formatter: 'number',formatoptions : {decimalPlaces: 4, defaultValue: "0.0000"}},
			{name:'zjz',index:'zjz',align:"right", formatter: 'number', formatoptions: {decimalPlaces: 4, defaultValue: "0.0000"}},
			{name:'zjfd',index:'zjfd',align:"right", formatter: 'number',formatoptions:{suffix: "%"}},
			{name:'CCzfs',index:'CCzfs'},
			{name:'pgff',index:'pgff'},
			{name:'CJzlx',index:'CJzlx'}
		],
		ondblClickRow:function(gr){
			var zcid = jQuery("#assetList").getCell(gr,'zcid');
			lookAsset(zcid);
		},
		forceFit : true,
		multiselect:true,
		rowNum:0,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		viewrecords:true,
		caption: '资产列表（单位：万元）',
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
				jQuery("#assetList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#assetList").setGridHeight(0);
			}		
		},			
	shrinkToFit:false	
	});
	jQuery("#assetList").jqGrid('navGrid','#pagers2',{edit:false,add:false,del:false}); 
//--------------------------------------------------实体内资产------------------------------------------------------
	jQuery("#entity_asset_list").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_viewBodyList.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"1"
		},
		colNames:['id','实体Id','实体名称','资产编号','资产名称','资产类型', '实际占有人','存放位置','评估价值(万元)','评估方法','评估基准日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'stid',index:'stid',hidden:true},
			{name:'stmc',index:'bstmc'},
			{name:'stzcbh',index:'bzcbh'},
			{name:'stzcmc',index:'bzcmc'},
			{name:'sttzclx',index:'bstzclx'},
			{name:'stsjzyr',index:'bsjzyr'},
			{name:'stcfwz',index:'bcfwz'},
			{name:'pingguzhi',index:'bpgz'},
			{name:'pgff',index:'dqshcs'},
			{name:'pgjzr',index:'pgjzr'}
		],
		height:'auto',
		autowidth:true,
		rowNum:0,
		multiselect: true,
		caption: '处置资产信息列表（单位：万元）',
		toolbar: [false,"top"],
		ondblClickRow:function(rowid){
			lookdblclickAss(rowid);
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
	
	function reloadGridwww(gr){
		$.post("<%=basePath%>zccz/dealEvalBody_saveBody.do",{
	 		 'id':''+gr
	 	},function(returnStr){
	 		jQuery("#entity_asset_list").setGridParam({
			}).trigger("reloadGrid");
			jQuery("#loan_pledge_asset_list").setGridParam({
			}).trigger("reloadGrid");
	 	});
	}
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
	jQuery("#loan_pledge_asset_list").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_viewBodyList.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"2"
		},
		colNames:['id','贷款账号','抵债物资产编号','抵债物资名称','抵债物资产类型', '抵债物资产实际占有人','存放位置','评估价值(万元)','评估方法','评估基准日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'dkzh',index:'dkzh',hidden:true},
			{name:'czcbh',index:'czcbh'},
			{name:'czcmc',index:'czcmc'},
			{name:'czclx',index:'czclx'},
			{name:'csjzyr',index:'csjzyr'},
			{name:'stcfwz',index:'stcfwz'},
			{name:'pingguzhi',index:'pingguzhi'},
			{name:'pgff',index:'pgff'},
			{name:'pgjzr',index:'pgjzr'}
		],
		height:'auto',
		autowidth:true,
		rowNum:0,
		multiselect: true,
		caption: '委贷抵债物信息列表（单位：万元）',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
//--------------------------------------------------股权（也就是实体）------------------------------------------------------		
	jQuery("#entityList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"3"
		},
		colNames:['id','实体id','实体种类','实体名称','地区','管理部门','委托管理机构','基准日账面净资产值','评估值','增减值','增减幅度'],
		colModel:[	
			{name:'id',index:'id',hidden:true},
			{name:'gqstid',index:'gqstid',hidden:true},
			{name:'gqstzl',index:'gqstzl',hidden:true},
			{name:'gqstmc',index:'gqstmc',sortable:false},
			{name:'gqstsf',index:'gqstsf',sortable:false},
			{name:'gqstglbm',index:'gqstglbm',sortable:false},
			{name:'gqstwtgljg',index:'gqstwtgljg',sortable:false},
			{name:'gqjzrjzcz',index:'gqjzrjzcz',formatter:"number",editable: true,sortable:false},
			{name:'pingguzhi',index:'pingguzhi',formatter:"currency",editable: true,sortable:false},
			{name:'zjz',index:'zjz',formatter:"number",sortable:false},
			{name:'zjfd',index:'zjfd',formatter:"number",
				 formatoptions:{decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaulValue: 0,suffix:"%"},sortable:false}
			],
		multiselect:true,
		rownumbers:true,
		rowNum:0,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption:'实体信息（单位：万元）',
		ondblClickRow:function(rowid){
			lookdblclickAss1(rowid);
		},
		onSelectRow: function(id){
			jQuery('#entityList').jqGrid('editRow',id,true);
			$("#" + id + "_pingguzhi, #" + id + "_gqjzrjzcz").change(function(){
				jQuery('#entityList').jqGrid('saveRow',id,function(){
					reloadMessage("3");
					return true;
				});
			});
		},
		editurl:'<%=basePath %>zccz/dealEvalBody_updateBodyGqjzrjzcz.do',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
//--------------------------------------------------债权（也就是实体对建投债务）------------------------------------------------------		
	jQuery("#debtList").jqGrid({
		url:"<%=basePath %>zccz/dealEvalBody_getBodyPageJson.do",
		datatype: "json",
		mtype:"POST",
		postData:{
			cldId:"${head.id }",
			assetType:"4"
		},
		colNames:['id','债权id','债权种类','债务人名称','购入债权余额','评估基准日账面债权值','评估值','增减值','增减幅度'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zqid',index:'zqid',hidden:true},
			{name:'zqzl',index:'zqzl'},
			{name:'zwrmc',index:'zwrmc'},
			{name:'grzye',index:'grzye',formatter:"number"},
			{name:'pgjzrzmzqz',index:'pgjzrzmzqz',editable: true,formatter:"currency"},
			{name:'pingguzhi',index:'pingguzhi',formatter:"currency",editable: true,sortable:false},
			{name:'zjz',index:'zjz',formatter:"currency",sortable:false},
			{name:'zjfd',index:'zjfd',formatter:"currency",
				 formatoptions:{decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaulValue: 0,suffix:"%"},sortable:false}
			],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		rowNum:0,
		height:'auto',
		viewrecords:true,
		caption:'债权信息（单位：万元）',
		ondblClickRow:function(rowid){
			//lookdblclickAss1(rowid);
		},
		onSelectRow: function(id){
			jQuery('#debtList').jqGrid('editRow',id,true);
			$("#" + id + "_pingguzhi, #" + id + "_pgjzrzmzqz").change(function(){
				jQuery('#debtList').jqGrid('saveRow',id,function(){
					reloadMessage("4");
					return true;
				});
			});
		},
		editurl:'<%=basePath %>zccz/dealEvalBody_updateBodyPgjzrzmzqz.do',
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