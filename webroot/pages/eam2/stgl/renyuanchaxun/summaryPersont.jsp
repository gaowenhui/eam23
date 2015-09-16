<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>人员信息查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	function stage(){
	   var index=document.getElementById("fcRylb").selectedIndex;
	   if(index==0){
		   document.getElementById("tr1").style.display="none";
		   document.getElementById("tr2").style.display="none";
		   document.getElementById("tr3").style.display="block";
		   document.getElementById("allPerlistDiv").style.display="block";
		   document.getElementById("knownPerlistDiv").style.display="none";
		   document.getElementById("settledPerlistDiv").style.display="none";
		   document.getElementById("tr_allNum").style.display="block";
		   document.getElementById("tr_knownNum").style.display="none";
		   document.getElementById("tr_settledNum").style.display="none";
	   
	   }else if(index==1){
		   document.getElementById("tr1").style.display="block";
		   document.getElementById("tr2").style.display="none";
		   document.getElementById("tr3").style.display="none";
		   document.getElementById("allPerlistDiv").style.display="none";
		   document.getElementById("knownPerlistDiv").style.display="block";
		   document.getElementById("settledPerlistDiv").style.display="none";
		   document.getElementById("tr_allNum").style.display="none";
		   document.getElementById("tr_knownNum").style.display="block";
		   document.getElementById("tr_settledNum").style.display="none";
	   }else  if(index==2){
		   document.getElementById("tr1").style.display="none";
		   document.getElementById("tr2").style.display="none";
		   document.getElementById("tr3").style.display="block";
		   document.getElementById("allPerlistDiv").style.display="none";
		   document.getElementById("knownPerlistDiv").style.display="none";
		   document.getElementById("settledPerlistDiv").style.display="block";
		   document.getElementById("tr_allNum").style.display="none";
		   document.getElementById("tr_knownNum").style.display="none";
		   document.getElementById("tr_settledNum").style.display="block";
	   }
	}
	//页面刚加载时，设置表格的宽度
	$(function(){
	    if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		jQuery("#allPerlist").setGridWidth($("#tableWidth").width());
		jQuery("#knownPerlist").setGridWidth($("#tableWidth").width());
		jQuery("#settledPerlist").setGridWidth($("#tableWidth").width());
	 
		$(window).bind('resize', function(){
			jQuery("#allPerlist").setGridWidth($("#tableWidth").width());
			jQuery("#knownPerlist").setGridWidth($("#tableWidth").width());
			jQuery("#settledPerlist").setGridWidth($("#tableWidth").width());
		});
		
	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
	var buttonallPerlistJSonString = '[{"buttonHandler":"queryAllRenyuan","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportAllRenyuan","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_allPerlist > .ui-jqgrid-titlebar"),buttonallPerlistJSonString);
	
	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
	var buttonknownPerlistJSonString = '[{"buttonHandler":"queryknownPerlist","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportknownPerlist","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_knownPerlist > .ui-jqgrid-titlebar"),buttonknownPerlistJSonString);
	
	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
	var buttonsettledPerlistJSonString = '[{"buttonHandler":"querysettledPerlist","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportsettledPerlist","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_settledPerlist > .ui-jqgrid-titlebar"),buttonsettledPerlistJSonString);
	
	});
	
	function queryAllRenyuan(){
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fgzffdw = document.getElementById("fgzffdw").value;
		var fazfs = document.getElementById("fazfs").value;
		var fazzt = document.getElementById("fazzt").value;	
			jQuery("#allPerlist").setGridParam({
				postData:{
					'staffQueryVO.stmc':stmc,
					'staffQueryVO.fcRylb':fcRylb,
					'staffQueryVO.fxingming':fxingming,
					'staffQueryVO.fgzffdw':fgzffdw,
					'staffQueryVO.fazfs':fazfs,
					'staffQueryVO.fazzt':fazzt
				},
				url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do"
			}).trigger("reloadGrid") ;
	}
	
	// 查询所有人员excel导出 addby chenyuxiao 
	function exportAllRenyuan(){
		//var urlStr = '<%=basePath %>stgl/renyuanchaxun_viewStaff.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMStaffQueryAction&com.tansun.eam2.stgl.vo.StaffQueryVO';
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fgzffdw = document.getElementById("fgzffdw").value;
		var fazfs = document.getElementById("fazfs").value;
		var fazzt = document.getElementById("fazzt").value;	
			var params = "{\"staffQueryVO.stmc\":\"" + stmc + "\",";
				params += "\"staffQueryVO.fcRylb\":\"" + fcRylb + "\",";
				params += "\"staffQueryVO.fxingming\":\"" + fxingming + "\",";
				params += "\"staffQueryVO.fgzffdw\":\"" + fgzffdw + "\",";
				params += "\"staffQueryVO.fazzt\":\"" + fazzt + "\",";
				params += "\"staffQueryVO.fazfs\":\"" + fazfs + "\"}";
			exportExcel("allPerlist", urlStr, params, '所有人员信息','rn,cb');
	}
	
	
	function queryknownPerlist(){
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fgzffdw = document.getElementById("fgzffdw").value;
			jQuery("#knownPerlist").setGridParam({
				postData:{
					'staffQueryVO.stmc':stmc,
					'staffQueryVO.fcRylb':fcRylb,
					'staffQueryVO.fxingming':fxingming,
					'staffQueryVO.fgzffdw':fgzffdw
				},
				url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do"
			}).trigger("reloadGrid") ;
	}
	
	// 知情人员excel导出
	function exportknownPerlist(){
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMStaffQueryAction&com.tansun.eam2.stgl.vo.StaffQueryVO';
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fgzffdw = document.getElementById("fgzffdw").value;
			var params = "{\"staffQueryVO.stmc\":\"" + stmc + "\",";
				params += "\"staffQueryVO.fcRylb\":\"" + fcRylb + "\",";
				params += "\"staffQueryVO.fxingming\":\"" + fxingming + "\",";
				params += "\"staffQueryVO.fgzffdw\":\"" + fgzffdw + "\"}";
			exportExcel("knownPerlist", urlStr, params, '知情人员信息','rn,cb');
	}
	
	
	function querysettledPerlist(){
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fazfs = document.getElementById("fazfs").value;
		var fazzt = document.getElementById("fazzt").value;
			jQuery("#settledPerlist").setGridParam({
				postData:{
					'staffQueryVO.stmc':stmc,
					'staffQueryVO.fcRylb':fcRylb,
					'staffQueryVO.fxingming':fxingming,
					'staffQueryVO.fazfs':fazfs,
					'staffQueryVO.fazzt':fazzt
				},
				url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do"
			}).trigger("reloadGrid") ;
	}
	
	// 安置人员类型
	function exportsettledPerlist(){
		//var urlStr = '<%=basePath %>stgl/renyuanchaxun_viewStaff.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMStaffQueryAction&com.tansun.eam2.stgl.vo.StaffQueryVO';
		var stmc = document.getElementById("stmc").value;
		var fcRylb = document.getElementById("fcRylb").value;
		var fxingming = document.getElementById("fxingming").value;
		var fazfs = document.getElementById("fazfs").value;
		var fazzt = document.getElementById("fazzt").value;
			var params = "{\"staffQueryVO.stmc\":\"" + stmc + "\",";
				params += "\"staffQueryVO.fcRylb\":\"" + fcRylb + "\",";
				params += "\"staffQueryVO.fxingming\":\"" + fxingming + "\",";
				params += "\"staffQueryVO.fazzt\":\"" + fazzt + "\",";
				params += "\"staffQueryVO.fazfs\":\"" + fazfs + "\"}";
			exportExcel("settledPerlist", urlStr, params, '安置人员信息','rn,cb');
	}
	
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="25" align="center" valign="bottom" class="td06">
	    <table width="100%" border="0" cellspacing="3" cellpadding="0">
	      <tr>
	        <td width="14"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></td>
	        <td width="698" valign="middle" class="title">人员信息查询</td>
			<td width="585" align="right" valign="bottom" class="title">&nbsp;</td>
	      </tr>
	    </table>
	    </td>
	  </tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td  width="11%" class="td_form01">实体名称： </td>
	    <td width="23%"  class="td_form02"><s:textfield name="staffQueryVO.stmc" id="stmc" label=""/></td>
	    <td  width="11%" class="td_form01">人员类型：</td>
	    <td  width="23%" class="td_form02">
	    <e:select parRefKey="NOT_CONSULT_ENTITY_PERSON_TYPE" list="#{}" headerKey=" " headerValue=" " onchange="stage()"   name="staffQueryVO.fcRylb" id="fcRylb" />
	    </td>
	    <td width="11%" class="td_form01">姓名：</td>
	    <td class="td_form02"><s:textfield name="staffQueryVO.fxingming" id="fxingming" label=""  /> </td>
	  </tr>
	  
	  <tr id="tr1" style="display:none">
	      <td class="td_form01">工作单位：</td>
	      <td class="td_form02"><s:textfield name="staffQueryVO.fgzffdw" id="fgzffdw" label=""/> </td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	  </tr>
	  <tr>
	  <tr id="tr2" style="display:none">
	      <td class="td_form01">安置方式：</td>
	      <td class="td_form02"><s:textfield name="staffQueryVO.fazfy" id="fazfy" label=""/></td>
	    <td class="td_form01">安置状态：</td>
	    <td class="td_form02"> 
	      <s:select theme="simple" headerKey="" headerValue=""  list="{'已安置','未安置'}"  name="staffQueryVO.fazzt"  id="fazzt"/> 
	       </td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	  </tr>	
	  <tr id="tr3" style="display:block">
	    <td class="td_form01">安置方式：</td>
	    <td class="td_form02"><s:textfield name="staffQueryVO.fazfs" id="fazfs" label=""/></td>
	    <td class="td_form01">安置状态：</td>
	    <td class="td_form02"><s:select  headerKey="" headerValue=""  list="{'已安置','未安置'}"  name="staffQueryVO.fazzt"  id="fazzt"/> </td>
	      <td class="td_form01">工作单位：</td>
	      <td class="td_form02"><s:textfield name="staffQueryVO.fgzffdw" id="fgzffdw" label=""/> </td>
	  </tr>
	</table>
	
	<div id="tableWidth" width="100%"/ >
	
	<div id="allPerlistDiv" style="display:block;">
		<table id="allPerlist" ></table>
		<div id="toolbarAllPerlist" ></div>
	</div>
	<script type="text/javascript">
		jQuery("#allPerlist").jqGrid({					
			//url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['资产Id','实体名称','人员类型','姓名', '移动电话','固定电话','工作单位','安置方式','安置状态','安置费用'],
		   	colModel:[
				{name:'stId',index:'id',editable:false,hidden:true},
				{name:'stmc' },
				{name:'fcRylb'},
				{name:'fxingming'},
				{name:'fyddh'},
				{name:'fgddh'},
				{name:'fgzffdw'},
				{name:'fazfs'},
				{name:'fazzt'},
				{name:'fazfy'}
		   	],
			multiselect:true,
			gridComplete:function(){
				$("#allNum").val($('#allPerlist').jqGrid('getGridParam','records'));
			},
			pager:'toolbarAllPerlist',
			shrinkToFit:false,
			multiselect:true,
			autowidth:true,
			rownumbers:true,
			height:'auto',
			viewrecords:true,
			caption:'人员查询',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		  	rowList:[10,20,30],
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});
	</script>
	
	<div id="knownPerlistDiv" style="display:none;">
		<table id="knownPerlist"></table>
		<div id="toolbarknownPerlist"></div>
	</div>
	<script type="text/javascript">
		jQuery("#knownPerlist").jqGrid({				
			//url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['资产Id','实体名称','人员类型','姓名', '移动电话','固定电话','工作单位'],
		   	colModel:[
				{name:'stId',index:'id',editable:false,hidden:true},
				{name:'stmc' },
				{name:'fcRylb'},
				{name:'fxingming'},
				{name:'fyddh'},
				{name:'fgddh'},
				{name:'fgzffdw'}
		   	],
			multiselect:true,
			gridComplete:function(){
				$("#knownNum").val($('#knownPerlist').jqGrid('getGridParam','records'));
			},
			pager:'toolbarknownPerlist',
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption:'知情人员信息',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		  	rowList:[10,20,30],
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});
	</script>
	
	<div  id="settledPerlistDiv" style="display:none;">
		<table id="settledPerlist" ></table>
		<div id="toolbarSettledPerlist"></div>
	</div>
	<script type="text/javascript">
		jQuery("#settledPerlist").jqGrid({				
			//url:"<%=basePath %>stgl/renyuanchaxun_viewStaff.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['资产Id','实体名称','人员类型','姓名', '移动电话','固定电话','安置方式','安置状态','安置费用'],
		   	colModel:[
				{name:'stId',index:'id',editable:false,hidden:true},
				{name:'stmc' },
				{name:'fcRylb'},
				{name:'fxingming'},
				{name:'fyddh'},
				{name:'fgddh'},
				{name:'fazfs'},
				{name:'fazzt'},
				{name:'fazfy'}
		   	],
			multiselect:true,
			gridComplete:function(){
				$("#settledNum").val($('#settledPerlist').jqGrid('getGridParam','records'));
			},
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			viewrecords:true,
			caption:'安置人员信息查询',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		  	rowList:[10,20,30],
			toolbar:[false,"top"],
					jsonReader:{
					root:"rows",
					page:"page",
					total:"total",
					records:"records",
					repeatitems:false,
					id:"0"
			}
			});
	</script>
		
	<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
         <tr id="tr_allNum" style="display:block">
           <td  class="td_zxy01">人数：</td>
           <td    class="td_form02"><input name="allNum" id="allNum" readonly="readonly" value="0" /></td>
        </tr>
        <tr id="tr_knownNum"  style="display:none">
           <td  class="td_zxy01">知情人员人数：</td>
           <td    class="td_form02" class="td_form02"><input name="knownNum" id="knownNum" readonly="readonly" value="0" /></td>
        </tr>
        <tr id="tr_settledNum"  style="display:none">
           <td  class="td_zxy01">安置人员人数：</td>
           <td   class="td_form02"  class="td_form02"><input name="settledNum" id="settledNum" readonly="readonly" value="0" /></td>
        </tr>
    </table>
    <%@ include file="/inc/exportExcel.inc"%>
</body>
</html>