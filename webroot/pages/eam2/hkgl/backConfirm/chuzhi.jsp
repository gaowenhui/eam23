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
<title>处置项目信息</title>
<script type="text/javascript">
	$(document).ready(function(){
		<%if(!isQuery){%>
		//----------------------------------------查询按钮--------------------------------------------
		var buttonJSonString = '[{"buttonHandler":"saveThis","buttonIcon":"icon-ok","buttonText":"确定"}]';
		addButtons(jQuery("#gview_tongji_list > .ui-jqgrid-titlebar"),buttonJSonString);
		//----------------------------------------列表按钮--------------------------------------------
		var buttonJSonString = '[{"buttonHandler":"confirmThis","buttonIcon":"icon-save","buttonText":"确认"},\
								 {"buttonHandler":"editRelate","buttonIcon":"icon-edit","buttonText":"编辑"},\
								 {"id":"save","buttonHandler":"saveMessage","buttonIcon":"icon-ok","buttonText":"保存"},\
								 {"buttonHandler":"cancelMessage","buttonIcon":"icon-no","buttonText":"取消"},\
								 {"buttonHandler":"deleteRelate","buttonIcon":"icon-remove","buttonText":"删除"}\
								]';
		addButtons(jQuery("#gview_cz_list > .ui-jqgrid-titlebar"),buttonJSonString);
		<%}%>
		//----------------------------------------设置宽度--------------------------------------------
		$("#cz_list").setGridWidth($("#commonWidth").width());
		$("#tongji_list").setGridWidth($("#commonWidth").width());
		$(window).bind('resize',function(){
			$("#cz_list").setGridWidth($("#commonWidth").width());
			$("#tongji_list").setGridWidth($("#commonWidth").width());
		});
	});
	
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!----------------------------------------查询条件-------------------------------------------->
<table id="commonWidth" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02"><s:textfield id="nigaobumen" size="30" cssClass="input" /></td>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield id="nigaoren" size="30" cssClass="input" /></td>
	</tr> 
	<tr>
		<td class="td_zxy01">项目名称：</td>
		<td class="td_zxy02"><s:textfield id="xiangmumingcheng" cssClass="input" /></td>
		<td class="td_zxy01">项目状态：</td>
		<td class="td_zxy02">
		<s:select list="#{'':'','0':'处置方案未执行','1':'处置方案执行中','2':'已结案'}" id="xiangmuzhuangtai" cssClass="input"/>
		</td>
	</tr>	
	<tr>
		<td class="td_zxy01">处置类型：</td>
		<td class="td_zxy02"><s:select list="#{'0':'实体整体处置','1':'通用资产处置'}" onchange="getFS(this)" id="chuzhileibie" cssClass="input"/></td>
		<td class="td_zxy01">处置方式：</td>
		<td class="td_zxy02"><select id="chuzhifangshi" cssClass="input"><option></option></select></td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">
		</td>
	</tr> 
</table>
<!----------------------------------------统计列表-------------------------------------------->
<table id="tongji_list" width="100%"></table>
<div id="pgtoolbar1"></div>
<!----------------------------------------处置列表-------------------------------------------->
<table id="cz_list"></table>

<script type="text/javascript">
	var confirmHeadId = '<%=confirmHeadId%>';
	var qrrbh = '<%=qrrbh%>';
	jQuery("#tongji_list").jqGrid({
		datatype:"json",
		colNames:['id','编号','拟稿部门','拟稿人','项目名称','处置方式','资产类型','原值','净值','评估价值','建议处置收入','预计处置费用','预计损失','会议次数','审批结论','项目状态','实际回收','实际处置费用'],
		colModel:[
		    {name:'id',index:'id',align:"center",hidden:true},
			{name:'cldbianhao',index:'cldbianhao',align:"center"},
			{name:'cldngbm',index:'cldngbm',align:"center"},
			{name:'cldngr',index:'cldngr',align:"center"},
			{name:'czxmmc',index:'czxmmc',align:"center"},
			{name:'cldczfs',index:'cldczfs',align:"center"},
			{name:'czzclb',index:'czzclb',align:"center"},
			{name:'cldyz',index:'cldyz',formatter:'number',align:"center"},
			{name:'cldjz',index:'cldjz',formatter:'number',align:"center"},
			{name:'cldje',index:'cldje',formatter:'number',align:"center"},
			{name:'cldyjczsr',index:'cldyjczsr',formatter:'number',align:"center",width:185},
			{name:'cldyjczfy',index:'cldyjczfy',formatter:'number',align:"center",width:185},
			{name:'cldyjss',index:'cldyjss',formatter:'number',align:"center"},
			{name:'hycs',index:'hycs',align:"center"},
			{name:'spjl',index:'spjl',align:"center"},
			{name:'zhuangtai',index:'zhuangtai',align:"center"},
			{name:'sjhs',index:'sjhs',align:"center"},
			{name:'sjczfy',index:'sjczfy',align:"center",width:190}
		],
		pager:'pgtoolbar1',
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '处置项目信息列表',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10,20,30],
	  	toolbar: [false,"top"],
	  	loadComplete:function(data){
			if(data && data.rows.length>0){
					jQuery("#tongji_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#tongji_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		jsonReader:{
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});   
	
	// 查询
	function query(){
		var nigaobumen = document.getElementById("nigaobumen").value;
		var nigaoren = document.getElementById("nigaoren").value;
		var xiangmumingcheng = document.getElementById("xiangmumingcheng").value;
		var chuzhifangshi = document.getElementById("chuzhifangshi").value;
		var xiangmuzhuangtai = document.getElementById("xiangmuzhuangtai").value;
		var chuzhileibie = document.getElementById("chuzhileibie").value;
		jQuery("#tongji_list").setGridParam({postData:{
			'queryVO.nigaobumen' : nigaobumen,
			'queryVO.nigaoren' : nigaoren,
			'queryVO.xiangmumingcheng' : xiangmumingcheng,
			'queryVO.chuzhifangshi' : chuzhifangshi,
			'queryVO.xiangmuzhuangtai' : xiangmuzhuangtai,
			'queryVO.chuzhileibie' : chuzhileibie
		},
		url:"<%=basePath%>zccz/disposeItemStatic_query.do"
		}).trigger("reloadGrid");
	} 
	  
	// 得到处置方式
	function getFS(leibie){
		var url = "<%=request.getContextPath()%>/zccz/disposeItemStatic_findCZFS.do";
		$.post(url,{"leibie" : leibie.value},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			if(returnObj.yds.length>=1){
				$("#chuzhifangshi").html("<option>--请选择--</option>");
				for(var i=0; i<returnObj.yds.length; i++){
					$("#chuzhifangshi").append("<option value='" + returnObj.yds[i].ydid + "'>" + returnObj.yds[i].ydtext + "</option>");
				}
			}
		});
	}         

	// 将查询结果显示到下面表体里面	
	function saveThis() {
		var gr = jQuery("#tongji_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0 || gr==null){
			alert('请先选择信息记录');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_saveCZtoConfirmBody.do";
		$.post(url,{"ids":""+gr+"","confirmHeadId":""+confirmHeadId+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#cz_list").trigger("reloadGrid");
			}
		});
	};

	jQuery("#cz_list").jqGrid({
		url:'<%=basePath%>hkgl/backConfirm_findConfirmBodyByConfirmHeadId.do?confirmHeadId='+confirmHeadId+'&type=1'+'&qrrbh='+qrrbh,
		datatype: "json",
		mtype:"POST",
		multiselect:true,
		colNames:['id','处置项目id','处置项目编号','处置项目名称','是否处置完毕','处置收入','已扣除处置费用','处置税费是否已缴纳','是否已确认'],
		colModel :[
			{name:'id', index:'id',align:'center',hidden:true},
		    {name:'czXmid', index:'czXmid',align:'center',hidden:true}, 
			{name:'czXmbh', index:'czXmbh',align:'center'},
			{name:'czXmmc', index:'czXmmc',align:'center'}, 
			{name:'czSfwb', index:'czSfwb',align:'center',editable:true,formatter:"select",editable: true,
				edittype:"select",editoptions:{value:"1:是;2:否"},sortable:false}, 
			{name:'czCzsr', index:'czCzsr',align:'center',editable:true},
			{name:'czYkczfy', index:'czYkczfy',align:'center',editable:true}, 
			{name:'czSfjs', index:'czSfjs',align:'center',formatter:"select",editable: true,
				edittype:"select",editoptions:{value:"1:是;2:否"},sortable:false},
			{name:'sfybc', index:'sfybc',align:'center'}
	 	],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '处置项目信息列表',
		toolbar: [true,"top"],
		loadComplete:function(data){
			if(data && data.rows.length>0){
					jQuery("#cz_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#cz_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		jsonReader:{
			root:"rows",
			repeatitems: false,
			id: "0"
		}
	});
	
	// 修改
	function editRelate(){
		ids = jQuery("#cz_list").jqGrid('getGridParam','selarrrow');
		if(ids.length == 0)
			return false;
		if(ids.length > 1)
			return false;
		$(ids).each(function(i,id){
			jQuery("#cz_list").jqGrid('editRow',id);
		});
	}
	
	// 取消
	function cancelMessage(){
		if(ids && ids.length == 0)
			return false;
		$(ids).each(function(i,id){
			jQuery("#cz_list").jqGrid('restoreRow',id);
		});	
	}
	
	// 保存
	function saveMessage(){
		ids = jQuery("#cz_list").jqGrid('getGridParam','selarrrow');
		//var czCzsr = jQuery("#cz_list").getCell(ids,'czCzsr');
		//var czYkczfy = jQuery("#cz_list").getCell(ids,'czYkczfy');
		var czCzsr = $('#'+ids+'_czCzsr').val();
		var czYkczfy = $('#'+ids+'_czYkczfy').val();
		if(ids.length == 0 || ids.length > 1){
			return false;
		}else if(parseFloat(czCzsr) < parseFloat(czYkczfy)){
			alert('收入不能小于费用');
			return false;
		}else{
			$(ids).each(function(i,id){
				jQuery("#cz_list").jqGrid('saveRow',id,function(returnObj){
					return true;
				},'<%=basePath %>hkgl/backConfirm_updataCZtoConfirmBody.do',{'1':'1'},function(){
					return true;
				});
			});	
		}
	}
	
	// 删除
	function deleteRelate(){
		var gr = jQuery("#cz_list").jqGrid('getGridParam','selarrrow');
		var confirmHeadId = '<%=confirmHeadId%>';
		var url = "<%=basePath%>hkgl/backConfirm_deleteConfirmBody.do";
		$.post(url,{"ids":""+gr+"",confirmHeadId:""+confirmHeadId+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#cz_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
	// 确认保存
	function confirmThis(){
		var gr = jQuery("#cz_list").jqGrid('getGridParam','selarrrow');
		if(gr.length==0||gr==null){
			alert('请先选择要确认的项');
			return false;
		}
		var dzje = '<%=dzje%>';
		var sr = '0';
		var fy = '0';
		for(var i=0;i<gr.length;i++){
			var czCzsr = jQuery("#cz_list").getCell(gr[i],'czCzsr');
			var czYkczfy = jQuery("#cz_list").getCell(gr[i],'czYkczfy');
			if(czCzsr!=false){
				sr = parseFloat(sr) + parseFloat(czCzsr);
			}
			if(czYkczfy!=false){
				fy = parseFloat(fy) + parseFloat(czYkczfy);
			}
		}
		if((parseFloat(sr)-parseFloat(fy))!=parseFloat(dzje)){
			alert('金额与到账金额不等');
			return false;
		}
		var url = "<%=basePath%>hkgl/backConfirm_confirmThisBody.do";
		$.post(url,{"ids":""+gr+""},function(returnStr){
			if(returnStr!=""&&returnStr!=null){
				alert(returnStr);
				jQuery("#cz_list").trigger("reloadGrid");
				window.opener.reloadConfirm();
			}
		});
	}
	
</script>
</body>
</html>
