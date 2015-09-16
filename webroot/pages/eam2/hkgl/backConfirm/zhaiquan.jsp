<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String confirmHeadId = (String)request.getAttribute("confirmHeadId");
	String qrrbh = (String)request.getAttribute("qrrbh"); 
	String dzje = String.valueOf(request.getAttribute("dzje"));
	boolean isQuery = false;
	isQuery = "true".equals((String)request.getAttribute("isQuery"))?true:false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>债券信息</title>
<script type="text/javascript">
	//----------------------------------------设置宽度--------------------------------------------
	$("#all_Attachment").setGridWidth($("#commonWidth").width());
	$("#zq_list").setGridWidth($("#commonWidth").width());
	$(window).bind('resize',function(){
		$("#all_Attachment").setGridWidth($("#commonWidth").width());
		$("#zq_list").setGridWidth($("#commonWidth").width());
	});
	
	//----------------------------------------添加按钮--------------------------------------------
	$(document).ready(function(){	
		<%if(!isQuery){%>
		var buttonJSonString = '[{"buttonHandler":"confirmThis","buttonIcon":"icon-save","buttonText":"确认"},\
								 {"buttonHandler":"editRelate","buttonIcon":"icon-edit","buttonText":"修改"},\
								 {"id":"save","buttonHandler":"saveMessage","buttonIcon":"icon-ok","buttonText":"保存"},\
								 {"buttonHandler":"cancelMessage","buttonIcon":"icon-no","buttonText":"取消"},\
								 {"buttonHandler":"deleteRelate","buttonIcon":"icon-remove","buttonText":"删除"}\
								]';
		addButtons(jQuery("#gview_zq_list > .ui-jqgrid-titlebar"),buttonJSonString);
		var buttonJSonString1 = '[{"buttonHandler":"saveThis","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_all_Attachment > .ui-jqgrid-titlebar"),buttonJSonString1);
		<%}%>
	});
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!----------------------------------------查询条件-------------------------------------------->
<table width="100%" id="commonWidth" class="newtable" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01">行名：</td>
		<td class="td_zxy02"><s:textfield name="stVO.bankName" id="bankName" /></td>
		<td class="td_zxy01">债券名称：</td>
		<td class="td_zxy02"><s:textfield name="stVO.stockName" id="stockName" /></td>	
	</tr>
	<tr>
		<td class="td_zxy01" >债券种类：</td>
		<td class="td_zxy02"><s:textfield name="stVO.stockSort" id="stockSort" /></td>
		<td class="td_zxy01">项目名称：</td>
		<td class="td_zxy02"><s:textfield name="stVO.xmmc" id="xmmc" /></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6" ><input type="button"  value="查询" onclick="query();"/></td>
  	</tr>
</table>
<!----------------------------------------债券信息-------------------------------------------->
<table id="all_Attachment"></table>
<div id="pgtoolbar1"></div>
<!----------------------------------------表体信息-------------------------------------------->
<table id="zq_list"></table>

<script type="text/javascript">
	var confirmHeadId = '<%=confirmHeadId%>';
	var qrrbh = '<%=qrrbh%>';
	jQuery("#all_Attachment").jqGrid({
		postData:{'stVO.sign':1,'id':'null'},
		datatype: "json",
		colNames:['id','xmId','项目名称','债券种类','债券名称','行名','最新债券面值','到期日'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'stockid',index:'stockid',hidden:true},
			{name:'xmmc',index:'xmmc'},
			{name:'zqzlmc',index:'zqzlmc',width:'70%'},
			{name:'zqmc',index:'zqmc'},
			{name:'jhfhmc',index:'jhfhmc',width:'70%'},
			{name:'zqmz',index:'zqmz',align:'right',formatter:'number',width:'70%'},
			{name:'dqr',index:'DQR',width:'50%'}
		],
		rownumbers:true,
		multiselect:true,
		pager:'pgtoolbar1',
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		rowList:[10,20,30],
		caption:'债券明细信息',
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
	
	function query(){
		var bankName = document.getElementById("bankName").value;
		var stockName = document.getElementById("stockName").value ;
		var stockSort = document.getElementById("stockSort").value ;
		var xmmc = document.getElementById("xmmc").value ;
		jQuery("#all_Attachment").setGridParam({postData:{
				'stVO.bankName':'' + bankName,
				'stVO.stockName':'' + stockName,
				'stVO.stockSort':'' + stockSort,
				'stVO.xmmc':'' + xmmc
			},
			url:"<%=basePath%>stock/maintain_viewListStockMaintain.do"
		}).trigger("reloadGrid");
	}
	
	jQuery("#zq_list").jqGrid({
		url:'<%=basePath%>hkgl/backConfirm_findConfirmBodyByConfirmHeadId.do?confirmHeadId='+confirmHeadId+'&type=3'+'&qrrbh='+qrrbh,
		datatype: "json",
		mtype:"POST",
		multiselect:true,
		colNames:['id','债券id','债券名称','债券本金回收金额','对应的原值金额','是否有后续收入','是否有后续费用','是否回收完毕','债券利息收入金额','利息所属期间','是否已确认'],
		colModel :[
		    {name:'id', index:'id',align:'center',hidden:true}, 
			{name:'zqId', index:'zqId',align:'center'},
			{name:'zqMc', index:'zqMc',align:'center'}, 
			{name:'zqHszjxz', index:'zqHszjxz',align:'center',editable:true}, 
			{name:'zqDyyz', index:'zqDyyz',align:'center',editable:true},
			{name:'zqHxsr', index:'zqHxsr',align:'center',editable:true,formatter:"select",editable: true,
				edittype:"select",editoptions:{value:"1:是;2:否"},sortable:false}, 
			{name:'zqHxfy', index:'zqHxfy',align:'center',editable:true,formatter:"select",editable: true,
				edittype:"select",editoptions:{value:"1:是;2:否"},sortable:false},
			{name:'zqHswb', index:'zqHswb',align:'center',editable:true,formatter:"select",editable: true,
				edittype:"select",editoptions:{value:"1:是;2:否"},sortable:false},
			{name:'zaLxhsje', index:'zaLxhsje',align:'center',editable:true}, 
			{name:'zqLxqj', index:'zqLxqj',align:'center',editable:true},
			{name:'sfybc', index:'sfybc',align:'center'}
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '债券信息列表',
		toolbar: [true,"top"],
		loadComplete:function(data){
			if(data && data.rows.length>0){
					jQuery("#zq_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#zq_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 将查询结果显示到下面表体里面	
	function saveThis() {
		var gr = jQuery("#all_Attachment").jqGrid('getGridParam','selarrrow');
		if(gr.length==0 || gr==null){
			alert('请先选择信息记录');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_saveZQtoConfirmBody.do";
		$.post(url,{"ids":""+gr+"","confirmHeadId":""+confirmHeadId+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#zq_list").trigger("reloadGrid");
			}
		});
	};
	
	// 修改
	function editRelate(){
		ids = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		if(ids.length > 1)
			return false;
		$(ids).each(function(i,id){
			jQuery("#zq_list").jqGrid('editRow',id);
		});
	}
	
	// 取消
	function cancelMessage(){
		if(ids && ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			jQuery("#zq_list").jqGrid('restoreRow',id);
		});	
	}
	
	// 保存
	function saveMessage(){
		ids = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		if(ids.length > 1)
			return false;
		$(ids).each(function(i,id){
			jQuery("#zq_list").jqGrid('saveRow',id,function(returnObj){
				return true;
			},'<%=basePath %>hkgl/backConfirm_updataZQtoConfirmBody.do',{'1':'1'},function(){
				return true;
			});
		});	
	}
	
	// 删除
	function deleteRelate(){
		var gr = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
		var url = "<%=basePath%>hkgl/backConfirm_deleteConfirmBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#zq_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
	// 确认保存
	function confirmThis(){
		var gr = jQuery("#zq_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0||gr==null){
			alert('请先选择要确认的项');
			return false;
		}
		var dzje = '<%=dzje%>';
		var sr = '0';
		for(var i=0;i<gr.length;i++){
			var zqHszjxz = jQuery("#zq_list").getCell(gr[i],'zqHszjxz');
			if(zqHszjxz!=false){
				sr = parseFloat(sr) + parseFloat(zqHszjxz);
			}
		}
		if(parseFloat(sr)!=parseFloat(dzje)){
			alert('回收现金金额应与到账金额相等');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_confirmThisBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#zq_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
</script>
</body>
</html>
